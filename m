Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6BC71133
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 01:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=867bmHSQyXv/ZsuMUDpT7YAQaiVTQvrOpBl8Fga/8kA=; b=B+vCV1ziKxsZkd
	s1vxCL/8JXCQnLrEgegjIWOCQoIz0HckGc0qSndVq5zL5sh1+KR2vGxNUdtPVW11srjrfC3bPpc/N
	Zv3gom0j3oYQIZraTLdLuKUAumIwiBQp7nT0H/H75IL+tvze8OMrRHCy28Nq9qEnVdZYge8KQJf6D
	vGJOp7+c3r+qKimhnoZBqFQuIMOeI5CON5/7jUhN9feI6Gwko+N/Bv2FNi5y7RAHb9E7sEKLF9dh/
	9vf3uOquSvu6p2eQPMOYA18hGPW/lG+js92qnfCLkEG7mLSptnAO1OXHwla0823IcWk9cL+xJbA1w
	PDnlQRim2I0wEn/I+jHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPACC-00000008XeF-0JY5;
	Wed, 11 Jun 2025 01:24:04 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93N-00000008SBQ-0adR
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-310e7c24158so5721565a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600652; x=1750205452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2yZMyl9DsHgqKNlFS7xPspHEMiNKaL3c340/uFTvPNQ=;
        b=HkvSmbrm8VQt1i60MhqX5ADTUEdmovt4Bp2zJwX2w/inIJd39KGCvXlJ7bZY2nrMc8
         ikqBpk/rMdmYi/Ve/DaPvzEXrchHjX3f5zymvcclMB4oU8SB+f2UwJRuijo9o4SL1MU6
         IUvJcNNK1q889mx6RdmmOf9mkoAcRwuxhKtgj2JcHJB0uakiS/XzxTy7Tr98HBpNZnQW
         adVldhVShu0dBQeRPVoEmJf0Dvznxk2eosQhCs8MCG/4OP3RVO6OHRYy/b/r3rHeqtYu
         qPqam7lv6FdW2X6m5JEWidCSlJB3HpQZy28u6SLEZvk6jKFTS63/lhjEV9PQNWpC+w1u
         wiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600652; x=1750205452;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yZMyl9DsHgqKNlFS7xPspHEMiNKaL3c340/uFTvPNQ=;
        b=ps2zerVCD6KedKnDrtGZBEA3WzPJxT1e4mTQe5B5SuolJ6HqyOwn3nVXbLKsfXnH4L
         WQInVyXofJYcgdcSoPnYQkm7KLFKycnLNkDKAEIcWlX71IwoqTDn6gUQVnDtgn1iuXr9
         kRGaAbwxxeZFM7VmQT/bNBQOklZUFEYRLpCqbAtbqbOKWut4wklwcnZgnhtCUmOm8A1F
         rVJUhDYcXPMg8YpSgRm/hZsrlhS+rQ+hb9w2F/waPW/FIbWRIIixMKOAmat/oYBYb0Hb
         VOf+eRgApbIFwYKjRXku/1L0Z2B91vh1G3xj6daXbj0B6K45DRJ6IB5HN0+oKsiDHV3i
         y1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFU4tXPp4JxPMfZhiKVe2Rrl7hygKIEmdInIcgDgKBszrydKV/XD4yudb00A0YYM3JqmGv09xMW4A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxaNjEr1eaYOeDnCD2Kd/FxqYhFS+oX6WqdEm4d0fLdvLE+xP3
	PLERzOQezYW42Zl5FqvBG7mMbf5nAQZE5rFaoElB0SiAJQTBp4cc68LEcRkkCUTPximnV9w+oN3
	+0TEytA==
X-Google-Smtp-Source: AGHT+IEQs2JsVTUXveb/V9I06jm4zaYAh3wZWMzb/QDiH8+SAZVfaf+ke/+9FbLvW15z7wPEbMAuKp579iM=
X-Received: from pjboh5.prod.google.com ([2002:a17:90b:3a45:b0:2fb:fa85:1678])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc1:b0:313:28e7:af14
 with SMTP id 98e67ed59e1d1-313b1fdabadmr842732a91.19.1749600651929; Tue, 10
 Jun 2025 17:10:51 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:38 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-5-seanjc@google.com>
