From: Marc Zyngier <maz@kernel.org>
Date: Tue, 16 Nov 2021 15:55:11 +0000
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <87y25onsj6.fsf@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
 <a5cdff6878b7157587e92ebe4d5af362@kernel.org>
 <875ysxg0s1.fsf@redhat.com> <87k0hd8obo.wl-maz@kernel.org>
 <ad3534bc-fe3a-55f5-b022-4dbec5f29798@redhat.com>
 <87y25onsj6.fsf@redhat.com>
Message-ID: <875yss859c.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 16 Nov 2021 13:23:25 +0000,
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 11/12/21 15:02, Marc Zyngier wrote:
> >>> I'd like KVM to be consistent across architectures and have the same
> >>> (similar) meaning for KVM_CAP_NR_VCPUS.
> >> Sure, but this is a pretty useless piece of information anyway. As
> >> Andrew pointed out, the information is available somewhere else, and
> >> all we need to do is to cap it to the number of supported vcpus, which
> >> is effectively a KVM limitation.
> >> 
> >> Also, we are talking about representing the architecture to userspace.
> >> No amount of massaging is going to make an arm64 box look like an x86.
> >
> > Not sure what you mean?  The API is about providing a piece of 
> > information independent of the architecture, while catering for a ppc 
> > weirdness.  Yes it's mostly useless if you don't care about ppc, but 
> > it's not about making arm64 look like x86 or ppc; it's about not having 
> > to special case ppc in userspace.
> >
> > If anything, if KVM_CAP_NR_VCPUS returns the same for kvm and !kvm, then 
> > *that* is making an arm64 box look like an x86.  On ARM the max vCPUs 
> > depends on VM's GIC configuration, so KVM_CAP_NR_VCPUS should take that 
> > into account.
> 
> (I'm about to send v2 as we have s390 sorted out.)
> 
> So what do we decide about ARM? 

[...]

> - Always kvm_arm_default_max_vcpus to make the output independent on 'if
>  (kvm)'.

This. Between two useless numbers, I prefer the one that doesn't
introduce any userspace visible changes.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

