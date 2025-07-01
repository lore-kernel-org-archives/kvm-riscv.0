Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F84EC7EE30
	for <kvm-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKVxlj4/INb1asIl9DomWdGifUcEu9xDWKgq25QjfjA=; b=TtHfGuHhViU9G3
	r1dFQBWD+H3pJSRKk0B1vKXnhiwoCJBw5z5P9KBH+yJhFpOj+2bRL9KH7dL1Cq+U0eA5lcqsiKsrt
	lADXSPhn4T7wz8LrppJ7jxk5bhlZ54aSCuCpV7ORzj/8QdnuoGhmxZcm6P8qk6hF1fiPz0ICNHKE7
	3FopJpbydgtXAcjKUyWxXCjRWxfn3fAAJCYUWLJiJExPcITQDPddcRc2nptDKEMM5CFvEfNe2OIol
	8HWmPzP7t83D4fBolvN/uDlRPXPbRQKbZEL0PPg2RkGHHryKSrkk+mdIttTp48S92qQMPbk9dBKVc
	/7dDrEhcNo5hIGTTmKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjg-00000004UXy-16Vd;
	Tue, 01 Jul 2025 08:53:04 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWcM-00000004SAM-2gEj
	for kvm-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:45:32 +0000
Date: Tue, 1 Jul 2025 10:45:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751359526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mqjZl7gOuECoDPRPbAcfIhLHBzetX6fo+UmdquAXnu8=;
	b=fB7IZGpBJowF1Eov/iy5XNSSFnVMyEMXIRtkEr2FyURw0GqzPknRl/z89pzAjL9cwY10fb
	H0e2c4Up5P8Q8zkmylO5vBBDZ9VWvnQMH1LWffWEGVgHohf8agPJIKG7d4bc2mvuuqoYpx
	szltdqXoGW4m9ei9JoW0SNM/X6xgelM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v7] riscv: sbi: Add SBI Debug Triggers
 Extension tests
Message-ID: <20250701-f714a38e3d17247534378927@orel>
References: <20250630223224.1235132-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630223224.1235132-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_014530_843303_13B2CD34 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 30, 2025 at 03:32:23PM -0700, Jesse Taube wrote:
...
> +static unsigned long gen_tdata1(enum McontrolType type, enum Tdata1Value value, enum Tdata1Mode mode)
> +{
> +	switch (type) {
> +	case SBI_DBTR_TDATA1_TYPE_MCONTROL:
> +		return gen_tdata1_mcontrol(mode, value);
> +	case SBI_DBTR_TDATA1_TYPE_MCONTROL6:
> +		return gen_tdata1_mcontrol6(mode, value);
> +	default:
> +		assert_msg(false, "Invalid mcontrol type: %lu", type);
> +	}
> +}

Please don't forget to also test with rv32. Enums have ambiguous sizes. It
appears rv64 uses a long and rv32 uses an int so this assert doesn't
compile on rv32 due to the use of the %lu format. There's not much we can
do here other than specify the enum type with the

'enum <name> : <type> {...}'

syntax, but that's a C23 feature, so I think it's better to just cast.
I've done

  assert_msg(false, "Invalid mcontrol type: %u", (int)type);

to resolve that.

But, the tests also hang when running with rv32. I haven't tried to debug
yet.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
