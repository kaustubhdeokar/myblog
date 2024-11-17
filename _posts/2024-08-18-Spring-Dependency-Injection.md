---
layout: post
title: Spring
categories: 
    - TodayILearned
---
Spring 
- Why to avoid the field injection:
  - Testability of the application is easier when using constructor injection.
  - Fields are not immutable. States can be changed after initialization.
  - Constructor injection makes it apparant that the depdendencies are growing and that there's a need for refactoring.
  - 