From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 17:30:54 +0100
Subject: [PATCH v13 03/35] KVM: Use gfn instead of hva for
 mmu_notifier_retry
In-Reply-To: <20231027182217.3615211-4-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-4-seanjc@google.com>
Message-ID: <bd49d731-9231-44bb-9950-949ee95f3b7e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com> Currently in mmu_notifier 
> invalidate path, hva range is recorded and then checked against by 
> mmu_notifier_retry_hva() in the page fault handling path. However, for 
> the to be introduced private memory, a page fault may not have a hva 
> associated, checking gfn(gpa) makes more sense. For existing hva based 
> shared memory, gfn is expected to also work. The only downside is when 
> aliasing multiple gfns to a single hva, the current algorithm of 
> checking multiple ranges could result in a much larger range being 
> rejected. Such aliasing should be uncommon, so the impact is expected 
> small.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


