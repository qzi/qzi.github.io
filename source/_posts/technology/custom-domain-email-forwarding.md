---
title: Custom domain email forwarding
categories: technology
tags: blog
abbrlink: 10900
date: 2020-01-02 03:12:04
---


免费域名邮件转发有很多服务，但是有些服务需要提供的材料太多了，例如备案，还有提供手机之类，所以均不予采用，筛选剩余两个服务：

* ImprovMX
* Forwardemail.net

ImprovMX 设置简单，但是在测试使用 163 和 QQ 转发的时候，经常因为这些国内域名垃圾邮件评级不好收不到，而且客服认为它们不能控制垃圾邮件评分表无法改善，所以选择了 `https://forwardemail.net`

## Set up MX record on your domain name
Set up MX record on your DNS service provider, like Cloudfare   

| Name/Host/Alias  | TTL  | Record Type | Priority | Value/Answer/Destination |
| ---------------- | ---- | ----------- | -------- | ------------------------ |
| @ or leave blank | 3600 | MX          | 10       | mx1.forwardemail.net     |
| @ or leave blank | 3600 | MX          | 20       | mx2.forwardemail.net     |

## Set up TXT record to specify your personal email
If you are forwarding all emails from your domain, (all@niftylettuce.com, hello@niftylettuce.com, etc) to a specific address niftylettuce@gmail.com. In this case, you needn't define any custom email address of custom domain.

Make sure to replace the values below in the "Value/Answer/Destination" column with your own email address! Do not leave it as-is, otherwise I will get your forwarded emails!

| Name/Host/Alias  | TTL  | Record Type | Value/Answer/Destination             |
| ---------------- | ---- | ----------- | ------------------------------------ |
| @ or leave blank | 3600 | TXT         | forward-email=niftylettuce@gmail.com |


## Set up SPF verification
If you're using a service like Google Apps,Cloudflare or Amazon Route 53, then edit your existing TXT record and add the following as a new line:  

| Name/Host/Alias  | TTL  | Record Type | Value/Answer/Destination                                              |
| ---------------- | ---- | ----------- | --------------------------------------------------------------------- |
| @ or leave blank | 3600 | TXT         | v=spf1 a mx include:spf.forwardemail.net include:_spf.google.com -all |


现在可以测试域名邮件的转发了，这个设置其实发送到你域名邮箱的任何邮件都会转发到你的个人邮箱上


## Reference
_forwardemail_  
https://forwardemail.net/#/?id=how-do-i-get-started-and-set-up-email-forwarding
