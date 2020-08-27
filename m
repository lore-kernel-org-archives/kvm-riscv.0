From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 16:22:49 +0800
Subject: [PATCH RFC 0/2] Add log dirty support
Message-ID: <20200827082251.1591-1-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series supports log dirty for migration in RISC-V KVM. Two interfaces
are added for kvm_main.c, and some bugs are fixed.

We have implemented the vm migration in Qemu. So these patches have been
tested.

This series is implemented based on https://github.com/avpatel/linux/tree/riscv_kvm_v13.

Yifei Jiang (2):
  riscv/kvm: Fix use VSIP_VALID_MASK mask HIP register
  target/kvm: Add interfaces needed for log dirty

 arch/riscv/configs/defconfig |  1 +
 arch/riscv/kvm/Kconfig       |  1 +
 arch/riscv/kvm/mmu.c         | 43 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c        |  2 +-
 arch/riscv/kvm/vm.c          |  6 -----
 5 files changed, 46 insertions(+), 7 deletions(-)

-- 
2.19.1



