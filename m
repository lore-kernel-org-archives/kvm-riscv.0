Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98A2C282C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgE0o8Hg9moytzQgLWkp/QHWgpI1QtZ77JUoZdsZyck=; b=dmN37fTUTW0pjS
	tQD5VVwg9knLanGEDjKbXJc1AhdQHuKC1NqodW+hO6q4xmHJtxIrZ5B+bpKY0W/oXMV/JcjaRTk7+
	7xYCIysGQVzTVKpTzingHNw9sIBFrRaZsQCZFr9uyvj8I0ZLtAWWSZWi+cgtHe93U4chBFt48VfQP
	ZLypHPH4UV7d+Xb0sz8L/7HNgVrC+VqCylSs7/+d5AEHzy2iGz/pKM8yVpxSAEctckGqPd1K/hokM
	p67rmf1vGB4FDc4eOXTECzUfOISofMfKd72BKcV0ZEWKZ57XLp2q/hm45zku1H3Y45e9ae+L+vidq
	a83hrgBhwpu4Dnno9ACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6e-00000007nMA-1mwQ;
	Thu, 27 Feb 2025 14:43:20 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnekH-00000007hKg-0ig8
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:20:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740666010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slI1JUB/UvUbPN5Rstuovemtpi0TAKTYiJh7X8a99sU=;
	b=lRLylN22HJJLnrnET1wiAR97CYFer4zagpdrfp3VGtgMAm6LAIDd09QDq916PUPkOMC/tE
	tCnK5rd8bxjxR5mACfnzw3AgFRjD2EBZ5BP/CWTTT9do0JojfPqvsddhMEzfkeB+06zRnR
	cvoL3iuRoK/cZd3IredOH80/EaoP74o=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 07/11] lib/cpumask: Add some operators
Date: Thu, 27 Feb 2025 15:19:31 +0100
Message-ID: <20250227141946.91604-20-andrew.jones@linux.dev>
In-Reply-To: <20250227141946.91604-13-andrew.jones@linux.dev>
References: <20250227141946.91604-13-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062013_352308_1E31D8B4 
X-CRM114-Status: UNSURE (   9.23  )
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

We have a need for cpumask_andnot(). Add that and a few friends.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/cpumask.h | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/lib/cpumask.h b/lib/cpumask.h
index b4cd83a66a56..3f03d3370f85 100644
--- a/lib/cpumask.h
+++ b/lib/cpumask.h
@@ -72,6 +72,62 @@ static inline bool cpumask_subset(const struct cpumask *src1, const struct cpuma
 	return !lastmask || !((cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i]) & lastmask);
 }
 
+/* false if dst is empty */
+static inline bool cpumask_and(cpumask_t *dst, const cpumask_t *src1, const cpumask_t *src2)
+{
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+	unsigned long ret = 0;
+	int i;
+
+	for (i = 0; i < BIT_WORD(nr_cpus); ++i) {
+		cpumask_bits(dst)[i] = cpumask_bits(src1)[i] & cpumask_bits(src2)[i];
+		ret |= cpumask_bits(dst)[i];
+	}
+
+	cpumask_bits(dst)[i] = (cpumask_bits(src1)[i] & cpumask_bits(src2)[i]) & lastmask;
+
+	return ret | cpumask_bits(dst)[i];
+}
+
+static inline void cpumask_or(cpumask_t *dst, const cpumask_t *src1, const cpumask_t *src2)
+{
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+	int i;
+
+	for (i = 0; i < BIT_WORD(nr_cpus); ++i)
+		cpumask_bits(dst)[i] = cpumask_bits(src1)[i] | cpumask_bits(src2)[i];
+
+	cpumask_bits(dst)[i] = (cpumask_bits(src1)[i] | cpumask_bits(src2)[i]) & lastmask;
+}
+
+static inline void cpumask_xor(cpumask_t *dst, const cpumask_t *src1, const cpumask_t *src2)
+{
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+	int i;
+
+	for (i = 0; i < BIT_WORD(nr_cpus); ++i)
+		cpumask_bits(dst)[i] = cpumask_bits(src1)[i] ^ cpumask_bits(src2)[i];
+
+	cpumask_bits(dst)[i] = (cpumask_bits(src1)[i] ^ cpumask_bits(src2)[i]) & lastmask;
+}
+
+/* false if dst is empty */
+static inline bool cpumask_andnot(cpumask_t *dst, const cpumask_t *src1, const cpumask_t *src2)
+{
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+	unsigned long ret = 0;
+	int i;
+
+	for (i = 0; i < BIT_WORD(nr_cpus); ++i) {
+		cpumask_bits(dst)[i] = cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i];
+		ret |= cpumask_bits(dst)[i];
+	}
+
+	cpumask_bits(dst)[i] = (cpumask_bits(src1)[i] & ~cpumask_bits(src2)[i]) & lastmask;
+
+	return ret | cpumask_bits(dst)[i];
+}
+
 static inline bool cpumask_equal(const struct cpumask *src1, const struct cpumask *src2)
 {
 	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
