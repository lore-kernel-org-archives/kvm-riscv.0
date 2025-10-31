Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A20CCCF9FF
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 08:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdP6+l2klcVLLImz+vByxW6P+KPfOncrWisz0f5nr5o=; b=qCk4BZIOni+07A
	TPcG61iU2IF9RQ3bG2bImsFjZZohl6Dhu3Ofx3iylBDYE0YWo7gbmk2kiqs6TuJ0+zic/T4ImPxZ0
	zKvdmyPYZ+PcTWCSaJYmvY3MOfuvKY6BcZoHmZBJ1ZI1IadsqaXW2ODSbPzvZGnF2+vSGkiIRPAeR
	JLjce8lRU75mm0yqJ2k0+Wgf2JrYZ6mLgRMaWMyl6bc/9hBNbudSRkVrftFN9zCVx7XLt+sh1GdKV
	SmYxwi9f5gkOdPQ1kmujBRp6krVXqn58EWjN9WMgUAbBEf5Zx+FYiAEbLbebjsVPoXxjuYqJGs7iG
	/7DacCTxW5AOdaHLoywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkuK-00000005iLv-2Myu;
	Fri, 31 Oct 2025 08:54:52 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkuI-00000005iKk-1yBU;
	Fri, 31 Oct 2025 08:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761900890; x=1793436890;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iU1XFUVtQH6LI61M4J5u+MgZ1klxrWMInWe7hZiTFt8=;
  b=G5YBnmMSgCrQryj6BJcFYAHdqYHvybdwBHTJH5H85HHS6j1q6vPQcQjU
   bKZtD375TKFns3fXotNfY4LoW8/nwTQpzDwbY3T3p7xAOQoOHiDfuHAQ1
   WJnFUPVb/2ICEEg6YI4cOrk/tw9fGSROKn4IVFqvDkcJsMoJr/XCuxOw0
   Npwx/5QEVqGxRvJlNA7vOkey6RJPt7s3hzTgCiXw2t9yjcf5JLelaO0b7
   zMdLrXB8FlbY4/XhUp9SUnHaePookox27RUZlDRVmGIiuVMWT87bXMcIK
   Z3c6EW8AbSAGmSKzuPiYQ3gCwyEhjZfd8sYqyC7z35DFy4pVObPl/JEtk
   A==;
X-CSE-ConnectionGUID: NvwodbdWSsiRhCPQfe2vdg==
X-CSE-MsgGUID: 6DYu2/MZSqSpldkaQlQUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="51629407"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="51629407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:54:49 -0700
X-CSE-ConnectionGUID: 4Xvcl/miQfWM+8RZoCX16A==
X-CSE-MsgGUID: H6esMYuyQ0eLrmr7cZvmKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="186117901"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.240.28]) ([10.124.240.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 01:54:42 -0700
Message-ID: <91e3ca2f-2336-416a-bd37-3f6fa84d0613@linux.intel.com>
Date: Fri, 31 Oct 2025 16:54:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/28] KVM: TDX: ADD pages to the TD image while
 populating mirror EPT entries
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251030200951.3402865-1-seanjc@google.com>
 <20251030200951.3402865-17-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251030200951.3402865-17-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_015450_530222_E2C80407 
X-CRM114-Status: GOOD (  30.37  )
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



On 10/31/2025 4:09 AM, Sean Christopherson wrote:
> When populating the initial memory image for a TDX guest, ADD pages to the
> TD as part of establishing the mappings in the mirror EPT, as opposed to
> creating the mappings and then doing ADD after the fact.  Doing ADD in the
> S-EPT callbacks eliminates the need to track "premapped" pages, as the
> mirror EPT (M-EPT) and S-EPT are always synchronized, e.g. if ADD fails,
> KVM reverts to the previous M-EPT entry (guaranteed to be !PRESENT).
>
> Eliminating the hole where the M-EPT can have a mapping that doesn't exist
> in the S-EPT in turn obviates the need to handle errors that are unique to
> encountering a missing S-EPT entry (see tdx_is_sept_zap_err_due_to_premap()).
>
> Keeping the M-EPT and S-EPT synchronized also eliminates the need to check
> for unconsumed "premap" entries during tdx_td_finalize(), as there simply
> can't be any such entries.  Dropping that check in particular reduces the
> overall cognitive load, as the management of nr_premapped with respect
> to removal of S-EPT is _very_ subtle.  E.g. successful removal of an S-EPT
> entry after it completed ADD doesn't adjust nr_premapped, but it's not
> clear why that's "ok" but having half-baked entries is not (it's not truly
> "ok" in that removing pages from the image will likely prevent the guest
> from booting, but from KVM's perspective it's "ok").
>
> Doing ADD in the S-EPT path requires passing an argument via a scratch
> field, but the current approach of tracking the number of "premapped"
> pages effectively does the same.  And the "premapped" counter is much more
> dangerous, as it doesn't have a singular lock to protect its usage, since
> nr_premapped can be modified as soon as mmu_lock is dropped, at least in
> theory.  I.e. nr_premapped is guarded by slots_lock, but only for "happy"
> paths.
>
> Note, this approach was used/tried at various points in TDX development,
> but was ultimately discarded due to a desire to avoid stashing temporary
> state in kvm_tdx.  But as above, KVM ended up with such state anyways,
> and fully committing to using temporary state provides better access
> rules (100% guarded by slots_lock), and makes several edge cases flat out
> impossible.
>
> Note #2, continue to extend the measurement outside of mmu_lock, as it's
> a slow operation (typically 16 SEAMCALLs per page whose data is included
> in the measurement), and doesn't *need* to be done under mmu_lock, e.g.
> for consistency purposes.  However, MR.EXTEND isn't _that_ slow, e.g.
> ~1ms latency to measure a full page, so if it needs to be done under
> mmu_lock in the future, e.g. because KVM gains a flow that can remove
> S-EPT entries during KVM_TDX_INIT_MEM_REGION, then extending the
> measurement can also be moved into the S-EPT mapping path (again, only if
> absolutely necessary).  P.S. _If_ MR.EXTEND is moved into the S-EPT path,
> take care not to return an error up the stack if TDH_MR_EXTEND fails, as
> removing the M-EPT entry but not the S-EPT entry would result in
> inconsistent state!
>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> Reviewed-by: Kai Huang <kai.huang@intel.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

One nit below.

> ---
>   arch/x86/kvm/vmx/tdx.c | 106 ++++++++++++++---------------------------
>   arch/x86/kvm/vmx/tdx.h |   8 +++-
>   2 files changed, 43 insertions(+), 71 deletions(-)
>
[...]
> diff --git a/arch/x86/kvm/vmx/tdx.h b/arch/x86/kvm/vmx/tdx.h
> index ca39a9391db1..1b00adbbaf77 100644
> --- a/arch/x86/kvm/vmx/tdx.h
> +++ b/arch/x86/kvm/vmx/tdx.h
> @@ -36,8 +36,12 @@ struct kvm_tdx {
>   
>   	struct tdx_td td;
>   
> -	/* For KVM_TDX_INIT_MEM_REGION. */
> -	atomic64_t nr_premapped;
> +	/*
> +	 * Scratch pointer used to pass the source page to tdx_mem_page_add.
tdx_mem_page_add -> tdx_mem_page_add()

> +	 * Protected by slots_lock, and non-NULL only when mapping a private
> +	 * pfn via tdx_gmem_post_populate().
> +	 */
> +	struct page *page_add_src;
>   
>   	/*
>   	 * Prevent vCPUs from TD entry to ensure SEPT zap related SEAMCALLs do


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
