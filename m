Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F7CC02191
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE7PkSwqc0ry+zfMlAN2Xh3VQ9VOCXioyJmNSliesH8=; b=4mTpSXUul/UIra
	R2wZyUrtsttWi+7EbSx2sDsPX0K9yJmY9iORuGPscZ99AVyaBusNZAN2rxWKILH6JM0zlpAoLYVZt
	6lorcYFBtMkm5LqG4j79xI0B8vFwFJ+U95uCVNBNvoA+5Se2G74UpJWVpPsDuURRrE3rsXiVh64GD
	7+Exr0waWW1I3VZhWUWIhoTpe6rtFn90QEIjp/m6PlU484wvGJjrw7uVB/kaAWdz4DdXTjFpjVKqQ
	eJ7RgRn4hnQaqNmWHcGMz9sXtYkKydg3Vj+RMiKuQjKSf5Ml7crIKFVoV4dCQe5gJMir2dtruNpQa
	4WYKeUtL7ZFnLOiTPjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6c-00000002MPV-2XKI;
	Mon, 27 Jan 2025 13:24:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6a-00000002MOS-17pk
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:24:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21644aca3a0so101689755ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984283; x=1738589083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AalsxRh7JjR8E29gKxWC8gBFgaq/1lFgDhhznps9mKk=;
        b=LK9z+njVQ3BZIOZyV3+DfN0rWJv3xPqU79Ml/Nns1xWa7ipeJt3ULk7K2Zhox3d9Th
         v9gL1w0r3ddRlg03DZfHwYj6xpSEAlkZQUwsOT919upKbhY7uhrERFaIleBO4R/AlXuy
         Mw6Pz3+GGtn0hDU8zsgPq8zr5d4OZ43jQ4u1BlnPrbb2sjsK0qpPh7lZvDMQcddFs+t6
         pMj3KmpM+AhKIxhs3aCtfwJo4OpWrZ/M0+Vzj3EsMx6vUWO0D1ua7x8VsDVyMw7TgLy1
         +55yaAVMTdEkniA9IXqslsb+3JCgVUvJxJXrl45p7hJG1kKPqhmRtxD/nYsdJdzby4zf
         QU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984283; x=1738589083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AalsxRh7JjR8E29gKxWC8gBFgaq/1lFgDhhznps9mKk=;
        b=T75kE8uJ5F2qWXvCDBc3mWBSNS/meN/YnnSb8nqR5UbILr1K48cFj/w0BPMOvBT5qg
         +QPI+OwfBusc2g9G5ouwvu3QLqihzAZxnAuW2G+Mr8ur6j5kBhio89/sahNS7wsTbGiZ
         ED5rV7MESLzViPG3hbLeZ2x8zdtWdOPxWqHw4iSeOwkI3AvxBBkI7weZ/zXyixGwNeNg
         V11zSQyf2d0P+qQf6lzNOVBCNRFiWQ11Gnu13zvdqhbqOVs/le/KrSakGZpKVpKFD3tH
         FytZZ5ck/B3EMkslq7rZHZGIsJTWi3gh//1afg4CXnh4ORZc1h3R5yR64cPpen5aMGf/
         8hOg==
X-Forwarded-Encrypted: i=1; AJvYcCWsa4cB5EbG4vrs2fzWlxCFl6rpGt6D7YuWg4g4GSQex4nEwzXip86UoA4uxRJoDlE/I2WBnU364tI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAIC0oIpM8iZuGeaiw58ag1V+m8faMxyCJ3My0pOaUtkqMPEUj
	SDyGQF8wiUtIY5P5sWuM7QEW7MB3SRDfw/OLQLXtAYF8Gg7O6JgWmtWHWYAGRDY=
X-Gm-Gg: ASbGnctlqTBuJNCHqqy5IwctYD+1Zbj1Yo/EIOwX7SMQ0CPakUabfy9dhbP5Q/ie6rE
	f0UvLzV3agrhnnfag5Xr4kJB8urq2HjjZLDKGOgNckExlV45tOu6yyz9Lafg38M8dARwL9X7Et0
	xeWMm513E/8I4Li0rkuF1A2MZJXbELSBopMaClC/Rs1tnlLkIBjjVkYIOhTdL3yIuD9elmZft+/
	VXDf9Z92EEyGh7lI0g6FoQ2JBB2FP49/cGc9f72iAu7NXTux237MrHXZkAU83vAMaBap9r/zFX0
	l9AK1G9qn5iWtJwUILLRkIwnJOhzNipBvQDP+t2YGlOs
