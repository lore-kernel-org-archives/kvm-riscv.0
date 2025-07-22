Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E441C83F27
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BH4+j226+ahb8qaR41aGVl/Q1XUWBCWLKZ2StAMxFi8=; b=XOveXnNq1N0mUX
	3rWCuDHwGdVM73XqWRd+BFqMIWqUBhnvsJiC5nkAt4hk5OM/RDzerGnFQD6kuP+SDY/KUIk4QiTiu
	mORoAma+atg4WAQ86a+Qi52V7MhZrScCnxzTSH7JItWN02lQGcy8q3vtZ5Eh9vJ8sP+u95qPLYFUE
	FHvMRH/5K0dPPIc60c6H7FpKzkv/0tvpUlDpDLxNSQdipPcnvIkZrF9Oabn5Be2669qCN78AaQAVZ
	xhGDfvlL6NJUqDGdsY+ZD1Ox/h+hqPMtYfbLFCv07AdSIk7oHx3D8MGei7qJMPU61AWV1q8te6kbX
	Mumx7XGjaf4N+aGxWVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3qK-00000001Br8-33BC;
	Tue, 22 Jul 2025 03:39:04 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3Tb-000000019BR-09g2
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:37 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b31c978688dso2363421a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154134; x=1753758934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=mHFJTXrDxDuou91vK5bvtPiFbGFtQY99AwpPyQNqdwmKtG9/BgL7A3UCHOJNX3v1ub
         SjPNFSn/TGdupJJlUJYq+DbZt4TeQRT/iQvm08TicU5ejFx1aC05UGittMOB4hqAIJVi
         EybCeN+h+epeJ1Nnd8+McRNI4LuJJlJ/EWz3WWqTL1X10vGdvbtfNrRjN/GSwhL8PU2r
         AvZQEyq0/hIh6zLNFXsfV5jfZsur9oTsGXIVyfUirtA4GKHAUNzrBHNPI8JD+1wuZRxE
         X09tz8nYpW6I1D0A1Xn0ciaaI8m9oH6Z63rp+hxPryQer5TYGB06c0Xajg1pPucVwv5W
         w4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154134; x=1753758934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IczIPc9KHJgwzJvoZ8OSDmYG0jZ0892D1g8bhwKC07A=;
        b=Md7rg/12yBqgNd/5gHrM4BcIW5c6a10gkGExt1nx69t5Oi1tqS8K+dTCT/U6BvZWr/
         XfcpVRWe9rENnlvxZXLZRSMeedAO5WyWZL7UFt3DQsUrOzZqhtEI/8Ef1sTo6LjHuZ5x
         bQaMXzaVcLYUMNDWfvdohfo5wl5P7RjxDte5ZttUVKDLi0jn7zpO9tyu9zAdjG7pjdoV
         2PgnxQdMtDNliV6tFZQXqoDpngAg8QC5caW/u6/l428u/KPPms0aCvRl10O6dFaAdAeI
         vqXpZMO5Emv52CczVNN9+t4F87ybnDpH5vIZjS+r7zsCHjrxEAF/lTtrqj6PaU0A1dtq
         iPjA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFNIIvU9gGnO6UI7ec9G1YLMAhKdcbkvtXehUDmV5ObddJ3nsw9h+A2vt7SEO7FwQvBOypLR/37o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhOUmNKsTGGuEeqPMPdPKlIB56hw53eTZZmKT/wAA3ZXzW4IS2
	70HW8pzMXPrakDEH/yOUwJhP+ujytJOE0a8wwN6BHLT2IPsC83VBFbG363BqBqK7ORc=
X-Gm-Gg: ASbGnctza2UfEqdnQZMmQLG8oDHx0jm7yvnw1mOLwDfb9dUGcxaiLspR+/+GBKABiVC
	Hs0Qdt1Di/C4rEv68mi8P76rAJN8NZdAs9CA3XkaU1eQbkdX+jAIYS8iQmmsEqthuHaSGBLWkvN
	CTqaSyO4/nn4ZFz/GVFFxVFwxb55Esx2aCwOh14Ci9o1fzjUerqGCZFV8uRW7Blwj0idmnkLiwh
	jBPl7i5E55Kvn7eQXVO98RBCXeF81JYVGa7tn6SNU9YRBAnqgRYhoE8edHa/GUp1ANOkEGaoy2k
	x5/4tZ/kprrehBpbAIJ/BPjhj+S6mtM1JhxnRVZHH7j4P3TKaAb0VPloOXcV1uqyjiHqkI7NJmu
	hU5Tf4Ypohw7AWG7vJ+XUBAw7JLkqbm568eA=
X-Google-Smtp-Source: AGHT+IH3k/+gjr1r10wY69nF/zLNtmLpBdy2psVbdr40RupdADuqBFyStTW2VIXjsnxPyVZeQF0kHg==
X-Received: by 2002:a17:90b:1646:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-31c9e77cfe5mr28771702a91.26.1753154134478;
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:34 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:25 -0700
Subject: [PATCH v4 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-9-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201535_230217_D2B1A859 
X-CRM114-Status: UNSURE (   9.74  )
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
index 439ab2b3534f..03fd350ce7d1 100644
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
