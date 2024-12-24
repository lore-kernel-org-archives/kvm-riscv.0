Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E26AE7718E
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 21:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjxaqrRYBFLI8WyV8rpI8Fp+v+uD3gxoErfT5zPsFrA=; b=lbm/39bLT+FIJw
	kRCD8FFKBHzprZ4tqQwXl/YDcHypGFI9NphGGNahykI75OPeO5NNMlms9rR4kLRLG8tTMbeyEyAso
	gLYZzKHPkgwbviSB8043AG5lieubhLo+LA05GeznNL7feJwB5c3lA2qY4XwKBo4i2r8jX6aa2k1bm
	X4dxYwA1DRp4kBOS1N4IBCb/si746qhG4KaN8KNNWUGnq+P5COvG+DO+NL+irJ5OqfRwc2rQc2L7L
	GY1MHp0WaOeFaWnGB7+5IiLABDMERfiQYgH4CPHq8qz3KVVw4/IiQO/6ZT6XoPszO1miP0k4lXatu
	827Hkfw6eFdnZ+76nrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5Q-0000000CnU8-0BaK;
	Tue, 24 Dec 2024 21:05:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQC5M-0000000CnRA-0NSF
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 21:05:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2161eb95317so59176275ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Dec 2024 13:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735074299; x=1735679099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7Pb5Vxtmu1FY9/J9EKk+mhOADazj56h0vKNA3c2QKo=;
        b=zLQqCeTA8kG12fOAPvFCvR1bGqL9AI8qTX9ic4wb7/Np/2oc30/PeLMcQfszohurNu
         uq1Xc1xt33vT3Q4Rx1GBJdg3SSXzdh0ecz47LH9L626nMI0rE8rBAFLtgYrNh90dL6Vd
         aSf+lCZBStZ1czE/x6qr36tSWdzIaZzacEspT99bkFXj/V7Jeo/t3Q3XcbsVKxuHFVww
         Iah/dHPrj+cEIGetq+XLvcn6jRh3djep7jOqWstxJ916/TiR8OQ9W2YedtvBBd8YzTeG
         I4Ihd5lmdaUljIc5IME0T1ZiA9TwbMkGgnLMqTdfrBUIV4vc8USfiGR7dzMc53WCk8jB
         +E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735074299; x=1735679099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7Pb5Vxtmu1FY9/J9EKk+mhOADazj56h0vKNA3c2QKo=;
        b=g9TCmG4EXDZwijQok3/2h4lgSWjNh708QUzWD+GdYzfrMcEz0IdQuyok7jn/A3BvZX
         kkGAcHNGdByOHe51yLE0BLLQHImSkI0LWtRKlPWmf/lj9AU+Z/PNGDBBFISuFTC6SfAl
         etb6LUNCTfiZIotsYhcGmvA0RK2sA2coqEWcvmIwK7ucVPdlHvGV3YISDOxGhvTyqN8s
         h/4MksGw1PywfkJZLGu+bETId/YP2zxz0Sa86AyeVblvOfwcbRtBp4hZG9foENa64Xf9
         ImezJBxqaacj7yYjkuY+7c1eK8gF1+Y70wM1nY/mYTl3JpJ5KeNzY/O4OylNanay7QEa
         xpfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgkjYkzFP57wGmx9b3zglq7HqxiHPrKfRYohsLanr0seYz8JxP/NlVGJzxhATLfHjaepdWJcY8gzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuN5UJ738wq8oX23H7bee3SsrT/FFEx3T0gnL+hd8hR0vPS/su
	HezyC28ggkdxMbxAzX8zE1Bwd0oVg0drFBZN20bLzY8A9u4Gl0gh90enXwSGxP1d9BEH5sz2jRb
	A
X-Gm-Gg: ASbGncufN1gdP5yTnEDzDT6cL5ZuOBieUx+sdkBrkmjVuWa+ulyXSg91YHuKktfOf7k
	P242web6PnX9GK4sItmq7HZxbnBRfFtBSZYNJqjK6Q0dg0nicf3nWfTleJUW1m10f44i7NmPhNS
	p1YoXfNmlGl+3NDlPi3XfWPw86ALBHCYoy4OI2oilFWNDCD/6+8rjXnW93tjJk9oVe80J7pYbIK
	K8sP6XeXyzHe27PIQxInIrgZxvpMK8N4XFw+C7T1MSo0c39JWa9acNnAQZ0gtJgvozFVw==
X-Google-Smtp-Source: AGHT+IEINBS2wMAKPXcEeiQvMr4mHt6N/s5a4KNXcdkRoepKl+xENIOeQWFga5Ts/3lf9tV+pKQhqg==
X-Received: by 2002:a05:6a00:3905:b0:725:e73c:c415 with SMTP id d2e1a72fcca58-72abde8fd6fmr24905523b3a.18.1735074299238;
        Tue, 24 Dec 2024 13:04:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c344sm10445925b3a.186.2024.12.24.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 13:04:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 24 Dec 2024 13:04:53 -0800
Subject: [PATCH v2 1/3] RISC-V: KVM: Redirect instruction access fault trap
 to guest
MIME-Version: 1.0
Message-Id: <20241224-kvm_guest_stat-v2-1-08a77ac36b02@rivosinc.com>
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_130500_138451_AA9580C9 
X-CRM114-Status: UNSURE (   8.84  )
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

The M-mode redirects an unhandled instruction access
fault trap back to S-mode when not delegating it to
VS-mode(hedeleg). However, KVM running in HS-mode
terminates the VS-mode software when back from M-mode.

The KVM should redirect the trap back to VS-mode, and
let VS-mode trap handler decide the next step.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index fa98e5c024b2..c9f8b2094554 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -187,6 +187,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_STORE_MISALIGNED:
 	case EXC_LOAD_ACCESS:
 	case EXC_STORE_ACCESS:
+	case EXC_INST_ACCESS:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
