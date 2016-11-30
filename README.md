Isolation Testing
=================

This repository attempts to develop an ecommerce-style order processing system
via TDD with isolation testing according to [POODR](http://www.poodr.com)
Chapter 9.

The goal is to experiment with isolation testing to gain confidence and
experience and understand pitfalls of the technique.

The commits tell the story of how the code base evolved.


Developing
----------

To setup for development:

* Install the Ruby version mentioned in the Gemfile
* Run "bundle install"

To run the test suite, run "rspec" in the project root directory.


Questions
---------

* We have nearly 2x as many lines in tests than in production code.  That
  seems like a fairly high test to code ratio (1.9).  Are we doing it wrong?

* Is it plausible that a developer might accidentally change the codebase in a
  way that accidentally introduces divergence between two implementors of the
  same interface, especially a stub and a real counterpart?

* Some of the stubs here don't really seem necessary for performance, but I
  introduced them for the sake of exercising that idea.  Is it necessary for
  the purposes of isolation and bounded test fixing as requirements change?
  If I were to compromise and use the real collaborators instead, would I
  regret it later?  Would it be hard to identify an interface later?  Does
  identifying the interface now help me think more clearly about roles,
  enhancing design?

* Is there a useful interface that we can feed to the view?

* Performance is fast.  Time to first spec is about 0.37 sec because the app
  loads fast and has few dependencies.  RSpec clocks the whole suite at 0.004
  sec, plus 0.08 sec to load files.  That's for 21 files with 24 examples total.
  Test case rate is about about 3000 per sec.  That's pretty sweet.  Is it
  sustainable as the codebase grows?  Certainly any actual tests that call out
  to other services will be dog slow, but perhaps they could be run separately?


Keeping Stubs in Sync
---------------------

One danger of isolation testing is that they will pass even though the
production application breaks because the stubs get out of sync with the real
collaborators of an object under test.

Sandi's solution for this is to [use interface tests to validate the stubs](https://www.safaribooksonline.com/library/view/practical-object-oriented-design/9780132930895/ch09.html#ch09lev2sec16).  But this leaves me with some concern.

First of all, her approach to testing requires a higher level of developer
discipline than implementing one integration test for each business
requirement.

Validating integration test coverage is fairly easy for a novice developer to
do.  But with isolation testing, there are more pieces to the puzzle: you need
to make an stub, and an interface test, and make sure they align with the real
collaborator.

To ensure alignment between the stub and the real collaborator, the developer
must understand the requirements of the real collaborator, which may not be
handed to them on a platter like business requirements.  Testing that the right
methods are implemented is just the first layer; beyond that we have
relationships between method calls due to state changes.  For example, a stack
must respond to push and pop, but testing those methods individually won't
ensure the [LIFO](https://en.wikipedia.org/wiki/Stack_%28abstract_data_type%29)
characteristic of a stack.

Suppose a developer misses the LIFO interaction between push and pop methods.
The interface test might still exercise the push and pop methods individually,
but not enough to distinguish from
[FIFO](https://en.wikipedia.org/wiki/FIFO_%28computing_and_electronics%29).
Code coverage reports will still show 100%.

With integration tests, we also have the potential for drift between test
coverage and business requirements.  Production code might work at first, but
due to incomplete test coverage, it might stop working later even when the
suite still passes.

Is the risk greater for isoation tests?

How can we audit for proper coverage in code review or when cleaning up old
code?
