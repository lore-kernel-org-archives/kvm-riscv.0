Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1668DC71148
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvJphufLorYaC/wXLXcmHFfSPiGrbkSYPAvvgqak8vo=; b=PK6hOgUEeMWMs7
	+YycOptwQFXtvn4fspEsB43Pr4yjy3sBEiMItwCrrCqSFDRqZ3H025IJ8ucZcpNpKj6smxNGx8ggs
	J7Le2ffr8euGk2Qhlp9wjCfrHYw1QfM8yUc2XF2uHCHFzG0B4mDclxsG5uHyFcM5Nv5P3qA6MzLXp
	sWnJ50bsy+atNUGniu/hMd2Ogr0Utcv1eKUHrbxzPZQnXuIboO50BDnKEslzk0bo1I4FRG3VC1f52
	DUl4OIjOK2X8Pf1C5HD8rSRY4zrexzy/ZVrQWRtzTwR1q+VO8fB3zFFWAxv4BCH8eUicY8AdWH5DF
	3Jqs37d8BHNKtfpRhLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cF-0000000GAVu-3NnW;
	Fri, 13 Jun 2025 11:30:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyNL-0000000FXvR-1Bac
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fv+HUsKbkqNgweSMN6BOnXE1OqaGyWp3bxb16If7Nvw=; b=burRtZUr+ZszFccr3z6joIscKD
	HOhoheA91mp/UjXFSoyAj7S6rdgeKcH373ViEeSyVrk2/BA1Xv1B8IS6Ya/lSd+6TVDajhuL5e6Kr
	ejSETBCKZkKSUZIB0O2lePIDR7CHZZirk9/4RaOJUqNenXrjfA+s/acSvGVOkc73Ug/oLR0QRQ2jj
	/0D2Hb6E5AoCsCkE96RVgAAH7LeQwvDRCN2jZEsFSihR4Fnm8nbCdTOdm9pZq1PbD9r6uB1w+uxZW
	sRR9VvVhjLaiZJiUHcs12mCQf8DHiKHCwRoOCxykYSZcU/rzhiVBGqjWt+OPvKsS3uQny19USnQ6x
	iA/9MMiw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyNJ-00000002s0O-0i5m
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-31393526d0dso1339355a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797931; x=1750402731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv+HUsKbkqNgweSMN6BOnXE1OqaGyWp3bxb16If7Nvw=;
        b=b57QFRc4n7i25RlWbEP6KJaZ7/4r/clGU31mhYw9FxtHNRLoOd+1cTH/LuZPTp4Ek5
         mI7ZuWFRVGyzYapdUGR2uETPFap47lc3XK/i/rPBatHm0h8M6ODtacT8DNCngvhexeRa
         YGH6vkJxdDwdXLOhScv4Lr+QKrgfHzNpKBR09jeOTC7gXBxpL0u5U/00+L+WozfrEBn4
         G6An3yFkRaM+1weSdDP952vx9897U5elMz2vA2bi66cqmYd4nTAEba4hUsRgy7j0Whp7
         ezRbLwefC3zJvdAekFhsAplIkzZew6/VT745LIfFFom1iOeDCVrObeYPsxL/2/CyfvLc
         uybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797931; x=1750402731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv+HUsKbkqNgweSMN6BOnXE1OqaGyWp3bxb16If7Nvw=;
        b=An80k6znQTBYSfaCl2tMjgXIq325tsdza5ll78pYvP5WTiQc451Hlo+3ReMLXoPEE1
         5xKPRzZK37LokhtPkAxa+pO4X2jJuzGYwwjXqLkwA3H+B3J2UuevyO9GveHbQOPBmdCq
         cSF8VMeB2Lo3hBDEcQNUz2CvJwSWp8+4mHI3Zh/HOf3Bx45emwFzyh63rPZU9abXgRcx
         wX61YQzaSbF1FkZFTYVO4hrcdE0x9o+Y+otSlFPAtNZgejrA7O/PmAhNJfOB6eIskobt
         Wv62CSLeEFTRfETJvwPrvDXmxkzu9mJ4e7o09M/u3B8n5ROWSyjNmqsHJA1C36+oSVws
         QBCw==
X-Forwarded-Encrypted: i=1; AJvYcCUeEUOdSnrx2VnnHGBBod1779HsEzd4/DmxKqv70Q4i4G0/r9GN8ywb5DZVS5kFOM6yiTGNoqUo2Vw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLILSZQ3YnX4HsVbHerQV/m9BuM+SmLS74i1WREiwDzqPhkoov
	bpdvqamq1NFKaKqtnXs7Ag6lsuvv+DxfIbD/Ft28siE1bYj6EqjgX4SzQFA/Csd6Szs=
