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


## 1.6

The main difference between `if` and `new-if` is the evaluation (or the lack of
it) of the arguments. For ordinary procedures like `new-if`, the arguments need
to be evaluated first, resulting in primitive values like numbers or function
objects. In contrast, the special form `if` has a different rule to evaluate its
arguments; depending on the *predicate*, the *consequent* or the *alternative*
is never evaluated.

Therefore, the new version of `square-root` using `new-if` never finishes its
recursive calls to itself, since the *alternative* (the recursive call) is
always evaluated, independently of the *predicate*. The program will crash after
a while (when there is not enough memory to stack up new recursive calls).


## 1.7

For very large numbers, the result of `(square guess)` might be very imprecise,
resulting always in big differences with `x`. So, the `guess` would never be
good enough for small tolerances like `0.001` and the program would never stop
trying to find a better `guess`.

Something similar happens to small numbers too. `(square guess)` or the
tolerance would not be precise enough to provide a useful comparison. So, the
program would run forever trying to find a better `guess` or it would accept a
very imprecise `guess` as a response (the case for a tolerance of `0.001`).

Using the suggested improvement on `good-enough?`, the new procedure for the
square-root successfully finishes its calculation for both large and small
numbers, using the same tolerance value (`0.001`). It is interesting to note
that the definition of `good-enough?` does not even consider the number whose
square-root we want to find.
