Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6CBCD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kA5QqqSeCk8qZ+F46Wr13VO+EJzri4YuziNVl6dRi8=; b=miehjqh3sqIUKg
	oLBd6FbFpVBJr0J4RcKVJEO7bpGX5CMxFwYGBHnQ9jiWTUWymQrUwX3ZtgUFudl00oKffVP7SzIaI
	/ZzeZ/lXEYvPDcm9xxjwsNHZSbbO54ftXfXyFbSvEpGJlDbE38bePLX0N9eW+Se6/pLCzng6SxpkV
	Nikl04lwgbD9LM9g0A2G2c8+YhGUgKmUYUxvjO3FkJf1oEPoArvktmfUZeofh7sichVMUxcmG21yg
	tkDXbQw4MGaanCsOtwUjVtQr7EddVLgEdCgdLu3n0SXeqJ5vegqpdxSvHgwNEsQ103wXbiGX61gZ3
	/l9+SwvDIXPqwzcFfYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloG-0000000A1nN-2uN9;
	Thu, 11 Jun 2026 20:15:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloF-0000000A1li-1eQH
	for kvm-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=; b=W/a7ToFUQOxB2we7lWbCVvx7dR
	XDSj33TDiVgscuRg+NXd92pDBHKmdTIA8wmVgYbeU4YH+qCupuSqdcdMAksYF/pAQm71ddg9WBniK
	EZfEG8Q48d0G071eLN1DUduft1I9i5JJ7ERUF+cu8dnicwuGZwSUvcnyDYfEwMAC55/C36+4oZj04
	s2PdC3INdWJjReDDNNDY1Nm8fqL75dWHoVAgKvTt1P/Wy9rTRSAjM3kaKXQRM6fPH83k1IGzxutog
	ZV6SDj9fEKI8FwscX4fMQ8/d/QL77YvzFBt/BX9nNOHKyCAY+kKynjLSsVsxWzzGVPDD3GtYl92Z/
	EgaiRxzA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXlo1-00000005dpG-0SrN
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c2da7fa321so1288395ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208911; x=1781813711; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=qwotzUe1YlAPhGtZnwQkArJ92X0WtgquuEgJyhTpCqPqzxglxutM0fjYOemhuUsfdD
         QHByjRMkwJOHGHZsN42sELIXQg1CA1W8n2YkuXUNuNTKIVHokNw9847I/9SL9QJx/9kI
         0g/aMS0IGJ/Y/XJCHktf184X3q+P/R4JLrGYhjZAGz2VL1qi3JoHUPQVDsgptaLcnOiJ
         Scearjk9y0Kj4O6srGwsuM4toBcje4PKMnwoW+svnha01X+gwJTFzVPNPYife2jQfaFO
         z0iITRyX/yRbJkOxKk+13+6usrAam6+2JzBmgG8Z8XU1wbR+qk8JJVUkfQprMQ1LchMW
         1kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208911; x=1781813711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m265EV302HRo7Gs5HUB3XDJdYi9da1UqwB9AyAJDJRw=;
        b=L+hbXneRfpSeYyEofdo0ntzjh9C4JNWMlc7BphmmdrZ8ftiTawPeGocKuFvxqJJrRo
         9lAtCMbJU/LAnd8d6kU7mKM0HMmZjdOBXBKYCrjJ8ixwttOsDJG2Icugom8rEvL0qbLb
         +96gqE+yB07HJ9h2aXxp66eXcTHb+SIMCpud/Lr6lg1yF1LKaC6Lv4WLSxoefSRRUq3G
         9YigizeIJrPQTpnk7wH6hgdvKS668HSOh0Q//XN9nPHqZ5cVRJ6S7suaSm5CjB5vL+1k
         WwzRgDWGRXU/TS43Bz44uEIM9FBRsgvjE0Dn6O7cSfjcvzGNym/pqUYV8wO0YguLT0EC
         iqAg==
X-Forwarded-Encrypted: i=1; AFNElJ/hBbbtaL9kptqloAjlKHoT3MZS1AGB+NQjhi7Z7nHJIDriy2nTJ/oF7c++AF3en3rnU33YkwggHzE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4jToUoACQ/Zx2TWUT6FPkmQENjz90oKduq2gZ+uqzhg/lOPf
	q7MZRwkvN55srr2bDG2HxbXDv+yzHzxZMi6gAlgnWWIYURXzXhFLwllU
X-Gm-Gg: Acq92OHIuXMLvVX9WDfp9CLy6xaAEKj9MQ3Ouce4wUjEUtRmtVfpr9irUEB1o4/oRx7
	qfgnkkuADo+c+c4esEiNUxYnDKLbucrQURhnG6tOQflvVHilWJvO6tR3YJPXgo9Yc1KBT0rdjgP
	kKH4p416q1h3ZLnGwSXpP52geSRViBmQJ0iqhDBXtTN0Dh53yugIiFjZHzyHEaZD/CmnYua4+55
	pf1VMllz1Y0CotZ9g8QDSgUJq8qpxjrxK0d6+qOjligte9pHYG0U7UX06BiQIc7qLhA2TRCsguK
	NIXRbxLK0k/oR8FO4UrJfOS4bcHEa9gSV/bO/KnY0ImcqzgQrDlwpGwGo+dIZRIb+3YsCVq8rGH
	XaWxG2XrfSAqds6O4zvqvVxvy4IaGBy9thlxvJoKobvBBm7bCckIFoNuxRsJPl1NmBm+RUv/lkw
	==
X-Received: by 2002:a17:902:ebc6:b0:2c0:c940:dc1e with SMTP id d9443c01a7336-2c2f2c64838mr48032165ad.20.1781208911134;
        Thu, 11 Jun 2026 13:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:52 -0400
Subject: [PATCH v4 15/16] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-15-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=6uRwmcArNmpcYHUxfVzJ1KUTNe7nDEt3Iouczp4pFJc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtscP8W/I7a44KTu7eNGUm/x/V9O7U55x9jvfX8IaI1
 ssc8jHtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIloMTD8T3wWVc9/4Hm9Y7yr
 eVbGq8q1TtuvXvyga7K41THqj6TMdYb/nt9nPzbeIJA1uXnNe+Wgo6cy8mddueVw6fH5C27BBTP
 2cwAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211519_073139_9685E323 
X-CRM114-Status: GOOD (  12.64  )
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

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
