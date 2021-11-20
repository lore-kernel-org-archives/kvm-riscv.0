From: Mika Penttilä <mika.penttila@nextfour.com>
Date: Sat, 20 Nov 2021 18:30:18 +0200
Subject: [PATCH v4 11/11] KVM: x86: First attempt at converting nested
 virtual APIC page to gpc
In-Reply-To: <8f434989aebd257a36cafcb414edcc5906c02728.camel@infradead.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
 <20211120102810.8858-12-dwmw2@infradead.org>
 <d87de1ec-8be7-3967-87b2-c8906c1ab1b3@nextfour.com>
 <8f434989aebd257a36cafcb414edcc5906c02728.camel@infradead.org>
Message-ID: <b806de35-167a-4c7c-f143-cff3ec279491@nextfour.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 20.11.2021 18.21, David Woodhouse wrote:
> On Sat, 2021-11-20 at 17:48 +0200, Mika Penttil? wrote:
>>> @@ -9785,6 +9787,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
>>>         local_irq_disable();
>>>         vcpu->mode = IN_GUEST_MODE;
>>>     
>>> +     /*
>>> +      * If the guest requires direct access to mapped L1 pages, check
>>> +      * the caches are valid. Will raise KVM_REQ_GET_NESTED_STATE_PAGES
>>> +      * to go and revalidate them, if necessary.
>>> +      */
>>> +     if (is_guest_mode(vcpu) && kvm_x86_ops.nested_ops->check_guest_maps)
>>> +             kvm_x86_ops.nested_ops->check_guest_maps(vcpu);
>> But KVM_REQ_GET_NESTED_STATE_PAGES is not check until next
>> vcpu_enter_guest() entry ?
> Sure, but that's why this call to ->check_guest_maps() comes just a few
> lines *before* the 'if (kvm_cpu_exit_request(vcpu))' that will bounce
> us back out so that we go through vcpu_enter_guest() from the start
> again?
Yes, I had forgotten that...

Thanks,
Mika


