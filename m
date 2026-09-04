Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A426AC79F82
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lzbNQ8iFPCyWbyOi7Iw7bYRRxqj7ljdRs59WLOsnJ8I=; b=sIpppU0w49ohaL
	Uze+libJDNgrSZTTbgVnepER3RBZDoabiBNqT15EQDtLUCv63161vbyKAkNva8RS5st1QFQCIa+oS
	Hba0ohki/Hy+qNufo9IMDFXFZCDYezGuUPlILbNcfFLGlsRDPSSkRfefdQ34kPqyi2v4TxC23zqCD
	+rX3ZZllvxiRs8eSnsPIUgbtCDXSIS7YRrjxVvE3YnfgRCJ9rmFFc7jORxJ8eFxwo8lMxz6fXg22R
	A9xKZ3uqTNEbUikkL/n4fbKKHHxsufLlfs3cI3/bZr2TDkw1Pd+DwiDB4+Gj5wbD0e+utNpH/EApU
	BXc6nvxWXmKF5pWG4X3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Y9K-00000002x5X-0nDD;
	Fri, 04 Sep 2026 17:56:26 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Y9F-00000002x4t-2VJL
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 17:56:24 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684GhG2d3185986;
	Fri, 4 Sep 2026 17:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Tp/rQlVy5b9H8KkGE/UvNF5Djl53J
	ttIzvuDDXZXs0w=; b=qUmVpX7o/+HsMehwD8MGS0jYqhpJSz0FrQmQ6LsiGkyvc
	kSuJhPMBztlCctiWoErSwlGvaOp8nsUXMjZwT9INGW+O/T5+jhY0BQOKoVkARbdl
	KoWOd1KTudfuQqhDZpGFwPsju1au1LyB9ejEN6Ufxy/M9YR/2Pen3omT6x6ZoKFN
	NDUpB+f/PhDgxr2wHCwzdIz7ac36Klnr+0P65Bk7bBKC4nPlkqM9ogbP/XGHH7so
	dVSJhomTHMceY7D6YOAll53Ecepm8QJ3TKxQzfRgl7MGsFPvNg1MBdWOHGOmUu+2
	zz95oQTvikiACKg9FRL2K1KqhwECc9azZIaGLt/8A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gbp72k5qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Sep 2026 17:55:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 684HoYTI016095;
	Fri, 4 Sep 2026 17:55:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gbnvv3675-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Sep 2026 17:55:53 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 684HrwmF032217;
	Fri, 4 Sep 2026 17:55:52 GMT
Received: from donglzha-e6-vfio-setup.osdevelopmeniad.oraclevcn.com (donglzha-e6-vfio-setup.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.255.69])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4gbnvv366p-1;
	Fri, 04 Sep 2026 17:55:52 +0000 (GMT)
From: Dongli Zhang <dongli.zhang@oracle.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev,
        joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
        yuzenghui@huawei.com, zhaotianrui@loongson.cn, maobibo@loongson.cn,
        chenhuacai@kernel.org, anup@brainfault.org, atish.patra@linux.dev,
        seanjc@google.com, pbonzini@redhat.com, shuah@kernel.org,
        dwmw2@infradead.org, joe.jin@oracle.com
Subject: [PATCH v2 0/4] KVM: Reset steal time accounting on vCPU pid change
Date: Fri,  4 Sep 2026 17:55:22 +0000
Message-ID: <20260904175550.430266-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2609040163
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE2MyBTYWx0ZWRfX7n+VNjWgH3mr
 JZx3pkbANN7dwqHVyLAS5IVrsoeWRPU3jdp0u/VtqMgZ8a9RZhONAFn6iMXT9PPQSA4NmJI+vZ5
 2jrRPIRMmK1pH07LKZf7sdEWovV4WORVYPMz4pSE18uSZkMZrtiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE2MyBTYWx0ZWRfX8u1jin8Hwbe3
 Ju0zFlBV+u6P6WOsEp9nLvWFpbDcOKWT33tE7w+ntOHeRjwxUwxIbkoq8XffFf5KdagV7vdILO6
 GxA+FyLW7GZWd4A+tOstnevoKbj7yf1W5UX3BmsYhkLUZ4obsS5WUEM9SjeKB69BdSYSvv+m/v1
 dGUAn5rV8IcHoNpJ6Bg8N1vaxdIga166yzQdmsjzAVI13z6T/3+Jl5d4NjQGejI61VyFQZ4j/Ic
 DLR8IIFKaeUf/MLcl3mLOa/m+NPjhyIr0fPf+t9HM7mIBcxOq7cVXrDznHuhxfgGGmQC7Wuh9nQ
 ls7TRglewyXOcgSBn8DFaN4gc39yhOBZY8TJK8CuVzgQu+lYwu49TDRAAdABgFL2I5dT7oiANDt
 ymbjX/Z6J72hX0I+wFTLyiBtptgpZw1eIUjxVzdgy8ed+edsNCTifaeXa8buLpx5BaVBUGU4+qN
 7vPnz0t8FOW0cX+JMk9XHQspwwhmgFoexxptjQCM=
