From: Marc Zyngier <maz@kernel.org>
Date: Tue, 20 Sep 2022 17:08:13 +0100
Subject: [PATCH kernel v2] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE support platform dependent
In-Reply-To: <20220920125143.28009-1-aik@ozlabs.ru>
References: <20220920125143.28009-1-aik@ozlabs.ru>
Message-ID: <874jx2kp02.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Sep 2022 13:51:43 +0100,
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> 
> When introduced, IRQFD resampling worked on POWER8 with XICS. However
> KVM on POWER9 has never implemented it - the compatibility mode code
> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> XIVE mode does not handle INTx in KVM at all.
> 
> This moved the capability support advertising to platforms and stops
> advertising it on XIVE, i.e. POWER9 and later.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Acked-by: Nicholas Piggin <npiggin@gmail.com>
> [For KVM RISC-V]
> Acked-by: Anup Patel <anup@brainfault.org>
> ---
> Changes:
> v2:
> * removed ifdef for ARM64.

The same argument applies to both x86 and s390, which do select
HAVE_KVM_IRQFD from the KVM config option. Only power allows this
option to be selected depending on the underlying interrupt controller
emulation.

As for riscv and mips, they don't select HAVE_KVM_IRQFD, and this
isn't a user-selectable option. So why do they get patched at all?

My conclusion is that:

- only power needs the #ifdefery in the arch-specific code
- arm64, s390 and x86 can use KVM_CAP_IRQFD_RESAMPLE without a #ifdef
- mips and riscv should be left alone

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

