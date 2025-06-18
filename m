Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81841C7115D
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+l/ZVQGCUiaGO4GRs3ZoDM75HUa+7gtJC1Cik9JLjs8=; b=MeSoyeKq2kw1IL
	Gq2sIZE6G+jyvLvP5QqzTKR2LO2oBD2CiG0eskjkPD/2FW159QqRRD7qkM/QqSSmLkQ9HRUTnqI8r
	MWTpBuPT2EsmA8acCuLS7BIzYXSaXSCiXGji06OoX52YYU65b3Uy0MvdLYs9+MtbAJHSZryDmiCyo
	tTGFU3+3CvgPaZuVEYqC316E/3cAkISo48LZTTe2iE6rOxJHUy45/nOxYWO7LRXt35lGGbfiTFVeK
	TsiL2G2A8KkgB2ESYJKaGTITt5LzZXu1tzHBnY+YfoFZY5ZjrS2x0ve35AWfRAdxEK03H3a2i1Qo+
	OXrAi2yDz6PPr0+c2MUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWu-0000000AEnO-0wek;
	Wed, 18 Jun 2025 13:08:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5d-00000009xlf-3M6L
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23636167b30so61016975ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246585; x=1750851385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG7/Ztl2DSM9ZPCCvmv6w8e8h4Eb1mPFR7YIhnXta3M=;
        b=bj04zqeHNHC7jZRyUf9+maAsbU2oE2NFRadx8pmLCKdUAomWdM3JBxsmG4ASgUTCme
         ZI79KWaQrXGI4L5TAGKRQBnA1sQE+LkxAU7IpcDgQYTd84HgRz5Fv73RIL20yLOdXj7j
         u7VKUb2kL+TTLBBQLYYwL8WpWpo/OUNMoBPaKkX7nqt8vs1iH0IiAio7612zdsf1zFjX
         aw+JaNNDMsVQX7RgpEBMzKZDfr33YFGrQjxSQtY4ljuhllosJS/d6aFRyLie76+sXBsf
         qQiCep59CY+djhE0qugBux8EVYhla6y2uttBNcPBd8WuQc+FCH88ClkGEFhnK9FE8bk6
         C60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246585; x=1750851385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG7/Ztl2DSM9ZPCCvmv6w8e8h4Eb1mPFR7YIhnXta3M=;
        b=FyDQ3vBOwa+RPKXgm37S7nLGy9Jg4uUd3yIVt0Xlk+nwFtIczBRYXoNe5lX1iUOcyo
         o7DCq1WXO/kuhBu5tE9hhp83aJfGaPyCFLvBCu1XYYiP9SROWN+9Y7H8uS6ezLWGFG8X
         QqefpPwG/DGdBsFS1eHFXS0ogZtWe3FICYc7dW4Vp7epO9oeYEbMM3CTnqbIMY/IZtd9
         4XYv9u3BfpPgT2Xk1UyYL128Qz2Uc1JypkFjeqnGR9OUt82aR7T1cQKncimw6HbTUVqZ
         7vyN2XzVFVmhs4NrAV/lbu3OYhT53ke24R8HvX+BcumkLZLN/ItTYzKX7gXabggmWgC/
         9INw==
X-Forwarded-Encrypted: i=1; AJvYcCWt54eI3jQ21gCq4iTzYXeWhYkM8Dw66MYbHeQy8qK1WbT0zzQDYNkqb7ZfYJtT98VmiCRzp8zzpGY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGCzNuPOsRj35eerpE8AX2iTo2uCcu7qQIutFDypcusTNEhqyA
	QgcL3atDI74DZjsIbzArV84i2jrGP2S2/hCrh0P/dhYWDJOeqqeauFKNaeifLi80yQI=
