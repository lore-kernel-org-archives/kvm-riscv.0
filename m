Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7937FC369D8
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sQuvwluLgRCqzro56G9sQO9GbnKTtxZOr6Wu/8veb7A=; b=PYT5ixLh9Joh2G
	TALx/CHJ+NoLv8m5si+jq8ACEgBal37OXYaINvmfaSqNi+BgBgHE8N1Wf0XfxPKHcZ5hgnZEy6B3i
	vrgmkNAF1trKWKAIgukCQaUr52tyf0X/G1ssC9W8uARbB5RugFASzsZs22X7kLTMjPZcYS/Q1UXwi
	r2J3FG7zhldgDANedTPxrAfYYiJGjPmo3rnap2iVBGtdA7mrTH6A0zOG9PjfC9lI0dEc6cYxbD/Q/
	1xtEG8PKN61utexVjLyt2Z/qhQMcF+4FpGsV94leCa2ph3B+uNFb9bF2F7bwYsWhV+/gIiLe3jDuZ
	OOKDrpyqvopuyDznclMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6w-0000000Efpe-3EZv;
	Thu, 24 Apr 2025 16:07:38 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yZG-0000000EVNG-2kXZ
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1214331b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508769; x=1746113569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2D6nlmo1xCA/mCgv9pPk+Ys6Km6cHx2FzcMKI2G3UM=;
        b=iaHDPUW+0AcGkj/GDHnBj8V8hwRX/dW82cpVx4TW18pHMSuOV0SOr36BNor4Qd/GIJ
         R3+gH46oXR4l6eItOIFdm9+B2btGC9umsK8Yg07EcxOwFLJ0YcNRsRRrKdE/9CFED8V2
         doZoX/v0itLek+xe+b9BhjAVsNE6IJsaPJPVllJO1Zq4YPSxcnpFNs4TkKTxQ9gzbaKM
         Dikgpf9EQkcx+sFOi9QV0+sruHaEB28J/atiU60wSCXAXIYjmG8icRALpppLGmgDuWCH
         /sC2Zv11QbL3nC2IpckmQR3USn//FWoiNGdIJtexRfpviF6j8LR+DlRMlyYUkJR3QEt4
         1VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508769; x=1746113569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2D6nlmo1xCA/mCgv9pPk+Ys6Km6cHx2FzcMKI2G3UM=;
        b=ZGQrdT5GGL1CtFctwACNqEM/44oE8Hm//AKWo5S12rPdnX0odTh0Tjoj1D0vdIAyGl
         uOMkT7EJ9KP3tgEemW2sn+XfBz6m4WXOLh7y/GB54uk9SsNfkC2BxYZacGiXPF1TjhLl
         6bIwWWvobbAX1h9sExnxwvkkXQEW4mbj8898XXM3VaLerKDOhrB/0I7qZO59NJpkizZ9
         /XJD7ZbUdyJEwLLLpxuyK5XFerSLsKmQZKsYRLHRSVAt83Q9zHdAVsP3hybVvo22kVC9
         tF5Bd/GwHkfAYJP1Y5imol5YTZf4v3e5sRi0HivvmGWQqjMh6Kh+mRAspV9ldnI4DVW3
         KhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUwntFJ4wJIasHzIm8u0KG8WZ5LEnP0U2bgq0+mETjyrvJK62Q2RMEUPVU0XXPnKSm64eCrG0uTlc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSC0rrh62uhiMGMlCGk3eCDfDV7Q6z2p8WeKP6vV4BFwofkkW
	3Ar3OTj2e7iTqBHn+bm6zV4Xdll56D/lUz5svMajESc9u5rQgFQkHoOl/5KSr/0=
X-Gm-Gg: ASbGnct3wrm42wj1dmHtM7YEIupYDf41HU59U/6wMgjCCkll9lEWZAcpiyyxBi++twK
	OvdPG4+sXRFHbANV2W6FAlNnsvvZinXiknURK4ZZioPUNfQ50TMjrB/aa4iFSP3AL4OMLbJoVPc
	4S4GYEC4egdKwrC86sJaVdVT17o+ST4cALfdzV+cyH2G1wQotnu7vU2eGCgqoLwkIuUL9Tk+GA4
	S3fX+GxLNTqc3VF6gScuHBI5qKlL50VAQCTA1dVARAMHBB3R9XvRfwQbvJ1+eMeTiRyI/0AUo0O
	ayqF3yJk0Nocrt9konxTbAFTNgUxPqGYIhIYwVSMTgIAQxIoJggKb2VjXe1PgYPYoSwwBte//ZM
	P1E53
X-Google-Smtp-Source: AGHT+IEKYppXAd5zqADsBjhthJktNqLWdYfwg51TFJZpqKaoJ9QHpJBSE0Aotf6FvdZ4KpFp4+imYw==
X-Received: by 2002:a05:6a20:438d:b0:1f5:60fb:8d9 with SMTP id adf61e73a8af0-20444fbb9c6mr4405396637.33.1745508769500;
        Thu, 24 Apr 2025 08:32:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:48 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 09/10] riscv: Add cpu-type command-line option
Date: Thu, 24 Apr 2025 21:01:58 +0530
Message-ID: <20250424153159.289441-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083250_691970_0C549ABB 
X-CRM114-Status: GOOD (  18.84  )
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

Currently, the KVMTOOL always creates a VM with all available
ISA extensions virtualized by the in-kernel KVM module.

For better flexibility, add cpu-type command-line option using
which users can select one of the available CPU types for VM.

