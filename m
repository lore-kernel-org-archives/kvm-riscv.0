Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732EFEE4EF
	for <kvm-riscv@archiver.kernel.org>; Sat, 28 Feb 2026 15:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bPwFSksSDAAC3Ps68TXF4LjHY3xgoBG+4zsvzBW8ogw=; b=4KU/bN24N34o0X
	MWjmoYcTNOq4xLBJUbREBSCZCUi/X6Ka6MpJpTLxm228kxoUYC0F5xc2MLgyNtp0rdw7KBbd9xs5v
	GP6ZQPlOhzuRTxnKaJ53570HH6K7cXwocqTCCGdG7H+XmZfDctMyYm5Qh0H0OGP9G3HbgojjoMUPn
	C3o6aCUISQ7H7zoGm10KaVcYY5x59pP/S0uPr5S1xxm5ah1e7mcxNiFt06iI+Jef0cySwZAy2awps
	et3DuirT9YXoB6sPKKcZWmharyojdSXcIzAOK1p2W7b/lodFiBmYWLR6tjrEgVgpLjRd6dsEhjRxh
	BsMds3Bvir+3n1Cqc2kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwM9c-00000009zQm-1jTX;
	Sat, 28 Feb 2026 15:22:52 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwM9Y-00000009zQ2-2kCV
	for kvm-riscv@lists.infradead.org;
	Sat, 28 Feb 2026 15:22:50 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7986a347d4bso30370757b3.0
        for <kvm-riscv@lists.infradead.org>; Sat, 28 Feb 2026 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772292167; x=1772896967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8gJIyL9AfQkuFfPNEXdWTtLgAIKWa7r6TpMrqBv02Ok=;
        b=C58YAE1H6NmEI1FPm4RsVpuwfvyfLSutC3CIB1Hs5AO9BR61TqPN8jcZTTRqXzp8Yy
         sLcuoySJMvNAwXbLQ/vClA8dLX0rkndhu+K0n/AZBAVc1wCkP7ZRc97iygGPBafqhbe5
         4f/6ATO2dS4ksDlopVSBISkTB5uTLBPLFxVu9lSycb4dlrlmzn6Q9TtWjmPw4BVan3+y
         p7fSuAbBvKVg77Ut4wN38wFUsrT5Zri7LXXb0XDuzx1PUEwzeT04f918NxbWDfPkLage
         b9j7QHyjZ9+Ce+wwt83PpLiLTUL82OBTt4EuD8K4XT/3gW715xymUJjh/V0/F+q8zzJh
         qaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292167; x=1772896967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gJIyL9AfQkuFfPNEXdWTtLgAIKWa7r6TpMrqBv02Ok=;
        b=QeqtIBY8YB9mDX6pTgy5t6GBFdz4vupJuQmRMoo/aXXjTWX2K9hvMDOoe2B6f7tOD7
         HTUfM9bXvdcHBwCdt+5Pnj1jmZFU8im+hpoSRkxGPjZzyJppx/v7Z0S1ZN551yjDASys
         xuDj8lkv6P2AtwvzTwJEObd7D/QbP0K0ozZBINpS+p1ZwpFt1DMq57d6+bzt9Ilu1W7B
         np6fRYoSIA9GXyW6c9pNIoAXB7cf147Uk3JJt6Rt4IuZMfayrCJzmVkQCKkQR80+as/4
         VfXQgs2Tm88fmqMJT6CQf5zvaDCjAY9hlYqW58A/u6B2CmxuJpgdwiQKeyQ1plVkmH4k
         DnJg==
X-Forwarded-Encrypted: i=1; AJvYcCX9+jufmQq5hWw0HZLSX2dcY/FcWTZuF7NstEpV2AXuUEOBSVJJh7Dpt5n5CCwvU0+0sMh/Le9eI+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUOQi6puvivVHYD/30Po0lvRM94CSAoy1nwWQXjJy2Qd2I5IO5
	WqryAmF7K3o/lVaNcW9JhDC+OgfD0DE07GTfcmYgCj1M3kEFb5neC1H8
X-Gm-Gg: ATEYQzyPJcldoslJahXwIRTCY+VrYyFqNpaOqnPHcfi/MLegRlaQzcGAzLO7o32dhnZ
	NgfI742vrNSR70VGuyJfRJsxLuQCogFP63uxjX7kcDyT/9t8/qVAQp78VmCF+RU/KGYlaBjraYH
	CtKy+0ok1NB2Fzpg6ILbCyUubArmLT66Zj/XDOlWLiKkOOPILc5oVub7KUaTRIpZyUS5FNVB982
	FYCm0fhYKHthAfcxAa+9SBHM1yeGM9IibQJDFvRgx/Kyow9G0W7Bk1r/VZOvwDMpWMZl4CU7vc0
	ecofcRU0T2Ca2PpMqRyImGVig1N/JQRmhBcQF2uLoMEx0bLdC3209eq65YLUqD61d4w4TyMF5vG
	pXGtOOo1+WxMQsnGkQkoqqPmNKgPy35gItuGwWVKB0/Um93GyKFUI0kWKf6uspuusXi2BCX8MRB
	fD9bVGPj/cHunivOP6U3AnKRx87mpKl8xY5snPgp9G5Low3mDSg/ypZFPwEsZVVIVz5Xp37+r+/
	gsljlYjq+tBU51fF4aob9oZ
X-Received: by 2002:a05:690c:1b:b0:796:74cf:df0c with SMTP id 00721157ae682-798855082c6mr61686407b3.24.1772292167012;
        Sat, 28 Feb 2026 07:22:47 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a92039sm32861897b3.8.2026.02.28.07.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:22:46 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
Date: Sat, 28 Feb 2026 09:22:26 -0600
Message-ID: <20260228152226.2116895-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_072248_701986_30FD6B8F 
X-CRM114-Status: GOOD (  10.65  )
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

The array kvpmu->pmc is defined as:

struct kvm_pmc pmc[RISCV_KVM_MAX_COUNTERS];

So, accessing it with index RISCV_KVM_MAX_COUNTERS would be
out-of-bounds by 1.

Change index check from > to >=.

Detected by Smatch:
arch/riscv/kvm/vcpu_pmu.c:528 kvm_riscv_vcpu_pmu_ctr_info() error:
buffer overflow 'kvpmu->pmc' 64 <= 64

Fixes: 8f0153ecd3bf1 ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 3a4d54aa96d8..51a12f90fb30 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -520,7 +520,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 
-	if (cidx > RISCV_KVM_MAX_COUNTERS || cidx == 1) {
+	if (cidx >= RISCV_KVM_MAX_COUNTERS || cidx == 1) {
 		retdata->err_val = SBI_ERR_INVALID_PARAM;
 		return 0;
 	}
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
