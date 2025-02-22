Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89340C021B3
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 01:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U0m9TuY2iPbPCy1w0p3hXeqvvqSn7palJeEucHo1R98=; b=eOk/dIv3CjecxW
	1KKJtiZS2HE3ggSPSiX8SOq42jw1PanbmshBF+/ZnT6g/ltomLyHqiQFsfXuya/OPCDr5wtptC3JO
	uowZzPD9crEymeaoc+Ev7X827L/bTVFrKALWAPoN9d6XFKAhEkkxENgacl/c/toWzN/9wJdfDFZfI
	h0K5TxBjeVDQ7+D7Z+4SFNjCNl+xMDW2xnby1a93Y7jI5+Qf+LT5mXbQegj5Z8u4OpprGJAD/YrN5
	socx4m/OFzvm+MfXX4ZuRbISeU9tbpFnT+yPwhkrie8kvF5zxCEd8EVdxy2LFonsPD7ylZH92Pz+X
	ykocNBsYRWCbIrNbidMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tleaC-00000007JRs-2ydy;
	Sat, 22 Feb 2025 01:45:32 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tleaA-00000007JRG-2Z0t
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 01:45:31 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2fc1c3b3dc7so5285119a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 17:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740188729; x=1740793529; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmPD/HrfnLi2sNsvWl/3G9VECFjeZEVyXK4whWeoIMg=;
        b=2M40bAs5I61vfns5ZQrxNEGLYKeNLE495BvrVddg1gt/kZrWrVG3qCrdzCgk59ZxA+
         0TZ6m4EKwLlBG1IyQdETE8CP1pMxzOLpySsGsyQsYSH0sccnQrEdq74JNupizJDPvuec
         Eik0RERQSTWW6umKW2vqM+/SfcdrC6i0+qZMBE8D2oA6bbAeOA0TZj2VaPYT+qYXTBb7
         ojxLHJmUi6SAXegb3SuO9wxeRE/8dko0xxxqsuMHD1jA32x4gRHjdIP9HXGGcDSJFQ/f
         GPZHh2a+Ohn+JBHahF4qY4O0IrWI0USinU3DEi3qfcHa2IrEofCo4jGn/O9P6t2Gapaa
         e6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740188729; x=1740793529;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmPD/HrfnLi2sNsvWl/3G9VECFjeZEVyXK4whWeoIMg=;
        b=J93p/sdRAPysWPBJ/+mt/CZ1olh1BtmMwGZ3ffhXJBUMO4D3s4FOdsHfg9Qv5AGqIh
         kqM8DuCoDls9j6P/r8zaHJ99YtHzgeuXwAYTAMh5wmPgFVLeL+eT+8CITYy0xQ3WZgbp
         bPH841IE7TBWJ61XkrcifJrDfLViRbBv/aX1Ey2g6RLWGYC473tfwq/WfOyg4wlOJqeR
         4fYtQcm8ryP567i0SCdiaeFHd7rQcHtHl2Y0bZ8zKZdv7XeinCGiIs2ERt/tCg20u/do
         n/mbckxAmA+NgA5JpYj32aKfpk0mC8vTqTpbO1ttHh1dCZq/KSxO6Z3ysEvalZTMRreL
         wO9A==
X-Forwarded-Encrypted: i=1; AJvYcCXMJvRh1LF9w4e4vCnmr0BCYy7UwFb8+zGyol4hQg3ygAyEJ/D4K/Ldz5pGw9xRaTpNoIUpOZG7/Iw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+OzuTUPFQbnPoSEmNJxBFPF5Apv9cAuo/ZJCnh+xHpwWUbTxU
	U0P+N5LBhJ9+aa+NE6IveoV5uSfanSVURkTXaLv483gqc5yn8ZVd6gQC8Ou2w5nluBVN3i/WVGo
	n5w==
