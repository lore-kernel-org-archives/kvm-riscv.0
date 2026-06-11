Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39943CD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiWq2eiG3pynn6SMrB/F5qvuMcWvANcDZw/yUjJHJYE=; b=PChZfeLxf72cTe
	iFU4kqHM+RjYFuSXpvkkTQkiAuDLz5Ne3AESEpymaz5EsvZT/fS0kQd3HQgBL0egunS1Ca6DJosn6
	WVxgKoD2qHUS7P7Iq3nJlCbNg6AbDVKW7ERYyIS5HSe4K8ZouR0uc59nouk1dqp9mZ3bAuqjKdtRS
	lss22w1gwcm3+z8xd9rO7WGZ0vleG3HWahOkictcYRyYQXA1Lh7t42lKlFoWGQh2T2TdkMs8BXXPT
	2lsKXAmn2yR/5HJwyR0szfdMVdwMgHP4VW+Qw+k6E8cj4DGHSVZf4jV+cOGEoc4bESj49u+krMmKX
	+BxuCtOe0YD0sP9JbPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlns-0000000A1Zb-3wth;
	Thu, 11 Jun 2026 20:15:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnq-0000000A1Xy-3E89
	for kvm-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=; b=EQ2E+sfV7X0EbL5xJ8NSpLiMkT
	rmyD4VeG6/9ZLfq/CjOdN0WpvLknnWyRgta5eo6r71hB/KdvQ0jhLM/LDMJJu50jBVlTLRxZ9ciPc
	JVOzJ7Fp83LzkCU+VkJ3lPRF9rbUg1JdjQf0t2FfKmGzp0DllB+TkFPG7bH4UvXYgGA6y4gLpzZGM
	FtoRpgNbqlIsCmdOnUMCoYfn41ySjzdGqogx4IQgwdZhipURT7m0rmU/pAUUb2lk0o2IYneI2gio0
	CBgv7G904REv+ge0H7rGXgYsJr/OJqAFFPmZv1864bbGhEA49paQ+jku+dNHIq9y+3aph20qxBvTQ
	QL7kzdSg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnk-00000002WaT-2bML
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c3546924so1975855ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208894; x=1781813694; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=qL19Re3Aq2UlwjeWKNM1bSsnimeiSAUBosIawXq+1NO/6O54E49+E0I+0jc0fw3qGa
         GcwoL7nOBzvZ4G6R8Lq9NPo9/ZrliSGX55A/b3GGICb3Z+73dK06gMHCQ1OupokHDsTd
         X2tHjPbnj4+t+S/Sa8+RUwG5lVTuDtg8Hy6+KyPQA/lFWokm3YhGt28vq3K2vfBShWLB
         wNWpxmg8i4KFnC54xKG4guozX+y/FmCbdLwcfRyul+KvaZNTS+KbTT4psWTNtcaP/c30
         JZiG18mKMkHV9T2y+T94UAe2GyinXJUHUzOL8HH5jzBpir2sff4t0FbI7ndOuW23hLuQ
         P+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208894; x=1781813694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1EvRjKx0eOYE4LeiPY86wRBYHx+SwyyhRAbMXyCGdk8=;
        b=YyIoTrTKCsIYBJL8HJlUBHMycN/ZDlQcoP935+y2Gb8omLXwi3WGS7MuNrzdJZJ1TA
         Q7kgTQsOX9S70/5yeocGYrRBGIfjYre8ZVG6i/wHvGBHBedpZIovBcNMDA1rxZyr6X9q
         J36Y4lqHKuLOQ6V4HXnrks8w8/r9jrnT3/YRYwBcLtaf0IDaGvkPdd7zPwBOZ3elq13H
         Pd1nFFaI1xZ0nQrDO4Ki0JwQtmlK29ugkFOBIF7KJlxAALxl+em8Tv6xn6CpmWS7xgYL
         wXzCqr/OS4QE/OB4z1NiGSX3r4R8VFuW0cd4/rXfmQVDP6VuZa07qPjv86/Sq+NN/pTq
         72QQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7qkD50P49+iNiDfrNDHBMx9bCQtLfYjBacrqlAQW4PK8ehgdynPCAAq8qNuCHOqoRD2V3n6luaDY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdjFPXqMxWEYnorFxj2/eTUprzhrKbpc1vZElZQQW9klw17P5H
	EyjJscyC7nyb+NRNj93Yhk1UPcrtL/NkWSnyvpK+6N+/DukOp9xwdXnA
X-Gm-Gg: Acq92OGTGjPQlCq2HPkSQvZKeYfu58CBvjXxM+AyW5lRor3LBrXrtnxTZMOuV+HRbLO
	cFS0I/1cSANfo7sg3J5TqpKwnLxlQt6GIiUFJKK0+rudHDJNH+IWNUV0ruB0wkMxEfCOlFSVb8J
	WHwAIZABz8kL+/afA90ukvQVP0B5JgVAviD48R08NdwmMfQgQSeCG4ug3AvaBoFIrst9mpIH9Yv
	kBxdpw6bQLBcBV5EPAWqw2jAHImjlYo9jvyrEdZI8hIqL5NjsCfrycgHfUe6Xxat8Ssw2BFDmTZ
	LtWNWhDb/E8NkvEEiT4nawifqYpx/YLmJ99ckKy1yDNg+58nA2d6TGqDFc4E7z/H/V2acMmjNqT
	3aSM/ryDEKkLK49Hz/ZFtQJddvl2mH4Klw91dMoIyxmcMb+a7yv2VGJCQf4KvEzOaSKIZOHWlxg
	==
X-Received: by 2002:a17:902:e78b:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c2f092ad9dmr52178155ad.9.1781208894311;
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:54 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:50 -0400
Subject: [PATCH v4 13/16] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-13-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=aIDENBFY4Tz1hqn0W61EOefEH19QM+HExbm6+TQTBeI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscO7srcsmPNoumimeNn3glenWfu11coN68yXLxOYZ
 /5uzdfPHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjAReV6G/yUubxnmvF/+6MZL
 l8/SJWbvGHYUuhnHuDRumFUzqUhm+xuG/wlJztWWR8uzsl2qWjYVRu3cF/DJ6M3TP4cnOldPNJr
 zmx0A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211457_124844_6BE0AF62 
X-CRM114-Status: GOOD (  10.45  )
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
