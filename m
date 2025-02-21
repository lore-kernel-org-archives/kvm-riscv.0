Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D983C021B6
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgE0o8Hg9moytzQgLWkp/QHWgpI1QtZ77JUoZdsZyck=; b=kr2kvpNp4yJPO+
	zsbADg8/YvEQ1EXPqP7qLn7DrQFW2HIVh3WJQ6GYb/HUEPX4huy4OEQGl8j3B9fOx5IgnubGYsB3a
	YccI4CP3fi4G/Xy2gq6iTWlrSLvXZOroKrZSZz6H99iTzJVSaNqqjSY8nDUoFXw7vDve4EQ/eUhmi
	cUItDeWMHbNEfTijQ8U5ca3pfrsE5Cwn2EbT9XPxXmnBwvDv7TyG0ohTUt1fRHL6xb0mAjrdwpp5k
	fHvhbPjEvbfttGPq9c6BrxGwZlmThhlb10vAj+UQk3p6sSHJdFzVnXFz8IgoojDnQ6MJ5wiZIBdk9
	frNIJOEz7AhsrrA1ZvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNe-000000063hl-1Rcd;
	Fri, 21 Feb 2025 15:55:58 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNc-000000063ej-2q2i
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slI1JUB/UvUbPN5Rstuovemtpi0TAKTYiJh7X8a99sU=;
	b=wjPcBn6X1WqC72wfAeDrsC+25U37uASQPYjx5tjbROSgw8qNIF+7QkrgCoTXOHB4DRPXKo
	ALMAo4j2QVwrRfcq33nprGdyzmaNkCTIDfAdDMl85ANULJRAYd2g4KiDENkO6s4NnDdWm9
	KreRu6e8WCalV9w4pxKzwdnNoxx+/sQ=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 06/10] lib/cpumask: Add some operators
Date: Fri, 21 Feb 2025 16:55:40 +0100
Message-ID: <20250221155533.123418-18-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075556_851736_6E22C5E5 
X-CRM114-Status: UNSURE (   8.97  )
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
