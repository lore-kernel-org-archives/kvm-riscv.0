Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A8DC282C8
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwdfZO2L0MvxKKEFGsVf5oKAMklus4L21pJPlBDC8Jg=; b=jX/HeeEZ8/tnbG
	KJ6l2gNvqsw5yvTfh9zrPPFDq0soGk5TOWwhZkJ7pxMgUvQafJ3uUi/zW5A8Nycse0bjLRPWXJld3
	TrwU2U/6ZeiGWcnej98w39GgvyUkJrpkGTy5Hz6spEyzy4RavMbg6JiHWrrixQRFIYO5iUBvJ+n9p
	e6whKbfq3UhpH7bLPAu/kD4lECJAjYXiRN6ojKxvtK9MJZYEEiBUcrAfkpKimmGkF1j6E5ve3gPkg
	8cMckQJX0p1mFySQvhJ909B13ev27E+57rZ39Kertt9RmJX+HphsqEs/LjPpk7WfgCx41xAyoEG9P
	vyvPyXlt+mDg0t+COhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhd-00000008UgJ-2HJ7;
	Thu, 27 Feb 2025 19:37:49 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfw2-00000007vT2-25o2
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 15:36:28 +0000
Date: Thu, 27 Feb 2025 16:36:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740670583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7K+2652/2JPqs5KtXhCAPsJQsXoPDx6afoG7BlPfQS4=;
	b=aXHmHcilHp8+1yrcDjrSBW6wUsJH3hgJ7hMiLqfOoF7R2hdCNd9sZ98XMO0HaEWykHJrNj
	tub0RKTAtgI4CD5kziXZwcCW+lbNtMKTRGPasIXVARhnFaGCUC8mtJoN28mma7uVMmyOOJ
	d0MzHaKsEs3LtgKYiplbzSyu6p/v7hE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, npiggin@gmail.com
Subject: Re: [kvm-unit-tests PATCH v7 2/6] riscv: Set .aux.o files as
 .PRECIOUS
Message-ID: <20250227-99cd90f3ad775b89fd9fc262@orel>
References: <20250214114423.1071621-1-cleger@rivosinc.com>
 <20250214114423.1071621-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250214114423.1071621-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_073627_148897_1194B234 
X-CRM114-Status: GOOD (  12.77  )
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

On Fri, Feb 14, 2025 at 12:44:15PM +0100, Cl=E9ment L=E9ger wrote:
> When compiling, we need to keep .aux.o file or they will be removed
> after the compilation which leads to dependent files to be recompiled.
> Set these files as .PRECIOUS to keep them.

There was a thread[1] about this 7 months ago or so. I've CC'ed Nicholas
to see if there were any more thoughts on how we should proceed.

[1] https://lore.kernel.org/all/20240612044234.212156-1-npiggin@gmail.com/

Thanks,
drew

> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/riscv/Makefile b/riscv/Makefile
> index 52718f3f..ae9cf02a 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -90,6 +90,7 @@ CFLAGS +=3D -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I=
 lib -I $(SRCDIR)/riscv
>  asm-offsets =3D lib/riscv/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  =

> +.PRECIOUS: %.aux.o
>  %.aux.o: $(SRCDIR)/lib/auxinfo.c
>  	$(CC) $(CFLAGS) -c -o $@ $< \
>  		-DPROGNAME=3D\"$(notdir $(@:.aux.o=3D.$(exe)))\" -DAUXFLAGS=3D$(AUXFLA=
GS)
> -- =

> 2.47.2
> =


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
