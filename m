Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCDC4450A
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV5VkfFHwRS3ImNrP4/CAyhD6oOKx5eB7gME8FplnGI=; b=y9ms9K5pKpCQO0
	fI7/39mwY0Zds8RVGC5TlvmSOy2wACEUcRIR1495yZczXdIMjPySSAaGjHX3EgQMaxp+rTaPrtF5F
	xF+YesOesGYELP61pF3Br2mvNSzAPCQyQfh+8NUb8Uf0pyX6IBEfS4bY+OrnU2hHhdGzPWkz7Eed8
	nF0LR+dDXhHOpuqIje7XibsI0Twfynl0kkteswLvGzNbQo+V+0hImfVnQO42922KKBtzeMnY9K/NU
	ZuGamXkT0A+VFPdrzjglSrWOuyKdL9Pev0fixr7Uo+Fg9F14YN5ScPnoP4QmWS8aPE3vRJuhhFcsb
	jNv+VxrSRpO/o38UEpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLS2-0000000HJir-3FnP;
	Thu, 16 Jul 2026 12:44:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRw-0000000HJYh-0wd7
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:29 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84861fc51f5so3650286b3a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205863; x=1784810663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=I/I2ivd63Cm998WrNygaFsbuokYI75uuARjFE123bNhex8aElOjpT+Kd4JbqRMza+u
         CkL331yE8OyYgY/d5lCYycVA+BymqBlxT5PyUrOriOURns3K8OiSmsPbnTto9stMZY9H
         /kOp4UaSSTeSQLIffB2yLtgXkGxz91n3dZlfJeSjmXO60mYAGHB1JVZCIlfWEaYa0qg5
         t3UbeZd3MKPlOG43jWc/q+oEV51jMh40h4WWuq58hfwRW2Jp7oe7OhD6NvNXUK7F0fcO
         P8KgMg+1oZGzT/EXMwaBgESiire0kScwjFDAo4oBuJ/Iv8cJAp47d8vcvARoiGeN8fn2
         koJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205863; x=1784810663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MW3VkNC58mnWKcn8BtrFop2mUDTlw3bfVwg/aYM+yrM=;
        b=rmI2ml6pksHgvK5SJkzJah5cwuhu6MOmtmITZ1J990xeGE15SZ7rruwnH/8hAACcmn
         YdhWDLDr/KA3skbtC9AXgINGBAODAcHwlsfTGXa8kcF+h8tZxQ36/hN70Kr1ScfRzYKc
         MgKwXR739bHZ1Nb/Ik7L+N2AE3S5c3SxPBtLFD6LVWRp2rJZbzVrLZadpqGWQZdrAWOZ
         p4gXmlcvSmVBm3jpscd44Ncv4FHo+QMlObS/HSE6hY3l+LIL3TDK0me6kksCyQxikK8J
         lCtUDG/3FngidoerbMEViCHBbAdFXueFfBi5UQZMeLPrVMgxT1tYBaCZwg2aq8CRR0d4
         TzCw==
X-Forwarded-Encrypted: i=1; AHgh+RpGQ+hmNldtWpYSykelZ8LQdFW+tMBOaLnwUwIEiJ2xmZqlnaz7sxid6/07BJSH97rwKbA8sHbvjN8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx85Ym7SCbl1dhY1H64YPJdPXtlD0XMqsYXZLUfifRTZj0MpPDD
	whL3lf8TwVqWGWcBOf0dl8k6BrbIU64r+jP6li2GoH9UPubmRAP/JPqMTYK/78PLoTM=
