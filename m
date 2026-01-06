Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74623CEFD01
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 19:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Jg2f6SrW2/KYTVH7V/DP0gxk8PWC+oDiDsPvHB5EYfk=; b=nUG+nscSawCMP4/REJjRDjBNVW
	I11hE4Z0up3y36nJD/fYpL3RFkp0o+63bpPpUtL5z4VO4g3qPQzB1GEVg7mKY4aiB/kXhDIpmIgDb
	o+9mXQnudr4Wa0Qamz0gDaGU8CnDopdfy4Ahy07CBH3tXfPWsEeBYVgjjyF3zR3IGV+dTtaSzr98k
	ISJTFBErtB3Q+rCftgnZxmpoj+gZidsWjFs65SCP29trU4TFv27+UQQ4McoliSj+tJjFvb5DtdBeB
	WvDTtBgqghYTCgOZLNL2F5/AG6dDikEb/zSIrTzi6+rItvQKfE3UUgU6TuEVOFJhy9lzCmB9HWAZR
	CBCIvnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD16-0000000DmI4-0EGh;
	Tue, 06 Jan 2026 19:46:56 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdD13-0000000DmHH-1ZmP
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 19:46:54 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c48a76e75so2472481a91.1
        for <kvm-riscv@lists.infradead.org>; Tue, 06 Jan 2026 11:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767728811; x=1768333611; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZriMaEA+mukSvHum14D+f4jkgVLElfimaxrHlh88e8w=;
        b=pa/5o3yx/vglJa4nl4NHfKqYsHNqefsWgemyb7W8wc5RDyxYVoRpEY6Wjli88VOkQQ
         XLlC7CAcIf9BY6f8zQAb7zdAQPHZ5a2be+anHB+6rmhDd6WPLZNQYRXs5mLlpY2Ooi91
         ihsiSXb65v1jQF5GHhfoIRzSDWzmJqYWwQJ5k0OVLN5ZrCyeHQ+Ysf60fpLgFrdFC6jF
         2aQhQEUQmG2uT2rFr9qBcMjHNVDCiRBxoBnQaRp5rELSrK97AIQ9y6Q48MRHbPhrj+k7
         LQ89CMRLOI2iOg+u56eFfklD761A1vNSuI5qqTuCRDVkjFb09sMan7lmbPVEA5dp03iK
         XO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728811; x=1768333611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZriMaEA+mukSvHum14D+f4jkgVLElfimaxrHlh88e8w=;
        b=YP3OMiq387S554zphf4aO+o0cEYdeVCaP7Pthd9RmZeJQ/7RuTXT3sNJOaxiDLnSVK
         hoNz9t3oG5D04bBgvmVew63CWiUFyKy1miNeoNyCcpC/BTr4HnyG79fM7oEXhR7DuRUZ
         NyjQ1X5H965uY/2ZKztpscMa2OhAPG85vLNnEklxe+Ill3afi4TWf2XDzZctSnYoxF8B
         FiilgnnKVGOIXVN6EC6Yr/7v3/QMGsvHRjKEkTPqH5QupZS8IJDeZJbTR+KjyDvjnNJw
         IQUM8V+4mh3ZgpHzmd2FpyB0skoxF+eJNdKzSMVYhF/kxG351XsbNAHeAL4OQ7Fo04Kg
         Ta3w==
X-Forwarded-Encrypted: i=1; AJvYcCWXKqKC156I8NlhZAXy053jR3ebsUsVHHSP7EFAzuMriD078r32KfLHPU5FfH4zDbR5LUdx8PS2tDs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFOlCPhg7VSQdOUN4gY9gQrKk0qPZuMk13XwQonSk2EW1oS/zB
	1uPmHKBplpYiFKQc6XtcXAOLPP+BzX3RJL4sPoHAZKtfbnpsizsuvWvkWpmFGUO7cEP6Wp164t7
	EU2xFCA==
X-Google-Smtp-Source: AGHT+IGZby64OMYDLsQncM6OFaUmrTDXzxVCp6nfZzSkjGTInUpS7Y2UQJcRJ5iTle12BuWLNTTKOzutkWY=
X-Received: from pjbbj19.prod.google.com ([2002:a17:90b:893:b0:34c:a40f:705a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c87:b0:34c:a35d:de16
 with SMTP id 98e67ed59e1d1-34f68c282c6mr196827a91.11.1767728811460; Tue, 06
 Jan 2026 11:46:51 -0800 (PST)
Date: Tue, 6 Jan 2026 11:46:49 -0800
In-Reply-To: <20260106092425.1529428-5-tabba@google.com>
Mime-Version: 1.0
References: <20260106092425.1529428-1-tabba@google.com> <20260106092425.1529428-5-tabba@google.com>
Message-ID: <aV1mqQtALFIUBHVM@google.com>
Subject: Re: [PATCH v3 4/5] KVM: selftests: Move page_align() to shared header
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	itaru.kitayama@fujitsu.com, andrew.jones@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_114653_410175_53DFE1C0 
X-CRM114-Status: GOOD (  16.37  )
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

On Tue, Jan 06, 2026, Fuad Tabba wrote:
> To avoid code duplication, move page_align() to the shared `kvm_util.h`
> header file.
> 
> No functional change intended.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
>  tools/testing/selftests/kvm/lib/arm64/processor.c | 5 -----
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 5 -----
>  3 files changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 81f4355ff28a..dabbe4c3b93f 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
>  	return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
>  }
>  
> +static inline uint64_t page_align(struct kvm_vm *vm, uint64_t v)

Maybe vm_page_align()?  So that it's a bit more obvious when reading call sites
that the alignment is done with respect to the guest's "base" page size, not the
host's page size.

> +{
> +	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> +}
> +
>  /*
>   * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
>   * to allow for arch-specific setup that is common to all tests, e.g. computing
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 607a4e462984..143632917766 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -21,11 +21,6 @@
>  
>  static vm_vaddr_t exception_handlers;
>  
> -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> -{
> -	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> -}
> -
>  static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
>  {
>  	unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index d5e8747b5e69..f8ff4bf938d9 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
>  	return !ret && !!value;
>  }
>  
> -static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
> -{
> -	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
> -}
> -
>  static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
>  {
>  	return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
> -- 
> 2.52.0.351.gbe84eed79e-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
