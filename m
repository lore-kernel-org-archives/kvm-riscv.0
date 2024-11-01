From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 1 Nov 2024 09:11:25 -0700
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <ZyT61FF0-g8gKZfc@google.com>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
 <ZyT61FF0-g8gKZfc@google.com>
Message-ID: <ZyT9rSnLcDWkWoL_@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > Can you instead just push out a topic branch and let the affected
> > maintainers deal with it? This is the usual way we handle conflicts
> > between trees...
> 
> That'd work too, but as you note below, doing that now throws a wrench in things
> because essentially all arch maintainers would need merge that topic branch,
> otherwise linux-next would end up in the same state.

TBH, I'm quite happy with that. Recent history has not been particularly
convinincing to me that folks are actually testing arm64, let alone
compiling for it when applying selftests patches.

Otherwise, the alternative of respinning the global change for every -next
breakage adds a decent amount of toil and gives the wrong impression of how
long our patches have actually been baking in -next.

> > > That would be a good oppurtunity to do the $(ARCH) directory switch[*] too, e.g.
> > > have a "selftests_late" or whatever topic branch.
> > 
> > The right time to do KVM-wide changes (even selftests) is *early* in the
> > development cycle, not last minute. It gives us plenty of time to iron out
> > the wrinkles.
> 
> Yeah, that was the original plan, then the stupid strict aliasing bug happened,
> and I honestly forgot the vcpu_get_reg() changes would need to be consumed by
> other architectures.
> 
> Other than letting me forget about this mess a few weeks earlier, there's no
> good reason to force this into 6.13.  So, I'll drop the series from 6.13, post
> new versions of the this and the $(ARCH) series just before the merge window,
> and then either send a pull request to Paolo for 6.14 as soon as the 6.13 merge
> window closes, or ask/bribe Paolo to apply everything directly.

Sounds good, punting to 6.14 seems reasonable.

-- 
Thanks,
Oliver

