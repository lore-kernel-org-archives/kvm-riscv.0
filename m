From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:11:39 +0100
Subject: [PATCH v13 10/35] KVM: Add a dedicated mmu_notifier flag for
 reclaiming freed memory
In-Reply-To: <20231027182217.3615211-11-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-11-seanjc@google.com>
Message-ID: <773328b3-0ef0-4e93-afb9-6fba3302b8a7@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Handle AMD SEV's kvm_arch_guest_memory_reclaimed() hook by having
> __kvm_handle_hva_range() return whether or not an overlapping memslot
> was found, i.e. mmu_lock was acquired.  Using the .on_unlock() hook
> works, but kvm_arch_guest_memory_reclaimed() needs to run after dropping
> mmu_lock, which makes .on_lock() and .on_unlock() asymmetrical.
> 
> Use a small struct to return the tuple of the notifier-specific return,
> plus whether or not overlap was found.  Because the iteration helpers are
> __always_inlined, practically speaking, the struct will never actually be
> returned from a function call (not to mention the size of the struct will
> be two bytes in practice).

Could have been split in two patches, but it's fine anyway.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


