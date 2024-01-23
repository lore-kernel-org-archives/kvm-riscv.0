From: 秦少青 <qinshaoqing@bosc.ac.cn>
Date: Tue, 23 Jan 2024 10:55:51 +0800 (GMT+08:00)
Subject: [kvmtool PATCH 0/1] riscv: Add zacas extension
Message-ID: <5b92b0c6.94.18d343eddde.Coremail.qinshaoqing@bosc.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> The functionality has been tested on QEMU, the tests rely on kernel and qemu
> support for zacas.
> Currently, there is no patch for zacas on the upstream.
> If you want to test, you could use the following version we released for testing.

About aobve message about:

This patch is to enable Zacas ISA extension for VM.

You could try this patch with below dependencies:

kernel: 
https://github.com/OpenXiangShan/riscv-linux/tree/riscv-zacas
qemu:
https://github.com/OpenXiangShan/qemu/tree/riscv-zacas

qinshaoqing (1):
  Add support for (ratified) Zacas extension

 riscv/fdt.c                         | 1 +
 riscv/include/asm/kvm.h             | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 3 files changed, 5 insertions(+)

-- 
2.43.0
