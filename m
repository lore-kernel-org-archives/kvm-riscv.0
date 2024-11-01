From: Sean Christopherson <seanjc@google.com>
Date: Fri, 1 Nov 2024 09:16:42 -0700
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <ZyT9rSnLcDWkWoL_@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com> <ZyT9rSnLcDWkWoL_@linux.dev>
Message-ID: <ZyT-6iCNlA1VSAV3@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > > Can you instead just push out a topic branch and let the affected
> > > maintainers deal with it? This is the usual way we handle conflicts
> > > between trees...
> > 
> > That'd work too, but as you note below, doing that now throws a wrench in things
> > because essentially all arch maintainers would need merge that topic branch,
> > otherwise linux-next would end up in the same state.
> 
> TBH, I'm quite happy with that. Recent history has not been particularly
> convinincing to me that folks are actually testing arm64, let alone
> compiling for it when applying selftests patches.

FWIW, I did compile all patches on all KVM architectures, including selftests.
But my base obviously didn't include the kvm-arm64 branch :-/

One thing I'll add to my workflow would be to do a local merge (and smoke test)
of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
this cycle where such a sanity check would have saved me and others a bit of pain.

https://lore.kernel.org/all/20241101153857.GAZyT2EdLXKs7ZmDFx at fat_crate.local

