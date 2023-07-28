From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Fri, 28 Jul 2023 18:01:21 -0300
Subject: [PATCH v2 0/1] RISC-V: KVM: provide UAPI for host SATP mode
Message-ID: <20230728210122.175229-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

This new version is just a rebase after the recent changes made by Anup
that landed in riscv_kvm_queue (introduction of vcpu_onereg.c). No other
changes were made.

Changes from v1:
- rebased with riscv_kvm_queue
- v1 link: https://lore.kernel.org/kvm/20230705091535.237765-1-dbarboza at ventanamicro.com/

Daniel Henrique Barboza (1):
  RISC-V: KVM: provide UAPI for host SATP mode

 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 7 +++++++
 3 files changed, 10 insertions(+)

-- 
2.41.0


