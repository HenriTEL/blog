# Migration gaps and how to prevent them

> I recently went through the migation process of 2 different services at Meta and we missed some dependencies both times.
> In this post I'll explain what went wrong and provide general guidelines to prevent this kind of issue the next time.
> In short, it's crutial to measure usage of a given service and use that to validate that there is no remaining integrations.

## The object storage's forgotten customers

Our first migration that went partially wrong concerns the migration of one object storage technology to another (some s3 equivalent).
We had hundreds of different customers that uploaded files to their workspace using a frontend (with its own API) that made calls to this storage backend internally and only a dozen that had direct integrations.
A few hours of downtime was acceptable for the time of the migration and the traffic was not huge, so we came up with a migration process quite easily.
We setup a logical switch on each request based on the workspace location with some additionnal metadata.
If the workspace is marked as migrated it goes to the new storage, otherwise fallback to the old one.
The actual migration of each workspace is done in a few steps.
First we copy each object to the new backend.
Then we disable writes to the old backend and do some kind of rsync to resolve differencies between the start and the end of the copy.
Finally, we set the migration flag.
Now this solution only works for customers that use the dedicated frontend, because the switch logic is made at that level.
Customers that interract with the storage backend directly have no clue about their workspace being migrated.
At some point it becomes read-only and if they continue to use the storage API directly instead of the frontend, their script breaks.
So we looked for such direct integrations in the codebase, found the correspondings customers and asked them to migrate.
Our search wasn't perfect and we missed some customers, leading to some emergency migration rollbacks.

## The metrics daemon that had a nickname

In this second migration experience I was on the consumer side.
The daemon that aggregate metrics on our hosts was being migrated to another, more standard one.
Easy, let's grep into the codebase to find our where we import the old library, replace with calls to the new one and voilà.
Again, our search wasn't perfect and we missed a portion of one application that stopped sending metrics at some point.
It turns out that the daemon being migrated supported different protocols for metrics and one of our integrations used one of those, therefore another library.


## Retrospective

There's some kind of a pattern here. Each time we rely on manual checks to determine dependencies to the system being migrated and assume that those checks are flawless.
But they are not, we've seen 2 different cases that led to missed integrations, and there's many more.
Doing such out of the blue search for dependencies for the purpose of deprecation should be a red flag.
Instead we should measure usage of a given service and use that to look for remaining integrations.
It's the only reliable way to make sure that such service can be decomissionned and that the migration is complete.
Of course we can still miss some integrations if their corresponding service calls are made out of the window we used to gather usage data.
But probably such metrics already exists and cover a large enough time window.
If not your priority should be to start collecting such information ASAP.
Finally, if you still miss some use case it mean that they used the service very infrequently (not in 3 months maybe) so probably they are probably not so critical.
