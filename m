Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B79C28B30
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUbsP/QOsE5x6W9IIMKQc8yK+kQ3jmlsDd8tBwPLN2g=; b=PEEvkhYjTxM4cB
	3gkCv3PfwdVH1hjuquRKjfVBHRgqxOrS9TiBWbumJzF1MJCv7e0wlzPjOwMQAGW2tO0krdjyZW9yL
	hlIt9nm33auRZ5SEIzoOHH0YsMy+GaN9qqKkfMOP0c74pHYJcMOQ7DxwA2J5bxY/ReDkNi6moGabp
	5kkx/pwREIWyMF7+UapSsybO5Qwhe92tgQrpIfFvYVnc/cwqJn6cSCuT5KJnsobohnGccS+T/IgqB
	SRAzmtyrVOkeEpqDEKP07gnQoTEf9xxNovkrYJf6I7iVfY74hcI3j1sSC7lxaok19p/OL7RHC30Aq
	LyEX5SY5HMmg82biSXFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG8H-0000000CGuo-1F2d;
	Thu, 20 Mar 2025 13:40:25 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvG8E-0000000CGu7-3O2m
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 13:40:24 +0000
Date: Thu, 20 Mar 2025 14:40:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742478020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1neApBu3SJG242Qb7WO9zeFzwoqW5Iefa8BG31bcyE=;
	b=aMNW8sD9Z12Y/vxvQU8WSSwsVlPyfbRb+sOx4+oMYqfcspx6LjfRk6m16f3SARKWznu0Hj
	nVDy/3ZyVKNg7YBQjGmWSaeL4gKEdlgpU/uDHnVTUkaJ6OjXmQWSzR7zz6ucZjVaXo2jIw
	QGHH3lDmdsQdNwrpsLJJVpFdpop9GJw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v11 8/8] riscv: sbi: Add SSE extension
 tests
Message-ID: <20250320-ab264d08531d4ff10b874485@orel>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
 <20250317164655.1120015-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317164655.1120015-9-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_064022_990671_D3973206 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon, Mar 17, 2025 at 05:46:53PM +0100, Cl=E9ment L=E9ger wrote:
...
> +	/* Test all flags allowed for SBI_SSE_ATTR_INTERRUPTED_FLAGS */
> +	attr =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS;
> +	ret =3D sbi_sse_read_attrs(event_id, attr, 1, &prev_value);
> +	sbiret_report_error(&ret, SBI_SUCCESS, "Save interrupted flags");
> +
> +	for (i =3D 0; i < ARRAY_SIZE(interrupted_flags); i++) {
> +		flags =3D interrupted_flags[i];
> +		ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> +		sbiret_report_error(&ret, SBI_SUCCESS,
> +				    "Set interrupted flags bit 0x%lx value", flags);
> +		ret =3D sbi_sse_read_attrs(event_id, attr, 1, &value);
> +		sbiret_report_error(&ret, SBI_SUCCESS, "Get interrupted flags after se=
t");
> +		report(value =3D=3D flags, "interrupted flags modified value: 0x%lx", =
value);
> +	}
> +
> +	/* Write invalid bit in flag register */
> +	flags =3D SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT << 1;
> +	ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
> +	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags bit=
 0x%lx value error",
> +			    flags);
> +
> +	flags =3D BIT(SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT + 1);

This broke compiling for rv32, but just changing it to BIT_ULL wouldn't be
right either since SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT is a BIT().
I think the test just above this one is what this test was aiming to do,
making it redundant. Instead of removing it, I changed it as below to get
more coverage, at least on rv64.

Thanks,
drew

diff --git a/riscv/sbi-sse.c b/riscv/sbi-sse.c
index fb4ee7dd44b2..f9e389728616 100644
--- a/riscv/sbi-sse.c
+++ b/riscv/sbi-sse.c
@@ -495,10 +495,12 @@ static void sse_simple_handler(void *data, struct pt_=
regs *regs, unsigned int ha
        sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags=
 bit 0x%lx value error",
                            flags);

-       flags =3D BIT(SBI_SSE_ATTR_INTERRUPTED_FLAGS_SSTATUS_SDT + 1);
+#if __riscv_xlen > 32
+       flags =3D BIT(32);
        ret =3D sbi_sse_write_attrs(event_id, attr, 1, &flags);
        sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "Set invalid flags=
 bit 0x%lx value error",
                            flags);
+#endif

        ret =3D sbi_sse_write_attrs(event_id, attr, 1, &prev_value);
        sbiret_report_error(&ret, SBI_SUCCESS, "Restore interrupted flags");

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
