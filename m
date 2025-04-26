Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBDEC369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bC9Ca10UOl9K4L6vqQhhVGPNmLWYuqm6XM6GneHVo8A=; b=h2/Nk1TsPA7cot
	UMrIHuQteUBHZy5zn/Sum5OVEz85pyF+KOk7Nu4LHTC7ONv67b5bgjwPsBgKm85vPcmaos91Azf2i
	UhNtb3izAii07p2coZgglXwUaostVbPBaQHTjoX5vm6EkqTCqTL5gBYui1W+U1IBW5ACYGGeJQhJG
	2Yg7+F2MuqWY/voKc+B+nrVhT0r64GGUaqulfKmf/IL3b094q4ao0ebJmYJigd0KLAVq0POHQGifX
	NE8Gek6wNPW/ax7W/ospwj00HkuC9LszNs2uWr7N0ug6YnMXMpiPZa++twvB0TQa3v/IsqLkKG7t4
	nJJJKMN43QQMEnJgs+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKI-00000001tqR-2Tt6;
	Sat, 26 Apr 2025 11:04:06 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKG-00000001tpJ-24B9
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:05 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af28bc68846so3259365a12.1
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665443; x=1746270243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KosB5ZgKDG2GT/pwZox4H0XOpN/IyUSJojX16UBufxk=;
        b=Ww5HuzG+I6SfQ0Dm4Q1D5/ZwjFRkpho5KCoQqZUskHtau8GichuYVKzqId+tW5CeX6
         1n/Y1gvgAKqaoTL4XquzEXCfbT9ObTLDT03PpaYRvxAQcfELSH4hR3aYGGGJUubCZy0K
         wtbUT8lz0j8uaVKVSrZ7RaW+d9BYTHEbRnNGzYma4X36yiFjGwoHGMVsRzq/TEsgh3qi
         mrZ/Law1c+8DFjusLkLEvgL1c3ceTX8JwanKEfQBAn3LC7SfXDrtPeqXc0W/lsCzKd1f
         feJCWuB3ix2//WGbbKK0OQEqILrCI4fW7PUI2ruV+FzDVAPQqgpbw0briY2TyG5ANaNt
         LraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665443; x=1746270243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KosB5ZgKDG2GT/pwZox4H0XOpN/IyUSJojX16UBufxk=;
        b=e3zAoyTaAxqUfI+SWkuc2HNtZPTML+Zi1i2Zjtrok/P7noFNXq0uh+CFdgQFCyyMro
         9ASx/0QhKBvDEarltjK7mMmIxJiDurQ3tfsPvwQ7HtLgDqvafgtnE51hlv7Bp7R/8zUU
         92tPw/2QyDIJtKTDBWt6q0odhza1L2Ah4+wVmgHlCHkN2wSbj4/r7uMuj/d8EZLFDBhX
         7UQn93PJnLUiBRl5bp4+HwGR7O1eEC8wCz1GXzEIJV198zTx71DsQ9MqrqAkQvbrskHn
         6I+IJcorkh8Dzo/rwELiSkriPnrcF3EJ+ECwlps6WpTkIuF3qcqgwoFYKKlkiW9qdwDy
         nQHA==
X-Forwarded-Encrypted: i=1; AJvYcCUlbVOwdEm/RU7azOugg9NlaXujmRTQAKO1AxT4WoHVmRFBrNk+luNnG0wG9zB9sev4cOW2aOCOou0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyT1LPxs7siXATKz5aVJz3ynFvzRG47LbRsc/5MWinaimvoXXM4
	KRBbL52hxzTKsRpC8RZwgxHMqbZPdSELrpERgzC9/XoKYgO9+UCjYtIp5jW+ysE=
X-Gm-Gg: ASbGncvoqIvlpcoSO+Mzto/XeCwDUbIWAsIH0MjA9ngYzPHQIpV4CRRIRCLTQnNZ3xW
	sJDnjif3ir1aMGoHeDQh2jgkNavJ/xlk63KW+ji6s7BbXY/IvhpKxcWxPnRAJ/ueofztFfcInHO
	lZQf4mSrRv1SLH3ITiuSZDu2qYOH4Ax2c1y215KpWBbdcztzgQfVu28ujFmv84oklaSMla36SFr
	qG3DoIudFUDEZwj+XVK0QADlwQ8Ov7knXGFqwz7bULBNCif6nRh68wn+O/bdm6EjfDkVYyIlOm7
	BjlaAo5l5e/t+ofVW4I6A1UJiNfNPc2MFDnBD+nYqgAj0Wbc4izWaZni4H96xPrwNt8fqYmeRcL
	7lKqM
X-Google-Smtp-Source: AGHT+IGAfyrCkQFHH/yoCf0uzQ8ItQRlM5Gw9a1UYmbefrBes8PbO9i2PmAJYcaSCWg0jeYyrvqVlg==
X-Received: by 2002:a17:90b:3a0e:b0:2f6:f32e:90ac with SMTP id 98e67ed59e1d1-309f7dd8a1cmr8809821a91.11.1745665443498;
        Sat, 26 Apr 2025 04:04:03 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:03 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 01/10] Sync-up headers with Linux-6.14 kernel
Date: Sat, 26 Apr 2025 16:33:38 +0530
Message-ID: <20250426110348.338114-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040404_532919_0FC31319 
X-CRM114-Status: GOOD (  14.55  )
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
