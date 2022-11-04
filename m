From: Sean Christopherson <seanjc@google.com>
Date: Fri, 4 Nov 2022 16:31:25 +0000
Subject: [PATCH 08/44] KVM: x86: Move hardware setup/unsetup to init/exit
In-Reply-To: <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-9-seanjc@google.com>
 <20221104062223.7kcrbt66mlmqxk7f@yy-desk-7060>
Message-ID: <Y2U+XT0Sm+a69CaH@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 04, 2022, Yuan Yao wrote:
> On Wed, Nov 02, 2022 at 11:18:35PM +0000, Sean Christopherson wrote:
> > To avoid having to unwind various setup, e.g registration of several
> > notifiers, slot in the vendor hardware setup before the registration of
> > said notifiers and callbacks.  Introducing a functional change while
> > moving code is less than ideal, but the alternative is adding a pile of
> > unwinding code, which is much more error prone, e.g. several attempts to
> > move the setup code verbatim all introduced bugs.

...

> > @@ -9325,6 +9343,24 @@ int kvm_arch_init(void *opaque)
> >  		kvm_caps.supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
> >  	}
> >
> > +	rdmsrl_safe(MSR_EFER, &host_efer);
> > +
> > +	if (boot_cpu_has(X86_FEATURE_XSAVES))
> > +		rdmsrl(MSR_IA32_XSS, host_xss);
> > +
> > +	kvm_init_pmu_capability();
> > +
> > +	r = ops->hardware_setup();
> > +	if (r != 0)
> > +		goto out_mmu_exit;
> 
> The failure case of ops->hardware_setup() is unwound
> by kvm_arch_exit() before this patch, do we need to
> keep that old behavior ?

As called out in the changelog, the call to ops->hardware_setup() was deliberately
slotted in before the call to kvm_timer_init() so that kvm_arch_init() wouldn't
need to unwind more stuff if harware_setup() fails.

> > +	/*
> > +	 * Point of no return!  DO NOT add error paths below this point unless
> > +	 * absolutely necessary, as most operations from this point forward
> > +	 * require unwinding.
> > +	 */
> > +	kvm_ops_update(ops);
> > +
> >  	kvm_timer_init();
> >
> >  	if (pi_inject_timer == -1)
> > @@ -9336,8 +9372,32 @@ int kvm_arch_init(void *opaque)
> >  		set_hv_tscchange_cb(kvm_hyperv_tsc_notifier);
> >  #endif
> >
> > +	kvm_register_perf_callbacks(ops->handle_intel_pt_intr);
> > +
> > +	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
> > +		kvm_caps.supported_xss = 0;
> > +
> > +#define __kvm_cpu_cap_has(UNUSED_, f) kvm_cpu_cap_has(f)
> > +	cr4_reserved_bits = __cr4_reserved_bits(__kvm_cpu_cap_has, UNUSED_);
> > +#undef __kvm_cpu_cap_has
> > +
> > +	if (kvm_caps.has_tsc_control) {
> > +		/*
> > +		 * Make sure the user can only configure tsc_khz values that
> > +		 * fit into a signed integer.
> > +		 * A min value is not calculated because it will always
> > +		 * be 1 on all machines.
> > +		 */
> > +		u64 max = min(0x7fffffffULL,
> > +			      __scale_tsc(kvm_caps.max_tsc_scaling_ratio, tsc_khz));
> > +		kvm_caps.max_guest_tsc_khz = max;
> > +	}
> > +	kvm_caps.default_tsc_scaling_ratio = 1ULL << kvm_caps.tsc_scaling_ratio_frac_bits;
> > +	kvm_init_msr_list();
> >  	return 0;
> >
> > +out_mmu_exit:
> > +	kvm_mmu_vendor_module_exit();
> >  out_free_percpu:
> >  	free_percpu(user_return_msrs);
> >  out_free_x86_emulator_cache:

