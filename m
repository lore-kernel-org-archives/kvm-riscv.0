Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA1C531D0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws09miKRk0QgvpUAQQJd5JsXh9BkCep5pp7vynHJono=; b=sdRnni/Ievnt7i
	hR3z6Xzs7OXG0JcsxvYaTlypOBUvs55+hhzVVwsJpx2TqUHC6vEgHjmJq+nDplqW/UioRdrDnMkpb
	MB9OdNM7S+btw7IyePv5YPi6L8q0DHgD1nS3MYHpCmHtO2xzxoK90ht+zJwZBUJRi4oNYSqwU3hOq
	oYtjM7y4W2r31A65Lt6WyxKmSi8/UOm6COBIdo42e2isrFB1YiTQOpfIxhXXbyPwk+/cOPTeEVRDg
	YidcHSGi3Q9g5rm2yDg9Pg54Gq9MG2b0W6ZjEyHMTnFNNJf2m8qOpPZozUf4WS+82Z+R3nJuZEYHe
	2xuZstblAYmHflkFngrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKhv-00000009es2-0WWm;
	Thu, 30 Jul 2026 06:57:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKhs-00000009er6-0TEq
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:57:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84830c774a0so2019123b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785394647; x=1785999447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0bqHSBno1itPdYwAirS3i7PKnmNCD7Zwnd30AX+3u5s=;
        b=rP7oDqJPPuZE3e7WKty7b5hA/WybfvrRpYTjTet3+NlOeC+44BuRJQJcdkQysV3Fnj
         RJcmnd55ou42DLSZN2Z45i36lhe2GCQYRsnkM1s9aQJFo8RU+ZlhuwDNezB3P6GrCEcY
         mZErFM0FCk8NWiNHTVwBTvf6RGVI4GAu7sI805BrFcFmgnPysxs870GQQs0+FzHEOIwE
         Wf7hlzLwQ40bOEXFfyKYZSCU/ZtuW/AfF7tWldpPnmyyleiu03YzmnMfC28l3yIDWsQj
         apF1wn6WjhFJEbUupXe/b2ZImGTfwfAQogKOAjHXcl+SCVnwcaFCPgMC81y01a4Qskii
         67/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785394647; x=1785999447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0bqHSBno1itPdYwAirS3i7PKnmNCD7Zwnd30AX+3u5s=;
        b=CHsbcvqSAyjlMYI83qMV1N1M46rZ5DaiQ4Xa3rgNJ4EBJYnN886X+vufF4nxmxrrvd
         pVYn6IVGXLfU8SlCg6aQuziDY7pqLIsnmMg+S2hHrRFj+zNy+xdb9f9AnW2T680jTvF3
         I/AaZj6WrKToklGVOoYwjk6TdU2Q6nHg5fIZ+4A2RM08y1yGIAFUu49NAAG7HmxoHMCC
         0aBwM4sN1bicpp8i5kmbhdhwG+78Jsa2JEWVcWkhlym9jqQmO0bPSPi04qYusn0TTKDz
         h9e+OkFIi2AGdCA3H37M6VlCZbimYZcUVQli/i+ElrZFPfT6aJeZi2Dx5Bicm2UfffQT
         aApA==
X-Forwarded-Encrypted: i=1; AHgh+RrHUVVase/fT6BNhW/JoOojlkAp8/y4kYJ+EJcUj/US2LFqhr2QpGE8/oUeOFKLMo8Em8bXwx7Kfss=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRIkq55hrYP+lF89kVVim1qfum+fuRAKeYpuzRZZRb46duMh7+
	y6B6v06azr5cQ/cKf02hPRB9vxGmDKR+8Qzba0SKqr+/gn8IJB+nLUb8
X-Gm-Gg: AR+sD11B7ILPqKvf3wT+/dabPAjulas5APfx9gBkLc+HtwsiUJ2zUrLQiF5kZwVVNCh
	qe1aMXHEXAsTM3tF0TFzcRhEzhSBhV5a8VAhKwpdfjltgo5Uz3MWOR5ojTwXPLACP6vpCNAFwW6
	svLJqidbOPm8k1w3cKOFWJL83Rz6afYIBzuX1gfGgfzKCmLINhLWfWfpLykzv/MFoFCYGlIaHBv
	/vUT+ri+oKUYy7DQdNWV5q/v7YfifxP8eCaKJ0enLCNElygStIqsOmwjmVHRHZ85e30u7RvVuaH
	2Oz415vw4bQeqUbLH5Auo6smTH4DWP+ri3D9ZwcAViqc8Sm4kA0gK1oS9LAA3KUzOQ545Mhrcf2
	WRwSI8X9NoNMvZiTFp3JUPKWwVOU5SVIHSuoqQ1Juy3ZjmJvVHH3NlDrFvdr5OePr8aUOZQ65n9
	RgSPLtc6oS4pZ1iMnt+wb+UIJwYi6QlCJPUoGBafu8PEae97INHo7WBTFYfTPPIu3wfpNXSJIM/
	Q3HV6NRNGGUrhzxHQ==
X-Received: by 2002:a05:6a00:4f94:b0:84e:223b:98c2 with SMTP id d2e1a72fcca58-84ebc4918fdmr1429162b3a.77.1785394647042;
        Wed, 29 Jul 2026 23:57:27 -0700 (PDT)
Received: from cyh-System-Product-Name.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa4afsm2481712b3a.33.2026.07.29.23.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:57:26 -0700 (PDT)
From: "Yuhang.Chen" <yhchen312@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2] RISC-V: KVM: Add arch-specific tracepoints
Date: Thu, 30 Jul 2026 14:57:11 +0800
Message-Id: <20260730065711.3721489-1-yhchen312@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626103619.174179-1-yhchen312@gmail.com>
References: <20260626103619.174179-1-yhchen312@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_235728_165949_432E20C1 
X-CRM114-Status: GOOD (  16.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Add RISC-V KVM tracepoints for events that are useful when debugging
guest exits and in-kernel emulation paths. The existing kvm_entry and
kvm_exit tracepoints are kept, with the kvm_entry PC format fixed to use
zero-padded hexadecimal output.

The newly added tracepoints cover:

- kvm_vcpu_exit for synchronous guest traps
- kvm_vcpu_irq for VS-mode interrupt set/clear
- kvm_mmio_emulate for MMIO load/store emulation

kvm_vcpu_exit reports the full trap context (sepc/scause/stval/htval/
htinst) so userspace can filter by scause, and is placed after the
interrupt early-return so it fires only for synchronous traps.
kvm_vcpu_irq covers every set/unset_interrupt() caller from a single
place.

Example trace output:

kvm_vcpu_exit:
VCPU: 0, SEPC: 0x80200000, SCAUSE: 0x17,
STVAL: 0x10000000, HTVAL: 0x4000000, HTINST: 0x2023

kvm_mmio_emulate:
VCPU: 0, Store MMIO at 0x10000000, len 4, insn 0x2023, sepc 0x80200000

kvm_vcpu_irq:
VCPU: 0, IRQ: 10, level: 1

Testing:

A QEMU-based test program was used to exercise:

- Guest page faults
- MMIO emulation
- IRQ injection

Verified trace output generation for:

- kvm_vcpu_exit
- kvm_vcpu_irq
- kvm_mmio_emulate

Assisted-by: YuanSheng:deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Yuhang.Chen <yhchen312@gmail.com>
---
Changes in v2, per Anup Patel's review [1]:

- Replace the per-cause tracepoints kvm_guest_fault, kvm_sbi_ecall,
  kvm_wait_riscv and kvm_csr_access with a single generic kvm_vcpu_exit
  tracepoint that reports the full trap context (sepc/scause/stval/
  htval/htinst).
- Replace kvm_irq_line and kvm_timer_update_irq with a single generic
  kvm_vcpu_irq tracepoint covering all set/unset_interrupt() callers.
- Keep kvm_mmio_emulate.
- Drop the now-unused trace.h includes from vcpu_sbi.c, vcpu_timer.c
  and vm.c.

[1] https://lore.kernel.org/all/CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com/
---
 arch/riscv/kvm/trace.h     | 81 +++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu.c      |  4 ++
 arch/riscv/kvm/vcpu_exit.c |  4 ++
 arch/riscv/kvm/vcpu_insn.c | 13 +++++-
 4 files changed, 98 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 3d54175d805c..23a5fd1b686e 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -25,7 +25,7 @@ TRACE_EVENT(kvm_entry,
 		__entry->pc	= vcpu->arch.guest_context.sepc;
 	),
 
-	TP_printk("PC: 0x016%lx", __entry->pc)
+	TP_printk("PC: 0x%016lx", __entry->pc)
 );
 
 TRACE_EVENT(kvm_exit,
@@ -56,7 +56,84 @@ TRACE_EVENT(kvm_exit,
 		__entry->htinst)
 );
 
