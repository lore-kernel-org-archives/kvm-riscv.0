Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1637EC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lzdauj37iK43UzER87bB5leSJcqNUxf3BFAU9+ESBU=; b=2Vn96s+TMEX6w9
	/NpGFSa2JyBLiu5I5XXvj8UQCA386aQcZvrQBAwIhrqeLSRW2aeTp+QJiNVsw8t9a3/NZpy2RMdWD
	Q2ysooO+76TTidNRpLG+sz1gIqadIATl5+eQe1okmg1+dhdyCfIlNlSmeudEN/87FbxVDRn8o2uBd
	cTaSWL5ILIgM+a7v4zGegLBlP5XQlv19qQT1t2Hu7k7hpI7Oa6UzxSgjRiD31XXJgk08STOLMfGyd
	caqSEsm4T/td7rra3Cj3/SgGFjbrMaH0zhet0uvgbZXPTFz+ylOiEJFKdBYbzkcwwL3XSNlvtPWG9
	TfAMzxSQBdYoAEIEyzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMj-0000000FXQn-3YBL;
	Fri, 13 Jun 2025 06:58:17 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMg-0000000FXOB-18U8
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-313154270bbso1950078a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797894; x=1750402694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=doXJigJblpiyOBg1+ZGfDVulw4TmTaAz7NofWGf2i9hzSX48JSLiu2cXthzoju+MoS
         Fpbcj3n0J8Ge4hpctyA7UkTCTC8ZEINUN9kj0zlWaA/p4ny8R/wlkRLcvHAbHZRVjXuu
         1LINuRBV7Vwp/wn10bIWPQIQk/lXExNeZOdE53/60PBrFqMwgVXWEXKwnFYpgWjJfri7
         kW9H42sKeD9RkdrkAPQSysP2kzgKNr9mVD5J8/Gpu9EgEAXnoQf7rsahpVPIBvpMIzAU
         UY9TbIvlZSEDPXlMAF0tAnmFZLEIwL3D5wYzYTMB5cWADau7ukH8/JlNlX7IK76FJlFG
         8vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797894; x=1750402694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=kLStEsH0UuQMOpy1PxkwNbEQtU3JfCPSrCvP8rcXqb91kILsValmOG49vM/dWsIZNW
         brXrY2tRiute/Ru7C/4wwl3htb3F8mcqsyJPZ9PD1iksUsUPMsoCgbdu3cW6B5qMv+7z
         4RPvWsgVamFlzRJzVTMQpJ/43y1lObsnkq+pke2Usf65+Yfq6/yN67pKQKmTP0ZQ86Ol
         VgvMUt+5xgwSPF2fKdAcysMLDYf0ViTJuytVMUQBmkbz2upCy23YN8almq3vCQY/G346
         YDlm7nw4K2gjlEEejGm5gvPNMOj1i2EnzhGO8nMSeeuL4Vbs8MrYQeuZ0JJsSBTysG0C
         hthQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV6pyzmHG1e3FEekxlvFs/ojPbJ64p0UEFVSf5nZYfBhUffeI/jzcPXpSpg/Ilumbps39f/i868L8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg1cbLKwq6VxemBOCLW+DwISiuBKXr9JtAQM4q/IS75VfTOR1n
	hTHsb+mIQwktJg/558IeWQIMxVZlzI21GcYusFsgUqAOIoS1BXQJAuUyYSgyH7EEIwQ=
X-Gm-Gg: ASbGncvcP23DTZ6B8C98R2qp6B1U73yCUESwz27ZoXYrtiDmMvMVgwsDT2L+OvkyALZ
	+pZDP1ste2tK/fJJadlHbOZxTKMrRRb+DbLkOaH2rAgE9ajcOJRVzPO/cxEfTwfX27XbBGj8BET
	m6pNTZK3qvybujZaDWvvV+C47a0zn9Q0Lzgxm3QAvA5rBAnWV+V8fL2WHpCPnph+ybEOJ9vBefp
	qWghJI4OKj9hzWQUlkJ3ujNObtISonLtKTHuWu4tX+Zndyszj6epdTWmxwtTXQUk+8n1NKlbL+W
	4kJ/NiSEoPC/Jk8rRREzvIq1QGjjaOdV+b3eEBZluHaDCe9dgYMvOW2NAHC4/uDZcfvdHtL7yjm
	oFwu0KGLqZcViiJjBMI4=
X-Google-Smtp-Source: AGHT+IF4XmbWIExFu1mlduKfiNfTLu/tQXyVfpn87Q8JCh/3y9agaf4v394uxNt/X9mcs0VMw2lIeA==
X-Received: by 2002:a17:90b:5212:b0:312:25dd:1c99 with SMTP id 98e67ed59e1d1-313d9e92702mr2795609a91.19.1749797893528;
        Thu, 12 Jun 2025 23:58:13 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:13 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 04/12] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Date: Fri, 13 Jun 2025 12:27:35 +0530
Message-ID: <20250613065743.737102-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235814_300245_169C6801 
X-CRM114-Status: GOOD (  12.32  )
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

The KVM_REQ_HFENCE_GVMA_VMID_ALL is same as KVM_REQ_TLB_FLUSH so
to avoid confusion let's replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
KVM_REQ_TLB_FLUSH. Also, rename kvm_riscv_hfence_gvma_vmid_all_process()
to kvm_riscv_tlb_flush_process().

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 4 ++--
 arch/riscv/kvm/tlb.c              | 8 ++++----
 arch/riscv/kvm/vcpu.c             | 8 ++------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8aa705ac75a5..ff1f76d6f177 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -37,7 +37,6 @@
 #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
 #define KVM_REQ_FENCE_I			\
 	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
 #define KVM_REQ_HFENCE_VVMA_ALL		\
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
@@ -331,8 +330,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index b3461bfd9756..da98ca801d31 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -162,7 +162,7 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 	local_flush_icache_all();
 }
 
-void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 	unsigned long vmid = READ_ONCE(v->vmid);
@@ -342,14 +342,14 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 	data.size = gpsz;
 	data.order = order;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, &data);
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_GVMA_VMID_ALL,
-			    KVM_REQ_HFENCE_GVMA_VMID_ALL, NULL);
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
+			    KVM_REQ_TLB_FLUSH, NULL);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a2dd4161e5a4..6eb11c913b13 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -721,12 +721,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
 			kvm_riscv_fence_i_process(vcpu);
 
-		/*
-		 * The generic KVM_REQ_TLB_FLUSH is same as
-		 * KVM_REQ_HFENCE_GVMA_VMID_ALL
-		 */
-		if (kvm_check_request(KVM_REQ_HFENCE_GVMA_VMID_ALL, vcpu))
-			kvm_riscv_hfence_gvma_vmid_all_process(vcpu);
+		if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
+			kvm_riscv_tlb_flush_process(vcpu);
 
 		if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
 			kvm_riscv_hfence_vvma_all_process(vcpu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
