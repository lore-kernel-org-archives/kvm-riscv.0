From: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 16 Nov 2021 11:50:50 +0000
Subject: [PATCH 6/7] KVM: powerpc: Use Makefile.kvm for common files
In-Reply-To: <20211116115051.119956-1-dwmw2@infradead.org>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
Message-ID: <20211116115051.119956-6-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Woodhouse <dwmw@amazon.co.uk>

It's all fairly baroque but in the end, I don't think there's any reason
for $(KVM)/irqchip.o to have been handled differently, as they all end
up in $(kvm-y) in the end anyway, regardless of whether they get there
via $(common-objs-y) and the CPU-specific object lists.

The generic Makefile.kvm uses HAVE_KVM_IRQCHIP for irqchip.o instead of
HAVE_KVM_IRQ_ROUTING. That change is fine (and arguably correct) because
they are both set together for KVM_MPIC, or neither is set.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/powerpc/kvm/Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 583c14ef596e..245f59118413 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -4,11 +4,8 @@
 #
 
 ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
-KVM := ../../../virt/kvm
 
-common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-common-objs-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
-common-objs-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
+include $(srctree)/virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
 obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
@@ -125,7 +122,6 @@ kvm-book3s_32-objs := \
 kvm-objs-$(CONFIG_KVM_BOOK3S_32) := $(kvm-book3s_32-objs)
 
 kvm-objs-$(CONFIG_KVM_MPIC) += mpic.o
-kvm-objs-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
 
 kvm-objs := $(kvm-objs-m) $(kvm-objs-y)
 
-- 
2.31.1


