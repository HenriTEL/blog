# Migration gaps and how to prevent them

> A retrospective on 2 migrations that went a bit wrong.

I recently went through the migration of 2 diffenrent services at Meta and both time we had a few issues. In this post I'll briefly explain what was being migrated and what went wrong. Then I'll give advices to prevent them in the future. Let's go!

## The object storage's forgotten customers

![Migration diagram](/media/obj-store-migration.svg "Object store migration diagram")  

The first migration was of one object storage to another (some s3 equivalent).
A few hours of downtime was acceptable for the time of the migration but once it was complete for a given user, everything had to work as usual for him.
Most users connected to the service via a dedicated app frontend that we had full concrol on, but we also had some legacy processes that interracted directly with the object store.  

To avoid disruptions, we needed to identify those direct integrations early and ask their corresponding owners to connect to the app frontend instead. Only once their processes are updated could we proceed to migrate them to the new storage.  

So we looked for such direct integrations in the codebase, found the correspondings owners and asked them to update.
Our search wasn't perfect and we missed some cases, leading to some emergency migration rollbacks.

## The metrics daemon that had a nickname

In this second migration experience I was on the consumer side.
The daemon that aggregate metrics on our hosts was being migrated to another, more standard one.  
Easy, I thought. We just need to grep into the codebase to find where we import the old library, replace it with the new one and we're done!
Again, our search wasn't perfect and a few metrics stopped working at some point.  

It turns out that the daemon being migrated supported different protocols for metrics so you could interract with it using different libraries. We used one of those other libraries.

<details>
  <summary>ⓘ A note on why manually disabling the old daemon did not flag the issue</summary>
  The nasty part is that we only discovered it later after manually checking our dashboard because our alerting was based on values reaching some threshold but when the value is missing entirely, it did not evaluate at all! A classic.
  So, relying on the good configuration of alerting or checking dashboards manually is not a good solution. It's something you should definitely do as a verification step but the more metrics you have, the more likely you are to miss some.
</details>


## Retrospective

There's a pattern here. Each time we rely on code discovery to enumerate dependencies and assume that it is good enough to cover all integration with the system to deprecate.  
It's not. Those queries will miss use cases proportionally to the size of the codebase and the number of customers. Just think about code hidden elsewhere, for example in a container registry or a package repository.  

My take is that relying on such manual code search for the purpose of deprecation should be a red flag.
We should do those manual searches but as a secondary verification step, not as the source of truth.  

What should de done instead is to measure usage of the service to deprecate, in real time if possible.
It's the only reliable way to make sure that such service can be decomissionned and that the migration is complete.  
In our first migration case it means investing time to trace the origin of requests received by the old object store, so that we can distinguish the one that come from the frontend from those that come from elsewhere.  
In the second migration we should have kept track of the metrics received by the old daemon.  

One can argue that we can still miss integrations when their service calls are made out of the window we used to track usage.  
First it's important to note that your service should already be monitored and you have the metrics already. What you usually need to do is find the right query or join metrics with some other data, but it's likely that you already cover a large enough time window.
If not you should start collecting such metrics ASAP.  
If you still miss some use case it means that those usage were not frequent enough to be detected it's likely that they are not so critical and can be delayed for the time of their update.
