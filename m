Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3D7C5AD7B
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBvbfHQ25IsPQ9gESOn5m92ge7oBsMyWxSGu64r/Tjg=; b=nNA5WG8KYqbJXe
	nMJcnoqfO+cIpwnmJjqZ4s9xfHLOeJB2nQ2A4+BndA8loJiETcpcmaoU0KakJAiE7vF9TUs+2Y0sO
	+xIpqcrjHe9JofziFjdfqa8oszOrSR6Iz3GZvWVhnZyZwMGVNZhg1JlNyifJy7gvuc7zti+wm3wRx
	faROvVz0MUtYMMEMa/qplrFIW8E/5sJ4biZFh8C9giUcgRsKl74sb/nXh1TE8EzuhE2CFsBWbNm4e
	Ahj+3Y43329Hl+srUg6Za4cjX6BfqZ8r6S2NlI4cepaPSqcDMdWpglawVB06qWULFfQ8/hvf4KSSW
	u/dtUY1l7wVn3SfWA3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZk-0000000DMwl-0Hee;
	Tue, 11 Aug 2026 06:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZg-0000000DMv8-2rAA
	for kvm-riscv@bombadil.infradead.org;
	Tue, 11 Aug 2026 06:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OUZulxlEFenT7RvZakt+p4GE/qxIk5ggsq3u1CDIY8o=; b=CJUJG43sDDkI4jDKC98uh+GOJN
	aMb8wNqzoRBucPP2i6DZNQtvCHNLQlh0f8HXwZ7VQ9uW7vQFU3uj00WaSLX6TUzOhvtBOct8GAIFN
	LUITxDmN3xcElb2vU0a99NU31uM1c/KA9DidT1uRIN7EH4Zlo1mELARoqgIkIK0w3ZBdFBb9XeCr/
	Dh3FY9J6CKRFyk0OXzA0DgC037dbztMSe6rbhcRXGWhMpWPRihSFnwYGcHCJIQh385HyZL/210x+i
	mdfCVNzQdM6brtWv7tWx+ydYmauO4P9GaAnfJ6Cil0s1HVYfxzvTYF9uaR/r7MmkQcziRAAIplUC6
	0CoZmiqg==;
Received: from mta1.migadu.com ([37.59.57.117] helo=out-178.mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wtfZd-0000000EL4I-0GGM
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786428170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUZulxlEFenT7RvZakt+p4GE/qxIk5ggsq3u1CDIY8o=;
	b=pltt4ir9SgvTNXLl3RctP7iMfp9rqSS4CsqaZtRka/0EOFVWPuoI2fzM9gEMBH6tQS8k1u
	O8eQxdOau6l3dPoYFv8qOcQZhnSuZ1Jz8FJwZ2GCKsrNWJuJZcJM8tFvPVfZBKwPOoiA45
	1LA85MbcZIBFjtxHbTScXVrvOeb8Cbw=
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH 1/3] KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
Date: Tue, 11 Aug 2026 14:01:32 +0800
Message-ID: <20260811060134.106973-2-jinyu.tang@linux.dev>
In-Reply-To: <20260811060134.106973-1-jinyu.tang@linux.dev>
References: <20260811060134.106973-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_070253_695480_AD11DC31 
X-CRM114-Status: GOOD (  12.02  )
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
size that covers the requested GPA.

Unlike x86, RISC-V's G-stage fault path does not return a detailed
result such as RET_PF_FIXED or RET_PF_RETRY. Treat a successful call
that does not return a visible G-stage mapping as no progress, instead
of reporting that a page was prefaulted.

Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
---
 arch/riscv/kvm/Kconfig  |  1 +
 arch/riscv/kvm/gstage.c |  3 +++
 arch/riscv/kvm/mmu.c    | 33 +++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vm.c     |  1 +
 4 files changed, 38 insertions(+)

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
index 6035b5ec9503..c96e21740c91 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -748,6 +748,39 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
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
+	ret = kvm_riscv_mmu_map(vcpu, memslot, range->gpa, hva, false, &out_map);
+	if (ret)
+		return ret;
+
+	if (!pte_val(out_map.pte))
+		return -EAGAIN;
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
