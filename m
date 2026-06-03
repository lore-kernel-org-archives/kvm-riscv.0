Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4255BCD5BD1
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WSz5N4P5TSBoRp0XT6FIjiFwp584PUAiQJL7a9/6Rs=; b=DSvGeCVbjCQ6hy
	D8tmJ3+ffC34LRfApQnwI3Wiukzj6OUcujImJJ73pMKTvYEQm98rwFFymfAF/IOBHC9mPiQlnNafP
	g01eUXn+s+yXKGm7S/lpRAvad0Xz+dhQX8nNR8yb4SHIDR18t9egrIQgjIU6OvmR8keeayPd0R3dy
	K7E8pPGiCe0GRULjBsTGQN3ogF3587GPSVTi3Da9+Br/atOFG83t3PyQu4PHjV2tV5SDjCQNqQk0k
	hDI5FMmOl9VAxKyvJXLCDapIibH7yCxWqMhwbFYdlOrzP1KPWTkfs51oQgMKZAwyDZGyeJtyZF/W6
	y4RtUkmxii617qgi2Arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKJ-0000000DwHq-03CV;
	Tue, 02 Jun 2026 23:15:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKH-0000000DwGZ-0qHe
	for kvm-riscv@bombadil.infradead.org;
	Tue, 02 Jun 2026 23:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=; b=QwZ2kGfs9UWgIUCyhLcHbHygz1
	tCFQUEKwRg9r1UKdvdKaTLAEBD9/xYUpYEqBR+GLGTOVklJWSO9NH6tocGcOcJWG1zA4Yb8HFan6g
	GrL1L86a90ach/Q7YHJOjvP87LBrPEiU//0gvkYp+8dJCNwXHa7uNvJGKjJriW9juJAO6YpmuBhZ1
	Bhx14Uqa66sL3LY9jSj7ZeerkBdCd+lmpvSLn4Pp+jgXlE6B2KhcszzarrwT0ftkru6xshp+tBF3G
	XDIS+WQ9WrWCzCB3z2PbZUVDfklzc27N6DkmRoF2YIiJ8qhrzi3n28RmCFro4tgdveRjSVPdN6btx
	P6PVmVSg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUYK5-0000000Afny-31qE
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:15:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0a5354da1so593685ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442100; x=1781046900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=PelFHTuM++P5boBUlME5Qok4sD8t0LvsmbfxM/8ePOaO5+41EUbSp0T/TNzcIrJ8NE
         FE5iaZPvsGzHyn5oqVoUnF5jAf95vXkdCzOQ7fFIX3qFZ7WYurm0dIDI0sIeuxYz1u3t
         pjRwd2AP53tNmBqULKic5ospM9FkbJsPl2E2gG7kOgygpJaGTh//egk607X2RpMbUkVV
         MK7XeO1w9n3G4kENjwgwyI+WdZfnBlQhxA0CxdqQPV7qxlIRMZ81MI9sbcovSoUPhbks
         amizXYL0dc299WdM1J1moRJyH8sZbaHgd/f/4GxOURd5teo1bK7YVu9jtdIr1OuPUA6W
         jsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442100; x=1781046900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7boHfA/wFrzsz1sM7I2UAXGjLvkEYWGhZgOkDT/r/jQ=;
        b=lUqCzi4pQNFXdyCbohtKECJN3Pn175z5ux8EA1deQsQEvDkxcNo1wEb1yFKWilV30S
         j2EbHLAtKZYukjHf1PGYd3wzIH73KB3pgt6dL3YVXChg5hA+5y7tLiXkNi8Bp/6g1GZl
         b/Dev5PARahiOHSTQRQvha9eiUHaFIhKFQZrdwRNqsXKhxHB0y968oX0zsxsMeFAw6/+
         /td0Zvg/UE/XRxzLNAdP4jAWXWSUEv/KkcbMbSW+b1jNg56AJXg5nwiSmYBazcWjFjAZ
         BLx2sBFZUPlZ35uGiks7dY7iuITIzpWdoc/+2tY2w4TBQqj7UctZYP/NNoToJRy/MSCw
         +VaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zC4Eb2ezltXYZjXFrMiiD6OZ4hpTDfUOXBbG+vHIjEl5zR+md+K1KKxyHfhK47CdJXP/cgNRLDMs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr6eo8mlKjlzNgO3d2rr+s4+QUFjnUB4yqtwqrt0SrDI1jlXeE
	Vv0Kk2dnf1iF7YSI0VyAOoNkRU6dDBoRZAVz0n68w3kqmBJAAOqVopWHIDLnid0IyvWqGQ==
X-Gm-Gg: Acq92OG1vakZ9gst1IPvYe7lUfoMKxEl35flqIwsoa0wBdCxZmTR7A143RYDmnQ2KVN
	/zxwPdAkj17nLSB4onJeYckiTEJ67g9NMSsRpMpWdNYX/k94id3VRNdwM7GNiiBgMjj1qL3lUmB
	UmRWhEehMrXVRQ7oM1OZJV+aK5qZe8qz4dLA0WdOATXa4YyGpgUrvyrMFcNaLGBKRO3w3t8eJbY
	/7lMiQpivR33x/N5xD75wmIBWQBuoxMnG66NbWdle3NfbiRf//L6yMzERYz0DFs0Rf24CIwMWSl
	XrGCL3NwtxNKzusxx3uXl40TLCghC1EDcK/sIn/0O/cq9GM8mvytLEj3VJCuwe3IahlWXdzNLbY
	gx3wbJOTm0mI49LoNeZE2G9/kE5nXYIXDhq5MPMbeLYkb1KijC4Zux+zOdn72DlUPtiH6As7Xg+
	3qC8BTRuCRmA==
X-Received: by 2002:a17:903:37ce:b0:2c0:d29b:34ff with SMTP id d9443c01a7336-2c1646eaeacmr5471065ad.10.1780442099816;
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:59 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:07 -0400
Subject: [PATCH v3 12/15] riscv: Add a getter for user PMLEN support
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-12-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1911; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=EL8rlxjtR8czox+vDhBwL1idMRjEpfUrJqNmOC0hv58=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHrZY9+q9B3v8ZK6p7otLtTvI4VC+6oT7t0uLhDc13
 /XllYvtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIm4SzEyzDZ3u9ASoOlvfSuw
 pOCJRaxy6cHlb+Zqq85+p/fB6qJvGyPD/E0qV+YFOtwqmPx9rvh/8bKo3NgHqXcrN6WX3/cPMJn
 PCwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001507_559983_8CD5DDE0 
X-CRM114-Status: GOOD (  10.96  )
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
