From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2021 10:28:03 +0000
Subject: [PATCH v4 04/11] KVM: mips: Use Makefile.kvm for common files
In-Reply-To: <20211120102810.8858-1-dwmw2@infradead.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
Message-ID: <20211120102810.8858-5-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Woodhouse <dwmw@amazon.co.uk>

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/mips/kvm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index d3710959da55..21ff75bcdbc4 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -2,9 +2,10 @@
 # Makefile for KVM support for MIPS
 #
 
+include $(srctree)/virt/kvm/Makefile.kvm
+
 ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
 
-kvm-y := $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o eventfd.o binary_stats.o)
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
 kvm-y +=    mips.o emulate.o entry.o \
-- 
2.31.1


