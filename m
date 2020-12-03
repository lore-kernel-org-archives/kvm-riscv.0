From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:18:36 +0800
Subject: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
Message-ID: <20201203121839.308-1-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series implements guest time scaling based on RDTIME instruction
emulation so that we can allow migrating Guest/VM across Hosts with
different time frequency.

Why not through para-virt. From arm's experience[1], para-virt implementation
doesn't really solve the problem for the following two main reasons:
- RDTIME not only be used in linux, but also in firmware and userspace.
- It is difficult to be compatible with nested virtualization.

[1] https://lore.kernel.org/patchwork/cover/1288153/

Yifei Jiang (3):
  RISC-V: KVM: Change the method of calculating cycles to nanoseconds
  RISC-V: KVM: Support dynamic time frequency from userspace
  RISC-V: KVM: Implement guest time scaling

 arch/riscv/include/asm/csr.h            |  3 ++
 arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
 arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 51 ++++++++++++++++++++++---
 4 files changed, 93 insertions(+), 9 deletions(-)

-- 
2.19.1


