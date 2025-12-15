Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48492D5B84D
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Dec 2025 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BQCvhdW2jqH7ZT4yFaI3U620tVTqiPMpqe70H8EM1uY=; b=4tkV34sh+Vi0EySXmMCoWw+VF6
	+fRDQRGoGR/YFjO3dPCPOsoUoI9Oot1fcj1ER+BXNPBuhvTgclG4+awoUodN1tjln++VpkR6eDSLL
	6CfAXc6QzMZex/xBU43NvEjI/Qfyl0PVtmds17AfQrVxMxcZspcZ84hzfJRZwrMi9wS4p1FIkrXaa
	XjZNIZqUa2+5D/YIh0B0M8JINhH7xNpK7847JVFVs7Q5M+P0DDTcDyVTgVHH3/751gjooR/lGd4XQ
	BPpGCCsWtJD4e0a/nD3Tpj8KRV7rsPBFb9Z+fXlw4EIZeMWr3cH6w1u5sjS0ZjmRC1CwTM5sru8XS
	ubVUtdEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnp-000000041eq-0424;
	Mon, 15 Dec 2025 16:52:05 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBnk-000000041YZ-2i2l
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Dec 2025 16:52:02 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-6495ccea18dso5258816a12.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Dec 2025 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765817517; x=1766422317; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=oKLrQbns/kC7DsDm3lGZfJ4TL5Kyd2FywlQFTIVRFkzEJtFImd5rj29+OIUzUIqIc3
         A8l/4OUvdyz+/ti9d6GmUNoA+fbnzeYlg+s8/63E3JUzYEJ0XXcGOEb8YULHFdzDqHMM
         N3P2HRqIJMKZpI0Q7+FOha/lrMOHTIIx/380fUmhPaaumf0T1tL2/C0HaYckmf8hnxUe
         Xaj/ULC+VmWQkvIJMr1mg1uSnLtwovXZWQi5DacyYEI+XXKek/1si1qCk5ZFv5N7nHl7
         FRWUUcEst4L06OMeVZ60VKarw9lR+vn9zNN78PtVuxDbv/eJJibv+ZvUhJOQU+IwYUjO
         a8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817517; x=1766422317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkHSL25koHVDTaMmCRcby8S1CrLCFqcfDXkn0dsUTFg=;
        b=l69WyG2t8DRyDF8R7JwjNgOu/beC5F+Eo1Xf05hpn8h6QGTReMmU2FUIDY2ITiZqvm
         MRFgg1d1urPQbbAbV/CPOfCny90q36we9DqOsCHe3hNNSk68J/vQTWB1MHr7BhBvgX5t
         6XFbhKCLNrejYV9jGFSVNTIFZxxy5Z+gG1hg9iQNuTlWTdPz496FOcfI/a6E+rCrcofJ
         tLSLaNoIEPDAaofeT1pBPAXF9HCNjXl+6NAVkNArXUaHfSUPVWTRsUpsnWn43JRASbMg
         sK99zb6GtvjWmYqQrbsG1pUN6y8ZMALOuyCrR76sKjw0StspmHD4VEt8fPlWFVMP1ODn
         SoaA==
X-Forwarded-Encrypted: i=1; AJvYcCWreK1wfgNQxygPRuutYEuZh3duOotJrKfz4O64NksWytaonJuXj/YJGFHPxXhpm/jjmPNBj8sJIaA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1gZ+liZQQb61Ju6mDcAUZT8uq2s5X3JDFcwasEdPrdFHQWTmP
	w4hLDmCpAvYGoCl9uSAJR2xKKOfGyYVNYSioDr8RDLJmusoePipak/0im5xbu281cwqBIcO0mYR
	WGQ==
X-Google-Smtp-Source: AGHT+IFrHxiEYHDjT58c4YVmrMD5eO1DrDlCmV6f5ukjJAbXvW2Vssi5+5Lw36DE9YHOiX+0KsCF3RMJMA==
X-Received: from edbdk5.prod.google.com ([2002:a05:6402:1d85:b0:649:1567:4ee3])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:d08:b0:641:8a92:9334
 with SMTP id 4fb4d7f45d1cf-6499b1301b7mr10482727a12.6.1765817517246; Mon, 15
 Dec 2025 08:51:57 -0800 (PST)
Date: Mon, 15 Dec 2025 16:51:51 +0000
In-Reply-To: <20251215165155.3451819-1-tabba@google.com>
Mime-Version: 1.0
References: <20251215165155.3451819-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251215165155.3451819-2-tabba@google.com>
Subject: [PATCH v2 1/5] KVM: arm64: selftests: Disable unused TTBR1_EL1 translations
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_085200_695214_09ACC624 
X-CRM114-Status: UNSURE (   9.61  )
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
