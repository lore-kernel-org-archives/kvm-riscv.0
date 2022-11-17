From: Huang, Kai <kai.huang@intel.com>
Date: Thu, 17 Nov 2022 01:39:23 +0000
Subject: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
In-Reply-To: <Y3UZtoIidMyE8qVz@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-39-seanjc@google.com>
	 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
	 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
	 <Y3PzhANShVlTXVg1@google.com>
	 <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
	 <Y3UZtoIidMyE8qVz@google.com>
Message-ID: <7fb66c497b6c41049167b05c63267cbc301b1c20.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-16 at 17:11 +0000, Sean Christopherson wrote:
> On Wed, Nov 16, 2022, Huang, Kai wrote:
> > On Tue, 2022-11-15 at 20:16 +0000, Sean Christopherson wrote:
> > > On Thu, Nov 10, 2022, Huang, Kai wrote:
> > > > On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > > Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> > > > happens on all online cpus when loading KVM.  For this case, IRQ is disabled and
> > > > cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_active() is
> > > > false.
> > > 
> > > Actually, you're right (and wrong).  You're right in that the WARN is flawed.  And
> > > the reason for that is because you're wrong about the hotplug case.  In this version
> > > of things, the compatibility checks are routed through hardware enabling, i.e. this
> > > flow is used only when loading KVM.  This helper should only be called via SMP function
> > > call, which means that IRQs should always be disabled.
> > 
> > Did you mean below code change in later patch "[PATCH 39/44] KVM: Drop
> > kvm_count_lock and instead protect kvm_usage_count with kvm_lock"?
> > 
> >  	/*
> >  	 * Abort the CPU online process if hardware virtualization cannot
> >  	 * be enabled. Otherwise running VMs would encounter unrecoverable
> > @@ -5039,13 +5039,16 @@ static int kvm_online_cpu(unsigned int cpu)
> >  	if (kvm_usage_count) {
> >  		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> >  
> > +		local_irq_save(flags);
> >  		hardware_enable_nolock(NULL);
> > +		local_irq_restore(flags);
> 
> Sort of.  What I was saying is that in this v1, the compatibility checks that are
> done during harware enabling are initiated from vendor code, i.e. VMX and SVM call
> {svm,vmx}_check_processor_compat() directly.  As a result, the compat checks that
> are handled in common code:
> 
> 	if (__cr4_reserved_bits(cpu_has, c) !=
> 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
> 		return -EIO;
> 
> are skipped.  And if that's fixed, then the above hardware_enable_nolock() call
> will bounce through kvm_x86_check_processor_compatibility() with IRQs enabled
> once the KVM hotplug hook is moved to the ONLINE section.

Oh I see.  So you still want the kvm_x86_ops->check_processor_compatibility(),
in order to avoid duplicating the above code in SVM and VMX.

> 
> As above, the simple "fix" would be to disable IRQs, but that's not actually
> necessary.  The only requirement is that preemption is disabled so that the checks
> are done on the current CPU. ?
> 

Probably even preemption is allowed, as long as the compatibility check is not
scheduled to another cpu.


> The "IRQs disabled" check was a deliberately
> agressive WARN that was added to guard against doing compatibility checks from
> the "wrong" location.
> 
> E.g. this is what I ended up with for a changelog to drop the irqs_disabled()
> check and for the end code (though it's not tested yet...)
> 
>     Drop kvm_x86_check_processor_compatibility()'s WARN that IRQs are
>     disabled, as the ONLINE section runs with IRQs disabled.  The WARN wasn't
						     ^
						     enabled.

>     intended to be a requirement, e.g. disabling preemption is sufficient,
>     the IRQ thing was purely an aggressive sanity check since the helper was
>     only ever invoked via SMP function call.
> 
> 
> static int kvm_x86_check_processor_compatibility(void)
> {
>         int cpu = smp_processor_id();
>         struct cpuinfo_x86 *c = &cpu_data(cpu);
> 
>         /*
>          * Compatibility checks are done when loading KVM and when enabling
>          * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
>          * compatible, i.e. KVM should never perform a compatibility check on
>          * an offline CPU.
>          */
>         WARN_ON(!cpu_online(cpu));

Looks good to me.  Perhaps this also can be removed, though.

And IMHO the removing of WARN_ON(!irq_disabled()) should be folded to the patch
"[PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section". 
Because moving from STARTING section to ONLINE section changes the IRQ status
when the compatibility check is called.

> 
>         if (__cr4_reserved_bits(cpu_has, c) !=
>             __cr4_reserved_bits(cpu_has, &boot_cpu_data))
>                 return -EIO;
> 
>         return static_call(kvm_x86_check_processor_compatibility)();
> }
> 
> 
> int kvm_arch_hardware_enable(void)
> {
>         struct kvm *kvm;
>         struct kvm_vcpu *vcpu;
>         unsigned long i;
>         int ret;
>         u64 local_tsc;
>         u64 max_tsc = 0;
>         bool stable, backwards_tsc = false;
> 
>         kvm_user_return_msr_cpu_online();
> 
>         ret = kvm_x86_check_processor_compatibility();
>         if (ret)
>                 return ret;
> 
>         ret = static_call(kvm_x86_hardware_enable)();
>         if (ret != 0)
>                 return ret;
> 
> 
> 	....
> }

