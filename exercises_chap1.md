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


## 1.5

Considering the *applicative-order*, we would need to first evaluate the
operands until we get primitive values. But `(p)` returns a recursive call to
`p`, which executes indefinitely since it does not have any stop condition.

In summary, for *applicative-order*, the code keeps running forever.


In the *normal-order*, we need to expand the operators until we get primitive
operators.

```scheme
(test 0 (p))

(if (= 0 0)
  0
  (p))

0
```

We can see that when the value of `x` is 0, the operand `(p)` never needs to be
evaluated since the value of the conditional expression is already known, 0.
Therefore, `(test 0 (p))` would be evaluated to 0.
