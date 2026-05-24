Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D5DCD5BB1
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+Yu5n/NngK1PRAhntqjGwLb3Cl9YgP4gxWDlTeQufy0=; b=Ej49kE8ukRv6Dk
	G3TB57L8iTy9eUSEXojGmE5RhEZEjbtqqi1IK5gNHR+eK26nEWSZzpQzd5yyNzbWcj5Ic9i7a+lCJ
	aFvDZmhyHHGQCe0IIVIDSG8QiCiFQ6iaDfCjT25GNa4hdpJdtOgfvGQo7UEtLV9+WqLB2sjMAmh6Z
	5R7dIOr3GizXSD0Wkqu/8AW1eIt4nzwvQm1KwVS7tmdt8LwlsjoVTiFvASa0/qMbh26UT0K0VxD7n
	aijpgwLpgcSZJo3LkgVyWXsYgW8EG5+LDlGQTfZfzO90qJ81QP63ygW/XHr0tJBJgZ9vJVHtV8lF5
	mboHzqqqFJkdv+1lR7Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBZF-0000000FFnD-1Gvm;
	Sun, 24 May 2026 16:20:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBZC-0000000FFmS-3jXs;
	Sun, 24 May 2026 16:20:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NL5sA31498348;
	Sun, 24 May 2026 16:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hdgYunfzgz7gRF8cx00GMl2+9vS+/7kqWBw
	kqOe/6fo=; b=dtFnHIzSNR14ugY/2oN6AVgHRxt6ZMg4uaGIgMj/YUG6GsJYGV6
	nB1Xk3xr2j0eK7Q3YURcOJVivZ7Ucdcrjme7b8Vb6+3lBJS4Z3+dw7G9NBfLKqYE
	pOIdXybRtWjB9vgYu+OUVPBEU+VhCvymSExxSlbu6OMZgmVAS8t3b5sY6hOBSIs1
	hF9pRiYPsOq/didLF1j/+yBi6J7hFICOvUintPXM3Mk6Rp+rfKupC5wsJ5dezqO9
	yraLSD4gAmCWXUXT593wyX8HVyN1FyobOQlFkfSu0UYI9zq/YmnwZkW4OrGJL4Cl
	cRv7OReX92m8P6A54iA41uSwIfZbE0cN3tQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386kqth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 16:20:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64OGKKFe025074;
	Sun, 24 May 2026 16:20:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5ahj3eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 16:20:20 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64OGKKU7025058;
	Sun, 24 May 2026 16:20:20 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64OGKKAa025054
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 24 May 2026 16:20:20 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 659E721BF4; Sun, 24 May 2026 21:50:19 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
Subject: [PATCH v4 0/2] RISC-V: KVM: Convert HGEI management to fully per-HART
Date: Sun, 24 May 2026 21:50:07 +0530
Message-ID: <20260524162009.2602535-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Lxv0I_R_MNDPKhaUzBwpO-OUTLuvY4uh
X-Proofpoint-GUID: Lxv0I_R_MNDPKhaUzBwpO-OUTLuvY4uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2NCBTYWx0ZWRfX1YEuiN8g2mWS
 hz9WL+QmkEMaAri/H3AglasEE8iwk2KJ0woBLxVhDnTpxpCIkpDUy2K5JCCj/4Zg/CCvWvDEwqB
 b8WfoXYe7gNWhnyYULaiql6UW85L7Zx7MZWpnfqsGDlt7NaSqIti5q4hkOYmfwmNo9rjLnrJTfJ
 Tbxbq6r6MqNl9y7dka3orUfHoShBINNGPQNyWm2pi6x2TE54gFnenwABl1f5aLXHV5kdit/Cc1I
 No4PiumDbuqW0Ha7/J3vF4s7HLdiSrbra90RHjsOAbZ6DUr0tgJIKTLKolMgZdaKH43TnYvqQCK
 MNXt68+2atb946w0UKWNRqWo3nBNn+OSivGCoMhLXr1ZoMVsYLM+JfaGx0TATsyJ1mra4o28FjB
 k+QGlXykU5hGgNVeirLjwAfsD+jh66g9XW9Op0/YdFOXVUB2RRzpfbxyz3dLBQkexNNcQ17EFqT
 7KMMQXK/+MkU6ex4JCA==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a132548 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=KRMKSR888c52cKfz2NEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_092043_049683_D448C463 
X-CRM114-Status: GOOD (  11.38  )
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

 arch/riscv/kvm/aia.c                    | 65 +++++++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c |  9 ++--
 include/linux/irqchip/riscv-imsic.h     |  5 +-
 3 files changed, 41 insertions(+), 38 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
