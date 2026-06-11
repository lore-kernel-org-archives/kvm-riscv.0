Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4F2CD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SABMxpfQQ0BZ224l4YGJSFg+GuzpcMovO5kiN0H9KR8=; b=j9NauLnJgKuc2/
	hf+IY9IbhvWZ3RkwLqz0sFZGtMPro7CRFMXdpqvATLhKQhtrOH2dKUos4DKl4fi5FKpK8A4vKXTCQ
	/iKdwCLUb0VbxrhhURH4aI5gQqFLmPGeDN4UGvglDeSy93SChM9JPMkDrz0XzPGpe2c/x8ln87Zzd
	x6xAnwYTGLI+E8yjPb2WVz7u2PiRF50ZeF91LxMuNYRZ1TndJI6C3ItKVX7CXeOeaT0LbX3TaTtRb
	j4jl5rkNZyaezWxHyEIBjmiIa6NDmdIIKDKqxm/xTip1a5frILyr3Kv1oB4GYj+pu76ruxTDNmFxh
	x7BXt+F8hvvmkEJ8IY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnq-0000000A1YI-3Z5E;
	Thu, 11 Jun 2026 20:15:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnp-0000000A1Xi-3uMl
	for kvm-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pQPaDs7uB5pYxgJxz/Gbo/xGRUToQ7J9cge40D5BMIM=; b=GRltGyc1Zz3vmOTuCinsM0SU6Z
	KaqZbVs8TylUWs7HdI7SI5ZVcOhBJMVAXwdJ/+76PXb84O/hBeqB+phqzH3Kc8/byYzGP+GEUU8T0
	lQLn6XhncrxZFr3EKJkeTpglLJmbSlE4uymjc/erFIxpW0rTyQp741LD/Ph7Koks3wq8q+0rO/t/s
	71nXhkH5u+ifnrwA0Ym/a9a0uI6C41xYCJ5D0e/SSRsp6Le5I5cjoxL1AzE7J5XzUSS2/NhfV3o7b
	emldfPyR2VVgPimJjku1vQVpF4NoZvaxpIugkE425iasxenOWUzrs+isjXimyGHmWz+IoA06D+/fB
	diHuLnVA==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlnc-00000002WZY-0jqs
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-36b903567fdso388691a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208885; x=1781813685; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQPaDs7uB5pYxgJxz/Gbo/xGRUToQ7J9cge40D5BMIM=;
        b=YXYVxiSXI6SQINCeZ/k0hyaE2TnOB5I3siUv+n+wvrUf64+lOXqiyrj4DzsdEDZsNd
         1J11Dwd1emSzW7aFI3//v5LIVQjTSW9WbAH7mwmp85oq3sbsD1YKFCbjsbuKOOJO4rLD
         2t3JPlhHB43cQHrgUMCTg85+hTNuEl7VVEszUXMlHp+uIi253g+Cj72tl5BGEMDoQf7f
         +KoI2YdTsqn6Tf1Fs+/bya3izdROvvqirWNnJub28y04PqlVgXMAr+wUUzkdZcPTVXWz
         wg0pnBHijGH+3o9fMSN/c8LSYgV0I5FjDjdQNl7aNShMuOWXBDTbHpPNdoAJut6kKeVP
         CUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208885; x=1781813685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQPaDs7uB5pYxgJxz/Gbo/xGRUToQ7J9cge40D5BMIM=;
        b=Poo4eIENuwPPaUL/2EZG+w/QomHVgQFgl19NncMzMpeUrQGTOidh8ht+wZQfNR1Szg
         IbOeqTl0NfsWUCRetTl04IOZ5+bEd91x4/aSY/HEFgrMGZ7RptGfABHmT8GC9CbJnij9
         5bib01BwuDbvqZ9ndHj2yETSsp4A5CSUgnq6UtF3YRuEOzFFTLQh5c9D8strSVwWMOKC
         KGnD3myHYzu9lMBlPC8vmV/aVAII4WnsK5KAKIonxZOcunO6hFUaGSLqqciC35h8BWUL
         KHTHF8Rf63GJfrWKZHnWMYuWNgc83kiFQnF7OImy0MFfb4ZszbmEdO8aaIMUDuXViaXE
         Jz8w==
