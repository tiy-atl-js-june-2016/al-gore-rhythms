## The Algorithms Lecture

--

__Long rumored and now real.__



---

## So ... Algorithms

--

![cool](http://healthstandards.com/wp-content/uploads/2013/11/AlGore.jpg)

---

## Not That...

--

![not-this](http://s2.quickmeme.com/img/dd/dd7f33f22f6eb76d9b707adb293c3c00e239b2d56d9366d573dd23a39503b0fd.jpg)

# NO!

---

# Let's Try Again...

Let's see what wikipedia says: [algorithms][algo-wiki]

[algo-wiki]: https://en.wikipedia.org/wiki/Algorithm

---

# Meh

Here's mine: A formal set of steps with proven resource usage to solve a problem in some optimal way.

--

Why do I bring this up? It's a little weird to describe code that you haven't written a *mathematical proof*
about as an algorithm. That being said, it isn't **super** weird.

And pop culture is pushing hard to make it refer to code in general,
much as changed the connotation of "Hacker" in the 70s and 80s.

---

# This Lecture

* Should be super fun. This is all stuff I love and actually know a fair bit about.
* We can go on digressions and let's have fun with it. There *will not* be homework about it.

--

I have two overarching goals:

1. Enjoy a day programming sans frameworks. No big apps!
2. Give you *brief* exposure to some deep ideas about CompSci.

Remember: There are many directions to explore in computer programming and all are profitable!
Gotta mix it up sometimes!

---

# This Lecture (continued)

I am mostly spitballing from high-level ideas but I do have three parts in mind...

--

1. Fibonacci, Memoization, and Processes (javascript)
2. Cosmicomics, Combinatorics, and Complexity (ruby)
3. Metaprogramming and Dead Languages (lisp)
  * Note: You can get me to talk about pretty much anything for step 3.
  * Would be happy to rant about programming languages/emulation for 30 minutes for example...

---

# Fibonacci & Memoization

--

Key points:

* We need to be able to distinguish between the *shape of code* and the *shape of the process it generates*.
* Doing less work is usually the best way to speed up programs.
* Sometimes, general approaches (like memoization) are an easy fix.
  * Memoization can be done automatically without too much difficulty.
  * A custom solution can keep the good properties of memoization and skip the bad.

--

Useful general strategies not even mentioned here:
* Divide and Conquer
* Greedy Algorithms
* Dynamic Programming
* Backtracking/Unification (and a host of related AI techniques)
* Linear Programming
* Probabilistic/Approximation Algorithms

---

# Cosmicomics & Complexity

--

Key points:

* Wall clock time on a certain dataset or machine is irrelevant to the performance of an algorithm.
  * Algorithmic speed is determined by mathematical proof about the maximum runtime. "Big O notation"
* The thing we care about is how the amount of work grows with the amount of data to be processed.
  * How does it *scale*?
  * (Note: People talking about scaling apps normally mean something different. Traffic.)
* With real performance problems, use a *profiler* to find the problem. Human intuition is awful for big programs.

--

Two ways to speed up programs:
* Find a faster way to do the same work
* DO LESS WORK.

The latter is almost always preferable.

---

# Metaprogramming and Dead Languages

I'm gonna want to be super fancy here. *HELP ME FOCUS ON THE BASICS* :)

--

Lisp is actually a family of languages dating back to the 60s.

I'm a big fan of Common Lisp. Clojure is the most popular dialect these days.

3 big reasons I like *Common Lisp*:

1. Unlike many languages, *Common Lisp* is pretty unopinionated about how you should program.
  * And, on personal projects, I treat programming almost as a form of creative writing.
2. Despite being a high-level language, you can still drill down to the bits readily.
3. The tooling is amazing. (Compilers, Debuggers, Profilers, Editor Integration/SLIME, etc)

---

# Why is he just going on about Lisp?

1. Lisp is the family of languages where metaprogramming is most prevalent and culturally encouraged.
2. Many communities frown upon it and yet, it's in most major frameworks. Rails + Angular both do it!
3. Why unique to lisp then? Because metaprogramming is usually **INSANE AND FROUGHT WITH DANGER**.

See esp: [Mark J Dominus](http://lists.warhead.org.uk/pipermail/iwe/2005-July/000130.html)

---

### What the hell is metaprogramming?

Code that generates other code. Simple as that.

--

That sounds complicated. Why do we want it again?

--

1. With metaprogramming, you never have to wait on the language designers to give you a feature.
  * Classes could've been added to javascript in *one day* with a good metaprogramming system.
  * (Also, last I heard `sweet.js` intended to add "real macros" to JS. Not sure what happened with that.)
2. Inevitably, duplication and inefficiencies crop up in our programs as they grow.
  * Metaprogramming offers powerful tools for solving these issues and *growing the language* towards the problem.

---

But the *host language* better damn well give you two things:

1. More structure than strings. (I.e. This is why everyone hates `eval`.)
2. Formal, well-documented ways to control what happens at "runtime" vs "compile time" and how those phases interact.

--

## Fine, So Show Me

> Okay. Let's Lisp!

The immediate aversion everyone has is to the parentheses. But they're *why* the metaprogramming is so easy.

The syntax for everything is universal. There *is* no syntax.
Just expressions (code) and quoted expressions (data). And macros.

(Also this means on bugs like operator precedence mixups like we had with `!$state.name === 'root.login'` yesterday...)

--

Here we go...

--

Expression: `(+ 1 2 3)`
Quoted Expression: `'(+ 1 2 3)`
Macro: ``(+ 1 2 ,x)`

---

## An Exploration of Macros

Some looping constructs:

* do
* dotimes
* dolist

--

What if we needed a while loop? :-/
