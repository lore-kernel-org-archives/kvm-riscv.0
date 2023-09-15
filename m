From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 15 Sep 2023 08:26:56 +0000
Subject: [PATCH 0/2] Add Svadu Extension Support
Message-ID: <20230915082701.3643-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Svadu is a RISC-V extension for hardware updating of PTE A/D bits. This
patch set adds support to enable Svadu extension for both host and guest
OS. 

Yong-Xuan Wang (2):
  RISC-V: Detect and Enable Svadu Extension Support
  RISC-V: KVM: Add Svadu Extension Support for Guest/VM

 arch/riscv/include/asm/csr.h      | 1 +
 arch/riscv/include/asm/hwcap.h    | 1 +
 arch/riscv/include/asm/pgtable.h  | 6 ++++++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kernel/cpufeature.c    | 1 +
 arch/riscv/kvm/vcpu.c             | 3 +++
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 7 files changed, 14 insertions(+)

-- 
2.17.1