X-Gm-Gg: AfdE7ck8VW/7k++V/bquc1pizbXIogo8hEJ6YeyAml2HV7oSiD1wDboeM7Wmmzo84t0
	bgXdbbbpSwon7Yf5jlb9AlBuDcV1PdLkz+ay7Mm4ob+NFStDQBzD8uUUcn5T8uMr9QuMts3iHqo
	CJZ2YIpjTNzPGHN0br37rpu4rVsljiAa7fsYmiCEeOnIuSeTHmnoUuqOB1yN7PstaidovGTQBtg
	XwZqUT88AxRs/VQ0SDvQ1cRc1LGTa79S1UE0+erWPSUJe8K/ZYx+Gr+euTgv7Ar9ENx7jb+ee2k
	GnXRDgavSlv2E2fvUScAicbgQ4j4XpHEvBPVtSLjKvhgD3CWqkJ8QDQxd0Rv/LLg2L24gnC/uQL
	flCB9ki0dSDzt6eEAAbQFuw8gADcO2jI4BVl8uC1brrTY1BGqzsw2bGF08j5bX5ePQzpWACTakn
	gwvrT+wnfFChzvSpP+5d6Bcx8=
X-Received: by 2002:a05:6a00:4c98:b0:848:4b27:36ce with SMTP id d2e1a72fcca58-84a673c79a1mr6078389b3a.73.1784205863094;
        Thu, 16 Jul 2026 05:44:23 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 11/15] riscv: mm: avoid Svnapot A/D aggregation in fast-GUP
Date: Thu, 16 Jul 2026 20:41:46 +0800
Message-Id: <95699db9c9b90fd1f95310e9d95b000eb8cfc616.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054424_291856_96A343BF 
X-CRM114-Status: GOOD (  10.13  )
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

fast-GUP only needs the PTE state for the current virtual address and
revalidates the raw PTE after pinning the page. It does not consume the
block-wide accessed/dirty aggregation provided by the public Svnapot
lockless getter.

Override the fast-GUP PTE helpers to translate a NAPOT PTE into the
current sub-PTE without scanning the whole NAPOT block. Keep the public
ptep_get_lockless() semantics unchanged for other lockless users.

With 64K THP enabled in always mode, fio 4K random direct read
throughput improves by about 10% over the previous implementation on the
same system, from 2.615M to 2.874M IOPS and from 9.97GiB/s to 11.0GiB/s,
while average clat drops from 95.54 usec to 86.97 usec.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
 arch/riscv/mm/contpte.c          |  9 +++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index dd56c20a817bb..3727c148fa0fc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -597,6 +597,7 @@ void __napotpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, pte_t pte);
 pte_t napotpte_ptep_get(pte_t *ptep, pte_t orig_pte);
 pte_t napotpte_ptep_get_lockless(pte_t *ptep);
+pte_t napotpte_ptep_get_gup_fast(pte_t *ptep, pte_t orig_pte);
 void napotpte_set_ptes(struct mm_struct *mm, unsigned long addr,
 		       pte_t *ptep, pte_t pte, unsigned int nr);
 void napotpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
@@ -956,6 +957,25 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
 	return napotpte_ptep_get_lockless(ptep);
 }
 
+#define gup_ptep_get_lockless gup_ptep_get_lockless
+static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)
+{
+	pte_t pte = __ptep_get_lockless(ptep);
+
+	*rawp = pte;
+
+	if (likely(!pte_present_napot(pte)))
+		return pte;
+
+	return napotpte_ptep_get_gup_fast(ptep, pte);
+}
+
+#define gup_ptep_revalidate gup_ptep_revalidate
+static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
+{
+	return pte_val(raw_pte) == pte_val(__ptep_get_lockless(ptep));
+}
+
 #define set_ptes set_ptes
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, pte_t pteval, unsigned int nr)
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 0f66426b0ecfd..b0b8ff0aade3a 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -413,6 +413,15 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 }
 EXPORT_SYMBOL(napotpte_ptep_get_lockless);
 
+pte_t napotpte_ptep_get_gup_fast(pte_t *orig_ptep, pte_t orig_pte)
+{
+	if (!napot_hw_supported() || !pte_present_napot(orig_pte))
+		return orig_pte;
+
+	return napotpte_subpte(orig_ptep, orig_pte);
+}
+EXPORT_SYMBOL(napotpte_ptep_get_gup_fast);
+
 unsigned int napotpte_pte_batch_hint_from_pte(pte_t *ptep, pte_t orig_pte,
 					      fpb_t flags)
 {
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
