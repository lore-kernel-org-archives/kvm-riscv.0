Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B84D2ED0F
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tSsP93af+gyrxFCCNL0AFTsp2ZSHfJeKboTnh2KB1sE=; b=37bckFeNTrMtp4
	4JzNU84oBDLq60GsYRNdHdR/+dRYVxjrJIR6J5x+gZ5egrbfxWpJhC7pbLvgA8JzEFiTY2rUHLW7J
	KIiOdzwD87d0hPMk5WdUcP0rtpd1tOpHmmzXU1Y6llGqTiE3DgQglXVsbsatCHcCkm0yfL+tGYv01
	N8CNpP7cjxkUYpf/pir9Nivzq1bgiCsha+41unwuNm/kJ40sRWQMRQ5TP4kPYck+zutXBzH2P2fgb
	yvCCfXbvP5fBUV3HzqDst5x1ZFwtPBtwgo9lVjJlkmnlYAgvZkoL25RgXH4g0B5V9I4SlBJaIpB0r
	prd9/pHvKDmDca7hCxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gB-00000003P9d-3pQ2;
	Tue, 20 Jan 2026 08:01:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fT-00000003OEu-0M2v;
	Tue, 20 Jan 2026 08:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LUwtVb+zh7pOah3RTznusDvjfmcsislhfpa71/C+XK4=; b=ZDsVTBslBc6ctIKSwbtZMTffdb
	GzcpCRdSMd+1SQ0wouC5gsEXiOO8yk9KadvHH0Smc5tjDIuRTGJA7cPbQt0F0RDc8tcOxy7v6vRG5
	/2DbO1qsHZqfaw5oeaSDqjGQKAnGg9RbcZXPNF1cbBD/UrTN0N6H05uyhrBxQ2aVL+baRp0Pa3HFi
	h9RkhNtLrEVLPhGL1/REZAHTMhQd0AHNlldKyIPZf47tn67IDZ/o0mrHf1vrVicIELVXI44eHaCwe
	zudpJwzRsX/kEYro9b8NnHq51jC7c6s12/XQsWCAmXoDtnVXwx2cgVx88iiD+pvLXSdgVW7LGW01g
	cgxNco6w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fO-0000000DX5U-390H;
	Tue, 20 Jan 2026 08:00:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K3sKEi3252355;
	Tue, 20 Jan 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LUwtVb+zh7pOah3RTznusDvjfmcsislhfpa
	71/C+XK4=; b=PWc0Hf5GVi0L4cJ3NTXYA42CqC9NbgBlNdKMAjOVlk3tdOGww4B
	IkRcaD6EjukjbmiVBhDtpAMRfXGI5uPq7VBEIqTx8MXGwse4U5NcGa3K75/SMaXy
	2A/oc+NE339iNsSRkyguuqnirXNB9kl3RcualVPKDuVydwgD1c84t/lrm1oD+FSx
	zPCP0J//Dd8FyRjA3Z/86Bkh8+80RpNrdm4saOzgKwls0Ka0483KJAt7jtfvQ3ef
	Z2lE1vGC5jPGULXAxrV9lJghqUzRMKI1V0O1gidwDt/tg708kPUAb8ZjINAff1R+
	N99GgABx+3qlKzk0HFvnfqubqtk//0iqCmw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27agnk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Fmq007858;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80Fat007833;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80Flv007823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 93FB522B37; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 00/27] Nested virtualization for KVM RISC-V
Date: Tue, 20 Jan 2026 13:29:46 +0530
Message-ID: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VQ3woIZCChEQITWoDZsuYTYmDwBvlg2X
X-Proofpoint-GUID: VQ3woIZCChEQITWoDZsuYTYmDwBvlg2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX+seI/qlFN9ds
 6HawpbYn5OSwQSWeC9ptm4pgEO88gxZ3o+JMPgk3U9EWTUwQPTzUxUp/9LpHPwFGCpWL0LeAInM
 92MGwLCUJ5mrD1QMoWeb5dad+/1BD9aq7i47uDI27GDaJtQbHlzmMk5VeTd3d5829f3jlVU8CO0
 514TxJt9VYAwMHSVpn5/af8MkezzjBbj3sKHBEyjwW4ODK1Gjx1NR8ZVrK7BbImQvp8jN8hdxrU
 NMufIYnHEbPDhUo6/s5JOTCpjpAbrrlnW8gCahvehjs3AMnRFJ/fcj31jHC2Wbp23yRuZmvEFtJ
 9ixkwFP7zjAU7HVF05zed1DXezRUjVZlgfQGAZpWqtgcQnrYXM5wG2MQXrrIgU74r1uC5Pcpi1V
 xke6PxqPwPT091aX2x5FAY3lzsi5qrYjgmA8Y3bjMOJHWSXBpjnuJDQc7ZlA+CI6AMrZTiVqAwW
 saeTKq41Nq7/qRuWPng==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696f3613 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=EAKoEhkXCw2zVP5q2N0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080047_266622_9BF92B58 
X-CRM114-Status: GOOD (  13.50  )
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

Initial nested virtualization support for KVM RISC-V. Using
this series, we can boot Xvisor inside KVM guest and KVM RISC-V
insmod also works inside KVM guest but we can't run nested guest
at the moment due to work-in-progress G-stage emulation (or
G-stage page table walker).

Patch01-to-Patch09: Fixes and preparatory changes
Patch10-to-Patch23: Actual nested virtualization support
Patch24-to-Patch27: ONE_REG interface and get-reg-list selftest

