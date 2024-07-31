From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 31 Jul 2024 12:18:17 +0200
Subject: [PATCH v12 48/84] KVM: Move x86's API to release a faultin page
 to common KVM
In-Reply-To: <Zqk72jP1c8N0Pn1O@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-49-seanjc@google.com>
 <96df1dd5-cc31-4e84-84fd-ea75b4800be8@redhat.com>
 <Zqk72jP1c8N0Pn1O@google.com>
Message-ID: <a76a83de-5dfd-495b-904a-878e1483e5f6@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/30/24 21:15, Sean Christopherson wrote:
>> Does it make sense to move RET_PF_* to common code, and avoid a bool
>> argument here?
> After this series, probably?  Especially if/when we make "struct kvm_page_fault"
> a common structure and converge all arch code.  In this series, definitely not,
> as it would require even more patches to convert other architectures, and it's
> not clear that it would be a net win, at least not without even more massaging.

It does not seem to be hard, but I agree that all the other 
architectures right now use 0/-errno in the callers of 
kvm_release_faultin_page().

Paolo


