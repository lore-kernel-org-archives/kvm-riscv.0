Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D803CD5BBF
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 May 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c/b5qvNMOi5D/W9DfiWH3llcEXejoThnF15e3//LEOQ=; b=ubXxHODOAXZmSJ
	sEqz9OwlblYpSeQwT6SWoNrtjPe/5tJsX61BfrWPd553pbZCW3CYO8LqVf/UqORrhuDRU1LUpimoZ
	jfTrZjJ7vUb7/ypa3KCd+ZuYCG3ABV/qfTkyde4orYz3J7jnDrfTIDUGFx7+B1JKMXH7rPAoRcM+U
	hNSjaLTmqyY6UQiQ+dTO2mwX6YPweYi/+SKshYWfvX4Js4ogaP+O0TLZ+I0ZED7w4CvJocCTPTGva
	nlBs6kwqPzszbaCP4Ws2xbBNjpFdGzS9NgF5769Rs5kLi5MYbhM8+7XEwMWOJ8clVAv4i8cvdu7rK
	wc3TfDEgJ5c96tTnMP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRwo-0000000Grlq-41OY;
	Mon, 25 May 2026 09:50:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRwl-0000000Grji-41FP;
	Mon, 25 May 2026 09:50:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P70pqL609776;
	Mon, 25 May 2026 09:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8SXEkshZgC7NQobwYiVJCAvXimLMq6MblPJ
	kIc1DOPM=; b=jalLWrSJi+OOj4XhX9kSSJD+VNEEdKhyxtDxTTNDqVbKYc8Mfk4
	pVNUHNkmlBjLFUT9IXIrdYaZK+dSio1O96qbH+Yb4URlVdnAN+o5P+sS8vVd+Clb
	0fSLASw17qUFDZpwudpbALXSQS4uMe/Qg8MHGvJGx0QS0uhY3xNkLq9OHe1iX0LW
	29B5mt2iMyhx/oOAx1xbw8wlcCMa5jU9b4Xq1+R+T81ObcW5EuW4sHopDkLC4wq0
	LjlKoyo7MB0Cl48D/Z0jcsOpu2o7jrO63eNm/Vp13oBmG0aadHACB5J0e4op1YCB
	U84XDv7VC6QTbrFfDao3fnOZqTt9zzoRWFw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9nxv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:49:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64P9nl85019448;
	Mon, 25 May 2026 09:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eb5ajeh9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:49:47 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64P9nlGg019433;
	Mon, 25 May 2026 09:49:47 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64P9nlwY019430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 May 2026 09:49:47 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 62BE421CE0; Mon, 25 May 2026 15:19:46 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
Subject: [PATCH v5 0/2] RISC-V: KVM: Convert HGEI management to fully per-HART
Date: Mon, 25 May 2026 15:19:43 +0530
Message-ID: <20260525094945.3721783-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: GePhHt82nA213QfqrdJ4IiZXjw2Z-8pi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwMCBTYWx0ZWRfXyGpvfcIkjmFe
 f3WJ5UEV4cyj2+NcuKUiPKHmp10LDDR68/mJwQEA3OlrtqQvmQN5+FgmWHRc44bmk2S/WCwEquf
 kd8ccjssaxz4fWsnuH8zdmoWMMlC04/yUDtTiFQ4bMCSN7TMq1u1j1EXn/4KgzZKFmjVucwOuEO
 pwioasiUqjIk+tgJrQMXJ9T5rzj4Bq+iJ6lhOk08dDhrlXnKaNw/TkIPmQhAA6DdVOfF6k1azpx
 bFcFYHMscQyEZS2W5ZAeS4tsTUBMYa3wtvfewme7BV9TpdDyRzC/NOreiS8Sbeu9ugbjsX7aCjp
 7nrRq39p4IIogfaShuE5IQiF/3FirRgolah3ARV+R4SJPEOLmMLJUReQ9BgK3UeRRmWq+U3HYKa
 M4GhiEarvniwWIrpTBA7YTLl0hLBYKJH7adX7eF0bdfBfdBukyGGk1a2XXfueA3NbwWI79Kb1IV
 VdTFiRbclsUVcCsFVRw==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a141b3e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=0T7DXsVKAORm7GO0La0A:9
X-Proofpoint-GUID: GePhHt82nA213QfqrdJ4IiZXjw2Z-8pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025008_000155_54DF282D 
X-CRM114-Status: GOOD (  12.04  )
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
V5:
 - Avoid re-initializing hgctrl->lock in kvm_riscv_aia_enable()
 - Setup free_bitmap only once in kvm_riscv_aia_enable()
 - Make kvm_riscv_aia_nr_hgei so that it can be concurrently
   updated from kvm_riscv_aia_enable()

V4:
 - Don't modify kvm_riscv_aia_nr_hgei in kvm_riscv_aia_enable()
   since we use kvm_riscv_aia_nr_hgei mostly for HGEI enable/disable
   checks.
 - Use GENMASK_ULL() instead of `BIT(hgctrl->nr_hgei + 1) - 1`
 - Always setup SGEI interrupt irrespective of kvm_riscv_aia_nr_hgei

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

 arch/riscv/include/asm/kvm_aia.h        |  2 +-
 arch/riscv/kvm/aia.c                    | 88 +++++++++++++++----------
 arch/riscv/kvm/aia_device.c             |  4 +-
 arch/riscv/kvm/main.c                   |  8 +--
 drivers/irqchip/irq-riscv-imsic-state.c |  9 ++-
 include/linux/irqchip/riscv-imsic.h     |  5 +-
 6 files changed, 68 insertions(+), 48 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
