Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C82ED2ECF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdMXJ6um0OtYVKC8/toIecCt1WqvVjQlo8tBXJ1AKFQ=; b=j0sQzUHg9Rgkrx
	SI0YNBcX0qtZJMMcKzJFI247EJuD2cjhTEkI4Hl5cv/9/+RlKVDrXyHbJUrp7mq7mHnSA1vnbMHmb
	GyielwHQbBnS7E1tuVsHqa8HSCPYNNuDRP9yaia19r8OtX2+IJlGczjjIrD9aBd4/FtGfoxBUfqQi
	1NMi/JupshTRSGEIQeZ9gKkV4epEy9lbBDSBlh92Nqp3JXoGWehNXEWhscad+f+VP397qT5VsMGv2
	MOqwUOB2jLImFHGhEW0sgCG75SfIf8QKg0698KZ5ijdPzk5Yjd7xD9R62SXRNClM+KMv7h+E/oVgR
	3RTIUcNkxIwztwQvYy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6nM-00000003RFM-47v2;
	Tue, 20 Jan 2026 08:09:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6nI-00000003RDd-0RYU;
	Tue, 20 Jan 2026 08:08:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2Q9sD1347376;
	Tue, 20 Jan 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kMvVQvpRPSs
	IMOl6BNi/dRloose089q9kZNUJhwzxjc=; b=iENyfGdUPqRssdzkS17WwHcKii2
	e0Jfarpyexa7w+wMlhhnH/WVCuShZC1HC0ViclXF5S4jI7w36Lvv/hTTrMMVPXMv
	1FIoRirnnLlZwTHG44dKUmAIQhR+jWuTPdkHMb2UsEOLxtiREoBIdC3s5dymrFZd
	f0AGJ2xl5WiueWwu6WTxI9BWvPOeoIk19Jqbb0WiCf52vxuSbfWANyN+1EwrKWZl
	edtRMb89lTnEd5d0wGCBXQuC116YCsCiFgBwOSzC7eGVcNTMr3TnDfft9GedZ8Va
	v8aJ9DuGZeBm/s4tTGuELu70WYWpvxhCoJU4dD0N+JaoAOm5uYUq10WsiNg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdjedj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80FXG007882;
	Tue, 20 Jan 2026 08:00:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80HCt008032;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80H1x008015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id E50DA255C5; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 24/27] RISC-V: KVM: Add ONE_REG interface for nested virtualization state
Date: Tue, 20 Jan 2026 13:30:10 +0530
Message-ID: <20260120080013.2153519-25-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=JxPYNFsx4Yjzc9TJBFQA:9
X-Proofpoint-GUID: 2_KmVGgggJ2UfCAc-tHIh_DNPc4h2pEu
X-Proofpoint-ORIG-GUID: 2_KmVGgggJ2UfCAc-tHIh_DNPc4h2pEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfXyw91g80ff35X
 DCsg2Fe669mN8XnLU1roJSHlFnrGx2KKkZOG+Vb3SyomrevPwM6fmQGrXIL/obv/YLWWj04zYyl
 8q1g+vvcM+QYzLsI0YPRW8n4GH+vk7Tf1INJYXDDHbd7147YzaLvygq9cb4JpwX15i+GStjTYW5
 7nkVLKJguVAdT5Sq8z24wfz95bemOchxhgBWGQL52CHRzzDz8wYB5QFkc7AQE1FVITJZtgGamYg
 BXKdiVEGhppvF9M7VqE8j2EAw9pVjOLxLORZUo4cp0EyQSculfJnCSX8NMNOkWoMW4d1vlwtvGu
 2l4j7Bn2tISnwPuvWdnUNsC+9MCth3/870LR8Zje0BHHdeCKAowX3VI+4lA7iQzh17gzWrse1ZI
 ioDSREaWgCZ3kSTIB9lJv1/L9mj27CgHzl3MavrJUBGNeBRBAOWvGc1Hh7Gk5A+dOMX+0gHdV3x
 k+sAc1jIgcLPSgvB6Ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_000857_750481_E3F00732 
X-CRM114-Status: GOOD (  12.94  )
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

Add nested virtualization state to CORE registers of the KVM RISC-V
ONE_REG interface so that it can be updated from KVM user-space in
the same way as privileged mode.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..f62eaa47745b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -65,6 +65,7 @@ struct kvm_riscv_config {
 struct kvm_riscv_core {
 	struct user_regs_struct regs;
 	unsigned long mode;
+	unsigned long virt;
 };
 
 /* Possible privilege modes for kvm_riscv_core */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 6b16eee2c833..5f0d10beeb98 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -219,6 +219,8 @@ static int kvm_riscv_vcpu_get_reg_core(struct kvm_vcpu *vcpu,
 	else if (reg_num == KVM_REG_RISCV_CORE_REG(mode))
 		reg_val = (cntx->sstatus & SR_SPP) ?
 				KVM_RISCV_MODE_S : KVM_RISCV_MODE_U;
+	else if (reg_num == KVM_REG_RISCV_CORE_REG(virt))
+		reg_val = kvm_riscv_vcpu_nested_virt(vcpu);
 	else
 		return -ENOENT;
 
@@ -257,6 +259,9 @@ static int kvm_riscv_vcpu_set_reg_core(struct kvm_vcpu *vcpu,
 			cntx->sstatus |= SR_SPP;
 		else
 			cntx->sstatus &= ~SR_SPP;
+	} else if (reg_num == KVM_REG_RISCV_CORE_REG(virt)) {
+		if (riscv_isa_extension_available(vcpu->arch.isa, h))
+			kvm_riscv_vcpu_nested_virt(vcpu) = !!reg_val;
 	} else
 		return -ENOENT;
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