X-Forwarded-Encrypted: i=1; AFNElJ8lQhSqlRKTG473dTTtRP3qzivQNl9pNJyjj3lAH6G1ZmhVNty7Vbw7kTzWYpH+6tTbhogUSukXHQU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnZtX3S8iLWwv2GcEF3VdBev27ExJEsdzpt7+1NpoFr80+zNbY
	JDuozybwdGMpxImGZzXdJMHhd0zOmD0ybmNwgk5gUxU51RlgjZ4kj//y
X-Gm-Gg: Acq92OFszop/0A04GM7lsLa+3SRA/9pw1j2aa7ZWDS1nFLdHClDPXG0H2ZZyE5ptKjy
	e6pTIDAtDiWnJKhLAsfO/2FO0jmAZpPkayzpXD2VF9fbGh/9UdEtsDngv6RmtqNAUnyq8Bbvu4o
	9IFiz8kjY6k/79YlkF2LhzTU+IQ4UvS4nnjSbZ5ptCfvf3NwbFmnSDrSgtq9cKCS7dtqYUsvqyh
	95waGXno4Eq8QlVyASjUAaobxhqPp1syIJaEgIwKR7PFHhBVjhdhT1Hk6ItC69oLin61VSuMBt6
	hvVcY5s8K8AOiIVdHyR1SAwfRSOAyyh5jTFfDHY6i8mEOgV5yrG50Yr3vLha+0zXF1qZY0v6lxu
	glhcXuMwRY9KnY0EjV6wBnnbHNtXOpP1xwG964ro8p2VaODuX39Cc5E5R6+KC/TpjZj5vhgzJxA
	==
X-Received: by 2002:a17:903:2c0c:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2c2f1eba128mr47043605ad.23.1781208885467;
        Thu, 11 Jun 2026 13:14:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:45 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:49 -0400
Subject: [PATCH v4 12/16] riscv: dts: sophgo: sg2044: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-12-3f01a2449488@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=28751; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=e0n4Kew3KJiH7q4iX52gpyX9JAhyZfYP+kX31XockuI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscNXvdyixZZtrmc69PHmNfPdBhfe+u5L9LbdvtPOw
 q9tip1ORykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAExkWhojwyzRiukf0n//ufbP
 bLZ0jFLgzsdnzf6frTi5XvuLR/TJoCcM/6tMu/68bC02TGUx+iSolhxU8Lm3N3P1DvfGaY6zLi0
 o5AYA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211448_691913_AAD6405C 
X-CRM114-Status: UNSURE (   7.02  )
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

The SG2044 cores have 64-byte cache blocks, described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b.  Declare it in
each core's riscv,isa-extensions.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Acked-by: Inochi Amaoto <inochiama@gmail.com>
---
v4: Add Inochi Amaoto's Acked-by.
v3: New patch.
---
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++++++--------------
 1 file changed, 64 insertions(+), 64 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