X-Gm-Gg: ASbGncuQPSB5TNsfksCvGboCQjGldni0ZlkKd3ifdB6jDO+0/EUyTwKJsPDFnLBN+kX
	0yYaQoBFxcp+nq+PpDqbGuF4oqG4tW6iDZOVbMeVQt+RSi5sud+TsMzHayosLcmDWmtNgRHwyU5
	VBsZdgVf/cvI2h3b6HN2F7PKlsQC2nMnenHgHfGFfgzO6kPeYnhQxCEHJ313J2VxjzZ9s2DFv2R
	NUdyuj1xs+8t9XQjFbO1N6dOo87Tgzh+zljdawAHtGgJQhwPY/sEcBQBdsnGBwGzHyIjFNx0aDD
	jiFSQBz8pJuqvavWsBiJcDc2moOBP5cBJPgghDGrfTsTAMjVQWY8yhDiKfV6Gbt+essMwJOOtp3
	GtY7eG++bcWTTjeQUvmU=
X-Google-Smtp-Source: AGHT+IGIN4c9ZvVR6EoxrUs6sx6a1+kFEdVQXr9ZmJ+rly629C37HuyOKLkiMKqAFCHARTElA/FWvg==
X-Received: by 2002:a17:90b:48c5:b0:312:1ae9:1529 with SMTP id 98e67ed59e1d1-313d9eaec02mr3116866a91.27.1749797930635;
        Thu, 12 Jun 2025 23:58:50 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:50 -0700 (PDT)
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
Subject: [PATCH v2 12/12] RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs
Date: Fri, 13 Jun 2025 12:27:43 +0530
Message-ID: <20250613065743.737102-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075853_389118_2B3B678A 
X-CRM114-Status: GOOD (  16.00  )
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

Currently, all kvm_riscv_hfence_xyz() APIs assume VMID to be the
host VMID of the Guest/VM which resticts use of these APIs only
for host TLB maintenance. Let's allow passing VMID as a parameter
to all kvm_riscv_hfence_xyz() APIs so that they can be re-used
for nested virtualization related TLB maintenance.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_tlb.h  | 17 ++++++---
 arch/riscv/kvm/gstage.c           |  3 +-
 arch/riscv/kvm/tlb.c              | 61 ++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi_replace.c | 17 +++++----
 arch/riscv/kvm/vcpu_sbi_v01.c     | 25 ++++++-------
 5 files changed, 73 insertions(+), 50 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
index f67e03edeaec..38a2f933ad3a 100644
--- a/arch/riscv/include/asm/kvm_tlb.h
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -11,9 +11,11 @@
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
 	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_GVMA_VMID_ALL,
 	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
 	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
 	KVM_RISCV_HFENCE_VVMA_GVA,
+	KVM_RISCV_HFENCE_VVMA_ALL
 };
 
 struct kvm_riscv_hfence {
@@ -59,21 +61,24 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
+				    unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid);
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
+				    unsigned long asid, unsigned long vmid);
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
+			       unsigned long order, unsigned long vmid);
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid);
 
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 9c7c44f09b05..24c270d6d0e2 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -117,7 +117,8 @@ static void gstage_tlb_flush(struct kvm_gstage *gstage, u32 level, gpa_t addr)
 	if (gstage->flags & KVM_GSTAGE_FLAGS_LOCAL)
 		kvm_riscv_local_hfence_gvma_vmid_gpa(gstage->vmid, addr, BIT(order), order);
 	else
-		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order);
+		kvm_riscv_hfence_gvma_vmid_gpa(gstage->kvm, -1UL, 0, addr, BIT(order), order,
+					       gstage->vmid);
 }
 
 int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 349fcfc93f54..3c5a70a2b927 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -251,6 +251,12 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
 								     d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_GVMA_VMID_ALL:
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_gvma_vmid_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_gvma_vmid_all(d.vmid);
+			break;
 		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
 			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
 			if (kvm_riscv_nacl_available())
@@ -276,6 +282,13 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
 								d.size, d.order);
 			break;
+		case KVM_RISCV_HFENCE_VVMA_ALL:
+			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
+			if (kvm_riscv_nacl_available())
+				nacl_hfence_vvma_all(nacl_shmem(), d.vmid);
+			else
+				kvm_riscv_local_hfence_vvma_all(d.vmid);
+			break;
 		default:
 			break;
 		}
@@ -328,14 +341,13 @@ void kvm_riscv_fence_i(struct kvm *kvm,
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order)
+				    unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gpa;
 	data.size = gpsz;
 	data.order = order;
@@ -344,23 +356,28 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask)
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
-			    KVM_REQ_TLB_FLUSH, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_GVMA_VMID_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_TLB_FLUSH, &data);
 }
 
 void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
 				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid)
