Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADB7C36016
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u04zVcw+qipXG3BHGOwjOWPKYNZNTbNEhNlw65nXRhM=; b=nmIekM9eyz0ufD
	CkfxWo2CwQEL2WQqj7HTsJRjbMSYlspmNBa2jkIFAflYRuZc8vzNqV1IASQMaHYuN9AQr9wlJ4T6S
	RGXcCeh5t+d0nOQleJ/dXCZrgg2knW9jYCUrWzt5svYzRA2YkSMeHkcvdT4D2ZB/zQLXY9dp3/um1
	UCjt/cL/DfqhmhVLzB95DkTPlzpMGX+q7L/QpURyqpdcOCtreVInPYPybkYcmEc4GD8GuvBJwLw9v
	5WLY6tbOZSiFYK1u55ruL6B9AeVoZjAjgvYH5IMo6K1TiDwhzBxHylGG6mQkesgL8csl3qXtzwKn3
	jpmFFZ+8bW/PDSwLSRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKic-00000007iRz-2wMc;
	Wed, 26 Mar 2025 06:58:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhc-00000007i85-1X1h
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22401f4d35aso135434535ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972248; x=1743577048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8sYS0mGBFpzdWCqih7tNQr0/K62dVE67VsyJQp2bF4=;
        b=eiKzNAvo1OxIdSPb0aIUQV8IMnDMH4KPliA+ZigEcvnq4XlYOz94qhX5OhdBoEVBXH
         essMKb0yuHZwKkrldGN0qX2UjCTenPZPkYjrzlHmMcTaC10dX6Ru5OHq6q2+pZkGusfG
         9sQ1qUm4nxCoJObZ9e1HKlBfQIjEgAWGLbXcCL0q5qHxmLFGxnVWdWMSMsRGUtOEP8vm
         TD02uh546A4JJvZ4QLnzRN8dApUkLk4G7dKdIfHwuu4VyiE3OkgzqBmeSbRV62J+wYZ2
         +g8EBT9ngyEsW4EMAuK4dEwe2Gc0WQIZKHUdsnKE3LUvp/DhAmh4R/+6kBxZpCLYPvQc
         RHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972248; x=1743577048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8sYS0mGBFpzdWCqih7tNQr0/K62dVE67VsyJQp2bF4=;
        b=TOhbuLJTYmEEZOLt7iKqzlPOGkLNK2z72xowv8ZGM+qPoXBsOdLbrO0tPPru/SiHuX
         Gc0xWhXdVss+KREyQCOC5e58tDZ0m4RE8wyRL+AvJkZpSD304Ndm1fAjifdozfGTYCcf
         1P6CVeP21Rek4JJzFn/sPHlQfpaxkAPAO0raON5OYS0zDUuMXkrkso+4hMjbMlAztvSz
         MObQxpbUAMDvoosoajxjsiQO3w092BbTiWW/4gd3EbP6Zyo6tfxadDfQMYxrhIPtm969
         tbL1ab8qC8mNRlpSBgEagkE87qVXupJoA3NM9XHYsEfuROzJxLkW1Sm6OWs2ijqEu2yU
         Euhw==
X-Forwarded-Encrypted: i=1; AJvYcCX12IprdnYUp1bQ2ri9je6mjTkOGZclI5sCzorFbuKGAmuSjOHEQvsoLAbPgrN4vz0jUKlAx7yhctE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yytmx81OVztRQBQsWkJNRaQ1oN9A/R2zSOQS/8WXtKqVyIpz/jW
	G1Vc7+UCPXuMnQE6nrIXmDA4qTMESa4Q7Qs9sMTM+gCmULsjJmlLXiN+LY3YAig=
