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
