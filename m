Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862FBC5CFC1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7M8U2SL6P5ej9jAdlc4W8oFsqrUdjrwRG/pWPMeZvI=; b=IgD8ZCdowk2LnB
	PrRKtpgGnRUNb7D1cSCmrSXAtARM6OArPKYQ6zgKa5n8CZcOhgg0leinFFq2f1U3bp2/7A74FUdNp
	s8bafOWoX6u+cIkLx2V5V9nBnSy3503oBTAtejQo7Ywskj1Kh5oDrg4O2Gr06z7S0FgzUYDroRruY
	cAWnMXYYMll4xOyV7gjIEyXc6164pkZqJPSBimHCANJx90MelVInfyghOYezSabOt8ZSC48yNPtCf
	Vps3PQWz9QELToONSafZT2Ot0fwTGyDDnkQBs+O/127V/LSt9+fvX9TXk5x8ilo13e1MEIJwkt2V8
	0BV5qD/e5SR7fwEdVL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqMB-00000002bn8-0r7E;
	Fri, 14 Aug 2026 11:45:51 +0000
Received: from out-217.mta0.migadu.com ([2001:41d0:1004:224b::d9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqM6-00000002bkZ-2TwW
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 11:45:48 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=NElRwhKXJKskKs7L0lwTCSgGuGKP1HD6hmKGJ40v/N0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786707944; v=1; x=1787312744;
 b=xafZQnBQR1x0qDvz3HAeHSg2DpGUqrT/Na90RmUeavm23/BteqNQVO8BaH8hI72fRIy8VN4+
 880H8sHFywrbHmDUzrppZgBB8LIDoqGwOB5BFluRMR8xw0scg+9h90f8eGFq8wGZfxivhz3lgLp
 DSHodBuuiZdmgz/JZxmgeH/4=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 7749c2dafb5b1cfd;
	Fri, 14 Aug 2026 11:45:43 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v3 1/3] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
Date: Fri, 14 Aug 2026 07:45:05 -0400
Message-ID: <20260814114507.583424-2-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814114507.583424-1-jinyu.tang@linux.dev>
References: <20260814114507.583424-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_044547_044791_6D52A91E 
X-CRM114-Status: GOOD (  12.94  )
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

The generic KVM_PRE_FAULT_MEMORY ioctl lets userspace populate KVM page
tables before running a vCPU over a GPA range. x86 already supports the
ioctl, but RISC-V does not expose the capability and has no arch hook.

Add the RISC-V arch hook and reuse the existing G-stage fault mapping
path with a read access. Report progress using the G-stage mapping
returned by the map path, so the ioctl can advance by the actual leaf
size that covers the requested GPA. Retry until a mapping is installed
or a signal, VM-dead request, or real error is observed.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
v2 -> v3:
- Retry internally when the map path returns success without a visible
  G-stage mapping, instead of exposing -EAGAIN.  (Sashiko)

 arch/riscv/kvm/Kconfig  |  1 +
 arch/riscv/kvm/gstage.c |  3 +++
 arch/riscv/kvm/mmu.c    | 42 +++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c     |  1 +
 4 files changed, 47 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..8ac209e8ac87 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -28,6 +28,7 @@ config KVM
 	select KVM_COMMON
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
+	select KVM_GENERIC_PRE_FAULT_MEMORY
 	select KVM_MMIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index e5002cb9cbef..6bd8b8fd6ceb 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -280,6 +280,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 						    out_map->level, true);
 		} else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(ptep_get(ptep))), page_size) == hpa) {
 			kvm_riscv_gstage_update_pte_prot(gstage, ptep_level, gpa, ptep, prot);
+			out_map->addr = ALIGN_DOWN(gpa, page_size);
+			out_map->level = ptep_level;
+			out_map->pte = ptep_get(ptep);
 			return 0;
 		}
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 6035b5ec9503..33d4ba406b0d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -748,6 +748,48 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	return ret;
 }
 
+long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
+				    struct kvm_pre_fault_memory *range)
+{
+	struct kvm_gstage_mapping out_map = { 0 };
+	struct kvm_memory_slot *memslot;
+	unsigned long map_size;
+	unsigned long hva;
+	gpa_t end;
+	gfn_t gfn;
+	int ret;
+
+	gfn = gpa_to_gfn(range->gpa);
+	memslot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	hva = gfn_to_hva_memslot_prot(memslot, gfn, NULL);
+	if (kvm_is_error_hva(hva))
+		return -ENOENT;
+
+	for (;;) {
+		if (signal_pending(current))
+			return -EINTR;
+
+		if (kvm_check_request(KVM_REQ_VM_DEAD, vcpu))
+			return -EIO;
+
+		cond_resched();
+		ret = kvm_riscv_mmu_map(vcpu, memslot, range->gpa, hva, false, &out_map);
+		if (ret)
+			return ret;
+
+		if (pte_val(out_map.pte))
+			break;
+	}
+
+	map_size = PAGE_SIZE << (out_map.level * kvm_riscv_gstage_index_bits);
+	end = ALIGN_DOWN(range->gpa, map_size) + map_size;
+
+	return min_t(u64, range->size, end - range->gpa);
+}
+
 int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 {
 	struct page *pgd_page;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..58500a19b33b 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -187,6 +187,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
 	case KVM_CAP_SET_GUEST_DEBUG:
+	case KVM_CAP_PRE_FAULT_MEMORY:
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
