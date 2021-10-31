From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Mon, 01 Nov 2021 00:51:39 +0200
Subject: [PATCH v2 27/43] KVM: VMX: Move Posted Interrupt ndst
 computation out of write loop
In-Reply-To: <YXrL1EuzZtTR4J1Q@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-28-seanjc@google.com>
 <643d9c249b5863f04290a6f047ea1a2d98bd75f9.camel@redhat.com>
 <YXrL1EuzZtTR4J1Q@google.com>
Message-ID: <432666f36add6647283631770f1b140656c67c62.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2021-10-28 at 16:12 +0000, Sean Christopherson wrote:
> On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> > On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > > Hoist the CPU => APIC ID conversion for the Posted Interrupt descriptor
> > > out of the loop to write the descriptor, preemption is disabled so the
> > > CPU won't change, and if the APIC ID changes KVM has bigger problems.
> > > 
> > > No functional change intended.
> > 
> > Is preemption always disabled in vmx_vcpu_pi_load? vmx_vcpu_pi_load is called
> > from vmx_vcpu_load, which is called indirectly from vcpu_load which is called
> > from many ioctls, which userspace does. In these places I don't think that
> > preemption is disabled.
> 
> Preemption is disabled in vcpu_load() by the get_cpu().  The "cpu" param that's
> passed around the vcpu_load() stack is also why I think it's ok to _not_ assert
> that preemption is disabled in vmx_vcpu_pi_load(); if preemption is enabled,
> "cpu" is unstable and thus the entire "load" operation is busted.

Yes, I even knew about the get_cpu() behavier which indeed has to disable preemption.
But I didn't notice call to it, when I wrote this mail! Later I did notice it but it was
too late. Sometimes sending all the review mails at once at the end does make sense after all,
I guess.

Best regards,
	Maxim Levitsky

> 
> 
> #define get_cpu()		({ preempt_disable(); __smp_processor_id(); })
> #define put_cpu()		preempt_enable()
> 
> 
> void vcpu_load(struct kvm_vcpu *vcpu)
> {
> 	int cpu = get_cpu();
> 
> 	__this_cpu_write(kvm_running_vcpu, vcpu);
> 	preempt_notifier_register(&vcpu->preempt_notifier);
> 	kvm_arch_vcpu_load(vcpu, cpu);
> 	put_cpu();
> }
> EXPORT_SYMBOL_GPL(vcpu_load);
> 



