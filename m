From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 17:32:17 +0100
Subject: [PATCH v13 04/35] KVM: WARN if there are dangling MMU
 invalidations at VM destruction
In-Reply-To: <20231027182217.3615211-5-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-5-seanjc@google.com>
Message-ID: <d8bf6463-c780-4055-8d8f-67b1ba2ca884@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Add an assertion that there are no in-progress MMU invalidations when a 
> VM is being destroyed, with the exception of the scenario where KVM 
> unregisters its MMU notifier between an .invalidate_range_start() call 
> and the corresponding .invalidate_range_end(). KVM can't detect unpaired 
> calls from the mmu_notifier due to the above exception waiver, but the 
> assertion can detect KVM bugs, e.g. such as the bug that *almost* 
> escaped initial guest_memfd development.
>
> Link: https://lore.kernel.org/all/e397d30c-c6af-e68f-d18e-b4e3739c5389 at linux.intel.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


