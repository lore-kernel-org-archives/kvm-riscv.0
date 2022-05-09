From: Anup Patel <anup@brainfault.org>
Date: Mon,  9 May 2022 11:36:34 +0530
Subject: [PATCH] MAINTAINERS: Update KVM RISC-V entry to cover selftests
 support
Message-ID: <20220509060634.134068-1-anup@brainfault.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We update KVM RISC-V maintainers entry to include appropriate KVM
selftests directories so that RISC-V related KVM selftests patches
are CC'ed to KVM RISC-V mailing list.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8c52d0192a6..ee73a71c1500 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10767,6 +10767,8 @@ T:	git git://github.com/kvm-riscv/linux.git
 F:	arch/riscv/include/asm/kvm*
 F:	arch/riscv/include/uapi/asm/kvm*
 F:	arch/riscv/kvm/
+F:	tools/testing/selftests/kvm/*/riscv/
+F:	tools/testing/selftests/kvm/riscv/
 
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@linux.ibm.com>
-- 
2.34.1


