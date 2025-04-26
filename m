Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64891C369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z14JXXsImTZ5iCh0VpWrLviVoGcd+IxLPykK93N+NcY=; b=g/W2v25tyGbBQg
	v53UR9ux0rO1y/r1Fqd9GtHkgX73vZtFTS2TL9Fdd2w47eNufFGbSMP6gB1F/YSK6Unb0M69ztV03
	msUWx/Jmpkkwd5Os8Sf7YDjBJbbBIdH69+GOGIqpw5aE52VqcMU/+BO0Yulw1qB9EfHIm/0bGfvMW
	lskko5fASNOdXP+wAmz+TIMXfP+6WhLCgj8lj5JtXDh/aPzarRduBtPM9CyVRqrerFv28jPAcVP0u
	nbrHrY38fF+dNhMe0HQgDRlSUaGmyDtx3QD1x11/+kBPE9U+FAWfPDa6X22o20NDM/zz/TFlZNzma
	75QQU5ySbl5gGd2jyoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKq-00000001u70-0iuS;
	Sat, 26 Apr 2025 11:04:40 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKn-00000001u5A-0qcA
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:38 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so3514241a91.1
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665476; x=1746270276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYn/7MVNfoUYT5BM89IVGc1t8Fbskccdra0N4a7LYrg=;
        b=NLaRB7AAAUXUOgKNEGZ92blCV4deFhb0ai71LnSyvBLzeyb1jhMyCEt/EiZ3keTeFw
         bik1tGIEWjeItGwMePg4Nr3yHmXCzes49a37UQ1n7wrEN+499F/sqLSEbDvJCBWOTIEx
         YhfgdGE8KD0dLTPMFYMSny4FrZUomPBiFnX4coNPwxosOwFEM7gZrCMQEJ+MYKHTmtqJ
         zooxs7toRtB6vGvc7QKAsXdQ6WyxgZ4h8wROghEuYmK8dph8jjEzMxk7sXF6LGXsXedt
         RnXxtzvet8kMxCjkVUZ9gIhxsiUgW18Q59SdnlgJ/4QQBV1QheLdGMW+ms7pMTBCKoQw
         LNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665476; x=1746270276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYn/7MVNfoUYT5BM89IVGc1t8Fbskccdra0N4a7LYrg=;
        b=uU0GV95Hf4FCqB28hmo7yZvh8eHrl/WxwA1NdmCU1sI44h+9nXSV1kjAEmutDMCXRw
         WD0FMqJPgrvShPfqiThz1bhZJ+nZjx+bqglWPVpfwmsSx26oP37L+2rUEYb4RjSw2UvW
         vOoRWtBtBqqfW8EsXhJs6U4oC6mdibk1SyUGpkbyvQDSvVVHgZPnaXp3rbmye0Pqn4p2
         pTXjB2wOtnkh1JC1VpNrEGXE29IUFxJbVibaLk/MmTqBUjTqbBLvDO4og6j3NWVInewA
         QEBw88z47jKcifSI5vMaxc4U1QPBH7YIm/YVGVaCJOp2lINoCr7vx6ov3Of1Jbzamy+X
         t1UQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3+ZsSelF6vMRtJ1pVWP354uz89VJlXN9gqIdQHW8Dnp+Gb7DlSbTUIOSx0olrzJJ+3K0aNnx8Mck=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmsHNo3KWuHjAi4rzDlAfUUfpDsc+bV4XsUQYlPAXEB8seGcrV
	AlpV0IRcBYArrP9EW42v/jXkUdY4GjcdALs79/X1MAhVu70pfKEx7E4D7MyBF70=
X-Gm-Gg: ASbGncsBdRdSVwcRwccF3QR1usV9NRYctr9CntaF4BYBg16umMFYmzyZQ/mQ+adTZxL
	gLpTBwkb6UxFLeDFRAvD982HNfopIQcNTJY8gp+t1oiKOVZ6frb4OixMZlfBPqBxvDiZY2/5NYN
	9wyzoAeeSG87uZLnF6yFwExHxXdnndak79kTQrNQwsn7iQ/s7u2+Jc1cqHOsvrXR5n8ZD/IdNjB
	KYUHpam1JxV4pbPEx6EC3B4uOmAxKPFkV35ggRJemDUS+torWzSbxYfw8qmLLg0i2s2P2lw/61G
	/R++/GwOwbdxl5FecJoqHhHlZmu8aEU6F4SnULzRX8e4dAodwsT3fFB7VfWVs3kAJq4k5x9giOF
	rG/KI
X-Google-Smtp-Source: AGHT+IHZcPmRk5gPH/rH2C3jEZSb4NxsBOfY7HPr+KD0wv8fTTgyyCcfCNUg48txYmIiFnZJNGrSWQ==
X-Received: by 2002:a17:90b:3504:b0:301:1c11:aa83 with SMTP id 98e67ed59e1d1-30a013b1668mr3710418a91.28.1745665476071;
        Sat, 26 Apr 2025 04:04:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:35 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 08/10] riscv: Include single-letter extensions in isa_info_arr[]
Date: Sat, 26 Apr 2025 16:33:45 +0530
Message-ID: <20250426110348.338114-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040437_240762_005F4109 
X-CRM114-Status: GOOD (  12.07  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
