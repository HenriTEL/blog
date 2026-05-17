# My take on testing

Most of my experience is with the python programming language. Because it is interpreted and dynamically typed, you're never really sure it'll work well in production until you actually run it. Having a good test suite is very important, I've leaned it the hard way over the years. So here is my take on testing non-critical human facing software.

Mocking is useful to easely test behavious that are hard to reproduce in the real world. Typically, when you face a new bug due to an unexpected schedule of events that you want to reproduce. For example a new app version store data differently in DB which break some legacy users processes. If you want to make e2e tests for this you need to setup your DB with data in the old format, which requires launching the app in its old version to populate the DB. If you just mock the function that fetch data so that it returns it in the old version instead, it's much easier. 


First let's discuss why we need to test in the first place.
It's really to feel confident that our code will run well when we ship it.
The better we cover our app use case, the more confident we are at pushing code, the more velocity we gain at shipping new features.
But we quickly realise that we need to do some trade-offs. There is an infinity of possibilities to test, writing and running tests is not free.

Unit tests or integration tests? How much code coverage?
No all features are equals, usually you prioritise some core functionnalities and only work on less important features later.
So why should you make arbitrary decision regarding testing?
You should reason about the critical paths of your application and test that first. For example if you develop a cli with some dry-run capabilities, you should have a test that actually call the cli with this option and verify that the changes are not applied, as expected.
If you only make unit tests in the undelying library you'll miss any call to this labrary that is made with the wrong args.

1. Cover critical paths with a few e2e tests
2.


What is the right amount of code coverage?

What about TDD, mocking, fixtures, versioning, concurrent programming (unexpected scheduling of events), side-effects (pure functions), ACID capabilities?
