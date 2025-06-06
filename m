Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25762C5AD49
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 08:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSmwJpkSe2EdStyKDTUacyV+mKurBEXDyWvY6ooV2Co=; b=KodvJBvxQtSmnl
	xj5B/e6pdkID35nnOzLfrS1RZWbpZZQsqTtiqX86Y9eZLss1K9Lv94ZGS22Y8A+sewbeYpTU2KfEC
	f4czBQM8i9mPTBobo1rYisG32ZwiixN6RySxrsTqpPpF1BuB3YCBX8MjjkXfA07t003E6UV8nMUHP
	BrcP/8b0iOCEAX4gMo9cSzTBmhp7CE/MET1YSw7B8v+M0vQsOYO/pb2RUxx79ssizkpwGqqbxed2t
	de4bqvP6F2lUb7OzIjnfub6A6nXu1P46dNHObIEi2O9B3TgMRN4NZDVPj8Kvbui2O5iF/21PdashN
	rlLyH/kYYST7XFaBnNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSbA-0000000HQXK-2cDN;
	Fri, 06 Jun 2025 08:38:48 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSV5-0000000HPu8-0PGA
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 08:32:33 +0000
Date: Fri, 6 Jun 2025 10:32:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749198746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0rjnQ5h06Wz4/Zf1hGvZjWlBwp2Qnw/DkUpb5h4A7oE=;
	b=NjqVhN+dZVzSxuBLk3run4PObbEVNl1Iw0rPv+HzYy9qcJ5Pjc/MNaf13ZNPI4zlS+8LPp
	ZMJOXfMZdaD4H7McYYSNoXMSzf9Lqf0EpF5xgqsElSgtogzW10NORVlbeFe/HA7Cs6yStN
	z+M4H84O26vYwfLlQDxe6GDB1sCdfpY=
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
Message-ID: <20250606-cbdb324240e2de802f08d32c@orel>
References: <20250605161806.1206850-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250605161806.1206850-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_013231_902099_815EB0A6 
X-CRM114-Status: GOOD (  13.71  )
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

handling

often

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
>

I've fixed the two typos while applying to riscv/sbi[1]

[1] https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
