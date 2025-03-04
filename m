Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69551C021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDmefKZZFjJDaVZ/XmBlwyClHbBdp/qvBvk1faTf4YA=; b=IGgTuPEvgNiWVU
	sObG3UdumDsKaim3q1Hw48rolcdb5QjsXHO6Nh1CfkeiMOMl3kJInBkqLkv1lJjHXtFOhDwKl8us/
	iwFSUrbcRY9fw6Fm1snRnAQH8puJNWdhuday6M21cp2CvM1lZ8SGq1mFw5mM82gEDk/6WSp/IAAbv
	w7EFKB6WmDJuHYA6NQ9MBMlDl2zxxK0o05wrYOHls0DhtBUBlSkAKzSYd0+C3phTOZngVA06e/t2O
	9SkJFQvnF+J7JNjKbEAQEjUbhUKJQ8q+6YhW8YYgwOX2IOzZlKqqTsJLEQ5PjicUT8DjiD0JK/PhQ
	ibn6DYlvb98FoSxhWZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOjk-00000003vmh-0Tp7;
	Tue, 04 Mar 2025 09:38:52 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOde-00000003uCj-1W4u
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:32:35 +0000
Date: Tue, 4 Mar 2025 10:32:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741080751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KU6v3kuMyY5oAxKCgrort60qMVj3jpNCyih39NRlcg=;
	b=M4Poqd86XJQAufWOH5bFBrt1+FMXIzby12Yw4HvSJ72uyN31iwpCZq2hB3Yw1qPvbz6U3O
	PzWt+s1eM7PIxopkYgkBL+yZq7x5QDtP3xxtwUe5XhUpD5K0767fC9cyeJUwNBiR2jluYj
	awm85eBFH/ngfaBdUh7PqanjB2/OK4o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: cleger@rivosinc.com, atishp@rivosinc.com
Subject: Re: [kvm-unit-tests PATCH v2 0/3] riscv: sbi: Provide
 sbiret_report/check
Message-ID: <20250304-02695193b45ff3d30c19b561@orel>
References: <20250218185401.41250-5-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218185401.41250-5-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013234_538385_F46DB702 
X-CRM114-Status: GOOD (  12.36  )
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

On Tue, Feb 18, 2025 at 07:54:01PM +0100, Andrew Jones wrote:
> It's commom for SBI tests to expect a particular error return (or no
> error, which case it expects the returned error to be SBI_SUCCESS).
> When we don't get the expected error it'd be nice to output what we
> did get. gen_report() in the SBI tests were doing that for the BASE
> tests, improve it and export it to be used by all SBI tests.
> =

> v2:
>  - Output expected error string with sbiret_report_error() [Cl=E9ment]
>  - Picked up Cl=E9ment's tags except for patch3 since it changed a
>    decent amount.
> =

> Andrew Jones (3):
>   riscv: sbi: Improve gen_report
>   riscv: sbi: Export sbiret_report/check
>   riscv: sbi: Add sbiret_report_error
> =

>  riscv/sbi-tests.h | 36 ++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c       | 30 ++++++++----------------------
>  2 files changed, 44 insertions(+), 22 deletions(-)
> =

> -- =

> 2.48.1
>

Merged.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
