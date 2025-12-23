Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4568E6F090
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oe9cC4rjnd661HWRei5PyeWDntzTw4T2rrNZWZdlZlE=; b=pNS0TNCHaZTqt9
	3Ys1u67PDmnmqLRNbgmisXOg+JnfG7OE0D4Y2I2IPrVpOR+u8+5+UI5pvyfnTw/9GTVOrcN0RvbAA
	Ohe38lgWmBiGhGIJTQzR6uHDyBbx9uvsbhuhOKdQCpxt99GbtxhkV48xCImbMllOHylwfQwuCA1Nj
	HCYLwF6DAwaN4xZOe8Vb/izAZN4Hl7E8+GQN2l1P3sOixfcl+R63GafRGjtm6aaLophzOWjIXjxsq
	q24qrhf9E/hVoNFz9SVn0CqUysV6ksuJlQ96yDP4tjyCDOGSiiZGSuAZh8CMZHYPwrF0ENqzc7liP
	43gHNMvYUQeRdOWbinuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3V2-0000000FcuV-1XuB;
	Tue, 23 Dec 2025 14:36:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3Uz-0000000Fctt-0Jht;
	Tue, 23 Dec 2025 14:36:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN78U6T4044542;
	Tue, 23 Dec 2025 14:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CsSg3raa755P7fEcUVN611Vs8+I2n7jTezy
	9VwgkJA8=; b=fVWIMTcCbYsE969JUBB5OyUUBzwfwhPKt4SFgfZoCHJZPFZ9y3H
	DxyOC6b1FoWe2FLdOKvGBKzxpy73HTybQLeyz44BVPeDx/5Dh4nFBQAqV0WmFQDc
	8k3oTJ6EREh0x04ox9OX/CeEJ+aKGFmojRnex9inXaAdv6Sx9zLfrOdiZjb5xm3j
	smeN8G+itS7RW90RN5ArotUZcT1R0tkKDurLndoNr8I2mguTPQ2q5KMrLata4SIT
	DybrEYkwW0dXfD6R7KJKQfUrSf5qF/9wLon7TVZjAcBSI3GKaAcb1KQc6xFn4Bh5
	b8caUWN2/dA4r6+bqAIdgqYFIZAngUfspOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhaxct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 14:35:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BNEZkhi009619;
	Tue, 23 Dec 2025 14:35:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b5mvm95g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 14:35:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BNEZkrh009611;
	Tue, 23 Dec 2025 14:35:46 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BNEZkph009609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 14:35:46 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 3143F21A30; Tue, 23 Dec 2025 20:05:45 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Sunil V L <sunilvl@oss.qualcomm.com>,
        Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] Revert "irqchip/riscv-imsic: Embed the vector array in lpriv"
Date: Tue, 23 Dec 2025 20:05:44 +0530
Message-ID: <20251223143544.1504217-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9iaSLzjfDeb7f_OHe9U_zVa0CjGOGmEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyMCBTYWx0ZWRfXwybHLAjqO3ld
 hP9i2fNduP5HUOGMmogbIThUiZf8APudf3k87/nfL24q8DUCMHYB8ewAcfSbE02RAgpZWokSsoN
 3yOasC/nevVUSAY1V4LVpXoJjuLwh9jS9QXoBJftM8mSreHQ+yIh9iXKIMlpyOdd81frJre0lfG
 1QatefbEaN8+9YmR3Sit00Xc67jiSQ1UOBEfkoCGIkjV2L+C46DnxGRitRgui9KEA5iNDniDaIq
 89KFJGyjAM0N7E1yqllNFZhhxXKPAzOM/PMvfN8rd6RiGJ41fnaNIBHmp0fLmrdMWmwmgXbWKeS
 jxvaXCfDYG5vaHhCnTiTzAAy/dHIvcfsONvresAUfXuKGAOg4gfFDu0RRGBl5qA/YA8X3gI9JaC
 mTiscJ1rQqCdhhB9NYS30YvFcKiNKKdINc5AtsQiI8pzIEbE4dYQLzHEsuo3b1J2tztFo9PISlm
 kaM9G+kYQpcGou1YJ+A==
X-Proofpoint-GUID: 9iaSLzjfDeb7f_OHe9U_zVa0CjGOGmEw
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694aa8c5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ZCMddYN6k4-7DcXjQ1QA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_063629_116451_2CBCDD1A 
X-CRM114-Status: GOOD (  15.81  )
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

The __alloc_percpu() fails when the number of IDs are greater than 959
because size parameter of __alloc_percpu() must be less than 32768 (aka
PCPU_MIN_UNIT_SIZE). This failure is observed with KVMTOOL when AIA is
trap-n-emulated by in-kernel KVM because in this case KVM guest has 2047
interrupt IDs.

To address this issue, don't embed vector array in struct imsic_local_priv
until __alloc_percpu() support size parameter greater than 32768.

This reverts commit 79eaabc61dfb ("irqchip/riscv-imsic: Embed the vector
array in lpriv").

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 10 ++++++++--
 drivers/irqchip/irq-riscv-imsic-state.h |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 385368052d5c..b6cebfee9461 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -477,6 +477,7 @@ static void __init imsic_local_cleanup(void)
 		lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 
 		bitmap_free(lpriv->dirty_bitmap);
+		kfree(lpriv->vectors);
 	}
 
 	free_percpu(imsic->lpriv);
@@ -490,8 +491,7 @@ static int __init imsic_local_init(void)
 	int cpu, i;
 
 	/* Allocate per-CPU private state */
-	imsic->lpriv = __alloc_percpu(struct_size(imsic->lpriv, vectors, global->nr_ids + 1),
-				      __alignof__(*imsic->lpriv));
+	imsic->lpriv = alloc_percpu(typeof(*imsic->lpriv));
 	if (!imsic->lpriv)
 		return -ENOMEM;
 
@@ -511,6 +511,12 @@ static int __init imsic_local_init(void)
 		timer_setup(&lpriv->timer, imsic_local_timer_callback, TIMER_PINNED);
 #endif
 
+		/* Allocate vector array */
+		lpriv->vectors = kcalloc(global->nr_ids + 1, sizeof(*lpriv->vectors),
+					 GFP_KERNEL);
+		if (!lpriv->vectors)
+			goto fail_local_cleanup;
+
 		/* Setup vector array */
 		for (i = 0; i <= global->nr_ids; i++) {
 			vec = &lpriv->vectors[i];
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 6332501dcbd8..c42ee180b305 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -40,7 +40,7 @@ struct imsic_local_priv {
 #endif
 
 	/* Local vector table */
-	struct imsic_vector			vectors[];
+	struct imsic_vector			*vectors;
 };
 
 struct imsic_priv {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
