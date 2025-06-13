Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA2C7114A
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8Xsn7eTCTce7FnQqv2ao1stRxSl8AjfuCDKkEA4pqY=; b=pyzIfwMf323okJ
	BR79l9LvTL6N0FFaLC1t6u0Krky/3mPnViKijoLpsq2zj4nGSp8619B7AuUwHoHGJyS70mtbBzpQR
	b0mzXtYcDgmysCtyiPpD1IIlNTs/wVjTIfICmvocNOEdlY4HAX70tCXr0TydifjEwOCSamjyDnIJa
	bXmNBWeaFiKBrSgF4XEKUYZaHtukkfDSx0pFXHlPXwdgRe7oRbOAa6HI11Yq8JBz3OvNluaAV8JEe
	Svr/GBjwEVy848UxkvAit3XentdwVeSYT3+u3qfRnoGDSieR2aAY8k3u75v7PNmb/qD5VLG3FXkdA
	UzUA2JTez3YN+1SjxwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yP-0000000HHbG-0i3D;
	Fri, 13 Jun 2025 18:17:53 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7GU-0000000H3Hn-0NMy
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 16:28:27 +0000
Date: Fri, 13 Jun 2025 18:27:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749832093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gwJb0imNaDB4wZxKL2FWvnsxmxhY/MZ4QeoknxKLKUM=;
	b=L3fLw5q6e7Y2Vm6lBu+gtX2N6Z1Yoi6IJQZL2yjNDwbGm3nZzmJTlYZp724rNI6/UhYZ28
	kjbPUF0nf6bZCnD+svYbhJ7v6aaunpU3lhk4yZHDMMkSpNCvJMbqbMSq8KBHR0iFlVMk32
	6ubBPziJd9SGxVB47zh992wG19nDKQ0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v2] riscv: Allow SBI_CONSOLE with no uart
 in device tree
Message-ID: <20250613-8809c9eccfc2000c01f298e1@orel>
References: <20250613150313.2042132-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613150313.2042132-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_092826_271885_9414179F 
X-CRM114-Status: GOOD (  10.03  )
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

On Fri, Jun 13, 2025 at 08:03:13AM -0700, Jesse Taube wrote:
> When CONFIG_SBI_CONSOLE is enabled and there is no uart defined in the
> device tree kvm-unit-tests fails to start.
> 
> Only abort when uart is not found in device tree if SBI_CONSOLE is false
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/io.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>

Applied to riscv/sbi

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
