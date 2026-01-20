Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5C8D2ED0F
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjVc6BWtXOCTpWqNfnycaXmWT7Whb2pNyPlhQen+vbQ=; b=l70nRo2ZfrNzHP
	Yernx3Rj7EiXB3F/hQRKKqRpsk+VXVzVteHx5zE9NZGZSzieNqsm0sHCvNSVgPV+VHHitzTfRXV+y
	/12RgzQWakcFMmW/+MnG/smhZlXkUC216MYZxvhtvMqheCnUBhOX68S0RNBi1D7oaTFfrMzDUGwvp
	pPK48UE39Bn/4lhgpsUG1HxFsTUiqYSdKgMNcQQuDIDE+EnnyGMKdla/vA6YCOINg4tjwK1yqktiY
	6jkF+hf1fRBdsly8bvNahRgCF0a/oFR84hcjQJ4spsKq12dZUgr7yz2gbdkfp0VvCd6mXAg8OTcGn
	yE2yt37PQjinFqozy1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6ft-00000003OmE-1uaT;
	Tue, 20 Jan 2026 08:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fL-00000003O9I-1imo;
	Tue, 20 Jan 2026 08:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=esXaYSax2EAIkw2Su+ePpoRTacWSAxDU18uVB39dYfQ=; b=Gq77nHxIg3Ddn16hLNSBLw8xey
	1H+p1ixQo/1q32Cjaj8ykwgKHgqKc9hN51qTtXJ2Saf2hPEoVomiKxjcvBYGYZhRZzOI6rqzO4x6U
	nWoeiQ8VU/e6u/I3QOeEDyHBx4VW+qbDnBhBHY/urzJ4XZ19RkiSpCc+7RlHuQlnEchEjgvVNw1/P
	o7pNyovsuykQwcqjpmI4Svdk0ww8traNDI2GvaxzyZpt72sCN7i43ItbntvTR/3Y18g9a87h2BP7L
	uY8NUiEe4aXLSEcxo7NQ+Fq3MSjnjQjnXb13bzowMJw+E91iXQWICCWNDxnB+JlUHOl92rir1Wm4k
	kHLfqU+g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fG-0000000DX1V-0PVA;
	Tue, 20 Jan 2026 08:00:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6D3Pu774067;
	Tue, 20 Jan 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=esXaYSax2EA
	Ikw2Su+ePpoRTacWSAxDU18uVB39dYfQ=; b=kvpt8YLS/qeycvIuhFgLS0jADWF
	J3FOW+Xs03YNar6ssW5uZDRMtfW60wmu4pQ3BQPBgYzNVT918U4/BvzSRAEYC761
	JVEEqHFMUi0wqnFqRf8YKiQt1ygC6cGuOcMvug8AttKmywY5jkBAjScaOGo4IpEA
	mkPqlrucfDvB/RK1pscVvVS5Bu33DD/edBRPIJWUSIXsmq5Mhk/L4COjzzh+87kE
	xnlBb8+0b5FY1Akh/ffHNI6v+N3L8Hu7Zi14rP4zXIMyat0SIY3vOP6ZKDuRCNXL
	UfNDeXj2xZD/3sDMHoeBtVekqbCt75v01rNXHhYhOCT2Y2AvpT7etz0i5vw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9ab744-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80GKl007950;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80Fax007833;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80HYc008010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id E896C255C7; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 25/27] RISC-V: KVM: selftests: Add nested virt state to get-reg-list test
Date: Tue, 20 Jan 2026 13:30:11 +0530
Message-ID: <20260120080013.2153519-26-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jfjisKgTv3Rcb7Vy3etZYEBnEMc2_Pxp
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yqHYUEKHaMYeqMlJOSMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX8tNBNjMAUcx8
 Wi165lsbMtOLYwGIpjq2R8cFql2gOXvtTQKgf6apBjYm2a509i2b0D9cWuCI/FgEm36W0lKKZ3N
 ZIp04SKkLOjFAEBPJWIMo+atJHcNvvqP1GwdPw2Lmuyy8L5nlJqbj4s+fY1sAgTorKX8IHeiXLf
 Gm9sjDp2vIMtfnmajMFPMvsa3yHtqs9IB1bR/EbTsGWlr+ADPxPpGfAOkC7f4iF+H+7sLZH5Gcu
 wGUF+VPvum1ju1q9PmUV+FXLFRFjjmQbYs0Qzw5l6diLhSTQtG4ypE6ywqczZ8rsRLAAMARKxGt
 G/FuO5/kMHzs5tZ8bM1MvbujtD5KsNRAu79SvnwLTZSMi8PpODooFaSk2om+XHpWshLUl9KnGWN
 gWGapwnDBna/G9cQyDypjxs3dov6ADjbsDIo0UPSkURgoxHFPHfdNghwWxNu8FsvODy0gYZAx1g
 Ukrk7B5iziaWpacuyYg==
X-Proofpoint-GUID: jfjisKgTv3Rcb7Vy3etZYEBnEMc2_Pxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080038_503163_21B3777C 
X-CRM114-Status: GOOD (  11.01  )
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

The KVM RISC-V allows Guest/VM nested vitualization state to be
accessed via ONE_REG so add this to get-reg-list test.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6b951434eb..53af7a453327 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -314,6 +314,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 			   reg_off - KVM_REG_RISCV_CORE_REG(regs.t3) + 3);
 	case KVM_REG_RISCV_CORE_REG(mode):
 		return "KVM_REG_RISCV_CORE_REG(mode)";
+	case KVM_REG_RISCV_CORE_REG(virt):
+		return "KVM_REG_RISCV_CORE_REG(virt)";
 	}
 
 	return strdup_printf("%lld /* UNKNOWN */", reg_off);
@@ -855,6 +857,7 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CORE | KVM_REG_RISCV_CORE_REG(regs.t5),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CORE | KVM_REG_RISCV_CORE_REG(regs.t6),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CORE | KVM_REG_RISCV_CORE_REG(mode),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CORE | KVM_REG_RISCV_CORE_REG(virt),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(sstatus),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(sie),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_GENERAL | KVM_REG_RISCV_CSR_REG(stvec),
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