X-Gm-Gg: ASbGnctJ/AhZHoW3efzYr9f/Iobd+g0HNKShBkjtNJxRsAV0ZZHGiV37ic1GHlk8JGV
	W8ISiOZQrYTmzeB5GJglMr0nCNB39vZB2nFzLq9Vbre92BkfGR5oWAWm5VMz7Z+8vt9oiSDOtBy
	cjvsQ0nzlflUY+DAsDqooFN4/MYAzh+PsFcGzbL2Do1L6VWKvjDuFkiONInOippL+RvfwSuHjvj
	R8Vhrvc45ot5HMxWGKx9Fvj1woT7a36mkwVjCLkNwjxbBRZfz5ViKpJVikyxBkCatN3LkTKtyGG
	Gq/t/Fz9RvCTzaCiWd/PgeEoE/HaaSuP7sOMB0h1ieplxLXG6sZzmG1gmkDq726bXiJuS+zDeGR
	RQiEBwCXkwOq3GkUD9w==
X-Google-Smtp-Source: AGHT+IEN9kYbtX3MN80cXl6plnuIGLwCBL6Acv0xEEsexI78AVAHqncJpWj7BsS4zuj7DZwkxDeSFQ==
X-Received: by 2002:a17:903:32c9:b0:234:986c:66e0 with SMTP id d9443c01a7336-2366b32e4e0mr257201345ad.4.1750246585084;
        Wed, 18 Jun 2025 04:36:25 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:24 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 08/12] RISC-V: KVM: Factor-out MMU related declarations into separate headers
Date: Wed, 18 Jun 2025 17:05:28 +0530
Message-ID: <20250618113532.471448-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043625_847570_638C0835 
X-CRM114-Status: GOOD (  16.69  )
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

The MMU, TLB, and VMID management for KVM RISC-V already exists as
seprate sources so create separate headers along these lines. This
further simplifies asm/kvm_host.h header.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 100 +-----------------------------
 arch/riscv/include/asm/kvm_mmu.h  |  26 ++++++++
 arch/riscv/include/asm/kvm_tlb.h  |  78 +++++++++++++++++++++++
 arch/riscv/include/asm/kvm_vmid.h |  27 ++++++++
 arch/riscv/kvm/aia_imsic.c        |   1 +
 arch/riscv/kvm/main.c             |   1 +
 arch/riscv/kvm/mmu.c              |   1 +
 arch/riscv/kvm/tlb.c              |   2 +
 arch/riscv/kvm/vcpu.c             |   1 +
 arch/riscv/kvm/vcpu_exit.c        |   1 +
 arch/riscv/kvm/vm.c               |   1 +
 arch/riscv/kvm/vmid.c             |   2 +
 12 files changed, 143 insertions(+), 98 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 6162575e2177..bd5341efa127 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,6 +16,8 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_aia.h>
 #include <asm/ptrace.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -56,24 +58,6 @@
 					 BIT(IRQ_VS_TIMER) | \
 					 BIT(IRQ_VS_EXT))
 
-enum kvm_riscv_hfence_type {
-	KVM_RISCV_HFENCE_UNKNOWN = 0,
-	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
-	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
-	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
-	KVM_RISCV_HFENCE_VVMA_GVA,
-};
-
-struct kvm_riscv_hfence {
-	enum kvm_riscv_hfence_type type;
-	unsigned long asid;
-	unsigned long order;
-	gpa_t addr;
-	gpa_t size;
-};
-
-#define KVM_RISCV_VCPU_MAX_HFENCE	64
-
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
 };
