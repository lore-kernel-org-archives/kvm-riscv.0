Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B0FD2ED11
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyuPxRXD9tbdL5A2Yol420EUVcH/kqPpigkLkuupjMs=; b=Iuxu548vSr1zO6
	YO7HJ5XipI7sr5kAMROLEg6fC1Fel5M2d/lOvLImornuQJc4wDwHpxowe9jRqEFCAiKsUaR3cL8Hk
	VotXVYlpKwWUKPLq3yirTByOG4oVZHjTGPilKOUAV55rrSUqOAxzf3vri57nQDkWzFygcBTaMvYPr
	2ne9piC+fMdffe4uKonDo4EPgp0BISs9b+lvWtsT4Z2eSQ2yp8lRvZvtyBruXdDyi4I9ciayWFu8y
	Wi9H6fzEd3o9Sk7/fWjx20+a/ETf9dR06ZVl4oACP/gvNub6tdOQK4ndMkDXHbLgP1MIh8QMrLl/o
	zTOpH9xNhvYaoCxh9NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fd-00000003OP7-2DlC;
	Tue, 20 Jan 2026 08:01:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fJ-00000003O8t-3OhB;
	Tue, 20 Jan 2026 08:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fqLR+g9k8Wxr7mfZBi668HZxe5EI2BvZng4BOHJrIJk=; b=gyDzseLGfw7bmuZjtTsLuPsCn5
	8LMxrIkbgFQXro5ZMza47HPO/aipPfCwK3aTfDNgMloOFuLpX/H48KO8e+vUhrv+QbtHy6hxmWzz+
	nEIdJRxV27iiIpFdKHDfEGsjk1aoLRBnqSuOCsWZL+znhjDYTKEj0WeuQTrRR8pRZ6sgC5FnQty/9
	ovjeFWq4dqrlt8rDnzB3jFGJ5KShsEhtUdQ3NjZv/SmqfZM2TqXGut3PmP4UZ/LoW8cQEMgIGzfYH
	OoyIfAjeaMIeh4vhJV0PcAyKYlFUWTslYFWbW50ciE+lf1n1RYxyMwfNS/Ktl++sJtDk1JbF44h5p
	N78iz/Ow==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fF-0000000DX1T-0KCV;
	Tue, 20 Jan 2026 08:00:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61UEs3772334;
	Tue, 20 Jan 2026 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fqLR+g9k8Wx
	r7mfZBi668HZxe5EI2BvZng4BOHJrIJk=; b=os9+6AD8dCKVRTm4M4ujp1dL+on
	VDkPyMBbvHTjpv0b8eo1SrDiczYAKkvXKz4j+tjA2lykLdLGxZXjHStUp5MWv8p1
	NvFeErzQHlaW93DzTbVqLmpBY+3GFEc0ZCWn0Aj2F0tA7BpOeqO8W8SCciiF7E4r
	i6pPaRSmnNQJZckSDTOgioAHFXK8nKPl/e8oeKwb6nL9XtSMXh+sLBgjoPlGAn/C
	meoTGCHxkw0HpYnLDtgbzXVgpSHquKqJmzPK8I5Hb6XYMbUjm0OFCU78Gf838wfN
	3BV7m3ge6kQkoH+C/yb0864dj2VC+BuB8qtkXcLm/ZjWMS1ZqwSDzmSniFA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42wrbpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Grj007970;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80GHP007913;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80HYf008008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id C90EB2557B; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 16/27] RISC-V: KVM: Check and inject nested virtual interrupts
Date: Tue, 20 Jan 2026 13:30:02 +0530
Message-ID: <20260120080013.2153519-17-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _BKBdn4pUfwjnC74SjKJ7oSMnO0xFpYw
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4oXJvcVr6o6G8wQTZ_MA:9
X-Proofpoint-ORIG-GUID: _BKBdn4pUfwjnC74SjKJ7oSMnO0xFpYw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfXyaunJ5xEwBd2
 5Oh2Vgc8eBM/efoUK0/CpltJtuhULQCSd6c6ZD6xlTZ6uxIXVewVN5/5bTqZNw+H2sMD1AH2H+H
 b85R6frNf/CNNQrMQ7Vcy9YFBLOQsrHryCAj+CTu0RCHaq5iW4ll4bUGSNPVU3PaH33r57RVKCC
 pPvulvNFNCbT/5f5YJyPv2pJW02VGJRORXxq/ZHVaCGYXs+dy0NEdgw02qpteBuB1RHLUdWszS4
 u2Y74ngU+LefvjdK8kmyApCRV6yRR28IifldCgEmtDDrIuM/nuGX7oHCyh+pXJmKe5G1IwcuUlS
 KXh0QPffi8a2yknNR5u0/VC9Wfg0BmoKh/gQcz3TP+x1fzcNz346qy3Oqs5/8wSCTI81NEwmTs9
 kUBscGumVsVOz76jnM4bQis4gqxUCqMLpzWpwQr6QB3eo+gyp++mlrlj/fHtmM2SAAGAoubmWoj
 V/4lUVpHpAXW5m0PpWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080037_613449_2E4A23AD 
