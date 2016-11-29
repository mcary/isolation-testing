Isolation Testing
=================

This repository attempts to develop an ecommerce-style order processing system
via TDD with isolation testing according to POODR Chapter 9.

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
