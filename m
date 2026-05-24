Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356D5CD5BB1
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6x4wPGpZ8ZZU8hxI1JvLTi/ENxxKxAE/I+ijVqJK4YI=; b=SQ4V+9EHnoNu7f
	rkbUo1HQ6pzk/Wz+SaE3HwaRhLSVlNQiOUy7MuJgwNfvBWTHYoId3/yEgJPAkhFmIS3oKNj4nKCmL
	MH4hrw3eegOi3m1hgTb4arG9AUA6cUPMa8EVyRI2A6dj2aV+reZMdlrwjzUElMBxqsa4fXBVIUhZe
	Slr0IgnnRu+Rxh1RegFXKsRGwwenkRJKhbe3neyPZju1ooBNpsWO3JZtVmDDVqKftIH1imbr4trd+
	cBYUXaWGjX9Di58bqujRxxLyayPRuFK7+AFQfCFEfU7/D7lLA0A1ae6WKLyggR+HklAH3ItC3A1xP
	aopn/G9kvqcI7Sj14Z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8le-0000000F0nq-40yC;
	Sun, 24 May 2026 13:21:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR8lc-0000000F0m1-00hT;
	Sun, 24 May 2026 13:21:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NLtKo12838407;
	Sun, 24 May 2026 13:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jTzdpJ2VY4gVEx122qvvA/GWIcv7kQyG9Q8
	jRQegdRs=; b=Zt9emJk3ukQOEudJnSR62GCMCZJQ6Wdq36AJi01XWgNWnYsZ89y
	v3rCIbaKn06YZleKHouZlYKDOCs7JrFPypiNB1lCgFS/mAXZGduid1eq/LD1bJ0h
	/xA/0mm1j83YbaE333xfs4noUIJudUy7RrAZ/3Oy/Tfxg2eypn3vwd9Ddmrch3l2
	Fce7Xitwtb04CTgpcBjJBUQfV4OgAvUFEPqZRH9aKNgYHPkLxbx9SE96IL+yH59Y
	4L+/4gtgBbXA3VhyGX2Njr/d8xSMWp+G+KvgdiKchetfToyeaObltypP5EHrodCB
	2E5VPZ5dDkjA39mGF1Wcj0n0jjIVE4s2S+Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmkmym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:21:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64ODKx3c009280;
	Sun, 24 May 2026 13:20:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahgq6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:20:59 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64ODKxAW009264;
	Sun, 24 May 2026 13:20:59 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64ODKxiu009263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 13:20:59 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 7A41C21AE9; Sun, 24 May 2026 18:50:58 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
Subject: [PATCH v3 0/2] RISC-V: KVM: Convert HGEI management to fully per-HART
Date: Sun, 24 May 2026 18:50:55 +0530
Message-ID: <20260524132057.2425034-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEzNSBTYWx0ZWRfXxR/Q+iH1dX5f
 5PhIcJ8bOQa9ORRaw0lUoZIJyExYA6l3CT964kzEPRgZ7duImKa2paT/PKWotNCaJcgH1Jt69j4
 OuoYl4fQ2L7ums3sD+Zt5HnuknxIhsukHEPvu8m+GK21hQWY9qrrTTDIYiuOn/SVLihdgXVH0E3
 tvG41It28RhUvHbtxKElQ/CWzcNhtG1Zl9zG4c+rFQVqGhOMr1WeJg9pLnQoTYXXB2TdWQuUAfX
 4wHL/TO2E2lYjkRCl+skbEDQa5MHJiLy+quPkJ5udyYRn5ibBWvBqKX+VgJIfJfevOOzxXd+egO
 rYu5DKoHf5e5ShZgGfgThByBo+AEmD8f3s+oUwP9RjMw41fNmyhZQSQRTwxkry3n2OF/TgQB1Hr
 wIfSeNvTDTX5nY1z+tW5fWk7Jl/0gN1uqazl5ZwrKP/MzyEheQbfVX9jQASrnFc4CvH3G5MGQju
 7ouOxWRviabHR7H+U8w==
X-Proofpoint-ORIG-GUID: aeAce-kUopHkqVHP3cJRpekuSNskK3dd
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a12fb3f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=KRMKSR888c52cKfz2NEA:9
X-Proofpoint-GUID: aeAce-kUopHkqVHP3cJRpekuSNskK3dd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_062120_166994_94AE9B28 
X-CRM114-Status: GOOD (  10.46  )
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

This short series converts RISC-V KVM AIA's Hypervisor Guest External
Interrupt (HGEI) line management from a global "one-size-fits-all"
model to a fully per-HART (per-CPU) model. It also performs the
corresponding changes in the IMSIC irqchip driver.

The motivation is to properly support heterogeneous RISC-V SoCs
(big.LITTLE, multi-vendor core mixes) where different HARTs may
expose different numbers of guest interrupt files / HGEIE bits.

After this series, HGEI allocation, freeing, and interrupt delivery
are completely per-HART and there are no remaining global assumptions
about number of guest interrupt files.

Changelog:
V3:
 - Move PATCH3 as first patch and kept the nr_guest_files in
   global config as the number of guest files across all CPUs
 - Droped original PATCH2 and squashed original PATCH4 into
   original PATCH1 which is now PATCH2.
 - Addressed comments in original PATCH1.

V2:
 - Add per-HART IMSIC guest files to compute final HGEI count.
 - Add min(local->nr_guest_files, nr_guest_files);

V1:
 - https://lore.kernel.org/kvm-riscv/20260421145451.1597930-1-guoren@kernel.org/

Guo Ren (Alibaba DAMO Academy) (2):
  irqchip/riscv-imsic: Add nr_guest_files in per-HART local config
  RISC-V: KVM: AIA: Make HGEI number management fully per-CPU

 arch/riscv/kvm/aia.c                    | 67 ++++++++++++++++---------
 drivers/irqchip/irq-riscv-imsic-state.c |  9 ++--
 include/linux/irqchip/riscv-imsic.h     |  5 +-
 3 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
