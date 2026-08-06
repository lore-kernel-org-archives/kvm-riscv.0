Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4F4C55ABF
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qd+oAsB9npezP3tFekcX3vBsL/y4zObnZ8LnCoB7wDg=; b=Y7XLfqiq3nEVd2
	/ASJapkSyrldwF1+IBUQfbMkLzbIJr7CWz/fepfvWCWMHOe4gFaAISsrI3YqSpOlymwP7gSGRclXk
	m4JSTCIbOg5JTuDR6eAhJuXsPjS2SNJ+SiEYcDGabfEOvLn/bXBtDynGVVyUR2bcgG1H0Agw8J4yP
	5f/Ag0DN4EQRXeevezghO09BBkXKs5GRTQO3l3QfUnqCNVJNzma06vkdTGa+k70jz5Hy2KUtuVS0A
	h1L06kvS344YtsPcx6YvMwoi7vVC48QCG7qLjYc5agoll7Rtme3hrgyA43E/4QTztPpgu1wI9IjXB
	FjhthY4x+ZxWcPjflncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt08-00000005BEg-3ZZ4;
	Thu, 06 Aug 2026 07:58:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrt07-00000005BES-2MVh;
	Thu, 06 Aug 2026 07:58:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7C0A60A8C;
	Thu,  6 Aug 2026 07:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C0881F000E9;
	Thu,  6 Aug 2026 07:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003130;
	bh=6Qdw3rPKOE/bqfzieoBLsN+JJCKDj8Yo0JXPMaKeuak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J8YD+KrbFok+1fwrI0iVh4vH26ewld4lv4yE4DFBk81pY0lZdIVyTtOduja1KQ1L3
	 BV958JiLuPY/ayW+tVLF8iavvaLcHpcaNd+5HKEnzG/wxP5fw0xcGz5ZrCF96Ga3rQ
	 ckARtxPyCWzm/OG4zer/hsYuw61JO3TxKyA3pb1bv+sVmLiolZQc9VE6T8be16/0Lj
	 pxPY2tkmJr0KqCi8N0/leBGXsiRewNbRPX/Jt8LHaJlHqqSX8Ocp0sZRGKAA/snYwu
	 kWb5phclr88l1FQHh0l1AcAt9lBb+HtlHoWI3czYHgwuZFMhavmOxmga44ZQ7ZyAHq
	 m/0hJeUVeZY+Q==
Date: Thu, 6 Aug 2026 08:58:32 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH v2 00/15] riscv: add Svnapot PTE folding support
Message-ID: <anQ-GfzFl-thu3q8@lucifer>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
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

I already commented on you failing to cc- anybody here (!)

I am guessing you did the core bits in response to David's request ([0]), but in
general - if you're changing core mm to suit an arch change, you really need to
send it as an RFC and then it'd make sense to send the core mm changes
separately as an RFC with an explanation as to why you need them.

[0]:https://lore.kernel.org/all/62c418bc-082b-4ae2-a889-f63dd2b7f503@kernel.org/

Thanks, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
