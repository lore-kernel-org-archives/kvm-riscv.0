From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue,  1 Aug 2023 19:26:20 -0300
Subject: [PATCH v2 0/9] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230801222629.210929-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

In this new version 3 new patches (6, 7, 8) were added by Andrew's
request during the v1 review.

We're now avoiding throwing an -EBUSY error if a reg write is done after
the vcpu started spinning if the value being written is the same as KVM
already uses. This follows the design choice made in patch 3, allowing
for userspace 'lazy write' of registers.

I decided to add 3 patches instead of one because the no-op check made
in patches 6 and 8 aren't just a matter of doing reg_val = host_val.
They can be squashed in a single patch if required.

Please check the version 1 cover-letter [1] for the motivation behind
this work. Patches were based on top of riscv_kvm_queue.

Changes from v1:
- patches 6,7, 8 (new):
  - make reg writes a no-op, regardless of vcpu->arch.ran_atleast_once
    state, if the value being written is the same as the host
- v1 link: https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza at ventanamicro.com/

[1] https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza at ventanamicro.com/

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
 6 files changed, 71 insertions(+), 42 deletions(-)

-- 
2.41.0


