Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BB4C369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bC9Ca10UOl9K4L6vqQhhVGPNmLWYuqm6XM6GneHVo8A=; b=WWxfmUbGKzzSjW
	FEQyppXcoPioszGN47Rulmh79WQbE/8HZG6Fk2zlQ1BXWf6aRylH9Nhe6EXKlC0yGbTPi2TVxzxbj
	rYfx4xMCYLbmGdSfL/cWOKuUTfzKOC7LZgFoqL2GAv9CbU3Rd5q5UKtEyJY1JmNvpxWyfyZ7azTTX
	td5XaI0ids3FpMyphG1WOF5FI9OppBEeDw8XknF4FpaXqmJ4RErl6ALIXa3A0STuQIbI+9Gzam9//
	XtmwpBUt+ZvSC2oXyqlikvhXM40jZJjdWhE0+jqubQcdWCmvKM7K+MEMvsyFHDG64xAtuWpQGyItx
	rKEZa371fwx/q6w7OSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6q-0000000Efds-20Rv;
	Thu, 24 Apr 2025 16:07:32 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYg-0000000EVEA-1fjU
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b061a775ac3so1110629a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508733; x=1746113533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KosB5ZgKDG2GT/pwZox4H0XOpN/IyUSJojX16UBufxk=;
        b=MHu8tOmHOob0Q8s9VvuUc1MMM3GpQpm5u+9xrcjUhUojo6a6VftSxNDnJuqZFI+Y+3
         YrxGkjiPh8HQOlxQMLx4xDDq3wsEmzWlcd/sLVUQp6XpM/F2Vec77svv1/XGPX2Ac8XG
         FBfFEn0caM9hQzPyBxexac3UR1OWhNUIFCN6vwP7FTBwAHnWXeN0spkEuRsKLkeYmlaU
         pnqXVoijrsOwl7vZVikcuLpYYTf3KxV459GICcNBGwM71+gzDUY51qk3qeSDIfunjswh
         reF2rHYdIp3BSeYoNSoDchqzapPovi8U3xKFBuTdGNDLX/nZdsZgI4LlPHOcft7ezbQe
         MgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508733; x=1746113533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KosB5ZgKDG2GT/pwZox4H0XOpN/IyUSJojX16UBufxk=;
        b=tdFRPZbaTFLafyuxMmuE2rdMDKBpI8u4d+SZF1f/a2gD2fA20gAHYqBvk4aH/8Mcsd
         KFfljJ7/qE9zk0vaKU6nqFYq9gOSBL+zQUhWmZrcUNaLXcicf7BOhBQ+wogvil2ZcctE
         LFZ2bNZubBF2W0tnP8C9RivyQGvyn68IKosBHW9aHlYFL58Juuyv1U7uoPgw0pKQTf2b
         zYmmtj3zhJL8AXEOIvzIx48nWeSVUVYAJL4aT0QgCiMBdPilDVRpDxfRzdQ2+ZQPmPyY
         8pYeoCHxR9QH+v+Xe04EQ1pVj+oEhAqjOpSW2j0Pg+sYubOvrdW1k6LK5iFIv43pI33o
         ATYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiTrUVeBwBQ/sMlPf3izQmeNlQpVGlsB6+d4vhr3oZXq8uTdLZdj3SBPb3/la7bRg2zCI24JHO8/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRxBdnRdcigGP9KYzk/bZTinkWP/4y0idcNQWdVfxUMT+DJYTj
	pVZ0zEAgYfZLiaYIAAERsdtY3tDVvW6GxuccTc4JM7bMtpAaRoytcTAgLy1Ksv8=
X-Gm-Gg: ASbGncse6bZdto4cDZ09hexFiFpiPFsCMJ4Raa84O/mb/XT87ESse0uG2EZZl1jG/X7
	Nt5MiH8rDZ5CGx3qxpxja0WSrpNFdS9PS18v+YLXop03J5t5y67dufshYfKGExKxZT0H3FIvS2w
	jtSBU1xEYPHd3HW2vakU9Yqh5iHgLIuAayrBh8Jr2rDMLPe9zR/Fxti6T1T2oHXI0rw7q3s0ZHv
	35x0Z9ktvD7eAswE3VzKOMNGAYa2cnxvCV2kw3nIZbBuzZvg8k9b4JVO962awItGhUumPsMjPCG
	r00yKNf+FnLm1JFo4fOC70ILaVziHJeSNm7X3XLS9RRGDmAEYg8/7HjYOrYfLeM2g39zvIDOaj9
	6MglDtINRxiRlU3I=
X-Google-Smtp-Source: AGHT+IG/fjJRFAZc1F/U7WUvrAgadtxqffvxRh33xTuPAQ9Z9YehChN+iK2lWhURInGWDQbiRKcNqg==
X-Received: by 2002:a05:6a20:9f46:b0:203:ad33:1ae3 with SMTP id adf61e73a8af0-20444ee397bmr4762728637.10.1745508733155;
        Thu, 24 Apr 2025 08:32:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH v2 01/10] Sync-up headers with Linux-6.14 kernel
