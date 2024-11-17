---
layout: post
title: Middlewares
categories:
- backend, node
---

# Middlewares

A middleware is just a function.
It has request, response and error object.
Express or any javascript/backend framework handles middleware stack.

It is in the form of a pipeline.
It has the following syntax.

```(err, req, res, next)```

there are different types of middlewares. 
application level, router level, error handling middleware.

they can call the next function in the application stack or else can return the response as res.json() or res.send().

