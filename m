From: Huang, Kai <kai.huang@intel.com>
Date: Mon, 6 Nov 2023 09:29:42 +0000
Subject: [PATCH 03/34] KVM: Use gfn instead of hva for mmu_notifier_retry
In-Reply-To: <20231105163040.14904-4-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
	 <20231105163040.14904-4-pbonzini@redhat.com>
Message-ID: <814958af6bf6b00752a715da74a0cb85efded1aa.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, 2023-11-05 at 17:30 +0100, Paolo Bonzini wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Currently in mmu_notifier invalidate path, hva range is recorded and then
> checked against by mmu_invalidate_retry_hva() in the page fault handling
> path. However, for the soon-to-be-introduced private memory, a page fault
> may not have a hva associated, checking gfn(gpa) makes more sense.
> 
> For existing hva based shared memory, gfn is expected to also work. The
> only downside is when aliasing multiple gfns to a single hva, the
> current algorithm of checking multiple ranges could result in a much
> larger range being rejected. Such aliasing should be uncommon, so the
> impact is expected small.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Cc: Xu Yilun <yilun.xu@intel.com>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> [sean: convert vmx_set_apic_access_page_addr() to gfn-based API]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Message-Id: <20231027182217.3615211-4-seanjc@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>