X-Google-Smtp-Source: AGHT+IEPuNW28N5AWxvZ/P27xQeUcG6Q4FhSwmpHrm/jYaK7EtGafhEp4dzKNdq68R9j0yTESbwMkERjcQs=
X-Received: from pjboe12.prod.google.com ([2002:a17:90b:394c:b0:2fa:1fac:2695])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1344:b0:2fc:a3b7:10a2
 with SMTP id 98e67ed59e1d1-2fce78cb879mr10231690a91.17.1740188729538; Fri, 21
 Feb 2025 17:45:29 -0800 (PST)
Date: Fri, 21 Feb 2025 17:45:26 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222014526.2302653-1-seanjc@google.com>
Subject: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of __ASSEMBLY__
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Laurent Vivier <lvivier@redhat.com>, 
	Thomas Huth <thuth@redhat.com>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_174530_657170_4C52D0D4 
X-CRM114-Status: GOOD (  16.11  )
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

Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
the Linux kernel, and must be manually defined, e.g. through build rules
or with the aforementioned explicit #defines in assembly code.

__ASSEMBLER__ on the other hand is automatically defined by the compiler
when preprocessing assembly, i.e. doesn't require manually #defines for
the code to function correctly.

Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
and is undergoing a parallel cleanup.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---

Completely untested.  This is essentially a "rage" patch after spending
way, way too much time trying to understand why I couldn't include some
__ASSEMBLY__ protected headers in x86 assembly files.
 
 arm/cstart.S                | 1 -
 arm/cstart64.S              | 1 -
 lib/arm/asm/arch_gicv3.h    | 4 ++--
 lib/arm/asm/assembler.h     | 2 +-
 lib/arm/asm/gic-v2.h        | 4 ++--
 lib/arm/asm/gic-v3.h        | 4 ++--
 lib/arm/asm/gic.h           | 4 ++--
 lib/arm/asm/page.h          | 4 ++--
 lib/arm/asm/ptrace.h        | 4 ++--
 lib/arm/asm/sysreg.h        | 4 ++--
 lib/arm/asm/thread_info.h   | 4 ++--
 lib/arm/asm/timer.h         | 4 ++--
 lib/arm64/asm/arch_gicv3.h  | 4 ++--
 lib/arm64/asm/assembler.h   | 2 +-
 lib/arm64/asm/page.h        | 4 ++--
 lib/arm64/asm/processor.h   | 4 ++--
 lib/arm64/asm/ptrace.h      | 4 ++--
 lib/arm64/asm/sysreg.h      | 4 ++--
 lib/asm-generic/page.h      | 4 ++--
 lib/auxinfo.h               | 2 +-
 lib/libcflat.h              | 4 ++--
 lib/libfdt/fdt.h            | 2 +-
 lib/linux/compiler.h        | 4 ++--
 lib/linux/const.h           | 2 +-
 lib/powerpc/asm/hcall.h     | 4 ++--
 lib/powerpc/asm/processor.h | 4 ++--
 lib/powerpc/asm/rtas.h      | 4 ++--
 lib/ppc64/asm/page.h        | 4 ++--
 lib/ppc64/asm/ptrace.h      | 4 ++--
 lib/ppc64/asm/vpa.h         | 4 ++--
 lib/riscv/asm/bug.h         | 2 +-
 lib/riscv/asm/csr.h         | 4 ++--
 lib/riscv/asm/page.h        | 4 ++--
 lib/riscv/asm/sbi.h         | 4 ++--
 lib/riscv/setjmp.S          | 1 -
 powerpc/cstart64.S          | 1 -
 riscv/sbi-asm.S             | 1 -
 37 files changed, 58 insertions(+), 63 deletions(-)

diff --git a/arm/cstart.S b/arm/cstart.S
index 29961c37..60c135fb 100644
--- a/arm/cstart.S
+++ b/arm/cstart.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
-#define __ASSEMBLY__
 #include <auxinfo.h>
 #include <asm/assembler.h>
 #include <asm/thread_info.h>
