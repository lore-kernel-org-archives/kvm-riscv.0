From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 2 Nov 2023 12:14:13 +0100
Subject: [PATCH v13 12/35] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
In-Reply-To: <9963b77c-3a38-4f89-b21e-48d0fdda8f53@linux.intel.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-13-seanjc@google.com>
 <9963b77c-3a38-4f89-b21e-48d0fdda8f53@linux.intel.com>
Message-ID: <cbd46f04-c53b-4d22-9730-76f2ace141d9@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/2/23 06:59, Binbin Wu wrote:
> 
>> Add flags to "struct kvm_gfn_range" to let notifier events target
>> only shared and only private mappings, and write up the existing
>> mmu_notifier events to be shared-only (private memory is never
>> associated with a userspace virtual address, i.e. can't be reached
>> via mmu_notifiers).
>> 
>> Add two flags so that KVM can handle the three possibilities
>> (shared, private, and shared+private) without needing something
>> like a tri-state enum.
>
> I see the two flags are set/cleared in __kvm_handle_hva_range() in
> this patch and kvm_handle_gfn_range() from the later patch 13/35, but
> I didn't see they are used/read in this patch series if I didn't miss
> anything.  How are they supposed to be used in KVM?

They are going to be used by SNP/TDX patches.

Paolo


