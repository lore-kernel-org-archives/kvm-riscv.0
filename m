From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Wed, 14 Dec 2022 17:50:07 +0800
Subject: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
In-Reply-To: <Y5dnWgJ0ine55/hN@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com> <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com> <Y5dnWgJ0ine55/hN@google.com>
Message-ID: <CAJhGHyBbjyKVEv3KcoOcPGQ28753FjR_rc9uNDEF3Dd-gNTRGQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 13, 2022 at 1:47 AM Sean Christopherson <seanjc@google.com> wrote:

>
> My preference would be to leave .smm in x86's page role.  IMO, defining multiple
> address spaces to support SMM emulation was a mistake that should be contained to
> SMM, i.e. should never be used for any other feature.  And with CONFIG_KVM_SMM,
> even x86 can opt out.
>


I think the name ASID in kvm/x86 should be used for vmcb's ASID,
vmcs's VPID, and PCID. Using the name ASID for other purposes
would only result in unnecessary confusion.

There is a bug for shadow paging when it uses two separate sets
of memslots which are using two sets of rmap and page-tracking.

When SMM world is writing to a non-SMM page which happens to be
a guest pagetable in the non-SMM world, the write operation will
go smoothly without specially handled and the shadow page for the guest
pagetable is neither unshadowed nor marked unsync.  The shadow paging
code is unaware that the shadow page has deviated from the guest
pagetable.

It means when SMM is enabled, shadow paging should be disabled,
which also means it has to use tdp and not to use nested tdp.

Thanks
Lai