diff --git a/arm/cstart64.S b/arm/cstart64.S
index b480a552..dd0cce4b 100644
--- a/arm/cstart64.S
+++ b/arm/cstart64.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU GPL, version 2.
  */
-#define __ASSEMBLY__
 #include <auxinfo.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
diff --git a/lib/arm/asm/arch_gicv3.h b/lib/arm/asm/arch_gicv3.h
index 45b60968..0acb22b4 100644
--- a/lib/arm/asm/arch_gicv3.h
+++ b/lib/arm/asm/arch_gicv3.h
@@ -8,7 +8,7 @@
 #ifndef _ASMARM_ARCH_GICV3_H_
 #define _ASMARM_ARCH_GICV3_H_
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <libcflat.h>
 #include <asm/sysreg.h>
 #include <asm/barrier.h>
@@ -61,5 +61,5 @@ static inline u64 gicv3_read_typer(const volatile void __iomem *addr)
 	return val;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_ARCH_GICV3_H_ */
diff --git a/lib/arm/asm/assembler.h b/lib/arm/asm/assembler.h
index 4200252d..5158de8c 100644
--- a/lib/arm/asm/assembler.h
+++ b/lib/arm/asm/assembler.h
@@ -4,7 +4,7 @@
  * arch/arm/mm/proc-v7.S.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #error "Only include this from assembly code"
 #endif
 
