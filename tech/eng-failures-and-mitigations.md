# Awful Software Engineering Failures And How To Prevent Them

> Testimonials of some of the most awful Engineering failures and general principles to avoid them.

This post is based on a [Hacker News thread](https://news.ycombinator.com/item?id=38452959) where a lot of people provided their own horror stories.
I try to give concrete examples of failures and corresponding solutions as much as possible to illustrate the general principles.
I'll probably extend an reorganize it in the future. Keep in mind that following is only relevant to important systems, i.e. the one that would put you in a bad situation if you mess them up. It'equally important to know where it's fine to move fast and break things, typically end user impact vs internal impact.

[TOC]

## General advices

**Minimize the number of manual steps** Humans make mistakes, for example in the [Gimli Glider](https://en.wikipedia.org/wiki/Gimli_Glider#Miscalculation_during_fueling) story, 2 technicians, the First Officer and the Captain all failed to correctly calculate the amount of fuel required for the flight, causing the plane to take off with an half empty tank. Automation does not prevent you from conducting manual verifications still, especially when you push non-trivial changes or modify said automation.
Did you test the script that checks if the CI ran tests? 🤡

**Warn the user about potentially dangerous actions**, for example when deploying a version that did not pass all tests. Think about situations where you've been asked for confirmation.  

**Build things that are safe by default**.

* Avoid code that executes dangerously by default, e.g. a script that does not check if the destination already exists before overwriting it. Enabling them with an explicit `force` flag is ok.
* Leverage typing where available, [Parse, don’t validate](https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/). For example by making a `RoConnection` class that only execute queries toward read replicas of your db cluster.  

**Deny/ignore by default and use allow lists**. This one comes from the security domain but can be applied to many other things.
For example, if you want to apply something to a subset of users, it's much easier to know who gets affected by explicitly providing the list of those users than the list of all the other users that must be ignored.  

Design systems such that they **cannot be plugged incorrectly**. For example by the use of named parameters over raw arguments as it can be easy to get the order of arguments wrong. Also be careful with short options, people might expect `-r` to run the operation recursively, not to be the short version of `--remove`.

**Fail early to avoid inconsistent states**. This can happen when you run commands in sequence and some of them succeed while others fail. Figure-out dependencies and make sure that the script returns on the first unexpected error.

Apply **Least privilege principle**. This one is related to the Deny by default point.

* Separate read and write operations, provide read-only credentials for read-only operations.
* Limit access to only the resources that need to be touched, e.g. only one directory instead of the whole filesystem.
* Don’t give prod accesses to those who don’t need to.
* Deny access to tables containing personal user data, so that developers don’t create privacy incidents by mistake.
* Make credentials expire for users that need to interact directly with critical systems. If you need to routinely perform manual maintenance operations you’re probably doing it wrong. Reduce toil with automation.  

**Defense in depth**. Don’t assume that your first line of defense is impenetrable. The story of the [qantas flight 32](https://admiralcloudberg.medium.com/a-matter-of-millimeters-the-story-of-qantas-flight-32-bdaa62dc98e7) says a lot about how far this principle can go. Fragments of one of the IP turbine disk passed through the wing and belly of the A380 causing the malfunctions of dozens of critical systems. The plane landed successfully nonetheless. Software Engineering examples include:  

* Checking the environment at the beginning of the script in addition to running it with a service account with minimal privileges.  

**Don’t leave dangerous operations / code in the wild**. If it modifies a critical system it probably deserves proper documentation and official tooling.

* It can be a harmful command line sequence that you left on your personal wiki page that is accessible to everybody. People will find it and copy-paste it when you’re away.
* It can also be this script that you wrote for yourself in your `/home`. People will run it when you’re away.
* Or you will forget about the dangerous part and execute it in the future.

**Know your Single Points Of Failure**. It can be specific hosts or services, internal or external. Once the corresponding stakeholders are aware of those it’s easier to be extra-cautious when interacting on them or to try to remediate them.  

**Setup quotas**, especially on resources that cost extra money. You don’t want to provision GCP instances in an infinite loop until your company goes out of money. If you’re an investment fund, you don’t want to send market orders in an infinite loop until your clients don’t have enough money to pay for the transaction fees.  

**Setup monitoring and alerting**. You don’t want to hear the bad news from your users.

* Monitor resource usage (CPU, RAM, storage), predict exhaustion and alert BEFORE it happens, typically full storage.
* Make sure that there is no SPOF in your monitoring and alerting stacks. The last thing you want is to become blind to the system's health.
* Be careful with alerting where the absence of data points usually does not trigger an alert, while it probably means that there is an outage. You need to use absent() when using prometheus for example. This default behavior is a million dollars mistake IMO.  

**Fight the normalization of deviance**. Work quality can degrade quite fast and ad-hoc bumpy procedures have a tendency to stay. Some examples include getting used to: overtime, failing tests in the CI, doing the same process so often that you validate prompts without even reading them, simultaneously working with a dev and prod env.  

**Avoid interacting with critical systems on Friday evening**. Also think about the worst case scenario and how long it would take to recover.  

**Check your own state**. Many errors happen because people are tired, under too much pressure, in a hurry or have whatever other issue that makes them prone to mistakes.

* It’s ok to ask for more time, discuss trade offs, ask for help or delegate to someone else. It’s also important to be honest and tell others that you simply don’t know how to fix something and fear that you might break it even more.
* SPOFs are not limited to computers but are often people, that’s an issue that must be tackled too. Typically being the only expert that knows how to solve issues with technology X, like how to fix nodes of a database cluster that are in a bad state.  

**Don’t blame people**. Take those failures as opportunities to improve the robustness of your systems. Make sure that the whole team learns from those mistakes.  

**Have a good understanding of what happened before trying to mitigate an issue**.

* Write down the sequence of events with as many details as possible, e.g. who typed what command when.
* Figure-out the scope of the issue, e.g. what features are not working and for which users.
* Make sure to compare exact timestamps to understand how events are correlated.
* Make sure to gather all timestamps in the same time zone, e.g. UTC.  

**Make sure your mitigation steps are safe**. For example you might want to rollback your application to a previous version, but that version might not be compatible with the current database scheme, because you changed a foreign key, moved a column in another table or whatever.  

Once an issue is mitigated, make sure to well identify the root cause of the issue by conducting a proper post-mortem. Make sure to execute the follow-up tasks.  

**Warn others**

* Prior to performing sensitive operations, even when disruption should not be expected. If disruption is part of the worst case scenario, people in charge and potentially affected users should know.
* As soon as you understand your mistake. Bad news doesn’t get better with age.  
Be a team player by telling any interesting thing that you noticed and might be related. If you hide something unconventional that you did to avoid the blame, people will probably find out and you’ll lose their trust.  

**Unplug the system yourself**. Test your system reliability yourself by voluntarily shutting down some parts. It’s the only way to be truly confident about the system’s robustness.  

Run recovery for fake. It’s the only way to be confident during a real disaster recovery. You’ll also have a better sense of the cost in terms of time, resource and money to conduct such recovery.  

## Wiping prod Database

**Prevent**

* For scripts that should only be executed in one env, check the environment first thing.
* Have a table with one row in it indicating whether the database is prod if necessary.
* Delete by id instead of deleting everything, if not possible check the number of affected rows before deleting.
* Avoid working in 2 different envs simultaneously, typically with one terminal connected to prod and another one to dev. If you want to do that anyway, use env-based prompt color, e.g. red for prod, yellow for staging and green for dev.
* Write a BEGIN statement before executing updates and deletes. If they are not instant or don't return the expected number of modified rows you can just rollback the transaction.
  - [PostgreSQL] Add \set AUTOCOMMIT off in your .psqlrc, that way every statement will be in a transaction.

**Anticipate**

* Double check that you have backups in a good state (check recover section) before running important operations like a database migration.

**Recover**  
If possible, run the following often and automatically. Make sure to also manually check that each step runs as expected at regular intervals.

* Backup data.
* Verify data integrity.
* Perform data recovery in a fresh database.
* Perform end to end tests on the recovered database.
* If they can’t be run automatically, at least make sure that the oncall engineers are used to going through the whole process.


## Messing up a critical host

**Recover**

* When core commands stop working, check `/sbin`
* Try booting in rescue mode, check the system logs


Other interesting stories you can lear from:

* <https://jameshaydon.github.io/nats-fail/>

