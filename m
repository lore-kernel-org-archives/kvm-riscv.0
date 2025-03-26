Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E295C36014
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4CiZeeW2zQdE8ju4t9iZFU7DT65h9Nt5GCRb6WoJno=; b=ElpBRbvNhqvrY2
	yca8jXtx7k3v5//5dqdFQWxwrrZd/TkP6QeKKug8IXFNhLqMGL1il8IrD77boa/n/cLJZLAwjvBbC
	FkGaaBaz4s83AKazgIWyQakPcJZz+AaazUIu6z5y1kqVg7HnpsEzMTBQkq5U+zHDOs3SVDYYbFd8l
	gflmVlnFHlIIoVLz4WtntVz48PPpgWTrR6XPhaNKkEA/ENSiha5iMNt7tu2q7oaN2/xPv26qJDxxp
	mlYa7SolvacH4U0+v2E1xA13+57FdMsHv2QEDZFIYQLuDjhZ/Z3S0QtTIadeTx4PVmHNSoKzJhvqp
	2W/VOnC1WhkAI4A0qhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKic-00000007iQx-149x;
	Wed, 26 Mar 2025 06:58:30 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhZ-00000007i6p-0VSN
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:26 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22403cbb47fso127991895ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972244; x=1743577044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+y2JzdWEw4KqciqhaDRSciMbrFvQAV33aM50nrXl4Y=;
        b=Q/1FNb114AqW/CH1zuLduN0txT0DSJaUdTLUOshvhlhy6EsMHkEippVjV3hwv6xxdV
         9EfsUin/rbBs0hQi15RzwYN76y84gIhj/kKz2kqToAgr0DADAs4OfJ665WJbbebWndfh
         PxGRgw8r0pxZ9TrsoGrhoKxcTc2HRdS9igTxLKjs3X5HNsdcuK4gkIqN3UBc0C7lHp/V
         FpAD8jTXnTqcoOmWDRwHTfTldxj1ol99bLuI1+jItfDihJOxuNCrN/XH+sPYi9pPXh7B
         ZxjgCLOFej5yEjEAEuDXLmmCpyARkGmgOPuNJ2568+6RFPTj9goTyifiLy/PH/boBX3I
         YdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972244; x=1743577044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+y2JzdWEw4KqciqhaDRSciMbrFvQAV33aM50nrXl4Y=;
        b=FvsGjG63R5BcjSdcVCYbQk1lRXVWMmS7tLFTJXUiAGcJxtGSjcRDMrPHoEjlY268HB
         FKk+XlLe71F9uk7EIzU0DRwkTr1JfSesNoMmJSshu+V+OBXEq7I++cEti+e7wznAXjXG
         ECqso3fIrx8n5Q0cN4u1qBcV0QN0g7tbom79sps+bTVuoQeoQW/UMJNzbumGCNQtJx5t
         QoqUbMb930gidXvJmKP2wM207fiPeS2vb7TexS94QYgQI6doYu8OskBQstl9EW+zYOLH
         kNE+Med7OgritU6ZOMi+GcOtdBv7876C1+QyDK2zh9uPvmTOdFNk5rkIU4Hptn3s8dQQ
         nwqw==
X-Forwarded-Encrypted: i=1; AJvYcCX4JTQ0pmn3IHxUt8+NSZOhlpHdhreNQFUD4LF8WCxMr9HGI9bsEPrG6ydjn4daq1LD6NpvNDk2UNQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeReS08ks+UThR2mNtgjTA85Gt4pt5Q8+rc+DLQb90ytHxEzm3
	tO6Dz87/zmc8ZQeEzuixXxrFAhT3O2FFCwBAipUej/Qghp80/8XkTjVHAY2rh+79rhMQsEspsKW
	j
X-Gm-Gg: ASbGncumaltfLF8CEbwrMJId4OTYTYy1dMSmtmWrhDBBeO21OxMAVoPWT0G2qoScvMi
	AHjE8aT7R74u7IZLKV+i8cgj8co0nVf61uV/wdQjJ5wAREUx+oCploGRjC5PJwjHFmG9Sn3L5qW
	sPuY79mFEXBdJ0mC2RztTQ6TFibZihQ4+inBMOcQpQujSeKKjQRdXr3NFJjZV5cYoWKs6UZXdyi
	ldcX34p3zUijdYR+kJ6z+1aUwHMEO73tn9EvOxluVGOv1DxwYmULBoq7L1XZpfkaJ9t1XgUliit
	wYIUVwPXGTQpfKO2K1jufP3rORawTVo6v1JpvQ6XDBpdw+j1gfJuud3XsmwomsbH1eHzY6l9+OC
	YQNte6A==
