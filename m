Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C03C36018
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrSW1UcbLrHjW7ePXAXFrWcexJjojgLRsHlKwzFkd9Q=; b=DW8VgSNBo+lrMa
	5o5NW3/v/nuT5NTpLlGbwRWIULirxlkLXJl7v+SkSLqbeFm1V+vnZewIxqGiuvXKI2AdgvFBOBMkD
	qvCwZcNJ131tqk3wySl0kImZV5h93Wg9u7vxd6AVSWt4ok4ovGUNswOqBob6BH3P3dOi2UYU8Y7i2
	I1aLwbT6+IT5GKI+KES56xGjZC1n7yqY5Wv5FUptdy+jX8hww/EA7jukk4Rl0FXQBR43cNpYGotE8
	zmDOZZNK7X9SUcz43VbUU3oOEj4fbxNWbRm1hFLsFTB93Vm/o/sOcu8AyqP4kA6htkMjeNXHB4N5i
	HyzW1L/bynGQ74o7ptPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKid-00000007iSb-0Z8W;
	Wed, 26 Mar 2025 06:58:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhg-00000007i8z-0PSF
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:33 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-223fd89d036so133093615ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972251; x=1743577051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9MJWtrq1qUp0l6b4wtZQ9cCEUjd4ODyd9V5DXVU6+M=;
        b=NTOkv7V7btaB7/tlyCEZqc2B/B0XN7YqfoD1eMy+IKsg/CmQ65DJfuSIGYvuffhpz4
         cZswhTtYJoPvfJKc1x7dQphgcaHvPxAPnb/JtE5X6PActq2J6mvsliBL7wxGyliEpNR9
         Zl4OitHYTySiqTuuvwT8uRNCO/HY0cdu8k0GGVTMV5XvbTj4to6k/Pm6sXuJspr5y6ps
         n8tCMQcAWwzhWRL5zX+MfJx8ETEO8VdaSo+vHSwKOj6sYTYrtxYiKnNqmKbiAywBIZeH
         7LwcAOAviZT+Xcxt3opZZvNTdy+WXTGrzgBYQ1cRaPzcPRWyo6/QkAwt3zmo0LnjqucO
         pg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972251; x=1743577051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9MJWtrq1qUp0l6b4wtZQ9cCEUjd4ODyd9V5DXVU6+M=;
        b=gvV/tuJyhVYb76aZ9in1F5zv8HGVTDPy34hy2twX719H1JwFTJJQhHAu794O8c6njb
         F6Ig3EJHzHLRGLiFnAyeXHgnZltMfUYdfNPtw+Rc3fDAQpoHfa6rj0vy2oviPq4u4kCx
         iL+Ut7XsvNvJ+8JcMKWfGadQowjebLa6Pw+r9Q8Lz1VPl96/NGI6qj2cPgqLkhkCnB0I
         rrGvvu+Migomq+lRGw5ReyiFE4j2VesV3Q4asyIbFPrQGj/rvWbCYLFEJDyWSB9BFJbW
         t+4ojwAA5QPTo74Jzvp0eF58vH0HwgaEAZVwK3qOzV9Z45KNrFtVfywCFYCUzwCkBJrM
         jCzw==
X-Forwarded-Encrypted: i=1; AJvYcCXMdp6HfnTFogZClalRLyTX1yhj9zmYDUv84UiEQQZG4GbbB6isFmRZ5R9PoImujeYVop6INukt4S4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFNuiRu5oRFyUvuGhvcHXrQOuyZg6aklYxgZ52IVzQP+Q578B2
	rrIoFCnnchmV2aYlHIVvx/EGSEyW4T+Z1Dwwv7M+i4OAg20qRn0SplPeMFbcJ/s=
X-Gm-Gg: ASbGnctEJ/mKjYzk2EP/PreL61hUyBpSrHpsxT/bbJqAZUCKw7vS7IRUYRwaA2mHGx0
	XFeHDjPSXaR2eb4egHerCyRjjC3iH3Nv+TH+SFWqDo+M6EUoHvHAH1yBRRzklB3RCBs4YVbJrmO
	xL68vcBBw8kFdU6w1/5/0/FYXWY3UOtPprdjvXxdIn6gG0zFwrSMlMwrqoQ4zLMnVBJSd2AI9pI
	oX84VwQPZhi1w7L9sZ7YTBTZt4LNmS88r2xidecn71rpmBEqah8qktDW6c+yrPsv23AUmtqlTL9
	oqszQr1t2/wrTF6cyHN+7bUkJwkFDItUMNcWiWATz1564qLUFuw5vpNS8gI5UABRGd3f0UZUy+X
	kBhgPyQ==
X-Google-Smtp-Source: AGHT+IHtVn85K2rMf1ncp6GOXVZX1zpl6C8lQ1pT3KexM1a5pSygx2xZpYwD5GQcLRPUNLPXhZQIyQ==
X-Received: by 2002:aa7:9317:0:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-7390596685bmr36416962b3a.8.1742972251101;
        Tue, 25 Mar 2025 23:57:31 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:30 -0700 (PDT)
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
Subject: [kvmtool PATCH 10/10] riscv: Allow including extensions in the min CPU type using command-line
Date: Wed, 26 Mar 2025 12:26:44 +0530
Message-ID: <20250326065644.73765-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235732_135954_82C777D2 
X-CRM114-Status: GOOD (  14.34  )
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

It is useful to allow including extensions in the min CPU type on need
basis via command-line. To achieve this, parse extension names as comma
separated values appended to the "min" CPU type using command-line.

For example, to include Sstc and Ssaia in the min CPU type use
"--cpu-type min,sstc,ssaia" command-line option.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 4c018c8..9cefd2f 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -108,6 +108,20 @@ static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info
 	return true;
 }
 
+static void __min_cpu_include(const char *ext, size_t ext_len)
+{
+	struct isa_ext_info *info;
+	unsigned long i;
+
+	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
+		info = &isa_info_arr[i];
+		if (strlen(info->name) != ext_len)
+			continue;
+		if (!strncmp(ext, info->name, ext_len))
+			info->min_cpu_included = true;
+	}
+}
+
 bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
 {
 	struct isa_ext_info *info = NULL;
@@ -128,16 +142,39 @@ bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
 int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
 {
 	struct kvm *kvm = opt->ptr;
+	const char *str, *nstr;
+	int len;
 
-	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
+	if ((strncmp(arg, "min", 3) || strlen(arg) < 3) &&
+	    (strncmp(arg, "max", 3) || strlen(arg) != 3))
 		die("Invalid CPU type %s\n", arg);
 
 	if (!strncmp(arg, "max", 3))
 		kvm->cfg.arch.cpu_type = "max";
 
-	if (!strncmp(arg, "min", 3))
+	if (!strncmp(arg, "min", 3)) {
 		kvm->cfg.arch.cpu_type = "min";
 
+		str = arg;
+		str += 3;
+		while (*str) {
+			if (*str == ',') {
+				str++;
+				continue;
+			}
+
+			nstr = strchr(str, ',');
+			if (!nstr)
+				nstr = str + strlen(str);
+
+			len = nstr - str;
+			if (len) {
+				__min_cpu_include(str, len);
+				str += len;
+			}
+		}
+	}
+
 	return 0;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
