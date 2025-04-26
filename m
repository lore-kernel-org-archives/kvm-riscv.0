Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3BCC369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6szcIqa8HD6XtvInOropXHAA9qrskW92JE+k6k8Pns=; b=nqxqEpbhhHgCn5
	8NzV4Dvga3xJ5ZorYRILISk3pJAVPwAY32mlEVDlnmpGJTl08byswUO/2YVpiOqCT8TTkjAkQxY3o
	0s6trk+ExLrSfMRZjkE70W3osm7aYnsa7WXZ+vamsOkwNybHjMtA2iO9iQF9pUadaTJajaFmhrRQO
	iTXUhyEVIK5CBXolJ7tl4VtGWWltGPVs8QBlha7uwqif50Hi9BWsGyb1rpbdmLbP3KXPeBsDOivJi
	6Gk2pWtzDjtusKyDK+MNtEPs73dcjmiMLBGnqPT60eQDbX6xPsjf0LvYjTtCJKHFOeErramWqTIlE
	/ZrTbE/yxuTsTAFe6OXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKt-00000001u8i-1wWE;
	Sat, 26 Apr 2025 11:04:43 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKr-00000001u7i-1TJx
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:42 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so2484492a12.0
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665480; x=1746270280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo4Fl+pVAb32qLSshYkAcx18QLYg4yrAcKR/5H6gjL0=;
        b=pSiAJkAx5hmjcVURoPowcbA1/SMXI2N53YcRszg/tcHu54x8HhN+SwjZC3TfovnZFD
         zpMIoZSKwXC+OJLs1XP3wzgnwwaubYmcmqs2q07/E5PW300Q/WSUkaHnS4QzXP8ChqbN
         tBtBl3cFgETxLW6ml5ee34RnOlW845Dflpj5Y8Jyg+11FsAp7l6ALlyZNkiENvBvUL7a
         XdoskM6G7B0QCgIKisgcaNl4QkODtw/Fme7tKUG1LO6Y3upiJKa8PTYS/sq1q4Dfi3FV
         Ek/UljLm0sAbrtBs9VTR3qsLHXMKown8lqARprKW4ow6vjBVYN9shlJkTUgos1PoPqR8
         qVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665480; x=1746270280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xo4Fl+pVAb32qLSshYkAcx18QLYg4yrAcKR/5H6gjL0=;
        b=by82ee4Aa4zJapO7ve0TlZOZdY/toWggDXfCMvr63ynDUgKJIgUN3SW6OE7U9zzPDY
         ZN5gHYKHtAjJrEdv5gKBA0L29A6SVdE6sfSozIE9+c8tVe2Wjpsd0AAq7bmjgR+hQxnL
         GfpJtRMqoyfJFqnMFXlYihUoxpOC/mzx6V+wzPb0oYaSujQa/oQ3IDMzDuqdYUDxdVvS
         ZmzaLJMWm6cp2FJ0ymTPU5othqgcRmCGUmKKJ1eUa/gEXqRrZOql6ht1oB+p1mE2m5aS
         4i72AvbLF5yCYlBfMFpb5IO2zdErV3qfewOajP/kdMkhOxmyY48mouerbIjufuuqhBDv
         xIVA==
X-Forwarded-Encrypted: i=1; AJvYcCWYm5KYneVRp/fP5/+384TO0FLr7js452GXLssq8FF+ritGMaF627/iTTBRrvnSJ1B3+7tfFL89Opg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSKkoBXTBnsVmBlG9oZF2saBRdEpUEx38apUBPM98VUHyCaHtC
	CUE2+Tk7zFypPh2u0dkrOqVMAom98dVR9As0M5zBbItZQMC2y0b0clWxFhU2L4g=
X-Gm-Gg: ASbGnctVSBrCkBbypUj7UJZI7T2p26RZoCPwVq6kn58Ev313VkoP0T8ZI0TZX/XpNMw
	FQ2DPjASHmLxHGtTDoEoe9Kap1OEeaDIUxyb9QnIF3QgNIUrXelQsTgdXB5a7eiqkZSRy5XjosL
	c45CUwv8S5+Vz29yg0HSthgm7FYiNOPVWpLFil/7Q8+L0aqlE1v2XtcWbnkz5fYqpxbU7JQFU7o
	Crb6wqVUrNJL+6OGLDEKphJenCVM1awoAyCTwIdT1TvSycvq4uB/Sejj2oR9kgzZHyUgHP9nxJj
	uQHMZcpYdu+n+xqicLzqkisRdsq+SEOoOw88I354AegaZmGA4IKoSPrjmYeddFzslDafWUYe8B0
	YDUYI
X-Google-Smtp-Source: AGHT+IGFdwG5nx4focrSUQIHOY7lZnK0HJsTw7gvZeD5G+O0EY/0nVr5PBoeJS7FVvcFvd3EbxH7VA==
X-Received: by 2002:a17:902:ef47:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22dc6a54a44mr47953985ad.36.1745665480347;
        Sat, 26 Apr 2025 04:04:40 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:39 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 09/10] riscv: Add cpu-type command-line option
Date: Sat, 26 Apr 2025 16:33:46 +0530
Message-ID: <20250426110348.338114-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040441_386846_856E86D3 
X-CRM114-Status: GOOD (  18.83  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
index c741fd8..abb6557 100644
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
+			break;
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
