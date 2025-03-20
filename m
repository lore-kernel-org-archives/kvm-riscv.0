Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46579C28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ba1VUZ8uUX0Xd4+KVhj2fDx8Cdv72Na4AgKxJQ3uj88=; b=2thLdWJvya2ry/
	W6koy5Xt0iBwpzqImhKsmMtTCa54dvAcOnHmhVQKRlhOgxZ2T6N/7y89X1y1+7nCW7nuhClAMf/2k
	rotA/fmTwByN81XcdaAf48VtNKQ4ENm79QOBJ17y3LHrfVRhpk2HKY7xOlvyIvn6aFKmhThUPITKA
	LxSxHEbmFW97QKwePZwXBFGJNB3KP+d6hZ9/AkSEmeQKify6eH6u1+lFWN2REhRtJ66vW1EqNRoB1
	r6cdEYr6CvCr/Ft30BIyFgIVLMQHoLnrpB2RsA0uRAY/oliVMhqMbQ2sfWN3SKiz9+FysSnAPqbC1
	aBr1OA/RIOQxrM+c0Obg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGqb-0000000CNcW-3CMp;
	Thu, 20 Mar 2025 14:26:13 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGqZ-0000000CNbD-0yfB
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 14:26:13 +0000
Date: Thu, 20 Mar 2025 15:26:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742480768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1vIGjxknwM537IifUr2X0NSBS/rX0+3PO3qnwvc2F18=;
	b=h9GqdfP5hD5JkPgCVa1bfkgttRGygdTq94Hi2T1nZrPZZjLKtgV4QPtt7EQgDolLsSUtzI
	0kBuYehTMM0TU8FNssKLM0ylYHSSsvmtLJ21T8EUCCRy89dyQwk10tS016id/CpCRxE3m0
	ZS+S3NKhdlskFjSZawChW57AuS0M+rc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, cleger@rivosinc.com
Subject: Re: [kvm-unit-tests PATCH] riscv: sbi: Add no target ipi test
Message-ID: <20250320-9bc7b1199845e3679cac3792@orel>
References: <20250317120814.35241-2-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317120814.35241-2-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_072611_551235_ECFFD3EF 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, Mar 17, 2025 at 01:08:15PM +0100, Andrew Jones wrote:
> While an hmask of zero without an hbase of -1 (which would mean
> broadcast) is pointless, since nothing is targeted, the spec
> doesn't say it should return an error. Maybe it should? Anyway,
> for now, just confirm that it "works".
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  riscv/sbi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/riscv/sbi.c b/riscv/sbi.c
> index 219f7187acf3..16d918d00848 100644
> --- a/riscv/sbi.c
> +++ b/riscv/sbi.c
> @@ -507,6 +507,10 @@ end_two:
>  			max_hartid = cpus[cpu].hartid;
>  	}
>  
> +	/* Test no targets */
> +	ret = sbi_send_ipi(0, 0);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "no targets");
> +
>  	/* Try the next higher hartid than the max */
>  	ret = sbi_send_ipi(2, max_hartid);
>  	report_kfail(true, ret.error == SBI_ERR_INVALID_PARAM, "hart_mask got expected error (%ld)", ret.error);
> -- 
> 2.48.1
>

Applied to riscv/sbi[1] with the test below added too just to make sure
that a nonzero hbase with a zero hmask doesn't break things.

Thanks,
drew

	ret = sbi_send_ipi(0, 1);
	sbiret_report_error(&ret, SBI_SUCCESS, "no targets, hart_mask_base is 1");

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
