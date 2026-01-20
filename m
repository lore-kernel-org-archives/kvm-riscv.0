Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8AAD2ED0F
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8t4Wrw2/b3Krdwx38m5oK8S3DVPPvVdfu/gyrb0Xns0=; b=NYHY1hXd7vIJ5Q
	VCAmGYgz2dSCML99QbJovn4osfDTH7GMYs19P8ffa1YO8Qrg+6+/BXMCSXqNfi1tTo1kyv0lkNFEp
	/I2rylKR6xg27+56cbS9tT38ZHQ3pavRi/IogxzFOoKN1tISgnBafsM+F8dnr4ZwzjLfva9ywWvPr
	dvTZYSCn3f3sUdYiXvvBYSn0LzMilvXlP9hCXJLaBF4/huoC6mKbBvXxzvuuXB9ZjV2wedIwxzk/J
	Ed6MYnlpu4r4J/WmrN/F8gZZNN9GWkAcBDKV1SghSzKWt4wtVGRg6sMuNSDsA0TZSUdOvfK0DANR9
	sSwKQFlZyCiaPhcMr2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gW-00000003PfA-2FPm;
	Tue, 20 Jan 2026 08:01:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gK-00000003POT-0udW;
	Tue, 20 Jan 2026 08:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=clkTiWO3w3LdqdEoz1Y9Sfhoe+F8p1H6M58Cqy8+GKQ=; b=o0yF7ibYjwugsP0CwY34Q2CH9M
	0fBAEuVQllhbdjm1JBuei1G0/DKrIGa7HKHDbEIGgDCgoCCDL2HfMi/mbGVy5oM+liAuudKZrn5Ml
	uYBbF8d5w/rHvAGdEF0EsTTultL6LYbf8jQZjqJLIJ8zZkZrA4QbeU3s6K/ZijWPg62ExTdj6Z+MF
	FtT8uvwRavewbm5bci3JuY1HXt50fGDlMmQ0L+89uwNEQy5KTOZPCw0OzY3CCJu5xgvoM4yUrSyIP
	/Fmeqd3jmt2dC8TvyeIzqadxboR95Awrc3Ie/qNgecepMTyW4BsYRFnn6MyUgWSen88gVQaGxdu6U
	aeKGjaCQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gF-0000000ETlg-4B4c;
	Tue, 20 Jan 2026 08:01:42 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6i5tL428970;
	Tue, 20 Jan 2026 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=clkTiWO3w3L
	dqdEoz1Y9Sfhoe+F8p1H6M58Cqy8+GKQ=; b=nfKD9Axj3bDIN6sI8wiANvtKIFJ
	SP8zNMp5zQzsCRBvK2NIbRByuHFjTPBlROyCtvqbRwOUbaIqcpKIYbfKFxecF5bi
	tYCYoyvo2PXQtKDMs5fub5f60yrDSOvSmgu7NzK61My0YA24bD+5SIA9Nl4oRbkX
	UBvvckMysJETTXijnA7XU7ekz/Y7kVqtFPMcHMGoBWzwGDGZkiDOrs0diVIrnN4y
	Hx1OeK49UqgyBTZY85PZsjiUWTM+6BfgZg45yJ0EL9cW/6tPNQopCRYp+b0XuC4e
	2XXGQqxZVPjA1UcB54/ztwasYNcsowiJwp1VrmJToK2FxRmMZX5TxYOwyaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4ps0760-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Fmp007858;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80Fid007830;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80FM3007827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 9C35E22E55; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 03/27] RISC-V: KVM: Check host Ssaia extension when creating AIA irqchip
Date: Tue, 20 Jan 2026 13:29:49 +0530
Message-ID: <20260120080013.2153519-4-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wv0PW4tQO34BjBtgqhOrlWBGOWveZafC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX8SmRcLR88iyw
 wA45dWqYtmxZsfLRRwWJg90p3EhhHV9gypFgS8jvwzSNhbLQUb1ww5+wESysoDty9Aiy5LzBP1w
 YK0mhWsmOF2GvqEUHHz2UPQV7AnPQtoVz+NfcM0oBUhuJzkeAaudjD7B43kweAlhfvmHwmL4j9y
 FOQ0KhDc4tK7NTsk2wpwTZcveZ+tKylpEHMayX+GKkZHDTp3mMegFxS82XrFUE3jovQssaMQyK1
 XKIAeI74RsO7px11cYzvIIsaLihLZr5BGnYFTfJ7WoTHuNcQmIVW2rYRwFDjNpOzdY0bdPC1yZ/
 9kHjPgf8hWbmFLaes03nDIET4aSNpjchU2X/gelzErQ4YhZhYHlHd2oiuIuO330zNOMJhESu6/W
 uCygplKSqTDZsCQTv0ku9a9a7Y0roOBdKecAC9qq1H3LknLvSbusXvCB2si3OPhUD4h4ohSH7RF
 c/yl6n6lDptlOgElR4Q==
X-Authority-Analysis: v=2.4 cv=PdfyRyhd c=1 sm=1 tr=0 ts=696f3612 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=au0ipJX4zbpoNYeZlWMA:9
X-Proofpoint-GUID: wv0PW4tQO34BjBtgqhOrlWBGOWveZafC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080140_259310_587A34E3 
X-CRM114-Status: GOOD (  12.59  )
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

The KVM user-space may create KVM AIA irqchip before checking
VCPU Ssaia extension availability so KVM AIA irqchip must fail
when host does not have Ssaia extension.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/kvm/aia_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index b195a93add1c..bed4d2c8c44c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -11,6 +11,7 @@
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
+#include <linux/cpufeature.h>
 
 static int aia_create(struct kvm_device *dev, u32 type)
 {
@@ -22,6 +23,9 @@ static int aia_create(struct kvm_device *dev, u32 type)
 	if (irqchip_in_kernel(kvm))
 		return -EEXIST;
 
+	if (!riscv_isa_extension_available(NULL, SSAIA))
+		return -ENODEV;
+
 	ret = -EBUSY;
 	if (kvm_trylock_all_vcpus(kvm))
 		return ret;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
