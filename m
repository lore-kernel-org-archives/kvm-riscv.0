Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EE4C021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikiw0aJ27sFHD7c6nvbLWy1ap52vLO6Z7BLzmC8TEAM=; b=bfmfGCNOIj2/Zs
	+bQIcxDdNg+HeJZU2sqio0hOPlrJrZXEedfDX72oKugabeWPTpIjnxppmTHyGWZFVGQ0f92H9lsgq
	BfFJmJfvQ45ItGVXVXw/Z1fx/F5Lh488BNtkKQinI4TS7NiWyxbGqefWMc0c80gq2b0Je85KDi5wl
	FrcmOUJZICY4MZvUSOL/ThFIpPGnrPQRvNpnJkhKld1eO2b4Yq6R278eIQBrONLmcPztZU/q31cQa
	V+8EiDECcqo1rfm6qFLMznTzUCZzT5b+akzB+Tv6kdgBd8k2+WGlh5a3v5Cg+iR4bQek226QeblDU
	vjQW19iAgxU5afY0VwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOiB-00000003vIS-3dXn;
	Tue, 04 Mar 2025 09:37:15 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOd5-00000003u1E-36gg
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:32:01 +0000
Date: Tue, 4 Mar 2025 10:31:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741080717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2F44jkdAl5d6Y7W7SiN0NSgO/b81SC9eWu/a3vDhv8=;
	b=T6gtLt1QOFeEE+xiGaE5fT9BfkFnXkZjtrFCpSRIz5I+0Kbjbwr+M403yWzs0UdhcFYNYn
	+jNkPtjr2ZPefO3qneSJblMV0G3yuxYulb7MdKorexIth3k+ZEKBVmVmIXxyTXE+tcs5As
	+snjIIVds315bfFuOpuW0SFaw22nYnQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, atishp@rivosinc.com, 
	cleger@rivosinc.com, pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH 0/2] riscv: Run with other QEMU models
Message-ID: <20250304-47806ddca2d868f97d63de6b@orel>
References: <20250221162753.126290-4-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221162753.126290-4-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013159_916587_C767E831 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, Feb 21, 2025 at 05:27:54PM +0100, Andrew Jones wrote:
> Provide a couple patches allowing a QEMU machine model other than 'virt'
> to be used. We just need to be able to override 'virt' in the command
> line and it's also nice to be able to specify a different UART address
> for any early (pre DT parsing) outputs. 
> 
> Andrew Jones (2):
>   configure: Allow earlycon for all architectures
>   riscv: Introduce MACHINE_OVERRIDE
> 
>  configure | 88 +++++++++++++++++++++++++++----------------------------
>  riscv/run |  6 ++--
>  2 files changed, 47 insertions(+), 47 deletions(-)
> 
> -- 
> 2.48.1

Merged.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