diff --git a/lib/arm/asm/gic-v2.h b/lib/arm/asm/gic-v2.h
index ff11afb1..f58d8b6d 100644
--- a/lib/arm/asm/gic-v2.h
+++ b/lib/arm/asm/gic-v2.h
@@ -17,7 +17,7 @@
 #define GICC_ENABLE			0x1
 #define GICC_IAR_INT_ID_MASK		0x3ff
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <cpumask.h>
 
 struct gicv2_data {
@@ -38,5 +38,5 @@ extern void gicv2_write_eoir(u32 irqstat);
 extern void gicv2_ipi_send_single(int irq, int cpu);
 extern void gicv2_ipi_send_mask(int irq, const cpumask_t *dest);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_GIC_V2_H_ */
diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index a1cc62a2..85520e3e 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -66,7 +66,7 @@
 
 #include <asm/arch_gicv3.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <cpumask.h>
 #include <asm/setup.h>
 #include <asm/processor.h>
@@ -153,5 +153,5 @@ static inline u64 mpidr_uncompress(u32 compressed)
 
 #define gicv3_lpi_get_config(intid) (gicv3_data.lpi_prop[LPI_OFFSET(intid)])
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_GIC_V3_H_ */
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index dc8cc18c..e6ba77e4 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -46,7 +46,7 @@
 #define PPI(irq)			((irq) + 16)
 #define SPI(irq)			((irq) + GIC_FIRST_SPI)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <cpumask.h>
 
 enum gic_irq_state {
@@ -88,5 +88,5 @@ void gic_irq_set_clr_enable(int irq, bool enable);
 #define gic_enable_irq(irq) gic_irq_set_clr_enable(irq, true)
 #define gic_disable_irq(irq) gic_irq_set_clr_enable(irq, false)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_GIC_H_ */
diff --git a/lib/arm/asm/page.h b/lib/arm/asm/page.h
index 8eb4a883..f2847e98 100644
--- a/lib/arm/asm/page.h
+++ b/lib/arm/asm/page.h
@@ -12,7 +12,7 @@
 #define PAGE_SIZE		(_AC(1,UL) << PAGE_SHIFT)
 #define PAGE_MASK		(~(PAGE_SIZE-1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define PAGE_ALIGN(addr)	ALIGN(addr, PAGE_SIZE)
 
@@ -49,5 +49,5 @@ extern unsigned long __phys_to_virt(phys_addr_t addr);
 
 extern void *__ioremap(phys_addr_t phys_addr, size_t size);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_PAGE_H_ */
diff --git a/lib/arm/asm/ptrace.h b/lib/arm/asm/ptrace.h
index 02bb2ccb..6f6a7a41 100644
--- a/lib/arm/asm/ptrace.h
+++ b/lib/arm/asm/ptrace.h
@@ -52,7 +52,7 @@
 #define PSR_IT_MASK	0x0600fc00	/* If-Then execution state mask */
 #define PSR_ENDIAN_MASK	0x00000200	/* Endianness state mask */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <libcflat.h>
 
 struct pt_regs {
@@ -100,5 +100,5 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 	return *(unsigned long *)((unsigned long)regs + offset);
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_PTRACE_H_ */
diff --git a/lib/arm/asm/sysreg.h b/lib/arm/asm/sysreg.h
index 96843386..7827f8ea 100644
--- a/lib/arm/asm/sysreg.h
+++ b/lib/arm/asm/sysreg.h
@@ -38,7 +38,7 @@
 #define CR_AFE	(1 << 29)	/* Access flag enable			*/
 #define CR_TE	(1 << 30)	/* Thumb exception enable		*/
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <libcflat.h>
 
 #define __ACCESS_CP15(CRn, Op1, CRm, Op2)			\
@@ -60,6 +60,6 @@
 
 #define __write_sysreg(v, r, w, c, t)   asm volatile(w " " c : : "r" ((t)(v)))
 #define write_sysreg(v, ...)            __write_sysreg(v, __VA_ARGS__)
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASMARM_SYSREG_H_ */
diff --git a/lib/arm/asm/thread_info.h b/lib/arm/asm/thread_info.h
index eaa72582..be5a060b 100644
--- a/lib/arm/asm/thread_info.h
+++ b/lib/arm/asm/thread_info.h
@@ -22,7 +22,7 @@
 #define THREAD_ALIGNMENT	THREAD_SIZE
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/processor.h>
 #include <alloc.h>
 
@@ -73,5 +73,5 @@ static inline struct thread_info *current_thread_info(void)
 
 extern void thread_info_init(struct thread_info *ti, unsigned int flags);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_THREAD_INFO_H_ */
diff --git a/lib/arm/asm/timer.h b/lib/arm/asm/timer.h
index aaf839fc..fd8f7796 100644
--- a/lib/arm/asm/timer.h
+++ b/lib/arm/asm/timer.h
@@ -10,7 +10,7 @@
 #define ARCH_TIMER_CTL_IMASK   (1 << 1)
 #define ARCH_TIMER_CTL_ISTATUS (1 << 2)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct timer_state {
 	struct {
@@ -29,5 +29,5 @@ extern struct timer_state __timer_state;
 
 void timer_save_state(void);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM_TIMER_H_ */
diff --git a/lib/arm64/asm/arch_gicv3.h b/lib/arm64/asm/arch_gicv3.h
index fdee4de1..3ea3ce9e 100644
--- a/lib/arm64/asm/arch_gicv3.h
+++ b/lib/arm64/asm/arch_gicv3.h
@@ -10,7 +10,7 @@
 
 #include <asm/sysreg.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <libcflat.h>
 #include <asm/barrier.h>
@@ -54,5 +54,5 @@ static inline void gicv3_write_grpen1(u32 val)
 
 #define gicv3_read_typer(c) readq(c)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM64_ARCH_GICV3_H_ */
diff --git a/lib/arm64/asm/assembler.h b/lib/arm64/asm/assembler.h
index aa8c65a2..388cf09a 100644
--- a/lib/arm64/asm/assembler.h
+++ b/lib/arm64/asm/assembler.h
@@ -8,7 +8,7 @@
  * Copyright (C) 2012 ARM Ltd.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #error "Only include this from assembly code"
 #endif
 
diff --git a/lib/arm64/asm/page.h b/lib/arm64/asm/page.h
index d0fac6ea..c0b723e9 100644
--- a/lib/arm64/asm/page.h
+++ b/lib/arm64/asm/page.h
@@ -37,7 +37,7 @@
 #define PGTABLE_LEVELS \
 	(((VA_BITS - PAGE_SHIFT) + ((PAGE_SHIFT - 3) - 1)) / (PAGE_SHIFT - 3))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define PAGE_ALIGN(addr)	ALIGN(addr, PAGE_SIZE)
 
@@ -74,5 +74,5 @@ extern unsigned long __phys_to_virt(phys_addr_t addr);
 
 extern void *__ioremap(phys_addr_t phys_addr, size_t size);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM64_PAGE_H_ */
diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index e5b0ad10..32ddc1b3 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -6,7 +6,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <asm/ptrace.h>
 #include <asm/esr.h>
 #include <asm/sysreg.h>
@@ -173,5 +173,5 @@ static inline bool system_supports_rndr(void)
 	return ((id_aa64isar0_el1 >> ID_AA64ISAR0_EL1_RNDR_SHIFT) & 0xf) != 0;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM64_PROCESSOR_H_ */
diff --git a/lib/arm64/asm/ptrace.h b/lib/arm64/asm/ptrace.h
index ccb38dc6..1949f097 100644
--- a/lib/arm64/asm/ptrace.h
+++ b/lib/arm64/asm/ptrace.h
@@ -48,7 +48,7 @@
 #define PSR_x		0x0000ff00	/* Extension            */
 #define PSR_c		0x000000ff	/* Control              */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <libcflat.h>
 
 struct user_pt_regs {
@@ -95,5 +95,5 @@ struct pt_regs {
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->pstate & PSR_F_BIT))
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMARM64_PTRACE_H_ */
diff --git a/lib/arm64/asm/sysreg.h b/lib/arm64/asm/sysreg.h
index f214a4f0..2b76aed9 100644
--- a/lib/arm64/asm/sysreg.h
+++ b/lib/arm64/asm/sysreg.h
@@ -13,7 +13,7 @@
 #define sys_reg(op0, op1, crn, crm, op2) \
 	((((op0)&3)<<19)|((op1)<<16)|((crn)<<12)|((crm)<<8)|((op2)<<5))
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
 	.equ	.L__reg_num_x\num, \num
 	.endr
@@ -71,7 +71,7 @@ asm(
 "	.inst	0xd5000000|(\\sreg)|(.L__reg_num_\\rt)\n"
 "	.endm\n"
 );
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #define ID_AA64ISAR0_EL1_RNDR_SHIFT	60
 
diff --git a/lib/asm-generic/page.h b/lib/asm-generic/page.h
index 2ed77f4c..74f4751a 100644
--- a/lib/asm-generic/page.h
+++ b/lib/asm-generic/page.h
@@ -15,7 +15,7 @@
 #define PAGE_SIZE		(_AC(1,UL) << PAGE_SHIFT)
 #define PAGE_MASK		(~(PAGE_SIZE-1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define PAGE_ALIGN(addr)	ALIGN(addr, PAGE_SIZE)
 
@@ -26,6 +26,6 @@
 #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
 #define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* _ASM_GENERIC_PAGE_H_ */
diff --git a/lib/auxinfo.h b/lib/auxinfo.h
index a46a1e6f..877f13d8 100644
--- a/lib/auxinfo.h
+++ b/lib/auxinfo.h
@@ -7,7 +7,7 @@
 
 #define AUXINFO_MMU_OFF (1 << 0)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 struct auxinfo {
 	const char *progname;
 	unsigned long flags;
diff --git a/lib/libcflat.h b/lib/libcflat.h
index b4110b9e..261f7486 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -20,7 +20,7 @@
 #ifndef _LIBCFLAT_H_
 #define _LIBCFLAT_H_
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/compiler.h>
 #include <stdarg.h>
@@ -155,7 +155,7 @@ do {									\
 void binstr(unsigned long x, char out[BINSTR_SZ]);
 void print_binstr(unsigned long x);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #define SZ_256			(1 << 8)
 #define SZ_4K			(1 << 12)
diff --git a/lib/libfdt/fdt.h b/lib/libfdt/fdt.h
index f2e68807..57fe5663 100644
--- a/lib/libfdt/fdt.h
+++ b/lib/libfdt/fdt.h
@@ -7,7 +7,7 @@
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct fdt_header {
 	fdt32_t magic;			 /* magic word FDT_MAGIC */
diff --git a/lib/linux/compiler.h b/lib/linux/compiler.h
index bf3313bd..8e62aae0 100644
--- a/lib/linux/compiler.h
+++ b/lib/linux/compiler.h
@@ -6,7 +6,7 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define GCC_VERSION (__GNUC__ * 10000           \
 		     + __GNUC_MINOR__ * 100     \
@@ -121,5 +121,5 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 	__u.__val;					\
 })
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* !__LINUX_COMPILER_H */
diff --git a/lib/linux/const.h b/lib/linux/const.h
index f622fa85..c92ba549 100644
--- a/lib/linux/const.h
+++ b/lib/linux/const.h
@@ -12,7 +12,7 @@
  * leave it unchanged in asm.
  */
 
-#if defined(__ASSEMBLY__) || defined(__ASSEMBLER__)
+#ifdef __ASSEMBLER__
 #define _AC(X,Y)	X
 #define _AT(T,X)	X
 #define __ASM_STR(X)	X
diff --git a/lib/powerpc/asm/hcall.h b/lib/powerpc/asm/hcall.h
index 3b44dd20..642e4aa7 100644
--- a/lib/powerpc/asm/hcall.h
+++ b/lib/powerpc/asm/hcall.h
@@ -34,7 +34,7 @@
 #define KVMPPC_HCALL_BASE	0xf000
 #define KVMPPC_H_RTAS		(KVMPPC_HCALL_BASE + 0x0)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * hcall_have_broken_sc1 checks if we're on a host with a broken sc1.
  * Returns 0 if we're not.
@@ -49,5 +49,5 @@ extern int hcall_have_broken_sc1(void);
  */
 extern unsigned long hcall(unsigned long nr, ...);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMPOWERPC_HCALL_H_ */
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 9609c9c6..153126fe 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -5,10 +5,10 @@
 #include <asm/ptrace.h>
 #include <asm/reg.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 extern bool host_is_tcg;
 extern bool host_is_kvm;
diff --git a/lib/powerpc/asm/rtas.h b/lib/powerpc/asm/rtas.h
index 364bf935..989b21bd 100644
--- a/lib/powerpc/asm/rtas.h
+++ b/lib/powerpc/asm/rtas.h
@@ -6,7 +6,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <libcflat.h>
 
@@ -27,7 +27,7 @@ extern int rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int
 
 extern void rtas_power_off(void);
 extern void rtas_stop_self(void);
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #define RTAS_MSR_MASK 0xfffffffffffffffe
 
diff --git a/lib/ppc64/asm/page.h b/lib/ppc64/asm/page.h
index c497d86b..4a7ac9ec 100644
--- a/lib/ppc64/asm/page.h
+++ b/lib/ppc64/asm/page.h
@@ -24,7 +24,7 @@
 #endif
 #define PAGE_MASK		(~(PAGE_SIZE-1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define PAGE_ALIGN(addr)	ALIGN(addr, PAGE_SIZE)
 
@@ -61,5 +61,5 @@ extern unsigned long __phys_to_virt(phys_addr_t addr);
 
 extern void *__ioremap(phys_addr_t phys_addr, size_t size);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMPPC64_PAGE_H_ */
diff --git a/lib/ppc64/asm/ptrace.h b/lib/ppc64/asm/ptrace.h
index db263a59..133ad2f9 100644
--- a/lib/ppc64/asm/ptrace.h
+++ b/lib/ppc64/asm/ptrace.h
@@ -4,7 +4,7 @@
 #define KERNEL_REDZONE_SIZE	288
 #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack frame */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/reg.h>
 
@@ -36,6 +36,6 @@ static inline void regs_advance_insn(struct pt_regs *regs)
 #define STACK_INT_FRAME_SIZE    (sizeof(struct pt_regs) + \
 				 STACK_FRAME_OVERHEAD + KERNEL_REDZONE_SIZE)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASMPPC64_PTRACE_H_ */
diff --git a/lib/ppc64/asm/vpa.h b/lib/ppc64/asm/vpa.h
index 11dde018..2afa3fff 100644
--- a/lib/ppc64/asm/vpa.h
+++ b/lib/ppc64/asm/vpa.h
@@ -4,7 +4,7 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct vpa {
 	uint32_t	descriptor;
@@ -57,6 +57,6 @@ struct vpa {
 	uint8_t		reserved10[96];
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _ASMPOWERPC_VPA_H_ */
diff --git a/lib/riscv/asm/bug.h b/lib/riscv/asm/bug.h
index a6f4136b..8a24e0f4 100644
--- a/lib/riscv/asm/bug.h
+++ b/lib/riscv/asm/bug.h
@@ -2,7 +2,7 @@
 #ifndef _ASMRISCV_BUG_H_
 #define _ASMRISCV_BUG_H_
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 static inline void bug(void)
 {
diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index 16f5ddd7..c7fc87a9 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -56,7 +56,7 @@
 
 #define IP_TIP			IE_TIE
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define csr_swap(csr, val)					\
 ({								\
@@ -118,5 +118,5 @@
 				: "memory");			\
 })
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMRISCV_CSR_H_ */
diff --git a/lib/riscv/asm/page.h b/lib/riscv/asm/page.h
index 07b482f7..26f6b8ab 100644
--- a/lib/riscv/asm/page.h
+++ b/lib/riscv/asm/page.h
@@ -2,7 +2,7 @@
 #ifndef _ASMRISCV_PAGE_H_
 #define _ASMRISCV_PAGE_H_
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef unsigned long pgd_t;
 typedef unsigned long pte_t;
@@ -14,7 +14,7 @@ typedef unsigned long pteval_t;
 #define __pte(x)		((pte_t)(x))
 #define __pgprot(x)		((pgprot_t)(x))
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #include <asm-generic/page.h>
 
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 98a9b097..2af1208a 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -12,7 +12,7 @@
 #define SBI_ERR_ALREADY_STARTED		-7
 #define SBI_ERR_ALREADY_STOPPED		-8
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #include <cpumask.h>
 
 enum sbi_ext_id {
@@ -92,5 +92,5 @@ struct sbiret sbi_send_ipi_broadcast(void);
 struct sbiret sbi_set_timer(unsigned long stime_value);
 long sbi_probe(int ext);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* _ASMRISCV_SBI_H_ */
diff --git a/lib/riscv/setjmp.S b/lib/riscv/setjmp.S
index 38b0f1ca..7d3fa9ab 100644
--- a/lib/riscv/setjmp.S
+++ b/lib/riscv/setjmp.S
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#define __ASSEMBLY__
 #include <asm/asm.h>
 
 .section .text
diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
index b4eb7069..86dfc7fc 100644
--- a/powerpc/cstart64.S
+++ b/powerpc/cstart64.S
@@ -5,7 +5,6 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
-#define __ASSEMBLY__
 #include <asm/hcall.h>
 #include <asm/ppc_asm.h>
 #include <asm/rtas.h>
diff --git a/riscv/sbi-asm.S b/riscv/sbi-asm.S
index 923c2cec..f4185496 100644
--- a/riscv/sbi-asm.S
+++ b/riscv/sbi-asm.S
@@ -4,7 +4,6 @@
  *
  * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
  */
-#define __ASSEMBLY__
 #include <asm/asm.h>
 #include <asm/csr.h>
 

base-commit: f77fb696cfd0e4a5562cdca189be557946bf522f
-- 
2.48.1.601.g30ceb7b040-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
