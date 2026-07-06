Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9989CC43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0OMRpgDH9y0lraF0jFliELTwdVgwc6MVwKzkx3+/YpM=; b=kNyo5cuz4fBnfx
	FHrqQL1oxL/c4etcJQ5qIQR9CDDHbj6TTtp35WE038b03vTE1aHHH+TYOiFJGuwrglUtKDPPapA35
	k3fMQG4FP/5rTlNpH6YlLrk9AiD7VjnHMHRO6KUEUnWFKhMRynG4dY6Hcqp8d8bhuMVe7Z5175Oj6
	KsIBoYIm4RypM+hd7q09dX4zacMXWex1VV6A7pvgtfGnihKjBmybkoczFZCoYBolRkXrbZ7luum9M
	owaGj0jhuOIJ0PXinSw7e4Hd9CLcct3XlnbCVvd4g8QqRNmKQsFse6GcTOW4ByMLJgwPgSfvo86/f
	xKC+JJ20eEcR76Zo530g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnqv-0000000DJem-1J0C;
	Mon, 06 Jul 2026 18:15:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnqt-0000000DJdj-17Jb;
	Mon, 06 Jul 2026 18:15:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6Ix832946;
	Mon, 6 Jul 2026 18:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=o6ISkWxspWCxp9KnHzWXzyl/5pgR9sSj2EM
	01eapVFk=; b=IfZOqdACovuzPx6YPDZjASNQAjR0/R+c3XNppswP278/MYGfasb
	6/745B9cuFiqNI6kEGcuD5TGMeE/Yd5rb3JIJbO4mCmgoEUrJ/DX5SRFCiIakYBX
	Z++J3rsKG4REi3CtpDI0/uQxLjRiBhJoJXrKV+8q8UQkOBFe3BXydRbCPryk62TH
	NyJaI8zvRmCkPC7McaMxogSkV6OkcEo4GeUj6rsFGnjmPN5serJoNWdRog1T4tBH
	yE/9s5KFszNFZxd0/OM6yJC4wHvJgib/e0z+YnBVuo3GHBmZfzIDswZ/5qoKNEpK
	rOi0RiCGBM111pNvQ/2BlC49hr2MQ6Eukzg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98j7ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 18:15:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 666IFOJi001963;
	Mon, 6 Jul 2026 18:15:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8jphch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 18:15:24 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 666IFObt001958;
	Mon, 6 Jul 2026 18:15:24 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 666IFOLA001956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 18:15:24 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 4E946222DF; Mon,  6 Jul 2026 23:45:23 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v3] RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG
Date: Mon,  6 Jul 2026 23:45:22 +0530
Message-ID: <20260706181522.2003922-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bf0bf cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Is26oSYgSJ-TJNtENMMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfXzujtoVJZN/HP
 xwxsHwBStJj7LVJB5BkknPc9G4d7T19n9wvaObStNzNV0o0uEEYAaI4+y7nd/gaq8v5sVkQGTku
 mDXuUF2wNyyJDtRXlAqlSmxu9pbHEc5ba3chxdBU+5q3OXC3I+dnqYE0+8cqdVBoFfQgg4eSmTY
 uquTVHhJV1pryBAozho6bPqvMfYitS9mRCBuYw3qN+xjq800y3PXhHqYIHwkUBG7/52iBMiXew9
 GaMSiKfn0CJWJmkrMJBIfp/BhVcG093KJrrc6KzSMlcQ1aRPPIrarqh+jjtTztJDLqCIzcHw0MS
 A/s5PlfThxwxhcnSnCIcOCcnJTXLc9REj5EX4mp03pNfmlqggegybwCvXlFTFM/7WfuKdI/LpxQ
 /Sle913u5aWY+4GigPzGWAMbDGCAVcYG2gmVdA9ncNSmmsW1KbP+LC/2gPGNLrg0PFeYt9Q0FTD
 edUzBNxJdl/D2/y8M7A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfX+E03xURmaaDn
 wIA/XH+iK4vxWV5YkbACVCPPfiBAdEPjURZKmyQJDsLkp1Bz4Mn4u3CrNtMGg83/4+Z2F0jHUMf
 XUW7J4DFk9+t4LtwHHpR3yXOZGCScEY=
X-Proofpoint-GUID: w1gJeEr1SvQPD65bBULpglEqdcNwDSce
X-Proofpoint-ORIG-GUID: w1gJeEr1SvQPD65bBULpglEqdcNwDSce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_111531_310671_1A874836 
X-CRM114-Status: GOOD (  15.38  )
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

All config and core registers of the KVM RISC-V ONE_REG interface are
expected to be always available to the KVM user-space and the KVM
get-reg-list selftest assumes these registers to be as base registers.

Currently, the Zicbo[m|z|p] block size config registers are only
available when corresponding ISA extension is present on the host
which breaks the above expectation. In fact, KVM get-reg-list selftest
fails when any of the Zicbo[m|z|p] ISA extension is not present on
host. To address this issue, drop the ISA extension checks from
kvm_riscv_vcpu_get/set_reg_config() and copy_config_reg_indices()
functions.

Fixes: 031f9efafc08 ("KVM: riscv: Add KVM_GET_REG_LIST API support")
Fixes: a044ef71043e ("RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable")
Fixes: 48e2febcda74 ("RISC-V: KVM: Provide UAPI for Zicbop block size")
Fixes: cf05b059d59f ("RISC-V: KVM: Introduce common kvm_riscv_isa_check_host()")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
Changes since v2:
 - Update kvm_riscv_vcpu_set_reg_config() to return -EINVAL
   only when value is non-zero and does not match underlying
   host cache block size.
Changes since v1:
 - Update kvm_riscv_vcpu_set_reg_config() to return -EINVAL
   only when Zicbo[m|z|p] ISA extension is enabled for VCPU
---
 arch/riscv/kvm/vcpu_onereg.c | 38 ++++++------------------------------
 1 file changed, 6 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..61988382570f 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,19 +50,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOM))
-			return -ENOENT;
-		reg_val = riscv_cbom_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOM)) ? 0 : riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOZ))
-			return -ENOENT;
-		reg_val = riscv_cboz_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOZ)) ? 0 : riscv_cboz_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOP))
-			return -ENOENT;
-		reg_val = riscv_cbop_block_size;
+		reg_val = (kvm_riscv_isa_check_host(ZICBOP)) ? 0 : riscv_cbop_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
@@ -144,21 +138,15 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOM))
-			return -ENOENT;
-		if (reg_val != riscv_cbom_block_size)
+		if (reg_val && reg_val != riscv_cbom_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOZ))
-			return -ENOENT;
-		if (reg_val != riscv_cboz_block_size)
+		if (reg_val && reg_val != riscv_cboz_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOP))
-			return -ENOENT;
-		if (reg_val != riscv_cbop_block_size)
+		if (reg_val && reg_val != riscv_cbop_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
@@ -614,20 +602,6 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
 		u64 size;
 		u64 reg;
 
-		/*
-		 * Avoid reporting config reg if the corresponding extension
-		 * was not available.
-		 */
-		if (i == KVM_REG_RISCV_CONFIG_REG(zicbom_block_size) &&
-		    kvm_riscv_isa_check_host(ZICBOM))
-			continue;
-		else if (i == KVM_REG_RISCV_CONFIG_REG(zicboz_block_size) &&
-			 kvm_riscv_isa_check_host(ZICBOZ))
-			continue;
-		else if (i == KVM_REG_RISCV_CONFIG_REG(zicbop_block_size) &&
-			 kvm_riscv_isa_check_host(ZICBOP))
-			continue;
-
 		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CONFIG | i;
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
