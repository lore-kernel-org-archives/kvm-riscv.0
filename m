From: Sean Christopherson <seanjc@google.com>
Date: Tue, 15 Aug 2023 15:31:29 -0700
Subject: [PATCH v9 06/14] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
In-Reply-To: <20230811045127.3308641-7-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-7-rananta@google.com>
Message-ID: <ZNv8weRKhSeLYWIc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> range-based TLB invalidation where the range is defined by the memslot.
> Now that kvm_flush_remote_tlbs_range() can be called from common code we
> can just use that and drop a bunch of duplicate code from the arch
> directories.
> 
> Note this adds a lockdep assertion for slots_lock being held when
> calling kvm_flush_remote_tlbs_memslot(), which was previously only
> asserted on x86. MIPS has calls to kvm_flush_remote_tlbs_memslot(),
> but they all hold the slots_lock, so the lockdep assertion continues to
> hold true.
> 
> Also drop the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT ifdef gating
> kvm_flush_remote_tlbs_memslot(), since it is no longer necessary.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Acked-by: Anup Patel <anup@brainfault.org>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

