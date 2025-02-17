Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66915C021A0
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YH4QFPrwHlXvwXaZntjtukQeVAkLzJtmn/Ntr5WMltI=; b=ehh1CH95xibnaT
	EnxeEsWSE9N+JuVY30YmqeMkNcBZsCXe+JT9PUYPbOsitVTeeXMD1Z2fzIkID4df1MGeuaE8rkWp0
	ITRjVQ+uyBbM7qiSzvmjD+BdgX3XHPsFMdL/shiMS5IFphhv2C1qw91uoM83cdDY74PuTNGelzwb6
	yq0oDNp1lRtSr1sq9+8txVW2V/E1uUtO/ufwSEz3kT7OZZSEw0YOtiDX30dkBKYonV54DB6TjSO/G
	X16sEX0/OcMCWSOW7KcxlX8AQOqnP9M1Q4b5eVHcEEPclqWbMyz9UaF6CTuSTV53uL521+AjyxXhq
	gIaXQ5MTSxa5l9KMsauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkc-00000003nOO-0jh8;
	Mon, 17 Feb 2025 08:45:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkZ-00000003nLI-0raF
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so4454524f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781909; x=1740386709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmOiuBasU6JQWrtvlHuH5EGMnpuZux+G/rw1YW3ZnKQ=;
        b=iqE38VDPriJ+JoIdAckv0hcOr3PSVj5jtcMVyOILR+jGtn6wbCRjI/aHbwnVOHbWda
         v0lCxf36Lr6SUV897SfbyPzucGySlNsQjOPDldlQ7rdnhdZCn78zzT78Glj9hJFFeUEo
         vEDhLxUJ5R1AOaK1HuX15a5eQum/i0oDsb2N+c0O7JFfZ5FcllSucTSAumcIL+72UnDu
         hsVHm6eMLIjdEu2D7E1t2+XzuC1A1cOHklteTi2MP2UZxprHaTy6ojeSLUK97YDlbdjo
         RyUZyjaKelt7YXQa9KMeepO8kjVe8KL3x59grUc/tJKz+xNfPP7w4qwke4XETpSuOcWt
         +HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781909; x=1740386709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmOiuBasU6JQWrtvlHuH5EGMnpuZux+G/rw1YW3ZnKQ=;
        b=fYe2I1pq1f7ysbfUUDiQ+cs1xrRMs75/zaK6jIJjsm8kJGp3zd8tBf06IvyqmVFQwO
         JQnRQxiJ0GfTNiROYHkmRQx//arbMYdNCI+fJJ+hJmE541/2FC4Goqoa0I0/MH+K3qi7
         bADaFSea+EUFFIelyGOGTslgNC15g31wdRk3OJCsEtJjms88tPQwVZXTaZhFgeFzRrNc
         62wz2jDsWaTrXOgJRiZq4tP6rX+w6d3xFwQQD1z1aJy0Qg/VP28hu859hcf89dBLz9u4
         lFG8D7LYF4rNOfVnOejUR/LuQinv/9zfDPIAzHaP4Tmk8t5nxW2oO056fVLJoTHbKg/L
         BSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2bgun5CtSGObllSYlRTwfs1lLVJ2tbHFwEe6Wmp7Oil9SArILTjA4sNIURQW925Pah3nf2L4e4D4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEaL+wlPN2AS7lo69+PekyCV0uIU7/E3Sc8ZLR0J+6lL/S8a3W
	Bq7W/RlIpcrkyzv8cF8+6MNqAc53Sqok5AwsKox+ah4OK1/2F3jIwRvoZhERG/w=
X-Gm-Gg: ASbGnctxuZd1rjCv9av0mC5Qrm/Dlp4xy7r0oJb2z5uUG+ChyapwGdFP4G5dqcZHRMc
	ON06NgEtIMBHTQEKVCvZN2kFRCheGjl+Z+FijQj401ZOQFc+xsqAsqdoK3FXHw+5VYbljuEMxRi
	LzqOfYVlkS9yKNaDm5YLRV+1xU3AFi1H1tFvXLng1admsUJqgROhwb3k8bzcLx7p86+D+LHqr+Z
	AAywtD6eRJtZv1D2h3DURk2PLfKUyIcdGVQEh8nPV5ZHWjA52CXbDYIRaGSZsNozwGS722Zeru8
	VVQ=
X-Google-Smtp-Source: AGHT+IG4XexX5u4a9ST4SKpxQS8lH/aGBNXid1q/a0drWF3aciYyLxMBoUybxw0lIHE5NbqdkQOXHQ==
X-Received: by 2002:a5d:694b:0:b0:38e:65db:517d with SMTP id ffacd0b85a97d-38f33f5107dmr7035502f8f.40.1739781909479;
        Mon, 17 Feb 2025 00:45:09 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f8c4bsm11630555f8f.46.2025.02.17.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:09 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 1/5] riscv: KVM: Fix hart suspend status check
Date: Mon, 17 Feb 2025 09:45:08 +0100
Message-ID: <20250217084506.18763-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004511_244405_65D4C927 
X-CRM114-Status: GOOD (  10.76  )
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

"Not stopped" means started or suspended so we need to check for
a single state in order to have a chance to check for each state.
Also, we need to use target_vcpu when checking for the suspend
state.

Fixes: 763c8bed8c05 ("RISC-V: KVM: Implement SBI HSM suspend call")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index dce667f4b6ab..13a35eb77e8e 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -79,12 +79,12 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
 		return SBI_ERR_INVALID_PARAM;
-	if (!kvm_riscv_vcpu_stopped(target_vcpu))
-		return SBI_HSM_STATE_STARTED;
-	else if (vcpu->stat.generic.blocking)
+	if (kvm_riscv_vcpu_stopped(target_vcpu))
+		return SBI_HSM_STATE_STOPPED;
+	else if (target_vcpu->stat.generic.blocking)
 		return SBI_HSM_STATE_SUSPENDED;
 	else
-		return SBI_HSM_STATE_STOPPED;
+		return SBI_HSM_STATE_STARTED;
 }
 
 static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
