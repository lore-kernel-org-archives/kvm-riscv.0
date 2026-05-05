Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8752EFF8855
	for <kvm-riscv@archiver.kernel.org>; Tue,  5 May 2026 20:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWD/51ZGTB3zxcgNkTsy032E7p2sMNo/n0PKgTjBafY=; b=gaMZ1VlGoqIq45
	lFoJesTtBphZ0yYznYiD7/tpvwQsYcHByAuxtf2CFTkSwuEHoIkjGktfMiwJp98j8mhLkpnh/GXui
	w5Q8jMoIV4cmGPHx6r/k4tT34EPumhYdDCqfxdY0L8ZOFnioPiz+71YVzsLuSeYEdEC3M5aLx1bT0
	LXur7h9iP0fg2AqQvSR+gFqTu7Ad2T/XhqucYvpN0tMAEmfFUWi/7n0SF3iVgaqd62KPNC3xXEIjV
	I79RFZJniJOBicL/CZdVJLKa6bjmSdNBdHL+3x8kjRLd1+zFvYol550HOTDOji8QX23EX5nbFvWEv
	IuTssXv+CV2cX1JhigFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKM7h-0000000HORu-3Zru;
	Tue, 05 May 2026 20:12:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKM7g-0000000HORN-2l1v;
	Tue, 05 May 2026 20:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D0AA60181;
	Tue,  5 May 2026 20:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD4DC2BCB4;
	Tue,  5 May 2026 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778011923;
	bh=u1TNffjOTQScgQgHOm6HUq07Ara3K4AEvgtmk7ngCoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g0gCUNym1AaGUb74sYOFr37DzoB5h44Y35SreE4szEEYoIcTo2dFWjDRt/dLqC3zU
	 URdVZD3S5OaSDXpB8aYCFdc4z+PqEk1RPzoohiFu/IEcOt7sitjpZtf45omc8D5Nb+
	 NrW1tOns853utx4zov9xzmptqVX48wOFdV0+0kmYuj8L9HcUmHAQ15H2sUBK/bDbbp
	 AwfdWlR+F2w2SPrTsQWhmsGwFREqGlCMRst3DOfgUhREzKGC2b1yjK4AJJy8hQvmQ6
	 A/zwGtJ/y0DZWGFMAQ/11jvg790O6jAe5W0gYUrwlW68DSZGCIdx3fUf+tTGa+FNfp
	 ZI1QivfXfJQ9A==
From: Thomas Gleixner <tglx@kernel.org>
To: guoren@kernel.org, guoren@kernel.org
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
 atish.patra@linux.dev, cp0613@linux.alibaba.com,
 fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, inochiama@gmail.com,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 me@ziyao.cc, palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to
 per-HART local config
In-Reply-To: <20260425005916.3321811-4-guoren@kernel.org>
References: <20260425005916.3321811-1-guoren@kernel.org>
 <20260425005916.3321811-4-guoren@kernel.org>
Date: Tue, 05 May 2026 22:12:00 +0200
Message-ID: <87wlxhwr8v.ffs@tglx>
MIME-Version: 1.0
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

On Sat, Apr 25 2026 at 00:59, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
> With the recent KVM AIA per-HART HGEI conversion, the global
> nr_guest_files is no longer appropriate. Different HARTs in
> heterogeneous SoCs may have different numbers of guest interrupt
> files.
>
> Move `nr_guest_files` from `struct imsic_global_config` to
> `struct imsic_local_config`, and compute it per-CPU in
> imsic_setup_state() based on the actual MMIO guest file region size.
>
> Update the related comment to reflect that KVM now uses the
> per-HART value.
>
> This eliminates the last global assumption about guest files and
> completes the per-HART conversion series for RISC-V AIA/IMSIC.
>
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>

Assuming this goes through the risc-v tree:

Acked-by: Thomas Gleixner <tglx@kernel.org>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