Subject: [PATCH 4/8] KVM: Move include/kvm/iodev.h to include/linux as kvm_iodev.h
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171053_180236_AE0DB7FD 
X-CRM114-Status: GOOD (  11.97  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move iodev.h, the last remaining holdout in include/kvm, to the standard
include/linux directory as kvm_iodev.h and delete include/kvm.

Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 MAINTAINERS                                | 1 -
 arch/arm64/include/asm/kvm_vgic.h          | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v2.c         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c         | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio.c            | 2 +-
 arch/loongarch/include/asm/kvm_eiointc.h   | 2 +-
 arch/loongarch/include/asm/kvm_ipi.h       | 2 +-
 arch/loongarch/include/asm/kvm_pch_pic.h   | 2 +-
 arch/mips/include/asm/kvm_host.h           | 3 +--
 arch/powerpc/kvm/mpic.c                    | 2 +-
 arch/riscv/kvm/aia_aplic.c                 | 2 +-
 arch/riscv/kvm/aia_imsic.c                 | 2 +-
 arch/x86/kvm/i8254.h                       | 2 +-
 arch/x86/kvm/ioapic.h                      | 2 +-
 arch/x86/kvm/irq.h                         | 2 +-
 arch/x86/kvm/lapic.h                       | 2 +-
 include/{kvm/iodev.h => linux/kvm_iodev.h} | 0
 virt/kvm/coalesced_mmio.c                  | 3 +--
 virt/kvm/eventfd.c                         | 2 +-
 virt/kvm/kvm_main.c                        | 3 +--
 20 files changed, 18 insertions(+), 22 deletions(-)
 rename include/{kvm/iodev.h => linux/kvm_iodev.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10cf54c8f727..a2cd432273e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13011,7 +13011,6 @@ W:	http://www.linux-kvm.org
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
 F:	Documentation/virt/kvm/
 F:	include/asm-generic/kvm*
-F:	include/kvm/iodev.h
 F:	include/linux/kvm*
 F:	include/trace/events/kvm.h
 F:	include/uapi/asm-generic/kvm*
diff --git a/arch/arm64/include/asm/kvm_vgic.h b/arch/arm64/include/asm/kvm_vgic.h
index 4a34f7f0a864..09d7f628fa3b 100644
--- a/arch/arm64/include/asm/kvm_vgic.h
+++ b/arch/arm64/include/asm/kvm_vgic.h
@@ -14,7 +14,7 @@
 #include <linux/static_key.h>
 #include <linux/types.h>
 #include <linux/xarray.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include <linux/list.h>
 #include <linux/jump_label.h>
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index d00c8a74fad6..889440a8b129 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -6,9 +6,9 @@
 #include <linux/irqchip/arm-gic.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/nospec.h>
 
-#include <kvm/iodev.h>
 #include <asm/kvm_vgic.h>
 
 #include "vgic.h"
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 505d4e389885..db95d3ccbd14 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -7,8 +7,8 @@
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/interrupt.h>
-#include <kvm/iodev.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_arm.h>
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index ec1b13abc728..de689e0e881f 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -9,7 +9,7 @@
 #include <linux/irq.h>
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include <asm/kvm_arch_timer.h>
 #include <asm/kvm_vgic.h>
 
diff --git a/arch/loongarch/include/asm/kvm_eiointc.h b/arch/loongarch/include/asm/kvm_eiointc.h
index a3a40aba8acf..0049b0b79477 100644
--- a/arch/loongarch/include/asm/kvm_eiointc.h
+++ b/arch/loongarch/include/asm/kvm_eiointc.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_EIOINTC_H
 #define __ASM_KVM_EIOINTC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define EIOINTC_IRQS			256
 #define EIOINTC_ROUTE_MAX_VCPUS		256
diff --git a/arch/loongarch/include/asm/kvm_ipi.h b/arch/loongarch/include/asm/kvm_ipi.h
index 060163dfb4a3..3956b230f087 100644
--- a/arch/loongarch/include/asm/kvm_ipi.h
+++ b/arch/loongarch/include/asm/kvm_ipi.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_IPI_H
 #define __ASM_KVM_IPI_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define LARCH_INT_IPI			12
 
diff --git a/arch/loongarch/include/asm/kvm_pch_pic.h b/arch/loongarch/include/asm/kvm_pch_pic.h
index e6df6a4c1c70..4b37e3134e52 100644
--- a/arch/loongarch/include/asm/kvm_pch_pic.h
+++ b/arch/loongarch/include/asm/kvm_pch_pic.h
@@ -6,7 +6,7 @@
 #ifndef __ASM_KVM_PCH_PIC_H
 #define __ASM_KVM_PCH_PIC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #define PCH_PIC_SIZE			0x3e8
 
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index c14b10821817..0d7dd89ca5bf 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/types.h>
 #include <linux/kvm.h>
+#include <linux/kvm_iodev.h>
 #include <linux/kvm_types.h>
 #include <linux/threads.h>
 #include <linux/spinlock.h>
@@ -24,8 +25,6 @@
 #include <asm/inst.h>
 #include <asm/mipsregs.h>
 
-#include <kvm/iodev.h>
-
 /* MIPS KVM register ids */
 #define MIPS_CP0_32(_R, _S)					\
 	(KVM_REG_MIPS_CP0 | KVM_REG_SIZE_U32 | (8 * (_R) + (_S)))
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 23e9c2bd9f27..b25a03251544 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/errno.h>
 #include <linux/fs.h>
 #include <linux/anon_inodes.h>
@@ -33,7 +34,6 @@
 #include <asm/mpic.h>
 #include <asm/kvm_para.h>
 #include <asm/kvm_ppc.h>
-#include <kvm/iodev.h>
 
 #define MAX_CPU     32
 #define MAX_SRC     256
diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index f59d1c0c8c43..bf163724aec5 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -9,10 +9,10 @@
 
 #include <linux/irqchip/riscv-aplic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
-#include <kvm/iodev.h>
 
 struct aplic_irq {
 	raw_spinlock_t lock;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..ae3c0807baa9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -11,10 +11,10 @@
 #include <linux/bitmap.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/math.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
-#include <kvm/iodev.h>
 #include <asm/csr.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
diff --git a/arch/x86/kvm/i8254.h b/arch/x86/kvm/i8254.h
index a768212ba821..4de7a0b88e4f 100644
--- a/arch/x86/kvm/i8254.h
+++ b/arch/x86/kvm/i8254.h
@@ -4,7 +4,7 @@
 
 #include <linux/kthread.h>
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 struct kvm_kpit_channel_state {
 	u32 count; /* can be 65536 */
diff --git a/arch/x86/kvm/ioapic.h b/arch/x86/kvm/ioapic.h
index aa8cb4ac0479..cb36c36affd3 100644
--- a/arch/x86/kvm/ioapic.h
+++ b/arch/x86/kvm/ioapic.h
@@ -3,7 +3,7 @@
 #define __KVM_IO_APIC_H
 
 #include <linux/kvm_host.h>
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 #include "irq.h"
 
 struct kvm;
diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
index 76d46b2f41dd..b21b03aa2ee7 100644
--- a/arch/x86/kvm/irq.h
+++ b/arch/x86/kvm/irq.h
@@ -13,9 +13,9 @@
 #include <linux/mm_types.h>
 #include <linux/hrtimer.h>
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/spinlock.h>
 
-#include <kvm/iodev.h>
 #include "lapic.h"
 
 #define PIC_NUM_PINS 16
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 4ce30db65828..43ffbded5f72 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_X86_LAPIC_H
 #define __KVM_X86_LAPIC_H
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #include <linux/kvm_host.h>
 
diff --git a/include/kvm/iodev.h b/include/linux/kvm_iodev.h
similarity index 100%
rename from include/kvm/iodev.h
rename to include/linux/kvm_iodev.h
diff --git a/virt/kvm/coalesced_mmio.c b/virt/kvm/coalesced_mmio.c
index 375d6285475e..d0f84e3611da 100644
--- a/virt/kvm/coalesced_mmio.c
+++ b/virt/kvm/coalesced_mmio.c
@@ -9,8 +9,7 @@
  *
  */
 
-#include <kvm/iodev.h>
-
+#include <linux/kvm_iodev.h>
 #include <linux/kvm_host.h>
 #include <linux/slab.h>
 #include <linux/kvm.h>
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..35786d59b233 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -26,7 +26,7 @@
 #include <linux/irqbypass.h>
 #include <trace/events/kvm.h>
 
-#include <kvm/iodev.h>
+#include <linux/kvm_iodev.h>
 
 #ifdef CONFIG_HAVE_KVM_IRQCHIP
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..a401ba32ecaa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -10,9 +10,8 @@
  *   Yaniv Kamay  <yaniv@qumranet.com>
  */
 
-#include <kvm/iodev.h>
-
 #include <linux/kvm_host.h>
+#include <linux/kvm_iodev.h>
 #include <linux/kvm.h>
 #include <linux/module.h>
 #include <linux/errno.h>
-- 
2.50.0.rc0.642.g800a2b2222-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
