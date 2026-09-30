Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366E1CA5FBA
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpnZ1vOcOGOJgYgDs7h1BgDu9OtAkYdcWQtayLuaXPs=; b=fGTPhhcP86sBzC
	SBtKpsc+1s9S5aRIAJyscVxTY5XLOwaF759lbgqtlKTGGhMRjm/cAMwQ/4pCaLrlZXGU3OaFFI2jj
	A4DiEuO/ClpSwqmt8nNaIS7i/aDmnNBYz2c8blZr84BiDOo530ikHVQuROvMvvlRY24JmFRAs8q6C
	AfniBwLmZv6BmYtA9Kg0QbQzhKHrGaT4A/IlTqJntofI6C/aP/fRCNCLuWCehR9EYRMZVtzUJ1mV3
	fKc9XuHErv1QxCq1HrDQCsv8ZFLBgyPoBYOssCaGR4JOr3wr7GQ2DgFtToTYfap7zWBnGfZyiaIqW
	ltOtZ/HFInyTbOT2l8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrUS-00000005kTM-3nFv;
	Wed, 30 Sep 2026 10:24:44 +0000
Received: from out-158.mta0.migadu.com ([91.218.175.158] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrUP-00000005kSX-44Lb
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 10:24:43 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dA/QzLZGwZkE4CjgTHgVqZUnnA/WDNyS+RSiYCdTHtc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790763879; v=1; x=1791368679;
 b=T5ggMvtDY6yoIceTrJuUiuL/+EHCwhzlvJC5K+vC6LnZZn7D4iojX0zLu7ORY1bT0VCfe9yB
 iHcu2ae4GvTTMYwByy6mGpeoT98YdSLAo5espSTEaEqhVKLoWglAt2tfR5RZyAJksDHE4gg5X4a
 62aPSrVMrVDWM/xIHcRG++gA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d1a8dff05957b187;
	Wed, 30 Sep 2026 10:24:39 +0000
X-Mizu-Trace-ID: d1a8dff05957b187
X-Migadu-Flow: FLOW_OUT
Date: Wed, 30 Sep 2026 12:24:38 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 5/7] riscv: Decouple SBI console from UART
 init
Message-ID: <jshzzt3o7jdh6dum2ynv2ondsbncpumdj3ixd2riuugcldcw62@kmo6x3sf4pru>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
 <20260924033945.176581-6-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924033945.176581-6-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_032442_404255_2832092C 
X-CRM114-Status: GOOD (  14.98  )
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

On Thu, Sep 24, 2026 at 11:39:43AM +0800, Xiang W wrote:
> CONFIG_SBI_CONSOLE already routes puts() through SBI DBCN, but console
> setup still went through the UART init path. uart0_init_fdt() could skip
> a missing UART, while uart0_init_acpi() aborted, so EFI/ACPI guests
> with no described UART could not print.
> 
> Split the SBI console out of the UART driver. When CONFIG_SBI_CONSOLE is
> set, io_init() is a no-op and puts() issues SBI_EXT_DBCN_CONSOLE_WRITE
> directly. The UART probe and MMIO path are compiled only when SBI
> console is disabled, so ACPI and DT boots no longer depend on an MMIO
> UART for output.

It seems like we should have an SBI console fallback to a UART, since
the purpose of these tests are currently mainly to test SBI. Note, at
least ACPI systems that conform to the server platform spec must have
a UART.

> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  lib/riscv/io.c | 50 +++++++++++++++++++++-----------------------------
>  1 file changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/lib/riscv/io.c b/lib/riscv/io.c
> index b1163404..6656cd32 100644
> --- a/lib/riscv/io.c
> +++ b/lib/riscv/io.c
> @@ -14,6 +14,26 @@
>  #include <asm/setup.h>
>  #include <asm/spinlock.h>
>  
> +static struct spinlock uart_lock;

In any case, we should probably rename this to console_lock.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
