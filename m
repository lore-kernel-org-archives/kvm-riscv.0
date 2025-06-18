Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2C7C7115A
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFm6XMCjQrqMrrnfXP/lG/1t779dYG8xUo8DNy79ud8=; b=aF0qDjEo0eZO1q
	tdcbUoYHoE9vVY7L44ekgfeQmuZ9avXZqjWDnXjrMG3c/e3HbFWBXbk2Nms9JzsGIl5t3150u2Za0
	ZAvFg4jHcUjcQrxxgl56MBWqkldps4kcPdNZJzA1mGuAUfXRhGjBlqlt2+QL6nq/uSma1oE3YJTAf
	lw5kzKl9NEQVTfJ+m+Sa6aL4nSdmNzzQBPEOtiuD7zXY5EOe8piu96wmqvos7Y6kQCiPt/iV1jKlM
	MNsZXweZAkqlFzwkUAWWctAGHZkfWI8pvQi8tahzOdV8HKaWWeazZ732vvmqKoqTi/zvPGOqJi3ej
	oLmEuo3Ept7u3gJ9dYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWx-0000000AEs3-1IQ9;
	Wed, 18 Jun 2025 13:08:43 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5n-00000009xp3-2MXp
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2350b1b9129so48522375ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246595; x=1750851395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wv2Dv1D3mRBWch3U2QfEIQG6aPxPGFrtjz75yYPWcVQ=;
        b=YW7QrCym99FjFjz8uj0O1qg/juvcMeRXTF4PMk4qAIP1x203+nYr6m6fz603Nmt4WO
         yp2kobIhk8lwyngWZP4MXclKB8bYzRLhSxX2VFueiA1mfgCeyVotKf6qXfld1ddsveos
         UQlIT3A7SoTPNWvzCUkRSTMAxnxPffi5PrdtAkvSKrzL8JwVUVE5A218pv84rPuRwMuh
         93QgUp+izf3X2l7o51AwdiIi1a1FfZYBrE8x2X4DYVBbJlrlkYuPRVoeo4kndVYumy7V
         9Q+7BNxPq+4+IIOzDyv8NqLWVKoFjZyPNbXTfhR/ZX1Y5//9VtKgDuG3umOrpRn6FI48
         Le4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246595; x=1750851395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wv2Dv1D3mRBWch3U2QfEIQG6aPxPGFrtjz75yYPWcVQ=;
        b=w7HX62IxnwSUFGdkOg0MU9ehCF6FqpR7MXrbgvlylQhpJbobaUjjH5SdXP5Jb2GoHf
         /ZPS1bSLDkOt1BeqnhtmUC80w0vmdPPv+tIuuRQ9tSC3SuMxYzLVV53weRG889F+tDgO
         6qihagvR19i3dzHRVA2VU0ZRSyKF9fpM+rR4lDGmsOyc5RwVcnI1feLtlHIigJzHLqIc
         5Yj5gRY8sWKkcFlrK4ZdTXeNOUszVj+5tDbwirwkxyeoIgWmjrb4kW4aEU9vTMjSqtwc
         WRT0HbMOolNW8qO4oh/6N2nE2ijQT/hn6OGnf/12e1naGDFN97aABox2AUEvpbQ71wC+
         5Dqw==
X-Forwarded-Encrypted: i=1; AJvYcCVv4fKaEIosMOK2SMS8l4na6cKivO+/9waDcDYUXEz/Xy/6343i7rXZBU9+0Yl9T//68Z8dOItYCq8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYqPhYTL/TUPZxOhL/8Fdv9vcryMkPCVrdDTKvGFdwi70UbgDc
	CIhUN2C963NrV7KzBcIkQ0NRxOdh0bAYojBw9X8PmaDvS2EnKNZVJuVm77Ojux9qRVClErhTm1I
	/6oHh
X-Gm-Gg: ASbGnctUPDanQJ9sVYaqvih33VoxZ/yidzsLt/fTLfaULsEYFJNYWfXNqng3+RjnYXY
	oiyfM3KIH8HhYdxTE4vDFGchbpSS08JzI6TXKBsZ9LM2/607xzM6NcWepIaRk8N76YO9+xZ5ByN
	oKoYurZVATuqQlsLX9GUUr9KRSnuOPpb+N2MCXgxEQy+ebDYW62fn/0j+tq/kYSlIinW3rTtMmU
	oSpExtlPp0izGP6A+Lo8MUmW//rKeC8UcTt/ZIizP4CjBgAVjTRCsdK4TZkyrWf8uAcLtiavP6S
	eCIYNiQe2dacREaPzdhWl+KUHsUpZQDiAzdv0NLf8jwa8f7YbwNj/cOCEOcYrmLbxKGgygy+S2X
	WgG7oQf/+YoAQtgbHow==
