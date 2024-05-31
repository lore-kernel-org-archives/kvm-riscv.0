From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 31 May 2024 00:02:56 -0700
Subject: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs
 participate in aging
In-Reply-To: <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com>
 <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com>
 <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
 <Zley-u_dOlZ-S-a6@google.com>
 <CADrL8HXHWg_MkApYQTngzmN21NEGNWC6KzJDw_Lm63JHJkR=5A@mail.gmail.com>
 <CAOUHufZq6DwpStzHtjG+TOiHaQ6FFbkTfHMCe8Yy0n_M9MKdqw@mail.gmail.com>
Message-ID: <Zll2ILUNWE-JPi9U@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 31, 2024 at 12:05:48AM -0600, Yu Zhao wrote:

[...]

> All optimizations in v2 were measured step by step. Even that bitmap,
> which might be considered overengineered, brought a readily
> measuarable 4% improvement in memcached throughput on Altra Max
> swapping to Optane:

That's great, but taking an iterative approach to the problem allows
the reviewers and maintainers to come to their own conclusions about
each optimization independently. Squashing all of that together and
posting the result doesn't allow for this.

Even if we were to take the series as-is, the door is wide open to
subsequent improvements.

> What I don't think is acceptable is simplifying those optimizations
> out without documenting your justifications (I would even call it a
> design change, rather than simplification, from v3 to v4).

No, sorry, there's nothing wrong with James' approach here.

The discussion that led to the design of v4 happened on list; you were
on CC. The general consensus on the KVM side was that the bitmap was
complicated and lacked independent justification. There was ample
opportunity to voice your concerns before he spent the time on v4.

You seriously cannot fault a contributor for respinning their work based
on the provided feedback.

-- 
Thanks,
Oliver

