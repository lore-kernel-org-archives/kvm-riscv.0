Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FB1CAC581
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 02:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Is41TFZUxqs1Re/U+KAENK2lRQ0IilczLQGXxyOzNaQ=; b=hpdieZZcU9VLUf
	vBq08yJ8tH9J9RmKnd7uAexc4fNRoxd0AKqtdjLZQVJwJEO/OHLiPmvM/ApXi7HXXZ2mmhzP/CW9k
	gj9jGmHSmSfWLLXRVbq1rai6vM5G0dLHmfbPsjIfLUwZf8w+xh3FPJQuO0Fzk6zoA0kmb4a9KN3MU
	ldeVIWUVK2cugaSx35kCJip4sSLAZtKHOxDXYbXiDAZqSjHfR2ZkhzuWFZmpaAThPhFU/zZpKg5l8
	47w5ylQwaNwxILSxb8hzPPNR/u856PsyB7BA6QuUO6XJlkjuMA5oJ40GD18oHeLS3i8rlbewUrSPW
	KCNH22QJf9m17SBOzBfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvo5l-00000003gui-3u62;
	Tue, 09 Sep 2025 02:28:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgVL-00000001Vz6-38Lw
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Sep 2025 18:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9BwobCK5UVhY5V+X/GkI4hjg0zbTCriLejOr/R4m5d0=; b=OYXFrxCnyLynb5zfPwlh43LB0x
	hHpsy2LE21f2kDsminvBO+GcjEM8CPNT9hhTtQwdbb55ybBgc2UxP9wP8xOjEVje298MVt2fFS6et
	LJc+lFHgSH5ISKLr/ldgz4ax/Vn1zXulqiZC4ozmQ5N0FnAonxSA10x9qbN/Mzb7jPsr5eQwgoXmE
	1X3mMdPsbmgdGWxj2WnT8iKHBrJmond/3W3PYtCjJ7oRdAOzj6tBThONzxFSFm5E4nNNNS+/y6Ugf
	nHKYPYbtno2U7La8FwM5MEbjP+NmYR84oDVxzypxyv/4LrCJ+3XBowqvMuHFIFSpA8W/IzbJYdp5/
	SYliuGPA==;
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgVG-000000057ML-2SWN
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 18:22:14 +0000
Date: Mon, 8 Sep 2025 13:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757355725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9BwobCK5UVhY5V+X/GkI4hjg0zbTCriLejOr/R4m5d0=;
	b=xjNF0IBLAwhqTVX0AULJIs/57tdFsvnGs5WKPa9uR30vgFyLJxHlwzTZOM4lG5HsWvK2UO
	rEn/Ue60PhQ3dKewTpqKFw3/dyRkLI3Upka9k2+7oCQN3KGF94q6ZF4kCoVvKf4C2MTBAE
	JWNfkUkIRJsiN0lZD7JidjdcWiMwWn0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	kvm-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] build: work around secondary expansion limitation
 with some Make versions
Message-ID: <20250908-8ebb10e1e917a5befd6b5f44@orel>
References: <20250908010618.440178-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908010618.440178-1-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_192211_829772_D1D12733 
X-CRM114-Status: GOOD (  11.30  )
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

Missing the kvm-unit-tests prefix and, for this patch, the riscv prefix.

On Mon, Sep 08, 2025 at 11:06:17AM +1000, Nicholas Piggin wrote:
> GNU Make 4.2.1 as shipped in Ubuntu 20.04 has a problem with secondary
> expansion and variable names containing the '/' character. Make 4.3 and
> 4.4 don't have the problem.
> 
> Instead of using the variable name from riscv/sbi-deps and matching it
> from the riscv/sbi.* target name, name the variable sbi-deps and match
> it by stripping the riscv/ directory name off the riscv/sbi.* target
> name.
> 
> Reported-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  riscv/Makefile | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>

Added the riscv prefix while merging.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
