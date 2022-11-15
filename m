From: Sean Christopherson <seanjc@google.com>
Date: Tue, 15 Nov 2022 20:21:00 +0000
Subject: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
In-Reply-To: <Y3PzhANShVlTXVg1@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
 <Y3PzhANShVlTXVg1@google.com>
Message-ID: <Y3P0rAjywL1a7Pme@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 15, 2022, Sean Christopherson wrote:
> On Thu, Nov 10, 2022, Huang, Kai wrote:
> > On Thu, 2022-11-10 at 01:33 +0000, Huang, Kai wrote:
> > > > @@ -9283,7 +9283,13 @@ static int
> > > > kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
> > > > ?	int cpu = smp_processor_id();
> > > > ?	struct cpuinfo_x86 *c = &cpu_data(cpu);
> > > > ?
> > > > -	WARN_ON(!irqs_disabled());
> > > > +	/*
> > > > +	 * Compatibility checks are done when loading KVM and when enabling
> > > > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > > > +	 * compatible, i.e. KVM should never perform a compatibility check
> > > > on
> > > > +	 * an offline CPU.
> > > > +	 */
> > > > +	WARN_ON(!irqs_disabled() && cpu_active(cpu));
> > > > ?
> > > 
> > > Also, the logic of:
> > > 
> > > 	!irqs_disabled() && cpu_active(cpu)
> > > 
> > > is quite weird.
> > > 
> > > The original "WARN(!irqs_disabled())" is reasonable because in STARTING
> > > section
> > > the IRQ is indeed disabled.
> > > 
> > > But this doesn't make sense anymore after we move to ONLINE section, in which
> > > IRQ has already been enabled (see start_secondary()).? IIUC the WARN_ON()
> > > doesn't get exploded is purely because there's an additional cpu_active(cpu)
> > > check.
> > > 
> > > So, a more reasonable check should be something like:
> > > 
> > > 	WARN_ON(irqs_disabled() || cpu_active(cpu) || !cpu_online(cpu));
> > > 
> > > Or we can simply do:
> > > 
> > > 	WARN_ON(!cpu_online(cpu) || cpu_active(cpu));
> > > 
> > > (because I don't know whether it's possible IRQ can somehow get disabled in
> > > ONLINE section).
> > > 
> > > Btw above is purely based on code analysis, but I haven't done any test.
> > 
> > Hmm.. I wasn't thinking thoroughly.  I forgot CPU compatibility check also
> > happens on all online cpus when loading KVM.  For this case, IRQ is disabled and
> > cpu_active() is true.  For the hotplug case, IRQ is enabled but  cpu_active() is
> > false.
> 
> Actually, you're right (and wrong).  You're right in that the WARN is flawed.  And
> the reason for that is because you're wrong about the hotplug case.  In this version
> of things, the compatibility checks are routed through hardware enabling, i.e. this
> flow is used only when loading KVM.  This helper should only be called via SMP function
> call, which means that IRQs should always be disabled.

Grr, but not routing through this helper is flawed in that KVM doesn't do the
CR4 checks in the hardware enabling case.  Don't think that changes the WARN, but
other patches in this series need tweaks.

