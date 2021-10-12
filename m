From: Sean Christopherson <seanjc@google.com>
Date: Tue, 12 Oct 2021 16:46:04 +0000
Subject: [PATCH v3 5/5] RISC-V: Add SBI HSM extension in KVM
In-Reply-To: <a762f0263090d7e818e58873d63139d7b6829d87.camel@wdc.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-6-atish.patra@wdc.com>
 <YWBdbCNQdikbhhBq@google.com>
 <0383b5cacb25e9dc293d891284df9f4cbc06ee3a.camel@wdc.com>
 <YWRLBknWXjzPnF1w@google.com>
 <a762f0263090d7e818e58873d63139d7b6829d87.camel@wdc.com>
Message-ID: <YWW7zGWUpqXLXE/4@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 11, 2021, Atish Patra wrote:
> On Mon, 2021-10-11 at 14:32 +0000, Sean Christopherson wrote:
> > On Mon, Oct 11, 2021, Atish Patra wrote:
> > > On Fri, 2021-10-08 at 15:02 +0000, Sean Christopherson wrote:
> > > > On Thu, Oct 07, 2021, Atish Patra wrote:
> > > > > +???????preempt_disable();
> > > > > +???????loaded = (vcpu->cpu != -1);
> > > > > +???????if (loaded)
> > > > > +???????????????kvm_arch_vcpu_put(vcpu);
> > > > 
> > > > Oof.? Looks like this pattern was taken from arm64.?
> > > 
> > > Yes. This part is similar to arm64 because the same race condition
> > > can
> > > happen in riscv due to save/restore of CSRs during reset.
> > > 
> > > 
> > > > Is there really no better approach to handling this?? I don't see
> > > > anything ?in kvm_riscv_reset_vcpu() that will obviously break if the
> > > > vCPU is ?loaded.? If the goal is purely to effect a CSR reset via
> > > > kvm_arch_vcpu_load(), then why not just factor out a helper to do
> > > > exactly that?
> > 
> > What about the question here?
> 
> Are you suggesting to factor the csr reset part to a different function?

More or less.  I'm mostly asking why putting the vCPU is necessary.

> > > > > ?void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
> > > > > ?{
> > > > > +???????/**
> > > > > +??????? * vcpu with id 0 is the designated boot cpu.
> > > > > +??????? * Keep all vcpus with non-zero cpu id in power-off
> > > > > state
> > > > > so that they
> > > > > +??????? * can brought to online using SBI HSM extension.
> > > > > +??????? */
> > > > > +???????if (vcpu->vcpu_idx != 0)
> > > > > +???????????????kvm_riscv_vcpu_power_off(vcpu);
> > > > 
> > > > Why do this in postcreate?
> > > > 
> > > 
> > > Because we need to absolutely sure that the vcpu is created. It is
> > > cleaner in this way rather than doing this here at the end of
> > > kvm_arch_vcpu_create. create_vcpu can also fail after
> > > kvm_arch_vcpu_create returns.
> > 
> > But kvm_riscv_vcpu_power_off() doesn't doesn't anything outside of the
> > vCPU.? It clears vcpu->arch.power_off, makes a request, and kicks the
> > vCPU.? None of that has side effects to anything else in KVM.? If the vCPU
> > isn't created successfully, it gets deleted and nothing ever sees that
> > state change.
> 
> I am assuming that you are suggesting to add this logic at the end of
> the kvm_arch_vcpu_create() instead of kvm_arch_vcpu_postcreate().
> 
> vcpu_idx is assigned after kvm_arch_vcpu_create() returns in the
> kvm_vm_ioctl_create_vcpu. kvm_arch_vcpu_postcreate() is the arch hookup
> after vcpu_idx is assigned.

Ah, it's the consumption of vcpu->vcpu_idx that's problematic.  Thanks!

