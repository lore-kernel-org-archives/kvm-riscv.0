From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 12:59:08 +0530
Subject: [PATCH 0/3] Unexpected guest trap handling for KVM RISC-V selftests
Message-ID: <20220329072911.1692766-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Getting unexpected guest traps while running KVM RISC-V selftests should
cause the test to fail appropriately with VCPU register dump. This series
improves handling of unexpected traps along these lines.

These patches can also be found in riscv_kvm_selftests_unexp_trap_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (3):
  KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table
  KVM: selftests: riscv: Fix alignment of the guest_hang() function
  KVM: selftests: riscv: Improve unexpected guest trap handling

 .../selftests/kvm/include/riscv/processor.h   | 12 ++++---
 .../selftests/kvm/lib/riscv/processor.c       |  9 +++---
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 31 +++++++++++++------
 3 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.25.1


