From: Huang, Kai <kai.huang@intel.com>
Date: Mon, 6 Nov 2023 09:29:19 +0000
Subject: [PATCH 02/34] KVM: Assert that mmu_invalidate_in_progress *never*
 goes negative
In-Reply-To: <20231105163040.14904-3-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
	 <20231105163040.14904-3-pbonzini@redhat.com>
Message-ID: <4e64f7f303ac25ba3bfadeecf8422340a62ec1d0.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2023-11-05 at 17:30 +0100, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Move the assertion on the in-progress invalidation count from the primary
> MMU's notifier path to KVM's common notification path, i.e. assert that
> the count doesn't go negative even when the invalidation is coming from
> KVM itself.
> 
> Opportunistically convert the assertion to a KVM_BUG_ON(), i.e. kill only
> the affected VM, not the entire kernel.  A corrupted count is fatal to the
> VM, e.g. the non-zero (negative) count will cause mmu_invalidate_retry()
> to block any and all attempts to install new mappings.  But it's far from
> guaranteed that an end() without a start() is fatal or even problematic to
> anything other than the target VM, e.g. the underlying bug could simply be
> a duplicate call to end().  And it's much more likely that a missed
> invalidation, i.e. a potential use-after-free, would manifest as no
> notification whatsoever, not an end() without a start().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-3-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>

