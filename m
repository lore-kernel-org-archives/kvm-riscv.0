Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D78C8303C
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKyhAmDVRcAs5o66TMUOS1p96NGSeJ/GvjSica0MKmM=; b=YIm98auw05hFLb
	9Ja+FZ6cJOsQYWJz+2KWJa0/AegTyXy3S2bKoEDF7F9vBNdmsI/kqubMM+c9EXEv6ybxIgN44seQ2
	YbIKHbYKiTq6e9eTnE8JIaDytebk3E45lKX2ki6oEEExEMSOOpCqbs6JZEaHjPeBPxaOyBlp0fmoE
	oMNqbcwMDuBxDqXttmuG5U1E4sVgr4Iicod+8hTu9tKzsp5cgMd7iX4/cQEYQkIbQ3q79+T1CB5b3
	58pYzBVv9ocDshs4POmcjmYXtmd7bOusqdKaCZeTvhfVgBnXu+nZavoF3+/Q6QTT2if7ShTIt3EG0
	OVgH/NTsIGNaqSWYVt5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvg9-000000088kZ-0Erx;
	Wed, 02 Jul 2025 11:31:05 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuzd-00000007zlg-2x6L
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:47:12 +0000
Date: Wed, 2 Jul 2025 12:46:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751453223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGt6az+NvJ14ljwTTt5to9cmtNUkKbD4VgZIkyAJvCs=;
	b=q53ARjP+zZ09C7DsmED/JE5lQEtVYZqhbaHZ7PPf01CV+97+OnO7//+Qbc/YmT9kloXRU/
	MLSMjEUVNqRmvO6TV0VoYncC+bEMWnqkZGlZtwU3E0WhiPTtqTtsA7qIKbHJrmwLIWVC2Q
	UpubvSNopJSX4IBuMkbaLuszmCWfeDE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v8] riscv: sbi: Add SBI Debug Triggers
 Extension tests
Message-ID: <20250702-f6f3fde8cfecdb6901edfc76@orel>
References: <20250701200047.1367077-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701200047.1367077-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_034710_668467_8F3355B3 
X-CRM114-Status: UNSURE (   8.22  )
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

On Tue, Jul 01, 2025 at 01:00:47PM -0700, Jesse Taube wrote:
> +#define SBI_DBTR_TDATA1_TYPE_SHIFT		(__riscv_xlen - 4)

I just double checked and see that this shift is 4 less than xlen, so...

> +enum McontrolType {
> +	SBI_DBTR_TDATA1_TYPE_NONE =		(0UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_LEGACY =		(1UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_MCONTROL =		(2UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_ICOUNT =		(3UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_ITRIGGER =		(4UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_ETRIGGER =		(5UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_MCONTROL6 =	(6UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_TMEXTTRIGGER =	(7UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_RESERVED0 =	(8UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_RESERVED1 =	(9UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_RESERVED2 =	(10UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_RESERVED3 =	(11UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_CUSTOM0 =		(12UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_CUSTOM1 =		(13UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_CUSTOM2 =		(14UL << SBI_DBTR_TDATA1_TYPE_SHIFT),
> +	SBI_DBTR_TDATA1_TYPE_DISABLED =		(15UL << SBI_DBTR_TDATA1_TYPE_SHIFT),

...all these will require unsigned long (as the UL's provide), but that
means...

> +static unsigned long gen_tdata1(enum McontrolType type, enum Tdata1Value value, enum Tdata1Mode mode)
> +{
> +	switch (type) {
> +	case SBI_DBTR_TDATA1_TYPE_MCONTROL:
> +		return gen_tdata1_mcontrol(mode, value) | mcontrol_size(SIZE_32BIT);
> +	case SBI_DBTR_TDATA1_TYPE_MCONTROL6:
> +		return gen_tdata1_mcontrol6(mode, value) | mcontrol6_size(SIZE_32BIT);
> +	default:
> +		assert_msg(false, "Invalid mcontrol type: %u", (int)type);

...my suggestion here was wrong for rv64. We need

  assert_msg(false, "Invalid mcontrol type: %lu", (unsigned long)type);

I've fixed it up while applying to riscv/sbi

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/riscv/sbi

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
