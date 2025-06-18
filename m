Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C608C7115D
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lzdauj37iK43UzER87bB5leSJcqNUxf3BFAU9+ESBU=; b=m6ucae+/sSLBiU
	3UJyLv+bBhAxf7dEdQnpogQgfret0XSmO/TnS4dtEDAAVMualnPmhnLY6LdgWptVDy173s4lYKMPS
	TLqJw9jtoYVZ27dV+TI6l6gDYk8MJR9LK/JDMVdpP0BM9eIblLEjHp2yPVS2A5W9ygtjRPHjcHcLk
	PlyUkChRqbFclqjS3103JJQMFaYMxN09TOp2nuE3UQS67cR/V2NnFx7/7JitLHNP9eSTBre8Etyty
	A+cTnpKCF3ZNxxVbGf4GInOhNuYv3JQ6zNp1GGYJ0OBC0HW0KQJD2I40/q7kdyj6ujMOViFn0PicT
	UHF51ssvBTCEotEBD0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWm-0000000AEcT-3HU4;
	Wed, 18 Jun 2025 13:08:32 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5J-00000009xgs-2qPc
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-234b9dfb842so62385565ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246565; x=1750851365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=Ss8s6WmR+NITNwYcAQffC75UUjSv/wkoGPC0XkF4am3prH5F7PePn2RKtQzmOtxRiy
         Cu3USLCoHF9t/bS9NATI/rSbBDhojCBmM93eU+EfG4KwgBt+0GX91mX7ttYQO4YNWbfJ
         7Jge6bqoqPqdxZroRwETBe39MZAdokAx6f/ufctlOSYDtBa1z3U4HUAq+2JCrNDRflr1
         LukWuRFL0HxL/i89ohcJAdlAhJSHi6OFNAva3j/DhpiPqVaC69dib0Q2kKZr9L8/oJ8u
         31gB+0JVBc0rb9K1Ul0NOFq7ANPK1xqf/uA+qxmXd2bVYreLU7sEKLahGwLtXw3dTWr8
         zkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246565; x=1750851365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0APR23xoSpRoPrmHOoIW/fZKPHEwlO7VgBzBq3Nrcg8=;
        b=XkLgBI22Bp4mlBWTo0sLWbLuzRMTvqJLz1GC2lqjuiqOxezGJiYbzhLNSnQhq2ul2A
         nXlBPzVoUGVqwpSmoVZ5UWaDvD9fRojvhEPuk/o33PiQ1z4qS2LrCK2kaSabhoscA9sa
         LxlmcuPVH5mxhPFkEOEXsCcTFUts64a6yhJMuGnoGR80EQnXXomNJXmjWkwpkRzBIi65
         IWMZBMeIbCobMC+6iKwEPw5BP9cAKofEGbTXHxVMrHlbbv5Qpi1xGfCfmxdpwOLCkD2T
         eob1zMJxkm7amE39Uz83Xht9YB9fqF4QDkG7cC0KVdPSve2uFMnG7z77C8S1ohRAMuu3
         JV8g==
X-Forwarded-Encrypted: i=1; AJvYcCXSFNRyaYjGEjZQldr5LP4eIobR1/RvSOuwp3t05dQ2cYmNrwhBOR1sMcDzhGuuv1Ek/ZIymHDMdWM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwq5b0Gy4Z2Ycftw7e9zM7wYGYmXNxmc8s0H94zVtmeaK/COS4
	HNzJ8rW2VpJZpYLddk9p8/c+CNAwasZzoBdNa5PAnXCnTf7C94AXa/XdDh+8OO7vGWw=
X-Gm-Gg: ASbGnct7TXkL5Qdl6EL5Omp5g9GLcqr8LD2vKF2TFeDL7B52ijF63vlsdqtIS1pqbaT
	vzHcNj34/7Y1g6Sjzg1Rqy0/pKRS0ShHs51SvdJLm+NwQfhDyUW3YIEnp1yb8ztj2TZHnubFuFZ
	pgrig3rr09FcHgfCSF0cvexMVNInUtR2rP4/RVzJfp6g9lizu/4P9coA1jsWYFwu3osQ8qA0e67
	EmDlPY0UlF6P3zDOL7XK5BcOFjmocYijFEqoDiD7uUq5aiLpJJGr4jMSuQfP3HXWmnyTX0AFKt1
	ad+w45r1fCKBNpdvWBALTghDDh8SIH4WwUUI3LNoW8baL3XnD0vsh763TXsGXyu7yqkl73AWJZg
	/JUAcyNNOanZ8LxXSWZkB5ozMkwvu
X-Google-Smtp-Source: AGHT+IEI/VNLAuRLYdIAweMxNEdH8gXS8v8LyQf6sVKwZcSZW1oY61MqIeM//ad3SI9TL8TSIJCUlw==
X-Received: by 2002:a17:903:1ac5:b0:234:bc4e:4eb4 with SMTP id d9443c01a7336-2366b3e2ff9mr227196035ad.51.1750246564794;
        Wed, 18 Jun 2025 04:36:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:04 -0700 (PDT)
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
Subject: [PATCH v3 04/12] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Date: Wed, 18 Jun 2025 17:05:24 +0530
Message-ID: <20250618113532.471448-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043605_710509_8AE37E2A 
X-CRM114-Status: GOOD (  12.23  )
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
