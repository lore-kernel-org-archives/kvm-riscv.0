From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 16:41:05 +0000
Subject: [PATCH 0/2] KVM: RISC-V: MMU bug fix and cleanup
Message-ID: <20211104164107.1291793-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Bug fix and a cleanup for things I noticed by inspection when working on
the scalable memslots series.  Regarding the fix, unless there's a magic
unmapping hiding in the corners of the MMU, RISC-V completely fails to
handle memslot DELETE or MOVE.

Compile tested only.

Sean Christopherson (2):
  KVM: RISC-V: Unmap stage2 mapping when deleting/moving a memslot
  KVM: RISC-V: Use common KVM implementation of MMU memory caches

 arch/riscv/include/asm/kvm_host.h  | 10 +----
 arch/riscv/include/asm/kvm_types.h |  2 +-
 arch/riscv/kvm/mmu.c               | 70 ++++++++----------------------
 arch/riscv/kvm/vcpu.c              |  5 ++-
 4 files changed, 22 insertions(+), 65 deletions(-)

-- 
2.34.0.rc0.344.g81b53c2807-goog


