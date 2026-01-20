Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0580D2ED0F
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a71/uPonlcTMdd95BmNFaCdo/Io5SY0cse3J7goigt0=; b=Wgaziu3FjKZZJE
	gy706J1MD6/0CuvoHVJSUmdd4FSNHFP9+J20zH00h1ViVHWCzbDEl0n7JES1IPDwrr3c2NuEOu2fz
	bYVEkxbBglaycs25+KE0/p+D2sHCaTIJPNeP3h/BORsbkzoV8dvR+d/wAReA1wL96kf1HCmyJUD5a
	ekps7fnReWrJGo1bjWMbF6T81e+Lxs3FP7u6ohtZI6P/6LMkPiCcVW73MiNt5xeZh9sKMmJrmSlaU
	LMQ52UM55m1ppXYButzSjfc8beD28IQ8/kbfwet7c1CxT5Oa3wYcBSLhyi+WUc3eqHv9xY7CtGRiH
	gW3BJxxcLoZyOb2aEnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6nL-00000003REZ-1cXk;
	Tue, 20 Jan 2026 08:08:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6nI-00000003RDf-2hiG;
	Tue, 20 Jan 2026 08:08:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2D8RZ1347458;
	Tue, 20 Jan 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uT1QR2lKFew
	zApX0UhiqpQcsJ1t14DmjyExDwez53vc=; b=onk8IxR0/4EddUErBlXMgSW2Bla
	voeSL9WE3UhI+EQMNUD2O/0KSVuRYVYr8ndTY/D/MocaQHkZZWMBXSdU2yQRlZxE
	V7/eybNZx8BxJccCKr377wb//VS9gkJlwyYsCrlQ11klrAIf273Z83SzyiD6Us7M
	xWthiaRng36HUgy50IR4almDGGNqvEVFuRxKZbptCJF2RCI26PbS0I1KKGD302yn
	2NpXxuzZ5KJFZJOIHBargDa0hvpl+QPgLvmS4nOA8r/Lemg2cA1DwxMS04ADjfD+
	d0hn2PXzwxJ9BBuHjSR8qIcBdodRdbT5jiviRXWGKmDv2oe5ImCCJZhEHzg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdjedc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80GwZ007949;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80Gqq007909;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80GIO007894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B0F34249B0; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 09/27] RISC-V: KVM: Don't check hstateen0 when updating sstateen0 CSR
Date: Tue, 20 Jan 2026 13:29:55 +0530
Message-ID: <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f3613 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=BHuQUpDX5hp_vwuhbhkA:9
X-Proofpoint-GUID: uzd_8_rk-e-uacfRhm3J0h18fdBTMksv
X-Proofpoint-ORIG-GUID: uzd_8_rk-e-uacfRhm3J0h18fdBTMksv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX/vmX/woHFKEO
 uFTrfR/LC+6Q+jFVKH4ucbVxTlTB+7XAjYld2+T+Tlw+Go6aUtFWe2+wuNGS+TfoQBTH8t7CT4K
 Mha8QNzy/eTevOmkCcexTSjdPXdh1DOBDkwaWkooNx+j2+aKldn43cEnfl/xPr91Fd8A/eR+YKD
 856uvn/37sXuLML3ZIZ6vo2xIPzLxfjRqN4zFU7fAYb2goEHE/r63PzMxsSdQe3pHSB2T0TLJnH
 eVRpAeUn/MDas5fx64MURxf8RBV1IHnfG8HsLHP0YBL57fyPfnzRtdTIlpZyt2lXlMfJLUZxRiM
 xxfESaUwOGwhQt//MGCg9W4UCPPJ0hxVVTM1ii1WP9KF9+dXTvz8Aa35yR5Fg2p0SA4w8B2jUYN
 3VNcFKd6yazFK8ThkrsQxrVLs0zlDbEycFgNj1J9jBnJStOxUOT+QmIGsZzVREkRBCiCr3Zo1ny
 Wzn8vYmxmLr7zWat8HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_000857_753304_D38EB90D 
X-CRM114-Status: GOOD (  10.29  )
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

The hstateen0 will be programmed differently for guest HS-mode
and guest VS/VU-mode so don't check hstateen0.SSTATEEN0 bit when
updating sstateen0 CSR in kvm_riscv_vcpu_swap_in_guest_state()
and kvm_riscv_vcpu_swap_in_host_state().

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kvm/vcpu.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 62599fc002e8..93c731da67f6 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -702,28 +702,22 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 {
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
-	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
-	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
-		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0,
-						     smcsr->sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
-	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
 
 	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN) &&
-	    (cfg->hstateen0 & SMSTATEEN0_SSTATEEN0))
-		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0,
-					    vcpu->arch.host_sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
+		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
 }
 
 /*
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
