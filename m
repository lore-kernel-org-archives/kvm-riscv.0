From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 10 Jul 2020 13:55:48 +0530
Subject: [PATCH v13 17/17] RISC-V: KVM: Add MAINTAINERS entry
In-Reply-To: <20200710082548.123180-1-anup.patel@wdc.com>
References: <20200710082548.123180-1-anup.patel@wdc.com>
Message-ID: <20200710082548.123180-18-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add myself as maintainer for KVM RISC-V and Atish as designated reviewer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d4aa7f942de..9a3e6e688479 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9459,6 +9459,17 @@ F:	arch/powerpc/include/uapi/asm/kvm*
 F:	arch/powerpc/kernel/kvm*
 F:	arch/powerpc/kvm/
 
+KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
+M:	Anup Patel <anup.patel@wdc.com>
+R:	Atish Patra <atish.patra@wdc.com>
+L:	kvm at vger.kernel.org
+L:	kvm-riscv at lists.infradead.org
+S:	Maintained
+T:	git git://github.com/kvm-riscv/linux.git
+F:	arch/riscv/include/asm/kvm*
+F:	arch/riscv/include/uapi/asm/kvm*
+F:	arch/riscv/kvm/
+
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@de.ibm.com>
 M:	Janosch Frank <frankja@linux.ibm.com>
-- 
2.25.1


