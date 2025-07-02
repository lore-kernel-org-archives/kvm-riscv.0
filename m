Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9A0C83F05
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZinWBQ0Es8f5+5Uqd1G97EwMApEnAq5flTvRQg8Bqo=; b=Hd6EE77QEpr2Ep
	4HXgntWwEEHkhPXQlcTP0eHZ/FZdlUx4fvSPUMtu05YpKWli/j7Dx75l+K7CQ3kJZksmSI6t7xAwi
	OV6+xnV3rP3CuXETOl7vOcIFtO5VRHwinYS6vWvaQXmdH3+X1BRx6GfOO40N6Qzt/bEIdVdRTavzb
	Mi+UsuqHZWmTQQLvJHMKSm4569NII2yFD2XV9xn4H9VhxlvrSP2WsItgC685PvB3ff/wY7O72yHj2
	4hvhXhk5KRpsDyDwPazzwSNkJ7/ICtFZYCuQNyPyl+QnqHB5WB2bXiK3LLVww1Mz/bV/N8WnSUZJ3
	zv4l/iVSgDywIbnUcsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0fz-000000091gT-1Dai;
	Wed, 02 Jul 2025 16:51:15 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyjl-00000008fWc-2Wg2
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 14:47:02 +0000
Date: Wed, 2 Jul 2025 16:46:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751467619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1o8Ik1uzgJ1IWJd1kc5Y39/esP2RMVecgfn1KSfY0Wc=;
	b=r2iBC0dfniP2tfETMYrbCW5OlUmfhKZKOgWzunIaBCQcx4XpiW8ptuKC7aufz4JfcZl2mO
	c9u9Q2LKba2EwZlggh/bfEfHdTqlD+V2kBi2fjju280zJV+jnpzD6laDL23R1Gzc6r/61r
	W9uLHJnXWQ9WKS8aaNOCjleFnmu2PKw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 0/3] riscv: sbi: sse: Fix some potential
 crashes
Message-ID: <20250702-03482a5567d2b66e063212ad@orel>
References: <20250623131127.531783-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623131127.531783-1-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_074701_782317_1A298D24 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, Jun 23, 2025 at 03:11:22PM +0200, Cl=E9ment L=E9ger wrote:
> While validating another SBI, we encountered a few crashes and errors in
> the SSE tests. Fix SSE stack freeing as well as handler call checking.
> Also add READ_ONCE()/WRITE_ONCE() for some shared variable.
> =

> Cl=E9ment L=E9ger (3):
>   riscv: sbi: sse: Fix wrong sse stack initialization
>   riscv: sbi: sse: Add missing index for handler call check
>   riscv: sbi: sse: Use READ_ONCE()/WRITE_ONCE() for shared variables
> =

>  riscv/sbi-sse.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> =

> -- =

> 2.50.0
>

Merged. Thanks

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
