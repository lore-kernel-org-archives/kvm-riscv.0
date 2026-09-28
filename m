Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6179CA5FA2
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tygbnqMcdqoWT8FK/ocZ7GOH5lXj1cCIsQngxFIdS2o=; b=TvVZCP7PzXWbUg
	Qes0DoO5gFP1iCCyIIaOrd44mcDJ7gRYSTC+YKpmfqbSOO3OEs0RbzYRWbUsBlJdvhQJ+5yiNmv/r
	bh8WoMduJPhUXX6ooGfJONLBPykV2sgMnHR1ucrETQU3jVQNuDjWHYJvcP5Qm8J3a0ef4ZBvQJ74Q
	9ybMUsTtDZFkata4axZoWlnqKm2oDiLQBc2huJ/O5b9sebStgCoD43GzTEJjdQmrMsCl0cfV2qCib
	SUAewwyvmkZE+6gif8QVwigwanbM9Yd7BlegxaI9/ohBy24JnkKFxs2Ao9SoAYrhNNxUzQOp+kodQ
	z9ZXzcm99HWuH4FLCN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOG-00000000lJx-0f6w;
	Mon, 28 Sep 2026 14:31:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOD-00000000lJZ-2Vlg
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:31:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAXso1434601
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/O
	SLFJMMjU=; b=WEJVLUt6Qgndx5YiL7HpWyG8kpXQW6l5olRaMN4FmaJtiSAMI7T
	3yv/pOhRBpkLZyiKRu0CfqCIbDxYg1vdaHIBC73J9OOf/tSqGMkuhLADt8b5ShH5
	BBBWHHl4A3D2+X1ObB3j0llCuQrJgtg29SJEBbeGast4A4kD2OXm+BAihAAGIShA
	BgZ0QlwUae0plvs6QYFxdtCn8m2+kcG9SqUn7P3XW5f+co5y7bdt6hJLhfJIzh9X
	c4ISX9iTXWVvLjlGbhpAY9jv8e/3I4XsnmtFwE/KWcOm9EtiAQ4z5l6gsYcoSSMt
	F177KeS7x4cTW3Fi7Mbg/muDcB24nsKEd8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s1ys3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:31:32 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e9cc5ac86so272926241.1
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605892; x=1791210692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/OSLFJMMjU=;
        b=atYr7kJEgsyN7d+JkWIb6tMX3Redj9CYvBEvKNJlmp6W5ErNE1hhKrdif6XHwHlSC/
         eC5pX1rqAs0rsR5sOHGNY/liiXYbBFDT16/AFx2BAtDLatHS3xEbhM48iYWQDmbq+JbC
         EnQwGvoZn7p3eU3tdVe0X10iMCRIezkdTftf0Q4wMRAMzMp5NuYJeqcXaqAJ43ZdjSLs
         4ONd4xG0vqhjGWeerzqqeZRtQuD8jCOtJMPXGcvD6olZtS/GBtpd2aBNHszgXAQ1XUSx
         E2LuRvs0BYMga38Jh8XL7Eq3k+iL7XD2uXgA1dYCnMxtG/HyLQmuz48AyFxrbDJZVTiS
         Kjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605892; x=1791210692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z60xJj9fp2vRAD3QTBKkgHGd6KjBHDRVy/OSLFJMMjU=;
        b=ljWIml8mhbzUqwV4BUq/mNbUZZUDxM2fhppqPzPtahsYAKzG7Q5HgqIdqcQYMwHWHK
         kNX9iWy9Nm1mEYP/DuvrXkx1CIN2hkPlIM60SRzbm80tIawW+1/jGDtzwChwUVZLCLyL
         LfrVtKSABFqwnIIwfkWxI9+39Ch75KAYN8lYN5+VDiZHYLHzBHD0e937QdQ1nyvI6Izk
         gzVrhpW7P3ORIrP8tR0NNrgw9gvlIFZDNpEl6+ZtcG2+G5IPLRBTRxs5OTDolE0O6q0Q
         moIkykOE8lhPvRFNakq4Ccgh3tNVDeoasyyOyf8Bgi7fJhfjv5+xCbJVQW44v3uNfdh/
         Qd+w==
X-Forwarded-Encrypted: i=1; AKwUvBxN0J2g+4RW5s29UWQvoFDVuPUsDNnQqluyh9CxmUZl0OwKlYnj6qBRGNRgLZ0Py4u9AoMVb3PTYnY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJeQmlQH0g5bJC/xNGpw+2M294xK3A369pt0/+8dVtOmtj/Dz1I
	bX6fyLo3nv11KBxrnPyi9eRczi6VXqXdqznnEHrFwGC1AFY2tWaBiLdugI6d6j+XexEKuhVGb7u
	bXLuiPgVQHC77NSVTlq+dfBv/cUC/+GhSyPgUVfc1rZbrvg1xazZfkD0sWD7u+G7PfEcI