Upcoming work on-top-of this series include:
 * Software MMU emulation for nested guest (aka swtlb)
 * HLV/HSV emulation
 * Sstc emulation for nested guest
 * SBI NACL for guest hypervisor
 * ... and more ...

These patches can also be found in the riscv_kvm_nested_v1
branch at: https://github.com/avpatel/linux.git

Anup Patel (27):
  RISC-V: KVM: Fix error code returned for Smstateen ONE_REG
  RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
  RISC-V: KVM: Check host Ssaia extension when creating AIA irqchip
  RISC-V: KVM: Introduce common kvm_riscv_isa_check_host()
  RISC-V: KVM: Factor-out ISA checks into separate sources
  RISC-V: KVM: Move timer state defines closer to struct in UAPI header
  RISC-V: KVM: Add hideleg to struct kvm_vcpu_config
  RISC-V: KVM: Factor-out VCPU config into separate sources
  RISC-V: KVM: Don't check hstateen0 when updating sstateen0 CSR
  RISC-V: KVM: Initial skeletal nested virtualization support
  RISC-V: KVM: Use half VMID space for nested guest
  RISC-V: KVM: Extend kvm_riscv_mmu_update_hgatp() for nested
    virtualization
  RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested
    virtualization
  RISC-V: KVM: Extend kvm_riscv_vcpu_update_timedelta() for nested virt
  RISC-V: KVM: Extend trap redirection for nested virtualization
  RISC-V: KVM: Check and inject nested virtual interrupts
  RISC-V: KVM: Extend kvm_riscv_isa_check_host() for nested virt
  RISC-V: KVM: Trap-n-emulate SRET for Guest HS-mode
  RISC-V: KVM: Redirect nested supervisor ecall and breakpoint traps
  RISC-V: KVM: Redirect nested WFI and WRS traps
  RISC-V: KVM: Implement remote HFENCE SBI calls for guest
  RISC-V: KVM: Add CSR emulation for nested virtualization
  RISC-V: KVM: Add HFENCE emulation for nested virtualization
  RISC-V: KVM: Add ONE_REG interface for nested virtualization state
  RISC-V: KVM: selftests: Add nested virt state to get-reg-list test
  RISC-V: KVM: Add ONE_REG interface for nested virtualization CSRs
  RISC-V: KVM: selftests: Add nested virt CSRs to get-reg-list test

 arch/riscv/include/asm/csr.h                  |  17 +
 arch/riscv/include/asm/insn.h                 |   9 +
 arch/riscv/include/asm/kvm_gstage.h           |   2 +
 arch/riscv/include/asm/kvm_host.h             |  29 +-
 arch/riscv/include/asm/kvm_isa.h              |  20 +
 arch/riscv/include/asm/kvm_mmu.h              |   2 +-
 arch/riscv/include/asm/kvm_tlb.h              |  37 +-
 arch/riscv/include/asm/kvm_vcpu_config.h      |  25 ++
 arch/riscv/include/asm/kvm_vcpu_nested.h      | 163 ++++++++
 arch/riscv/include/asm/kvm_vcpu_timer.h       |   1 +
 arch/riscv/include/asm/kvm_vmid.h             |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |  36 +-
 arch/riscv/kvm/Makefile                       |   6 +
 arch/riscv/kvm/aia.c                          |   4 +
 arch/riscv/kvm/aia_device.c                   |   5 +
 arch/riscv/kvm/gstage.c                       |  14 +
 arch/riscv/kvm/isa.c                          | 259 ++++++++++++
 arch/riscv/kvm/main.c                         |  13 +-
 arch/riscv/kvm/mmu.c                          |  18 +-
 arch/riscv/kvm/tlb.c                          | 135 +++++-
 arch/riscv/kvm/vcpu.c                         | 117 ++----
 arch/riscv/kvm/vcpu_config.c                  | 130 ++++++
 arch/riscv/kvm/vcpu_exit.c                    |  62 ++-
 arch/riscv/kvm/vcpu_fp.c                      |   9 +-
 arch/riscv/kvm/vcpu_insn.c                    |  46 +++
 arch/riscv/kvm/vcpu_nested.c                  | 258 ++++++++++++
 arch/riscv/kvm/vcpu_nested_csr.c              | 389 ++++++++++++++++++
 arch/riscv/kvm/vcpu_nested_insn.c             | 140 +++++++
 arch/riscv/kvm/vcpu_nested_swtlb.c            | 146 +++++++
 arch/riscv/kvm/vcpu_onereg.c                  | 334 +++------------
 arch/riscv/kvm/vcpu_pmu.c                     |   5 +-
 arch/riscv/kvm/vcpu_sbi_replace.c             |  63 ++-
 arch/riscv/kvm/vcpu_timer.c                   |  24 +-
 arch/riscv/kvm/vcpu_vector.c                  |   5 +-
 arch/riscv/kvm/vmid.c                         |  33 +-
 .../selftests/kvm/riscv/get-reg-list.c        | 106 ++++-
 36 files changed, 2244 insertions(+), 419 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_isa.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_config.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_nested.h
 create mode 100644 arch/riscv/kvm/isa.c
 create mode 100644 arch/riscv/kvm/vcpu_config.c
 create mode 100644 arch/riscv/kvm/vcpu_nested.c
 create mode 100644 arch/riscv/kvm/vcpu_nested_csr.c
 create mode 100644 arch/riscv/kvm/vcpu_nested_insn.c
 create mode 100644 arch/riscv/kvm/vcpu_nested_swtlb.c

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
