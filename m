Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB693CD37BE
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTYruj2ePIiMoP8lgw/6PNTg9ftQOXL4XVF8XPsRLuU=; b=awda6OFUdxn/Mq
	GZpv5d6rnQvE/d6wFH4dn4oikHxl52x2Hpi72/2EL7zNyRmLNJrbV0ib53nDGc4lXVx+EBClpTxlV
	RlViI2qztB0P/eXvCnn20CqucJoW2iBfUvQbD7yzmu/uKi1B16OSV3abx51VKvCFFG2sYEWcnF2Fl
	UWyqfvz2De9SRgvI0scKpB7Xc23+Jnaw22nC6sJHwlT+D1R++4NpZ8yeXUExKQlZO9XiLujRTTqjm
	Ik46WQf9of2UOrP+KiRvwRzjcSArjZvepPrJqWSiMITtUBIzxbWJz/aHd6fDYERx8oKcgmTv+KgNh
	RqEksa3Kv8EHe+8sUNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQp4-0000000DmBV-0in9;
	Mon, 11 May 2026 13:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQp1-0000000Dm9P-2YMr
	for kvm-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 13:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=; b=Tc2jbDtZh7MaDIbNgcVSDLjR11
	7R27OR2L26+PyKKJk5x86IEjFii7OyT33/kaMEZPqDSP5GbrCk/W399n0zhNzTnwenBWvuqr3/5vp
	xmtwkt4soFOYBPIxmZhuyhec9m/A0brloXkL1wr828BzXUgUXMLE8BUiGhzsxeymldwrveGZJ32SI
	5a5iGgbv9BsgAvTVgNJf8yltRH/Y/viCpapy0jZDqe/v7RfnAqfbNW13KZas4XnOvK4799GWt9LBT
	03ShOWLr+x+L5eKaoEACSdVQ0sABoxeWwUtx1py4LRqaq4nqWyfFl3lNE1JR3THzlKJamgIGkSsqU
	OZ3ay45w==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQou-0000000BonH-1crV
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:21 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3660b84347dso2641436a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506634; x=1779111434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=eYfzlrNlgfNxq6z0pDczyNH5s3t3O1xeN8J5bunI6IPwburBTXkdcxKDWQzqhMBdy7
         pKRDKrrxdR9HD4j0qfNHnCHwJlPRpjsNNgsWQVbnB3PuMw2HC4mA33Ez4z4QsXk3tMf2
         Zn4tC6NLSlulUz57KF+Euj+JuznIs6MnUrxXf9VSs8FXbQpCTB/7wkItw092u4vlKKUd
         XnfaqAFVj3Dj95JMLyEi/60U34H0nnOLVUe6J06i8Xd3Vbv7fgSDMO3m6tzg4FYB5I5B
         yXF2mOBz9SgglrqkkJkTn1PmRzn1DiuoB6obGxRRZY+lx+gKRltmFTr2pQeRrZr88R+j
         YmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506634; x=1779111434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sYXDquoWtzp7On2yMHA53cV/UG4j8k4cYWaJ5BWxi74=;
        b=GdHKHoGCJff/2Lc1yMC0l4/YEIzY6q+YhY/SUv4Njwuh2xPcG47+Y4piORumjhOBRG
         C1E24Hv383cNPDukMDtU5aiU/+6dmkGGI0lA6lekDLVeZPAaxxCtBHhos9oIAcx+j9mO
         R0U/f0zo71k+/xFlfyOXjKDrGyqEJ0qI/BtZpTiKGs20xc8CIL6uBwEjLdcI8Gpk4Xqc
         epRhdm/BqMAfNpA68JreVG6ly/ax2zZGe2gSikCcy6WJLsQRRpe1jIXCWc0AWVAGnq4f
         KCGqbZUuYaZO779X5yajjejAoYhXyu0reoQGKD7T5uMy4IZmWQju0NG5b7TDkxAhbzfH
         hdgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ai65TEgGgzMMSchmaAtINfyQZ5rRDHkK5NUGHw/kd7YF1VMvdvlUFudF/FkwmJgV/kwIZfEz93Ik=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6Vgf7JURhtwN1DH/GP3SCmggA+NXM1e1puimD1qTXewmSIZ7
	e77vR8S5F9+3kE/oMxEQTMYYn5EMTBf91/bEfgXYljjZctf4p3QBb5ImG3PtvkVvQhM=
X-Gm-Gg: Acq92OFpxaKnxKkoddUC0QbJUiWBw8m/MvIXs5KLsbYlAPXtJNVf9eSA+N/tJTI9pRY
	XgyIQiujhwMQv9Wctym7V6Jg3C1fPNUD6iTTyxnAg3DW0dsXo3KfhgsBhWyhGxu4C47CddQRxpm
	hTtI5VRWGRktHaBOoIKBK/JwePpCFZdmjR4Rnmflz/Lo9Vp7x43gl2/RglYSj4jNACL70pJ61QD
	4Vr+jwIyRKktP1dIwY5aGsH0ZS1+j5Jrqnv0XZw6XeAZD2iuVkADVz7lXzW3U1px6qAGQXUZaZD
	YHsN6JNBvfnmd+63tr8JSxPurmf30U2bXG6QvLqowsWb/J3l5mYqT3e7yWENEQfhcFdmGEpVYjJ
	YmOuQYk715kMC8H4QDvYN19mkN46AUjFEraN8iQdflYcOEvn+vlKWKHLqMNdWwkZdHaTKZYBLwn
	POk+Cskkm7tP8WEFLpwaNw6vT8HtVeEVf95Pmbys2xOUg=
X-Received: by 2002:a17:90b:2d90:b0:367:bc89:546e with SMTP id 98e67ed59e1d1-367bc89550emr12198051a91.12.1778506633829;
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:13 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:52 -0400
Subject: [PATCH v2 07/10] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-7-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_143719_578480_8FAC1A6A 
X-CRM114-Status: GOOD (  10.01  )
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
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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
