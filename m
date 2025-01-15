Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8468DC02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 13:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYmw1QvCt9mU4dUAQKxcYAeU6G/LZtmKQcLu93X7BDc=; b=pVBG5KXBFmT31J
	X9q44FjlLMhACnkustUZv5Smn/odzA1M4U0jFu8QBIeqsW2d/BLaYNQEqc3Gxw7nxzsbUgUJjArD4
	52H1GT7gXAAReMOHeC2xeETCm2myaEvA9KAy/a8LV9hbTw5xajVjOYWyN5diVKxzPGBvMswisVzA6
	GY1/zeWup95Q+ZhG5XRvvmHS1BzCSg4rTXzX6aJX76o4q1Q3d1K7Q7m9ORreDBM73HCxlKchRC3gk
	XheXQptKqAH3Xbl9dukZioCaOSYaBGDsfKuWaPyzqDfQ9n+yi3ButMhqV3ey1t8m4a9wscz1fk9nb
	IUfUrrlLHxN4++SuNTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3CY-0000000BwTa-0wX7;
	Wed, 15 Jan 2025 13:12:54 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3CV-0000000BwT9-0zyi
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 13:12:52 +0000
Date: Wed, 15 Jan 2025 14:12:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736946763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkfYIVXkksCwaplxJod6xonK+RNaAP9Y6T95YTo709w=;
	b=s1V+jihFRL7bDpC7MoZjhyG16NNqG3UsSsK3PjEI+77ZR/K3XzPPmB2tG8Aoj+f5Z33nUA
	vd5f50AYl9BvDcdLMToh9PiQm7GCHwJQVHvBBtyxxgTG1g0FIocuDjwzEkqQP5ZdjlW89B
	UmpCrpKbqj3Whb8W0ExfIa1UGIkWSq0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH v6 5/5] riscv: sbi: Add SSE extension tests
Message-ID: <20250115-f2d15dd40c85aad2e16a1b3b@orel>
References: <20250110111247.2963146-1-cleger@rivosinc.com>
 <20250110111247.2963146-6-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110111247.2963146-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_051251_552976_A339BA4B 
X-CRM114-Status: UNSURE (   8.30  )
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

On Fri, Jan 10, 2025 at 12:12:44PM +0100, Cl=E9ment L=E9ger wrote:
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
>  riscv/Makefile          |   3 +-
>  lib/riscv/asm/csr.h     |   2 +
>  riscv/sse.h             |  41 ++
>  riscv/sse-asm.S         | 104 +++++
>  riscv/sbi-asm-offsets.c |   8 +
>  riscv/sbi-sse.c         | 936 ++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c             |   3 +
>  riscv/sse.c             | 132 ++++++

I'm not reviewing this whole file since I have comments on v4 that I think
mostly apply. However, I noticed the new riscv/sse.[ch] files being added.
Those should have 'sbi' somewhere in their names or, if they just define
wrappers for the SSE functions (not test-specific stuff), then they can go
in lib/riscv/sbi.c. Remaining test-specific stuff should stay in the riscv
dir. Header stuff could go in riscv/sbi-tests.h or a new riscv/sbi-sse.h.
Everything else should be in riscv/sbi-sse.c

And riscv/sse-asm.S should be named riscv/sbi-sse-asm.S

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
