Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1BCC369D5
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNQ11nxSEu0nD6B+CzAv4u71JpbIP9G5DtYX6RPy5J0=; b=C7eBWI1An5ZJsL
	qiMi6ib6cUb2DYcvSGUWu64ZlqG80gusasWLUFnfRYlfz0n5ZYZQs7TS6ePV05/8Dn2mVm08EHlcu
	YwbwlVkZZ1fSxNaYG98Xe1XUk/ZqHfz+7rW5wtEllfkdTLuucHr/e7F6nt74jbODje+OEWTAppAUw
	MCt7Cix0NgTKelKmwdEOpLfoB9/g9iWNajLXbRYkfpTrHNcpBVjVY9gB6BLgbAikGheRBZqQbUM4B
	XAGYTc9/ZRYH2S7ef2WbQcUJ4Ozly36BW4WAuxxEsHPPE18bd95Odog+EubGKARLwd0r/HLwOwLFa
	bt7Go2DA61xlL5Inh2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6x-0000000EfrC-2OM4;
	Thu, 24 Apr 2025 16:07:39 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yZK-0000000EVOU-0tqL
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so2088224b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508774; x=1746113574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5rgWea79y8XM1Rmre4RzXC+CKYfWGoladFiChG1Ddo=;
        b=bzLNNBQIvZmQeIMiwCgs39IHWEMjgznZ5hJFcn4ho8SkCXM4ej78e79/dqJRMzbXyr
         M2KdkfXiVqjKwhw+ROCQc7CihxM1jECRxF8Pp2yThiMKlFXxfA1rmwD70rrkAOXCM6X0
         ZFqDc/NV6xEd1fb5WxB7TNn8CEff7B6JdLt9d7kezYNIX7gsjRcTcyS/bK8kdgjg6HZn
         pzRgTb6Sfixd7biGJJP258oFbK0o/YrQARILTPn0nBdNVnxGDz6DJs37FFf6Xod9FDKb
         vHee5OsOEpznRwgMWybQx63zNgR3NdWb0wW3AURIlQcL52qgorYSUYgQoQmKCmGA2AVl
         +rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508774; x=1746113574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5rgWea79y8XM1Rmre4RzXC+CKYfWGoladFiChG1Ddo=;
        b=WLAl8D15MTtEMcAmt99mWmOgz5mTLT0LQYYtnJMvXfwyUvvv0PP8tLKxmVbYVPYIKa
         8WfVkfClyUmMXu5bmMgAJsBuO2kkXPWv9tELbj3UCMCiKO1gbutV93HTIac9ai8wk63M
         fcYrlYOS5B44GDDG7jDHGz0V90ACvsMBmRozhqvLeX8vhOFDw7tR9050RANUBlJ+G87n
         u3G6e7dvq+Yu8+BgdcLAh26zNnTAlqb3N0nVDC/gee0nFNoO+FYyxfU8GJhnEKzWClGX
         OgW1qsuxDeld+bTQj3LIi8e+KMJ5MP7ymFq86ueKM8bBjXFl5Y/868RLi2Ky891hEMSM
         HC5A==
X-Forwarded-Encrypted: i=1; AJvYcCUNzyGPDT1x/LZyFBqfo9rt9eLzmFQgEF/UfQl493+hcIBaSXchlB5ty6Q+EXluQD6MdFpVnbSlSUg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4mYZ5YBp2vOKSuxH3lSQoP5ekyItXpL6a0fjGhl+AdM0r/n4M
	RMZyOwCbhlA1TKH4O6pyv5/BzU2yjquDWzfWSh67zFevUqu84/x3cquI4EzcphA=
X-Gm-Gg: ASbGncvkSUXlZQ949uK08Z4C3+bPFq4sBQrZeLHhGzOQImLrggq3fLW/8zgN6yAkMTM
	8FdiJ+cUXf/SRymU/vnanxPbhHLBYWoy5+bRZigORCHlXUykKMYSZDHQSooN+NyTlo1BEeImchq
	GCTYnOlMEEjKI1c9JZuVdjN5MLqMhTxgVjQnXNbfpY6MAwAntkwON//5xel8fLbeegaP4vH5Bs5
	HcxRGv3OTTO/OLKlNlf7jY2w/oj7hHXr5loulaGQJ24uAlJvTuDm6rL5IAgHfSD674yXCsqu9ys
	SNeps3hyRCscF9FyGkx++L8LjHpcH+jvJfKoRlSMPIT4i0rMAc26h31B10WEhxLfzoESBqYV6nP
	O/jc8
X-Google-Smtp-Source: AGHT+IFUEL3cvBn3Xa+5y9+6Ep9PHHPOhZ073kDTv8bDaXeS7TN4XiGHlAG6LN6mhNJpmz9BKqz+rA==
X-Received: by 2002:a05:6a20:6f9c:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-20445d26bb9mr3931698637.2.1745508773521;
        Thu, 24 Apr 2025 08:32:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:53 -0700 (PDT)
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
Subject: [kvmtool PATCH v2 10/10] riscv: Allow including extensions in the min CPU type using command-line
Date: Thu, 24 Apr 2025 21:01:59 +0530
Message-ID: <20250424153159.289441-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083254_250049_AAF69544 
X-CRM114-Status: GOOD (  14.17  )
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
 riscv/fdt.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 5d9b9bf..722493a 100644
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
@@ -128,15 +142,38 @@ bool riscv__isa_extension_disabled(struct kvm *kvm, unsigned long isa_ext_id)
 int riscv__cpu_type_parser(const struct option *opt, const char *arg, int unset)
 {
 	struct kvm *kvm = opt->ptr;
+	const char *str, *nstr;
+	int len;
 
-	if ((strncmp(arg, "min", 3) && strncmp(arg, "max", 3)) || strlen(arg) != 3)
+	if ((strncmp(arg, "min", 3) || strlen(arg) < 3) &&
+	    (strncmp(arg, "max", 3) || strlen(arg) != 3))
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
