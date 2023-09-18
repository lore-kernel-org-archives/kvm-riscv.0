From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 18 Sep 2023 23:36:42 +0530
Subject: [PATCH 0/4] KVM RISC-V fixes for ONE_REG interface
Message-ID: <20230918180646.1398384-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series includes few assorted fixes for KVM RISC-V ONE_REG interface
and KVM_GET_REG_LIST API.

These patches can also be found in riscv_kvm_onereg_fixes_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
  RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing
    extensions
  KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
  KVM: riscv: selftests: Selectively filter-out AIA registers

 arch/riscv/kvm/vcpu_onereg.c                  |  7 ++-
 .../selftests/kvm/riscv/get-reg-list.c        | 58 ++++++++++++++-----
 2 files changed, 47 insertions(+), 18 deletions(-)

-- 
2.34.1


