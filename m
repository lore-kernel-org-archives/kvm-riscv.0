Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A593C71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vbhDUrimGDNLcbl//tnEXH6a3cqDaXu8w57n/NIogo=; b=vFZNX1bh4x+2sS
	q/6WGCgmAbGv0WEXcBo12uuRPObYTJeYI/gN5DosM9bdbhD6kgN+7ak50x420IruP5O6DNr82CPSe
	TTYDmQsGJoFD5KvXSwel0SwG91gGsG8s5RBrwYAX7ng1sJVhqxqUntX+vx/VVgrL4d5PN5nZa7aXW
	jax8k72nAMAkRtds2N2FTxItjO8QSnbWrSeQ2z6DLz9sLlBwQ+sQLXguacVzeV03LIWSDlDbBc5u2
	0KLo/OUofYXwY75Rf62xzpLrVLCnpnr8iNIEzuk/vwWf+f3GkCbKSLf6uAN06e+hFm/aHEDW+n6Xy
	dy3daszChFJkXEN2uEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cE-0000000GAVR-2zsm;
	Fri, 13 Jun 2025 11:30:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyNB-0000000FXoW-1DGb
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=; b=QXkMz1X51WsDeX12aP5vgJIBss
	OqHkeYnE+z2R85LM8C3unpfXXEvkBzUM9tDpvGlLibMsdxozUrMXGtuMa/C55vhDJFd+bDKNy6IYR
	JCSRKxl/KI3NJZyu6oFAEin5EllzGBNZ2clzCEq677KDv/s+ycNNCTxPJl20HhEunC9BhNMAMYX9M
	xUX/HlsvvZVlQn6VoXUAnhMGPNOHh0NodBQsC5C6mY4zS2p6FXrRqf/SRdcHFqTZpig1rbpe3LR0h
	TxdvgToVeFzf2o59L8xyGZPos2rt1nhFFPTtubCOElP6Q7MI9fhvHeEg3orkRtexQibnxVpPIzAnX
	Y9jsYaNA==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN9-00000002ryA-0SqO
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so1638216a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797920; x=1750402720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=J8w+6ye3Y1DVMjOFFbZgEMNzyUzyh0traYYLRhMJl1RSFMmAA0FReFkK5bZwid782j
         0ygOFg7/tBZG6c03Y2OMLN+HKHI2tP++swHyorSTNtWcN/EcVxgjMVj7kkha26lLO3oa
         F8hSPgqw0nNrt7+sHwDx4AHUww6Ut5wEmOgXBJZv9XqbRvYXMb18xZLkUfJSmr7mi37S
         9r4epNNQWNC7gNuJojZEEdZECm7QUVfqMgNJMelWpowLKOYltRxmGBe/jaRTxef/D39v
         A2Ng5dsjih86Jguwjxf3CLMNUCTKhToLyl0vhLdSVVgak706qz+ramLS/c/YqHeUV/uf
         shHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797920; x=1750402720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=hhIo29h8r8VNNSWdRvYigpV8/tvrDJE1BigUMuWH1jQ3h6/Xrywuot2eYszXN8VnL8
         JYVCe1u+IBAnNgtUBXTvN1EbTUyrLdNhaym+upbBv2RipM/OLr1YVzX30sZZ4hz8hm+z
         MaMmZUSEVxmu+dM25lrwcBkaH93JjJcB3I5dL5wAKNeANbyuMVzfHRxuG3O+D3RvZVG/
         5mWcM2yEEECfLge34W+6TatCLxplIRr8b+OIFKXcF3JRh0bW5ncMmEC0Oo1dgOqSkk82
         cRomvdnhPN/tzWHaIXZRZrpCaQezEWAfH5vb9PiO8VcjTmDLhpzNjROI9S39DkHxkCG6
         66RA==
X-Forwarded-Encrypted: i=1; AJvYcCXJkssFZWDzC2cD534i+XNSsiw1nt8ZhVfT6BuVwHIB3MRXIcb8Y6UQUHE34D88KBk8XIsIb1nzoHc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhDgcKwkBgOew6WyRv8FDGJVX/wPsOQQqj2R20yOlXEcq22fTT
	DKm/tdMYIBMsQVAlFXgmAf/ZTKFtVcM7eWlEGU583HS/36/Fu0Z7k94eX1Z11moRt+s=
X-Gm-Gg: ASbGnctk/seTpu6TixCWd+Z72FoXr94kD4mfCdJ3hd7snx9+nfB05d0xGyyrerwuMK5
	rS7N3KJQOEGQfAux30htb1qa/jENQX0quyoU2Y/lkvoRDrEqGNw1DjFmFxZc4Yfn9pxJ6O3aa/+
	r9+188QRTPu+C9Ao1GezjftAunhbMp3DdnzUqgAPs6wwzizVt4O1DmbVSd/ECyYcG7y6f1TSL6H
	bf4iSJ24uo16XwgI2Dtq2+Gp2+d4QjNLqWfXAkBFLeF6cjR42XGqMgwidQY7a0c8p4rewvLGatx
	AF8NN6qiLHzDx588vcNq0oJ3M7jxO18MJH1r7r4AFhEESPYXE/Zk/kGRoPQQwSetgKBCYzFpRev
	LdYbgrs0F10rH8v+xhZw=
X-Google-Smtp-Source: AGHT+IFD7ruLh4VfkVxEKY4I/hEXtNaiVk7YH6BljPh0dx2E18jMzd9JyHkdwcF8Bn4qR1nr7HznMQ==
X-Received: by 2002:a17:90b:4a4f:b0:312:639:a058 with SMTP id 98e67ed59e1d1-313d9ec4df9mr3120299a91.27.1749797920164;
        Thu, 12 Jun 2025 23:58:40 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:39 -0700 (PDT)
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
Subject: [PATCH v2 10/12] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
Date: Fri, 13 Jun 2025 12:27:41 +0530
Message-ID: <20250613065743.737102-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075843_350942_AC0B8AD9 
X-CRM114-Status: GOOD (  12.37  )
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
