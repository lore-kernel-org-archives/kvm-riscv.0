Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB97DC44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxjOPz0oOb0hUf77Y3JOoqb6k4NSSQWNzv3Qv/tE5/Q=; b=kZVmbo9C0xITnw
	7jYXJ5OeGP3UIAML3K024YMzLarf4lJE8f2ZnqToRfJ170Z1PpwOrykz2fr91/o99A3zJndaJILSP
	30dZ0s4bEyQFKERV4ldFo3Ag8ChtP7NsVBT4ZtSU0121TgU/W4dplsdidu22SrbT927Q6jbxRcIG/
	FECrfV1YFG+eq1ZCNaIJC9hLuZ1tt0RA0pYqdnUYVIb5NVEYP0p/0AhKGFLLasixhPCmeS/wZawX3
	7u8oKYUbS7ac23rGxNHlERYfxgFbuaRVjIPfv2aUTzK9H8ieJmA9Eb9RrCjFYl9WFrBdT1nllW81n
	gu+KDtIxGnoIW0qm1RRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSH-0000000HK0X-1DLL;
	Thu, 16 Jul 2026 12:44:45 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSD-0000000HJuy-2Oye
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so75106465ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205881; x=1784810681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=j9H9ZcZiXjQ76RHRS/Mgai3gMuMPIhDYV9YJOwW1GYLOFuqlI/XSfUqQVC+YZBt+j1
         Fu1u10kwQUhCBXJV9yH9+DKk6KmWDC/296NziedVsIYJ2pvmoyF4MN7CUjje+bjDU/lR
         oAeJDqdniw+YFTzEa8cxYfA1YUX03/TAulJfWtqbcL6DaKHvdkAZvCi9jIrMXjuT+4rs
         Dqf1OicKWaJSX+Om3fVdYdYScVpfbYlp8kZoSQrul7nvKtWByTXJMRESKitAnL3rA40w
         aMYDi+edKd5UM0kxGlEA+g0IlVkOzksyAwiutFLKZ7wIsjF3hyLLO+z0vse0cOEio4Fb
         jsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205881; x=1784810681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9SXJgNY1wsw8DmDdohBTpB25DAPwcBNYqh5j7w6mI=;
        b=abtm0VqZTGN7Ra4pbroPlgqVbJj6BTwdpk0V7uN4QhlVUPh3wkuCoEZmknmhuny/vE
         1c0EOP9wvYNF+2oHdj5DoXRhLMHLE2zFndu4J3gPxcUQXQGGC74TKhI4TgkVpvhxlAw/
         ZH4cjR7J+MeQeK1BYNFBZgedEeP3zLETR6py1RKBabNPANIAeUXodCNSZE9lbpA7qk8q
         iM9j/stUdPNPPIpHPYhSlRIonI04rChP7ih6YMZuLjhXNn6of5nW/CZyBHxWeutvBTxO
         PdMHSxGkTTI9BEUE7jcTTz9NT3gyEZO6fQDMz7VPB3dKLbU2D/ZRunzeJVkFN/bUXCGE
         W91w==
X-Forwarded-Encrypted: i=1; AHgh+RqFYpnlBdKoKxn714QezSoyLVMgtD8x/KEOB26zvRPAirjufIHRI6ru4SoSHPNJNfHWB0hBA+lyIIw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPkCp8wyGeP8lQCqOTvpkl15PI4ivRF6aZ0nthJQFVs4/UkO+5
	Ya8hGOTy9zZpy28GpBxzpcGmA0AJLb1r6goLEuty4TDvMBE6R27AlLz22ycqHcCn7Ik=
