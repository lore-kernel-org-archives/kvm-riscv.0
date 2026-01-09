Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2046D232EC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qPgCxqbGOo6/XMQPl4jGz4PeAIg/2fLdI0X++cawbdE=; b=PuTeap1i1nTesKDPMQa3rym24q
	ygh4oeTan2Jeyv8ExJPromSrA+CJkkSD6btvDr1F4MsMQz7ZntQwE/ePiNBvqSuhEVdr+tzBJ72tI
	WXpXuibZyJ7l8FgG8ovIgy10cdW4l8yLdFfTmmVg5+IXUGb3NE7JymLJ6V3G9T5PtLdwFKZdmQKOM
	mv3KvGq8XadehsAqJmRehXWadXsdCeiZd5xbshZ5hh0CWhh5Bw7fKMy+Dg2GiObVY4J5dKcTtmbVg
	AK9ZBUeG7JTMtptwGoVGPCkz1N1RzRNCtj/QGMN17lbSA2j9sOch1WoEav8Fw8DcTWfVCVCgx4dBM
	Sa50g5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lL-00000001sdT-2acH;
	Fri, 09 Jan 2026 08:22:28 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lH-00000001sVk-0X9t
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:24 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-430fdaba167so1949579f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Jan 2026 00:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946940; x=1768551740; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sYmtUt8Xl9FkSFC/XVvZCPE49zR2Dt2nIyVImhULnc8=;
        b=mrC4doTWnXWyRmazbrl0Mu9hRstuL8wmFsdcv34qtRYy/C+5Ddjd6TOAuwTOrIW96R
         HKF0tY301YcVci/joih9LdsyVK3IHvPnNX7yGzJQOJRLsYHINoqQZE2ce5WLWn2DVlp1
         qycG4UKONd8duVaMBNCrIkCo908h72M0kvV6Wa0+89oiOPiUzMnFUwraMpb6vH521VUs
         pf0zqypnnIXxUNj3mv9NpHd9JshHxpTXzxvp+ujuDWyzibIVJiDiiKj2k1M0ZPlY0LMo
         bHMuoJDHVMGiTSRriRMfGtKftnnjtcW0L52c7O3mEb3I6couzJEqU1QwsfyuuplYFRSf
         ebbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946940; x=1768551740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYmtUt8Xl9FkSFC/XVvZCPE49zR2Dt2nIyVImhULnc8=;
        b=CIGf2lX8qgqIlQJtZbZUY8n9wZNwB7EjJSbkrT2WE9LAsmfsIEyFox6Szp0KcIH7dQ
         bDvNsBSDPS3r6UAuqvJgisHvILSCiDHc8RiWJuBaYs6EcbZOiMpkoxM62xEM5HaKkA3n
         Uer+REBOo2DRZSNZZkGQiWb4g8eQyUp2WYgleLmmJssMd+OO1VjHeDp6+WoAuQsf1HHQ
         NypGBVPVLIy8xx7TZRI3fvW7h3DFSjMhQYGw8EWVcGo/LjzIUoEHUiKiiLzBBFWdiW32
         RPDU2ZEySbiAVZR+s2xjJckIJvFc3WqvHUgdm+JLq79vZhNs+rM6lSRRLG+qqicHOaAo
         IrlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIumXwiEU4AQVYJL5BKkYKtbLBSW5w5JmTTCIgUmQuWxYF2EUA/TB9Pvh8R58nZrhb+WLJTFhFiSc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjL6JsH1dgHtnNMOYudB2lDh/01z3LMx5ap6u19bqtrXnjdQ+7
	6TMjvk1hgE58A/AzA+KAljMm1udMNAZPz7TvLRL+xmPvldIXm+lmAuIhaUnFywhZL/In9GUMsTA
	yrQ==
X-Google-Smtp-Source: AGHT+IETB7LrDsnfiW2BPzlfWyDm7NKj1+DX1BU5/AFEdV7tYtJ3d8mxv/c+jnVIsPQwWb0Tl7EWECUx/w==
X-Received: from wrbgx16.prod.google.com ([2002:a05:6000:4710:b0:42f:b666:90bb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:26c4:b0:430:96bd:411b
 with SMTP id ffacd0b85a97d-432c3775a8cmr10939156f8f.58.1767946940503; Fri, 09
 Jan 2026 00:22:20 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:14 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-2-tabba@google.com>
Subject: [PATCH v4 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002223_181762_A39730B2 
X-CRM114-Status: UNSURE (   9.35  )
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
Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
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
2.52.0.457.g6b5491de43-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
