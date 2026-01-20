Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA8BD2ED15
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltFmcwXbTJ0yigNEW55DBqLfsSfkn7WOihHXXQUZKKk=; b=2jO4MDuacdOkCJ
	0mb60JpTDBtQg4q2HMmHgEpVsVJ0DpT/UODrL41zg73bRffYzgqM4mxn8mPhckcljKbArXItP1+Xc
	SCZPn/8BAjshuR6lEBGMGDcyypWdeWWK/8mHTyDcOOQLMKRY2afNS4jTdv01n0Gg1wU1kH/eWlWZQ
	e6s18yF+4I9H8ifKBAnGkUVwFA+PGClJUuuzE2pdvGohTW1xuL+zMa+6KfcxQ12zhJPdt+CPwt/vz
	hOFOixboB5J8JbwMHeVOYmJ3U+5/GDdZjlUa/RQbDs2aiHdsgZGRNYYHuCOryVCnyntG43ZC3KKnO
	luVuNL0GgKXlq1Ug7Rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fs-00000003OlK-3HSv;
	Tue, 20 Jan 2026 08:01:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fL-00000003O9H-1fxG;
	Tue, 20 Jan 2026 08:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T6Ez3auc9uexU0ztDJfjojD1To7INeoURgJTkVoDe80=; b=jcbjOJ0fcDRK3yIPwHUElHXbMP
	bswwAvwFWDqeiMpGSdWv2zxKuSA2q5qaqOQ9mkYHVdgVeJRwMygooLACzubYBfn3M0e1BcyvbSobv
	zNsqAQeYwK7yRIx8gEIvdhE6Nvm0JeF4ZuYkVWqo6j3XFYJzAEwWkbuZCTXGuk4FnW5wAlx41qTqr
	Ko7bqBN4lc7OCJRP6ZG1QFN5C5kBGAzrnA7teEibTieWGIThUZ4/tX2dpGx7sWfhevLl3XPCGhlKg
	/oQtyHJrmkjKSKTxOALgAbeZBBLM5TVAkhaGrCkHdzPsw1RrZcoKw2fmk1OqKva4+dDK/GaA60Fz5
	20uooNLw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fF-0000000DX1R-2fUk;
	Tue, 20 Jan 2026 08:00:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5dHvq774045;
	Tue, 20 Jan 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T6Ez3auc9ue
	xU0ztDJfjojD1To7INeoURgJTkVoDe80=; b=nEdwJW87Dn3at7qarIsoXj7GFG5
	bAoI6cCap4uSNhqKs7zXNOFhJJJ8QsW/S+4aBSrCC1Bmsfp0JNAxn81nCIrNheZu
	nXNngI7wRDLpS7Nb+SeJBDP6gXq3kWIQFVKObQ6o5Tc0hu+h7Yx/4nmQAlKpsakI
	sDWpMlZq/2+QwWtf1+qG8MAWuq2kAP4C0kK761UhrnO0gKqQsdrlsbaaowfcsHK8
	dErqMNqncuwuPYoI6wc0xW5Cj6gCgagxqq12C5hDt4PmKe7WzZdvOubD2uHmnn3Q
	m/H3XzStRJBZYHZbkVPcv7W/nmKH4xD1pcDfHRKJwvj9qdsJX7sbgI5UXYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsj9ab742-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Gjm007953;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80GTG007912;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80GWo007895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id A6E5A2357F; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 06/27] RISC-V: KVM: Move timer state defines closer to struct in UAPI header
Date: Tue, 20 Jan 2026 13:29:52 +0530
Message-ID: <20260120080013.2153519-7-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0tnOb3vpKejYEJZVmkCAg62gljMbCZS9
X-Authority-Analysis: v=2.4 cv=N40k1m9B c=1 sm=1 tr=0 ts=696f3614 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dDnfVlE4-D7SnBb_pXQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX/J9pMM/gsq/B
 wCUL6IzDRdd1Yr4Gwu6A6JkrrxcgqHXqTObcHp7e3M0kpUT7wzUq+/k8/jryWL7HhbNrWS2dJJK
 i9k2M+HGfob/DqRMZykVi4oxzNSsiZeG34lM7cwWtALrWeZ4/wubddZgFCRf+L4lqzzgVs98QJl
 NoHpazyRSePkKXfqgucn8n4sKzb2LVouRxcrxjcGuLeZh7gZEmattaLaf0vSiTInHYxx6/p3OYg
 3VhHlWDAaq8zYF7yXixiqpQ8eSkXQ4Xi7iiqu/PYjL9GjWlRz9Z7ItodMaKkUD+ahbMJGO66En5
 lT8KVlzq5wfesxK08gLNaVjaV64CKCpvpo2F8eBtUm8+uAydP7RY1n9ChzNnOettJNQ6jOJW0nK
 cWjd9LiMxR4G5NYkT6idGu3M1i1ummo5eUW3EBIVr3faV1TeNlz84MbBR80aQXEh/n0/eoesuOn
 HHbeHsS5FL4r9L7Vnrw==
X-Proofpoint-GUID: 0tnOb3vpKejYEJZVmkCAg62gljMbCZS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080038_054582_6E36D376 
X-CRM114-Status: GOOD (  12.97  )
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

The KVM_RISCV_TIMER_STATE_xyz defines specify possible values of the
"state" member in struct kvm_riscv_timer so move these defines closer
to struct kvm_riscv_timer in uapi/asm/kvm.h.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 6a89c1d00a72..504e73305343 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -110,6 +110,10 @@ struct kvm_riscv_timer {
 	__u64 state;
 };
 
+/* Possible states for kvm_riscv_timer */
+#define KVM_RISCV_TIMER_STATE_OFF	0
+#define KVM_RISCV_TIMER_STATE_ON	1
+
 /*
  * ISA extension IDs specific to KVM. This is not the same as the host ISA
  * extension IDs as that is internal to the host and should not be exposed
@@ -238,10 +242,6 @@ struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
 };
 
-/* Possible states for kvm_riscv_timer */
-#define KVM_RISCV_TIMER_STATE_OFF	0
-#define KVM_RISCV_TIMER_STATE_ON	1
-
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_RISCV_TYPE_MASK		0x00000000FF000000
 #define KVM_REG_RISCV_TYPE_SHIFT	24
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