+				    unsigned long order, unsigned long asid,
+				    unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -370,15 +387,13 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
 
 void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid)
+				    unsigned long asid, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
-	struct kvm_riscv_hfence data;
+	struct kvm_riscv_hfence data = {0};
 
 	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
 	data.asid = asid;
-	data.vmid = READ_ONCE(v->vmid);
-	data.addr = data.size = data.order = 0;
+	data.vmid = vmid;
 	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
 			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
@@ -386,14 +401,13 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
 void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 			       unsigned long hbase, unsigned long hmask,
 			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order)
+			       unsigned long order, unsigned long vmid)
 {
-	struct kvm_vmid *v = &kvm->arch.vmid;
 	struct kvm_riscv_hfence data;
 
 	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
 	data.asid = 0;
-	data.vmid = READ_ONCE(v->vmid);
+	data.vmid = vmid;
 	data.addr = gva;
 	data.size = gvsz;
 	data.order = order;
@@ -402,16 +416,21 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
 }
 
 void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask)
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long vmid)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
-			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
+	struct kvm_riscv_hfence data = {0};
+
+	data.type = KVM_RISCV_HFENCE_VVMA_ALL;
+	data.vmid = vmid;
+	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
+			    KVM_REQ_HFENCE_VVMA_ALL, &data);
 }
 
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
 {
 	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
 				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
-				       PAGE_SHIFT);
+				       PAGE_SHIFT, READ_ONCE(kvm->arch.vmid.vmid));
 	return 0;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index b17fad091bab..b490ed1428a6 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -96,6 +96,7 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
 	unsigned long funcid = cp->a6;
+	unsigned long vmid;
 
 	switch (funcid) {
 	case SBI_EXT_RFENCE_REMOTE_FENCE_I:
@@ -103,22 +104,22 @@ static int kvm_sbi_ext_rfence_handler(struct kvm_vcpu *vcpu, struct kvm_run *run
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask);
+			kvm_riscv_hfence_vvma_all(vcpu->kvm, hbase, hmask, vmid);
 		else
 			kvm_riscv_hfence_vvma_gva(vcpu->kvm, hbase, hmask,
-						  cp->a2, cp->a3, PAGE_SHIFT);
+						  cp->a2, cp->a3, PAGE_SHIFT, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID:
+		vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 		if ((cp->a2 == 0 && cp->a3 == 0) || cp->a3 == -1UL)
-			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-						       hbase, hmask, cp->a4);
+			kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, hbase, hmask,
+						       cp->a4, vmid);
 		else
-			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-						       hbase, hmask,
-						       cp->a2, cp->a3,
-						       PAGE_SHIFT, cp->a4);
+			kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, hbase, hmask, cp->a2,
+						       cp->a3, PAGE_SHIFT, cp->a4, vmid);
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_SENT);
 		break;
 	case SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA:
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 8f4c4fa16227..368dfddd23d9 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -23,6 +23,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct kvm_cpu_trap *utrap = retdata->utrap;
+	unsigned long vmid;
 
 	switch (cp->a7) {
 	case SBI_EXT_0_1_CONSOLE_GETCHAR:
@@ -78,25 +79,21 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (cp->a7 == SBI_EXT_0_1_REMOTE_FENCE_I)
 			kvm_riscv_fence_i(vcpu->kvm, 0, hmask);
 		else if (cp->a7 == SBI_EXT_0_1_REMOTE_SFENCE_VMA) {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_all(vcpu->kvm,
-							  0, hmask);
+				kvm_riscv_hfence_vvma_all(vcpu->kvm, 0, hmask, vmid);
 			else
-				kvm_riscv_hfence_vvma_gva(vcpu->kvm,
-							  0, hmask,
-							  cp->a1, cp->a2,
-							  PAGE_SHIFT);
+				kvm_riscv_hfence_vvma_gva(vcpu->kvm, 0, hmask, cp->a1,
+							  cp->a2, PAGE_SHIFT, vmid);
 		} else {
+			vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
 			if (cp->a1 == 0 && cp->a2 == 0)
-				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm,
-							       0, hmask,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_all(vcpu->kvm, 0, hmask,
+							       cp->a3, vmid);
 			else
-				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm,
-							       0, hmask,
-							       cp->a1, cp->a2,
-							       PAGE_SHIFT,
-							       cp->a3);
+				kvm_riscv_hfence_vvma_asid_gva(vcpu->kvm, 0, hmask,
+							       cp->a1, cp->a2, PAGE_SHIFT,
+							       cp->a3, vmid);
 		}
 		break;
 	default:
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