index 3135409c21492..2ac4a41bbc3a7 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
@@ -31,7 +31,7 @@ cpu0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -67,7 +67,7 @@ cpu1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -103,7 +103,7 @@ cpu2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -139,7 +139,7 @@ cpu3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -175,7 +175,7 @@ cpu4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -211,7 +211,7 @@ cpu5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -247,7 +247,7 @@ cpu6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -283,7 +283,7 @@ cpu7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -319,7 +319,7 @@ cpu8: cpu@8 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -355,7 +355,7 @@ cpu9: cpu@9 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -391,7 +391,7 @@ cpu10: cpu@10 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -427,7 +427,7 @@ cpu11: cpu@11 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -463,7 +463,7 @@ cpu12: cpu@12 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -499,7 +499,7 @@ cpu13: cpu@13 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -535,7 +535,7 @@ cpu14: cpu@14 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -571,7 +571,7 @@ cpu15: cpu@15 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -607,7 +607,7 @@ cpu16: cpu@16 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -643,7 +643,7 @@ cpu17: cpu@17 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -679,7 +679,7 @@ cpu18: cpu@18 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -715,7 +715,7 @@ cpu19: cpu@19 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -751,7 +751,7 @@ cpu20: cpu@20 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -787,7 +787,7 @@ cpu21: cpu@21 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -823,7 +823,7 @@ cpu22: cpu@22 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -859,7 +859,7 @@ cpu23: cpu@23 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -895,7 +895,7 @@ cpu24: cpu@24 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -931,7 +931,7 @@ cpu25: cpu@25 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -967,7 +967,7 @@ cpu26: cpu@26 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1003,7 +1003,7 @@ cpu27: cpu@27 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1039,7 +1039,7 @@ cpu28: cpu@28 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1075,7 +1075,7 @@ cpu29: cpu@29 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1111,7 +1111,7 @@ cpu30: cpu@30 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1147,7 +1147,7 @@ cpu31: cpu@31 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1183,7 +1183,7 @@ cpu32: cpu@32 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1219,7 +1219,7 @@ cpu33: cpu@33 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1255,7 +1255,7 @@ cpu34: cpu@34 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1291,7 +1291,7 @@ cpu35: cpu@35 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1327,7 +1327,7 @@ cpu36: cpu@36 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1363,7 +1363,7 @@ cpu37: cpu@37 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1399,7 +1399,7 @@ cpu38: cpu@38 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1435,7 +1435,7 @@ cpu39: cpu@39 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1471,7 +1471,7 @@ cpu40: cpu@40 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1507,7 +1507,7 @@ cpu41: cpu@41 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1543,7 +1543,7 @@ cpu42: cpu@42 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1579,7 +1579,7 @@ cpu43: cpu@43 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1615,7 +1615,7 @@ cpu44: cpu@44 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1651,7 +1651,7 @@ cpu45: cpu@45 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1687,7 +1687,7 @@ cpu46: cpu@46 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1723,7 +1723,7 @@ cpu47: cpu@47 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1759,7 +1759,7 @@ cpu48: cpu@48 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1795,7 +1795,7 @@ cpu49: cpu@49 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1831,7 +1831,7 @@ cpu50: cpu@50 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1867,7 +1867,7 @@ cpu51: cpu@51 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1903,7 +1903,7 @@ cpu52: cpu@52 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1939,7 +1939,7 @@ cpu53: cpu@53 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -1975,7 +1975,7 @@ cpu54: cpu@54 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2011,7 +2011,7 @@ cpu55: cpu@55 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2047,7 +2047,7 @@ cpu56: cpu@56 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2083,7 +2083,7 @@ cpu57: cpu@57 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2119,7 +2119,7 @@ cpu58: cpu@58 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2155,7 +2155,7 @@ cpu59: cpu@59 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2191,7 +2191,7 @@ cpu60: cpu@60 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2227,7 +2227,7 @@ cpu61: cpu@61 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2263,7 +2263,7 @@ cpu62: cpu@62 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",
@@ -2299,7 +2299,7 @@ cpu63: cpu@63 {
 					       "svinval", "svnapot", "svpbmt",
 					       "zawrs", "zba", "zbb", "zbc",
 					       "zbs", "zca", "zcb", "zcd",
-					       "zfa", "zfbfmin", "zfh", "zfhmin",
+					       "zfa", "zfbfmin", "zfh", "zfhmin", "zic64b",
 					       "zicbom", "zicbop", "zicboz", "ziccrse",
 					       "zicntr", "zicond","zicsr", "zifencei",
 					       "zihintntl", "zihintpause", "zihpm",

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