X-Google-Smtp-Source: AGHT+IHj3Fmtrtd3/iR0RBFJ3K5R+ndUPF941cuYVZNiiA3rRlmLdRt/HqLMxHP7frHFlTuPO9nuwA==
X-Received: by 2002:a17:903:41c8:b0:234:f580:a11 with SMTP id d9443c01a7336-2366b344b39mr298672495ad.19.1750246594829;
        Wed, 18 Jun 2025 04:36:34 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:34 -0700 (PDT)
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
Subject: [PATCH v3 10/12] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
Date: Wed, 18 Jun 2025 17:05:30 +0530
Message-ID: <20250618113532.471448-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043635_600790_E9C0F7F3 
X-CRM114-Status: GOOD (  11.90  )
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

Currently, the struct kvm_riscv_hfence does not have vmid field
and various hfence processing functions always pick vmid assigned
to the guest/VM. This prevents us from doing hfence operation on
arbitrary vmid hence add vmid field to struct kvm_riscv_hfence
and use it wherever applicable.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h |  1 +
 arch/riscv/kvm/tlb.c             | 30 ++++++++++++++++--------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index cd00c9a46cb1..f67e03edeaec 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -19,6 +19,7 @@ enum kvm_riscv_hfence_type {
 struct kvm_riscv_hfence {
 	enum kvm_riscv_hfence_type type;
 	unsigned long asid;
+	unsigned long vmid;
 	unsigned long order;
 	gpa_t addr;
 	gpa_t size;
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 6fc4361c3d75..349fcfc93f54 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -237,49 +237,43 @@ static bool vcpu_hfence_enqueue(struct kvm_vcpu *vcpu,
 
 void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 {
-	unsigned long vmid;
 	struct kvm_riscv_hfence d = { 0 };
-	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
 
 	while (vcpu_hfence_dequeue(vcpu, &d)) {
 		switch (d.type) {
 		case KVM_RISCV_HFENCE_UNKNOWN:
 			break;
 		case KVM_RISCV_HFENCE_GVMA_VMID_GPA:
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_gvma_vmid(nacl_shmem(), vmid,
+				nacl_hfence_gvma_vmid(nacl_shmem(), d.vmid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_gvma_vmid_gpa(vmid, d.addr,
+				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid(nacl_shmem(), vmid, d.asid,
+				nacl_hfence_vvma_asid(nacl_shmem(), d.vmid, d.asid,
 						      d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_asid_gva(vmid, d.asid, d.addr,
+				kvm_riscv_local_hfence_vvma_asid_gva(d.vmid, d.asid, d.addr,
 								     d.size, d.order);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma_asid_all(nacl_shmem(), vmid, d.asid);
+				nacl_hfence_vvma_asid_all(nacl_shmem(), d.vmid, d.asid);
 			else
-				kvm_riscv_local_hfence_vvma_asid_all(vmid, d.asid);
+				kvm_riscv_local_hfence_vvma_asid_all(d.vmid, d.asid);
 			break;
 		case KVM_RISCV_HFENCE_VVMA_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
-			vmid = READ_ONCE(v->vmid);
 			if (kvm_riscv_nacl_available())
-				nacl_hfence_vvma(nacl_shmem(), vmid,
+				nacl_hfence_vvma(nacl_shmem(), d.vmid,
 						 d.addr, d.size, d.order);
 			else
-				kvm_riscv_local_hfence_vvma_gva(vmid, d.addr,
+				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
 		default:
@@ -336,10 +330,12 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    gpa_t gpa, gpa_t gpsz,
 				    unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -359,10 +355,12 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long gva, unsigned long gvsz,
 				    unsigned long order, unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -374,10 +372,12 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long asid)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = data.size = data.order = 0;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
@@ -388,10 +388,12 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long gva, unsigned long gvsz,
 			       unsigned long order)
 {
+	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
+	data.vmid = READ_ONCE(v->vmid);
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
