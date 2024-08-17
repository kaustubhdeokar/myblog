---
layout: post
title: Spring Security
categories: development
image: /assets/img/spring-auth.png
---

Spring security, 

Follows a structure:
- ![]({{page.image | relative_url}})
- 
Any request that comes does not go directly to the controller, it follows some steps:

- First step, it goes through a filter (UsernamePasswordAuthenticationFilter by default).
    - verifies if the user credentials are correct. (Authentication happens here).
    - it returns an object of class Authentication. 
- The Authentication Manager implements a method authenticate which takes in the above object and passes to an implementation of the Authentication Provider (like DaoAuthenticationProvider) 
- The Authentication Manager figures out who all are the authentication providers available. By default the authentication manager is the ProviderManager.

  ```
    @Autowired
    @Bean public AuthenticationManager authenticationManager(UserDetailsService userDetailsService){
         DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
         daoAuthenticationProvider.setUserDetailsService(userDetailsService);
         return new ProviderManager(daoAuthenticationProvider);
    }

  ```
- The authentication provider then requests the implementation of User Details Service to return the actual user. 

  ```
  // Custom implementation of UserDetailsService -> (extending InMemoryUserDetailsManager)

    @Bean
    public UserDetailsService userDetailsService(){
        Collection<GrantedAuthority> grantedAuthority = Collections.emptyList();
        User user1 = new User("user1", getPasswordEncoder().encode("password1"), true,
                true, true, true, grantedAuthority);
        User user2 = new User("user2", getPasswordEncoder().encode("password1"), true,
                true, true, true, grantedAuthority);

        return new InMemoryUserDetailsManager(List.of(user1, user2));
    }

  ```

Once a security filter chain is defined, we cannot access the login page from postman or browser as the csrf check fails. 

By default when the spring-security is included in class path, basic authentication and CSRF protection is enabled.
Server generates a Session ID and sends it to the client in the form of a JSESSIONID cookie. 
CSRF protection -> a different token on top of the session id. csrf tokens are included in all request parameters for state changing operation.


AuthenticationEntryPoint
- to handle unauthorized access. 
- In the context of a JWT-based authentication system, the JwtAuthenticationEntryPoint class would implement AuthenticationEntryPoint to return a 401 Unauthorized response when a request without a valid JWT token is made to a secured endpoint.


- JWT
- https://github.com/jwtk/jjwt#js-repo-pjax-container

- Creation of jwt: generateToken - 
- add claims like issuer, subject, expiration, issued at (time) and sign it with secret key.

  ```
  private static SecretKey getSecretKey() {
    byte[] decodedKey = Base64.getDecoder().decode(jwtSecret); //jwtSecret -> injected at runtime.
    return new SecretKeySpec(decodedKey, 0, decodedKey.length, "HmacSHA256");
  }

  public String generateToken(String name) {

    String token = Jwts.builder()
            .subject(name)
            .issuedAt(new Date())
            .expiration(expireDate)
            .signWith(getSecretKey())
            .compact();

    System.out.println("New token :"+ token);
    return token;
  }


  ```

- decrypting jwt.
  ```
         Jwts.parser()
        .verifyWith(getSecretKey())
        .build()
        .parseSignedClaims(token);
  ```  

  To extract claims: just adding getPayload()
  ```
     Claims claims = Jwts.parser()
                .verifyWith(getSecretKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
  ```

  All added claims will be retrieved (username->subject)