X-Gm-Gg: ASbGncuzTliLwqm9MroG/L61iS8UqtBfIkLGv/GA/U98b27ANqUivfaJlm2M/XnwITF
	bXfNhokbH3hpdFC5SWrneJ5GA7yHJ39NjOz2GJZLYDPHGfK0zKL/W7ggjhbmox38TMKmspx//Kk
	ObwKn3e2OMnKM2B7UIMTm7CMNFoUkgVi0RxEU3yjhHOwwDyqhgLyGIwJJPiVDxhxELycPVLTmRr
	50fC4lDFej7nk9cVirwo0JohiY6iuch+Vz61rNGyBAJhiN51DQ27qKy+NwLCbnyOvJucIQV7GBz
	7L75qUvHC5/K6QTJYIhVT1rHoJxq0C7rtX/wNJVKcdBvULpC2OfMYRqiaixjiqNi9XzT1uxbzvA
	37KhV8pv8O8lbX+n8
X-Google-Smtp-Source: AGHT+IH0ang+2XFqtIDSGLqN8uYyeTYD9gQBM1UWFsOgO0amceh8OAp2LnSh1T9B9MZgjZdK3NL43Q==
X-Received: by 2002:aa7:88c9:0:b0:730:7600:aeab with SMTP id d2e1a72fcca58-739059c5da7mr31327771b3a.13.1742972247623;
        Tue, 25 Mar 2025 23:57:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:27 -0700 (PDT)
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
Subject: [kvmtool PATCH 09/10] riscv: Add cpu-type command-line option
Date: Wed, 26 Mar 2025 12:26:43 +0530
Message-ID: <20250326065644.73765-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235728_412938_E05701A1 
X-CRM114-Status: GOOD (  20.47  )
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
 riscv/aia.c                         |   2 +-
 riscv/fdt.c                         | 220 +++++++++++++++++-----------
 riscv/include/kvm/kvm-arch.h        |   2 +
 riscv/include/kvm/kvm-config-arch.h |   5 +
 riscv/kvm.c                         |   2 +
 5 files changed, 143 insertions(+), 88 deletions(-)

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
index 46efb47..4c018c8 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -13,82 +13,134 @@ struct isa_ext_info {
 	const char *name;
 	unsigned long ext_id;
 	bool multi_letter;
+	bool min_cpu_included;
 };
 
 struct isa_ext_info isa_info_arr[] = {
-	/* single-letter */
-	{"a", KVM_RISCV_ISA_EXT_A, false},
-	{"c", KVM_RISCV_ISA_EXT_C, false},
-	{"d", KVM_RISCV_ISA_EXT_D, false},
-	{"f", KVM_RISCV_ISA_EXT_F, false},
-	{"h", KVM_RISCV_ISA_EXT_H, false},
-	{"i", KVM_RISCV_ISA_EXT_I, false},
-	{"m", KVM_RISCV_ISA_EXT_M, false},
-	{"v", KVM_RISCV_ISA_EXT_V, false},
+	/* single-letter ordered canonically as "IEMAFDQCLBJTPVNSUHKORWXYZG" */
+	{"i",		KVM_RISCV_ISA_EXT_I,		false, true},
+	{"m",		KVM_RISCV_ISA_EXT_M,		false, true},
+	{"a",		KVM_RISCV_ISA_EXT_A,		false, true},
+	{"f",		KVM_RISCV_ISA_EXT_F,		false, true},
+	{"d",		KVM_RISCV_ISA_EXT_D,		false, true},
+	{"c",		KVM_RISCV_ISA_EXT_C,		false, true},
+	{"v",		KVM_RISCV_ISA_EXT_V,		false, false},
+	{"h",		KVM_RISCV_ISA_EXT_H,		false, false},
 	/* multi-letter sorted alphabetically */
-	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM, true},
-	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN, true},
-	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA, true},
-	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF, true},
-	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM, true},
-	{"sstc", KVM_RISCV_ISA_EXT_SSTC, true},
-	{"svade", KVM_RISCV_ISA_EXT_SVADE, true},
-	{"svadu", KVM_RISCV_ISA_EXT_SVADU, true},
-	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL, true},
-	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT, true},
-	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT, true},
-	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC, true},
-	{"zabha", KVM_RISCV_ISA_EXT_ZABHA, true},
-	{"zacas", KVM_RISCV_ISA_EXT_ZACAS, true},
-	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS, true},
-	{"zba", KVM_RISCV_ISA_EXT_ZBA, true},
-	{"zbb", KVM_RISCV_ISA_EXT_ZBB, true},
-	{"zbc", KVM_RISCV_ISA_EXT_ZBC, true},
-	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB, true},
-	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC, true},
-	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX, true},
-	{"zbs", KVM_RISCV_ISA_EXT_ZBS, true},
-	{"zca", KVM_RISCV_ISA_EXT_ZCA, true},
-	{"zcb", KVM_RISCV_ISA_EXT_ZCB, true},
-	{"zcd", KVM_RISCV_ISA_EXT_ZCD, true},
-	{"zcf", KVM_RISCV_ISA_EXT_ZCF, true},
-	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP, true},
-	{"zfa", KVM_RISCV_ISA_EXT_ZFA, true},
-	{"zfh", KVM_RISCV_ISA_EXT_ZFH, true},
-	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN, true},
-	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM, true},
-	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ, true},
-	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE, true},
-	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR, true},
-	{"zicond", KVM_RISCV_ISA_EXT_ZICOND, true},
-	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR, true},
-	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI, true},
-	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL, true},
-	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE, true},
-	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM, true},
-	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP, true},
-	{"zknd", KVM_RISCV_ISA_EXT_ZKND, true},
-	{"zkne", KVM_RISCV_ISA_EXT_ZKNE, true},
-	{"zknh", KVM_RISCV_ISA_EXT_ZKNH, true},
-	{"zkr", KVM_RISCV_ISA_EXT_ZKR, true},
-	{"zksed", KVM_RISCV_ISA_EXT_ZKSED, true},
-	{"zksh", KVM_RISCV_ISA_EXT_ZKSH, true},
-	{"zkt", KVM_RISCV_ISA_EXT_ZKT, true},
-	{"ztso", KVM_RISCV_ISA_EXT_ZTSO, true},
-	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB, true},
-	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC, true},
-	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH, true},
-	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN, true},
-	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB, true},
-	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG, true},
-	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED, true},
-	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA, true},
-	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB, true},
-	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED, true},
-	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH, true},
-	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT, true},
+	{"smnpm",	KVM_RISCV_ISA_EXT_SMNPM,	true, false},
+	{"smstateen",	KVM_RISCV_ISA_EXT_SMSTATEEN,	true, false},
+	{"ssaia",	KVM_RISCV_ISA_EXT_SSAIA,	true, false},
+	{"sscofpmf",	KVM_RISCV_ISA_EXT_SSCOFPMF,	true, false},
+	{"ssnpm",	KVM_RISCV_ISA_EXT_SSNPM,	true, false},
+	{"sstc",	KVM_RISCV_ISA_EXT_SSTC,		true, false},
+	{"svade",	KVM_RISCV_ISA_EXT_SVADE,	true, false},
+	{"svadu",	KVM_RISCV_ISA_EXT_SVADU,	true, false},
+	{"svinval",	KVM_RISCV_ISA_EXT_SVINVAL,	true, false},
+	{"svnapot",	KVM_RISCV_ISA_EXT_SVNAPOT,	true, false},
+	{"svpbmt",	KVM_RISCV_ISA_EXT_SVPBMT,	true, false},
+	{"svvptc",	KVM_RISCV_ISA_EXT_SVVPTC,	true, false},
+	{"zabha",	KVM_RISCV_ISA_EXT_ZABHA,	true, false},
+	{"zacas",	KVM_RISCV_ISA_EXT_ZACAS,	true, false},
+	{"zawrs",	KVM_RISCV_ISA_EXT_ZAWRS,	true, false},
+	{"zba",		KVM_RISCV_ISA_EXT_ZBA,		true, false},
+	{"zbb",		KVM_RISCV_ISA_EXT_ZBB,		true, false},
+	{"zbc",		KVM_RISCV_ISA_EXT_ZBC,		true, false},
+	{"zbkb",	KVM_RISCV_ISA_EXT_ZBKB,		true, false},
+	{"zbkc",	KVM_RISCV_ISA_EXT_ZBKC,		true, false},
+	{"zbkx",	KVM_RISCV_ISA_EXT_ZBKX,		true, false},
+	{"zbs",		KVM_RISCV_ISA_EXT_ZBS,		true, false},
+	{"zca",		KVM_RISCV_ISA_EXT_ZCA,		true, false},
+	{"zcb",		KVM_RISCV_ISA_EXT_ZCB,		true, false},
+	{"zcd",		KVM_RISCV_ISA_EXT_ZCD,		true, false},
+	{"zcf",		KVM_RISCV_ISA_EXT_ZCF,		true, false},
+	{"zcmop",	KVM_RISCV_ISA_EXT_ZCMOP,	true, false},
+	{"zfa",		KVM_RISCV_ISA_EXT_ZFA,		true, false},
+	{"zfh",		KVM_RISCV_ISA_EXT_ZFH,		true, false},
+	{"zfhmin",	KVM_RISCV_ISA_EXT_ZFHMIN,	true, false},
+	{"zicbom",	KVM_RISCV_ISA_EXT_ZICBOM,	true, false},
+	{"zicboz",	KVM_RISCV_ISA_EXT_ZICBOZ,	true, false},
+	{"ziccrse",	KVM_RISCV_ISA_EXT_ZICCRSE,	true, false},
+	{"zicntr",	KVM_RISCV_ISA_EXT_ZICNTR,	true, false},
+	{"zicond",	KVM_RISCV_ISA_EXT_ZICOND,	true, false},
+	{"zicsr",	KVM_RISCV_ISA_EXT_ZICSR,	true, false},
+	{"zifencei",	KVM_RISCV_ISA_EXT_ZIFENCEI,	true, false},
+	{"zihintntl",	KVM_RISCV_ISA_EXT_ZIHINTNTL,	true, false},
+	{"zihintpause",	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,	true, false},
+	{"zihpm",	KVM_RISCV_ISA_EXT_ZIHPM,	true, false},
+	{"zimop",	KVM_RISCV_ISA_EXT_ZIMOP,	true, false},
+	{"zknd",	KVM_RISCV_ISA_EXT_ZKND,		true, false},
+	{"zkne",	KVM_RISCV_ISA_EXT_ZKNE,		true, false},
+	{"zknh",	KVM_RISCV_ISA_EXT_ZKNH,		true, false},
+	{"zkr",		KVM_RISCV_ISA_EXT_ZKR,		true, false},
+	{"zksed",	KVM_RISCV_ISA_EXT_ZKSED,	true, false},
+	{"zksh",	KVM_RISCV_ISA_EXT_ZKSH,		true, false},
+	{"zkt",		KVM_RISCV_ISA_EXT_ZKT,		true, false},
+	{"ztso",	KVM_RISCV_ISA_EXT_ZTSO,		true, false},
+	{"zvbb",	KVM_RISCV_ISA_EXT_ZVBB,		true, false},
+	{"zvbc",	KVM_RISCV_ISA_EXT_ZVBC,		true, false},
+	{"zvfh",	KVM_RISCV_ISA_EXT_ZVFH,		true, false},
+	{"zvfhmin",	KVM_RISCV_ISA_EXT_ZVFHMIN,	true, false},
+	{"zvkb",	KVM_RISCV_ISA_EXT_ZVKB,		true, false},
+	{"zvkg",	KVM_RISCV_ISA_EXT_ZVKG,		true, false},
+	{"zvkned",	KVM_RISCV_ISA_EXT_ZVKNED,	true, false},
+	{"zvknha",	KVM_RISCV_ISA_EXT_ZVKNHA,	true, false},
+	{"zvknhb",	KVM_RISCV_ISA_EXT_ZVKNHB,	true, false},
+	{"zvksed",	KVM_RISCV_ISA_EXT_ZVKSED,	true, false},
+	{"zvksh",	KVM_RISCV_ISA_EXT_ZVKSH,	true, false},
+	{"zvkt",	KVM_RISCV_ISA_EXT_ZVKT,		true, false},
 };
 
