Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C0C44514
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGhzwjW4O9nDvzJgZi+VanlYdocmta2jYR0twPFiXHo=; b=LMEnMcqWU431ni
	E3krWTTFnip88uZ00zh9e5HKQDAimnFDsHDxv2i04ChuNTABdSLyEAZJ76gEBkxs3MIaV7mKUNt1r
	/9HxMGrzqAU+SDmIZLxm41DjlMihns4jstNftsvsC6Deu0x7rSwpMjmSHSXmIhN052sGGDxWgZ5+B
	WxRFaryxmoPhQYgt4CJ5rkUeqKDqn73JUWxNgYUBQqmKskmYLFJaiDTCvDm9ou3dEXmrYZVFH+jMj
	0zKN8UmCWQHs2yPlNDT/R/pBxzTfzQLlJOB5N3kWukAD95VEgOaXj7BNZvvVCBGbiwzKEHqv9nmyw
	7X1vNOcs3Zl2nrvE13Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSY-0000000HKPW-3rOg;
	Thu, 16 Jul 2026 12:45:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSV-0000000HKJ9-0Ek9
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:45:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cace91f112so63347345ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205898; x=1784810698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igNuDXnwdUCT2dm/vIcI/M9kQJ6fMwWaxma7wgKaCpI=;
        b=h4tbZYfwTsSuoOxBSM4l93emlH0rsAfwNlOy44ae5zDiuuz/KIypj2XHwa4B/uF+JY
         eOG1kEyAuuym8jq2EqQtwAqf/FWe5Kr5Or3jGJdlNi7zo14X27/AayjCbvMEXYN25khq
         fMVtji7jjF2at0sYEjsIx1QHLOo0ifyxvz0a3bWb2ohx/5145e/LghCqTgfsuWk2pI9U
         NzgW4+tyls3pJk1FbPMl62zWLLElpL20X1iJWPYLtX4D9kzsBRsgnRPXTq3ztf1EkOXG
         v/LBtLGDWCtB/pSIHRMf29PSKTXdYFfzUiNTAfFedHs4tSYtxqxI1NIOchprmgxPOlOx
         rhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205898; x=1784810698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igNuDXnwdUCT2dm/vIcI/M9kQJ6fMwWaxma7wgKaCpI=;
        b=fQYoFsD98cUNoCrfJpgDl5H0ZmuZppqFxCLMjU/+V6GsUuO8cwGSBcELvWwF38ckkS
         2QINGx25wpIiVDnb4lyLjAA0KoQCuMmNeScQQDBNu73Cudzl4KLRKDUOm1aiAXfFIcWB
         I1l8sitAIJNLqyiiU738lt5VLcHQdl+lSOoDjF/shhdxMa3/0xJQgtqAUZaJkD6pf0Fy
         C+zBI2RmTbFP720n/RmbhvL1gmOiRNQ9ho/LFmXWRdk/3OeCf3zYWm9OQe5yB92RJDbD
         oFaYC1pJbehFr13zIN5DEyIlM07nz6kwib3q7Vin+L9+iRailkaw43/VaCvtPAPF8t6T
         7XlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrzEOHpXxBZ8KlpAOJHd+sLGMMdmnXE4bfzUU1bKyYW5Y5nmnn1qGFpcMQoXhJeGarr+1XXh0/Rk8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4gTn6zKAcqOHJ7NtGTx867UUnxP9rcva3m9N+P82XCCLvLkCS
	SiIqWc0iZ82on+xo6jEYjLKguDgZ4YyuHIIo0raDyJfnDQDxj9NvuKxFLT5gsP5SiEU=
X-Gm-Gg: AfdE7clSnAouGkRF9QD1aGs57cJ6AQ8xsxJr7MS0jXQFWJubYnIETgBnxBwrYPIXtxM
	UC9NjUHXk8s7EiCL6fKXxEXU2+3fvJEvNPXE+qCPq5VM+RLpg+3/DzidTi5sLabaBPWdOSA0j94
	vJcLlx6xm4vDl8DzDXoLnyOZDwfgJzC+6NIeaCr3sottALLqBNfy+XA1dt55lPVyZ8PFBwZR+A1
	b2IJFwgmzO498habEgI0rkfWumisJnVyZjfsGWTvCnXANi2j1T3+9ZAMI8ax5oDqAGy85Gh46Xy
	Gxu9bRb6GFIuYVaEpPGSVL1SINUrLvBvet0r/Gb7vRJvFwTNYECNFH1CbAn/5jyDSpaA/L/PBkr
	rYWMQMweckA4MYSp7/GuGt1aKszbGM7frshRuXBMaNHLZUXAIjKG4ldbu8G9lb9QaaMSnPWj9fw
	CFSTo/5LdejXVyHSjjaoUinEY=
X-Received: by 2002:a05:6a21:7318:b0:3bf:a881:4094 with SMTP id adf61e73a8af0-3c36c35d245mr7182183637.50.1784205898111;
        Thu, 16 Jul 2026 05:44:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:57 -0700 (PDT)
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
Subject: [PATCH v2 15/15] riscv: mm: Request large exec folios for Svnapot
Date: Thu, 16 Jul 2026 20:41:50 +0800
Message-Id: <88438f09b79ceab1548aff17384814b7f699a43d.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054459_130544_1ADD337F 
X-CRM114-Status: UNSURE (   9.19  )
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

The Svnapot MM support in this series allows generic MM paths to operate
on folded 64KB executable mappings while preserving a per-page public PTE
view. To benefit from that more often, executable file-backed mappings
should be faulted in with a folio size that can be folded into a Svnapot
range.

Request 64KB executable folios when Svnapot is available, so executable
text mappings are more likely to be installed as folded Svnapot blocks
and benefit from lower iTLB pressure. Keep the default order-0 behavior
when Svnapot is unavailable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b546e6614c558..6801ba135c483 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -296,6 +296,14 @@ static __always_inline bool has_svnapot(void)
 	return riscv_has_extension_likely(RISCV_ISA_EXT_SVNAPOT);
 }
 
+/*
+ * Request executable file-backed mappings to be read into 64KB folios when
+ * Svnapot is available. A naturally aligned 64KB folio can be folded into a
+ * Svnapot PTE range, reducing iTLB pressure for executable text.
+ */
+#define exec_folio_order() \
+	(has_svnapot() ? NAPOT_CONT64KB_ORDER : 0)
+
 static inline unsigned long pte_napot(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_NAPOT;
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
