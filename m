Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDEDC282EC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 13:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbJ9phywNGSyHklnEHmVoUx9bMJGx/TCIaIAg98cSAI=; b=okUqZptMPeI3ub
	phW0sLNM8szWgU3kKfcLGkoYIvpVwBSc+CjulNTZUBAMHopgI65ex2MCw5mCC5FgCXPrSxLVdMFes
	TnXm4qLvRjQ1vE8udI6nx88G2wHP45e6NYztuv1/CgtjIAfeA8dOpQtVEONRcx8e4W+vs/CnQFemI
	k9S2zsHpeQAOWJRqVFdVgBJwKJgGzuJel3VPK8PLGUWWNQUGszVhDDoyuHm9Zta2FO7nw9tcDCX4s
	LLBY1/u39hK1FB7vlK4KNloY4Fk9BZSNV9T1k2kjFe4ZcKFRRYN9mfO7+NIOjSxZO5NW2nk3YD/Rc
	oVcoZalySYxmOUHctVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA4e-00000002ebc-3wB8;
	Mon, 17 Mar 2025 13:00:08 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9ub-00000002cvB-23Wq
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:49:47 +0000
Date: Mon, 17 Mar 2025 13:49:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742215782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oPYpkeHTBRW7ZIq4gqnfgs5Y1FHdNlRjkzXr+4ZZFI8=;
	b=cAEfVtV8vV5kgOVgDdlZFV+46S4JzGAYcRVYNIIYNfs1qMvjdD7MyKWRIP0qZFJ/41Okk+
	BVa3Y2cUdPxFw2ibqwW7sTg02o5f/GsxZ8gNlxarw2yYoa+XMN6UlARGgd64UX5d4lAbvf
	GONppRou4Vh8g7a9qv+dky4jpFY7lGc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v10 8/8] riscv: sbi: Add SSE extension
 tests
Message-ID: <20250317-a427b5b91080ab28e40a56b7@orel>
References: <20250317101956.526834-1-cleger@rivosinc.com>
 <20250317101956.526834-9-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317101956.526834-9-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054945_732689_4621A645 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 17, 2025 at 11:19:54AM +0100, Cl=E9ment L=E9ger wrote:
> Add SBI SSE extension tests for the following features:
> - Test attributes errors (invalid values, RO, etc)
> - Registration errors
> - Simple events (register, enable, inject)
> - Events with different priorities
> - Global events dispatch on different harts
> - Local events on all harts
> - Hart mask/unmask events
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  riscv/Makefile    |    1 +
>  riscv/sbi-tests.h |    1 +
>  riscv/sbi-sse.c   | 1280 +++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c       |    2 +
>  4 files changed, 1284 insertions(+)
>  create mode 100644 riscv/sbi-sse.c
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
