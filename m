From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue,  5 Dec 2023 14:45:06 -0300
Subject: [PATCH v3 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Message-ID: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

In this version we're exporting all vector regs, not just vector CSRs,
in get-reg-list. All changes were done in patch 3.

No other changes made.

Changes from v2:
- patch 3:
  - check num_vector_regs() != 0 before copying vector regs
  - export all 32 vector regs in num_vector_regs() and copy_vector_reg_indices()
  - initialize 'size' out of the loop in copy_vector_reg_indices()
- v2 link: https://lore.kernel.org/kvm/20231205135041.2208004-1-dbarboza at ventanamicro.com/

Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 55 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 +++++++++++
 2 files changed, 71 insertions(+)

-- 
2.41.0


