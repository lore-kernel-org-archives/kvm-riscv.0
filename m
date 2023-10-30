From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 18:18:26 +0100
Subject: [PATCH v13 11/35] KVM: Drop .on_unlock() mmu_notifier hook
In-Reply-To: <20231027182217.3615211-12-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-12-seanjc@google.com>
Message-ID: <22789e20-1a4a-48af-99ad-3e88c18dd231@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Drop the .on_unlock() mmu_notifer hook now that it's no longer used for
> notifying arch code that memory has been reclaimed.  Adding .on_unlock()
> and invoking it *after* dropping mmu_lock was a terrible idea, as doing so
> resulted in .on_lock() and .on_unlock() having divergent and asymmetric
> behavior, and set future developers up for failure, i.e. all but asked for
> bugs where KVM relied on using .on_unlock() to try to run a callback while
> holding mmu_lock.
> 
> Opportunistically add a lockdep assertion in kvm_mmu_invalidate_end() to
> guard against future bugs of this nature.

This is what David suggested to do in patch 3, FWIW.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> Reported-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Link: https://lore.kernel.org/all/20230802203119.GB2021422 at ls.amr.corp.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---



