From: Marc Zyngier <maz@kernel.org>
Date: Wed, 21 Sep 2022 18:04:07 +0100
Subject: [PATCH kernel v2] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE support platform dependent
In-Reply-To: <02490d2a-5e89-f342-f5b3-386406ffb2ea@ozlabs.ru>
References: <20220920125143.28009-1-aik@ozlabs.ru>
	<874jx2kp02.wl-maz@kernel.org>
	<02490d2a-5e89-f342-f5b3-386406ffb2ea@ozlabs.ru>
Message-ID: <87r104k6bc.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Sep 2022 22:46:21 +0100,
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> 
> 
> 
> On 21/09/2022 02:08, Marc Zyngier wr
> ote:
> > On Tue, 20 Sep 2022 13:51:43 +0100,
> > Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >> 
> >> When introduced, IRQFD resampling worked on POWER8 with XICS. However
> >> KVM on POWER9 has never implemented it - the compatibility mode code
> >> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> >> XIVE mode does not handle INTx in KVM at all.
> >> 
> >> This moved the capability support advertising to platforms and stops
> >> advertising it on XIVE, i.e. POWER9 and later.
> >> 
> >> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >> Acked-by: Nicholas Piggin <npiggin@gmail.com>
> >> [For KVM RISC-V]
> >> Acked-by: Anup Patel <anup@brainfault.org>
> >> ---
> >> Changes:
> >> v2:
> >> * removed ifdef for ARM64.
> > 
> > The same argument applies to both x86 and s390, which do select
> > HAVE_KVM_IRQFD from the KVM config option. Only power allows this
> > option to be selected depending on the underlying interrupt controller
> > emulation.
> > 
> > As for riscv and mips, they don't select HAVE_KVM_IRQFD, and this
> > isn't a user-selectable option. So why do they get patched at all?
> 
> Before the patch, the capability was advertised on those, with your
> proposal it will stop.

No, they were never advertised, since none of these architectures
select CONFIG_HAVE_KVM_IRQFD, and this option is not selectable by the
user.

> Which is a change in behavior which some may
> say requires a separate patch (like, one per platform). I am
> definitely overthinking it though and you are right.

Well, either there is no change in behaviour (and therefore I am
right), or there is one (and I am wrong).

	M.

-- 
Without deviation from the norm, progress is not possible.

