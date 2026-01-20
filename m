Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3433AD2ED14
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txV/A5j+MG5ER2ynSgSlPB7BiFK7j+PgkfCwn9U/doU=; b=jFjsBD0ZsZHB+D
	BF7WHqHGE5R1DXtewYCNyEkNVxtqCnDX0X4I/KZiPpzzU9mcYNFPApL/ZSI2a2E+pR6DC9aJ1GJdM
	bur5yjdF64hjC1aFMO+EhGS02QxzCeMn4i82gSlnHU6LSu29mcc6JlE+HtiT+2Cu3AkUwzwYRMtdp
	aTkdlH8s07PDxvwU0PxlLr0xzkDWiIK6KAfEEpMfAscMckD5N2LSqtGV8cmEgpYVekx5OJCXByRJI
	3HNlFypdVeUKxs2PfhvU6mxAxlPtN5fix9M5YfXzM4KRVfllQ3pqZpL+G2F6WSy6f28/GFcOoDaWl
	L6JiW+cMHO4oVSpNWhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fd-00000003OPU-3NfT;
	Tue, 20 Jan 2026 08:01:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fG-00000003O7M-433N;
	Tue, 20 Jan 2026 08:00:43 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5UoPW774076;
	Tue, 20 Jan 2026 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cZTpAxcP9z8
	a0OAJSNBpKMeHkvi2gDPdFbwYijflKWU=; b=WFG/Y1wjJqKUhXPnQKLEQHp1nHW
	MVUcQ+ivNzfuw5VqaNwwlRYUeJmRsK23eckHoC8G8ogpuUis/sAQe/Xet9cHsVa5
	dTBd0qm/I8FUyoK4wTowL8kwbxScwxIHHwO+oUAWlZrXUQ5fDgDp3NydJ5ZDPoNF
	ApXnP4DfnGH7w3EKxUjSXhTz9npJgq+HyuhPgM74vzfbNyed4VSxGfWM27urwOa/
	rbr1SaI/2EM7TCco0q4D/jMblOElc2B7seavorEa2VcArq3ldvIi/xGDpxOSn/W0
	mdp4dfxn8DEBeAgprhnpOSkNuX+aPpbG2oXQcqvShyoypvPfeZbasuTy7JA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9ab743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80HnM008067;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80GTK007912;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80Hvk008004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C5BE325579; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 15/27] RISC-V: KVM: Extend trap redirection for nested virtualization
Date: Tue, 20 Jan 2026 13:30:01 +0530
Message-ID: <20260120080013.2153519-16-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FK8E5Qck1I85jUPsO4PK6KZvLfW3BGez
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=8oevvQFq_g5LQl22nIQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX5ARfViYaB5HK
 CGiafPRidv14WLMTRrOofrsaahTngq2zUuPBTL48Af7MwSV/xh26u08xFWJEnK98odIRcKNtBG1
 yIyYGIAfcvOi0rcDk+cjdYHChkOQ+zLCO5kDOoRQdqIA6A1GDN007vpbCT8SW0BVp3u308HlcCk
 2/SHdfxT5SynNw+PJMZkvnwCkBoEd8/mu3x4J+M0XpHjeAqoyXZMvjwgEcIsJb1bivUmucbE60c
 uuuPbstCya1rWoQOI26QjeYDKBJBRir/W27+dYX4zKQjeDZ5JEQtEDGC5HFOOkpJN+q6dXVHc8+
 YlnkSCm09npLIJhK6DqgMRb2pss3ac6aFPkLJ8PzAs+uEyjHimcF0yan2KaE2f178yCBnEMBmxe
 Lb9N2gQSO0qPjJLEhiN0FOb9vkppZxEMKfX/aQviQZycpAB+A1O1n5MzWxG9uT5L3aofhGNx2+K
 tS+BOqmj/wAl48XBLvg==
X-Proofpoint-GUID: FK8E5Qck1I85jUPsO4PK6KZvLfW3BGez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_000039_029625_E384732D 
X-CRM114-Status: GOOD (  20.33  )
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

