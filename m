From: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Jul 2023 14:50:07 -0700
Subject: [PATCH v7 02/12] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <87tttpr6qy.wl-maz@kernel.org>
References: <20230722022251.3446223-1-rananta@google.com> <20230722022251.3446223-3-rananta@google.com>
 <87tttpr6qy.wl-maz@kernel.org>
Message-ID: <ZMgsjx8dwKd4xBGe@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 27, 2023, Marc Zyngier wrote:
> On Sat, 22 Jul 2023 03:22:41 +0100,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> > 
> > Stop depending on CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL and opt to
> > standardize on kvm_arch_flush_remote_tlbs() since it avoids
> > duplicating the generic TLB stats across architectures that implement
> > their own remote TLB flush.
> > 
> > This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> > path, but that is a small cost in comparison to flushing remote TLBs.
> 
> Well, there is no such thing as a "remote TLB" anyway. We either have
> a non-shareable or inner-shareable invalidation. The notion of remote
> would imply that we track who potentially has a TLB, which we
> obviously don't.

Maybe kvm_arch_flush_vm_tlbs()?  The "remote" part is misleading even on x86 when
running on Hyper-V, as the flush may be done via a single hypercall and by kicking
"remote" vCPUs.

