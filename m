From: zhouquan@iscas.ac.cn <zhouquan@iscas.ac.cn>
Date: Thu, 28 Nov 2024 11:20:53 +0800
Subject: [PATCH 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for guests
Message-ID: <cover.1732762121.git.zhouquan@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Quan Zhou <zhouquan@iscas.ac.cn>

Advertise Svvptc/Zabha/Ziccrse extensions to KVM guest
when underlying host supports it.

Quan Zhou (4):
  RISC-V: KVM: Allow Svvptc extension for Guest/VM
  RISC-V: KVM: Allow Zabha extension for Guest/VM
  RISC-V: KVM: Allow Ziccrse extension for Guest/VM
  KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list
    test

 arch/riscv/include/uapi/asm/kvm.h                |  3 +++
 arch/riscv/kvm/vcpu_onereg.c                     |  6 ++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
 3 files changed, 21 insertions(+)

-- 
2.34.1


