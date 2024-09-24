From: zhouquan@iscas.ac.cn <zhouquan@iscas.ac.cn>
Date: Tue, 24 Sep 2024 19:03:27 +0800
Subject: [kvmtool PATCH 0/2] Add riscv isa exts based on linux-6.11
Message-ID: <cover.1727174321.git.zhouquan@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Quan Zhou <zhouquan@iscas.ac.cn>

Add support for a few Zc* extensions, Zimop, Zcmop and Zawrs.

Quan Zhou (2):
  Sync-up headers with Linux-6.11 kernel
  riscv: Add Zc*/Zimop/Zcmop/Zawrs exts support

 include/linux/kvm.h                 | 27 +++++++++++++++-
 powerpc/include/asm/kvm.h           |  3 ++
 riscv/fdt.c                         |  7 +++++
 riscv/include/asm/kvm.h             |  7 +++++
 riscv/include/kvm/kvm-config-arch.h | 21 +++++++++++++
 x86/include/asm/kvm.h               | 49 +++++++++++++++++++++++++++++
 6 files changed, 113 insertions(+), 1 deletion(-)


base-commit: b48735e5d562eaffb96cf98a91da212176f1534c
-- 
2.34.1


