From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Oct 2021 18:14:44 +0200
Subject: [PATCH v2 35/43] KVM: SVM: Signal AVIC doorbell iff vCPU is in
 guest mode
In-Reply-To: <YXl5anv0Lyjx1cws@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-36-seanjc@google.com>
 <0333be2a-76d8-657a-6c82-3bb5c9ff2e3b@redhat.com>
 <YXlrEWmBohaDXmqL@google.com>
 <185502d7-861e-fa5c-b225-419710fe77ed@redhat.com>
 <YXl5anv0Lyjx1cws@google.com>
Message-ID: <d0746ea4-06e9-f65d-6e45-72b1b0dea29b@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/10/21 18:08, Sean Christopherson wrote:
>> Right, so should we drop the "if (running)" check in this patch, at the same
>> time as it's adding the IN_GUEST_MODE check?
> LOL, I think we have a Three^WTwo Stooges routine going on.  This patch does
> remove avic_vcpu_is_running() and replaces it with the vcpu->mode check.  Or am
> I completely misunderstanding what your referring to?
> 
> -       if (avic_vcpu_is_running(vcpu)) {
> +       /*
> +        * Signal the doorbell to tell hardware to inject the IRQ if the vCPU
> +        * is in the guest.  If the vCPU is not in the guest, hardware will
> +        * automatically process AVIC interrupts at VMRUN.
> +        */
> +       if (vcpu->mode == IN_GUEST_MODE) {
>                  int cpu = READ_ONCE(vcpu->cpu);

Nevermind, I confused svm_deliver_avic_intr with avic_kick_target_vcpus, 
which anyway you are handling in patch 36.

Paolo


