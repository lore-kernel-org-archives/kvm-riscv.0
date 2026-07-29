Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F1FC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/8JRyHC5qh9XR9rLNA9VW7RM9d8adggN5ZJmMVe6dY=; b=AWvxZy+2TPd8kR
	Iq6xTcGjS6qAoqyhijp8IyLUNrr2gnCilfNyF+g5FUPeA3NzcUwwUvSPwhOPNcRJq0IK3i04Ti5L0
	NYQLnzV01Y0iok0/RaVnhOkrMR7EyAR1RwMEOCArS80mnZvUrxJv4qLS68+uwKM/tw/yksLE9d92g
	QwDgAeHrTQCzGl3eQVhvj8bPllK93CyTjgmJYtnylvzQtvY9W19hGJS/mtWOp4IAfHI6OwVdRhIgw
	3LJX+yVp1vExr/5vZz6Rkin4CEPdi7efTMzmdxuTQWtMaY3EiGVbwH88kRz1sHXI7b94lpb13dsRl
	MsfbpbpDCY9bDnu2OScg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34e-00000007pRY-2oGQ;
	Wed, 29 Jul 2026 12:07:48 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34c-00000007pPt-01Me
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:47 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-cbb8ebaca74so341961a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326865; x=1785931665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Reyg7Uf6tDZ8+7RMN+GpyxgR6kpVXfUwi59Uf40QnCY=;
        b=EFsu1lqMD5VqwqAb9/6bhpKJ9ecJr//RGPDa/kDAhmIUWIEJiUNtafv0Qa7Ut7L1lN
         poOzoeUN+Zd/8z/3xykRtM3ec6gnWMwUNy/FuNJaxMghq/nb6ae8MiSMSsz40tPGncg+
         M7NKJq85/MIgMS/gcdguscZm7kATLMGodTfhfvm31ozO2BN2izepYoHqY0r7Y/DlBLWo
         M3nqwBov7fmkRgH0/y5fZC0M8WCy65ole0dqfLisD3XY6XoTb6W9fbhbM46o56axYzgA
         OOQ2GLBmHZ/7HnY2uJaI+tf5isFKiFtjWC2bRKH30q4T+5kugVSpytfKho3UfSS0bpZe
         9Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326865; x=1785931665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Reyg7Uf6tDZ8+7RMN+GpyxgR6kpVXfUwi59Uf40QnCY=;
        b=qtgV29myHbFGVqVT2EVIMuIVVqUsagee3KtN2FATcE1BJy3pessPUeISmeEtXc0aOE
         WoAqv4+hcOpqSA6L69QePkB+XgQJNilnhK0an/CiPMDp1IOBasz7MqHFkSyr5asVTX8x
         NEr6okuHmdD+I7Ia9/fQgFO1z24vY0weYDRdwjoLqC4K/FCoED5eMArMOV7BSRQ2I9lX
         o6ayVq6QwemEqZHT+/R55RSkLHDDyIWtKGdyxbFtzjbKcVujZsnZCGpy0UErChU/gv1W
         HG7lhwEiIm0UjMz1KYFMwOKnPzWOJFpE700660iJXLSdl+j5Yd1viqr+VU1KqA3IFFg+
         EFog==
X-Forwarded-Encrypted: i=1; AHgh+RoHm36QlPCQlTGvMvLNRTS2WtNrnPMi/mBGBzd6T/uPatx/sRuKIloiLuYRqmh8t9qURwcq87xv4HQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjjZ/A2DFvGyfMrIW0IbdoHWfNX4yrF+/eXLyH3hCXno1LpPXL
	Q0+WBdUFBgBMHi8PEHZHAfypuZ230jdDKD4IeviVuf+JM14v9wQS3XMx
X-Gm-Gg: AR+sD10Pw5ZTf9imLdM1AClwxtxFOCOf4fspDzTyCPtUg3B6P4ei+9GwtJW/XtQZDGM
	dPZEuXKRJpWAif47yzQ5wmqiDzyQivfwhWObWDxLXGbs/AvG+6nfMIVNYsT80Pbg/QFW/wok+QW
	NKDYFY7vSKY6P61xJ5UJuZtH+PEhYkloWpEl/zaNjbTFWM53fjmko2ZGtMI0LNVsuXzGTMEHXwV
	QTesfgwO/Qq3BFBB3KsGNy58RfPgO/ZXa1KQVbF5/aPJ/U9WLXiTct+2dB8atjLgIDhpgXn8ngV
	GSKWc+2WJd8GNRoc5yJ/A0HN0SxjWf4vBz5oKfegfrDgYZTswtLmsAyD3Pm3aM2FMn2//VHwMNF
	YGoWhBedAauCQW/JkHzRalVxnH66q4OxskYdYTBPU93Uzpk4eiceTzDdNVM1VBnmC/nlb0sGcr+
	xSAI3wStTB7147DOf+MRw8H7pzuAp8juWGg4mJpINTRcrGCR4hF1e1D/n6sb6RYDxTe9QESE0ON
	/4pefm+xb8X8NwBC9QgmkwMwg==
X-Received: by 2002:a05:6a00:4f83:b0:845:c7f1:29fa with SMTP id d2e1a72fcca58-84e93250f57mr6434871b3a.30.1785326865329;
        Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:45 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 2/3] RISC-V: KVM: Use unsigned int for vma_pageshift
Date: Wed, 29 Jul 2026 20:07:32 +0800
Message-ID: <20260729120733.829457-3-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050746_059389_383DA633 
X-CRM114-Status: UNSURE (   9.98  )
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

vma_pageshift in kvm_riscv_mmu_map() was declared short.  Use unsigned
int, the conventional kernel type for bit widths and shift counts, in
preparation for sharing a common struct kvm_page_fault across
architectures.  No functional change.

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 943d8dc72105..d2a06a54be17 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -541,7 +541,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	kvm_pfn_t hfn;
 	bool is_hugetlb;
 	bool writable;
-	short vma_pageshift;
+	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
