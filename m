From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 28 Oct 2021 00:09:25 +0200
Subject: [PATCH v2 39/43] KVM: VMX: Don't do full kick when triggering
 posted interrupt "fails"
In-Reply-To: <YXl4mK7CyUBnPaQV@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-40-seanjc@google.com>
 <335822ac-b98b-1eec-4911-34e4d0e99907@redhat.com>
 <YXl4mK7CyUBnPaQV@google.com>
Message-ID: <fdf90c2f-81c8-513b-2e06-a90959f4cd89@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/10/21 18:04, Sean Christopherson wrote:
>>> +		/*
>>> +		 * The smp_wmb() in kvm_make_request() pairs with the smp_mb_*()
>>> +		 * after setting vcpu->mode in vcpu_enter_guest(), thus the vCPU
>>> +		 * is guaranteed to see the event request if triggering a posted
>>> +		 * interrupt "fails" because vcpu->mode != IN_GUEST_MODE.
>>
>> What this smp_wmb() pair with, is the smp_mb__after_atomic in
>> kvm_check_request(KVM_REQ_EVENT, vcpu).
>
> I don't think that's correct.  There is no kvm_check_request() in the relevant path.
> kvm_vcpu_exit_request() uses kvm_request_pending(), which is just a READ_ONCE()
> without a barrier.

Ok, we are talking about two different set of barriers.  This is mine:

- smp_wmb() in kvm_make_request() pairs with the smp_mb__after_atomic() in
kvm_check_request(); it ensures that everything before the request
(in this case, pi_pending = true) is seen by inject_pending_event.

- pi_test_and_set_on() orders the write to ON after the write to PIR,
pairing with vmx_sync_pir_to_irr and ensuring that the bit in the PIR is
seen.

And this is yours:

- pi_test_and_set_on() _also_ orders the write to ON before the read of
vcpu->mode, pairing with vcpu_enter_guest()

- kvm_make_request() however does _not_ order the write to
vcpu->requests before the read of vcpu->mode, even though it's needed.
Usually that's handled by kvm_vcpu_exiting_guest_mode(), but in this case
vcpu->mode is read in kvm_vcpu_trigger_posted_interrupt.

So vmx_deliver_nested_posted_interrupt() is missing a smp_mb__after_atomic().
It's documentation only for x86, but still easily done in v3.

Paolo