@@ -99,15 +83,6 @@ struct kvm_vcpu_stat {
 struct kvm_arch_memory_slot {
 };
 
-struct kvm_vmid {
-	/*
-	 * Writes to vmid_version and vmid happen with vmid_lock held
-	 * whereas reads happen without any lock held.
-	 */
-	unsigned long vmid_version;
-	unsigned long vmid;
-};
-
 struct kvm_arch {
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
@@ -311,77 +286,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
-
-void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
-					  gpa_t gpa, gpa_t gpsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
-void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_gvma_all(void);
-void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
-					  unsigned long asid,
-					  unsigned long gva,
-					  unsigned long gvsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
-					  unsigned long asid);
-void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
-				     unsigned long gva, unsigned long gvsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
-
-void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i(struct kvm *kvm,
-		       unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
-void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
-void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
-void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask,
-			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
-void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
-
-int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
-			     phys_addr_t hpa, unsigned long size,
-			     bool writable, bool in_atomic);
-void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
-			      unsigned long size);
-int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
-			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
-int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void __init kvm_riscv_gstage_mode_detect(void);
-unsigned long __init kvm_riscv_gstage_mode(void);
-int kvm_riscv_gstage_gpa_bits(void);
-
-void __init kvm_riscv_gstage_vmid_detect(void);
-unsigned long kvm_riscv_gstage_vmid_bits(void);
-int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
-void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
-
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
 void __kvm_riscv_unpriv_trap(void);
diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
new file mode 100644
index 000000000000..4e1654282ee4
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_MMU_H_
+#define __RISCV_KVM_MMU_H_
+
+#include <linux/kvm_types.h>
+
+int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
+			     phys_addr_t hpa, unsigned long size,
+			     bool writable, bool in_atomic);
+void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
+			      unsigned long size);
+int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
+			 struct kvm_memory_slot *memslot,
+			 gpa_t gpa, unsigned long hva, bool is_write);
+int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_mode_detect(void);
+unsigned long kvm_riscv_gstage_mode(void);
+int kvm_riscv_gstage_gpa_bits(void);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
new file mode 100644
index 000000000000..cd00c9a46cb1
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_TLB_H_
+#define __RISCV_KVM_TLB_H_
+
+#include <linux/kvm_types.h>
+
+enum kvm_riscv_hfence_type {
+	KVM_RISCV_HFENCE_UNKNOWN = 0,
+	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
+	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
+	KVM_RISCV_HFENCE_VVMA_GVA,
+};
+
+struct kvm_riscv_hfence {
+	enum kvm_riscv_hfence_type type;
+	unsigned long asid;
+	unsigned long order;
+	gpa_t addr;
+	gpa_t size;
+};
+
+#define KVM_RISCV_VCPU_MAX_HFENCE	64
+
+#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
+
+void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
+					  gpa_t gpa, gpa_t gpsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
+void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_gvma_all(void);
+void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
+					  unsigned long asid,
+					  unsigned long gva,
+					  unsigned long gvsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
+					  unsigned long asid);
+void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
+				     unsigned long gva, unsigned long gvsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
+
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i(struct kvm *kvm,
+		       unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    gpa_t gpa, gpa_t gpsz,
+				    unsigned long order);
+void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long gva, unsigned long gvsz,
+				    unsigned long order, unsigned long asid);
+void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long asid);
+void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long gva, unsigned long gvsz,
+			       unsigned long order);
+void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_vmid.h b/arch/riscv/include/asm/kvm_vmid.h
new file mode 100644
index 000000000000..ab98e1434fb7
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vmid.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_VMID_H_
+#define __RISCV_KVM_VMID_H_
+
+#include <linux/kvm_types.h>
+
+struct kvm_vmid {
+	/*
+	 * Writes to vmid_version and vmid happen with vmid_lock held
+	 * whereas reads happen without any lock held.
+	 */
+	unsigned long vmid_version;
+	unsigned long vmid;
+};
+
+void __init kvm_riscv_gstage_vmid_detect(void);
+unsigned long kvm_riscv_gstage_vmid_bits(void);
+int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
+
+#endif
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..40b469c0a01f 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -16,6 +16,7 @@
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
+#include <asm/kvm_mmu.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 4b24705dc63a..b861a5dd7bd9 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/kvm_host.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index a5387927a1c1..c1a3eb076df3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -15,6 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index f46a27658c2e..6fc4361c3d75 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6eb11c913b13..8ad7b31f5939 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_vector.h>
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 85c43c83e3b9..965df528de90 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index b27ec8f96697..8601cf29e5f8 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_mmu.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 92c01255f86f..3b426c800480 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,8 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