There are two CPU types supported at the moment namely "min"
and "max". The "min" CPU type implies VCPU with rv[64|32]imafdc
ISA whereas the "max" CPU type implies VCPU with all available
ISA extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/aia.c                         |  2 +-
 riscv/fdt.c                         | 68 +++++++++++++++++++++++++----
 riscv/include/kvm/kvm-arch.h        |  2 +
 riscv/include/kvm/kvm-config-arch.h | 10 +++++
 4 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/riscv/aia.c b/riscv/aia.c
index 21d9704..cad53d4 100644
--- a/riscv/aia.c
+++ b/riscv/aia.c
@@ -209,7 +209,7 @@ void aia__create(struct kvm *kvm)
 		.flags = 0,
 	};
 
-	if (kvm->cfg.arch.ext_disabled[KVM_RISCV_ISA_EXT_SSAIA])
+	if (riscv__isa_extension_disabled(kvm, KVM_RISCV_ISA_EXT_SSAIA))
 		return;
 
 	err = ioctl(kvm->vm_fd, KVM_CREATE_DEVICE, &aia_device);
diff --git a/riscv/fdt.c b/riscv/fdt.c
index c741fd8..5d9b9bf 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -13,16 +13,17 @@ struct isa_ext_info {
 	const char *name;
 	unsigned long ext_id;
 	bool single_letter;
+	bool min_enabled;
 };
 
 struct isa_ext_info isa_info_arr[] = {
 	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */
-	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true},
-	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true},
-	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true},
-	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true},
-	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true},
-	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true},
+	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true, .min_enabled = true},
+	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true, .min_enabled = true},
+	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true, .min_enabled = true},
+	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true, .min_enabled = true},
+	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true, .min_enabled = true},
+	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true, .min_enabled = true},
 	{"v",		KVM_RISCV_ISA_EXT_V,	.single_letter = true},
 	{"h",		KVM_RISCV_ISA_EXT_H,	.single_letter = true},
 	/* multi-letter sorted alphabetically */
@@ -89,6 +90,56 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zvkt",	KVM_RISCV_ISA_EXT_ZVKT},
 };
 
+static bool __isa_ext_disabled(struct kvm *kvm, struct isa_ext_info *info)
+{
+	if (kvm->cfg.arch.cpu_type == RISCV__CPU_TYPE_MIN &&
+	    !info->min_enabled)
+		return true;
+
+	return kvm->cfg.arch.ext_disabled[info->ext_id];
+}
+
+static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info *info)
+{
+	if (kvm->cfg.arch.cpu_type == RISCV__CPU_TYPE_MIN &&
+	    !info->min_enabled)
+		return false;
+
+	return true;
+}
+
+bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
+{
+	struct isa_ext_info *info = NULL;
+	unsigned long i;
+
+	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
+		if (isa_info_arr[i].ext_id == isa_ext_id) {
+			info = &isa_info_arr[i];
+		break;
+		}
+	}
+	if (!info)
+		return true;
+
+	return __isa_ext_disabled(kvm, info);
+}
+
+int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
+{
+	struct kvm *kvm = opt->ptr;
+
+	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
+		die("Invalid CPU type %s\n", arg);
+
+	if (!strcmp(arg, "max"))
+		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MAX;
+	else
+		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MIN;
+
+	return 0;
+}
+
 static void dump_fdt(const char *dtb_file, void *fdt)
 {
 	int count, fd;
@@ -139,9 +190,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 				/* This extension is not available in hardware */
 				continue;
 
-			if (kvm->cfg.arch.ext_disabled[isa_info_arr[i].ext_id]) {
+			if (__isa_ext_disabled(kvm, &isa_info_arr[i])) {
 				isa_ext_out = 0;
-				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0 &&
+				    __isa_ext_warn_disable_failure(kvm, &isa_info_arr[i]))
 					pr_warning("Failed to disable %s ISA exension\n",
 						   isa_info_arr[i].name);
 				continue;
diff --git a/riscv/include/kvm/kvm-arch.h b/riscv/include/kvm/kvm-arch.h
index f0f469f..1bb2d32 100644
--- a/riscv/include/kvm/kvm-arch.h
+++ b/riscv/include/kvm/kvm-arch.h
@@ -90,6 +90,8 @@ enum irqchip_type {
 	IRQCHIP_AIA
 };
 
+bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long ext_id);
+
 extern enum irqchip_type riscv_irqchip;
 extern bool riscv_irqchip_inkernel;
 extern void (*riscv_irqchip_trigger)(struct kvm *kvm, int irq,
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 7e54d8a..6d9a29a 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -3,7 +3,13 @@
 
 #include "kvm/parse-options.h"
 
+enum riscv__cpu_type {
+	RISCV__CPU_TYPE_MAX = 0,
+	RISCV__CPU_TYPE_MIN
+};
+
 struct kvm_config_arch {
+	enum riscv__cpu_type cpu_type;
 	const char	*dump_dtb_filename;
 	u64		suspend_seconds;
 	u64		custom_mvendorid;
@@ -13,8 +19,12 @@ struct kvm_config_arch {
 	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
 };
 
+int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset);
+
 #define OPT_ARCH_RUN(pfx, cfg)						\
 	pfx,								\
+	OPT_CALLBACK('\0', "cpu-type", NULL, "min or max",		\
+		     "Choose the cpu type (default is max).", riscv__cpu_type_parser, kvm),\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
 	OPT_U64('\0', "suspend-seconds",				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
