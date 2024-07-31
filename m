From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Jul 2024 12:11:17 +0200
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
In-Reply-To: <ZqlJxJyOdsR206Zc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
 <ZqlJxJyOdsR206Zc@google.com>
Message-ID: <a0418ced-260b-4b14-9124-c94ce46a0944@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/30/24 22:15, Sean Christopherson wrote:
> On Tue, Jul 30, 2024, Paolo Bonzini wrote:
>> On 7/27/24 01:51, Sean Christopherson wrote:
>>> Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
>>> gfn=>pfn mapping without the caller getting a reference to any underlying
>>> page.  The API will be used in flows that want to know if a gfn points at
>>> a valid pfn, but don't actually need to do anything with the pfn.
>>
>> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
>> and make it return a bool?
> 
> Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
> out a name, mainly because the kernel's pfn_valid() makes things like
> kvm_gfn_has_valid_pfn() confusing/misleading :-(
> 
>> (As an aside, I wonder if reexecute_instruction() could just use
>> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
>> all the way to a pfn.  But it's ok to be more restrictive).
> 
> Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
> a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
> prety sure that would require a rare race, and I don't think it could result in
> the guest being put into an infinite loop.

Indeed, and even the check in kvm_alloc_apic_access_page() is totally 
useless.  The page can go away at any time between the call and 
vmx_set_apic_access_page_addr() or, for AMD, the #NPF on 
APIC_DEFAULT_PHYS_BASE.

Yes, it's verifying that the system isn't under extreme memory pressure, 
but in practice a 4K get_user_pages is never going to fail, it's just 
going to cause something else to be swapped.  I'd just get rid of both 
of them, so there's no need for kvm_lookup_pfn().

Paolo


