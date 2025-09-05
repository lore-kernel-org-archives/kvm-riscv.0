Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5890BCA101F
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 19:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUcgod/923dbAa5HrCLqH5q8IejgMG7O3iFzhX6ITfY=; b=h+R3UQSGE87v68
	uqBjj++aP8j7ErIVZNsxYCfnTtwrQLr96wwWLUZ9GzKSFDh3Gg+FIKO1wReIK8DYfqQvHJdpcmcjO
	AM1ov2k899S4U2Rf1fayL7pPfV76vlg3RuGMnBS06NgG7/t9hmrROgcmQzSFpTTNTwFw0fh6cUIVK
	m+uAG6iFm3IjUYERSLJ3mKpDwxMbZgjsyk0dOoF79hHrhuUym9k/kRuHN130HP8BzC9M/ippNkXkN
	ZO0PMqUhYVgwZ0vMmRohZV7aR4Ql7bAtbApWZo39stNMf8Vadi9EKiNuoayqbtKfKaFhxELzGHhVy
	xRmKFNTIsAH8Cwngd4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc87-000000049kG-0Vu2;
	Fri, 05 Sep 2025 19:29:51 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYV9-00000002o9r-3rMU
	for kvm-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 15:37:25 +0000
Date: Fri, 5 Sep 2025 10:37:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757086640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ETAM66Q+hJPcZ8YCurkC+M3/4MnFMg3ZUW80LlIhKRo=;
	b=vHv3UPWCl43hGRE7WJEvb1TOfTXwuhj1roL1X9U2ytcEf9oc6RGJS45dDZZZw73flvKQXx
	T274D1IS9swbD/CQEDX9RdQtJ+e0Pl3mpADb2D8298LNGxhPlNtd2JnvBwNElRJArdWAsg
	VAziBKrtxkvwz77GfhuSMTrCbYrun+M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org, npiggin@gmail.com, joel@jms.id.au
Subject: Re: [kvm-unit-tests PATCH] riscv: Fix sbi-deps =?utf-8?Q?expansio?=
 =?utf-8?Q?n_for_older_GNU_Make=C2=A0?=
Message-ID: <20250905-947146894bc614df37a82dfb@orel>
References: <202509050748.5857mUY1083256@mse-fl1.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202509050748.5857mUY1083256@mse-fl1.zte.com.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_083724_111738_E7BBCAC1 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Sep 05, 2025 at 03:43:12PM +0800, wu.fei9@sanechips.com.cn wrote:
> From b8b66e40566bb89de57e45b08fc72446b26a7bfb Mon Sep 17 00:00:00 2001
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> Date: Fri, 5 Sep 2025 14:31:48 +0800
> Subject: [PATCH] riscv: Fix sbi-deps expansion for older GNU Make
> 
> The prerequisite $$($$*-deps) cannot be expanded to $(TEST_DIR)/sbi-deps
> in 4.2.1 Make, rename it to sbi-deps without the prefix path.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> ---
>  riscv/Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Hi Wu Fei,

It looks like you ran into and fixed the same thing as some others. Take a
look at this patch and thread here [1]. I think Nicholas' solution is more
complete since it includes the notdir. However, assuming your solution
works, it makes me wonder why it's not necessary?

[1] https://lore.kernel.org/all/csh2fzymze636erajmsu5d55id6fpfsnvypkz3at7anp5i35uw@fhn2qgz327vj/

Thanks,
drew

> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index beaeaefa..372c56b3 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)
> 
>  all: $(tests)
> 
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
> +sbi-deps += $(TEST_DIR)/sbi-asm.o
> +sbi-deps += $(TEST_DIR)/sbi-dbtr.o
> +sbi-deps += $(TEST_DIR)/sbi-fwft.o
> +sbi-deps += $(TEST_DIR)/sbi-sse.o
> 
> -all_deps += $($(TEST_DIR)/sbi-deps)
> +all_deps += $(sbi-deps)
> 
>  # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
>  $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
> --
> 2.43.0
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