X-Gm-Gg: AYBFou1yXjeYkd2234JaGXpvUcY8G7uqKpiAOZ0Vqx9+z9EavpU8hRg5f3c5ikiq4We
	VuuDRdJLw+gO1rTPJA6lvVcDwIh0dzVCUpI8Zhixy91lol6UXTbC7Sy24ynKUFNryIL5bGO+LUP
	Y77Rxt35NFyyvwIXAiehyQViqT4RGFmD/kKnU9YSFITX6OgoFwbLFD4vDywYfO+FSs8yBf9MCVJ
	f2wicemOcE/zSbCQWIGTcaJQ/BFTy0wx9a6i57xqbL/Dcm73edRoQw80QyHH6vGSQ3RWDWp02a0
	YIekB9SOF9mvBuGtZ1FIzww0gj6EHpNJpcN8QFqgwlazGLWKTzrHwc3fc4ct0OTzarwnn76uA5G
	pnBndjk1wbLg40+Zc0xGqcuWj4eJOpQUyO57AGA==
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7b390445334mr1520029137.30.1790605891574;
        Mon, 28 Sep 2026 07:31:31 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7b390445334mr1519697137.30.1790605875667;
        Mon, 28 Sep 2026 07:31:15 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3bcadbsm292389266b.72.2026.09.28.07.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:14 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 00/14] iommu/riscv: Add irqbypass support
Date: Mon, 28 Sep 2026 16:30:59 +0200
Message-ID: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXySFvOrGwdjos
 CshYdzwE3WSkGPamdCWHWq+5L6RzVYt75LARHd8mwbW9o2lc40x5dqMrgZIvGEe0uj5FBFX369M
 4WPNLbdjn4c5Pb41vgNarHu610AN3yVCWQ3FT4rSZLfTFPBh2N4ltdo6JpH+R202Leb+1h0xWkB
 2mjbJrI9lS3yl/ZE7U/yDAlTuCeevlON14VX1mGBazeaxsgbG9AMIe4FqACphGJgz86yWgMPrnO
 vnQ60T2BzCVQzeyOCSiShX1srn3sq4GIkgj2kdpNYYgBNI0IcdBeKu+ik5kpihH4ZEczZm90qvN
 SaL6aDBY/HM99yMHi6zNqYTLsh68tuMAy+j+bRZH/5WTwopyde1sOda56wh1wTp5/orlnotxa9N
 vduJXzcyPCmRdGc5pXsQDZBQe9vrDojxgZViU9RBnGfnP3au8M+T8PHkzHuxPRaNgSPhaUww7M+
 adyA8C+LqBbS9YKFUJw==
X-Proofpoint-ORIG-GUID: H5VTlIYroHNqnxivndoHoBsDaLysNrFo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX1/+CWeZ9O5km
 QfNlk6mbhy4DJtXfBeuvlhSA1TbyV7HGOFun+ullldXy/rGAm6hk8b04t10Ih4FdM6mQf3LA+IZ
 nIjOV6lFIAoSh67jgqkZHvSuPKIzcRA=
X-Proofpoint-GUID: H5VTlIYroHNqnxivndoHoBsDaLysNrFo
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba7a45 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=bDdBU3oEAAAA:8 a=EUspDBNiAAAA:8 a=SRrdq9N9AAAA:8
 a=JbFp9CTg7fNynJPQWhgA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=DN7SgORnOiO7RqxRx1GC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073133_664230_7717DF2D 
X-CRM114-Status: GOOD (  20.21  )
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

This series adds the RISC-V IOMMU side of IRQ bypass, allowing MSIs from
assigned devices to be delivered directly to guest IMSIC interrupt files.
It uses the IOMMU's flat MSI page table to translate guest IMSIC addresses
to their host backing, with support for both hardware guest interrupt
files (VS-files) and memory-resident interrupt files (MRIFs).

It has been a year since v2[1], and much of the design and implementation
has changed. Host MSI remapping, IOMMU_DMA, and VFIO enablement have been
split into a prerequisite series[3]. This posting contains only the
IOMMU/IRQ-side support. The KVM patches will be posted separately: they
are currently a minimal client for testing this interface, with further
work needed for general device assignment.

The design evolved while considering two-stage guests in the discussions
with Jason on v4 of the host MSI-remapping series[2]. With a guest vIOMMU,
the address in the device's MSI message may be any guest IOVA which the
guest's first-stage page tables map to a guest IMSIC GPA. The hypervisor
cannot determine the target vCPU simply by decoding that IOVA. Instead,
the intended hardware path is:

  Guest MSI IOVA -> S1 -> guest IMSIC GPA -> MSI table -> VS-file or MRIF

An MSI-table match completes the translation; addresses outside the MSI
pattern use the ordinary second-stage page tables. With S1 Bare, the
device uses the guest IMSIC GPA directly. Populating the MSI table with
all guest IMSIC targets allows guest changes to S1 mappings or interrupt
affinity without corresponding MSI-table updates. When a vCPU's host
backing changes, the hypervisor updates the entry for that guest IMSIC
GPA, leaving the device message and guest S1 mapping unchanged.