X-Authority-Analysis: v=2.4 cv=G7os1dk5 c=1 sm=1 tr=0 ts=6a9b062a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=jldH35smy0nQoxfUp5IA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12101
X-Proofpoint-GUID: jXUH9hFuxjT4XbU59qtQoreu8BjKnino
X-Proofpoint-ORIG-GUID: jXUH9hFuxjT4XbU59qtQoreu8BjKnino
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_105622_150540_92911FDA 
X-CRM114-Status: GOOD (  17.03  )
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

v1: https://lore.kernel.org/all/20260816053630.527528-1-dongli.zhang@oracle.com

v1->v2:
  - move the last_steal field in the main vcpu structure (suggested by
    Marc Zyngier).
  - Reset last_steal from the caller of kvm_arch_vcpu_run_pid_change().

KVM does not support vCPU hotplug. When a vCPU is removed, its
corresponding data structures are not freed by KVM. Instead, QEMU destroys
only the userspace state and the vCPU thread, while the KVM vCPU fd remains
open and parked in QEMU.

As a result, vcpu->arch.st.last_steal is not reset. If the same vCPU is
later re-created by QEMU, last_steal retains its old value, while
current->sched_info.run_delay starts from zero since a new vCPU thread is
created. This causes current->sched_info.run_delay - vcpu->arch.st.last_steal
to produce a large, bogus value.

For instance, current->sched_info.run_delay can become smaller than
vcpu->arch.st.last_steal (see line 3804) if a QEMU vCPU is re-added after
it has previously been removed.

As a result, st->steal restarts from a very small value, close to
current->sched_info.run_delay.

3720 static void record_steal_time(struct kvm_vcpu *vcpu)
3721 {
... ...
3803         unsafe_get_user(steal, &st->steal, out);
3804         steal += current->sched_info.run_delay -
3805                 vcpu->arch.st.last_steal;
3806         vcpu->arch.st.last_steal = current->sched_info.run_delay;
3807         unsafe_put_user(steal, &st->steal, out);


This patchset resets last_steal when the vCPU PID changes, as suggested by
Sean.

Although David suggested accounting the run_delay left over from the
previous vCPU PID, this series does not do that. It would be easy to make
that work if KVM could simply assume every transition is a vCPU PID change.
In practice, KVM does not always have enough information about the previous
vCPU PID, e.g. after live migration, unless a new ioctl is introduced. For
now, this series simply resets last_steal.

Although David also suggested doing the same for Xen-on-KVM vCPUs, this
series does not reset last_steal for Xen vCPUs. That change itself would
not be difficult, but Xen uses a different mechanism to account downtime,
including runnable time and offline time when a vCPU is not running. It may
therefore need no additional ioctl, or a smaller ioctl extension, to account
run_delay left over from the previous PID.

As I have access to only x86 and arm64 KVM hosts, I created and validated
the selftest on those two architectures only.

Dongli Zhang (4)
  KVM: Move last_steal to common struct kvm_vcpu
  KVM: Reset last_steal on vCPU pid change
  KVM: selftests: Test steal time across vCPU pid changes on x86
  KVM: selftests: Add arm64 coverage for steal time pid changes

 arch/arm64/include/asm/kvm_host.h               |   1 -
 arch/arm64/kvm/Kconfig                          |   1 +
 arch/arm64/kvm/pvtime.c                         |   8 +-
 arch/loongarch/include/asm/kvm_host.h           |   1 -
 arch/loongarch/kvm/Kconfig                      |   1 +
 arch/loongarch/kvm/exit.c                       |   2 +-
 arch/loongarch/kvm/vcpu.c                       |   6 +-
 arch/riscv/include/asm/kvm_host.h               |   1 -
 arch/riscv/kvm/Kconfig                          |   1 +
 arch/riscv/kvm/vcpu_sbi_sta.c                   |  10 +-
 arch/x86/include/asm/kvm_host.h                 |   1 -
 arch/x86/kvm/Kconfig                            |   1 +
 arch/x86/kvm/x86.c                              |   5 +-
 include/linux/kvm_host.h                        |   4 +
 tools/testing/selftests/kvm/Makefile.kvm        |   2 +
 .../selftests/kvm/steal_time_change_pid.c       | 216 +++++++++++++++++++
 virt/kvm/Kconfig                                |   3 +
 virt/kvm/kvm_main.c                             |   4 +
 18 files changed, 248 insertions(+), 20 deletions(-)

base-commit: 8ab1afb2eb246ab15b301cd255b5943d208a93c1

Thank you very much!

Dongli Zhang


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
