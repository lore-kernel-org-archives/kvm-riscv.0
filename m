From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 26 Apr 2023 19:13:25 +0200
Subject: [PATCH 0/3] RISC-V: KVM: Ensure SBI extension is enabled
Message-ID: <20230426171328.69663-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure guests can't attempt to invoke SBI extension functions when the
SBI extension's probe function has stated that the extension is not
available.

Andrew Jones (3):
  RISC-V: KVM: Disable SBI extension when its probe fails
  RISC-V: KVM: Rename dis_idx to ext_idx
  RISC-V: KVM: Introduce extension_enabled

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 ++++
 arch/riscv/kvm/vcpu_sbi.c             | 62 +++++++++++++++++----------
 2 files changed, 48 insertions(+), 23 deletions(-)

-- 
2.39.2


