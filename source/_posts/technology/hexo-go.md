---
title: Hexo with Github Page
tags: blog
categories: technology
date: 2019-12-04 07:37:08
---

# Hexo initial

$ hexo init # Initial the project  
$ npm install # download the independencies  
$ tree ./ -L 1 # 查看目录树而已  
$ hexo g # Generate the html  
$ hexo s # Start the server  

$ code _config.yml

    deploy:
        type: git
        repo:  # 这里的网址填你自己的仓库地址
        branch: master


# Custom domain name
add a new file "CNAME" under the folder /public/
add your domain name as the content

    $ echo "domain name" > ./public/CNAME

# Custom theme
$ git clone https://github.com/theme-next/hexo-theme-next.git themes/theme_next
change the content in the _config.yml

    theme: theme_next

$ hexo clean # clean public/

Link to the homepage : [https://theme-next.org](https://theme-next.org)


# Add Google Adsense
* Add a file source/_data/header.swig.
* past the <script>..</script> from google adsense on it
* uncomment the line in themes/theme_next/_config.yml
```
# Define custom file paths.
# Create your custom files in site directory `source/_data` and uncomment needed files below.
custom_file_path:
    #head: source/_data/head.swig
    header: source/_data/header.swig
    #sidebar: source/_data/sidebar.swig
```

more detail in [google-analytics-and-adsense-in-hexo](https://i.leonvision.online/technology/2019/12/16/google-analytics-and-adsense-in-hexo/)   

# Add comment system

## Disqus
Disqus can allow the anonymous, but it can not use in China.

[Add Comments Section to Your Hexo Blog](https://qiuyiwu.github.io/2019/01/25/Hexo-Comment/)

DisqusJS can help us to go through the whole world  
https://theme-next.org/docs/third-party-services/comments


## Facebook comment(failed)
Apply the facebook app id and note that the private plicy is a concern of your data

[developers.facebook](http://developers.facebook.com)

Set up the fb comment like the link below:
[set up the app id after registed account](https://www.webascender.com/blog/add-facebook-comments-website/)

[get code form the styled comments](https://developers.facebook.com/docs/plugins/comments/)

[Hexo Next 加入 FB 留言版](https://hsiangfeng.github.io/hexo/20190518/3303379172/)

[chinese privacy policy template](https://github.com/lyrasoft/chinese-privacy-policy-template)

[隱私權政策制定指南](https://developer.mozilla.org/zh-TW/docs/Archive/Mozilla/Marketplace/Publishing/Privacy_policies#Mozilla_Marketplace_.E7.9A.84.E9.9A.B1.E7.A7.81.E6.AC.8A.E8.A6.81.E6.B1.82)

[The Complete Guide for Facebook Developers: How to add a Privacy Policy to your Apps](http://wp4fb.com/how-to-add-a-privacy-policy-to-your-apps/#comment-15347)

[my privacy policy](http://x.xiniubaba.com/x.php/BfWn64/764)


# Hexo editor
Hexo editor is a what you see is what you get system.
    
    git clone https://github.com/tajpure/hexo-editor.git
    cd hexo-editor
    npm install --production
    npm start

or use evernote for China to edit the markdown


# Global Avatar
Add the url into the Avatar section in the _config
Refer to the link as below:
https://en.gravatar.com/emails/


# Search

**Install**
    
    $ npm install hexo-generator-search --save

**Config it in {root}/_config**

    search:
      path: search.xml
      field: post
      content: true

**Enable the serach in the _config.yml of theme-next**
    
    local_search:
      enable: true

[hexo-generator-search](https://www.npmjs.com/package/hexo-generator-search)


# Google Analysis

Enable in {theme/to/next}/_config.yml

    google_analytics:
      tracking_id: UA-number
      localhost_ignored: false



# RSS Feed

**Installation**

    npm install hexo-generator-feed --save

**Configuration**
In {ROOT}/themes/theme_next/_config.yml

    social:
      RSS: /atom.xml || rss


​      
# Categories & Tags

Only posts support the use of categories and tags. Categories apply to posts in order, resulting in a hierarchy of classifications and sub-classifications. Tags are all defined on the same hierarchical level so the order in which they appear is not important.

**Example**

    categories:
    - Sports
    - Baseball
    tags:
    - Injury
    - Fight
    - Shocking

https://hexo.io/docs/front-matter.html

**Configuration**

    # External url should start with http:// or https://
    menu:
      home: / || home
      about: /about/ || user
      tags: /tags/ || tags
      categories: /categories/ || th
      archives: /archives/ || archive


# Enhance Image Reference

**Installation**  
    $ npm i --save hexo-asset-link

**Markdown Syntax**
```Markdown
![Rest Client](./my-favorite-extensions-for-visual-studio-code/rest-client.jpg)
![Rest Client](my-favorite-extensions-for-visual-studio-code/rest-client.jpg)
```
**Reference**  
_Image to Hexo_  
https://liolok.github.io/zh-CN/How-to-Add-Image-to-Hexo-Blog-Post/



# Mermaid Surpport for Diagram

Hexo Next already supported the mermaid nested.
https://github.com/theme-next/theme-next.org/blob/source/source/docs/tag-plugins/mermaid.md



# Force to refresh the browser
Presss `Shift + Command + R` to force to refresh the browser(Chrome) to test the result in Mac 







# Reference:
_Hexo backup_
https://blog.itswincer.com/posts/7efd2818/

_Add google adsense_
https://juejin.im/post/5c95d230e51d45124e35cef6

_Third party for theme next_
https://theme-next.iissnan.com/third-party-services.html

_Wirit the post_
https://hexo.io/zh-cn/docs/writing.html

_Front-matter_
https://hexo.io/docs/front-matter.html

_asset folder_
https://hexo.io/docs/asset-folders