X-Gm-Gg: AfdE7cnhQMyJUxS53qvUiaMN3qTaF0F59XoLQ6vhua1QIvoE814eJpg9esqRWiUNorw
	yQqX1Oo939A5OE5vD/dCPmuCL1VnJZYgIO/SayBJq/EGmUi6OYDi7ZzlnrTn3gDNYTAD0+Xy/oN
	vyZmPOsLk+XGkPDcKk3exjY4raVDLZ2354tlRdifcEAiKUbKOEWeQDerMa3gAz6Xrkq/RrJYBJi
	8j9RPoSXpIrayRZeKjxn0wc5nwmFygYcHG7QJR2Msr6qZmQJOhKIn1t/rqBuDQUKV4zbvJO6CMn
	kbAWjH+HTssDo6wIim9uHP2yOI5iixiSONIgrjuP0ircRZ+WWMOBxPSPAYR3Ws2SE5oPLM4e8wW
	JQLh8OnuQaNHnPfnncXN3KCLFH4RMWYP654ph2eGfk1vtjupMolobukb9sxHrTL42002c1N9Dpy
	FqfwEyXE/WSxcrsv8VtDLu5h0=
X-Received: by 2002:a05:6a21:114c:b0:3b4:b275:c5b1 with SMTP id adf61e73a8af0-3c36c1cf118mr8945730637.26.1784205880687;
        Thu, 16 Jul 2026 05:44:40 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:39 -0700 (PDT)
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
Subject: [PATCH v2 13/15] riscv/mm: remove redundant TLB flush in napotpte_convert
Date: Thu, 16 Jul 2026 20:41:48 +0800
Message-Id: <e55fb906990083b05272648f5299514a68cf8456.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054441_613719_1C793FCE 
X-CRM114-Status: GOOD (  12.06  )
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

napotpte_convert() switches a NAPOT block between the Svnapot encoding
and the equivalent set of base PTEs. The conversion itself preserves the
effective translations: PFNs and permissions are kept the same while the
page-table representation changes.

Do not issue an SFENCE.VMA in the middle of this representation change.
For partial updates, such as unfolding a writable NAPOT block before
write-protecting one subrange, a flush at conversion time would not be the
operation that enforces the final permission downgrade. Writable base-PTE
translations could still be refilled after the conversion and before the
subrange is write-protected. The required TLB maintenance belongs to the
operation that actually changes the effective mapping.

The RISC-V privileged architecture discussion clarifies that Svnapot is
an encoding of a naturally aligned range. When napotpte_convert() only
switches between the NAPOT encoding and the corresponding set of base PTEs
for the same effective translations, the conversion itself does not
require an extra TLB invalidation beyond the usual page-table update
rules.

Link: https://lists.riscv.org/g/tech-privileged/message/2950
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/contpte.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index b0b8ff0aade3a..8289f39d6e188 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -129,7 +129,7 @@ static pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep, pte_t target)
 {
-	unsigned long start_addr, end, ptent_addr;
+	unsigned long start_addr, ptent_addr;
 	pte_t *start_ptep;
 	pte_t ptent, pte;
 	unsigned int i, nr;
@@ -137,7 +137,6 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 	start_addr = napot_align_addr(addr);
 	start_ptep = napot_align_ptep(ptep);
 	nr = napotpte_pte_num();
-	end = start_addr + napotpte_size();
 
 	for (i = 0; i < nr; i++) {
 		ptent_addr = start_addr + i * PAGE_SIZE;
@@ -150,8 +149,15 @@ static void napotpte_convert(struct mm_struct *mm, unsigned long addr,
 			target = pte_mkyoung(target);
 	}
 
-	flush_tlb_mm_range(mm, start_addr, end, PAGE_SIZE);
-
+	/*
+	 * This conversion only changes the representation of the same
+	 * effective translations: NAPOT encoding <-> equivalent base PTEs.
+	 * A flush here would not replace the TLB maintenance required by a
+	 * later permission downgrade, because writable base-PTE translations
+	 * could be refilled after this conversion and before that downgrade.
+	 * Leave TLB invalidation to the operation that changes the effective
+	 * mapping.
+	 */
 	page_table_check_ptes_set(mm, start_addr, start_ptep, target, nr);
 	if (pte_napot(target)) {
 		for (i = 0; i < nr; i++)
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
