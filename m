Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE329FC6180
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2KYSpZVvCtSp+iyWagrAgZHRLwK+DZHvdN7b6f9eU8=; b=i+SO0fHeEtYZIQ
	USKuPzfmsv8WdT94tg8EFw0xJ3swUlUkaXSaacLCyDP1VL7a2ezXRHUot8HVem9gdJtAZM7jij1dR
	e+a6ii7zdrrqIcGATr27P5bkq5IIy7aNniM66oxVD1QyPeMppZhqCsVX16WrF2+0JreT4QH2e0T6k
	IQhSHnMQUFUrf4/f22JIeBnGKyNzYKJDp92jyGrBcqoJQUXprst57gle6iNgRx9q4opUQUWexSYcO
	lsoeEIO5hEfmKaWfdyPBXTZew1v6g/B+nH+VM/NcssIIhiXT9m52IdwgkwVX8GVKhV1COVXqd/pKQ
	mmQdEyNNukly8qVXIdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Ua-00000009Qvx-3xST;
	Sat, 03 Jan 2026 15:24:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UX-00000009Qu5-27RB
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:35 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-34c868b197eso14261092a91.2
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453873; x=1768058673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbTfmd3NSnTt9lXFsPx3VDeaOg/UBFYzN+h8hVF3FMQ=;
        b=dSUb2n/KZq8wvf8TFZ/DfegYhJcK0TOqGm9eRSUVDKGSMwQBk6zQXaYQLaKUAjiq1k
         nkt+2fSY1EVf5CDlONTUJ/YPigLl8JGR9am0AZAeSq2YrOBt7DLZzfyQPO1x2OH74cN1
         ftm5deIALQSHNdPn0Dk8sjRDJT3N0aCbYdLO8egrk5slhTaRcaXVKg5SqjGcZ8W/ocYq
         4o1c4jXNL197qvdm4hnBUMPMqiT2Cpr8z1AKxtBWcYmNdvpNFdxVJGc12hMfxOfuTOES
         P1KKmPw4G8i7KKI7FsRQsbWmHEZTktZ0xuP3W+SWmRYV4V3Yefh7rI82MduGqjqhx5cW
         Jsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453873; x=1768058673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbTfmd3NSnTt9lXFsPx3VDeaOg/UBFYzN+h8hVF3FMQ=;
        b=nTqDAtk+VjWRzYNXyjuS3SnfcQNje8vcascZqEHbT8lSqw611MlpSBAoGd49s5kTXh
         /j9zdNGzSRzqg1GV2LeJ+myp4WohhLouW1Msm4kdjuQm0yWdTWub2VhAyDI52LQ6U8zp
         aHLfcYsJWGapX7MVSxxnFB7nymAchjZ9+dgqGnDfA2u/VvZTuPYuuMnywaue3bXDPH+1
         uYiiwHWC0YxhQrjXJjqaLjQN8JFbDAmqVxEAlr8IL6zbHUe0WSZM8sItKzGcnEuAcvGo
         o3mMJRwgBi1C/FHUtJOFCrqa8Sba36q6fL1rKpsggrdi7TrItVA7pIWuavZIpGboHpBI
         8kcA==
X-Forwarded-Encrypted: i=1; AJvYcCXtDPzidBvM0Sge2fovD1S3jVMyfvf/3EK57oOQ/Ouw3/3CxXVfBFokD5ephw9yeM4JpTCfV36nh+8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyR3GTdsWPDNYU+q0WmJ1kfW/kV1DdUbg4zdG62UOr++7/6XA+u
	PdCrLwdic4loPTWDbQob3yUJ0nAkkLdXH+stK2YljssAjitODhBSbf2l2XamUAV3b5E=
X-Gm-Gg: AY/fxX5BEq3iMhgMVefKLoB40Il1ZfS9jTlmrqsBJEnsSZUi12KeRDRV/DvkK4Luc3Q
	TyC0+CdTSzwAAB3h7rK2TquJFckp/vOogiuAofKPB2cWElmf2u5aBTIGzFRSBdRek4TWRcYozBL
	PUzPfFq/05zF5N94ulHykekUZPEisxlR8Y0U3HkjKwtZdOXX1hWowVQZoaK4jovF9bBKvsFRP3i
	F1VuABMhj+Iqr8jYQFsWJ3kb85voBU3WyvEm1jTXWI/nNjbRPHeDZLPdPiZBIYQEJDrEPlmcl8E
	CIwk7BOnBFglvAExV23f6faBw6c4ar//A2IOaRrtP8n2cBWYLagi67ZeIq0YEjkzsPWzpQWNXVY
	jK3DRu+f3YWu6OvTdBs0pjK0pn+/ert475hz1mmjzKjpYtDA9tcZkmGBr7WZbEGKSVqzfiuP2Z8
	V0jtu6JQyThMzIhlwWwyRymzRP8ZDjw32gLipip+Me4c5eCQK4lTR2LMkUoPn89RcM
X-Google-Smtp-Source: AGHT+IFAqFIt8xnOvelgL+iXx2mpTPUOQaCU3Q7/FdJxFlUC1bycD0YxqtWt/Ab1RF9sp9aze5LfoQ==
X-Received: by 2002:a17:90b:4c45:b0:34c:fbf0:fa55 with SMTP id 98e67ed59e1d1-34e921beaf0mr39991715a91.21.1767453872679;
        Sat, 03 Jan 2026 07:24:32 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:32 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v2 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:23:59 +0900
Message-Id: <20260103152400.552-3-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072434_452784_8DDE7686 
X-CRM114-Status: GOOD (  10.21  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

riscv: fix timer register update hazard on RV32

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 85a7262115e1..f36247e4c783 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -72,8 +72,9 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMP,  ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, (u32)ncycles);
 #else
 	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
@@ -307,8 +308,9 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)(t->next_cycles));
 #else
 	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
