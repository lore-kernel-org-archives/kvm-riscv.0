Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5F0C83F04
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=or9FoNemnMZDlBGVgL5OjkbCBuYhZI0AlCgjm9D1eIg=; b=vMvsm7lLvmUq49
	oDa5KNix2n6/XKUWprhzTR/Kr41cumBL23N1OWV8ULTgentbAMPS0mHlPrtiQXKXEUHDMHF4gEA9O
	wofT7aWBVDKDBYmidyA1hKRP4JqfgNkKFcWDZdV5/WVI4bbZve/snklUm5PlN/G14mfahKtSGjYVV
	jrfCBIRsg4h3VdaZDavUmUscHf8UUYZ//hYu/MHkSoPY4wDBnJcCZ8unP3Zko13UdF+z69O1a0ho+
	KAT7RvjGA96Jq7xok4xrkcUDrDvv+P6koXhLbvKb5QyL/vM1SiAIEmL2bnMfjQoEQi6P5QCw7hXjI
	4lfIGuLhp9LMdRt5483w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzZJ-00000008pVP-3wm6;
	Wed, 02 Jul 2025 15:40:17 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWymG-00000008fwS-2sz9
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:49:37 +0000
Date: Wed, 2 Jul 2025 16:49:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EXYF79yZaQma0ZGqr/10BsIiL9geDUWdZiWfA4/46sw=;
	b=MbW21TvA2RNaSkB2ILsAY0vgi/O13KpDuWgLfkDUAA5EAs9JCr5kiQJ1cpCmTz/eor/j9v
	ypqr3LPjiXI5uPi1ymlv07kd/gtOA9Z0yVhlbLYO/e1lh3vhNsmxYk0+zESWo/cK1iTddG
	/w+QIZCiYa+ITFo63LT2uKgoHx2qCI0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v3 1/2] riscv: Add RV_INSN_LEN to
 processor.h
Message-ID: <20250702-6b20245edf302791a48f98e1@orel>
References: <20250605161806.1206850-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605161806.1206850-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074936_860938_9F0484FE 
X-CRM114-Status: GOOD (  12.75  )
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

On Thu, Jun 05, 2025 at 09:18:05AM -0700, Jesse Taube wrote:
> When handeling traps and faults it is offten necessary to know the size
> of the instruction at epc. Add RV_INSN_LEN to calculate the
> instruction size.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
>  lib/riscv/asm/processor.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
> index 40104272..631ce226 100644
> --- a/lib/riscv/asm/processor.h
> +++ b/lib/riscv/asm/processor.h
> @@ -7,6 +7,8 @@
>  #define EXCEPTION_CAUSE_MAX	24
>  #define INTERRUPT_CAUSE_MAX	16
>  
> +#define RV_INSN_LEN(insn)		((((insn) & 0x3) < 0x3) ? 2 : 4)
> +
>  typedef void (*exception_fn)(struct pt_regs *);
>  
>  struct thread_info {
> -- 
> 2.43.0

Merged. Thanks

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
