From: Randy Dunlap <rdunlap@infradead.org>
Date: Sat,  6 Nov 2021 20:47:06 -0700
Subject: [PATCH] riscv: kvm: fix non-kernel-doc comment block
Message-ID: <20211107034706.30672-1-rdunlap@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't use "/**" to begin a comment block for a non-kernel-doc comment.

Prevents this docs build warning:

vcpu_sbi.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Copyright (c) 2019 Western Digital Corporation or its affiliates.

Fixes: dea8ee31a039 ("RISC-V: KVM: Add SBI v0.1 support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: kvm at vger.kernel.org
Cc: kvm-riscv at lists.infradead.org
Cc: linux-riscv at lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/kvm/vcpu_sbi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211106.orig/arch/riscv/kvm/vcpu_sbi.c
+++ linux-next-20211106/arch/riscv/kvm/vcpu_sbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  *
  * Authors:

