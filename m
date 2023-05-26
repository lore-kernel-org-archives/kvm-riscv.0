From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 26 May 2023 12:25:37 +0200
Subject: [PATCH v2 0/3] RISC-V: KVM: Ensure SBI extension is enabled
Message-ID: <20230526102540.105013-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure guests can't attempt to invoke SBI extension functions when the
SBI extension's probe function has stated that the extension is not
available.

v2:
 - Reworked it to use an enum array instead of two boolean arrays

Andrew Jones (3):
  RISC-V: KVM: Rename dis_idx to ext_idx
  RISC-V: KVM: Convert extension_disabled[] to ext_status[]
  RISC-V: KVM: Probe for SBI extension status

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  8 ++-
 arch/riscv/kvm/vcpu_sbi.c             | 76 +++++++++++++++++++--------
 2 files changed, 60 insertions(+), 24 deletions(-)

-- 
2.40.1


