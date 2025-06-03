Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50928C5AE59
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 08:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8x6u04goa9i8DUc5CnNdNEKoN5Kh7jf6mD1EBXRkxo=; b=pmQ8Fhv6uzwILL
	sLgDOOWt+IDHd9PBGAFaZeDQSdwEAvdFD/KTxYZtzaeSjCwTIm1O5TDJjjJH1fExpBJ0MsEl2z/TL
	tOcdY3U37TDlKHCFoFORT4kd/KevTMm2k3zCsDRjVnDo229h7zQunsb2TWhZwbY5Z0XORq3OqF+JA
	XJl/omctGiuA8xyHnZrLQiWge4s7XCs4DeGVAYPSiKdXRlbqxJ5kmSzkFmkfkM/cNKxMzPlrYxNOl
	TUM3FJ4TW8+vC70/TIZlpw8TA+FhCkO4rMQLSlCMq/S2WUz8/kka7/hSq8LjhuUPk9Jf+nBBMFJ+z
	SNmPzKQnnV6JsWkKTSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMpM-0000000AIa2-07wn;
	Tue, 03 Jun 2025 08:16:56 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMpI-0000000AIXv-39ji
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 08:16:54 +0000
Date: Tue, 3 Jun 2025 10:16:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748938609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNu9yHF7auUvXoWOpFS6qTulI5/Yj43ibbQxcPI7DNw=;
	b=t5Cj4ccmuVAlZjMTFw0n9sHOVggbuDWL+eiJ29H2Y4KaBpQa2Q9euqJi5hMAfnLqSbLCdm
	Nkrr3rHBB6FCI9cFe2OeM04bymQzGKM208lLF9tDmXT+nhiE+Jei4Digt1bjzDsnG9GmgK
	KqYs9fOr+Mg7AoFK77XD5P1bUQoy5KU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [PATCH 2/3] lib/riscv: clear SDT when entering exception handling
Message-ID: <20250603-8e4c2aa217e6be3b3ee43972@orel>
References: <20250523075341.1355755-1-cleger@rivosinc.com>
 <20250523075341.1355755-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250523075341.1355755-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_011653_385713_A29CFF78 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 23, 2025 at 09:53:09AM +0200, Cl=E9ment L=E9ger wrote:
> In order to avoid taking double trap once we have entered a trap and
> saved everything, clear SDT at the end of entry. This is not exactly
> required when double trap is disabled (probably most of the time), but
> that's not harmful.

Hmm... I wonder if this shouldn't be left to the handlers. Maybe
we should just provide a couple helpers in processor.h, such as

local_dlbtrp_enable()
local_dlbtrp_disable()

If we do need to manage this at save_context time, then I have
a couple comments below

> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/cstart.S | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/riscv/cstart.S b/riscv/cstart.S
> index 575f929b..a86f97f0 100644
> --- a/riscv/cstart.S
> +++ b/riscv/cstart.S
> @@ -212,14 +212,15 @@ secondary_entry:
>  	REG_S	t6, PT_T6(a0)			// x31
>  	csrr	a1, CSR_SEPC
>  	REG_S	a1, PT_EPC(a0)
> -	csrr	a1, CSR_SSTATUS
> -	REG_S	a1, PT_STATUS(a0)
>  	csrr	a1, CSR_STVAL
>  	REG_S	a1, PT_BADADDR(a0)
>  	csrr	a1, CSR_SCAUSE
>  	REG_S	a1, PT_CAUSE(a0)
>  	REG_L	a1, PT_ORIG_A0(a0)
>  	REG_S	a1, PT_A0(a0)
> +	li t0, 	SR_SDT
          ^    ^ should not be a tab
          ^ should be tabs

SR_SDT isn't defined until the next patch so this breaks compiling at this
point, which could break bisection. You can do a quick check of a series
for this with

 git rebase -i -x 'make' <base>

> +	csrrc 	a1, CSR_SSTATUS, t0
> +	REG_S	a1, PT_STATUS(a0)
>  .endm
>  =

>  /*
> @@ -227,6 +228,8 @@ secondary_entry:
>   * Also restores a0.
>   */
>  .macro restore_context
> +	REG_L	a1, PT_STATUS(a0)
> +	csrw	CSR_SSTATUS, a1
>  	REG_L	ra, PT_RA(a0)			// x1
>  	REG_L	sp, PT_SP(a0)			// x2
>  	REG_L	gp, PT_GP(a0)			// x3
> @@ -260,8 +263,6 @@ secondary_entry:
>  	REG_L	t6, PT_T6(a0)			// x31
>  	REG_L	a1, PT_EPC(a0)
>  	csrw	CSR_SEPC, a1
> -	REG_L	a1, PT_STATUS(a0)
> -	csrw	CSR_SSTATUS, a1
>  	REG_L	a1, PT_BADADDR(a0)
>  	csrw	CSR_STVAL, a1
>  	REG_L	a1, PT_CAUSE(a0)
> -- =

> 2.49.0
>

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
