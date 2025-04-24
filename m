Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C22BC369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq5eQDnvdwF8NNU0mnb3xUgh7RAEhsxPi/lubMBeamc=; b=NGqllXs7lGgSph
	9WNnyeIWZC6lqnXaLo7t4oqIbL01Ach4C3yvNOX4zjmPF753auzleJj3/rS1vIiqPFAVE6fT86RKc
	TXSXXBwQvXnXiHLI8AHS8BiiwkslZQQfV+/8YECErTUM1IR9gNn0qgBWIpFCU9wWux6iGqk0mDNzG
	ej9ppldKBy4qaN43M42V8Zdp0i5BTlFjUan4dSsl5fUz4OkdnQU1epUxHwnJpi78EY5B+LlAc2nEa
	Q0Z/fLVv03wIjynYKXEoA+03xOe2pcdi/zPI8BMpxkiuGtSf0vtXISjTNcdELn9A7Gx7yb5dV+Rzz
	1WRHpJY0uim2i+lw3hEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6v-0000000Efn0-21Tw;
	Thu, 24 Apr 2025 16:07:37 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yZC-0000000EVMH-0dRn
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:47 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so1023116a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508765; x=1746113565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Frtk/o0Vpadsquf+T/ueIK+pphbVVL4+IpDtNAsinII=;
        b=J3Bv1U8axN8xYYYKpbfXOa0if8ZLPLGClbS4aoFeQBk46+sLfm68Klu1vhdmbl2f4u
         H6KcMAQFh6nyzRuetbQtY2oKveBRxryMf4ceOc6sqm0aUc+680JykreoCQLUivDABrf5
         ujNrHGHakQQUQtMc9VHgyMiNFOKekIsyZOw+ZpeH88yeAs7jWm6y0BC7Nzjh4aOe+Fry
         1U68LEr3tNE8Ley/prJpUsjBgREGMKKgBbEcpD69sOYIq0s8wDbOHD8feKNXOhg1KytM
         eYM0tplzSQV/VHajGvyz4h9PXuxzuKVMx4Kic0TzKT6zFUlSwaBHUAO32/jRddnE8EC/
         Ql6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508765; x=1746113565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Frtk/o0Vpadsquf+T/ueIK+pphbVVL4+IpDtNAsinII=;
        b=gJqmtTjcBcxvfqC9M6TFr6iS0T0FwFKM5NjSKp/Z+jmyTX8jGZLwB4bFO0/4WG0MEJ
         GCNLig+YS8JvVc368vBoha4Mhujipze1mIfmsoXejZYAjD6taPTAIBv6iXEHqCvToGve
         H15fSG+RWSblEghll4hsLmtPzgqamAbAMd8j1sV3MnB1Bs7+mKH8d2KmxF0XTChrI9rH
         TKkEblSVzATbG4RPl9oOTG+JSwDUbtGS98179KhKNvZj6KF2/B9SGkYsM1ppPYNp6zZR
         tgOwy6nYFyQ1V0+vzjvqAcadtnEzI+aovyomYrfpNVKM7MA9kbjiPvDAnnOFmOnx/y5s
         4cug==
X-Forwarded-Encrypted: i=1; AJvYcCVfe2kaQ5xtCAgUsE8JgcQQWzWQSGUcLahLifI3ecDaf3Er4VqjdAy1+Q8JRS/RtTgwDKTf08OofAE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWkESu0/gfAlNHM4kA6N9JosP398eSWxaGLnfe/dYfH3BF242R
	cPKSIlyHVSMBly/nDgDjoeQYGpJprdmdy25uh5KlNRGLpIBPPmh0XSRv0ASiMt4=
X-Gm-Gg: ASbGncvGBl6DLnW+/pe8rIE9/LRshDX8pVpq1lIV+03fwaEtXno3yImz7lnT31XUOiw
	/N5f6UnqyA79qjhh3jjX/Sc6R8JtwrxHPuJQD3KStA/Ym1AWDFWrGz8T8+UPmsezQ8xAZBLVCu4
	yIgTQdy15KsanwEQJRgVBA0HmL2M/MbMuKQ06Jnz5OL9Ry2aamLpG4wh6+DjeW3FKZrWtksi2Eq
	VrVYNL/ZvYJzCqKfqm9E/g4TZUOASsCkmyl+o7PxOngnn+qshWFfvaa3FMNCb2PWhjBz440iYyc
	MfQAYkPQAdFr2ZscIGuXX0v936w9SlOYXqfWG/Up/dgZwLarzg1sQZ4UXXBCWfY83Vt9v8v2lx9
	4FPir
X-Google-Smtp-Source: AGHT+IGgyLIWZm8J6v5M7H7WaWUHuNkzZQ49TFQOQikE/n/Gi5I96krTD1wd+PSoMJ7aBOWvEIgmDg==
X-Received: by 2002:a05:6a21:4006:b0:1f5:5b2a:f641 with SMTP id adf61e73a8af0-20444fc068bmr4490835637.28.1745508765283;
        Thu, 24 Apr 2025 08:32:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:44 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 08/10] riscv: Include single-letter extensions in isa_info_arr[]
