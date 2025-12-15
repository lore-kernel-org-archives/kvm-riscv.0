Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167AD5B847
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 15:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BQCvhdW2jqH7ZT4yFaI3U620tVTqiPMpqe70H8EM1uY=; b=yiiQ6XoCy7BslUwRpBnMOY/PZI
	kX0L4MqWbTOQTsV+HxXBzRMgGqR4RFpF1dE2Jl7soDPpJ8co10MPlk2y2lGPndLGcT1d8lxT0degO
	gkz+6YitM2LWnyQ6TwPvxW81noiT/bzS2F9pWUNlxRihiMdDl+nL1Cb698WQCEJ4BQ6d/eImDz6V2
	J7toz1X2G4pnftRZkjF+n0azieq6hbTXzL/dchieAWeLtq5YxBaegcpIs2vX87deDEeZSFfvITltF
	+jd6zLiPB+qprtdFQNSOXInE7mcWWjTMkg09uNSD9IWvd2ZgBNpsCJxZgKdHfVcSyS8lJBytDz0Y8
	NrmSJZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvR-00000003wPd-1b9h;
	Mon, 15 Dec 2025 15:55:53 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVAvN-00000003wNK-2Egr
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 15:55:51 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47918084ac1so37398695e9.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 07:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765814145; x=1766418945; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=kOczf6YadVTVs/TOFSbmNrQGKM3tTFaVE7tJjiuQYNBrW9HeElvlIzAp9YYnHjgOA0
         BiZdGc4NyDLoz1bP2lOJ0Vg1phl3YpCtTW8kRHNxSd2se8Vu1xw0gc1LwcOGgcFYXdke
         vYeDNq+W+lcVuCBva5s0XcFC9fwudK5TAcxl0Mw9oDzyuYn4ss0qkQqms+qPDleXnOCE
         95sCSqH4lvjk0TYDBZIq6sUAnsVzLlqodshOjeLymYKZSSXssd3ofVEkAscA2JtKzL+9
         nCXS7tjPZtFV2XOdDnyGC1yxIHuJEMgN7YNOnpXNlcT+wsmCoQVwJDYlqLrW1cGvRy63
         n+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814145; x=1766418945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=eCaQlKK8fC/o3M4t59DYA7hpcXg3v2ZKUI2V14TQoD6+XFH6/222Jd93W0/YWV9bKU
         W1hE6FTBvvM13f9UgE1R2LHmvWWVImlmn2yvZHxFmzeSXLiBz2/qQx948OH5KZY2PHLh
         SKNS8GxLOGlFXMl40ssH3uit8IUTfxzhbrV88LMnVpCrs2d0yiNZGYzvZ/6oL6kiB3fa
         qMP7Lf5+DQh+3QTXULgl6+FQyF0Bzav91FDSNQ0q/93MJhKRlO9khQ2vFtciQWZKBurf
         JAo1m+IJVo0UU6PmfAjP/xJcxShME699nHJXtUdKTcHy0C1cjOlbKqasbil9zqJa3oNE
         7J4w==
X-Forwarded-Encrypted: i=1; AJvYcCUi8+LLNivmd2zXXMvrUH0sXMY1PFRXECbqof4LQG+HfV+DPTVquRPRikp6Px8BoECpIHiSgdHfLws=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjPocrwwtH4Ry70ZClW8MsZhWCYb+E6bbpmPEUbziUSjIfFssb
	iZfRLGj5Ex33+aTHhjRD8/O6vVBfB3RGipkPuyZwFfC1KWU4dy0Bv2kuwVTmNmAi/n9Xaq9Lp5D
	91w==
X-Google-Smtp-Source: AGHT+IHbF5g/qKuRmpHM+GAghD49LsbXx/xK7SXqnMvdHcBGuemjYLFGlWxVDieA3a2+nNsKY+U8PqUPRA==
X-Received: from wmjv24.prod.google.com ([2002:a7b:cb58:0:b0:46e:1e57:dbd6])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46cf:b0:477:a3d1:aafb
 with SMTP id 5b1f17b1804b1-47a8f90d757mr122905225e9.29.1765814145019; Mon, 15
 Dec 2025 07:55:45 -0800 (PST)
Date: Mon, 15 Dec 2025 15:55:38 +0000
In-Reply-To: <20251215155542.3195173-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215155542.3195173-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215155542.3195173-2-tabba@google.com>
Subject: [PATCH v1 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_075550_990102_C44029C7 
X-CRM114-Status: UNSURE (   9.75  )
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

KVM selftests map all guest code and data into the lower virtual address
range (0x0000...) managed by TTBR0_EL1. The upper range (0xFFFF...)
managed by TTBR1_EL1 is unused and uninitialized.

If a guest accesses the upper range, the MMU attempts a translation
table walk using uninitialized registers, leading to unpredictable
behavior.

Set `TCR_EL1.EPD1` to disable translation table walks for TTBR1_EL1,
ensuring that any access to the upper range generates an immediate
Translation Fault. Additionally, set `TCR_EL1.TBI1` (Top Byte Ignore) to
ensure that tagged pointers in the upper range also deterministically
trigger a Translation Fault via EPD1.

Define `TCR_EPD1_MASK`, `TCR_EPD1_SHIFT`, and `TCR_TBI1` in
`processor.h` to support this configuration. These are based on their
definitions in `arch/arm64/include/asm/pgtable-hwdef.h`.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 4 ++++
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index ff928716574d..ac97a1c436fc 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -90,6 +90,9 @@
 #define TCR_TG0_64K		(UL(1) << TCR_TG0_SHIFT)
 #define TCR_TG0_16K		(UL(2) << TCR_TG0_SHIFT)
 
+#define TCR_EPD1_SHIFT		23
+#define TCR_EPD1_MASK		(UL(1) << TCR_EPD1_SHIFT)
+
 #define TCR_IPS_SHIFT		32
 #define TCR_IPS_MASK		(UL(7) << TCR_IPS_SHIFT)
 #define TCR_IPS_52_BITS	(UL(6) << TCR_IPS_SHIFT)
@@ -97,6 +100,7 @@
 #define TCR_IPS_40_BITS	(UL(2) << TCR_IPS_SHIFT)
 #define TCR_IPS_36_BITS	(UL(1) << TCR_IPS_SHIFT)
 
+#define TCR_TBI1		(UL(1) << 38)
 #define TCR_HA			(UL(1) << 39)
 #define TCR_DS			(UL(1) << 59)
 
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index d46e4b13b92c..5b379da8cb90 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -384,6 +384,8 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
 
 	tcr_el1 |= TCR_IRGN0_WBWA | TCR_ORGN0_WBWA | TCR_SH0_INNER;
 	tcr_el1 |= TCR_T0SZ(vm->va_bits);
+	tcr_el1 |= TCR_TBI1;
+	tcr_el1 |= TCR_EPD1_MASK;
 	if (use_lpa2_pte_format(vm))
 		tcr_el1 |= TCR_DS;
 
-- 
2.52.0.239.gd5f0c6e74e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
