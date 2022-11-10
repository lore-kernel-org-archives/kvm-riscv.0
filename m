From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Nov 2022 16:49:29 +0000
Subject: [PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
In-Reply-To: <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-38-seanjc@google.com>
 <301a8a33a5cbe5b4fd3efe03b05bb8410a46e9f5.camel@linux.intel.com>
Message-ID: <Y20rmaU14rZFFCZI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 10, 2022, Robert Hoo wrote:
> > -static int kvm_starting_cpu(unsigned int cpu)
> > +static int kvm_online_cpu(unsigned int cpu)
> >  {
> > +	int ret = 0;
> > +
> >  	raw_spin_lock(&kvm_count_lock);
> > -	if (kvm_usage_count)
> > +	/*
> > +	 * Abort the CPU online process if hardware virtualization
> > cannot
> > +	 * be enabled. Otherwise running VMs would encounter
> > unrecoverable
> > +	 * errors when scheduled to this CPU.
> > +	 */
> > +	if (kvm_usage_count) {
> > +		WARN_ON_ONCE(atomic_read(&hardware_enable_failed));
> > +
> >  		hardware_enable_nolock(NULL);
> > +		if (atomic_read(&hardware_enable_failed)) {
> > +			atomic_set(&hardware_enable_failed, 0);
> 
> I see other places using this hardware_enable_failed with atomic_inc(),
> should here use atomic_dec() instead of straightly set to 0?

Meh, both options are flawed.  E.g. if hardware_enable_failed was left dangling
(the WARN above), then atomic_dec() won't remedy the problem and KVM will reject
onlining CPUs indefinitely.  Forcing the atomic back to '0' will remedy that
particular issue, but could lead to problems if there are other bugs.

> Though here is embraced by spin_lock, hardware_enable_nolock() can be
> invoked in other places in parallel?

Only because of a KVM bug, which gets fixed in the next patch:

  KVM: Disable CPU hotplug during hardware enabling

