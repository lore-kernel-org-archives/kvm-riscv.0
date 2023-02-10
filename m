From: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Feb 2023 01:27:59 +0000
Subject: [PATCH v2 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <86o7q4zdcp.wl-maz@kernel.org>
References: <20230126184025.2294823-1-dmatlack@google.com>
 <20230126184025.2294823-3-dmatlack@google.com>
 <86o7q4zdcp.wl-maz@kernel.org>
Message-ID: <Y+Wdn+mYVYhwut5l@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 08, 2023, Marc Zyngier wrote:
> On Thu, 26 Jan 2023 18:40:20 +0000, David Matlack <dmatlack@google.com> wrote:
> > @@ -368,7 +367,6 @@ void kvm_flush_remote_tlbs(struct kvm *kvm)
> >  		++kvm->stat.generic.remote_tlb_flush;
> >  }
> 
> For context, we currently have this:
> 
> 	if (!kvm_arch_flush_remote_tlb(kvm)
> 	    || kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH))
> 		++kvm->stat.generic.remote_tlb_flush;
> 
> Is there any reason why we shouldn't move the KVM_REQ_TLB_FLUSH call
> into the arch-specific helpers? This is architecture specific, even if
> the majority of the supported architecture cannot do broadcast
> invalidation like arm64 does.

s390 and PPC don't implement kvm_arch_flush_remote_tlb() at all, forcing them to
implement the function just to implement what everyone except ARM does doesn't
seem like the right trade off.

As usual, x86 is the real oddball.  All other architectures either use the purely
generic KVM_REQ_TLB_FLUSH or they don't.  x86 is the only one that sometimes wants
to fallback.  I can't see a clean way around that though, especially since MIPS
apparently needs a notification _and_ a generic flush.

Can the ARM hook be inlined?  That would eliminate the extra call and should allow
the compiler to optimize out the conditional and the request.

