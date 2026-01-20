Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E1D2ED16
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu8h4oY664KL8MYZiThgEsRBL7MwO2kwDLGJsEeGNeQ=; b=Lt91RDU+kHH7bk
	9aBSGAvGMLznKjhCRfb1944H7CA8M65Ebn0miWT7yUFEyALKPoPVQzH2Iwypo0Cb4kiCO7M4m3cWj
	0CUvgGfdXNe+RG33jRsnhy7U4u7jlST9Pb+JnlSFjB+4/7fAzwQI6B4oqsRg4gNDJ4mlp5dlxkJhJ
	BeC8JpqGs+ON+2br6VszSnLVE+qb5H3uBHupkE1qtNdO039g4NDow8jiMptjbsMTJUaOakgzJjANH
	Ux0TjdP2R2bQ1ZF8PxEJwGCmUyODFyp5K5YyZBhUSWjsBrLbOlB0ZeiVZerExvCSOjewGWtB05F/Q
	uGn1KW+IByxEILZphyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fe-00000003ORi-3rmP;
	Tue, 20 Jan 2026 08:01:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fJ-00000003O8v-3UFN;
	Tue, 20 Jan 2026 08:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R8FQczWtBUy5v1pZmDCxmjtbD0OvwMcba0xNdmFzHV4=; b=olLBRD/ISeWnBsRyNbBzEDyKyd
	IaOzAWJEmY+lqO8qliFWpB8UYAUKOSOS6f5RwFIalqz2en1TSlBLydV5e3UsY/ro/WAzvbLnGF1ki
	5Yz9kgvPcAr5ZQOCgNPSSDveAYFYd2o9NbrXPS1da1O1qKmllW5HOCSdo8Zlgy7NXnvZ5noBmwSng
	nTw0rzcHdgDVpXX5YDcuhn5h948Muk5UfruOgtod+KzPXJ1mChSmkDoZD1xT9uqBZOSvaVRDNqp9o
	QJP5KLlZ8pQ4cjxV4TRGDi34Zmhjq9yxgPV15+mJQsOKLBSxhcQxvV2hkYBGxK9G/krlJaT4rsrP+
	Pit4L7+Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fF-0000000DX1J-0X8Q;
	Tue, 20 Jan 2026 08:00:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K71Z4u1408482;
	Tue, 20 Jan 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R8FQczWtBUy
	5v1pZmDCxmjtbD0OvwMcba0xNdmFzHV4=; b=l7XFxBTsa+3WWzGbTlDuezdZYdf
	+gkxX6/VKNoaPK9SSVYNOtDKAG0Hv/guXZdg5Z6g+8TZjcaku72Z0+qeANdh0TtE
	4dbEKUWtcTao9t/7mxWyDg5WhtXtxcF5yF2Q87XszKqpjJTX6L+Nkh6eikLgWCR1
	i5KBAdUQNYJQ04ibNByoPHAm9qV/e+SUrpo8Y1HBXInzyA1XIYnARClX5DJXLHjd
	9RlU2z+WzKXG+b2SbIX7suUjoVWNOokHIVNJxEJB2Z8r4vWPHpoXja5/CnnirzO8
	FOm1Dv7kaektgbXR4eLXjH8LblC5IrbeHjfdVlqED6HSZDCY1U8lCwrSPxg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4y2r5a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80G0a007954;
	Tue, 20 Jan 2026 08:00:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80FZe007832;
	Tue, 20 Jan 2026 08:00:18 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80H7Z008013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id CFCAE25597; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 18/27] RISC-V: KVM: Trap-n-emulate SRET for Guest HS-mode
Date: Tue, 20 Jan 2026 13:30:04 +0530
Message-ID: <20260120080013.2153519-19-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfXyK6u780okVE7
 aLxDXZePncjbDgTdiv1jihYvHt/Cepr1RqJtMijVZy8Hzti3/8FRj8eTP6YQ7GaahSRPNyJixsE
 ++hXGY36MfXLqYBnOuX5PpjOCyIGOk4Vlwm2VIbrXxmIcVCRhcx0v2f1k/8HS/4/I9fizs8DlCR
 5krU6RIEaPMZ4DJlUCqnXdLgOeiqygweLGoz+FHJf98JvuusJpIY67n5v1qka2nX3+6j0Ndxnj9
 8QpUD/ky6yYPNNW7wrRd0vv3ObdMthgLDPgT+0V5eSywIFpHUJei8XNxQc9MF1VcZh6VwAFrfKF
 ymiiLNvh2tYJokhVb6MYMTVl4/PsHna2VKcQU2dKmHwf4YwyLGEngAsGNVFQT3rV9vyUVC9ia9i
 cUPCQ+Zamskj0qT7PstAk0cZg9hD5m3A407TCuJE2B9QseBydRT8HDMyTlRDJZ76WcI9Zpls8eG
 a4udiD1+6exiyXmBDxQ==
X-Authority-Analysis: v=2.4 cv=Ds1bOW/+ c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=geURt3utUUeLdx-e4vsA:9
X-Proofpoint-GUID: 6T3tHglOs3WQkVdbI-7TE9YEkgg7akAs
X-Proofpoint-ORIG-GUID: 6T3tHglOs3WQkVdbI-7TE9YEkgg7akAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080037_589334_0E7F1290 
X-CRM114-Status: GOOD (  20.00  )
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

