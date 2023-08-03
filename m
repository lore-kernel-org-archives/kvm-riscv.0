From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu,  3 Aug 2023 11:00:12 -0300
Subject: [PATCH v3 00/10] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230803140022.399333-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This version has changes in the document patch, as suggested by Andrew
in v2. It also has a new patch (patch 9) that handles error code changes
in vcpu_vector.c.

Patches rebased on top of kvm_riscv_queue.

Changes from v2:
- patch 9 (new):
  - change kvm error codes for vector registers
- patch 10 (former 9):
  - rewrite EBUSY doc to mention that the error code indicates that it
    is not allowed to change the reg val after the vcpu started.
- v2 link: https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza at ventanamicro.com/

Andrew Jones (1):
  RISC-V: KVM: Improve vector save/restore errors

Daniel Henrique Barboza (9):
  RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
  RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
  RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
  RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
  RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
  RISC-V: KVM: avoid EBUSY when writing same ISA val
  RISC-V: KVM: avoid EBUSY when writing the same machine ID val
  RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
  docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

 Documentation/virt/kvm/api.rst |  2 +
 arch/riscv/kvm/aia.c           |  4 +-
 arch/riscv/kvm/vcpu_fp.c       | 12 +++---
 arch/riscv/kvm/vcpu_onereg.c   | 68 +++++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
 arch/riscv/kvm/vcpu_timer.c    | 11 +++---
 arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++++--------------
 7 files changed, 104 insertions(+), 69 deletions(-)

-- 
2.41.0