-#endif /* _TRACE_RSICV_KVM_H */
+TRACE_EVENT(kvm_mmio_emulate,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long insn,
+		 unsigned long fault_addr, bool write, int len),
+	TP_ARGS(vcpu_id, sepc, insn, fault_addr, write, len),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, insn)
+		__field(unsigned long, fault_addr)
+		__field(bool, write)
+		__field(int, len)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->insn		= insn;
+		__entry->fault_addr	= fault_addr;
+		__entry->write		= write;
+		__entry->len		= len;
+	),
+
+	TP_printk("VCPU: %lu, %s MMIO at 0x%lx, len %d, insn 0x%lx, sepc 0x%lx",
+		  __entry->vcpu_id, __entry->write ? "Store" : "Load",
+		  __entry->fault_addr, __entry->len, __entry->insn,
+		  __entry->sepc)
+);
+
+TRACE_EVENT(kvm_vcpu_exit,
+	TP_PROTO(unsigned long vcpu_id, unsigned long sepc, unsigned long scause,
+		 unsigned long stval, unsigned long htval, unsigned long htinst),
+	TP_ARGS(vcpu_id, sepc, scause, stval, htval, htinst),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned long, sepc)
+		__field(unsigned long, scause)
+		__field(unsigned long, stval)
+		__field(unsigned long, htval)
+		__field(unsigned long, htinst)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->sepc		= sepc;
+		__entry->scause		= scause;
+		__entry->stval		= stval;
+		__entry->htval		= htval;
+		__entry->htinst		= htinst;
+	),
+
+	TP_printk("VCPU: %lu, SEPC: 0x%lx, SCAUSE: 0x%lx, STVAL: 0x%lx, HTVAL: 0x%lx, HTINST: 0x%lx",
+		  __entry->vcpu_id, __entry->sepc, __entry->scause,
+		  __entry->stval, __entry->htval, __entry->htinst)
+);
+
+TRACE_EVENT(kvm_vcpu_irq,
+	TP_PROTO(unsigned long vcpu_id, unsigned int irq, int level),
+	TP_ARGS(vcpu_id, irq, level),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, vcpu_id)
+		__field(unsigned int, irq)
+		__field(int, level)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id	= vcpu_id;
+		__entry->irq		= irq;
+		__entry->level		= level;
+	),
+
+	TP_printk("VCPU: %lu, IRQ: %u, level: %d",
+		  __entry->vcpu_id, __entry->irq, __entry->level)
+);
+
+#endif /* _TRACE_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 977e36ab83d3..c0556cb4caa5 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -439,6 +439,8 @@ int kvm_riscv_vcpu_set_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 	__set_bit(irq, vcpu->arch.irqs_pending_mask);
 	raw_spin_unlock_irqrestore(&vcpu->arch.irqs_pending_lock, flags);
 
+	trace_kvm_vcpu_irq(vcpu->vcpu_id, irq, 1);
+
 	kvm_vcpu_kick(vcpu);
 
 	return 0;
@@ -465,6 +467,8 @@ int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 	__set_bit(irq, vcpu->arch.irqs_pending_mask);
 	raw_spin_unlock_irqrestore(&vcpu->arch.irqs_pending_lock, flags);
 
+	trace_kvm_vcpu_irq(vcpu->vcpu_id, irq, 0);
+
 	return 0;
 }
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6c8530b9f29e..d03c6e82b1bc 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -11,6 +11,7 @@
 #include <asm/insn-def.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
+#include "trace.h"
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -212,6 +213,9 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (trap->scause & CAUSE_IRQ_FLAG)
 		return 1;
 
+	trace_kvm_vcpu_exit(vcpu->vcpu_id, trap->sepc, trap->scause,
+			    trap->stval, trap->htval, trap->htinst);
+
 	/* Handle guest traps */
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..ef2a827811f3 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
+#include "trace.h"
 
 struct insn_func {
 	unsigned long mask;
@@ -375,7 +376,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
-	unsigned long insn;
+	unsigned long insn, raw_insn;
 	int shift = 0, len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -405,6 +406,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		insn_len = INSN_LEN(insn);
 	}
+	raw_insn = insn;
 
 	/* Decode length of MMIO and shift */
 	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
@@ -453,6 +455,9 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
+	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
+			       false, len);
+
 	/* Save instruction decode info */
 	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
@@ -502,7 +507,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	u32 data32;
 	u64 data64;
 	ulong data;
-	unsigned long insn;
+	unsigned long insn, raw_insn;
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -532,6 +537,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		}
 		insn_len = INSN_LEN(insn);
 	}
+	raw_insn = insn;
 
 	data = GET_RS2(insn, &vcpu->arch.guest_context);
 	data8 = data16 = data32 = data64 = data;
@@ -570,6 +576,9 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
+	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
+			       true, len);
+
 	/* Save instruction decode info */
 	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