X-Google-Smtp-Source: AGHT+IG4tad9JTLYUplpx/9PnlhtklOxzyIFXcy12vg4T3cnDDVBdvzCYx2xw6xXdTRO+pMdvqoLHw==
X-Received: by 2002:a05:6a00:4648:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-739059809a1mr29800294b3a.10.1742972244084;
        Tue, 25 Mar 2025 23:57:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:23 -0700 (PDT)
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
Subject: [kvmtool PATCH 08/10] riscv: Include single-letter extensions in isa_info_arr[]
Date: Wed, 26 Mar 2025 12:26:42 +0530
Message-ID: <20250326065644.73765-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235725_158030_C14B2B8D 
X-CRM114-Status: GOOD (  10.80  )
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

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 138 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 76 insertions(+), 62 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 251821e..46efb47 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -12,71 +12,81 @@
 struct isa_ext_info {
 	const char *name;
 	unsigned long ext_id;
+	bool multi_letter;
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
+	/* single-letter */
+	{"a", KVM_RISCV_ISA_EXT_A, false},
+	{"c", KVM_RISCV_ISA_EXT_C, false},
+	{"d", KVM_RISCV_ISA_EXT_D, false},
+	{"f", KVM_RISCV_ISA_EXT_F, false},
+	{"h", KVM_RISCV_ISA_EXT_H, false},
+	{"i", KVM_RISCV_ISA_EXT_I, false},
+	{"m", KVM_RISCV_ISA_EXT_M, false},
+	{"v", KVM_RISCV_ISA_EXT_V, false},
+	/* multi-letter sorted alphabetically */
+	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM, true},
+	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN, true},
+	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA, true},
+	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF, true},
+	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM, true},
+	{"sstc", KVM_RISCV_ISA_EXT_SSTC, true},
+	{"svade", KVM_RISCV_ISA_EXT_SVADE, true},
+	{"svadu", KVM_RISCV_ISA_EXT_SVADU, true},
+	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL, true},
+	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT, true},
+	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT, true},
+	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC, true},
+	{"zabha", KVM_RISCV_ISA_EXT_ZABHA, true},
+	{"zacas", KVM_RISCV_ISA_EXT_ZACAS, true},
+	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS, true},
+	{"zba", KVM_RISCV_ISA_EXT_ZBA, true},
+	{"zbb", KVM_RISCV_ISA_EXT_ZBB, true},
+	{"zbc", KVM_RISCV_ISA_EXT_ZBC, true},
+	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB, true},
+	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC, true},
+	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX, true},
+	{"zbs", KVM_RISCV_ISA_EXT_ZBS, true},
+	{"zca", KVM_RISCV_ISA_EXT_ZCA, true},
+	{"zcb", KVM_RISCV_ISA_EXT_ZCB, true},
+	{"zcd", KVM_RISCV_ISA_EXT_ZCD, true},
+	{"zcf", KVM_RISCV_ISA_EXT_ZCF, true},
+	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP, true},
+	{"zfa", KVM_RISCV_ISA_EXT_ZFA, true},
+	{"zfh", KVM_RISCV_ISA_EXT_ZFH, true},
+	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN, true},
+	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM, true},
+	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ, true},
+	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE, true},
+	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR, true},
+	{"zicond", KVM_RISCV_ISA_EXT_ZICOND, true},
+	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR, true},
+	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI, true},
+	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL, true},
+	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE, true},
+	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM, true},
+	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP, true},
+	{"zknd", KVM_RISCV_ISA_EXT_ZKND, true},
+	{"zkne", KVM_RISCV_ISA_EXT_ZKNE, true},
+	{"zknh", KVM_RISCV_ISA_EXT_ZKNH, true},
+	{"zkr", KVM_RISCV_ISA_EXT_ZKR, true},
+	{"zksed", KVM_RISCV_ISA_EXT_ZKSED, true},
+	{"zksh", KVM_RISCV_ISA_EXT_ZKSH, true},
+	{"zkt", KVM_RISCV_ISA_EXT_ZKT, true},
+	{"ztso", KVM_RISCV_ISA_EXT_ZTSO, true},
+	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB, true},
+	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC, true},
+	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH, true},
+	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN, true},
+	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB, true},
+	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG, true},
+	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED, true},
+	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA, true},
+	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB, true},
+	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED, true},
+	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH, true},
+	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT, true},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
@@ -129,6 +139,10 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 		}
 
 		for (i = 0; i < arr_sz; i++) {
+			/* Skip single-letter extensions since these are taken care */
+			if (!isa_info_arr[i].multi_letter)
+				continue;
+
 			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
 			reg.addr = (unsigned long)&isa_ext_out;
 			if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
