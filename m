Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5EFC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP9CbF9xc8Q1vtMjpo6zKca4uGUu3yARcsks14xOIUU=; b=JwGIRTNEsQ7IBP
	K1dvDl+6fyMavT4L1cGSke3k7MgT8uPgSMm49WzqznTkqhLebKmU3rNcUYswlJQhXMBypUPqm8OU+
	fXkyzQfhR8cIaevozgGZFyBnAhLbJrsLOW9AkIN0xq6D+O+8wkFn1akRRIFyOD2aq+8iVKkzhAZrZ
	cPCep1UvVrBeNQQCiYmjhKkAqVXzfOYr5qAuWni56O/dxvXFKT4K2hfFfKK4Zeo+2gE+zAEvhzpiS
	TeqiEC1FpPLVeGsWHFOwvEzMNfiMwx5cDaTJiOa/MsG7RmQZQNQa1ma751kleFlLzrj9SL34SzlFD
	+59Kqko7i0kmgFCWwqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSy-000000024Ut-4BAp;
	Wed, 01 Jul 2026 12:55:01 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSw-000000024Sl-2PHJ
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84794e800f4so307758b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910498; x=1783515298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4itvwgmIkfoT47xsL7nDKqH8kqk6Z6HU3EjYTAF58M=;
        b=RIdfPk/UCeaiRWZ9MP90I6/F02dDzHJjBy4Hn60pVFrAkS3ybu3hJ5N09GPl6jLdHZ
         peLoJ8IQPxhNyAjgIfl4daC41LiAPbbr/vXc/eASAURRGi8Mr1/wxQFoAU2S+cxaUQeo
         hAB/a0wsYJmBqrpwVNcHYWOfUVpDMY/cOpfXHD2Oy/LWGMsdprJXMRxpHsFvVtGr+lML
         4siVgyh/h7duFUHvMhfGn7ltg0F+LgmsvDKGPj3+Z2Y/Zd5jXmMKrBF2V2EX6HruXhHs
         XmThnEV/o8fhJ6k86iLir+KbBUfpJZGdvpd4g7Mai91v3pLipGuVyjGL3lQNdwHZpHa8
         fh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910498; x=1783515298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F4itvwgmIkfoT47xsL7nDKqH8kqk6Z6HU3EjYTAF58M=;
        b=Cwrsr/VlA3d9lZ2/XF8g6alk2kG3iesko+OaR+DmRkhBcI5N3j3K9T7Oe4q4hsl5mc
         sjczqSaen8Ood4pauUxXeJ0Mi79m/LjAf0eYc972dg2Jp4RoZCWT7nuGuWb/p1MpZ+tv
         6BCtTuHfD3o/2rSgQGFXTPMo6GPqTCPlUubA1alrSSlUfAHRE7zOitnJaWz6MtaDrrr6
         AeMQDTvV8LDEQg0P9/8BOelzeYtYt+EHjNYWzzW/RbRTZ0lig0oPlxaBwzmwKG8fDy4z
         qLbCn/TTKq5ExbHtnCTxmFCwBZg2Q8/om8TaAk9ZeHPJ0ndyV9HaR+nF85lzTjw1bVOi
         5FDw==
X-Forwarded-Encrypted: i=1; AFNElJ81HFneRgypgdxJEoduZ6YnMi3EIeoRNVOt+VmCeAiAUwdLnrJzfW8XYuP00YXvSyHQKj/QFxA5lDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRbWP/V3v35Vfxrhggxe9cDv4xfjF7jSwxB5JJ5PXFhCq+bydL
	+b4Ng6MbABKEpwEgyXrUkc62V/F2n8dhGwrElmHsB+w3sZ2iWVzf9Dkk
X-Gm-Gg: AfdE7cnfRK2DtVR6sORBxwANsLUCN6Zb3V662tFJrAvyBkTz/LhCda5t9gWTdehUUQ+
	BrQ+tEmGpxdtvHuF87mjY1P4xAxnf/gDiroXS+39TjbZJ7X6c4DiixfNMAGOMsHZZuZrJB9Lue2
	GLmGu9dNg2moc2QUHKMH8IgKrC9k4zAu52QzTYDQ+/iEbgiVoOevQ3dUShG3eFeINnyzgJV1rbl
	S6qAydk6ALeYu2lIM5FyuGhKRx5pEc/VuPcukUkozX1dpMgzIhFGZMQH7D+4yemQEmZG+3GP8Zg
	RSF+Z36qcTnBQrjc36dsN+tYoEQ0EvCLVEPSmPPGAKfwrplgky4qFzDv36VD7Lnqtqs/XxBxDPJ
	hOvRQelMwfTD11OKDbCmWg9RPOUqwTTsY3ZMtPFpPcyRkqgvOSeoBWbFyZeDMZwwiQ7MpENEuuo
	+nr0VVenio7Bk6IGWHtyt9
X-Received: by 2002:a05:6a00:44c6:b0:845:e105:1e6c with SMTP id d2e1a72fcca58-847c5235e15mr557323b3a.62.1782910497562;
        Wed, 01 Jul 2026 05:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:27 -0400
Subject: [PATCH v5 14/17] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-14-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=LaS0cxSQXBgyR01xQr5M6KNsO7HDlsJSbaq9hq8ofFM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3jaJs1we53hUJftu3dk5Y52sfn0Xg+vbEK7Om/tuL
 zAvnjqpo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZizMjIcGpvd2B4wjVF7TIX
 h1/fvitwee95mTC3Iqiy4+QF5p0ycxj+aTkoSGYs+z1b+51NUvTHg/+rd8dNWbVvxirV3Wy6Yma
 ZDAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055458_625887_B03DCEE7 
X-CRM114-Status: GOOD (  11.09  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
