Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B6CA0FFF
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tePz3FX0yw2Im8Awp0PZK3wefcDfDzL2i5eIleuM4fw=; b=UXz2/VBBqiU0H1
	9uaXHIgUiIEavxNB/ztIK07rq+PfDQqAP0MHtbJuka7UD8jB+nwj6YB7LK1SjqIvQ6+Yp7LzoPd68
	ubAp2hquD2cv10kjfwWQpaT4mRgSkFPHTzcx48AoeGE52yNko309dyZ5suXxoz7QfqPI6ryceJgE4
	KsJZQOKI3DQLmecafn8n0XrcianG2uMTDRewkO5mX0GFT+RoY3vowKY2ae0ih4zg4+wxlanmoPCZr
	v2mpHBlrZwbQmYPFBqh0yesr2uDAp3+Bdg05fXznwEV3NV1QuGM+4eDc9RK0tIILKpzfalw2RsnLQ
	4uC3SBH7/FTgA4gbiOUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszU7-0000000BW0n-1n94;
	Mon, 01 Sep 2025 08:01:51 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz5S-0000000BSMI-1M66;
	Mon, 01 Sep 2025 07:36:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-24457f581aeso36687675ad.0;
        Mon, 01 Sep 2025 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756712182; x=1757316982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI7sqxzwAb6+8qpfDyLKKtJ7Me1UGv0S+1RIHhygZjU=;
        b=V4wpFG/jCY9ceMxQiFSkHGtDsBgKs1/gyqCR+9w4gj1sZh9JOb2t8wvDK2Lt6l12sh
         hhsCKGOanELBqvuNPcPa8q3beAHRkGFcm74KuSSkC/BSwp5imn0Unl2ioWW9wPTXYIiQ
         SKqbbFcDd1fbyHCz21nfDI1zNV7QNxeyJyiO8OtnKeGwjv3lMpax5bridys6PEm1Pye6
         zjDM8FDIxkJZ+2kpoZwGYX6KjVjaADsCx7xNRy8/gpPbD9MAwiY62Zxvb982uqcBM+fB
         waLhaU+1+Ay+GaYPV1XvydvqTj2nAuDh2jJa+V59ffViJdAf+QO2aY/EFGTBUO3XPqE7
         IsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712182; x=1757316982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI7sqxzwAb6+8qpfDyLKKtJ7Me1UGv0S+1RIHhygZjU=;
        b=WpWOP2OwCV56jx50wVQKTUA8uxyBixtwKIayhON7+B7c/iKq8nBmA9ozd3g3fw5Lza
         vo6IiPt4hflWp7hYPjJpq4mu3iYiQ6+XK2M4SZHzvCmo9hfyU7CFbZlgYvAdyI1Q78Dt
         XYV5pfyK53a/ztbAZYmkz1RsalmeyUwQIrJNenihmzPTzCVg2l3RT6PHuArdtG8UvUEh
         GR+PrVNLJk5DAxQFadyb1Rw+cxEBe75qg5S+DS9kijWV8PptQeDvh5ckIDhpTuy4wHPU
         NyFtxckRTNMIPgWq4SIO4pDVvw86UFl2ilBeeA/gnIsixb0TrAqfxOi+TsW00b7XSv11
         sbKA==
X-Forwarded-Encrypted: i=1; AJvYcCUTkIauBZRZ5WiLoM0HQ4s1/5ZuW7J7l7vXDXaN26nQVH5Wu8Onl9S22DG9rjUqaB6t/EbOPsZdK0839dA=@lists.infradead.org, AJvYcCUlWTrsrQyZHhUUG8mqrRvW4dgfpOTFTkB0BMu1kulwkuNhQAVSxkHZh+DDj8d6+lXHS6WLsJkSEPg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBUjyEWxeAMm/Fyske22+wbeDsDdLyM8kuGaev1NPEusKo9GBj
	m77s0rqtWUBD/OhVUsigfe1mpvRNbb0wCei99Z3Dhyb5LffssJGldJcL
X-Gm-Gg: ASbGncvGhLJ/0/3U5u5+8PYbJxhwO0Ik0DjLfdMO2cKMbHgCi4s5S8kt7xxaYla08Ux
	r05q1Ed+gs+7KL02MyIXS7hjC/NYLbQ2wFFuntkN4fz7jsPyQohypz6PFIMlfHFYbBI1jqrijTT
	7uVXmIVnfGtWvCO+WQqlXuIRfnL2laYo23TFCZLDGDGVmrY+oTlr0oOuEzGlfh33yVb2Edd7F8m
	1J6O+seE41xlyKBwqBR5wB21p7SVSkIRvvmG9/jAAbGXvjos96f/4YNKunTbHbS3qmDAcER6qLY
	pgwEGt38dDOkzWpq7rpVnAde7AWs2+hs5U9NGZ675k4UnXPRM0YWXy9IBMRHv50qDlU35hnJvJt
	eV94Gaw8Xh/Ktn91s7HmS
X-Google-Smtp-Source: AGHT+IH+dCQY4Kqqb6suPsSi0/Emx7fwwdzdMp+EJ6/IyH5dxTgGWWtb0vd7ZMANbaRLjtbZGTJDPw==
X-Received: by 2002:a17:902:ef52:b0:248:dddf:e3f0 with SMTP id d9443c01a7336-24944a4faf4mr88999825ad.19.1756712181651;
        Mon, 01 Sep 2025 00:36:21 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([2406:8dc0:6008:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903737b05sm95867045ad.49.2025.09.01.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:36:21 -0700 (PDT)
From: dayss1224@gmail.com
To: pbonzini@redhat.com,
	shuah@kernel.org,
	anup@brainfault.org
Cc: atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Dong Yang <dayss1224@gmail.com>
Subject: [PATCH v3 3/3] KVM: riscv: selftests: Add common supported test cases
Date: Mon,  1 Sep 2025 15:35:51 +0800
Message-Id: <c447f18115b27562cd65863645e41a5ef89bd37b.1756710918.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
References: <cover.1756710918.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003622_360170_9CE2EF93 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Some common KVM test cases are supported on riscv now as following:

    access_tracking_perf_test
    dirty_log_perf_test
    memslot_modification_stress_test
    memslot_perf_test
    mmu_stress_test
    rseq_test

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dong Yang <dayss1224@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f6fe7a07a0a2..88613a851cc1 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -195,9 +195,15 @@ TEST_GEN_PROGS_s390 += rseq_test
 TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
+TEST_GEN_PROGS_riscv += access_tracking_perf_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
+TEST_GEN_PROGS_riscv += dirty_log_perf_test
 TEST_GEN_PROGS_riscv += get-reg-list
+TEST_GEN_PROGS_riscv += memslot_modification_stress_test
+TEST_GEN_PROGS_riscv += memslot_perf_test
+TEST_GEN_PROGS_riscv += mmu_stress_test
+TEST_GEN_PROGS_riscv += rseq_test
 TEST_GEN_PROGS_riscv += steal_time
 
 TEST_GEN_PROGS_loongarch += coalesced_io_test
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
