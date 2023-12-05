From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue,  5 Dec 2023 10:50:38 -0300
Subject: [PATCH v2 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Message-ID: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This v2 has a build warning fix in patch 3 found by kernel test robot
<lkp@intel.com>.

Changes from v1:
- patch 3:
  - remove unused 'cntx' pointer
- v1 link: https://lore.kernel.org/kvm/20231204182905.2163676-1-dbarboza at ventanamicro.com/

Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 35 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 ++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.41.0


