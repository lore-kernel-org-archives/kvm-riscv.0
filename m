From: Huang, Kai <kai.huang@intel.com>
Date: Mon, 6 Nov 2023 09:28:19 +0000
Subject: [PATCH 01/34] KVM: Tweak kvm_hva_range and hva_handler_t to allow
 reusing for gfn ranges
In-Reply-To: <20231105163040.14904-2-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
	 <20231105163040.14904-2-pbonzini@redhat.com>
Message-ID: <53be446a44f2755325c44d38f987a9ea4207ac62.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2023-11-05 at 17:30 +0100, Paolo Bonzini wrote:
> From: Sean Christopherson <seanjc@google.com>
> 
> Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
> that the structure can be used to handle notifications that operate on gfn
> context, i.e. that aren't tied to a host virtual address.  Rename the
> handler typedef too (arguably it should always have been gfn_handler_t).
> 
> Practically speaking, this is a nop for 64-bit kernels as the only
> meaningful change is to store start+end as u64s instead of unsigned longs.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Message-Id: <20231027182217.3615211-2-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>

