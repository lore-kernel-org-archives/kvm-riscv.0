Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AACCAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6dQytLyfo06Jie2/9F4szBEYOkQvkG6QuHXt8liqvU=; b=EPmYGpmWdra/J2
	iYsV+G6cf5A981Ohdxk2bbUI+7gBsebRGe6rVFYGSkId9Fgn7pUJRZqgXusYvUjz8E0v56JNUu64r
	tfj+TjoHeoN7V8XH6rZQwpP3ilBIK36XsfzEzIxtSk5qkeJdNSLmwqoHAm6Aq2s/fe4uUAu7coJjO
	zhUMIA2nLR619VI1SyM39tmP3GKX3LUN2X2+El0tANVFdG5BrXxMdlWfzIJwP07G7VQsISmlfrfWE
	f4lBO13EVOKxgkwX0PA0fz87TNO1mCFPbIgTL/lTIipLkEEy5aZnNpinPKlvfJXeLpBTOw+tPPf21
	uE31dH3I8SsBLIQdVkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVge-000000025JF-1Inx;
	Fri, 19 Sep 2025 07:37:44 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVga-000000025GU-1wZ1
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:37:42 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso1418494a12.3
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267460; x=1758872260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=e3E5Ea44CdbqH6cTdcvvj6YZialnfHulI2eGVT6y+vOcEv8jBTF0YYRpU2FWKYm3Nq
         mrPZvA/1LxdIZixsh3/4XyjzRnbQxhlqZOMjwxh0illJWtzKV6/VnwzhQv0u0PJ3+Gqf
         iOQ2ib0C6/+gtYYju6jQECyf0e4CAK3UlvJ+NkfStSSK0NDHWUw99P0QRZtCaL5nBvjT
         VcfD5FCnECbxw3D3Y5bhoGVbXeQEfO+pzIN9WIm2/Q07NSXbC8mifsShLu/wV4Z+LXAR
         aT8u4ceE7FUYbEBzUCJqYZYHPcjokbTvv8SLjDoiGuL9AjPwZXDej+KHbju9jZJ4/ofB
         07RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267460; x=1758872260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=JO4yr6Pfk4KWOWMZ1+tBqsBZcXbJ/bi/imflRjd8ZTfoGj9SjjAL6yWKRCrcvSY8pt
         1c22OiTthnZjiNVL5/O/tnS3ijXUU2jm9gnjPjftXZq1fO9TqS7h+iOXGWooI+4zBb5Y
         m+P3PMXHPvItwZ71mG1GImfVkoRUsfdYcQam3k1M/qvjBkKfW3FaTGYafrRSXsBHcW2B
         BHvfnjnvnSWoIWnaOkmwKxdm2NDDJXAbtN7QYCw2cW+5DDe6pMY9E0ZVdUhThkO9ph0Y
         AQLEXMtq+F7ryErn10n2nHO0wvcV8s1UZPArPDYNDLhHv7FHUighgtYfFPHTccsMP0h0
         XjnA==
X-Forwarded-Encrypted: i=1; AJvYcCUANsMBEc7PFtfOmFDLAj3rSx4D4H2I1RbTCd6VmmPqaxkMnIFIMh5W0T/cgEruc5/MYqfJvE0N+6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdZMU5XLE0DFVS8agt3ybP1JSeY9MYd3ahzn8bXVgOSj2ZRseH
	gkdq+olUoc9jR+Q4urALh0XPT0EehYdYsWmlAQ+4/dULXVV5BJbKpQfQnZ6ML/17mhI=
X-Gm-Gg: ASbGnctJ9L12iir5V3u9TlCuxt76Ajk9HJ27s3mbLTQNfOYsIuqPn/Lrx8/td3ys4NV
	s9bhlrMMuFLgq7/SpIRqhagKGruELWHIpaWHw8Ey4BD80JOdxOo13jSMG4YGmy6vmp5hPsjKXt2
	SM/tRp3iiTottB1Q9JSWhCt8pu6ndPj95dzJava2jQjWecIvl978p3iQ7VqRKe8lDfiVi5bclZK
	U+cambfAiGfxvPmwcTTrECBKqAANhQAcioWVrZThElcF1tZpWmi69K/HiV91O0RhhiPhrSChkzt
	+AL3YIzNzP4C8nZhd2Nl6TJI94P66aNNssNQwvVg/pAiBR/y/1WyFiQcS+Fd1x10H+4jHCij8mt
	qiq4ouEVmop4AkbES3jZKJ1SPWLV1emaaJb2cPMMzYK9lbS4pn3He7KypxevOoo6jGqshc9jGYY
	/Qyg9cGzxKyNvqv2sx8XJ5j2j9+dGHQPkPibXSExKPZw==
X-Google-Smtp-Source: AGHT+IGqA40UuZYCJLJHFfbOR75YQDLCIeiJK76C6SxyMFnU0ZZChhSlvmZdfbgczrzCrLP8RN4dig==
X-Received: by 2002:a17:90a:dfcf:b0:32e:9a0b:1d1 with SMTP id 98e67ed59e1d1-33097fed9a6mr2718272a91.9.1758267459588;
        Fri, 19 Sep 2025 00:37:39 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:39 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 1/8] riscv: add ISA extension parsing for Zalasr
Date: Fri, 19 Sep 2025 15:37:07 +0800
Message-ID: <20250919073714.83063-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003740_506362_D633C155 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
