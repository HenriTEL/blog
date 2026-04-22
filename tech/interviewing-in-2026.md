# Interviewing in 2026

> A refreshing guide to interviewing at small and mid-sized companies from a software engineer with 10 years of experience.

Here we go again, it's this time in your career where you go through multiple rounds of proving that you're not a complete piece of shit.
This time again the implicit rules of the game are different than it was 5 years ago.

## Preparing

Recruiters might tell you that a resume is useless nowadays, it's all on linkedin already isn't it? I still advise to write a good resume by yourself.
It will force you to think and write about your past experiences in a way that fits the kind of jobs you're looking for. More importantly in a concise way.  
What better way to prepare for actual interviews?  

The things I recommand to avoid are filing online job applications and writing cover letters. Instead you should look on Linkedin for someone at that company who can refer you directly. Ideally an Engineer, otherwise the hiring manager, otherwise a recruiter working at that company.

You can try to play the long game by commenting on blog posts from that company, contributing to their open source projects, participating to organized events like code bounties, hackathons or meetups but be careful, by the time you decide to go through the interview process the position might already be closed. Also in case of a rejection, the opportunity cost to pay might be very high. It's all the time and energy you did not spent applying, preparing and interviewing elsewhere.

## The screening interview

The screening interview has become serious business. In the past it was more like a preliminary filter before the actual process.
Unless your profile was completely off for that postition or your expectations were out of range you would pass.
This interview is closer to a behavioral interview nowadays.

In 2026 you're going to be recorded and the interview will be transcripted. In theory you can refuse the recording but it's very likely that an LLM is involved in some way in the process. No matter if it's used for ranking candidates directly, generating summaries or answering ad-hoc questions, the output is likely to be much better when fed with the entire transcript versus the recruiter's notes.

1. Make sure that you **speak very clearly** and have a good microphone. The other person might understand you very well but you don't know what will come out of whaterver crappy software they're using for transcription. If you're beeing recorded, ask for the recording and the transcript.
2. **Adapt to the stage the company** is at.  
   Series A, B and C+ startups are looking for different things. The core stuff of speed, ownership, and ambiguity navigation is always there but in different flavors. It's basically the difference between building and scaling a product.
3. **Learn about their product.** You must be able to answer questions like _what do you like about our company_, _what's our buisness / product_, _what problem are we solving?_ even if they reached out to you.
4. **Show enthusiasm.** Some ~~psychopaths~~ people like the exercise and have natural charisma, the rest of us need to put extra energy in this kind of exercise. You need to show that you're someone people like to work with, even if this 10 minutes interview with a recruiter is the stupidest way to assess than.

One extra tip. If you can, and especially for remote jobs, invest in your personnal work environment. Good lighting, image and sound, a clean desk, something that look like a room dedicated to work will put you in the "serious candidate" tier before the interview has even started.

## The coding interview

Algorithm and data structures revisions aka Leetcode grinding is not necessary anymore. Hard DP or tricky puzzle questions are even less likely than it already was 5 years ago. Expect questions involving real-world logic, concurrency, race conditions and simple data structures like strings and hash maps.

## System design

In the age of agentic coding, this kind of interview takes a larger space. Since everybody is crazy about AI you will very likely encounter questions around LLM integrations, failure modes, RAG pipelines, scaling AI models, etc.
You're supposed to explain tradeoffs, identify bottlenecks, have a sense of throughput and latency expectations for the whole system and go deep into one component by yourself.