The guest HS-mode (aka L1/guest hypervisor) can enter Guest VS/VU-mode
(aka L2/nested guest) using the SRET instruction. To achieve this, host
host hypervisor must trap-n-emulate SRET instruction for guest HS-mode
(aka L1/guest hypervisor) using host hstatus.VTSR bit.

Trapping all SRET instructions executed by guest HS-mode (aka L1/guest
hypervisor) will impact performance so host hypervisor will only set
hstatus.VTSR bit when guest sets HSTATUS.SPV bit and hstatus.VTSR bit
is cleared by SRET emulation upon entry into guest VS/VU-mode.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/insn.h            |  3 ++
 arch/riscv/include/asm/kvm_vcpu_nested.h |  2 +
 arch/riscv/kvm/Makefile                  |  1 +
 arch/riscv/kvm/vcpu_insn.c               |  6 +++
 arch/riscv/kvm/vcpu_nested_insn.c        | 54 ++++++++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_nested_insn.c

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..24a8abb3283c 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -331,6 +331,9 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 #define INSN_OPCODE_SHIFT	2
 #define INSN_OPCODE_SYSTEM	28
 
+#define INSN_MASK_SRET		0xffffffff
+#define INSN_MATCH_SRET		0x10200073
+
 #define INSN_MASK_WFI		0xffffffff
 #define INSN_MATCH_WFI		0x10500073
 
diff --git a/arch/riscv/include/asm/kvm_vcpu_nested.h b/arch/riscv/include/asm/kvm_vcpu_nested.h
index 6d9d252a378c..665c60f09ee6 100644
--- a/arch/riscv/include/asm/kvm_vcpu_nested.h
+++ b/arch/riscv/include/asm/kvm_vcpu_nested.h
@@ -63,6 +63,8 @@ struct kvm_vcpu_nested {
 
 #define kvm_riscv_vcpu_nested_virt(__vcpu) ((__vcpu)->arch.nested.virt)
 
+int kvm_riscv_vcpu_nested_insn_sret(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn);
+
 int kvm_riscv_vcpu_nested_swtlb_xlate(struct kvm_vcpu *vcpu,
 				      const struct kvm_cpu_trap *trap,
 				      struct kvm_gstage_mapping *out_map,
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index a8806b69205f..c0534d4a469e 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -26,6 +26,7 @@ kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
 kvm-y += vcpu_insn.o
 kvm-y += vcpu_nested.o
+kvm-y += vcpu_nested_insn.o
 kvm-y += vcpu_nested_swtlb.o
 kvm-y += vcpu_onereg.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 4d89b94128ae..745cd654df94 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
+#include <asm/kvm_vcpu_nested.h>
 
 struct insn_func {
 	unsigned long mask;
@@ -257,6 +258,11 @@ static const struct insn_func system_opcode_funcs[] = {
 		.match = INSN_MATCH_CSRRCI,
 		.func  = csr_insn,
 	},
+	{
+		.mask  = INSN_MASK_SRET,
+		.match = INSN_MATCH_SRET,
+		.func  = kvm_riscv_vcpu_nested_insn_sret,
+	},
 	{
 		.mask  = INSN_MASK_WFI,
 		.match = INSN_MATCH_WFI,
diff --git a/arch/riscv/kvm/vcpu_nested_insn.c b/arch/riscv/kvm/vcpu_nested_insn.c
new file mode 100644
index 000000000000..8f5b2992dbb9
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_nested_insn.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_vcpu_insn.h>
+
+int kvm_riscv_vcpu_nested_insn_sret(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
+{
+	unsigned long vsstatus, next_sepc, next_spp;
+	bool next_virt;
+
+	/*
+	 * Trap from virtual-VS/VU modes should be forwarded to
+	 * virtual-HS mode as a virtual instruction trap.
+	 */
+	if (kvm_riscv_vcpu_nested_virt(vcpu))
+		return KVM_INSN_VIRTUAL_TRAP;
+
+	/*
+	 * Trap from virtual-U mode should be forwarded to
+	 * virtual-HS mode as illegal instruction trap.
+	 */
+	if (!(vcpu->arch.guest_context.hstatus & HSTATUS_SPVP))
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	vsstatus = ncsr_read(CSR_VSSTATUS);
+
+	/*
+	 * Find next nested virtualization mode, next privilege mode,
+	 * and next sepc
+	 */
+	next_virt = (vcpu->arch.nested.csr.hstatus & HSTATUS_SPV) ? true : false;
+	next_sepc = ncsr_read(CSR_VSEPC);
+	next_spp = vsstatus & SR_SPP;
+
+	/* Update Guest sstatus.sie */
+	vsstatus &= ~SR_SIE;
+	vsstatus |= (vsstatus & SR_SPIE) ? SR_SIE : 0;
+	ncsr_write(CSR_VSSTATUS, vsstatus);
+
+	/* Update return address and return privilege mode*/
+	vcpu->arch.guest_context.sepc = next_sepc;
+	vcpu->arch.guest_context.sstatus &= ~SR_SPP;
+	vcpu->arch.guest_context.sstatus |= next_spp;
+
+	/* Set nested virtualization state based on guest hstatus.SPV */
+	kvm_riscv_vcpu_nested_set_virt(vcpu, NESTED_SET_VIRT_EVENT_SRET,
+				       next_virt, false, false);
+
+	return KVM_INSN_CONTINUE_SAME_SEPC;
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
