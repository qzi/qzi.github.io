---
title: Learning How to Reverse Proxy Disqus API in Nginx
categories: technology
tags:
  - nginx
  - hexo
abbrlink: 17289
date: 2019-12-10 10:45:05
---

Hmmmm, To be continue ...

Disqus 对于静态站点着实好用，设计理念也能把言论处理的复杂度隔离开来 ...  
但是需要实现Disqus API的反向代理，于是乎开始了复习和整理 Nginx 反向代理的旅程

## URL && URI
在做Location过滤前首先得了解什么是 URL 和 URI

A Uniform Resource Locator (URL), colloquially termed a web address,[1] is a reference to a web resource that specifies its location on a computer network and a mechanism for retrieving it. A URL is a specific type of Uniform Resource Identifier (URI),[2][3] although many people use the two terms interchangeably.[4][a] URLs occur most commonly to reference web pages (http), but are also used for file transfer (ftp), email (mailto), database access (JDBC), and many other applications.

Most web browsers display the URL of a web page above the page in an address bar. A typical URL could have the form http://www.example.com/index.html, which indicates a protocol (http), a hostname (www.example.com), and a file name (index.html).

A Uniform Resource Locator (URL) is a URI that specifies the means of acting upon or obtaining the representation of a resource, i.e. specifying both its primary access mechanism and network location. For example, the URL http://example.org/wiki/Main_Page refers to a resource identified as /wiki/Main_Page, whose representation, in the form of HTML and related code, is obtainable via the Hypertext Transfer Protocol (http:) from a network host whose domain name is example.org.


