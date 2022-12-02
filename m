From: Sean Christopherson <seanjc@google.com>
Date: Fri, 2 Dec 2022 16:31:18 +0000
Subject: [PATCH v2 42/50] KVM: Disable CPU hotplug during hardware
 enabling/disabling
In-Reply-To: <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-43-seanjc@google.com>
 <8b1053781e859aa95a08c10b0e8a06912a2b42a2.camel@intel.com>
Message-ID: <Y4ooVrDTkscy68vg@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 02, 2022, Huang, Kai wrote:
> On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> > From: Chao Gao <chao.gao@intel.com>
> > 
> > Disable CPU hotplug when enabling/disabling hardware to prevent the
> > corner case where if the following sequence occurs:
> > 
> >   1. A hotplugged CPU marks itself online in cpu_online_mask
> >   2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
> >      callback
> >   3  hardware_{en,dis}able_all() is invoked on another CPU
> > 
> > the hotplugged CPU will be included in on_each_cpu() and thus get sent
> > through hardware_{en,dis}able_nolock() before kvm_online_cpu() is called.
> 
> Should we explicitly call out what is the consequence of such case, otherwise
> it's hard to tell whether this truly is an issue?
>
> IIUC, since now the compatibility check has already been moved to
> kvm_arch_hardware_enable(), the consequence is hardware_enable_all() will fail
> if the now online cpu isn't compatible, which will results in failing to create
> the first VM.  This isn't ideal since the incompatible cpu should be rejected to
> go online instead.

Actually, in that specific scenario, KVM should not reject the CPU.  E.g. if KVM
is autoloaded (common with systemd and/or qemu-kvm installed), but not used by
userspace, then KVM is overstepping by rejecting the incompatible CPU since the
user likely cares more about onlining a CPU than they do about KVM.

> > KVM currently fudges around this race by keeping track of which CPUs have
> > done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
> > cpus have virtualization enabled"), but that's an inefficient, convoluted,
> > and hacky solution.

...

> > +	/*
> > +	 * Compatibility checks are done when loading KVM and when enabling
> > +	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> > +	 * compatible, i.e. KVM should never perform a compatibility check on
> > +	 * an offline CPU.
> > +	 */
> > +	WARN_ON(!cpu_online(cpu));
> 
> IMHO this chunk logically should belong to previous patch.  IIUC disabling CPU
> hotplug during hardware_enable_all() doesn't have relationship to this WARN().

Hmm, yeah, I agree.  I'll move it.

> >  static int hardware_enable_all(void)
> >  {
> >  	int r = 0;
> >  
> > +	/*
> > +	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
> > +	 * is called, and so on_each_cpu() between them includes the CPU that
> > +	 * is being onlined.  As a result, hardware_enable_nolock() may get
> > +	 * invoked before kvm_online_cpu(), which also enables hardware if the
> > +	 * usage count is non-zero.  Disable CPU hotplug to avoid attempting to
> > +	 * enable hardware multiple times.
> 
> It won't enable hardware multiple times, right?  Since hardware_enable_nolock()
> has below check:
> 
>         if (cpumask_test_cpu(cpu, cpus_hardware_enabled))                      
>                 return;                                                        
>                                                                                                                                                    
>         cpumask_set_cpu(cpu, cpus_hardware_enabled);     
> 
> IIUC the only issue is the one that I replied in the changelog.
> 
> Or perhaps I am missing something?

You're not missing anything in terms of code.  What the comment means by "attempting"
in this case is calling hardware_enable_nolock().  As called out in the changelog,
guarding against this race with cpus_hardware_enabled is a hack, i.e. KVM should
not have to rely on a per-CPU flag.

 : KVM currently fudges around this race by keeping track of which CPUs have
 : done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
 : cpus have virtualization enabled"), but that's an inefficient, convoluted,
 : and hacky solution.

I actually considered removing the per-CPU flag, but decided not to because it's
simpler to blast

	on_each_cpu(hardware_disable_nolock, ...)

in kvm_reboot() and if enabling hardware fails on one or more CPUs, and taking a
#UD on VMXOFF in the latter case is really unnecessary, i.e. the flag is nice to
have for other reasons.

That said, after this patch, KVM should be able to WARN in the enable path.  I'll
test that and do a more thorough audit; unless I'm missing something, I'll add a
patch to do:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b8c6bfb46066..ee896fa2f196 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5027,7 +5027,7 @@ static int kvm_usage_count;
 
 static int __hardware_enable_nolock(void)
 {
-       if (__this_cpu_read(hardware_enabled))
+       if (WARN_ON_ONCE(__this_cpu_read(hardware_enabled)))
                return 0;
 
        if (kvm_arch_hardware_enable()) {


