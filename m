From: Oliver Upton <oliver.upton@linux.dev>
Date: Fri, 1 Nov 2024 08:38:48 -0700
Subject: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <ZyTpwwm0s89iU9Pk@google.com>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
Message-ID: <ZyT2CB6zodtbWEI9@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

On Fri, Nov 01, 2024 at 07:48:00AM -0700, Sean Christopherson wrote:
> On Fri, Nov 01, 2024, Mark Brown wrote:
> > On Wed, Oct 09, 2024 at 08:49:42AM -0700, Sean Christopherson wrote:
> > > Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> > > a pointer to storage, as none of the vcpu_get_reg() usage in KVM selftests
> > > accesses a register larger than 64 bits, and vcpu_set_reg() only accepts a
> > > 64-bit value.  If a use case comes along that needs to get a register that
> > > is larger than 64 bits, then a utility can be added to assert success and
> > > take a void pointer, but until then, forcing an out param yields ugly code
> > > and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg().
> > 
> > This commit, which is in today's -next as 5c6c7b71a45c9c, breaks the
> > build on arm64:
> > 
> > aarch64/psci_test.c: In function ?host_test_system_off2?:
> > aarch64/psci_test.c:247:9: error: too many arguments to function ?vcpu_get_reg?
> >   247 |         vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION, &psci_version);
> >       |         ^~~~~~~~~~~~
> > In file included from aarch64/psci_test.c:18:
> > include/kvm_util.h:705:24: note: declared here
> >   705 | static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
> >       |                        ^~~~~~~~~~~~
> > At top level:
> > cc1: note: unrecognized command-line option ?-Wno-gnu-variable-sized-type-not-at
> > -end? may have been intended to silence earlier diagnostics
> > 
> > since the updates done to that file did not take account of 72be5aa6be4
> > ("KVM: selftests: Add test for PSCI SYSTEM_OFF2") which has been merged
> > in the kvm-arm64 tree.
> 
> Bugger.  In hindsight, it's obvious that of course arch selftests would add usage
> of vcpu_get_reg().
> 
> Unless someone has a better idea, I'll drop the series from kvm-x86, post a new
> version that applies on linux-next, and then re-apply the series just before the
> v6.13 merge window (rinse and repeat as needed if more vcpu_get_reg() users come
> along).

Can you instead just push out a topic branch and let the affected
maintainers deal with it? This is the usual way we handle conflicts
between trees...

> That would be a good oppurtunity to do the $(ARCH) directory switch[*] too, e.g.
> have a "selftests_late" or whatever topic branch.

The right time to do KVM-wide changes (even selftests) is *early* in the
development cycle, not last minute. It gives us plenty of time to iron out
the wrinkles.

> Sorry for the pain Mark, you've been playing janitor for us too much lately.

+1, appreciate your help on this.

-- 
Thanks,
Oliver

