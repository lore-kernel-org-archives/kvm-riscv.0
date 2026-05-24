Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A61CD5BAB
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 13:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MsLQdMDCGsug1Fgu3icFSIjVOEqlbYtkWbrA/lTk3Y=; b=VK46LTRzaT3u1T
	VIVrqTi5K5vZ6WJ/1Nfe7MfelA8q85Oua2GeECBLsR2ijWLEHZ5XYPUUPY2Jid6hAXltm7+Aa15AM
	Vsv6WxCzWKz2LwheDJz9MpakaiTXdfEPV5gUGz20p/mrQQFS8JYRaBVfwD4OLnlTsIEjZEJFOW7Mc
	aq1aJ5glJIBQmgBmhlcflCOMQSTymgFJk84Nzg1JCEKUnkIXx1otPSSWITqFcrMi9+qMjBf7NmJPx
	/P3SUYTxSw3fR+0ROYOgOLLMDWDEtW/GtxwOyzSLm5Il7mMKLFfvA4q+gaHCop0ndZtZpuHy7nDpw
	5wjmAhqNDZcirs+g6LSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8lZ-0000000F0ka-3KHf;
	Sun, 24 May 2026 13:21:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8lW-0000000F0j5-3A81;
	Sun, 24 May 2026 13:21:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OAxt5J335207;
	Sun, 24 May 2026 13:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VqN21vzvn/n
	BLPhaHYlcmo4rXms5WRMKGKY9USyjovA=; b=mERksEt8Aimu9WX4F1T/rody5Sz
	T5tsLWs08ur6FVC5Mc8yBVjVD9F4wxFX2Ew5eDtxPiygkP5qLTFs2+ZbAc+y6xF0
	j1l2GhfvIxANbYHP51t3dNyBV+yiovwDyXR+h1N6fCWu5FhmXjc/R0A9r4e/M7WS
	XvKQu6J/etv3LTE21fOwa/C+ZHCLexbvjjBuj7tza/iUNt1y3WExYTFtSqkocAUW
	+ZQ89oB4lpHCWof5BImzMpjY3R8yJSstDShIIplMfBex1gS+DsOr24aSdv0YGeV3
	okRT7p/fwMiEQYthtMYsX2QFIGY2YuG362MSNcIrl5DsdytUZRo70m+iftQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w2qpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:21:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64ODKxLU009279;
	Sun, 24 May 2026 13:20:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahgq6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:20:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64ODKxRV009266;
	Sun, 24 May 2026 13:20:59 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64ODKxMd009262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:20:59 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 7BF6021A78; Sun, 24 May 2026 18:50:58 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH v3 1/2] irqchip/riscv-imsic: Add nr_guest_files in per-HART local config
Date: Sun, 24 May 2026 18:50:56 +0530
Message-ID: <20260524132057.2425034-2-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524132057.2425034-1-anup.patel@oss.qualcomm.com>
References: <20260524132057.2425034-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a12fb3f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oD6YGmB8v4GqGCjrqTEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEzNSBTYWx0ZWRfXxUP+gnUjoIVY
 BVWe7nNzPAwOsQWiftr0sya4D7N3/rB+K5+4zQ1zaBrOf+Yu1MgdVq0+KDCSbdLZ+c7sG/Eav5F
 WRkEM20Kq8WKldGUdqUHZBS3fORaWZNnxJi6gAGmau59xkUCFd51J2KDEExSBisdsQy1wiz2TAr
 ZMhj/yOXb5BOV/uiDPOZLLaPILxmE8yCXAkujjbtPS6asbUnV85uHq35dH7aumXjlsSYERhJYR6
 Rr41cbuXF8PucCqbWhRP0IuZqHmenDRjhWiym+EnPJvfuRH1E/99GkqrRIA0glJkYdnMcB2EWq1
 TUH+vJJETo+/vBOSCZO8bq5Tg9iECfx/znyEgHvwQERA9L1At2OD9eXFBSZ70dAVoqEr3RQSsL0
 go5dIS7x4patFzvJDhjHQeaPtYnEpvcSqZU80WHYu/hhwr0lO+4qyPcgUVPFFm9HRURpF0Hzpwj
 zuSC2t657RD3YY7Bi+Q==
X-Proofpoint-ORIG-GUID: 2O3GlNlgBjCFVSqrFbhno7vm2pdbVGER
X-Proofpoint-GUID: 2O3GlNlgBjCFVSqrFbhno7vm2pdbVGER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_062114_796338_AB1C0F9A 
X-CRM114-Status: GOOD (  13.84  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Add nr_guest_files in per-HART local config to represent the number of
guest files available on a particular HART whereas the nr_guest_files
in the global config represents the number of guest files available
across all HARTs.

This allows KVM RISC-V to use nr_guest_files from per-HART local
config for asymmetric big.Little systems.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 9 ++++-----
 include/linux/irqchip/riscv-imsic.h     | 5 ++++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index e3ed874d89e7..b8d1bbbf42f7 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -920,13 +920,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_va = mmios_va[index] + reloff;
 
 		/*
-		 * KVM uses global->nr_guest_files to determine the available guest
-		 * interrupt files on each CPU. Take the minimum number of guest
-		 * interrupt files across all CPUs to avoid KVM incorrectly allocating
-		 * an unexisted or unmapped guest interrupt file on some CPUs.
+		 * KVM uses both local->nr_guest_files and global->nr_guest_files
+		 * to determine the available guest interrupt files on each CPU.
 		 */
 		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
-		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
+		local->nr_guest_files = min((BIT(global->guest_index_bits) - 1), nr_guest_files);
+		global->nr_guest_files = min(global->nr_guest_files, local->nr_guest_files);
 
 		nr_handlers++;
 	}
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 4b348836de7a..61af3a5bea09 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -40,6 +40,9 @@
 struct imsic_local_config {
 	phys_addr_t				msi_pa;
 	void __iomem				*msi_va;
+
+	/* Number of guest interrupt files per-HART */
+	u32					nr_guest_files;
 };
 
 struct imsic_global_config {
@@ -68,7 +71,7 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
-	/* Number of guest interrupt files per core */
+	/* Number of guest interrupt files across all HARTs */
 	u32					nr_guest_files;
 
 	/* Per-CPU IMSIC addresses */
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
