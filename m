Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA9D2ED11
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/omUaMOqFPOwaSYvJMRofQe35iF7lhWtc5kc0SEivA=; b=SQpAN0MajH7Tn4
	0n4Ut9nG1jwKK+kLWEf+oWoVo3RrGF7UJdWtvWQyUGptZd4wnAgJn9CUNlUrmO8BthJobtOEOeody
	pAzTyDHREoElJsmSdkXTdkZlsm95iDBBJBcAbCAMujFqC7JbR8zmxF3oFOVv+yr0DEXuMyB6wJ/l4
	55nqL96kuJYo//smUlZ48ribI9I6YhPQa/CS5DdZcm/2YIp7COHXpdcvK4NL6IfHGivU+7oF9wB5A
	DDOvQhd44mdKDw5q0KSid76+K0ZuhZnmrLbYLQeY2S1T4nHluoh5fCQG5asxgmcnwJzZMJ7FNLqil
	hjMLFhvubKBOOoL0KDvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gC-00000003PAm-1e6T;
	Tue, 20 Jan 2026 08:01:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fS-00000003OEr-3DIE;
	Tue, 20 Jan 2026 08:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ob1mlZuf6a3qKt/RLGrn0uawIMSCBNu0l6O01IE8x3g=; b=l9G3FLtQkvSl0crnwVmUNHn0VS
	E8W+Pgm2ImKb9esptuHY/Hq5sGKmfNK+g+Nc9iQFx+X/DtF+06Q4TaKQs4LY+KJ4kJ55VxuXis6OZ
	4UZmSwOy8wtyoj/zeiHhk6P9dtkPSnM2ACLIapIevPugTMa/QxBfP4ajRmly3vbL4gB96lX+6ytws
	E//GI1eJ78ySb7ERwG/YtXopoEjz8htW4XmknUhoh2c+WVv6u/sznTcac0AYqDhTjd82DB6/sqp2V
	D+XUxlsUiH0F1xbN8ORPMBLK/JAUB0p6joOM285ZDNSGJbupyKX0Nlw4Swllw1RIST3TIBLJSMRCa
	+uFH4fIw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fP-0000000DX5r-2AC0;
	Tue, 20 Jan 2026 08:00:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sOXm3252508;
	Tue, 20 Jan 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ob1mlZuf6a3
	qKt/RLGrn0uawIMSCBNu0l6O01IE8x3g=; b=HTwqJf8dC9MyH49l2NSgCMRC9fN
	FBpmg7HgYjcPO9VdDFtFfB9P/TfK9ey63NZ1LnKPzXsy9HO73Sti5ADxVm9wa1dy
	47vss/El8IS+6DueILtFEFaG2fLFrnImcV3lbfTcVVGF5g1+Uvrqm5vShZFx0jxe
	C4iMhfGt2pgC9mo5rQhp3iSDG3bbhtixJrfQUJJjrDdmqL5YeW5FIGDFn/2e7NjH
	Nj0P7eYoD4yxSox+sESqdBfPfiUV+VGyGBwOE4ROH1hKUEavJNcCBkJNQ6TKV34u
	B3jU9BBgrQv3WTbWy8RlDByqF6yxNwdPaP9LQyHgZyYRKv3MZuW5TaYBftA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27agnka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Grg007970;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80GTI007912;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80GUw007886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BB45C253A8; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 12/27] RISC-V: KVM: Extend kvm_riscv_mmu_update_hgatp() for nested virtualization
Date: Tue, 20 Jan 2026 13:29:58 +0530
Message-ID: <20260120080013.2153519-13-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Z4Y5wbfdm6zErcMift1pGtLMBaHW6RUX
X-Proofpoint-GUID: Z4Y5wbfdm6zErcMift1pGtLMBaHW6RUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX33fnU3c8zIr4
 gH4RfQwC6w3MhaL3EjteBQlmHFPhvHaIb9bAwX8jxbKZhSVMb937mpb8rwgD38a66K5CS+GxuZ3
 33k4pIEhVe9iyMFL+hgT6s2nGhcqEsAI3kdxoIqYCS7FvqnTYkNx79F4n+WPfgY9H64ZMRJn6Wa
 g94okMaSZkWZUafuLzP9n9Fq8cb5apLqEyoOLlphapaYuITh/HuX6yjjDBMVPtJBQiyZndTp+Uy
 cBU/y7AOy7KhDMi57bHewlTJQtCdDSZ5IWGkJetSI7pArYwUaMIoAO2pUW944VRZyxDD1xYsh1R
 SD8WZvoXPHhFY4h/XSO7Lx2hEn9zcFlkBCOX1RQobUeLAzJ1MCqpmH7blx/IrO5iYH0Rl855e4l
 5tzclSPo35dPxZxIRPxckRP1eNBNlKDHfcK4o/ooSBtINoVRk/2FdsDXaTvmdGDDn3QADfvSJkh
 7R+Um+ipi60URDRKhsA==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f3613 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=43aeVLiLvglnvyQWThcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1011 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080048_008235_ADF6B7E7 