Date: Thu, 24 Apr 2025 21:01:57 +0530
Message-ID: <20250424153159.289441-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083246_188548_097FC94A 
X-CRM114-Status: GOOD (  12.12  )
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

Currently, the isa_info_arr[] only include multi-letter extensions but
the KVM ONE_REG interface covers both single-letter and multi-letter
extensions so extend isa_info_arr[] to include single-letter extensions.

This also allows combining two loops in the generate_cpu_nodes()
function into one loop.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 148 +++++++++++++++++++++++++++-------------------------
 1 file changed, 76 insertions(+), 72 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 251821e..c741fd8 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -12,71 +12,81 @@
 struct isa_ext_info {
 	const char *name;
 	unsigned long ext_id;
+	bool single_letter;
 };
 
 struct isa_ext_info isa_info_arr[] = {
-	/* sorted alphabetically */
-	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM},
-	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
-	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
-	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
-	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM},
-	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
-	{"svade", KVM_RISCV_ISA_EXT_SVADE},
-	{"svadu", KVM_RISCV_ISA_EXT_SVADU},
-	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
-	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
-	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
-	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
-	{"zabha", KVM_RISCV_ISA_EXT_ZABHA},
-	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
-	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
-	{"zba", KVM_RISCV_ISA_EXT_ZBA},
-	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
-	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
-	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB},
-	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
-	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
-	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
-	{"zca", KVM_RISCV_ISA_EXT_ZCA},
-	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
-	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
-	{"zcf", KVM_RISCV_ISA_EXT_ZCF},
-	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP},
-	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
-	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
-	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
-	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
-	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
-	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE},
-	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
-	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
-	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
-	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
-	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL},
-	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
-	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
-	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP},
-	{"zknd", KVM_RISCV_ISA_EXT_ZKND},
-	{"zkne", KVM_RISCV_ISA_EXT_ZKNE},
-	{"zknh", KVM_RISCV_ISA_EXT_ZKNH},
-	{"zkr", KVM_RISCV_ISA_EXT_ZKR},
-	{"zksed", KVM_RISCV_ISA_EXT_ZKSED},
-	{"zksh", KVM_RISCV_ISA_EXT_ZKSH},
-	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
-	{"ztso", KVM_RISCV_ISA_EXT_ZTSO},
-	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB},
-	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC},
-	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH},
-	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN},
-	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB},
-	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG},
-	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED},
-	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA},
-	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB},
-	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED},
-	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH},
-	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT},
+	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */
+	{"i",		KVM_RISCV_ISA_EXT_I,	.single_letter = true},
+	{"m",		KVM_RISCV_ISA_EXT_M,	.single_letter = true},
+	{"a",		KVM_RISCV_ISA_EXT_A,	.single_letter = true},
+	{"f",		KVM_RISCV_ISA_EXT_F,	.single_letter = true},
+	{"d",		KVM_RISCV_ISA_EXT_D,	.single_letter = true},
+	{"c",		KVM_RISCV_ISA_EXT_C,	.single_letter = true},
+	{"v",		KVM_RISCV_ISA_EXT_V,	.single_letter = true},
+	{"h",		KVM_RISCV_ISA_EXT_H,	.single_letter = true},
+	/* multi-letter sorted alphabetically */
+	{"smnpm",	KVM_RISCV_ISA_EXT_SMNPM},
+	{"smstateen",	KVM_RISCV_ISA_EXT_SMSTATEEN},
+	{"ssaia",	KVM_RISCV_ISA_EXT_SSAIA},
+	{"sscofpmf",	KVM_RISCV_ISA_EXT_SSCOFPMF},
+	{"ssnpm",	KVM_RISCV_ISA_EXT_SSNPM},
+	{"sstc",	KVM_RISCV_ISA_EXT_SSTC},
+	{"svade",	KVM_RISCV_ISA_EXT_SVADE},
+	{"svadu",	KVM_RISCV_ISA_EXT_SVADU},
+	{"svinval",	KVM_RISCV_ISA_EXT_SVINVAL},
+	{"svnapot",	KVM_RISCV_ISA_EXT_SVNAPOT},
+	{"svpbmt",	KVM_RISCV_ISA_EXT_SVPBMT},
+	{"svvptc",	KVM_RISCV_ISA_EXT_SVVPTC},
+	{"zabha",	KVM_RISCV_ISA_EXT_ZABHA},
+	{"zacas",	KVM_RISCV_ISA_EXT_ZACAS},
+	{"zawrs",	KVM_RISCV_ISA_EXT_ZAWRS},
+	{"zba",		KVM_RISCV_ISA_EXT_ZBA},
+	{"zbb",		KVM_RISCV_ISA_EXT_ZBB},
+	{"zbc",		KVM_RISCV_ISA_EXT_ZBC},
+	{"zbkb",	KVM_RISCV_ISA_EXT_ZBKB},
+	{"zbkc",	KVM_RISCV_ISA_EXT_ZBKC},
+	{"zbkx",	KVM_RISCV_ISA_EXT_ZBKX},
+	{"zbs",		KVM_RISCV_ISA_EXT_ZBS},
+	{"zca",		KVM_RISCV_ISA_EXT_ZCA},
+	{"zcb",		KVM_RISCV_ISA_EXT_ZCB},
+	{"zcd",		KVM_RISCV_ISA_EXT_ZCD},
+	{"zcf",		KVM_RISCV_ISA_EXT_ZCF},
+	{"zcmop",	KVM_RISCV_ISA_EXT_ZCMOP},
+	{"zfa",		KVM_RISCV_ISA_EXT_ZFA},
+	{"zfh",		KVM_RISCV_ISA_EXT_ZFH},
+	{"zfhmin",	KVM_RISCV_ISA_EXT_ZFHMIN},
+	{"zicbom",	KVM_RISCV_ISA_EXT_ZICBOM},
+	{"zicboz",	KVM_RISCV_ISA_EXT_ZICBOZ},
+	{"ziccrse",	KVM_RISCV_ISA_EXT_ZICCRSE},
+	{"zicntr",	KVM_RISCV_ISA_EXT_ZICNTR},
+	{"zicond",	KVM_RISCV_ISA_EXT_ZICOND},
+	{"zicsr",	KVM_RISCV_ISA_EXT_ZICSR},
+	{"zifencei",	KVM_RISCV_ISA_EXT_ZIFENCEI},
+	{"zihintntl",	KVM_RISCV_ISA_EXT_ZIHINTNTL},
+	{"zihintpause",	KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
+	{"zihpm",	KVM_RISCV_ISA_EXT_ZIHPM},
+	{"zimop",	KVM_RISCV_ISA_EXT_ZIMOP},
+	{"zknd",	KVM_RISCV_ISA_EXT_ZKND},
+	{"zkne",	KVM_RISCV_ISA_EXT_ZKNE},
+	{"zknh",	KVM_RISCV_ISA_EXT_ZKNH},
+	{"zkr",		KVM_RISCV_ISA_EXT_ZKR},
+	{"zksed",	KVM_RISCV_ISA_EXT_ZKSED},
+	{"zksh",	KVM_RISCV_ISA_EXT_ZKSH},
+	{"zkt",		KVM_RISCV_ISA_EXT_ZKT},
+	{"ztso",	KVM_RISCV_ISA_EXT_ZTSO},
+	{"zvbb",	KVM_RISCV_ISA_EXT_ZVBB},
+	{"zvbc",	KVM_RISCV_ISA_EXT_ZVBC},
+	{"zvfh",	KVM_RISCV_ISA_EXT_ZVFH},
+	{"zvfhmin",	KVM_RISCV_ISA_EXT_ZVFHMIN},
+	{"zvkb",	KVM_RISCV_ISA_EXT_ZVKB},
+	{"zvkg",	KVM_RISCV_ISA_EXT_ZVKG},
+	{"zvkned",	KVM_RISCV_ISA_EXT_ZVKNED},
+	{"zvknha",	KVM_RISCV_ISA_EXT_ZVKNHA},
+	{"zvknhb",	KVM_RISCV_ISA_EXT_ZVKNHB},
+	{"zvksed",	KVM_RISCV_ISA_EXT_ZVKSED},
+	{"zvksh",	KVM_RISCV_ISA_EXT_ZVKSH},
+	{"zvkt",	KVM_RISCV_ISA_EXT_ZVKT},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
@@ -98,10 +108,8 @@ static void dump_fdt(const char *dtb_file, void *fdt)
 #define CPU_NAME_MAX_LEN 15
 static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 {
-	int cpu, pos, i, index, valid_isa_len;
-	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
-	int arr_sz = ARRAY_SIZE(isa_info_arr);
 	unsigned long cbom_blksz = 0, cboz_blksz = 0, satp_mode = 0;
+	int i, cpu, pos, arr_sz = ARRAY_SIZE(isa_info_arr);
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -121,12 +129,6 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 
 		snprintf(cpu_isa, CPU_ISA_MAX_LEN, "rv%ld", vcpu->riscv_xlen);
 		pos = strlen(cpu_isa);
-		valid_isa_len = strlen(valid_isa_order);
-		for (i = 0; i < valid_isa_len; i++) {
-			index = valid_isa_order[i] - 'A';
-			if (vcpu->riscv_isa & (1 << (index)))
-				cpu_isa[pos++] = 'a' + index;
-		}
 
 		for (i = 0; i < arr_sz; i++) {
 			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
@@ -164,7 +166,9 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 					   isa_info_arr[i].name);
 				break;
 			}
-			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
+
+			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "%s%s",
+					isa_info_arr[i].single_letter ? "" : "_",
 					isa_info_arr[i].name);
 		}
 		cpu_isa[pos] = '\0';
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
