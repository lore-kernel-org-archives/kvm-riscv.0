From: Xu Yilun <yilun.xu@linux.intel.com>
Date: Wed, 1 Nov 2023 23:31:10 +0800
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for
 mmu_notifier_retry
In-Reply-To: <20231027182217.3615211-4-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-4-seanjc@google.com>
Message-ID: <ZUJvPi9TRsHZzVag@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 27, 2023 at 11:21:45AM -0700, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> Currently in mmu_notifier invalidate path, hva range is recorded and
> then checked against by mmu_notifier_retry_hva() in the page fault
                          ^

should be mmu_invalidate_retry_hva().

Besides this, Reviewed-by: Xu Yilun <yilun.xu@linux.intel.com>

Thanks

