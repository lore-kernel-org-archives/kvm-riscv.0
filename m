Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C10C7EE31
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/KTV41Ev53Xo2FpB/zlSWXf722lX+/K88HwHhqHueY=; b=s7wVO03nlMtKAA
	A01QAwI6ROWuNzRJ4FaJxtDU15ilHrpyJap3CPbInxYCV+TigIB/rdJhafHx1eSDTJpaN3yejou0Q
	Kz2ZxYOgNsFat3aIn6tUkYp2RBWeftKsB+oOgxfOB3HrcnlwEL2936/33IYoGrf8G71wN3Sb1KbEL
	Sf335ULJVmadvxr2FaYpUrqdE+eFsfMghRd2HgnVzd51N3Yj+iSApWVOjdyhiZE514IOU2xXJYIeL
	5JIYgFXATy9jNMTGr+xEOsKqBGYf9UbdIUcBR9AfexNIh7MpGPanS+LrXLz7VvHLgCdeJuyUpupTE
	374q8GnnWiAYTExiROpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULmF-000000080xX-33YV;
	Wed, 25 Jun 2025 08:46:43 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUL2P-00000007tF2-31M1;
	Wed, 25 Jun 2025 07:59:23 +0000
Message-ID: <9d9316d7-7e00-4274-bd1c-9cb83fd82d32@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750838356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/oz/zGgO2lN3zqV+etyJUP5tKHg/3V30huStLqNW9k=;
	b=kZuJ4DhW42AB1uTtKIOcJmDzEI3f1DUB1nDhB7RmZtJyIpYhTJbyYeKOS66gVENcr/UcM8
	oNSuSRj0UCwzfK2urGWKsxJICw5xZK0LbYSMC0yFWQcuzaw4E4OtO9mbxkhVNeiwY6LWVg
	75ADxYh8LfI1v6hi2eejSlcLC/nYAoY=
Date: Wed, 25 Jun 2025 00:59:10 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/12] MMU related improvements for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618113532.471448-1-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_005922_276410_4B0D4E43 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 6/18/25 4:35 AM, Anup Patel wrote:
> This series primarily has various MMU improvements for KVM RISC-V
> and it also serves as a preparatory series for the upcoming nested
> virtualization support.
>
> PATCH1 to PATCH4: Few cosmetic improvements
> PATCH5 to PATCH7: TLB maintenance and SBI NACL related improvements
> PATCH8 to PATCH12: MMU related preparatory work for nested virtualization

For the entire series:

Tested-by: Atish Patra <atishp@rivosinc.com>

> These patches can also be found in the riscv_kvm_mmu_imp_v3 branch
> at: https://github.com/avpatel/linux.git
>
> Changes since v2:
>   - Rebased upon Linux-6.16-rc2 and latest riscv_kvm_queue branch
>   - Added Reviewed-by tags to appropriate patches
>
> Changes since v1:
>   - Rebased upon Linux-6.16-rc1
>   - Dropped PATCH1 and PATCH2 of v1 series since these are queued
>     as fixes for Linux-6.16
>   - Addressed Atish's comment on PATCH1 in this series
>   - Added new PATCH7 in this series
>
> Anup Patel (12):
>    RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
>    RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
>    RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
>    RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
>      KVM_REQ_TLB_FLUSH
>    RISC-V: KVM: Don't flush TLB when PTE is unchanged
>    RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
>    RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
>    RISC-V: KVM: Factor-out MMU related declarations into separate headers
>    RISC-V: KVM: Introduce struct kvm_gstage_mapping
>    RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
>    RISC-V: KVM: Factor-out g-stage page table management
>    RISC-V: KVM: Pass VMID as parameter to kvm_riscv_hfence_xyz() APIs
>
>   arch/riscv/include/asm/kvm_aia.h    |   2 +-
>   arch/riscv/include/asm/kvm_gstage.h |  72 ++++
>   arch/riscv/include/asm/kvm_host.h   | 103 +-----
>   arch/riscv/include/asm/kvm_mmu.h    |  21 ++
>   arch/riscv/include/asm/kvm_tlb.h    |  84 +++++
>   arch/riscv/include/asm/kvm_vmid.h   |  27 ++
>   arch/riscv/kvm/Makefile             |   1 +
>   arch/riscv/kvm/aia_device.c         |   6 +-
>   arch/riscv/kvm/aia_imsic.c          |  12 +-
>   arch/riscv/kvm/gstage.c             | 338 +++++++++++++++++++
>   arch/riscv/kvm/main.c               |   3 +-
>   arch/riscv/kvm/mmu.c                | 499 ++++++----------------------
>   arch/riscv/kvm/tlb.c                | 110 +++---
>   arch/riscv/kvm/vcpu.c               |  26 +-
>   arch/riscv/kvm/vcpu_exit.c          |  20 +-
>   arch/riscv/kvm/vcpu_sbi_replace.c   |  17 +-
>   arch/riscv/kvm/vcpu_sbi_v01.c       |  25 +-
>   arch/riscv/kvm/vm.c                 |   7 +-
>   arch/riscv/kvm/vmid.c               |  25 ++
>   19 files changed, 795 insertions(+), 603 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_gstage.h
>   create mode 100644 arch/riscv/include/asm/kvm_mmu.h
>   create mode 100644 arch/riscv/include/asm/kvm_tlb.h
>   create mode 100644 arch/riscv/include/asm/kvm_vmid.h
>   create mode 100644 arch/riscv/kvm/gstage.c
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
