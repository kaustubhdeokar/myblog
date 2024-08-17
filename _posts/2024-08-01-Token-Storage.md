---
layout: post
title: Token Storage
categories: 
    - info
---

When storing JWT token or any sensitive user information, where should it be stored ?

### Local storage:
>  It's simple and easy, but not secure, as it is prone to *XSS attacks. It is not deleted automatically and has to be explicitly deleted. Hence, not recommended. 

### HTTP Only Cookies:
> Not accessible by Javascript, hence XSS issue is mitigated. Cookies are included in every request. Can be marked as secure, have specific expiration times. 
> May lead to CSRF attacks if not implemented proper protection mechanisms.









\* XSS attack - cross side scripting. 
  - User injecting malicious content on website. 
  - Like finding a way to add some \<script> element extracting sensitive information.  
  - Hence user input should be encoded before being displayed.
  - Using security headers, which limit the content that can be loaded and executed on site.
  - When inserting user input, escape special characters.