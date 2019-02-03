# Chapter 1 - Exercises

## 1.4

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

The body of the function is composed by

```scheme
((if (> b 0) + -) a b)
```

which is an expression by three elements:

* operator: `(if (> b 0) + -)`
* operands: `a` and `b`

The operator is another expression by itself and needs to be evaluated to a
valid procedure before we can get the final value of the function's body.

The value of the conditional expression can only be one of two procedures: `+`
or `-`, depending of the value of `b`. After evaluating the conditional
expression, we get

```scheme
(+ a b)  ; if b is greater than 0

(- a b)  ; if b is less or equal to 0
```

These two possible expressions have a valid structure where the first element is
a procedure and the other two are numeric values. Therefore, it can now be
evaluated to sum or a subtraction of two numbers.
