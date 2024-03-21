From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Mar 2024 14:20:39 +0530
Subject: [PATCH 0/2] KVM RISC-V APLIC fixes
Message-ID: <20240321085041.1955293-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Few fixes for KVM RISC-V in-kernel APLIC emulation which were discovered
during Linux AIA driver patch reviews.

These patches can also be found in the riscv_kvm_aplic_fixes_v1
branch at: https://github.com/avpatel/linux.git

Anup Patel (2):
  RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
  RISC-V: KVM: Fix APLIC in_clrip[x] read emulation

 arch/riscv/kvm/aia_aplic.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

-- 
2.34.1


