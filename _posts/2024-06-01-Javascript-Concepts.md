---
layout: post
title: Javascript Concepts.
categories: frontend, Javascript
image: /assets/img/event_loop.png
---
# JavaScript Concepts

## Table of Contents
- [JavaScript Concepts](#javascript-concepts)
  - [Table of Contents](#table-of-contents)
  - [Execution Context](#execution-context)
  - [Call Stack](#call-stack)
  - [Scope](#scope)
  - [Variable Declarations](#variable-declarations)
  - [Shadowing](#shadowing)
  - [Closure](#closure)
  - [Function Statement \& Function Declaration](#function-statement--function-declaration)
  - [Function Expression](#function-expression)
  - [First Class Functions](#first-class-functions)
  - [Callback Functions](#callback-functions)
  - [Event Loop](#event-loop)
  - [JavaScript Runtime Environment](#javascript-runtime-environment)
  - [Tasks Done by Runtime Environment](#tasks-done-by-runtime-environment)
  - [Set Timeout](#set-timeout)

## Execution Context

- Everything happens inside an execution context.
- Execution context has a memory component and a code component.
- It is single-threaded and synchronous.

## Call Stack

- Execution contexts are managed by call stacks.

## Scope

- Directly related to lexical environment.
  - Lexical - in hierarchy.
  - Lexical environment of a function: its local memory plus the lexical environment of its parent.
  - In simple terms, a child will be able to access things locally declared, plus the things declared by its parents.
  - This hierarchical searching in the functions, starting from the child to its parent, is known as **SCOPE CHAIN**.

## Variable Declarations

- Types of variable declarations in JavaScript.
  - We can access variables declared with the `var` keyword before they are declared as they are declared in the global scope.
  - `let` and `const` are hoisted but they cannot be used unless assigned because they are not declared in the global scope but a separate scope **(SCRIPT/BLOCK)**. They are put in something called as temporal dead zone.
  - If a user tries to fetch the variable declared by `let` or `const` before it is assigned, we get a **reference error**.
  - We will also get a reference error if a variable which is not declared is tried to be accessed during the program.

## Shadowing

```javascript
var a = 100;
{
    var a = 10; // a shadows the global 'a'
    let b = 20;
    const c = 30;

    console.log(a);
    console.log(b);
    console.log(c);
}
```


## Closure

```javascript
function x() {
    let a = 10;
    return function y() {
        console.log(a);
    }
}

let z = x();
z();
// Even though function y is done execution, it still has access to the variable 'a' from function x.
// This is known as closure.
```
- Function bundled with its lexical environment.
- Whenever the function is returned, even if it's vanished in execution context, it still remembers the reference it was pointing to. Please note, the reference, not the value!

## Function Statement & Function Declaration

- Function statements and function declarations are used interchangeably.

```javascript
// Function statement -> function declaration
function y() {
    console.log('hello y');
}
```

## Function Expression

```javascript
var b = function () {
    console.log('hello b');
}
```

- The difference between function statement and function expression is hoisting.
- We can access `y` before declaring but `b` will give us an error if accessed before declaring.

- params -> function parameters
- args -> with which a function is called.

## First Class Functions

- The ability to use functions as values, arguments, can be executed inside a closed function, and can be taken as return form.

## Callback Functions

- Functions attached to some event, like on click or setTimeout when time expired, where the code executes after the time countdown is done.

```javascript
function x() {
    let count = 0;
    const el = document.getElementById("clickhere");
    if (el) {
        el.addEventListener("click", function xyz() {
            console.log(count++);
        }, false);
    } else {
        console.log("Element not found");
    }
}

window.onload = function () {
    x();
}
```
Above is a callback function with a closure.

## Event Loop

When the timer gets expired for a callback function, the web APIs (browser context) or C++ APIs in the Node context put the callback function in the callback queue. Then the EVENT loop puts them into the execution stack.

The same is the case with addEventListener -> when some functionality has to be executed on click. When the respective button is clicked, the callback function is put in the callback queue, and then the event loop puts it on the execution stack.

- ![]({{page.image | relative_url}})

- Mutation observer -> if there is some mutation in the DOM tree, it might run some callback functions. So it also populates the microtask queue.

In the above example, there are 3 things happening:
- Code execution
- Fetch call
- Callback function with a timer.

1. Browser has superpowers that are lent to JS engine to execute some tasks. These superpowers include web APIs such as console, location, DOM API, setTimeout, fetch, local storage.
2. Callback functions and event handlers are first stored in the Web API environment and then transferred to the callback queue.
3. Promises and mutation observers are stored in the API environment and then transferred to the microtask queue.
4. Event loop continuously observes call stack and when it is empty, it transfers task to call stack.
5. Microtasks are given priority over callback tasks.
6. Too many microtasks generated can cause starvation (not giving time to callback tasks to execute).

## JavaScript Runtime Environment

- We need one to execute JS.
- Browsers have it built-in. Another example is Node.js.

## Tasks Done by Runtime Environment

- Parsing the JavaScript code to form an AST (Abstract Syntax Tree).
- JavaScript can execute code using an interpreter or compiler both. Most modern browsers now support a JIT compilation which has the ability to interpret and compile the code.
- After parsing, the interpreter starts interpreting the code line by line. The compiler also helps to optimize it. The algorithm to do so may differ from engine to engine.
- After which they go for execution, and where the memory heap and execution stack come into the picture.
- Garbage collector - mark and sweep algorithm.

## Set Timeout

The `setTimeout` will be put in the execution stack only after IT IS EMPTY. So, in short, it is guaranteed to run after AT LEAST 2 seconds as per the below example.

```javascript
console.log("start");

setTimeout(() => {
    console.log("after 2 seconds");
}, 2000);

var startTime = new Date().getTime();
var endTime = new Date().getTime();
while (endTime - startTime < 10000) {
    endTime = new Date().getTime();
}

console.log("end");
```