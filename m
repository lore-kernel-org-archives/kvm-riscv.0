Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ADBC43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rd+neKKioa7yE3iHZJpkNnEMenCzN3VeWFKZ723BWYM=; b=mIZl5cnrCnKNFx
	Kg2VyspZ60sWuU8KdQml0iViieDgLk0grERkFFhPx2/vkTiH4PjDGqN4o0c7BbkxmCWD5HcHpywDY
	x1taqpi2R7aJNG13ZI8CmNx8o37wYAacIO/oQf/g7f26oWES40L3OsF2o58sVY24Je/70LlMCF3K2
	N1zY6epoPZw/eDOnVYdkN2JeyCcW+lz8yaZHQP9KKqMxdSQQc6latvvlGE+SKu83tGIYNhWZfwx4c
	lQXkr80uXU8dliY+pPMSM1kTDa3V4NJkNJNlTGf5oR7DT8d4XVtijs4JfW62UbKJozy3VyKebMXPo
	oPamaNhaCWrl6OiY6h2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeqz-0000000BqvN-27ft;
	Mon, 06 Jul 2026 08:39:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeqw-0000000Bquf-157n;
	Mon, 06 Jul 2026 08:38:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641T673615451;
	Mon, 6 Jul 2026 08:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rsOkH7LoEWb/FJ56R4y5AzHKDfswW4uoyIc
	6Ge6V+dA=; b=OelXhCB3ijg8w84Z21V+QTfRlWF3+xx5AAu4yLGQyvCiv56aASu
	bi7hz/bdwMGpyszjs9Qn0H3hX0E+Z3waQwfQzcMJfwjcnLD49KnF9Ay1wMBGNeRq
	WXxQwVLmemUXd0hz8SHSDIg5L5GFnFuufKuBABBhUGu69PJKrac7kcNQt4n+a4eZ
	sCmRFtzpQtNVZ0Nu6Aqp6oPBnFZoHQhnsT84cftZCk9GCVZ6VbCINZys8bYppBLY
	Zx1geI9e66xEI4e5jksY8n3qZ9N3n8Osp1EbSHd6M2jpsCu10gYWF977+YOEOPC5
	cYhT+C+yU4AsS2VGrnQkZl2PlJDZGP/Zj0g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3damf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:38:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668cp86025360;
	Mon, 6 Jul 2026 08:38:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8jg9f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:38:51 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66680t5j007807;
	Mon, 6 Jul 2026 08:38:51 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6668cp0a025348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:38:51 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 0CD9824AF4; Mon,  6 Jul 2026 14:08:51 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v2] RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG
Date: Mon,  6 Jul 2026 14:08:50 +0530
Message-ID: <20260706083850.1425228-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX8Pw3HsznS0KT
 3MF3LSyaTyWdjmPk68X4LJBy82WhIe3j76JI7eh7DBcFIn4u8COpH908RurnWL/cA6h+ftq6TNk
 L2BUz3Kz87sI0Q9SKRQmBGUnsOCVxVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4NiBTYWx0ZWRfX0LQEXunCEGPD
 JU8zAwYr5mnevdYVRGwR6ufq+TLYfFcqBMmOZIlimvbbzkOe1K7zdTt2crhz34vhhu5ktkvKJbx
 4jYajFnPHdY5bANvfMYL/YQxp78Rmd21Ptebnk2AxrZN0HA7azHdgbd/GTlcMtg93kr0hAjitDG
 DrXw6Cb4Bg7VRMOxPXupUwtikmSBa+iqZHoCM/NpfhfBS7IsCS7LaY9QRjMfDLjGkHkNCuUGWyV
 YePcwP+s3BzO/xl7giDcl2uQadA7lPh1uCnlOLERYFxLu2O2MqBijWCohbU2nm5HvYGBZ3rdcpw
 mu4bJHwpsrHIfptcIaevhQbkkWlgo7uOMwKL0nGnqDlawJmfz+uEce4N8z1Qx4Fu3V7TE2itYiK
 W85L8fT9Qis6zgFtwxmQjzqk0Er6YuWLckMFdPjI1XB5wo4//czj7TfNZJsxcH7hH1CvPPn+zDz
 bUHDhrT0wicAX/xbU8w==
X-Proofpoint-GUID: tuD3QG67K9A1hlcKNmpyAVypRt2ShvMB
X-Proofpoint-ORIG-GUID: tuD3QG67K9A1hlcKNmpyAVypRt2ShvMB
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b699f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=z3A17_TG5Y3XFGgIDokA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_013858_299094_4CDB8CE3 
X-CRM114-Status: GOOD (  14.81  )
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
Changes since v1:
 - Update kvm_riscv_vcpu_set_reg_config() to return -EINVAL
   only when Zicbo[m|z|p] ISA extension is enabled for VCPU
---
 arch/riscv/kvm/vcpu_onereg.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..a8333441192c 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,18 +50,12 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOM))
-			return -ENOENT;
 		reg_val = riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOZ))
-			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOP))
-			return -ENOENT;
 		reg_val = riscv_cbop_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
@@ -144,21 +138,18 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOM))
-			return -ENOENT;
-		if (reg_val != riscv_cbom_block_size)
+		if (riscv_isa_extension_available(vcpu->arch.isa, ZICBOM) &&
+		    reg_val != riscv_cbom_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOZ))
-			return -ENOENT;
-		if (reg_val != riscv_cboz_block_size)
+		if (riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ) &&
+		    reg_val != riscv_cboz_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (kvm_riscv_isa_check_host(ZICBOP))
-			return -ENOENT;
-		if (reg_val != riscv_cbop_block_size)
+		if (riscv_isa_extension_available(vcpu->arch.isa, ZICBOP) &&
+		    reg_val != riscv_cbop_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
@@ -614,20 +605,6 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
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
