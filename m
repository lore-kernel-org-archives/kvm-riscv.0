Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0425C53219
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRrQT0Gd6eStyC814NI10+XtVo0E2EK7HZtQ25kkfII=; b=iqHjH3gEnEq3eT
	TjZGbA1owjwmRjVuNdmMsJHhCJsKLGcNO75N2IhEdztDyTKAeoCeG915DPBDg5RIsb8f8RZB5uFY3
	SvxDS65Znih0Q10khTTMD4Tjs7BS4aP8SOvexVTS6zOb7vwYGZkgOLBBaR4sUmtnnWK65JpPT/qWz
	X0xjSlvd/JYt5iQwrbO7zK74wTIf/yxW3/a29aG+bgLC4wsrauffL9xiGOrecjNcXjwq0r3i+i9di
	sGMUA83+xbc92yl8+5PPxonVRZ7XOSuFQ8ivWLTcTMT8uwvl9q6HmtgJAlAKzubueIDDg+dPOQK6H
	vNCJ2UZauFgqgPO/yoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTs-00000002i49-205K;
	Mon, 27 Jul 2026 12:30:52 +0000
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKTp-00000002i2J-3eFl
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 12:30:50 +0000
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc7a345f51so22142255ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jul 2026 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785155449; x=1785760249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8pTPbeEWjqJ3+0nUuuuXn5xR6k5GcUeJgsv7M+Os0c=;
        b=sU4c849ZN7IHPJzlJ32uq5ogzBNmpvrsZz4m3Z+3lceX+pbXjqk11sOUl9IcKdKZpt
         2v8j7Oep+o7Ef+gVmY66XPfbO2rFQp/pnX/w8jeVh9kgW0rTqd/y/uWp7cpqBJFkqqA1
         w5XN4H3M4frhhqIk+FtfeYh7pijTIC3+ZE+dyHDYWMWEI0gRvpE6ZM/hQqjtV2LIs8tH
         CRANJTSjDBbZWv7M4UYSs30KECDNVbCGukUzMQyKwNMkjdJq//je595qxagx4lo5aDCK
         NqceiJ1bi8WGgYPDVXKItxYp34QnXci4k2qHThnPYf17671u45faUaGM1Wr9J6JUCAf6
         ENpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785155449; x=1785760249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8pTPbeEWjqJ3+0nUuuuXn5xR6k5GcUeJgsv7M+Os0c=;
        b=nA860Dm5w72j6SVD0jey7Ue4BI6SfoPFNekkmLE3gr6N+9UZVXhkAT6xQUOVl1Kog8
         IjpZZeykq9BGwGE6r000a9vuLkdSbW3c+qUeAkfQlUvSQMWTRfR/Y0nojiUY0Bf4afV6
         4YA3NK1IiKgEBWFP11EUp1a2KHZHKwpAm+Iww/Y764EUd/94bGXgWFHhzby/J+DPuaDl
         l5lThVdVfw3zlm8IktbxTt/EiN5FP5TJd0u22UxSExQ+zHP0TwGjGEOAGe75kCXb7J0c
         jbXBh4uy7Y/UrRVvbHTN8IuwF/faRTT9gg/SEldvBmHyndG/v3p97Zlhi2VxL0iDvlh4
         DLPg==
X-Forwarded-Encrypted: i=1; AHgh+Rq5WIQmXJcsXIRgho5rTE/F2TzPZgRGH09wnjFCyw5elzBsSAfxqiUQJYPDTUnW20bDSpMCXIULXME=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7yFSvGzJXzBEMTwWOel965/9/Lq4zlTN3bFgji3ehpEE9RWu8
	lgd0AIAeVM4iBad9WS7CqvOqEaEWtjw7B/gG8zqicYJaCoy+GV1i3vqg
X-Gm-Gg: AR+sD13b5CnKkp3YqrUP3kpvft0V0Miif6BU6KUXFpBN2DdSKXY5oEJ7xLnWFcw2PTE
	D888tiaQJgLyQMGu9e8ypkf1eqRLC3ylTtVU1JE2gyRgdAZ31gzqpAXBP9mFxtnSZCv4EE0zWRa
	q11BsQPz8SaQWg04hudABj1o3rL5DtCvaRq6baIcuQmzK8jVzeMBJrIzaQ8Xr8Hhan+V+xMxrzc
	ky1dQlRXaOv41u+fwRSFA88FjzdDDW4GcwNuHs5yPgWROPE01t3+xBrcb4rnMfzULv+t9kOifai
	juXHvm/1ePc07X6fA/RiVhwWZ2SgoP2feYn4ol6YGWAEurXsJp7rQVkrhIlUwD0srKd8peeZO4r
	WUOqy0GsuuiIt4C+68OiC4K8pbQ8z81bgSG+7/hFWqDXFwwkz8m02NL3b+OM60DSisljTkDk=
X-Received: by 2002:a17:903:468c:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2cfde7b3a14mr78013425ad.14.1785155445847;
        Mon, 27 Jul 2026 05:30:45 -0700 (PDT)
