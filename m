From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 30 Jul 2024 12:41:31 +0200
Subject: [PATCH v12 34/84] KVM: Add a helper to lookup a pfn without
 grabbing a reference
In-Reply-To: <20240726235234.228822-35-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-35-seanjc@google.com>
Message-ID: <63c41e25-2523-4397-96b4-557394281443@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/27/24 01:51, Sean Christopherson wrote:
> Add a kvm_follow_pfn() wrapper, kvm_lookup_pfn(), to allow looking up a
> gfn=>pfn mapping without the caller getting a reference to any underlying
> page.  The API will be used in flows that want to know if a gfn points at
> a valid pfn, but don't actually need to do anything with the pfn.

Can you rename the function kvm_gfn_has_pfn(), or 
kvm_gfn_can_be_mapped(), and make it return a bool?

(As an aside, I wonder if reexecute_instruction() could just use 
kvm_is_error_hva(kvm_vcpu_gfn_to_hva(vcpu, gpa_to_gfn(gpa)) instead of 
going all the way to a pfn.  But it's ok to be more restrictive).

Paolo


