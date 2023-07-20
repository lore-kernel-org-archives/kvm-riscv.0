From: Yuan Yao <yuan.yao@linux.intel.com>
Date: Thu, 20 Jul 2023 09:15:41 +0800
Subject: [RFC PATCH v11 05/29] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
 CONFIG_KVM_GENERIC_MMU_NOTIFIER
In-Reply-To: <ZLfv7aRq5W52ezek@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-6-seanjc@google.com>
 <20230719073115.vuedo2cf3mp27xm4@yy-desk-7060>
 <ZLfv7aRq5W52ezek@google.com>
Message-ID: <20230720011541.6ti5sygwwfwko6ab@yy-desk-7060>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 19, 2023 at 07:15:09AM -0700, Sean Christopherson wrote:
> On Wed, Jul 19, 2023, Yuan Yao wrote:
> > On Tue, Jul 18, 2023 at 04:44:48PM -0700, Sean Christopherson wrote:
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 90a0be261a5c..d2d3e083ec7f 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -255,7 +255,9 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
> > >  int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
> > >  #endif
> > >
> > > -#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
> > > +struct kvm_gfn_range;
> >
> > Not sure why a declaration here, it's defined for ARCHs which defined
> > KVM_ARCH_WANT_MMU_NOTIFIER before.
>
> The forward declaration exists to handle cases where CONFIG_KVM=n, specifically
> arch/powerpc/include/asm/kvm_ppc.h's declaration of hooks to forward calls to
> uarch modules:
>
> 	bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 	bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>
> Prior to using a Kconfig, a forward declaration wasn't necessary because
> arch/powerpc/include/asm/kvm_host.h would #define KVM_ARCH_WANT_MMU_NOTIFIER even
> if CONFIG_KVM=n.
>
> Alternatively, kvm_ppc.h could declare the struct.  I went this route mainly to
> avoid the possibility of someone encountering the same problem on a different
> architecture.

Ah I see, thanks for your explanation!