Received: from wud.. ([218.194.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfe1ab9c71sm30679775ad.73.2026.07.27.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:30:45 -0700 (PDT)
From: "Dylan.Wu" <fredwudi0305@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: alex@ghiti.fr,
	atish.patra@linux.dev,
	zhouquan@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dylan.Wu" <fredwudi0305@gmail.com>
Subject: [PATCH v2 2/3] riscv: ptdump: Use per-level attribute bits for parsing
Date: Mon, 27 Jul 2026 08:30:12 -0400
Message-Id: <20260727123013.118984-3-fredwudi0305@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727123013.118984-1-fredwudi0305@gmail.com>
References: <20260727123013.118984-1-fredwudi0305@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_053049_911889_C4A36397 
X-CRM114-Status: GOOD (  18.33  )
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

Instead of using the global pte_bits array in dump_prot(), use the
per-level bits and num from the associated pg_level entry passed via
ptdump_pg_state. This makes the attribute parsing logic fully driven by
the per-level configuration, which allows KVM (and other future users)
to plug in their own set of protection bits for their pagetable levels.

Rename the local pg_level[] array to kernel_pg_levels[] to avoid
shadowing the pg_level pointer in struct ptdump_pg_state.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dylan.Wu <fredwudi0305@gmail.com>
---
 arch/riscv/include/asm/ptdump.h |  1 +
 arch/riscv/mm/ptdump.c          | 48 +++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/include/asm/ptdump.h b/arch/riscv/include/asm/ptdump.h
index eb9d11dab..14a262bd0 100644
--- a/arch/riscv/include/asm/ptdump.h
+++ b/arch/riscv/include/asm/ptdump.h
@@ -28,6 +28,7 @@ struct ptdump_pg_state {
 	struct seq_file *seq;
 	const struct addr_marker *marker;
 	unsigned long start_address;
+	const struct ptdump_pg_level *pg_level;
 	unsigned long start_pa;
 	unsigned long last_pa;
 	int level;
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 63655a9c8..06c0217f0 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -152,46 +152,58 @@ static const struct ptdump_prot_bits pte_bits[] = {
 	}
 };
 
-static struct ptdump_pg_level pg_level[] = {
+static struct ptdump_pg_level kernel_pg_levels[] = {
 	{ /* pgd */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = "PGD",
 	}, { /* p4d */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 4) ? "P4D" : "PGD",
 	}, { /* pud */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 3) ? "PUD" : "PGD",
 	}, { /* pmd */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = (CONFIG_PGTABLE_LEVELS > 2) ? "PMD" : "PGD",
 	}, { /* pte */
+		.bits = pte_bits,
+		.num = ARRAY_SIZE(pte_bits),
 		.name = "PTE",
 	},
 };
 
 static void dump_prot(struct ptdump_pg_state *st)
 {
+	const struct ptdump_pg_level *lvl = &st->pg_level[st->level];
+	const struct ptdump_prot_bits *bits = lvl->bits;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(pte_bits); i++) {
+	for (i = 0; i < lvl->num; i++) {
 		char s[7];
 		unsigned long val;
 
-		val = st->current_prot & pte_bits[i].mask;
+		val = st->current_prot & bits[i].mask;
 		if (val) {
-			if (pte_bits[i].mask == _PAGE_SOFT)
-				snprintf(s, sizeof(s), pte_bits[i].set, val >> 8);
+			if (bits[i].mask == _PAGE_SOFT)
+				snprintf(s, sizeof(s), bits[i].set, val >> 8);
 #ifdef CONFIG_64BIT
-			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
+			else if (bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "NC");
+					snprintf(s, sizeof(s), bits[i].set, "NC");
 				else if (val == _PAGE_IO_SVPBMT)
-					snprintf(s, sizeof(s), pte_bits[i].set, "IO");
+					snprintf(s, sizeof(s), bits[i].set, "IO");
 				else
-					snprintf(s, sizeof(s), pte_bits[i].set, "??");
+					snprintf(s, sizeof(s), bits[i].set, "??");
 			}
 #endif
 			else
-				strscpy(s, pte_bits[i].set);
+				strscpy(s, bits[i].set);
 		} else {
-			strscpy(s, pte_bits[i].clear);
+			strscpy(s, bits[i].clear);
 		}
 
 		pt_dump_seq_printf(st->seq, " %s", s);
@@ -221,7 +233,7 @@ static void dump_addr(struct ptdump_pg_state *st, unsigned long addr)
 	}
 
 	pt_dump_seq_printf(st->seq, "%9lu%c %s", delta, *unit,
-			   pg_level[st->level].name);
+			   kernel_pg_levels[st->level].name);
 }
 
 static void note_prot_wx(struct ptdump_pg_state *st, unsigned long addr)
@@ -247,7 +259,7 @@ void note_page(struct ptdump_state *pt_st, unsigned long addr,
 	u64 prot = 0;
 
 	if (level >= 0)
-		prot = val & pg_level[level].mask;
+		prot = val & kernel_pg_levels[level].mask;
 
 	if (st->level == -1) {
 		st->level = level;
@@ -320,6 +332,7 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 		.seq = s,
 		.marker = pinfo->markers,
 		.level = -1,
+		.pg_level = kernel_pg_levels,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
 			.note_page_pmd = note_page_pmd,
@@ -346,6 +359,7 @@ bool ptdump_check_wx(void)
 			{-1, NULL},
 		},
 		.level = -1,
+		.pg_level = kernel_pg_levels,
 		.check_wx = true,
 		.ptdump = {
 			.note_page_pte = note_page_pte,
@@ -410,12 +424,12 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
-	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
-	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+	kernel_pg_levels[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	kernel_pg_levels[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
 
-	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
+	for (i = 0; i < ARRAY_SIZE(kernel_pg_levels); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
-			pg_level[i].mask |= pte_bits[j].mask;
+			kernel_pg_levels[i].mask |= pte_bits[j].mask;
 
 	debugfs_create_file("kernel_page_tables", 0400, NULL, &kernel_ptd_info,
 			    &ptdump_fops);
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