The L0/host hypervisor must always redirect traps to the L1/guest
hypervisor so extend KVM RISC-V to perform the necessary nested
world-switch when redirecting traps.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_host.h        |   3 +
 arch/riscv/include/asm/kvm_vcpu_nested.h |  12 ++
 arch/riscv/kvm/vcpu_exit.c               |  28 +++-
 arch/riscv/kvm/vcpu_nested.c             | 162 +++++++++++++++++++++++
 4 files changed, 201 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 3b58953eb4eb..c510564a09a2 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -289,6 +289,9 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 					 bool read_insn,
 					 unsigned long guest_addr,
 					 struct kvm_cpu_trap *trap);
+void kvm_riscv_vcpu_trap_smode_redirect(struct kvm_vcpu *vcpu,
+					struct kvm_cpu_trap *trap,
+					bool prev_priv);
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap);
 int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
diff --git a/arch/riscv/include/asm/kvm_vcpu_nested.h b/arch/riscv/include/asm/kvm_vcpu_nested.h
index 4234c6e81bb6..6bfb67702610 100644
--- a/arch/riscv/include/asm/kvm_vcpu_nested.h
+++ b/arch/riscv/include/asm/kvm_vcpu_nested.h
@@ -75,6 +75,18 @@ void kvm_riscv_vcpu_nested_swtlb_reset(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_nested_swtlb_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_nested_swtlb_deinit(struct kvm_vcpu *vcpu);
 
+enum kvm_vcpu_nested_set_virt_event {
+	NESTED_SET_VIRT_EVENT_TRAP = 0,
+	NESTED_SET_VIRT_EVENT_SRET
+};
+
+void kvm_riscv_vcpu_nested_set_virt(struct kvm_vcpu *vcpu,
+				    enum kvm_vcpu_nested_set_virt_event event,
+				    bool virt, bool spvp, bool gva);
+void kvm_riscv_vcpu_nested_trap_redirect(struct kvm_vcpu *vcpu,
+					 struct kvm_cpu_trap *trap,
+					 bool prev_priv);
+
 void kvm_riscv_vcpu_nested_reset(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_nested_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_nested_deinit(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 4f63548e582f..aeec4c4eee06 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -149,19 +149,21 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 }
 
 /**
- * kvm_riscv_vcpu_trap_redirect -- Redirect trap to Guest
+ * kvm_riscv_vcpu_trap_smode_redirect -- Redirect S-mode trap to Guest
  *
  * @vcpu: The VCPU pointer
  * @trap: Trap details
+ * @prev_priv: Previous privilege mode (true: S-mode, false: U-mode)
  */
-void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
-				  struct kvm_cpu_trap *trap)
+void kvm_riscv_vcpu_trap_smode_redirect(struct kvm_vcpu *vcpu,
+					struct kvm_cpu_trap *trap,
+					bool prev_priv)
 {
 	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
 
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
-	if (vcpu->arch.guest_context.sstatus & SR_SPP)
+	if (prev_priv)
 		vsstatus |= SR_SPP;
 
 	/* Change Guest SSTATUS.SPIE bit */
@@ -187,6 +189,24 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
 }
 
+/**
+ * kvm_riscv_vcpu_trap_redirect -- Redirect HS-mode trap to Guest
+ *
+ * @vcpu: The VCPU pointer
+ * @trap: Trap details
+ */
+void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
+				  struct kvm_cpu_trap *trap)
+{
+	bool prev_priv = (vcpu->arch.guest_context.sstatus & SR_SPP) ? true : false;
+
+	/* Update Guest nested state */
+	kvm_riscv_vcpu_nested_trap_redirect(vcpu, trap, prev_priv);
+
+	/* Update Guest supervisor state */
+	kvm_riscv_vcpu_trap_smode_redirect(vcpu, trap, prev_priv);
+}
+
 static inline int vcpu_redirect(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
 {
 	int ret = -EFAULT;
diff --git a/arch/riscv/kvm/vcpu_nested.c b/arch/riscv/kvm/vcpu_nested.c
index 3c30d35b3b39..214206fc28bb 100644
--- a/arch/riscv/kvm/vcpu_nested.c
+++ b/arch/riscv/kvm/vcpu_nested.c
@@ -3,13 +3,175 @@
  * Copyright (c) 2026 Qualcomm Technologies, Inc.
  */
 
+#include <linux/smp.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_mmu.h>
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_nested_available);
 
 static bool __read_mostly enable_nested_virt;
 module_param(enable_nested_virt, bool, 0644);
 
+void kvm_riscv_vcpu_nested_set_virt(struct kvm_vcpu *vcpu,
+				    enum kvm_vcpu_nested_set_virt_event event,
+				    bool virt, bool spvp, bool gva)
+{
+	struct kvm_vcpu_nested *ns = &vcpu->arch.nested;
+	struct kvm_vcpu_nested_csr *nsc = &ns->csr;
+	unsigned long tmp, sr_fs_vs_mask = 0;
+	int cpu;
+
+	/* If H-extension is not available for VCPU then do nothing */
+	if (!riscv_isa_extension_available(vcpu->arch.isa, h))
+		return;
+
+	/* Grab the CPU to ensure we remain on same CPU */
+	cpu = get_cpu();
+
+	/* Skip hardware CSR update if no change in virt state */
+	if (virt == ns->virt)
+		goto skip_csr_update;
+
+	/* Update config CSRs (aka hedeleg, hideleg, henvcfg, and hstateeX) */
+	kvm_riscv_vcpu_config_load(vcpu, virt);
+
+	/* Update time delta */
+	kvm_riscv_vcpu_update_timedelta(vcpu, virt);
+
+	/* Update G-stage page table */
+	kvm_riscv_mmu_update_hgatp(vcpu, virt);
+
+	/* Swap hardware vs<xyz> CSRs except vsie and vsstatus */
+	nsc->vstvec = ncsr_swap(CSR_VSTVEC, nsc->vstvec);
+	nsc->vsscratch = ncsr_swap(CSR_VSSCRATCH, nsc->vsscratch);
+	nsc->vsepc = ncsr_swap(CSR_VSEPC, nsc->vsepc);
+	nsc->vscause = ncsr_swap(CSR_VSCAUSE, nsc->vscause);
+	nsc->vstval = ncsr_swap(CSR_VSTVAL, nsc->vstval);
+	nsc->vsatp = ncsr_swap(CSR_VSATP, nsc->vsatp);
+
+	/* Update vsstatus CSR */
+	if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
+	    riscv_isa_extension_available(vcpu->arch.isa, d))
+		sr_fs_vs_mask |= SR_FS;
+	if (riscv_isa_extension_available(vcpu->arch.isa, v))
+		sr_fs_vs_mask |= SR_VS;
+	if (virt) {
+		/*
+		 * Update vsstatus in following manner:
+		 * 1) Swap hardware vsstatus (i.e. virtual-HS mode sstatus) with
+		 *    vsstatus in nested virtualization context (i.e. virtual-VS
+		 *    mode sstatus)
+		 * 2) Swap host sstatus.[FS|VS] (i.e. HS mode sstatus.[FS|VS])
+		 *    with the vsstatus.[FS|VS] saved in nested virtualization
+		 *    context (i.e. virtual-HS mode sstatus.[FS|VS])
+		 */
+		nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
+		tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
+		vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
+		vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
+		nsc->vsstatus &= ~sr_fs_vs_mask;
+		nsc->vsstatus |= tmp;
+	} else {
+		/*
+		 * Update vsstatus in following manner:
+		 * 1) Swap host sstatus.[FS|VS] (i.e. virtual-HS mode sstatus.[FS|VS])
+		 *    with vsstatus.[FS|VS] saved in the nested virtualization
+		 *    context (i.e. HS mode sstatus.[FS|VS])
+		 * 2) Swap hardware vsstatus (i.e. virtual-VS mode sstatus) with
+		 *    vsstatus in nested virtualization context (i.e. virtual-HS
+		 *    mode sstatus)
+		 */
+		tmp = vcpu->arch.guest_context.sstatus & sr_fs_vs_mask;
+		vcpu->arch.guest_context.sstatus &= ~sr_fs_vs_mask;
+		vcpu->arch.guest_context.sstatus |= (nsc->vsstatus & sr_fs_vs_mask);
+		nsc->vsstatus &= ~sr_fs_vs_mask;
+		nsc->vsstatus |= tmp;
+		nsc->vsstatus = ncsr_swap(CSR_VSSTATUS, nsc->vsstatus);
+	}
+
+skip_csr_update:
+	if (event != NESTED_SET_VIRT_EVENT_SRET) {
+		/* Update guest hstatus.SPV bit */
+		nsc->hstatus &= ~HSTATUS_SPV;
+		nsc->hstatus |= (ns->virt) ? HSTATUS_SPV : 0;
+
+		/* Update guest hstatus.SPVP bit */
+		if (ns->virt) {
+			nsc->hstatus &= ~HSTATUS_SPVP;
+			if (spvp)
+				nsc->hstatus |= HSTATUS_SPVP;
+		}
+
+		/* Update guest hstatus.GVA bit */
+		if (event == NESTED_SET_VIRT_EVENT_TRAP) {
+			nsc->hstatus &= ~HSTATUS_GVA;
+			nsc->hstatus |= (gva) ? HSTATUS_GVA : 0;
+		}
+	}
+
+	/* Update host SRET trapping */
+	vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTSR;
+	if (virt) {
+		if (nsc->hstatus & HSTATUS_VTSR)
+			vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
+	} else {
+		if (nsc->hstatus & HSTATUS_SPV)
+			vcpu->arch.guest_context.hstatus |= HSTATUS_VTSR;
+	}
+
+	/* Update host VM trapping */
+	vcpu->arch.guest_context.hstatus &= ~HSTATUS_VTVM;
+	if (virt && (nsc->hstatus & HSTATUS_VTVM))
+		vcpu->arch.guest_context.hstatus |= HSTATUS_VTVM;
+
+	/* Update virt flag */
+	ns->virt = virt;
+
+	/* Release CPU */
+	put_cpu();
+}
+
+void kvm_riscv_vcpu_nested_trap_redirect(struct kvm_vcpu *vcpu,
+					 struct kvm_cpu_trap *trap,
+					 bool prev_priv)
+{
+	bool gva;
+
+	/* Do nothing if H-extension is not available for VCPU */
+	if (!riscv_isa_extension_available(vcpu->arch.isa, h))
+		return;
+
+	/* Determine GVA bit state */
+	gva = false;
+	switch (trap->scause) {
+	case EXC_INST_MISALIGNED:
+	case EXC_INST_ACCESS:
+	case EXC_LOAD_MISALIGNED:
+	case EXC_LOAD_ACCESS:
+	case EXC_STORE_MISALIGNED:
+	case EXC_STORE_ACCESS:
+	case EXC_INST_PAGE_FAULT:
+	case EXC_LOAD_PAGE_FAULT:
+	case EXC_STORE_PAGE_FAULT:
+	case EXC_INST_GUEST_PAGE_FAULT:
+	case EXC_LOAD_GUEST_PAGE_FAULT:
+	case EXC_STORE_GUEST_PAGE_FAULT:
+		gva = true;
+		break;
+	default:
+		break;
+	}
+
+	/* Update Guest HTVAL and HTINST */
+	vcpu->arch.nested.csr.htval = trap->htval;
+	vcpu->arch.nested.csr.htinst = trap->htinst;
+
+	/* Turn-off nested virtualization for virtual-HS mode */
+	kvm_riscv_vcpu_nested_set_virt(vcpu, NESTED_SET_VIRT_EVENT_TRAP,
+				       false, prev_priv, gva);
+}
+
 void kvm_riscv_vcpu_nested_reset(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_nested *ns = &vcpu->arch.nested;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
