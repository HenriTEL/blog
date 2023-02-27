# Repairability is pointless without software support

> With regulations making [TODO check phrasing] their way around the world, a booming refurbished market and efforts from leaders 
> like Apple and its latest iphone 14, smartphone repairability is trendy. But what about the software? Aren't we missing the forest for the trees?

## Security is non-negotiable

Let's face it: smartphones are the single entry gate to most of our digital world. Emails, social networks, direct messages, ecommerce, photos and by extension proofs of identity. The list goes on. You have 2FA? Cool, that's also accessible from your smartphone. If someone gets user access to your smatphone, he really has root access to your life. Except for more hardenend apps like banking, he can suck all your digital life and lock you out of it, and that's not even the worst scenario. Imagination is the limit.

> Come on, you're not THAT important. Nobody cares enough for you to be threatened.

You and I may not be very important nor have ennemies with enough motivation. But that's not the right question to ask. Instead one should ask himself if there's anyone connected to the internet that can find value in ruining/syphoning his life (or threatening to)? If the answer to this question is yes, he and anyybody that shares the CVE is at risk.

> Such large scale attack never happened in the past and will never happen in the future. You're paranoid.

We know such zero-click attack exists, one example was found in 2021 with the Pegasus spyware. In addition, Android an iOS still regularly patch critical CVEs that could lead to arbitrary code execution. At this point it's not even a gray swan, we know it can happen, but for some reason all conditions are not met to trigger it on YOU.

So yeah, as long as new holes gets found on our devices, we'd better get those security updates.

## Shiny on the outside, rotten in the inside

Given that the duration of security updates of devices is usually between 2 and 3 years, the ability to repair them just increase the risk. You'll get more CVEs and for a longer time. It also increases the size of the cake, as more people are on vulnerable devices at any given point in time.

> But you can use custom ROMs to stay up-to-date

That's not a real solution.
* You need to be geek enough to start the adventure and it's hazardous.
* You'll probably need to break security locks (e.g. unlock the bootloader and root your device), introducing new holes.
* All apps that require those security locks will stop working.
* It's likely that some things will stop working properly, like bluetooth, mobile network or the camera.

On the other side, application support is less of an issue as most developers usually continue to support older OS versions.
