From: Sean Christopherson <seanjc@google.com>
Date: Mon, 11 Dec 2023 09:34:24 -0800
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to
 hook restart/shutdown
In-Reply-To: <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
References: <20230512233127.804012-1-seanjc@google.com> <20230512233127.804012-2-seanjc@google.com>
 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
Message-ID: <ZXdIIBUXcCIK28ys@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Dec 09, 2023, James Gowans wrote:
> Hi Sean,
> 
> Blast from the past but I've just been bitten by this patch when
> rebasing across v6.4.
> 
> On Fri, 2023-05-12 at 16:31 -0700, Sean Christopherson wrote:
> > Use syscore_ops.shutdown to disable hardware virtualization during a
> > reboot instead of using the dedicated reboot_notifier so that KVM disables
> > virtualization _after_ system_state has been updated.? This will allow
> > fixing a race in KVM's handling of a forced reboot where KVM can end up
> > enabling hardware virtualization between kernel_restart_prepare() and
> > machine_restart().
> 
> The issue is that, AFAICT, the syscore_ops.shutdown are not called when
> doing a kexec. Reboot notifiers are called across kexec via:
> 
> kernel_kexec
>   kernel_restart_prepare
>     blocking_notifier_call_chain
>       kvm_reboot
> 
> So after this patch, KVM is not shutdown during kexec; if hardware virt
> mode is enabled then the kexec hangs in exactly the same manner as you
> describe with the reboot.
> 
> Some specific shutdown callbacks, for example IOMMU, HPET, IRQ, etc are
> called in native_machine_shutdown, but KVM is not one of these.
> 
> Thoughts on possible ways to fix this:
> a) go back to reboot notifiers
> b) get kexec to call syscore_shutdown() to invoke all of these callbacks
> c) Add a KVM-specific callback to native_machine_shutdown(); we only
> need this for Intel x86, right?

I don't like (c).  VMX is the most sensitive/problematic, e.g. the whole blocking
of INIT thing, but SVM can also run afoul of EFER.SVME being cleared, and KVM really 
should leave virtualization enabled across kexec(), even if leaving virtualization
enabled is relatively benign on other architectures.

One more option would be:

 d) Add another sycore hook, e.g. syscore_kexec() specifically for this path.

> My slight preference is towards adding syscore_shutdown() to kexec, but
> I'm not sure that's feasible. Adding kexec maintainers for input.

In a vacuum, that'd be my preference too.  It's the obvious choice IMO, e.g. the
kexec_image->preserve_context path does syscore_suspend() (and then resume(), so
it's not completely uncharted territory.

However, there's a rather big wrinkle in that not all of the existing .shutdown()
implementations are obviously ok to call during kexec.  Luckily, AFAICT there are
very few users of the syscore .shutdown hook, so it's at least feasible to go that
route.

x86's mce_syscore_shutdown() should be ok, and arguably is correct, e.g. I don't
see how leaving #MC reporting enabled across kexec can work.

ledtrig_cpu_syscore_shutdown() is also likely ok and arguably correct.

The interrupt controllers though?  x86 disables IRQs at the very beginning of
machine_kexec(), so it's likely fine.  But every other architecture?  No clue.
E.g. PPC's default_machine_kexec() sends IPIs to shutdown other CPUs, though I
have no idea if that can run afoul of any of the paths below.

        arch/powerpc/platforms/cell/spu_base.c  .shutdown = spu_shutdown,
        arch/x86/kernel/cpu/mce/core.c	        .shutdown = mce_syscore_shutdown,
        arch/x86/kernel/i8259.c                 .shutdown = i8259A_shutdown,
        drivers/irqchip/irq-i8259.c	        .shutdown = i8259A_shutdown,
        drivers/irqchip/irq-sun6i-r.c	        .shutdown = sun6i_r_intc_shutdown,
        drivers/leds/trigger/ledtrig-cpu.c	.shutdown = ledtrig_cpu_syscore_shutdown,
        drivers/power/reset/sc27xx-poweroff.c	.shutdown = sc27xx_poweroff_shutdown,
        kernel/irq/generic-chip.c	        .shutdown = irq_gc_shutdown,
        virt/kvm/kvm_main.c	                .shutdown = kvm_shutdown,

The whole thing is a bit of a mess.  E.g. x86 treats machine_shutdown() from
kexec pretty much the same as shutdown for reboot, but other architectures have
what appear to be unique paths for handling kexec.

FWIW, if we want to go with option (b), syscore_shutdown() hooks could use
kexec_in_progress to differentiate between "regular" shutdown/reboot and kexec.

