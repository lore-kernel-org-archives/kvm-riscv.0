Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19EFC3600E
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIQPM+k317TeygGlpkeIu8DA1BxOJrWCji6WCRikGd0=; b=svxnzEqywcYT7J
	QumPQf4arVfNFfs6B3SX/1+gsM+nw4j1al4ofrx53a8XZQ3BUwGT/AcMWv9xUrxBwSBe8F1oAn5nC
	/8AGF5Mcm/mLXsI6QutNyNOWxkPHkrjaSaAlP9BcSlKv4TSM0iqbyjXMw+4ohTk7MFTSdqKgzQHp8
	zeM6FjjqAKZjvgCRG2LEbFhX8vGzx6Xw5PQ3ReSD4c0EenycfDx5FPRN0+IQ4GWlLLZjSDmK2ytFW
	5tFfkNcmtn8ZqflDU7Rs7R12IjpG3czJlE1hC/tVNJfOxQYz9gnBcM7UhfS1fHycoByJBnoJd2Grt
	SrYpxA1rBoN6YbTyBZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKiZ-00000007iMz-1r0s;
	Wed, 26 Mar 2025 06:58:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhA-00000007hyJ-1Fs0
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:01 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2243803b776so12753605ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972219; x=1743577019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c57jI5pRh7M1URIQaAfsM++KrpcwjMDHmdbLiR48JuA=;
        b=EjaEr3jpb1zPRM38ks7o5pYWPrRivEiTvjh9cVq5kkUYMznEp2ZaaWAH4DguCXgdoF
         lV8zY5PN966KPrcrKbyKHH60Q4xGBGm7mpkQv0PmAG2c/oMQ3IoNbF13TmgYIgFBRN89
         cSNkiugwoJ2lj9TlqfgXJL/0Xy1ZsK6PWAmF/KGhR6fw2HgAYXkQbi/Kjmqr8lyJ2VCi
         MOidpIUcQABidjZrmNXjRuP/t69QSJBFPbsV96BGQ5Pmjva6Ah+FxRtsG171wWDngMJU
         4NkWmnvdYJlah//9+C9GNWyEtcYnLcgg0rrNBIL+ji/08dNDy1DqmCdToXHaQQ8npBRY
         wMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972219; x=1743577019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c57jI5pRh7M1URIQaAfsM++KrpcwjMDHmdbLiR48JuA=;
        b=wEZVdDuRjH67PmFYklx9RBg979b9/HVbflAeNZrylyauC/E8dUljCMmZ83dNI6QTBE
         jwaJ0bkjXqSTIoRPn7+IHmU7TxLpyXNhhqjcgg4806VGB0kfUNIVkotYOFo5JsnGZAgP
         cP+3IlxDfOC9ToW3a72OiztkkE1wjPiqhwzAa9SioBNzU4lOFh9yFRAUxKZz5glCsymm
         EkZRqf2aTBMZDgTRMfT6895dePL7o2IVpDvJQMsrEh+aAOJF/ewe0Jsk2bRiWMqlN45p
         hftKhD0ZA1JtEGBz4znxxtTEXN3RUCRw+525MJEev/NpowJJTKshY1j5Um5aUJkTFB3z
         +Gyg==
X-Forwarded-Encrypted: i=1; AJvYcCWIH++vmLqYaE2gF+GA4Fy4/UNQeJonGCRkXp4KV/W2ACZLw4qJPX8FQXGi/Y7Nb3l5yYH9fS7MyQ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTClXzWCeYR2p864FOg6Ks/ZkGMGLiv2ikAJLghDkitQkpB0oS
	A3szuhCMq5fTtad9X8J+/TSIE+AsE3UxH7LNdgyQ47UJY6FAdRQRbNf5L7ZU11s=
X-Gm-Gg: ASbGncujkhlSFoud24Syur4JlU3pyVVMtryahih2oQNAH743UXW7b+0df8DW+kBxD0C
	gFuR2HueBIua2kfMdODJsdpDMX15OvTF/hcKGGmUVjqR+zT3W7ShGZlKfU/Z4Onut+ceODidVh/
	RRrks74KKHmbxAXPuUOHuVh90UdQ90S/xOOXIHMm5S00X1YDiyFJKWZicLKXwp1uZ61smQbkydr
	wq05MLQyah4JGRLXNVfUpOSdFFQ6B3ltJJrA/2mN25h0MFwMvp3NQnU/yNeUxLn44seC59Y0DuO
	qKcHiPRme3TCjxVGpBpHFqkQCCn/5YFnvgXCZ8WEVhinuSCF7ETKTa8X2csInt0gPzdUHPoX1Jc
	2o9bHOg==
X-Google-Smtp-Source: AGHT+IETcnyhYHBTogDJh7RcGANfUgL6TqZGlc9sjLBEKj5xN3He3kdBXTPl8inCEMI1FxRFDEYcwA==
X-Received: by 2002:a05:6a21:900a:b0:1f5:6680:82b6 with SMTP id adf61e73a8af0-1fe43437130mr35906975637.38.1742972219229;
        Tue, 25 Mar 2025 23:56:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:56:58 -0700 (PDT)
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
Subject: [kvmtool PATCH 01/10] Sync-up headers with Linux-6.14 kernel
Date: Wed, 26 Mar 2025 12:26:35 +0530
Message-ID: <20250326065644.73765-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235700_344230_883AC381 
X-CRM114-Status: GOOD (  14.77  )
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
 arm/aarch64/include/asm/kvm.h |  3 ---
 include/linux/kvm.h           |  8 ++++----
 include/linux/virtio_pci.h    | 14 ++++++++++++++
 riscv/include/asm/kvm.h       |  7 ++++---
 x86/include/asm/kvm.h         |  1 +
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arm/aarch64/include/asm/kvm.h b/arm/aarch64/include/asm/kvm.h
index 66736ff..568bf85 100644
--- a/arm/aarch64/include/asm/kvm.h
+++ b/arm/aarch64/include/asm/kvm.h
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