X-CRM114-Status: GOOD (  14.11  )
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

When entering guest in virtual-VS/VU mode (aka nested guest),
check and inject nested virtual interrupt right before guest
entry.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_vcpu_nested.h |  1 +
 arch/riscv/kvm/vcpu.c                    |  3 ++
 arch/riscv/kvm/vcpu_nested.c             | 49 ++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_nested.h b/arch/riscv/include/asm/kvm_vcpu_nested.h
index 6bfb67702610..6d9d252a378c 100644
--- a/arch/riscv/include/asm/kvm_vcpu_nested.h
+++ b/arch/riscv/include/asm/kvm_vcpu_nested.h
@@ -86,6 +86,7 @@ void kvm_riscv_vcpu_nested_set_virt(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_nested_trap_redirect(struct kvm_vcpu *vcpu,
 					 struct kvm_cpu_trap *trap,
 					 bool prev_priv);
+void kvm_riscv_vcpu_nested_vsirq_process(struct kvm_vcpu *vcpu);
 
 void kvm_riscv_vcpu_nested_reset(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_nested_init(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 077637aff9a2..f8c4344c2b1f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -934,6 +934,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		kvm_riscv_local_tlb_sanitize(vcpu);
 
+		/* Check and inject nested virtual interrupts */
+		kvm_riscv_vcpu_nested_vsirq_process(vcpu);
+
 		trace_kvm_entry(vcpu);
 
 		guest_timing_enter_irqoff();
diff --git a/arch/riscv/kvm/vcpu_nested.c b/arch/riscv/kvm/vcpu_nested.c
index 214206fc28bb..9b2b3369a232 100644
--- a/arch/riscv/kvm/vcpu_nested.c
+++ b/arch/riscv/kvm/vcpu_nested.c
@@ -172,6 +172,55 @@ void kvm_riscv_vcpu_nested_trap_redirect(struct kvm_vcpu *vcpu,
 				       false, prev_priv, gva);
 }
 
+void kvm_riscv_vcpu_nested_vsirq_process(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_nested *ns = &vcpu->arch.nested;
+	struct kvm_vcpu_nested_csr *nsc = &ns->csr;
+	struct kvm_cpu_trap trap;
+	unsigned long irqs;
+	bool next_spp;
+	int vsirq;
+
+	/* Do nothing if nested virtualization is OFF */
+	if (!ns->virt)
+		return;
+
+	/* Determine the virtual-VS mode interrupt number */
+	vsirq = 0;
+	irqs = nsc->hvip;
+	irqs &= nsc->vsie << VSIP_TO_HVIP_SHIFT;
+	irqs &= nsc->hideleg;
+	if (irqs & BIT(IRQ_VS_EXT))
+		vsirq = IRQ_S_EXT;
+	else if (irqs & BIT(IRQ_VS_TIMER))
+		vsirq = IRQ_S_TIMER;
+	else if (irqs & BIT(IRQ_VS_SOFT))
+		vsirq = IRQ_S_SOFT;
+	if (vsirq <= 0)
+		return;
+
+	/*
+	 * Determine whether we are resuming in virtual-VS mode
+	 * or virtual-VU mode.
+	 */
+	next_spp = !!(vcpu->arch.guest_context.sstatus & SR_SPP);
+
+	/*
+	 * If we are going to virtual-VS mode and interrupts are
+	 * disabled then do nothing.
+	 */
+	if (next_spp && !(ncsr_read(CSR_VSSTATUS) & SR_SIE))
+		return;
+
+	/* Take virtual-VS mode interrupt */
+	trap.scause = CAUSE_IRQ_FLAG | vsirq;
+	trap.sepc = vcpu->arch.guest_context.sepc;
+	trap.stval = 0;
+	trap.htval = 0;
+	trap.htinst = 0;
+	kvm_riscv_vcpu_trap_smode_redirect(vcpu, &trap, next_spp);
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
