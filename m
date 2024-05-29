From: Huang, Kai <kai.huang@intel.com>
Date: Wed, 29 May 2024 10:50:57 +0000
Subject: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
In-Reply-To: <ZlYte16cvQpPGHkx@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
	 <20240522014013.1672962-4-seanjc@google.com>
	 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
	 <ZlYte16cvQpPGHkx@google.com>
Message-ID: <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2024-05-28 at 12:16 -0700, Sean Christopherson wrote:
> On Fri, May 24, 2024, Kai Huang wrote:
> > > @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> > >   	struct vcpu_svm *svm = to_svm(vcpu);
> > >   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> > > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > > +		shrink_ple_window(vcpu);
> > > +
> > 
> > [...]
> > 
> > > @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> > >   {
> > >   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > > +		shrink_ple_window(vcpu);
> > > +
> > 
> > Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)
> 
> Heh, that duplicate code annoys me too.  The problem is the "old" window value
> comes from the VMCS/VMCB, so either we'd end up with multiple kvm_x86_ops, or
> we'd only be able to consolidate the scheduled_out + kvm_pause_in_guest() code,
> which isn't all that interesting.

Agreed only consolidating scheduled_out + kvm_pause_in_guest() isn't quite
interesting.

> 
> Aha!  Actually, VMX already open codes the functionality provided by VCPU_EXREG_*,
> e.g. has vmx->ple_window_dirty.  If we add VCPU_EXREG_PLE_WINDOW, then the info
> get be made available to common x86 code without having to add new hooks.  And
> that would also allow moving the guts of handle_pause()/pause_interception() to
> common code, i.e. will also allow deduplicating the "grow" side of things.

Sounds feasible.  I am not sure whether we should use
VCPU_EXREG_PLE_WINDOW, though.  We can just have "ple_window" +
"ple_window_dirty" concept in the vcpu:

	vcpu->ple_window;
	vcpu->ple_window_dirty;

I.e., kinda make current VMX's version of {grow|shrink}_ple_window() as
common code. 

I am not familiar with SVM, but it seems the relevant parts are:

	control->pause_filter_count;
	vmcb_mark_dirty(svm->vmcb, VMCB_INTERCEPTS);

And it seems they are directly related to programming the hardware, i.e.,
they got automatically loaded to hardware during VMRUN.

They need to be updated in the SVM specific code when @ple_window_dirty is
true in the relevant code path.

Anyway, even it is feasible and worth to do, we should do in a separate
patchset.