The MSI table belongs to the second-stage IOMMU domain and is shared by
all devices attached to it. RISC-V requires second-stage translation to
be enabled when using the MSI table. This is separate from host MSI
remapping, which uses ordinary page-table mappings prepared by the common
DMA-IOMMU/iommufd code and composed by the IMSIC driver.

A per-IOMMU interrupt-remapping irqdomain, installed as the MSI parent of
eligible devices at probe time, provides the irq_set_vcpu_affinity()
entry point. The IRQ hierarchy remains stable across IOMMU domain changes.
The callback obtains the device from the MSI descriptor and operates on
its currently attached second-stage domain. The irqdomain has no private
per-IRQ mapping state or MSI table of its own.

The affinity protocol supplies an owner, the guest IMSIC address pattern
and mask, and the complete set of guest targets. The first forwarded IRQ
populates the table and installs its configuration in every attached
device context. Further IRQs share that table after checking the owner
and address layout. A separate target-update command changes a guest
IMSIC's backing without changing per-IRQ forwarding state. The last IRQ
to stop forwarding removes the table configuration from the devices.

The main changes since v2 are therefore:

- Separate host MSI remapping from guest IRQ bypass, and use second-stage
  domains for the guest MSI tables
- Replace per-IRQ MSI-entry mapping and reference counting with complete
  guest-topology setup, domain-wide table lifetime, and individual target
  updates. This is intended to accommodate guest-controlled S1 mappings.
- Add IOMMU-side MRIF support alongside hardware guest interrupt files.
- Move the KVM client out of this series

This remains an RFC, particularly for the relationship between the IRQ
hierarchy and the domain-owned MSI table. Jason raised the alternative of
a per-VM irqdomain owning the table[2]; the arrangement proposed here
keeps the IRQ hierarchy stable and ties the mappings to the S2 domain
shared by the devices.

The dependency stack is based on linux-iommu/next at 634706fe6e36, with:

- "iommu/riscv: Enable MSI remapping, IOMMU_DMA and VFIO" v6[3].
- Fangyu's "iommu/riscv: Add hardware dirty tracking for second-stage
  domains" RFC v4[4], which also supplies second-stage domain allocation
  and page-table support.

The branch below contains all of the above, this series, and the minimal
KVM IRQ-bypass client:

  https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v3-kvm/

Testing requires userspace to select a second-stage domain, for example
by allocating an iommufd HWPT with IOMMU_HWPT_ALLOC_NEST_PARENT. The
corresponding kvmtool branch is available here:

  https://github.com/jones-drew/kvmtool/commits/iommufd-nested-rfc-v1/

LLM-based coding assistants were used during development for code
exploration, patch review, test execution, and drafting and editing
commit messages and this cover letter. I reviewed and finalized all
resulting code and text. Per-patch Assisted-by tags are omitted in
light of the ongoing discussion about simplifying coding-assistant
attribution.

Thanks,
drew

[1] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/
[2] https://lore.kernel.org/all/20260820214150.545737-3-andrew.jones@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260925151659.419512-1-andrew.jones@oss.qualcomm.com/
[4] https://lore.kernel.org/all/20260915032828.11250-1-fangyu.yu@linux.alibaba.com/

Andrew Jones (14):
  iommu/riscv: Allocate MSI tables for second-stage domains
  iommu/riscv: Prepare domain bonds for outer locking
  iommu/riscv: Serialize MSI table publication with domain attachment
  iommu/riscv: Reject live S2 replacement with forwarded IRQs
  iommu/riscv: Derive the IOMMU from the device in IODIR updates
  iommu/riscv: Cache the programmed device context
  iommu/riscv: Prepare MSI table updates for interrupt remapping
  irqchip/riscv-imsic: Define IOMMU IRQ bypass protocol
  genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
  iommu/riscv: Add IRQ domain for interrupt remapping
  iommu/riscv: Prepare info->domain for concurrent RCU access
  iommu/riscv: Prepare interrupt remapping for IRQ bypass
  iommu/riscv: Validate IRQ forwarding requests
  iommu/riscv: Implement IRQ forwarding

 drivers/iommu/riscv/Makefile            |   1 +
 drivers/iommu/riscv/iommu-bits.h        |  27 ++
 drivers/iommu/riscv/iommu-ir.c          | 505 ++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c             | 352 +++++++++++++++--
 drivers/iommu/riscv/iommu.h             |  56 +++
 drivers/irqchip/irq-msi-lib.c           |   8 +-
 drivers/irqchip/irq-riscv-imsic-state.c |   6 +
 include/linux/irqchip/riscv-imsic.h     |  60 +++
 include/linux/irqdomain_defs.h          |   1 +
 9 files changed, 974 insertions(+), 42 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
