Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493FD2ECF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woSDHK4w9ufG5aYYCq2YpahKo1FFVJNvZm7MNJfYzfY=; b=XlL3v1P0qPyHfq
	/r3nx6RB+p94x/QtFfar2UKgHW0yj9oxIkpdWTJJwKPltan3Mf2McP/M6n1JS9Y/aIkWmtcbOhTsy
	8OIzDZeFrOUeHA36ZxhcDHiq90M55BF/5qRiLtSwRKTuY/wUeVwOgHHdWhUuLQ7EmivKnTvHrmJdg
	FGdDL6nWqCi+BAJsAmpGmCaidak26YTzJ8sU7Yyo2Vb7CIdAnwI+kriBR+NWbdHqsMithJme665A5
	/QW0YQREsQ875KjasYLL1ZE0Fq3u8+BamW6fMf2UfKruzX1GcDAWBAR3zTyDbl5kOYqIFGiomu39C
	BnDZM9JjUmErngTNlptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fE-00000003O6M-3NH9;
	Tue, 20 Jan 2026 08:00:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fB-00000003O3p-1B2c;
	Tue, 20 Jan 2026 08:00:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K33HGH3805133;
	Tue, 20 Jan 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pDMJCmD9Zpv
	kPYOZ6njWDGA4LH/ecF0N3cBYZN4AYKk=; b=K09yvG0qM1dzne/bdT8P2OIPVOB
	CXIkAb3EsvfVo2BoOu0U3H91yuPlhzSOiNLAOA1cbo6HJGsh94kUCtJqtJ9NNxMG
	2827iNBp1DapsYYAz3WoRXw5eB3l1oZ8ack5Xzpj22FNrMXbNNZ7WD7kfradhVTl
	StV6rJgwZbENjEa9R2DNbApiUgXAE0TKBVEC74ORyG5j0F80k/rPoiArIaUnKq/b
	7rrKMeWr3ORuo5HRSTyIIbAGCyvVfESnMsp84PI/TsVFUh1yp5OEZmDNqLNq8L9s
	RmV1f35lND47TGMOdDTGbN3hykyHDjqNvC5iqDkKMCFPYs8mzNSjHYYwRsQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt1f88s3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80G0Y007954;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80GHL007913;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80Gbg007891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id AA3EC23592; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 07/27] RISC-V: KVM: Add hideleg to struct kvm_vcpu_config
Date: Tue, 20 Jan 2026 13:29:53 +0530
Message-ID: <20260120080013.2153519-8-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX3kduHAKPXtvG
 7p2sOTaHRj3GJW9ecsbWZHRq20oNUWhh1IDNPF++3zp72LFNaDuJ08PjF9/i4KpEZvSkWJBabaw
 +Vgm87+iDn/Szs66NZv/H0DFUHYMNDzltDWU3IYdbnX2N85BjAQ7I0OuBTkrIMujnqxqRSEAmYw
 9O5NAtOqIfYslcC1HovQWnSiav88mt2KnkKWETK2DCY+K8IBpGl4i1B7Y0kgG+ukd4cWjL0K46f
 s+9gSlWoczj4InxigLmGPZ/ItlBcU9gIMRQlpXdSwGE4qDNxnLgYT8Rg4qEbi3U5a2c7cyDpTwV
 CzmRr/QNH5sKIOpbkfB4aZWm6Ug+xm94dW6QQMLCjLnLihSnAjl33OqzzyMpsuCE/iv7ZXTJE01
 GZ3hITsYS2AofgvBXQvEtawt15ncSEevDhWB3teqpQ5h9pbY/Mr2n8Guzl+cx3QDtqkB0nBqO+P
 ADfbT5aX7JcYOoGN9RQ==
X-Proofpoint-GUID: fG9suajc4nEYCOMVR5vN3xQr-hcXmv4u
X-Proofpoint-ORIG-GUID: fG9suajc4nEYCOMVR5vN3xQr-hcXmv4u
X-Authority-Analysis: v=2.4 cv=LdQxKzfi c=1 sm=1 tr=0 ts=696f3614 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=edTdxSBCztBB68lQcJQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_000033_321923_7F7327C9 
X-CRM114-Status: GOOD (  11.64  )
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

The hideleg CSR state when VCPU is running in guest VS/VU-mode will
be different from when it is running in guest HS-mode. To achieve
this, add hideleg to struct kvm_vcpu_config and re-program hideleg
CSR upon every kvm_arch_vcpu_load().

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 24585304c02b..f3a41a1be678 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -171,6 +171,7 @@ struct kvm_vcpu_config {
 	u64 henvcfg;
 	u64 hstateen0;
 	unsigned long hedeleg;
+	unsigned long hideleg;
 };
 
 struct kvm_vcpu_smstateen_csr {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a55a95da54d0..494e0517ca4e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -134,6 +134,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.ran_atleast_once = false;
 
 	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
+	vcpu->arch.cfg.hideleg = KVM_HIDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -591,6 +592,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		nacl_csr_write(nsh, CSR_VSCAUSE, csr->vscause);
 		nacl_csr_write(nsh, CSR_VSTVAL, csr->vstval);
 		nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);
+		nacl_csr_write(nsh, CSR_HIDELEG, cfg->hideleg);
 		nacl_csr_write(nsh, CSR_HVIP, csr->hvip);
 		nacl_csr_write(nsh, CSR_VSATP, csr->vsatp);
 		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
@@ -610,6 +612,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		csr_write(CSR_VSCAUSE, csr->vscause);
 		csr_write(CSR_VSTVAL, csr->vstval);
 		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		csr_write(CSR_HIDELEG, cfg->hideleg);
 		csr_write(CSR_HVIP, csr->hvip);
 		csr_write(CSR_VSATP, csr->vsatp);
 		csr_write(CSR_HENVCFG, cfg->henvcfg);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