X-CRM114-Status: GOOD (  15.71  )
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

The kvm_riscv_mmu_update_hgatp() will be also used for when switching
between guest HS-mode and guest VS/VU-mode so extend it accordingly.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  2 ++
 arch/riscv/include/asm/kvm_mmu.h    |  2 +-
 arch/riscv/kvm/gstage.c             | 14 ++++++++++++++
 arch/riscv/kvm/mmu.c                | 18 ++++++++----------
 arch/riscv/kvm/vcpu.c               |  4 ++--
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 595e2183173e..007a5fd7a526 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -67,6 +67,8 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 
 void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end);
 
+void kvm_riscv_gstage_update_hgatp(phys_addr_t pgd_phys, unsigned long vmid);
+
 void kvm_riscv_gstage_mode_detect(void);
 
 #endif
diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
index 5439e76f0a96..cc5994ec2805 100644
--- a/arch/riscv/include/asm/kvm_mmu.h
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -16,6 +16,6 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 		      struct kvm_gstage_mapping *out_map);
 int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_mmu_free_pgd(struct kvm *kvm);
-void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu);
+void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu, bool nested_virt);
 
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..7834e1178b68 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/pgtable.h>
 #include <asm/kvm_gstage.h>
+#include <asm/kvm_nacl.h>
 
 #ifdef CONFIG_64BIT
 unsigned long kvm_riscv_gstage_mode __ro_after_init = HGATP_MODE_SV39X4;
@@ -313,6 +314,19 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	}
 }
 
+void kvm_riscv_gstage_update_hgatp(phys_addr_t pgd_phys, unsigned long vmid)
+{
+	unsigned long hgatp = kvm_riscv_gstage_mode << HGATP_MODE_SHIFT;
+
+	hgatp |= (vmid << HGATP_VMID_SHIFT) & HGATP_VMID;
+	hgatp |= (pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
+
+	ncsr_write(CSR_HGATP, hgatp);
+
+	if (!kvm_riscv_gstage_vmid_bits())
+		kvm_riscv_local_hfence_gvma_all();
+}
+
 void __init kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 0b75eb2a1820..250606f5aa41 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -14,7 +14,6 @@
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
 #include <asm/kvm_mmu.h>
-#include <asm/kvm_nacl.h>
 
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
@@ -597,16 +596,15 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
 }
 
-void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
+void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu, bool nested_virt)
 {
-	unsigned long hgatp = kvm_riscv_gstage_mode << HGATP_MODE_SHIFT;
+	struct kvm_vcpu_nested_swtlb *nst = &vcpu->arch.nested.swtlb;
 	struct kvm_arch *k = &vcpu->kvm->arch;
+	unsigned long vmid = READ_ONCE(k->vmid.vmid);
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
-	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
-
-	ncsr_write(CSR_HGATP, hgatp);
-
-	if (!kvm_riscv_gstage_vmid_bits())
-		kvm_riscv_local_hfence_gvma_all();
+	if (nested_virt)
+		kvm_riscv_gstage_update_hgatp(nst->shadow_pgd_phys,
+					      kvm_riscv_gstage_nested_vmid(vmid));
+	else
+		kvm_riscv_gstage_update_hgatp(k->pgd_phys, vmid);
 }
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 859c8e71df65..178a4409d4e9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -585,7 +585,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		csr_write(CSR_VSATP, csr->vsatp);
 	}
 
-	kvm_riscv_mmu_update_hgatp(vcpu);
+	kvm_riscv_mmu_update_hgatp(vcpu, kvm_riscv_vcpu_nested_virt(vcpu));
 
 	kvm_riscv_vcpu_timer_restore(vcpu);
 
@@ -677,7 +677,7 @@ static int kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 			kvm_riscv_reset_vcpu(vcpu, true);
 
 		if (kvm_check_request(KVM_REQ_UPDATE_HGATP, vcpu))
-			kvm_riscv_mmu_update_hgatp(vcpu);
+			kvm_riscv_mmu_update_hgatp(vcpu, kvm_riscv_vcpu_nested_virt(vcpu));
 
 		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
 			kvm_riscv_fence_i_process(vcpu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