+static bool __isa_ext_disabled(struct kvm *kvm, struct isa_ext_info *info)
+{
+	if (!strncmp(kvm->cfg.arch.cpu_type, "min", 3) &&
+	    !info->min_cpu_included)
+		return true;
+
+	return kvm->cfg.arch.ext_disabled[info->ext_id];
+}
+
+static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info *info)
+{
+	if (!strncmp(kvm->cfg.arch.cpu_type, "min", 3) &&
+	    !info->min_cpu_included)
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
+	if (!strncmp(arg, "max", 3))
+		kvm->cfg.arch.cpu_type = "max";
+
+	if (!strncmp(arg, "min", 3))
+		kvm->cfg.arch.cpu_type = "min";
+
+	return 0;
+}
+
 static void dump_fdt(const char *dtb_file, void *fdt)
 {
 	int count, fd;
@@ -108,10 +160,8 @@ static void dump_fdt(const char *dtb_file, void *fdt)
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
@@ -131,18 +181,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 
 		snprintf(cpu_isa, CPU_ISA_MAX_LEN, "rv%ld", vcpu->riscv_xlen);
 		pos = strlen(cpu_isa);
-		valid_isa_len = strlen(valid_isa_order);
-		for (i = 0; i < valid_isa_len; i++) {
-			index = valid_isa_order[i] - 'A';
-			if (vcpu->riscv_isa & (1 << (index)))
-				cpu_isa[pos++] = 'a' + index;
-		}
 
 		for (i = 0; i < arr_sz; i++) {
-			/* Skip single-letter extensions since these are taken care */
-			if (!isa_info_arr[i].multi_letter)
-				continue;
-
 			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
 			reg.addr = (unsigned long)&isa_ext_out;
 			if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
@@ -151,9 +191,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 				/* This extension is not available in hardware */
 				continue;
 
-			if (kvm->cfg.arch.ext_disabled[isa_info_arr[i].ext_id]) {
+			if (__isa_ext_disabled(kvm, &isa_info_arr[i])) {
 				isa_ext_out = 0;
-				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+				if ((ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0) &&
+				     __isa_ext_warn_disable_failure(kvm, &isa_info_arr[i]))
 					pr_warning("Failed to disable %s ISA exension\n",
 						   isa_info_arr[i].name);
 				continue;
@@ -178,8 +219,13 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 					   isa_info_arr[i].name);
 				break;
 			}
-			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
-					isa_info_arr[i].name);
+
+			if (isa_info_arr[i].multi_letter)
+				pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "_%s",
+						isa_info_arr[i].name);
+			else
+				pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN - pos, "%s",
+						isa_info_arr[i].name);
 		}
 		cpu_isa[pos] = '\0';
 
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
index 7e54d8a..26b1b50 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -4,6 +4,7 @@
 #include "kvm/parse-options.h"
 
 struct kvm_config_arch {
+	const char	*cpu_type;
 	const char	*dump_dtb_filename;
 	u64		suspend_seconds;
 	u64		custom_mvendorid;
@@ -13,8 +14,12 @@ struct kvm_config_arch {
 	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
 };
 
+int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset);
+
 #define OPT_ARCH_RUN(pfx, cfg)						\
 	pfx,								\
+	OPT_CALLBACK('\0', "cpu-type", kvm, "min or max",		\
+		     "Choose the cpu type (default is max).", riscv__cpu_type_parser, kvm),\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
 	OPT_U64('\0', "suspend-seconds",				\
diff --git a/riscv/kvm.c b/riscv/kvm.c
index 1d49479..6a1b154 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -20,6 +20,8 @@ u64 kvm__arch_default_ram_address(void)
 
 void kvm__arch_validate_cfg(struct kvm *kvm)
 {
+	if (!kvm->cfg.arch.cpu_type)
+		kvm->cfg.arch.cpu_type = "max";
 }
 
 bool kvm__arch_cpu_supports_vm(void)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
