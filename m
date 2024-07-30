From: Sean Christopherson <seanjc@google.com>
Date: Tue, 30 Jul 2024 13:15:00 -0700
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
In-Reply-To: <63c41e25-2523-4397-96b4-557394281443@redhat.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-35-seanjc@google.com>
 <63c41e25-2523-4397-96b4-557394281443@redhat.com>
Message-ID: <ZqlJxJyOdsR206Zc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 30, 2024, Paolo Bonzini wrote:
> On 7/27/24 01:51, Sean Christopherson wrote:
> > Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
> > gfn=>pfn mapping without the caller getting a reference to any underlying
> > page.  The API will be used in flows that want to know if a gfn points at
> > a valid pfn, but don't actually need to do anything with the pfn.
> 
> Can you rename the function kvm_gfn_has_pfn(), or kvm_gfn_can_be_mapped(),
> and make it return a bool?

Heh, sure.  I initially planned on having it return a bool, but I couldn't figure
out a name, mainly because the kernel's pfn_valid() makes things like
kvm_gfn_has_valid_pfn() confusing/misleading :-(

> (As an aside, I wonder if reexecute_instruction() could just use
> kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of going
> all the way to a pfn.  But it's ok to be more restrictive).

Heh #2, I wondered the same thing.  I think it would work?  Verifying that there's
a usable pfn also protects against retrying an access that hit -EHWPOISON, but I'm
prety sure that would require a rare race, and I don't think it could result in
the guest being put into an infinite loop.

