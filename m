From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 17 Aug 2023 18:23:45 +0200
Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
In-Reply-To: <20230817162344.17076-4-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
Message-ID: <20230817162344.17076-5-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the introduction of the get-reg-list test for riscv, another
directory has been added that should be tracked by riscv kvm
maintainers.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f966f05fb0d..8fc9e6e7f207 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
 F:	tools/testing/selftests/kvm/*/riscv/
+F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.41.0


