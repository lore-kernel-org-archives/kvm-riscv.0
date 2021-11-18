From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 18 Nov 2021 13:04:07 +0100
Subject: [PATCH v3 08/12] KVM: Propagate vcpu explicitly to
 mark_page_dirty_in_slot()
In-Reply-To: <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-9-dwmw2@infradead.org>
 <85d9fec17f32c3eb9e100e56b91af050.squirrel@twosheds.infradead.org>
Message-ID: <4c48546b-eb4a-dff7-cc38-5df54f73f5d4@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/17/21 22:09, David Woodhouse wrote:
>>   {
>> -	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
>> +	struct kvm_vcpu *running_vcpu = kvm_get_running_vcpu();
>>
>> +	WARN_ON_ONCE(vcpu && vcpu != running_vcpu);
>>   	WARN_ON_ONCE(vcpu->kvm != kvm);
> Ah, that one needs to be changed to check running_vcpu instead. Or this
> needs to go first:
> 
> I think I prefer making the vCPU a required argument. If anyone's going to
> pull a vCPU pointer out of their posterior, let the caller do it.
> 

I understand that feeling, but still using the running vCPU is by far 
the common case, and it's not worth adding a new function parameter to 
all call sites.

What about using a separate function, possibly __-prefixed, for the case 
where you have a very specific vCPU?

Paolo