X-Google-Smtp-Source: AGHT+IG1+Z9bBeGD9l6hGvwhue3yYqrEcklypWCIsg40QhAhgZm8YuCdT2fLGIIUDDySovAcxxpqRg==
X-Received: by 2002:a05:6a00:300a:b0:729:597:4fa9 with SMTP id d2e1a72fcca58-72dafba344amr55096480b3a.22.1737984283278;
        Mon, 27 Jan 2025 05:24:43 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:24:42 -0800 (PST)
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
Subject: [kvmtool PATCH 1/6] Sync-up headers with Linux-6.13 kernel
Date: Mon, 27 Jan 2025 18:54:19 +0530
Message-ID: <20250127132424.339957-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052444_308339_52038F09 
X-CRM114-Status: GOOD (  14.90  )
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
 arm/aarch64/include/asm/kvm.h  |   6 ++
 include/linux/kvm.h            |   8 ++
 include/linux/virtio_balloon.h |  16 +++-
 include/linux/virtio_pci.h     | 131 +++++++++++++++++++++++++++++++++
 riscv/include/asm/kvm.h        |   4 +
 x86/include/asm/kvm.h          |   2 +
 6 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/arm/aarch64/include/asm/kvm.h b/arm/aarch64/include/asm/kvm.h
index 964df31..66736ff 100644
--- a/arm/aarch64/include/asm/kvm.h
+++ b/arm/aarch64/include/asm/kvm.h
@@ -484,6 +484,12 @@ enum {
  */
 #define KVM_SYSTEM_EVENT_RESET_FLAG_PSCI_RESET2	(1ULL << 0)
 
+/*
+ * Shutdown caused by a PSCI v1.3 SYSTEM_OFF2 call.
+ * Valid only when the system event has a type of KVM_SYSTEM_EVENT_SHUTDOWN.
+ */
+#define KVM_SYSTEM_EVENT_SHUTDOWN_FLAG_PSCI_OFF2	(1ULL << 0)
+
 /* run->fail_entry.hardware_entry_failure_reason codes. */
 #define KVM_EXIT_FAIL_ENTRY_CPU_UNSUPPORTED	(1ULL << 0)
 
diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index 637efc0..502ea63 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -1158,7 +1158,15 @@ enum kvm_device_type {
 #define KVM_DEV_TYPE_ARM_PV_TIME	KVM_DEV_TYPE_ARM_PV_TIME
 	KVM_DEV_TYPE_RISCV_AIA,
 #define KVM_DEV_TYPE_RISCV_AIA		KVM_DEV_TYPE_RISCV_AIA
+	KVM_DEV_TYPE_LOONGARCH_IPI,
+#define KVM_DEV_TYPE_LOONGARCH_IPI	KVM_DEV_TYPE_LOONGARCH_IPI
+	KVM_DEV_TYPE_LOONGARCH_EIOINTC,
+#define KVM_DEV_TYPE_LOONGARCH_EIOINTC	KVM_DEV_TYPE_LOONGARCH_EIOINTC
+	KVM_DEV_TYPE_LOONGARCH_PCHPIC,
+#define KVM_DEV_TYPE_LOONGARCH_PCHPIC	KVM_DEV_TYPE_LOONGARCH_PCHPIC
+
 	KVM_DEV_TYPE_MAX,
+
 };
 
 struct kvm_vfio_spapr_tce {
diff --git a/include/linux/virtio_balloon.h b/include/linux/virtio_balloon.h
index ddaa45e..ee35a37 100644
--- a/include/linux/virtio_balloon.h
+++ b/include/linux/virtio_balloon.h
@@ -71,7 +71,13 @@ struct virtio_balloon_config {
 #define VIRTIO_BALLOON_S_CACHES   7   /* Disk caches */
 #define VIRTIO_BALLOON_S_HTLB_PGALLOC  8  /* Hugetlb page allocations */
 #define VIRTIO_BALLOON_S_HTLB_PGFAIL   9  /* Hugetlb page allocation failures */
-#define VIRTIO_BALLOON_S_NR       10
+#define VIRTIO_BALLOON_S_OOM_KILL      10 /* OOM killer invocations */
+#define VIRTIO_BALLOON_S_ALLOC_STALL   11 /* Stall count of memory allocatoin */
+#define VIRTIO_BALLOON_S_ASYNC_SCAN    12 /* Amount of memory scanned asynchronously */
+#define VIRTIO_BALLOON_S_DIRECT_SCAN   13 /* Amount of memory scanned directly */
+#define VIRTIO_BALLOON_S_ASYNC_RECLAIM 14 /* Amount of memory reclaimed asynchronously */
+#define VIRTIO_BALLOON_S_DIRECT_RECLAIM 15 /* Amount of memory reclaimed directly */
+#define VIRTIO_BALLOON_S_NR       16
 
 #define VIRTIO_BALLOON_S_NAMES_WITH_PREFIX(VIRTIO_BALLOON_S_NAMES_prefix) { \
 	VIRTIO_BALLOON_S_NAMES_prefix "swap-in", \
@@ -83,7 +89,13 @@ struct virtio_balloon_config {
 	VIRTIO_BALLOON_S_NAMES_prefix "available-memory", \
 	VIRTIO_BALLOON_S_NAMES_prefix "disk-caches", \
 	VIRTIO_BALLOON_S_NAMES_prefix "hugetlb-allocations", \
-	VIRTIO_BALLOON_S_NAMES_prefix "hugetlb-failures" \
+	VIRTIO_BALLOON_S_NAMES_prefix "hugetlb-failures", \
+	VIRTIO_BALLOON_S_NAMES_prefix "oom-kills", \
+	VIRTIO_BALLOON_S_NAMES_prefix "alloc-stalls", \
+	VIRTIO_BALLOON_S_NAMES_prefix "async-scans", \
+	VIRTIO_BALLOON_S_NAMES_prefix "direct-scans", \
+	VIRTIO_BALLOON_S_NAMES_prefix "async-reclaims", \
+	VIRTIO_BALLOON_S_NAMES_prefix "direct-reclaims" \
 }
 
 #define VIRTIO_BALLOON_S_NAMES VIRTIO_BALLOON_S_NAMES_WITH_PREFIX("")
diff --git a/include/linux/virtio_pci.h b/include/linux/virtio_pci.h
index a820849..1beb317 100644
--- a/include/linux/virtio_pci.h
+++ b/include/linux/virtio_pci.h
@@ -40,6 +40,7 @@
 #define _LINUX_VIRTIO_PCI_H
 
 #include <linux/types.h>
+#include <linux/kernel.h>
 
 #ifndef VIRTIO_PCI_NO_LEGACY
 
@@ -240,6 +241,17 @@ struct virtio_pci_cfg_cap {
 #define VIRTIO_ADMIN_CMD_LEGACY_DEV_CFG_READ		0x5
 #define VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO		0x6
 
+/* Device parts access commands. */
+#define VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY		0x7
+#define VIRTIO_ADMIN_CMD_DEVICE_CAP_GET			0x8
+#define VIRTIO_ADMIN_CMD_DRIVER_CAP_SET			0x9
+#define VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE		0xa
+#define VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY		0xd
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_GET		0xe
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_GET			0xf
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_SET			0x10
+#define VIRTIO_ADMIN_CMD_DEV_MODE_SET			0x11
+
 struct virtio_admin_cmd_hdr {
 	__le16 opcode;
 	/*
@@ -286,4 +298,123 @@ struct virtio_admin_cmd_notify_info_result {
 	struct virtio_admin_cmd_notify_info_data entries[VIRTIO_ADMIN_CMD_MAX_NOTIFY_INFO];
 };
 
+#define VIRTIO_DEV_PARTS_CAP 0x0000
+
+struct virtio_dev_parts_cap {
+	__u8 get_parts_resource_objects_limit;
+	__u8 set_parts_resource_objects_limit;
+};
+
+#define MAX_CAP_ID __KERNEL_DIV_ROUND_UP(VIRTIO_DEV_PARTS_CAP + 1, 64)
+
+struct virtio_admin_cmd_query_cap_id_result {
+	__le64 supported_caps[MAX_CAP_ID];
+};
+
+struct virtio_admin_cmd_cap_get_data {
+	__le16 id;
+	__u8 reserved[6];
+};
+
+struct virtio_admin_cmd_cap_set_data {
+	__le16 id;
+	__u8 reserved[6];
+	__u8 cap_specific_data[];
+};
+
+struct virtio_admin_cmd_resource_obj_cmd_hdr {
+	__le16 type;
+	__u8 reserved[2];
+	__le32 id; /* Indicates unique resource object id per resource object type */
+};
+
+struct virtio_admin_cmd_resource_obj_create_data {
+	struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+	__le64 flags;
+	__u8 resource_obj_specific_data[];
+};
+
+#define VIRTIO_RESOURCE_OBJ_DEV_PARTS 0
+
+#define VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_GET 0
+#define VIRTIO_RESOURCE_OBJ_DEV_PARTS_TYPE_SET 1
+
+struct virtio_resource_obj_dev_parts {
+	__u8 type;
+	__u8 reserved[7];
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_SIZE 0
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_COUNT 1
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_METADATA_TYPE_LIST 2
+
+struct virtio_admin_cmd_dev_parts_metadata_data {
+	struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+	__u8 type;
+	__u8 reserved[7];
+};
+
+#define VIRTIO_DEV_PART_F_OPTIONAL 0
+
+struct virtio_dev_part_hdr {
+	__le16 part_type;
+	__u8 flags;
+	__u8 reserved;
+	union {
+		struct {
+			__le32 offset;
+			__le32 reserved;
+		} pci_common_cfg;
+		struct {
+			__le16 index;
+			__u8 reserved[6];
+		} vq_index;
+	} selector;
+	__le32 length;
+};
+
+struct virtio_dev_part {
+	struct virtio_dev_part_hdr hdr;
+	__u8 value[];
+};
+
+struct virtio_admin_cmd_dev_parts_metadata_result {
+	union {
+		struct {
+			__le32 size;
+			__le32 reserved;
+		} parts_size;
+		struct {
+			__le32 count;
+			__le32 reserved;
+		} hdr_list_count;
+		struct {
+			__le32 count;
+			__le32 reserved;
+			struct virtio_dev_part_hdr hdrs[];
+		} hdr_list;
+	};
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_SELECTED 0
+#define VIRTIO_ADMIN_CMD_DEV_PARTS_GET_TYPE_ALL 1
+
+struct virtio_admin_cmd_dev_parts_get_data {
+	struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+	__u8 type;
+	__u8 reserved[7];
+	struct virtio_dev_part_hdr hdr_list[];
+};
+
+struct virtio_admin_cmd_dev_parts_set_data {
+	struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
+	struct virtio_dev_part parts[];
+};
+
+#define VIRTIO_ADMIN_CMD_DEV_MODE_F_STOPPED 0
+
+struct virtio_admin_cmd_dev_mode_set_data {
+	__u8 flags;
+};
+
 #endif
diff --git a/riscv/include/asm/kvm.h b/riscv/include/asm/kvm.h
index e97db32..3482c9a 100644
--- a/riscv/include/asm/kvm.h
+++ b/riscv/include/asm/kvm.h
@@ -175,6 +175,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_ZAWRS,
+	KVM_RISCV_ISA_EXT_SMNPM,
+	KVM_RISCV_ISA_EXT_SSNPM,
+	KVM_RISCV_ISA_EXT_SVADE,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/x86/include/asm/kvm.h b/x86/include/asm/kvm.h
index bf57a82..88585c1 100644
--- a/x86/include/asm/kvm.h
+++ b/x86/include/asm/kvm.h
@@ -439,6 +439,8 @@ struct kvm_sync_regs {
 #define KVM_X86_QUIRK_MISC_ENABLE_NO_MWAIT	(1 << 4)
 #define KVM_X86_QUIRK_FIX_HYPERCALL_INSN	(1 << 5)
 #define KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS	(1 << 6)
+#define KVM_X86_QUIRK_SLOT_ZAP_ALL		(1 << 7)
+#define KVM_X86_QUIRK_STUFF_FEATURE_MSRS	(1 << 8)
 
 #define KVM_STATE_NESTED_FORMAT_VMX	0
 #define KVM_STATE_NESTED_FORMAT_SVM	1
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
