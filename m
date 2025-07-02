Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB8CC77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JulhKrJbCGMYqHgsZQ6umsaaz8Kgi0kie/RhHJyfGxo=; b=n5TrURbX1ViSO8
	KBOPX96tZYzSuVb0tq8wFJqcnJFvu9eudn3Xo7u+2nnPXh7eG0UOEv/l2l1UtBonCADWOcWvO+gzL
	cuQlGCDp7AVj0h76h6pOrx7U5YnhKu7pE2/AW6OhRpr4+MDpfmd7f9QUHoAx6lzyJvA1nAsZUF1nB
	QyZ4eoOSiS4uqpFqFE7EqM8SnHADAgd1fuqOSgK8y3W7Pqy6CXETap9AzoGM3b4ET02STVrcG+kH6
	eVLtiLDCoxkbJXj2ck1cD1NZ0hVmBeAGaLLVICxPuRuJXt/BST2uSLcbhwOC4qqAI7IIIclsK5fEc
	G9h3lP617abB3rMn+DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzUf-00000008of0-4Bd8;
	Wed, 02 Jul 2025 15:35:30 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWygT-00000008f1R-27df
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:43:39 +0000
Date: Wed, 2 Jul 2025 16:43:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hLpYSU2x8Yb+ms57gtIv5GTWsp2J7egzMbr/41MK58A=;
	b=tMB35wONgUnX/RY8EVbuddM+tRjah0aNJvRs+zfhzT1twzs8JGQJGtXLMmTRAO1CotFCXJ
	4VcTz0f1nBwFkYeTYEyrB10GABY5bd6THfn9xaZt8C1zEMT8JfEn9VnBUvNC1O5elFTtEm
	nYNAfSccXsd3E3EdauPmjNKdkCN5K+Y=
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
Message-ID: <20250702-398267de396e3a03f6d3982d@orel>
References: <20250701200047.1367077-1-jesse@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250701200047.1367077-1-jesse@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074337_949608_FDA99EAB 
X-CRM114-Status: UNSURE (   5.73  )
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
> Add tests for the DBTR SBI extension.
> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>

Merged. Thanks

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
