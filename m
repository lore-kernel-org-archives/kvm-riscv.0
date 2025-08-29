Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14F7CA0FF9
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d72MAyh+mfM7AyXTL7Z9N1WG5o9tsxN3XH+IeaGptzQ=; b=1IXC+gaJEw9fgG
	N+7i5Y94UJbPkkKUna6JqFjlTY714HQoKgHqHDYe8LVPybYtKvS62b04xku4orM22T9tEL6MGep89
	01dmUWwqwSbfoPaNBKji1PyzVqxBnQC9MWPCZ53IAg1i/FmkoHYaOCWKTz+x6rH9DeoUxNCgId0W8
	74diTnllgW2tZudQ4hAHFN9ddVhFht+dS7BpGRLNLz4KBEPJ8mdhGcsIhmssM4kTYn3KI/L7CF7WO
	TDgeiboLSkiS7OSkxb5TkESRPZb+UJ7TO+PvpUt9Jk3bXQ+EFFArXgFjmyv0+q3M0nyL30wF7oQQt
	VKQ1OCYzUmz6s9Em2DhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ao-00000006fq6-0pES;
	Fri, 29 Aug 2025 18:50:06 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0IF-000000064FP-2hia
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:32 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-771ff6f117aso1953017b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478491; x=1757083291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=fDDoyj2xTwA37BTZgbu6P7mMiQIAy1EpSSpBUyIGhs0o0zDbJNGpA/PBV2AW+1Bq2r
         8mJu0eTsOOpjsoaM/tL2XshJTR3WoszuNJDWqoCAtgQa03/0JxoieBZdGEeEzx2II8pm
         JmiF36yG8EHtS7xUjPofv3dHh/ydC1Y0z8xOwQZQ8IvG4rHAEQjH9Ht/3Nzq5bbbAr/a
         EvSkNNesRZci3kLfQfpEW8bN3tpKjPFJD3Ul/YaBSCquPq2fJOw1b61DevQZPUCL5KL/
         iq1vUgIRNPZNbbRhUYLJcNH4rJNLbwj1GeDBfX4kRV7wn3HLwJubUS3gCDb/1NPidTLV
         ctRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478491; x=1757083291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRvT6lW8SE24T6disqBtYa/lDa3Uh1O4/DOC6STqtSc=;
        b=evQ/qskkIzovnUiaajurykBX8mNqyyIXqN3XC1LNM3TBjPeTlnCE3ccssL2mXbye0+
         e+rZnNErmE1OsQgHvTFvnz9cjIk7/5JQNmo0Y2YdPnuShYZkshvzroWI5A1n9qsafr3m
         rM6mir3FsBRzNsJzoLT8ATxBMgD9/tXymyY4Q3M6topRPmqd+dOx2ojrsGn7oKmltfjo
         CLPNNvfUBQcvCHWAKAEDcXXHxzkrTOI5IKe+s9I6zuQ99vzE7qF1z1ugnr2BwFMcZBk8
         Ive0DNgD0MENfV6JHKsNBoxpLKxjoVYInTwWlSd50klVIwKw2BZKQJNmtEb1ofYzm53X
         Pogg==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ew/agH1ClR8kWDZkykhp8AtTcHmlFAlXSUhr06cYEl/KDbSryq+cV3JnFwS7nNr718CVMQYZL8M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMu4U02z0oAsSDATeUmVkRbu2c3Xfm2ey8LUhdcBYfnrvTKOya
	YBwpc1tKHg9fYMIp2X7wmKvZiBuf7nySvl2i2mwE3m+n2H1zOLLNMcCt74VGnCNiQZg=
X-Gm-Gg: ASbGnctPO5PcT/DjmQURRwKQzIa3mIgf1FzrzZ8E7uPwu/sVd6Fu13e3hAZOlZjCTIT
	0fSx89DezwwEwdUpynbjCeboseDufkLBUS7ifdmIm6vXG0P4dqdXsFkbVKBrZMjTJKrLIRiZ46l
	Caq0khYzI1L0Rnq4LQ9ZL1mAg7k1VE4oErz5QjAQN2h6qSM90ki+Jhd/mLHjRfgCnOCTbaSarKD
	qiFT1ZoI1B9C8Ln+BZfIM+YzhOsepcKu53EsMIiGyYXtSG/YO8rNHPWskIl5zLr0LeFV02vVQik
	e014em56UE19bdbxyrALZptov7laKg29deGuUbUazRiNTnxoF7MUmS312R0iYnhNqLtqIl5C3+A
	egVhP1EXZT5K3a1K/ozOZojBrTBUIWYTismYdUQCgDfBcKA==
X-Google-Smtp-Source: AGHT+IFDBhv3MLTcxgH+II4bHiTtnlUQ3Qi3MwL3+YWiPJW3Bh7QRSHoNEvUKcz9tZC69e4QqkawWQ==
X-Received: by 2002:a05:6a00:9a5:b0:770:374c:6c55 with SMTP id d2e1a72fcca58-770374c6e1amr32573308b3a.31.1756478490940;
        Fri, 29 Aug 2025 07:41:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:10 -0700
Subject: [PATCH v5 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-9-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074131_691243_79205D01 
X-CRM114-Status: UNSURE (   9.69  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index d678fd7e5973..f9c350ab84d9 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
