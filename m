Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CACCAC582
	for <kvm-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0f48tV8lr++zcO+0mPOCly1e0Rso/WszYqFH8yjXK0=; b=toxASjPsOZdnaF
	eT387rqW3zJB/4o5sCc8jz5pPHFRKwD+8anJvqC1Y0rgCLn5jorwIDRqo8Sj3kfsUvXyliwqNb04u
	nvw/qubfzbSN1J7Aup/e9obQN3q/afQMVxKdXLgVobNGJxRiyV/r8g50x2uhxKLW/grWJGdNn+XLj
	XnlX5zrDCDI0J/BfR3RIydC/nchTXQ1qDvWjdvizKd5WcToxhptSZHd+bgPSUYDTw9BT9gSL0jbi6
	d19XBsf/SixdvrbqXt4Wqw4oAlqrx3estW3okxlptTqg1To12eojPOKVaCIdHK5rFswvS1Glu1ad4
	yT943z1OudXZHYfBPPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF68-0000000Ccxs-1PRH;
	Sat, 13 Sep 2025 01:30:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxF65-0000000Ccwc-1qBq;
	Sat, 13 Sep 2025 01:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1317140A66;
	Sat, 13 Sep 2025 01:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4D4C4CEF1;
	Sat, 13 Sep 2025 01:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757727035;
	bh=NqmYTFLNlgJCW+t+zwPLK3FAWSRW5RzSUK74Vz4Mfxg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NzFHYSp7YYJ7PISif48D19LeoghOBY9n/DWZRzc9KcYpmPIXH0ZDmsZvAkCRQMbTw
	 S6lnr+UmkVZPoO1v6oNL+xdFIhWUVt/b/gWQOQFTALRBdM4RDORACR/pGxR+1W/uo+
	 0Zu3U2/oANPftZjHgnIOGjDLNaS31Xhusb/G3AXWNJHTyouv914OiyQuO9/Lv/+/dP
	 saCS00n6CpkPZ+0Rple2xNopgnVhRuDzTGpzKStpHcigI9cJd0UfY2/xi455GYmlOh
	 TSW/fmSfvBco1nXWbk0xfRywdpqMRmLQFlRtSbbzxvxLozNomCbSUr7kRQAG27Ymf7
	 uli+XnYJ9mdIQ==
Date: Fri, 12 Sep 2025 19:30:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
    Atish Patra <atish.patra@linux.dev>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
    kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v5 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-2-d865dc9ad180@rivosinc.com>
Message-ID: <a0ca072b-74fd-82b6-1e7f-e15183d0495b@kernel.org>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com> <20250620-dev-alex-insn_duplicate_v5_manual-v5-2-d865dc9ad180@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_183037_495793_311DEEE8 
X-CRM114-Status: UNSURE (   6.98  )
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

On Fri, 20 Jun 2025, Alexandre Ghiti wrote:

> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks.  I updated this one to uppercase the name of the RV_X_MASK macro.  
That way it matches the naming of the rest of the macros in the file.  
Queued for v6.18.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
