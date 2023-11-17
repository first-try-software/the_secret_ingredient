# The Secret Ingredient

*How To Understand and Resolve Just About Any Flaky Test*

Flaky tests are an inscrutable bane. Hard to understand. Annoying. And, so frustrating! My personal nemesis is Daylight Saving Time. I can’t tell you how many times I’ve tripped over it. Let’s just say I was well into the “shame on me” part of that relationship, until I discovered the secret ingredient that nearly all flaky tests have in common. Turns out they only seem inscrutable. It really is possible to understand and resolve just about any flaky test.

---

This repository contains the source code for the RubyConf 2023 talk on flaky tests entitled [*The Secret Ingredient*](https://rubyconf-2023.sessionize.com/session/527141).

The talk covers where flakiness comes from, how to recognize it, and how to resolve it, including the following topics:

* Non-Determinism
* Order Dependence
* Race Conditions

This repository is organized as a series of commits to a class called `RubyConf` and its associated specs. You can follow along one commit at a time, or via the following tags:

* step-01 / flaky-system-clock
* step-02 / resolved-system-clock
* step-03 / working-random-number
* step-04 / flaky-random-number
* step-05 / resolved-random-number
* step-06 / flaky-network-connection
* step-07 / resolved-network-connection
* step-08 / flaky-shared-state
* step-09 / resolved-shared-state
* step-10 / flaky-async-io
* step-11 / resolved-async-io

---

Here the deck: [The Secret Ingredient](https://speakerdeck.com/aridlehoover/the-secret-ingredient-how-to-understand-and-resolve-just-about-any-flaky-test).

Thanks for stopping by. I'll post links to the deck and the video as they are made availble.

 ~ Alan
