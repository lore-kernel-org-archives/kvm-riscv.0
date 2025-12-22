Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E6CE67803
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxcBy5oJAoGoX3Qpw+ETG1cciOAXd8ihNfrHqQwlABc=; b=ZQ4KioMg8qFLpa
	yhcRtzOfK782D9TF6hanK/e/olI4rAx90uTw1PG3+DlqFNt77O5NnX9cSpqz8HO1LRavQXChKgk1M
	e6dCx/EVefGNuMX8qi784qCBO6kUm2n7Gu+2hLib0iMJiYAHTDV1Q0R/d7mqJuu25GJp5IizJPEK7
	Q2BnvaZT+sIaiIVi23XtlxjvMCkOXSKuZDL37N3tZdtUp8YeVX5DDykDQ1rAbJg1g3fW1cMzHEBC4
	SyIWXohS8thlVBIGfswNyqzO8Ya1t/xwjUF4EjjtOwx4irpyaGW45l4cjx7XtCRA3/HlPlyCjmEuV
	SOvL+pbKjqpfeS9xDI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkIk-0000000E2uL-11jE;
	Mon, 22 Dec 2025 18:06:34 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkIh-0000000E2tT-2qJu
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 18:06:33 +0000
Date: Mon, 22 Dec 2025 12:06:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766426783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MD+k29yEgQqQtWq7yJ0+IwowUibiEOtC9WU2KKaDscU=;
	b=avw/BcKo42R+Ay4EEthtfmeZ5W8JefBuR0FojzfVz4LpGT247fjXQLe7L3LrLKsODAQ3Ao
	AvutCZfCqhp/OCF0ebVQ24Zc+1yluTlQy3ouO+TFGicMFff+odeWFMgp1+ngK91lfcm6Po
	WojIATe0n94SDnECoCuCJIYPrl9g6FE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org
Subject: Re: [PATCH v2 2/5] KVM: arm64: selftests: Fix incorrect rounding in
 page_align()
Message-ID: <20251222-f8d98d81659c01f79e16da2f@orel>
References: <20251215165155.3451819-1-tabba@google.com>
 <20251215165155.3451819-3-tabba@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215165155.3451819-3-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100632_007926_C5900A48 
X-CRM114-Status: GOOD (  17.38  )
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

On Mon, Dec 15, 2025 at 04:51:52PM +0000, Fuad Tabba wrote:
> The implementation of `page_align()` in `processor.c` calculates
> alignment incorrectly for values that are already aligned. Specifically,
> `(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
> boundary even if `v` is already page-aligned, potentially wasting a page
> of memory.
> 
> Fix the calculation to use standard alignment logic: `(v + vm->page_size
> - 1) & ~(vm->page_size - 1)`.
> 
> Fixes: 7a6629ef746d ("kvm: selftests: add virt mem support for aarch64")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/lib/arm64/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 5b379da8cb90..607a4e462984 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -23,7 +23,7 @@ static vm_vaddr_t exception_handlers;
>  
>  static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>  {
> -	return (v + vm->page_size) & ~(vm->page_size - 1);
> +	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
>  }
>  
>  static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
> -- 
> 2.52.0.239.gd5f0c6e74e-goog
> 
>

Thanks for finding and fixing this. I'll get my paper bag out later.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