Date: Thu, 24 Apr 2025 21:01:50 +0530
Message-ID: <20250424153159.289441-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083214_434253_5378A724 
X-CRM114-Status: GOOD (  14.58  )
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

We sync-up Linux headers to get latest KVM RISC-V headers having
newly added ISA extensions in ONE_REG interface.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arm64/include/asm/kvm.h    |  3 ---
 include/linux/kvm.h        |  8 ++++----
 include/linux/virtio_pci.h | 14 ++++++++++++++
 riscv/include/asm/kvm.h    |  7 ++++---
 x86/include/asm/kvm.h      |  1 +
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arm64/include/asm/kvm.h b/arm64/include/asm/kvm.h
index 66736ff..568bf85 100644
--- a/arm64/include/asm/kvm.h
+++ b/arm64/include/asm/kvm.h
@@ -43,9 +43,6 @@
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 #define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
-#define KVM_REG_SIZE(id)						\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 struct kvm_regs {
 	struct user_pt_regs regs;	/* sp = sp_el0 */
 
diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 502ea63..45e6d8f 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -617,10 +617,6 @@ struct kvm_ioeventfd {
 #define KVM_X86_DISABLE_EXITS_HLT            (1 << 1)
 #define KVM_X86_DISABLE_EXITS_PAUSE          (1 << 2)
 #define KVM_X86_DISABLE_EXITS_CSTATE         (1 << 3)
-#define KVM_X86_DISABLE_VALID_EXITS          (KVM_X86_DISABLE_EXITS_MWAIT | \
-                                              KVM_X86_DISABLE_EXITS_HLT | \
-                                              KVM_X86_DISABLE_EXITS_PAUSE | \
-                                              KVM_X86_DISABLE_EXITS_CSTATE)
 
 /* for KVM_ENABLE_CAP */
 struct kvm_enable_cap {
@@ -1070,6 +1066,10 @@ struct kvm_dirty_tlb {
 
 #define KVM_REG_SIZE_SHIFT	52
 #define KVM_REG_SIZE_MASK	0x00f0000000000000ULL
+
+#define KVM_REG_SIZE(id)		\
+	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
+
 #define KVM_REG_SIZE_U8		0x0000000000000000ULL
 #define KVM_REG_SIZE_U16	0x0010000000000000ULL
 #define KVM_REG_SIZE_U32	0x0020000000000000ULL
diff --git a/include/linux/virtio_pci.h b/include/linux/virtio_pci.h
index 1beb317..8549d45 100644
--- a/include/linux/virtio_pci.h
+++ b/include/linux/virtio_pci.h
@@ -116,6 +116,8 @@
 #define VIRTIO_PCI_CAP_PCI_CFG		5
 /* Additional shared memory capability */
 #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
+/* PCI vendor data configuration */
+#define VIRTIO_PCI_CAP_VENDOR_CFG	9
 
 /* This is the PCI capability header: */
 struct virtio_pci_cap {
@@ -130,6 +132,18 @@ struct virtio_pci_cap {
 	__le32 length;		/* Length of the structure, in bytes. */
 };
 
+/* This is the PCI vendor data capability header: */
+struct virtio_pci_vndr_data {
+	__u8 cap_vndr;		/* Generic PCI field: PCI_CAP_ID_VNDR */
+	__u8 cap_next;		/* Generic PCI field: next ptr. */
+	__u8 cap_len;		/* Generic PCI field: capability length */
+	__u8 cfg_type;		/* Identifies the structure. */
+	__u16 vendor_id;	/* Identifies the vendor-specific format. */
+	/* For Vendor Definition */
+	/* Pads structure to a multiple of 4 bytes */
+	/* Reads must not have side effects */
+};
+
 struct virtio_pci_cap64 {
 	struct virtio_pci_cap cap;
 	__le32 offset_hi;             /* Most sig 32 bits of offset */
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index 3482c9a..f06bc5e 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -179,6 +179,9 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SSNPM,
 	KVM_RISCV_ISA_EXT_SVADE,
 	KVM_RISCV_ISA_EXT_SVADU,
+	KVM_RISCV_ISA_EXT_SVVPTC,
+	KVM_RISCV_ISA_EXT_ZABHA,
+	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
@@ -198,6 +201,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_VENDOR,
 	KVM_RISCV_SBI_EXT_DBCN,
 	KVM_RISCV_SBI_EXT_STA,
+	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
@@ -211,9 +215,6 @@ struct kvm_riscv_sbi_sta {
 #define KVM_RISCV_TIMER_STATE_OFF	0
 #define KVM_RISCV_TIMER_STATE_ON	1
 
-#define KVM_REG_SIZE(id)		\
-	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
-
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
diff --git a/x86/include/asm/kvm.h b/x86/include/asm/kvm.h
index 88585c1..9e75da9 100644
--- a/x86/include/asm/kvm.h
+++ b/x86/include/asm/kvm.h
@@ -925,5 +925,6 @@ struct kvm_hyperv_eventfd {
 #define KVM_X86_SEV_VM		2
 #define KVM_X86_SEV_ES_VM	3
 #define KVM_X86_SNP_VM		4
+#define KVM_X86_TDX_VM		5
 
 #endif /* _ASM_X86_KVM_H */
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
