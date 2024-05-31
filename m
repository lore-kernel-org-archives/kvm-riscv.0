From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 31 May 2024 11:41:14 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
In-Reply-To: <CAOUHufb_-w=B+NfHAUAo=O8bDXZBdXeeGRZD6kY=krN07srbGA@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com>
 <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com>
 <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
 <Zll2ILUNWE-JPi9U@linux.dev>
 <CAOUHufb_-w=B+NfHAUAo=O8bDXZBdXeeGRZD6kY=krN07srbGA@mail.gmail.com>
Message-ID: <ZloZysAPL0ePk3bY@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 31, 2024 at 10:45:04AM -0600, Yu Zhao wrote:
> On Fri, May 31, 2024 at 1:03?AM Oliver Upton <oliver.upton@linux.dev> wrote:
> >
> > On Fri, May 31, 2024 at 12:05:48AM -0600, Yu Zhao wrote:
> 
> Let me add back what I said earlier:
> 
>   I'm not convinced, but it doesn't mean your point of view is
>   invalid. If you fully understand the implications of your design
>   choice and document them, I will not object.

Thanks, I appreciate the sentiment. Hopefully we can align here.

> > > All optimizations in v2 were measured step by step. Even that bitmap,
> > > which might be considered overengineered, brought a readily
> > > measuarable 4% improvement in memcached throughput on Altra Max
> > > swapping to Optane:
> >
> > That's great, but taking an iterative approach to the problem allows
> > the reviewers and maintainers to come to their own conclusions about
> > each optimization independently. Squashing all of that together and
> > posting the result doesn't allow for this.
> 
> That's your methodology, which I respect: as I said I won't stand in your way.
> 
> But mine is backed by data, please do respect that as well,

Data is useful and expected for changes that aim to improve the
performance of a system in one way or another. That is, after all, the
sole intention of the work, no?

What I'm also looking for is a controlled experiment, where a single
independent variable (e.g. locking) can be evaluated against the
baseline. All-or-nothing data has limited usefulness.

> by doing what I asked: document your justifications.

The justification for a series is against the upstream tree, not some
out-of-tree stuff. The cover letter explicitly calls out the decision
to simplify the patch series along with performance data I can reproduce
on my own systems.

This is a perfect example of how to contribute changes upstream.

> > > What I don't think is acceptable is simplifying those optimizations
> > > out without documenting your justifications (I would even call it a
> > > design change, rather than simplification, from v3 to v4).
> >
> > No, sorry, there's nothing wrong with James' approach here.
> 
> Sorry, are you saying "without documenting your justifications" is
> nothing wrong? If so, please elaborate.

As I mentioned above, the reasoning is adequately documented and the
discussion that led to v4 is public. OTOH...

> > The discussion that led to the design of v4 happened on list; you were
> > on CC. The general consensus on the KVM side was that the bitmap was
> > complicated and lacked independent justification. There was ample
> > opportunity to voice your concerns before he spent the time on v4.
> 
> Please re-read my previous emails -- I never object to the removal of
> the bitmap or James' approach.
> 
> And please stop making assumptions -- I did voice my concerns with
> James privately.
        ^~~~~~~~~

If it happened in private then its no better than having said nothing at
all.

Please, keep the conversation on-list next time so we can iron out any
disagreements there. Otherwise contributors are put in a *very* awkward
situation of mediating the on- and off-list dialogue.

> > You seriously cannot fault a contributor for respinning their work based
> > on the provided feedback.
> 
> Are you saying I faulted James for taking others' feedback?

No. Sufficient justification is captured in the public review feedback +
series cover letter. Your statement that the approach was changed without
justification is unsubstantiated.

> Also what do you think about the technical flaws and inaccurate
> understandings I pointed out? You seem to have a strong opinion on
> your iterate approach, but I hope you didn't choose to overlook the
> real meat of this discussion.

Serious question: are you not receiving my mail or something?

I re-raised my question to you from ages ago about locking on the arm64
MMU. You didn't answer last time, I'd appreciate a reply this time
around.

Otherwise I couldn't be bothered about the color of the Kconfig bikeshed
and don't have anything meaningful to add there. I think the three of
you are trending in the right direction.

-- 
Thanks,
Oliver

