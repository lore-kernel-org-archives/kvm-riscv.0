Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B333C369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjp8OzK9hCLCg9FR3T4HIVptz1Le8PHxryMkVXTdljw=; b=Xkg/4uEGF7iQVS
	+NJza2/HooSXJ80+KSvl4BPBjqn8n0hqZ1JJzunwgRV0GKi7zW5wgjW7Pm3nIG2U3JgNnKfbnXaJq
	HrjVIQ5IQPhTR0T64VOdvqmIMbhYQvm6vECBwQwPOzSlatIbWIeEYXtpCc5BEMwtlkaxLt+bqEQ9n
	q3Pf964e1irPY+WAQI9yg+YmBiMaPURJsVX7W6cLVIlLN4Tmp6evCAGbYoAFsrusZB7crpS5hDelF
	5s+/N/vlkRZpeIoxca/rse3sV3daFzz2/eXIClHLBfnJG2tJa+CxTzfhRvr36QclwTsKddR/tQvVV
	3xcMCCQ++5v6p2gmnd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKx-00000001uBJ-47sJ;
	Sat, 26 Apr 2025 11:04:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKv-00000001u9b-3xF1
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:47 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22435603572so37146295ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665485; x=1746270285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V40WzE6Kx2dhNRCs8XzWAC2em3IawzSsYuCzNJ6Nkfo=;
        b=B50utmLWXk4NlbB7+Yqydy84GEJJ7JiAgveLMVN5Y0YCkwNkXhNEbPEqypUtUQagI+
         M0H+6ZE+vNr60w/W2xY2ygZAj/9RFp8Wz54uJMqfZhkyH+asHV0a1dIO+FpJu9K5WbmT
         4Gs/zg+XI8PXBEtrmbWP8sQT6Dln8E4cPPk2Iyufdbm/6+Ord+ot9Si3DHBunqTuILqn
         /F2aNW0uTR8/JGtlq/ghr0z4KHOq8PDBNOWF7XJoFg4k/FOyJZFCio4tMiN5qrg/2cGj
         2OCRRhTZN83woW8hCeAKkeOqmDw72FgmdNohCKV5lytx1TVOZTsBx57s6YMBdSjbFt7M
         gwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665485; x=1746270285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V40WzE6Kx2dhNRCs8XzWAC2em3IawzSsYuCzNJ6Nkfo=;
        b=cvpojPZASCd+YhCBlXQDfAVjsv1Cp+5mKsEIXMNxRA4wbn48bghPngTSvHmyEr6MCh
         acZGotLzAVueZj6MyFuUkFT4jsBrlgeuTltIvUzBilxycOVGzUKUaQ/zRSGrEc5JoIjq
         yYC373Y4W6qcW6y5wTvqVeM+O8U41FAj1jQwOKqr7OB4VNVGlSQmy7Nf7ImjFV7QDAVM
         abMrWOjDxRvMcjkb3Bh7GL/f1YxJ/YP1tbH4JssDtqgyQtl2DPcelJFJLv9Pa72KyNF3
         kBc5bXDT/dbkWDu29lwB+fwsBSdDUNmUbMWYR9X0V8afTYIpCBcYYBBW7yfd62QXPRS3
         khhw==
X-Forwarded-Encrypted: i=1; AJvYcCWx1JgctFZIBj5yUtdIG1rNC2s3hPt9BRm+04PeatR3T6GZge/+m/hjEUKB4HDA+uwdohpN0Xf4CAs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlgTOU8LHQ7maxtil93hRrafEcnDvUxydSu4pyE02IGZnUWdyC
	wptbEyRXgDT/+R4/Vs5H/gjYpNGOfTDQEFq8QLV37PwMJ8EyrIlN8PCvsSuHSH4=
X-Gm-Gg: ASbGncseCfM86fuFWtH8IKe8d4FlzlXkGOvqAmbpNFgPSuefULUj92hNH4cUc+9syG8
	qlw2TPABl9sT64/CpkdGNsNA7/L5V1mFOUXg4Y0S6v/mZk8kvBYfYFARecR0XGl2hTplCtwD+bK
	JmMa/oKL9P2zh72oKJi4dG+MWFSLWEvinohF17TD9e/9t3RTD65vdx5SpCQizPvm0R8/GnJFVhO
	EnHO+I/gRrFX+FFqtjrmrXo6Nzek9ROv5FdUeGb/uTexghR8E75ZWy8YFYcaCXUJ9zdCuJ0pBAH
	O3jjKDFTXLcTZfMfRj1Ha4wK3yYfOJUk28JAda/7agD5Cv7j30+KGjTxwS/7qLaStGdCIDI7wNN
	U/508
X-Google-Smtp-Source: AGHT+IFhfibcfS/FIRj5KH+yFHw8fRjuopSQjWjkxth0IJofxdk0cqXcNQ+Jd1oAYGO+GJArJf0DJg==
X-Received: by 2002:a17:903:3d04:b0:223:4816:3e9e with SMTP id d9443c01a7336-22dbf5eb6f6mr72855205ad.13.1745665484937;
        Sat, 26 Apr 2025 04:04:44 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:44 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 10/10] riscv: Allow including extensions in the min CPU type using command-line
Date: Sat, 26 Apr 2025 16:33:47 +0530
Message-ID: <20250426110348.338114-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040445_980281_0443C3A8 
X-CRM114-Status: GOOD (  14.19  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c | 42 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index abb6557..eba9387 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -108,6 +108,20 @@ static bool __isa_ext_warn_disable_failure(struct kvm *kvm, struct isa_ext_info
 	return true;
 }
 
+static void __min_enable(const char *ext, size_t ext_len)
+{
+	struct isa_ext_info *info;
+	unsigned long i;
+
+	for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
+		info = &isa_info_arr[i];
+		if (strlen(info->name) != ext_len)
+			continue;
+		if (!strncmp(ext, info->name, ext_len))
+			info->min_enabled = true;
+	}
+}
+
 bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
 {
 	struct isa_ext_info *info = NULL;
@@ -128,15 +142,37 @@ bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
 int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
 {
 	struct kvm *kvm = opt->ptr;
+	const char *str, *nstr;
+	int len;
 
-	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
+	if (strncmp(arg, "min", 3) && (strncmp(arg, "max", 3) || strlen(arg) != 3))
 		die("Invalid CPU type %s\n", arg);
 
-	if (!strcmp(arg, "max"))
+	if (!strcmp(arg, "max")) {
 		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MAX;
-	else
+	} else {
 		kvm->cfg.arch.cpu_type = RISCV__CPU_TYPE_MIN;
 
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
+				__min_enable(str, len);
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
