From: Gowans, James <jgowans@amazon.com>
Date: Mon, 11 Dec 2023 18:47:50 +0000
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to hook
 restart/shutdown
In-Reply-To: <ZXdIIBUXcCIK28ys@google.com>
References: <20230512233127.804012-1-seanjc@google.com>
	 <20230512233127.804012-2-seanjc@google.com>
	 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	 <ZXdIIBUXcCIK28ys@google.com>
Message-ID: <55ef5cbf44bb73030d6387aa181393b8cb044f77.camel@amazon.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2023-12-11 at 09:34 -0800, Sean Christopherson wrote:
> On Sat, Dec 09, 2023, James Gowans wrote:
> > Thoughts on possible ways to fix this:
> > a) go back to reboot notifiers
> > b) get kexec to call syscore_shutdown() to invoke all of these callbacks
> > c) Add a KVM-specific callback to native_machine_shutdown(); we only
> > need this for Intel x86, right?
> 
> I don't like (c).  VMX is the most sensitive/problematic, e.g. the whole blocking
> of INIT thing, but SVM can also run afoul of EFER.SVME being cleared, and KVM really
> should leave virtualization enabled across kexec(), even if leaving virtualization
> enabled is relatively benign on other architectures.

Good to know. Agreed that clean shutdown in all cases is best and we
discard (c).
> 
> One more option would be:
> 
>  d) Add another sycore hook, e.g. syscore_kexec() specifically for this path.
> 
> > My slight preference is towards adding syscore_shutdown() to kexec, but
> > I'm not sure that's feasible. Adding kexec maintainers for input.
> 
> In a vacuum, that'd be my preference too.  It's the obvious choice IMO, e.g. the
> kexec_image->preserve_context path does syscore_suspend() (and then resume(), so
> it's not completely uncharted territory.
> 
> However, there's a rather big wrinkle in that not all of the existing .shutdown()
> implementations are obviously ok to call during kexec.  Luckily, AFAICT there are
> very few users of the syscore .shutdown hook, so it's at least feasible to go that
> route.
> 
> x86's mce_syscore_shutdown() should be ok, and arguably is correct, e.g. I don't
> see how leaving #MC reporting enabled across kexec can work.
> 
> ledtrig_cpu_syscore_shutdown() is also likely ok and arguably correct.

I like your observation here that we probably have other misses like MCE
which should be shut down too - that's a hint that adding
syscore_shutdown() to kexec is the way to go.

> 
> The interrupt controllers though?  x86 disables IRQs at the very beginning of
> machine_kexec(), so it's likely fine.  But every other architecture?  No clue.
> E.g. PPC's default_machine_kexec() sends IPIs to shutdown other CPUs, though I
> have no idea if that can run afoul of any of the paths below.
> 
>         arch/powerpc/platforms/cell/spu_base.c  .shutdown = spu_shutdown,
>         arch/x86/kernel/cpu/mce/core.c          .shutdown = mce_syscore_shutdown,
>         arch/x86/kernel/i8259.c                 .shutdown = i8259A_shutdown,
>         drivers/irqchip/irq-i8259.c             .shutdown = i8259A_shutdown,
>         drivers/irqchip/irq-sun6i-r.c           .shutdown = sun6i_r_intc_shutdown,
>         drivers/leds/trigger/ledtrig-cpu.c      .shutdown = ledtrig_cpu_syscore_shutdown,
>         drivers/power/reset/sc27xx-poweroff.c   .shutdown = sc27xx_poweroff_shutdown,
>         kernel/irq/generic-chip.c               .shutdown = irq_gc_shutdown,
>         virt/kvm/kvm_main.c                     .shutdown = kvm_shutdown,
> 
> The whole thing is a bit of a mess.  E.g. x86 treats machine_shutdown() from
> kexec pretty much the same as shutdown for reboot, but other architectures have
> what appear to be unique paths for handling kexec.
> 
> FWIW, if we want to go with option (b), syscore_shutdown() hooks could use
> kexec_in_progress to differentiate between "regular" shutdown/reboot and kexec.

Yeah, perhaps that's the best: add syscore_shutdown to kexec and get the
callers to handle both cases if necessary. We could get maintainers for
all of these drivers to sign off on the change and say whether they need
to differentiate between kexec and reboot.

Eric, what are your thoughts on this approach? I can try to whip up a
patch for this and add the maintainers for all of the drivers.

JG

