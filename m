Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63B2FA3753
	for <kvm-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnjVr6fZrpufR4YM7B8L8TVzQYCURYyZlWjUu0xAnIM=; b=bEVzc48ZFpI4A/
	cZ070pzU3XAzwfJoNjcLkzpfskwFOoXmsfX0fjjo0dsevsW6ROWpOwdSY2hkP/fFeDOvMg7Pw7h55
	gaAV2ubBMmffeFkMuGh9KQ7MvT2WVv0QGtvDjO5q5gGArz6ayCuPVQgcPp4rhFxZg0dhD0QFiIAZV
	qFsMIoFtW9tJZ3A0Qz+bkY1zOsPa5q0nah5n5JIwWqV2G9jSpAqLh8lYuwQIywVS3eZzWuHapPY43
	EPj8YyJ5G1ykfTjMil5vG33d0M1NCcHc2d0t69dFIUUbqsN/c5H91Hhfk7qXVmWCX34PQtVbaf90l
	7oI5EIo9yrhwGh1USrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbifc-00000008YKP-25zj;
	Fri, 02 Jan 2026 17:10:36 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbifZ-00000008YIt-3PiW
	for kvm-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 17:10:35 +0000
Date: Fri, 2 Jan 2026 17:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767373830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jVV1USKSvlkP8yy4xlBDNM9RAl76sphsQ5V9uMR2oHg=;
	b=vlCdmtgtMIxaW81mMsur8wK/rEEgTOOUMtcLgWwmSxP2Vz2CcZrG+LS6zCMrp/P+tNdJTE
	iGgy3y57Mq466D17AOcEx4V3De3b/l2hps5vWyXQR1/kwsCDp7Y1b4lZAL6WG50pw11vso
	zHin2v43gjeOeTH++RQGXFpV0FNDJ7c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 20/21] KVM: selftests: Rename
 vm_get_page_table_entry() to vm_get_pte()
Message-ID: <txx7pwn52hbd5oen56famqzwtauxdiwuw7ulrq3jiqr3t5dy6d@pxwlz2tkjswo>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-21-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230230150.4150236-21-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_091034_068933_BE3F1EF4 
X-CRM114-Status: GOOD (  16.33  )
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

On Tue, Dec 30, 2025 at 03:01:49PM -0800, Sean Christopherson wrote:
> Shorten the API to get a PTE as the "PTE" acronym is ubiquitous, and the
> "page table entry" makes it unnecessarily difficult to quickly understand
> what callers are doing.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

> ---
>  tools/testing/selftests/kvm/include/x86/processor.h           | 2 +-
>  tools/testing/selftests/kvm/lib/x86/processor.c               | 2 +-
>  tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c            | 2 +-
>  .../selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c     | 4 +---
>  4 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
> index 7b7d962244d6..ab29b1c7ed2d 100644
> --- a/tools/testing/selftests/kvm/include/x86/processor.h
> +++ b/tools/testing/selftests/kvm/include/x86/processor.h
> @@ -1357,7 +1357,7 @@ static inline bool kvm_is_ignore_msrs(void)
>  	return get_kvm_param_bool("ignore_msrs");
>  }
>  
> -uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr);
> +uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr);
>  
>  uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
>  		       uint64_t a3);
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index 5a3385d48902..ab869a98bbdc 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -390,7 +390,7 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
>  	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
>  }
>  
> -uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
> +uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
>  {
>  	int level = PG_LEVEL_4K;
>  
> diff --git a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> index a3b7ce155981..c542cc4762b1 100644
> --- a/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> +++ b/tools/testing/selftests/kvm/x86/hyperv_tlb_flush.c
> @@ -619,7 +619,7 @@ int main(int argc, char *argv[])
>  	 */
>  	gva = vm_vaddr_unused_gap(vm, NTEST_PAGES * PAGE_SIZE, KVM_UTIL_MIN_VADDR);
>  	for (i = 0; i < NTEST_PAGES; i++) {
> -		pte = vm_get_page_table_entry(vm, data->test_pages + i * PAGE_SIZE);
> +		pte = vm_get_pte(vm, data->test_pages + i * PAGE_SIZE);
>  		gpa = addr_hva2gpa(vm, pte);
>  		virt_pg_map(vm, gva + PAGE_SIZE * i, gpa & PAGE_MASK);
>  		data->test_pages_pte[i] = gva + (gpa & ~PAGE_MASK);
> diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
> index fabeeaddfb3a..0e8aec568010 100644
> --- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
> +++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
> @@ -47,7 +47,6 @@ int main(int argc, char *argv[])
>  	struct kvm_vcpu *vcpu;
>  	struct kvm_vm *vm;
>  	struct ucall uc;
> -	uint64_t *pte;
>  	uint64_t *hva;
>  	uint64_t gpa;
>  	int rc;
> @@ -73,8 +72,7 @@ int main(int argc, char *argv[])
>  	hva = addr_gpa2hva(vm, MEM_REGION_GPA);
>  	memset(hva, 0, PAGE_SIZE);
>  
> -	pte = vm_get_page_table_entry(vm, MEM_REGION_GVA);
> -	*pte |= BIT_ULL(MAXPHYADDR);
> +	*vm_get_pte(vm, MEM_REGION_GVA) |= BIT_ULL(MAXPHYADDR);
>  
>  	vcpu_run(vcpu);
>  
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
