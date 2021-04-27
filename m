From: Paul Walmsley <paul.walmsley@sifive.com>
Date: Mon, 26 Apr 2021 22:43:18 -0700 (PDT)
Subject: [PATCH v16 00/17] KVM RISC-V Support
In-Reply-To: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
References: <mhng-d64da1be-bacd-4885-aaf2-fea3c763418c@palmerdabbelt-glaptop>
Message-ID: <5b988c4e-25e9-f2b9-b08d-35bc37a245e4@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 9 Apr 2021, Palmer Dabbelt wrote:

> On Wed, 31 Mar 2021 02:21:58 PDT (-0700), pbonzini at redhat.com wrote:
> 
> > Palmer, are you okay with merging RISC-V KVM?  Or should we place it in
> > drivers/staging/riscv/kvm?
> 
> I'm certainly ready to drop my objections to merging the code based on 
> it targeting a draft extension, but at a bare minimum I want to get a 
> new policy in place that everyone can agree to for merging code.  I've 
> tried to draft up a new policy a handful of times this week, but I'm not 
> really quite sure how to go about this: ultimately trying to build 
> stable interfaces around an unstable ISA is just a losing battle.  I've 
> got a bunch of stuff going on right now, but I'll try to find some time 
> to actually sit down and finish one.
> 
> I know it might seem odd to complain about how slowly things are going 
> and then throw up another roadblock, but I really do think this is a 
> very important thing to get right.  I'm just not sure how we're going to 
> get anywhere with RISC-V without someone providing stability, so I want 
> to make sure that whatever we do here can be done reliably.  If we don't 
> I'm worried the vendors are just going to go off and do their own 
> software stacks, which will make getting everyone back on the same page 
> very difficult.

I sympathize with Paolo, Anup, and others also.  Especially Anup, who has 
been updating and carrying the hypervisor patches for a long time now.  
And also Greentime, who has been carrying the V extension patches.  The 
RISC-V hypervisor specification, like several other RISC-V draft 
specifications, is taking longer to transition to the officially "frozen" 
stage than almost anyone in the RISC-V community would like.

Since we share this frustration, the next questions are: 

- What are the root causes of the problem?  

- What's the right forum to address the root causes?

To me, the root causes of the problems described in this thread aren't 
with the arch/riscv kernel maintenance guidelines, but rather with the 
RISC-V specification process itself.  And the right forum to address 
issues with the RISC-V specification process is with RISC-V International 
itself: the mailing lists, the participants, and the board of directors.  
Part of the challenge -- not simply with RISC-V, but with the Linux kernel 
or any other community -- is to ensure that incentives (and disincentives) 
are aligned with the appropriately responsible parts of the community.  
And when it comes to specification development, the right focus to align 
those incentives and disincentives is on RISC-V International.

The arch/riscv patch acceptance guidelines are simply intended to ensure 
that the definition of what is and isn't RISC-V remains clear and 
unambiguous.  Even though the guidelines can result in short-term pain, 
the intention is to promote long-term stability and sustainable 
maintainability - particularly since the specifications get baked into 
hardware.  We've observed that attempting to chase draft specifications 
can cause significant churn: for example, the history of the RISC-V vector 
specification illustrates how a draft extension can undergo major, 
unexpected revisions throughout its journey towards ratification.  One of 
our responsibilities as kernel developers is to minimize that churn - not 
simply for our own sanity, or for the usability of RISC-V, but to ensure 
that we remain members in good standing of the broader kernel community.  
Those of us who were around for the ARM32 and ARM SoC kernel accelerando 
absorbed strong lessons in maintainability, and I doubt anyone here is 
interested in re-learning those the hard way.

RVI states that the association is open to community participation.  The 
organizations that have joined RVI, I believe, have a strong stake in the 
health of the RISC-V ecosystem, just as the folks have here in this 
discussion.  If the goal really is to get quality specifications out the 
door faster, then let's focus the energy towards building consensus 
towards improving the process at RISC-V International.  If that's 
possible, the benefits won't only accrue to Linux developers, but to the 
entire RISC-V hardware and software development community at large.  If 
nothing else, it will be an interesting test of whether RISC-V 
International can take action to address these concerns and balance them 
with those of other stakeholders in the process.


- Paul

