Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5047C61CE7
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C1YVrzG06ck+YVXQ25R/7NiE++84pgz14AZOgvUlyA=; b=jFrbn0+Lq6fWmD
	BdasIQNqYfwns2sHm/EsoxnhpRXkk3kg/4QTLVDEsbNby7t147MkSAB0krQbiP+HTNEYYWZ11P/wk
	hGUX8NQmOWgbTyV1MntRFBAj2rnDqOtmAiyclDydG8410rTx090D+iNGcGWdVMmUOvXg6drtYyP7f
	kN6ZrEaINZglyriI1Cc4zOUU7O6/5M9WvPxixwFnYa6EMyZ92ozdmIwEddc/nui28CDCNA4Jlxq2e
	f5Dr92Wivj9oPfvY5LJo2yqu0MAyszFNUL+BHtwP405QrFyF5xF0l8Z/kUReP/3+AWhcXYOu5rP7A
	RyUvAp3fl16mKHHbaipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t1-0000000Ep6F-2MLI;
	Thu, 05 Jun 2025 06:15:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sv-0000000EozW-09IZ
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30e8feb1886so747716a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104128; x=1749708928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfGplfZ+lMzzXGz+lH1cECvXBoEmz2/+/610R8byNic=;
        b=dszrfhYOITVU29dUbt5ROBiTXjXf6yKBsBAUtr/E1EgWXgmVux6uWI58yJDrmUHhzU
         ct3zcjpRNAXEe4ekyPVaYidEniUo4LNHgfrfC1CB2Hr8G/YOrVkFTydqJD5GIYQtjqEA
         WjOaGtpzK5V+s8QZ+C6zag+tKN8l24KtoVEyKwBdAD9cWUBnswkb+j3CPnzmcJlwSeqY
         /hezn/yzr0XSftfTWhsmpT6VQmTtIk9d4OvxmEx2xD+lSE3A8E73gClURqjQHu/D4Vwa
         Qa1rtz+hjbrNuFLCKakaGU17qQaS2PAEePjep8FyIkXepcVMoZ8b0YOE2amSKTaADx+d
         hb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104128; x=1749708928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfGplfZ+lMzzXGz+lH1cECvXBoEmz2/+/610R8byNic=;
        b=kU1LnKv7avJSZh5Pk5NYqOSQxc6bI5Z+xlbYYr2rXJ15/0fk8YMxxp8ZeTm3MQfNfb
         TjjsjtbdQxZzh6LynuHrhbzHAa/bi+Rwg6xKLhJOi+h6KWZuZ8CjBa9vG+EjAyZYqJt6
         r4apkZJDmwmeemRTaGbeA/69jbRkSiHflrzSq8Nc/BGMDGvXWQNrckJK/Y3noIC8kqIJ
         kIpYucoXftP2L5t3GzuQdq/39HM0iDKkGrtkNmfR2jHeOJK8+NuvYyuPGQz+2W8JFhqv
         7PhB+uUw2uIPBIti0qm6beYgEjH6CBUXhnqzKNoHHhW5fWjapYQeSgaPVv2X81r3Nw+8
         TXYA==
X-Forwarded-Encrypted: i=1; AJvYcCV6QgNMw7V0obuIaCr96CSj5uvyi1Y/L2z5YwgmLyWVnLtcgjkHM4M55Y20FwwXgkj6JYpdz5jjtk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFr1vDEY3PRXldpHq3yjitIo/oA+FaEcTcGRHa/+dOugPzF74y
	tDLBzQBjekENE8ADNr6yoeEu2RH35gXwXps7RcBfU19jPScnEaEEbTwUGQ4ytysaJEQ=
X-Gm-Gg: ASbGnctwf1HC7cKFyafkz3/4MiWAz+dyE/gKGlVrqPjLzdreL2L7l8YlgQW7/s4qBus
	7PzfePfBU5VOg0PjjvznagiFOAq1FazXnjno44DLMG+DPzxLCTBWCTtkA1jWlOFUVKztndzJIo0
	f4/29vZ3Mi6K50/VtZZP81HbNXLnB9rck9hrW79SGF4eMJ96xYYp6HS53pbHffCwrhGs0UWeY8C
	IEqkj/R/4DS9eHGEnES72dEk3sBvy8mJ9NUeESOA/LCTnP30CMrv0MVvnVkg9LJfrE/wz5fFtJI
	9egPjQZ+HAcnbSe2Ol/vy+e+/ZGRwuTmVSTpgD4nqCH2XSIlR8L9+xkAxm/yGUWjOo5Cq9MgJwg
	14EziaQ==
X-Google-Smtp-Source: AGHT+IE6sSz9BENpf7WiYfh4yg2SFV4ZB167RNBBbzwVLW1gNWfnra1do1zIt/5EOyVuGPon2+FyaA==
X-Received: by 2002:a17:90a:2d0:b0:313:14b5:2525 with SMTP id 98e67ed59e1d1-31314b532a1mr4987134a91.35.1749104128373;
        Wed, 04 Jun 2025 23:15:28 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:27 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 06/13] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Date: Thu,  5 Jun 2025 11:44:51 +0530
Message-ID: <20250605061458.196003-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231529_081973_A9700CA5 
X-CRM114-Status: GOOD (  12.34  )
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

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 4 ++--
 arch/riscv/kvm/tlb.c              | 8 ++++----
 arch/riscv/kvm/vcpu.c             | 8 ++------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 134adc30af52..afaf25f2c5ab 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -36,7 +36,6 @@
 #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
 #define KVM_REQ_FENCE_I			\
 	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
 #define KVM_REQ_HFENCE_VVMA_ALL		\
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
@@ -327,8 +326,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
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
index cc7d00bcf345..684efaf5cee9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -720,12 +720,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
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
