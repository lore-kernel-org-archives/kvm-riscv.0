Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4706C5B552
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7vbhDUrimGDNLcbl//tnEXH6a3cqDaXu8w57n/NIogo=; b=kzby4GJoIrOhTU
	DA1a6HoCB4F0hyGMvC5Q/Or96MJlZRQCLMcoE1jLsEbwl2h8enkrSWGgWo8o6NNNhEpxuNOOJ/wG8
	M4249rRL/4dPsjgn7PqEXQuxF5BSpN9ZE2lyPClNB0S1ZV+qINbh6GyeIfkfGX89VaKKDSV1xOHTm
	s7VdPOkf+qtmvQd7dg69RH4ALclM5RR6m6emVXWEF35sXH20Z8GknGvbe0lB5f7kjvX0c8zZi1l/E
	s9Jk71W4FcTEgOPm0u1BNPTkvhXblYKOjvJGpUWjZpZ28JFPHwrQyH+VjKoCRq+/20NHaTPlDteX5
	72PydkTiDjyAe7LjWOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tL-0000000EpWH-1giY;
	Thu, 05 Jun 2025 06:15:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tE-0000000EpMw-3ZOh
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:53 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so394027a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104148; x=1749708948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=XD4v7vFniHHAw2prQWcOBwfHcNOOFMon3Ysx9n6LNl1PTQlYazko/+/wPJKWcYODS5
         RQiKsch60Brs6po8RrkCRp222bmhZxFfKNsHNFQ8xWkk/88/KZJSeRqa4F3FqTinMLNm
         RfwohM5gNqOAFEMmsj6A7xlw50faJXc9NC4Yuuu13te6eVPyA6AHa0Kg/AMo1Wt7jmkE
         ERrsE6zF7RW2VGr/WoeL0bUh/YLcOdIBblqNRV8kkFEvkEMlwhEjjD9iNKi+BT6OVzAm
         m1FV5NMPJ/m01kLBCV6GH8cIS844YUh+W/wq5Dac9BxeCcwvuNpPM6CfEzFeQdF9IkqU
         sp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104148; x=1749708948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTUNizeD4GAwjamuleDEZyMo3f2gr2d8rHj6sva7l/8=;
        b=iT61lGNXSLb0ZyfyLaStk5rvJpGlg1+jhPkNWirDYVzp3dfBl/dDUv1gl/5a43slku
         5rfZ8e+UeIl7uK5rYbdh7BgGvZRWEKsoWNGNawSSLtPebQANgf0r0z3DN+SJgUOA8t+w
         fagd42fc2mLG2cyLDefzEY9yELC2FtJiYugHC4CDXblnu2XfSE/LA85hM4NDkpFjkl+4
         U+v+cn15dkGT1R7qmsUZKMtohvEFDZ3xSHLLgLrBhTCVfXLfsLTINnnk214jN2rF1ckE
         ZPZch/T8SE23U47+qDSaLFq7jTfL8ZFKeZuAmvTOWS7+OJ05wlJQtKZQWemNvqZfd8wn
         SFLw==
X-Forwarded-Encrypted: i=1; AJvYcCXBuWUxasnmi4OlYPxPCVt44mhg6T0Pl2P+qRlfhWXflAB1MVfVL24iAEkMGYTOOPGLD47hlqzPq6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWEmcJVTWR41pDNbcEsoxxhqHJKdOqekl5JZeYNC7kIuzLwQk3
	Qk7K76xBINUIPWnZDZWO/CyPtl7tKGQwuR4m1GPKf/IyWocKZBRhPzXjoyNDb+YRhWo=
X-Gm-Gg: ASbGncvvEzy8xQ4SCH0OWScY4vt05j6ku1zgJZl0DUz15K4teXB9iFP84UOd/nKaKgw
	49+Mad0eiuArBqEHk9QypsD7NOM3D9wN6GLWe2IAdplJ1TUChnGvGZ89hSOlR3g0DYdG8SbIKlG
	+U24pLp2Nb1DBp7+H28YqKglUPBtMFsmOWiQq9O7JYw0dvgbuenuVB7KLM+EZmHBtqedOPuepN+
	4e0coCBTSpmOzZ1YH9HXVfxPlgo7zeHSdtPI3wGZubr/UJUtnnZeyyMLBWTnXv3ar+80IDTqq7U
	p3GBOZGFYQN2aZdzg0pkCtP83N5KYg4UxASAu8Sixko0c+UyWQgccYfboGsLY4zWmlD+TrOZVLT
	ZyEdCZQ==
X-Google-Smtp-Source: AGHT+IF1vChQlmPdBhFqDNCJg7mNgqFPE+jCNdqDdFH2eL595DiIm4Pp7WZXYGhvZd5N4Z0BmeSfBw==
X-Received: by 2002:a17:90a:d444:b0:311:abba:53c0 with SMTP id 98e67ed59e1d1-3130cd12d75mr8464937a91.9.1749104147746;
        Wed, 04 Jun 2025 23:15:47 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:47 -0700 (PDT)
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
Subject: [PATCH 11/13] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
Date: Thu,  5 Jun 2025 11:44:56 +0530
Message-ID: <20250605061458.196003-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231548_910585_F5D28160 
X-CRM114-Status: GOOD (  12.18  )
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
