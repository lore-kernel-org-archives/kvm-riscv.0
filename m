From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Mon,  4 Dec 2023 15:29:01 -0300
Subject: [PATCH 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Message-ID: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

At this moment we have the following problems in our Vector KVM support:

- we need a way to deliver 'vlenb' to userspace. Otherwise it's not
  possible to determine the right vector regs IDs (since they vary with
  vlenb). In fact, KVM will error out if 'vlenb' has the wrong size,
  even for vector reg 0;

- an appropriate way of delivering 'vlenb' is via get-reg-list, which
  ATM doesn't have any vector CSRs;

- even if we do all that, we're not initializing 'vlenb' at any point.
  Userspace will read vlenb = 0 and won't be able to do much with it.


This series aims to attempts to fix all these problems.


Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 37 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 ++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.41.0


