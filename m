From: David Hildenbrand <david@redhat.com>
Date: Mon, 8 Apr 2024 09:35:21 +0200
Subject: [PATCH 3/4] mmu_notifier: remove the .change_pte() callback
In-Reply-To: <20240405115815.3226315-4-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-4-pbonzini@redhat.com>
Message-ID: <e40ad5e2-6679-47f6-ab9f-14625627ac1e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05.04.24 13:58, Paolo Bonzini wrote:
> The scope of set_pte_at_notify() has reduced more and more through the
> years.  Initially, it was meant for when the change to the PTE was
> not bracketed by mmu_notifier_invalidate_range_{start,end}().  However,
> that has not been so for over ten years.  During all this period
> the only implementation of .change_pte() was KVM and it
> had no actual functionality, because it was called after
> mmu_notifier_invalidate_range_start() zapped the secondary PTE.
> 
> Now that this (nonfunctional) user of the .change_pte() callback is
> gone, the whole callback can be removed.  For now, leave in place
> set_pte_at_notify() even though it is just a synonym for set_pte_at().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


