Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3F5E77182
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 20:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7BL2a9JuF491J+dxSXLXG6DHHEXtLJS6CMoO0vepS8=; b=pDc59i61cbZxVE
	54MkpRqmUFV/eG8V6OvvMioNmOeVC/WOOpXQi9bvtQx9/t7nyEUwlbV3X82yJ+P17M6tTuvXKRgdU
	PZanflL2qqsfQlJeWo5PAN4dT9URtxAw0cMBn4WCnPerQotPy84riglLXv9cbJ8xyoBKtGitVr0Oa
	ihygO4J7hau8eIqKHJ4yj1sE02eh6yMzxITinfjV/9ctc0bY1ApQazWRPpv+CeFTQEZSWVaDVyTCl
	jKXzLZP7jJmZQfD62Ccjb89lqV0M/LhNWt2cJh7/oqGWoKKInVzieT889qwSYIAXuHQGAtZdcKRno
	fZZaf2+yypE2ghOuZ95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF7-00000001rwX-01iC;
	Thu, 12 Dec 2024 20:57:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF2-00000001rsz-1ajr
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 20:57:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21619108a6bso8551595ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Dec 2024 12:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734037019; x=1734641819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9bocf/te6xqIlX1+3PhmzweHiQ8rAPL41LYUao1zG4=;
        b=X6KFyyB3yf9fzTj4SN4TaM98YNrvrtfLPtfO5CRRdwbNn0b92/I9ITH7JXBz5OAkE0
         4JszwqpA1AvsrQB1BKVE0Q8z01TAeB4tGCNW8n6IfC7U9zBdu3+ZVpyiFQZr2j6yX0oP
         Iie2FP8hs6KQ+ydVwO+LIE3/ng3M2XGG6ceXrhLkgGRd7+7I47CLJuUcxVr3x+/SBAHO
         E/OJQFl4o/ahKApLEEZyztFvW0Vdyo9HtX8qV7CNE42BwmDHhrrgXlrVJsa4n43zWwg5
         UvtYeJnz8Ao4PI9ER2qGmeUwJF2m6Umpyi0invXbvIvfiaSpKzs1wQWxda1SPmNmWKKF
         IVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037019; x=1734641819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9bocf/te6xqIlX1+3PhmzweHiQ8rAPL41LYUao1zG4=;
        b=L6VJE4V8q8rspmUbfAE871vCDGosEw4MD93/3XYaGJ9WOyrVjxGqZ5irVEU9BbclLh
         Q4f4VQqTXGzTCh4mH98zwL1kuir618pt53jQcuVQ7+LMHZTf4q5t5AppCce8SBYX7CPb
         A11CjSO1cBnTTQ7kkE2vtClBDKAwsaIhVip569vwL7fLCR50Zr90YV2nfxE2MUZ0/vzw
         yH+AoghsRREgJfOjhu0gbWazX7PtRCMB7zS7TLdojGveh0Xg4lxHfj90AdSF6TWX+OIc
         A2FAohkNcScyPMKds878elw/+SqKMH8nfn84jUnW0s2kT7LwQ6BMnCvANotycBaj6ys6
         ZpvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTxp0nWHVp6MHNykGcdAHZLUhecqveGdKnQvXslQ74N5POrPsXYUdFfHCLMt8zdSkwZ5pVM9sHYSM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2u+mJq35PXzkCUDhVMcWjN6YjoG0WTTmS7jHYEVT8ThY3O3Up
	9gXrZoRO8JRCENqzwiaEShDE33GJh8N6TU8woyGtrTxSd89f8DYLirofrTwtTq4=
X-Gm-Gg: ASbGncufmlkLSyXvznc+lxNAh9pIJwcLAA3SQ7zGX32TNmFCOIm1rCcqjHtOSTJgVH6
	owpNTYznelRv8kDgf5LMlUlnuoYNKJ8X89HGb435z6vdUM68aNQgcZjNXeJ57tJ00jgRiFXJ3YF
	wpMHZQ0YTXXmeXGtfC+8yE47wMAqMUmWL0UkI0DoUEUuoCQxCwFk6LLavB2Irgq1xjfhxDtjtlG
	RZBcuhzW93UKN6nEPBsiSiEBf0oe8NMS5wCV+H4jgEJFVEW88aoj/1i7iLUkHxycXhLrg==
X-Google-Smtp-Source: AGHT+IFh1FwmitrjM9d4Q6KSLRToIyFObPTDHz3LQbh1hbARG5r4BQI4+oOsAfuzEnKREvzvjAp+Cw==
X-Received: by 2002:a17:903:32cf:b0:215:b9a7:5282 with SMTP id d9443c01a7336-218929c3a18mr2340805ad.26.1734037019285;
        Thu, 12 Dec 2024 12:56:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e53798asm94019785ad.60.2024.12.12.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:56:59 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 12:56:54 -0800
Subject: [PATCH 1/3] RISC-V: KVM: Redirect instruction access fault trap to
 guest
MIME-Version: 1.0
Message-Id: <20241212-kvm_guest_stat-v1-1-d1a6d0c862d5@rivosinc.com>
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_125700_425419_37F431FA 
X-CRM114-Status: UNSURE (   8.67  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
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