You can refer to the origin
[https://en.wikipedia.org/wiki/URL](https://en.wikipedia.org/wiki/URL)
[https://en.wikipedia.org/wiki/Uniform_Resource_Identifier](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier)

## Nginx Location

Nginx 用 Location 的这个语法来匹配 URI   
Locaiton 的匹配是自上而下以匹配项最多的那条规则为准，只有后面的正则表达式没有匹配到时，这一条才会采用当前rule  


| Symbole | Sample                   | Remark                                                                                                            |
| ------- | ------------------------ | ----------------------------------------------------------------------------------------------------------------- |
| =       | Location = / {}          | 精准匹配，匹配 [https://leonvision.online/](https://leonvision.online/)                                           |
| ~       | Location ~ /finance/ {}  | 区分大小写的匹配规则，匹配Finance这个分类：[https://leonvision.online/finance](https://leonvision.online/finance) |
| ^~      | Location ^~ /finance/ {} | 匹配以finance开头的URL                                                                                            |
| ~*      | Locaiton ~* /finance/ {} | 不区分大小写的匹配规则 ｜                                                                                         |

```
localtion / {
    # 所有请求都匹配以下规则
    # 因为所有的地址都以 / 开头，所以这条规则将匹配到所有请求
}

location = / {
    # 精确匹配 / ，后面带任何字符串的地址都不符合
}

localtion /api {
    # 匹配任何 /api 开头的URL，包括 /api 后面任意的, 比如 /api/getList
    # 匹配符合以后，还要继续往下搜索
    # 只有后面的正则表达式没有匹配到时，这一条才会采用这一条
}

localtion ~ /api/abc {
    # 匹配任何 /api/abc 开头的URL，包括 /api/abc 后面任意的, 比如 /api/abc/getList
    # 匹配符合以后，还要继续往下搜索
    # 只有后面的正则表达式没有匹配到时，这一条才会采用这一条
}
```

## Nginx Cross-Origin Resource Sharing(代理跨域转发)

**Scenario**  

本地启动了一个前后端分离的WEB应用，端口为：3000，可以通过 http://127.0.0.1:3000 访问前端页面，页面中有些Ajax请求的地址为 http://127.0.0.1:3000/api/getList ，一般情况下肯定是404或者请求失败

这种后端服务的接口存放在于其他的服务器中，比如在公司内网可以通过 http://172.30.1.123:8081/api/getList 访问到测试环境中的服务接口。这种情况的请求就涉及到端口不一样的跨域了，那么我们可以利用Nginx代理请求。

**Nginx Configuration**  

Config it in {NGINX_ROOT}/nginx.conf   

```
server {
    listen  80;
    server_name 127.0.0.1;

    location / {
        proxy_pass  http://127.0.0.1:3000;
    }

    location ~ /api/ {
        proxy_pass  http://172.30.1.123:8081;
    }
}
```

Nginx is lisening in port 80，将 http://127.0.0.1 的所有请求服务转发到 127.0.0.1 端口为 3000；   
将 http://127.0.0.1/api/ 或者 http://127.0.0.1/api/getList 请求转发到 http://172.30.1.123:8081  


**Scenario for Disqus**

Assign your domain name(https://disqus.leonvision.online) to your host
and dset the header to destination service.

```bash

server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;

  server_name disqusproxy.leonvision.online;

  # ECDSA
  ssl_certificate /path/to/ssl/disqusproxy.leonvision.online_ecc/fullchain.cer;
  ssl_certificate_key /path/to/ssl/disqusproxy.leonvision.online_ecc/disqusproxy.leonvision.online.key;

  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';
  ssl_prefer_server_ciphers on;

  location  ~ / {
    proxy_pass https://disqus.com/api$request_uri;
    
    # proxy_set_header Host $Host;
    # proxy_set_header X-Real-IP $remote_addr;
    # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

    proxy_set_header Referer https://disqus.com;
    proxy_set_header Origin https://disqus.com;

    proxy_redirect off;

    add_header Access-Control-Allow-Origin *;
    add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
    add_header Access-Control-Allow-Headers 'DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-S
ince,Cache-Control,Content-Type,Authorization';

  }

}
```

| Symbole          | Remark           |
| ---------------- | ---------------- |
| proxy_set_header | 改变HTTP的请求头 |
| Host | destination Host name | 
| X-Real-IP | 请求的真实IP | 
| X-Forwarded-For | 请求是由谁发起的 |
| Referer | 发起请求方的URI |
| Origin | 发起请求方的domain |

**Reference **  
[Disqus API 反向代理](https://medium.com/cnhinata/disqus-api-%E5%8F%8D%E5%90%91%E4%BB%A3%E7%90%86-70d11d8e39af)


## Rewrite
**TBC**  

## Trace the log to debug in Nginx

**Customize the log format for proxy**  

```bash
http {
    ...
    log_format proxy_disqus_logging '[$time_local] $remote_addr - $remote_user - $server_name to: $upstream_addr : $request upstream_response_time $upstream_response_time msec $msec request_time $request_time'
' - http_referer: $http_referer - http_host $http_host '
'- https://disqus.com/api + request_uri: https://disqus.com/api$request_uri - body_bytes_sent: $body_bytes_sent';

   server {
       ...
       access_log /path/to/api_logging.log proxy_disqus_logging;
   }
}
```
We can google more variable in Nginx for diefferent Scenario.


**Tail the real time log to debug the configuration of Nginx**  

    tail -f /var/log/nginx/api_logging.log


## Http Response Code
| Code | Remark | 
| --- | --- | 
| 301 | 永久转发 |  
| 302 | 临时转发 |  
| 400 | 服务器不理解请求的语法 |  
| 404 | 服务器无法找到请求的页面 |  
| 500 | 服务器内部错误，无法处理请求 |  
| 200 | 服务器已成功处理了请求并返回了页面 |  

-------
虽然反向Disqus API代理成功，但是博主碰到github page的又一个限制Header不允许多个origin，还需要进一步调整成品，博主困了，未完待续 (To be continue)  




## Reference 

_通过 Nginx 代理转发配置实现跨域_  
https://www.thinktxt.com/nginx/2017/03/06/cross-domain-by-nginx-proxy-setting.html  
_nginx配置location总结及rewrite规则写法_  
https://segmentfault.com/a/1190000002797606  
_nginx配置文件中$request_uri到底是指的url里哪部分_  
https://blog.csdn.net/cn_yaojin/article/details/80334604  
_Nginx Resolver_  
https://www.nginx.com/resources/wiki/modules/domain_resolve/  
_Nginx Resolver without IPV6_  
https://ms2008.github.io/2018/01/09/nginx-resolver/  
Disqus API 反向代理  
https://medium.com/cnhinata/disqus-api-%E5%8F%8D%E5%90%91%E4%BB%A3%E7%90%86-70d11d8e39af   
_Nginx 变量定义_  
https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/log-format/
