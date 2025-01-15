Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF062C02185
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0NPAdc9h9rWb3iIgiBK5X/yX4g46jNpxGROPtk8F24=; b=H9a4iqjiRgYipV
	F0qUoA+VUiYBXH2Lm2fyddeeVyLI1e6arfcl8ZqJzvskPI58Toi5IUDPTtkbeqdMzoQ3bCJrKUl2u
	zCmNZf2A5slYJi7SJxW47SLdFISLN2yv8zjsDKIRkSY6Ebcn91/YCYVecoGI/MWnpfe9l4FdWl1sq
	quVdRanMllzFQQf7ZlQxEoSUEBYn/5lxDvKGjGsGbcCSLVYZBdUnOvDrUdYZ/GzDrTA+w94/t/wgI
	Q4aKVUimlwLf9vzMt+bY8dQ3P65oExCblxUccUA0yWv9mW8kDwmAEnjzY08ody6h1KYRqGD7CJbFu
	HsJOWhPLqkpEMknhhFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Mz-0000000CoCv-1yBG;
	Wed, 15 Jan 2025 18:44:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AU-0000000ClJO-2mam
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21661be2c2dso127640455ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965866; x=1737570666; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=eU2yNMxKD/j807Dtxo+AL6aNF+LSTXcCNsvZY9rlKoTReyGyQxJo7jvogOmA3cKsTy
         UtMSOUn4oRGqDMAHZGSdB8vLiQWdohAZ1iTsLlnEBAwf/0kBcTsM2ST79Sm8ZYLouaUO
         HgBobRkUGgKbT3KbrsuPnwGFradvZFc+tQh/B5iCkzKzq5wy4ZJQtI29G8BR9Staf7Si
         ZN5nzlL9kaztnzODPdq/4dEKUzGd0Cm8jhcTbppSSCKR1UyidIVSrsgJM69li45q/lcv
         5KDdbynu5pVaQgev1+MC0Z/t6UG8hhyuqkQLY4pGzjeShjZNNjVFlL17RKObFPEgxn0a
         4ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965866; x=1737570666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS1moOcp9ct9rXCWQSjf/GhpQtGR0rWY3wjXVfG0zao=;
        b=UBaCJFdF4hcB8efD2eSfHrA+PJQcrEarNP+mnJQCOqxB7vclwIexD3mwZHeHrXV5Ex
         dwvQFEuzXn0m8wyqn/otBcSxPbbRg/8Krj+evIkAiE+Jp7RdLwQ4o6mP4JJvvcVQv7rh
         T5Mh0vl/PUNHnj0CsdgIctQKfs7ZuuxTR4Sv4+iH8izQEu1/RrRkkvhiCe5QD3PIfnBh
         TdVIdnyXlHmosKe8+clT158ktAVGH252SABlPrNQfaFG16cg+gl1aP4hKgeKhpJ4gsXd
         Tv5AanP/7f7zDCRsULXTs8aumyGJQHLHqmEt2aHqLgfUxzv277h1U6i+b8I+iJxxuWYe
         7gjA==
X-Forwarded-Encrypted: i=1; AJvYcCXB6RHKo+AGkWEYZw+J6tMfZAo8n/F4Vs0ELudCvh61K3WTP1LZBrpqK+ZW+HiD2xvO7DaM6yzORV8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQDL1Vsyz6gdQrjEIQYQDsYz8RhRbTtVjcMkQbQdOfTCEJ2ad
	WkrhfagVBuzewn9aKEqQlfQRuvIcVG2Oj7hr4/HuYmT+jISenpl0kGUdGvD2xGs=
X-Gm-Gg: ASbGnctaUE/k7th5rAeIzz2mgpM3RrNhOLcoj4GQg7D85BUaAHqURNe2vlaWUK7M0OR
	ipsMRk1Wj7Ef2usxS2ljLjqiufR7GAXwD7RKzDj46fAqCN2TfQ4HubhtOp9yZ/teCixNa352HOn
	r8smvwm3PXPHe6sHFX6HWxl11RQPfoI6Ojk8b9VdfoH8T0hLs2D+g3UALQ4b/KumCWjn5oOkMr1
	9pHw+MAAUCRMrtyoUOv1TryxX8RzK7LWkeUGh2Afa0ylu8q0bwxhnAGGbORIBvju3hD7g==
X-Google-Smtp-Source: AGHT+IGUgwpGj/plYJTZ8pJ5gD95k5t13F6GWcCCeHibqJhYXgtv9S5eRA0RKAcOGIqFSWIv1IyJjA==
X-Received: by 2002:a17:902:fc8f:b0:215:787a:f91a with SMTP id d9443c01a7336-21a83fd1e96mr525986085ad.44.1736965865659;
        Wed, 15 Jan 2025 10:31:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:49 -0800
Subject: [PATCH v2 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-9-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103106_738194_1D0AD79E 
X-CRM114-Status: UNSURE (   9.88  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index b96705258cf9..239457b864d7 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
