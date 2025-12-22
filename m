Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A9E67497
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+az+fCSlw19WW2Mizd8Sqgsh+ILay1GsPVn2miPACk=; b=HQRGiczu5sg2qq
	jJpigI2TL5gq4MrGDhgEaAKF2oEZwH3hI3SB/Sjax6wTPdfMqfOYZIQjFFu0FD4YYZkgpAFz+OhKj
	b25nkNXS4mGCUDe9RJ3gvpvb4KDRkGfIpdO9U+Mmo6j3+e+cXeeseLTpTT7qLlR2MdIYH8LLiCkM5
	YvSbM/Jx/2uEh7NAveKlVwlk2t5o8/nTQA2zqwOf6/EfU+7MENFv7jWZApCQtYUBS5AVhNLdYo4TW
	GvJybTA4ymG5UWt2XtcQtQnWqdtRCSK/AXPKWX085mpQPvJLI+pshxxb2VTfdn+NH2GdL4kx7qxx8
	+PD7eSTNCiRA5lJK/8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkJU-0000000E32u-0wkI;
	Mon, 22 Dec 2025 18:07:20 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkJS-0000000E31Y-1Pc9
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 18:07:19 +0000
Date: Mon, 22 Dec 2025 12:06:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766426825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIJ8qnnIn2fAU6lPdevesO7Rmp1csv0a8O5Oc90bx5Y=;
	b=v1H1biNDta8dBMhI6O/Lwni5MPUVNHO+eWiAh/FLiesVXT5NfJuW+moKjnH5LB+Hjcq1Ke
	cw/u755wlQsSv3+bRbviueiK6b1nj5+bJPE7d5sYKofjrS39wMquqoe4lteCj85/QGJJlB
	qs3oNq8NtL/n60dE5F2pqYCaJw0Phow=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	will@kernel.org, pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org
Subject: Re: [PATCH v2 3/5] KVM: riscv: selftests: Fix incorrect rounding in
 page_align()
Message-ID: <20251222-67bdefbbd6f1687ffbcabf81@orel>
References: <20251215165155.3451819-1-tabba@google.com>
 <20251215165155.3451819-4-tabba@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215165155.3451819-4-tabba@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_100718_522841_AD4A9AD8 
X-CRM114-Status: GOOD (  16.44  )
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

On Mon, Dec 15, 2025 at 04:51:53PM +0000, Fuad Tabba wrote:
> The implementation of `page_align()` in `processor.c` calculates
> alignment incorrectly for values that are already aligned. Specifically,
> `(v + vm->page_size) & ~(vm->page_size - 1)` aligns to the *next* page
> boundary even if `v` is already page-aligned, potentially wasting a page
> of memory.
> 
> Fix the calculation to use standard alignment logic: `(v + vm->page_size
> - 1) & ~(vm->page_size - 1)`.
> 
> Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V 64-bit")
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index 2eac7d4b59e9..d5e8747b5e69 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -28,7 +28,7 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
>  
>  static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
>  {
> -	return (v + vm->page_size) & ~(vm->page_size - 1);
> +	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
>  }
>  
>  static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
> -- 
> 2.52.0.239.gd5f0c6e74e-goog

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
