Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FF5E668B8
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDQ1bHN6firdbZOJw9OfFxEP7rQSptMwRlpwWTmjHwQ=; b=xCnsx/xNpmXaJD
	Ky20onbS84+1/SzFdNO/oRYSfFHDNlk7lsiTHviok2c+OW/LpUbaV2KVICOwRAyCr7z36UrGJDeVi
	QZ3t+MeTmqeiNhyizJl14UtHr0YExnwUFs5kUs/GlwSoXzAJLx3UxJZLYi3OQ/ohQBr+Hb9ZyHWFM
	kbFT9Xk47/rckerUUBcg8jtJ3vfk547OKjmQmR24M2TdrxUq8sSZwc1STugiNDSMcYPTQK2bpxoig
	2dgvpb1WKYq0tBmGRI0+3EbBWVBMbNtxPev5tcjFi3dpwTx1TFO9QMKO5t83eU59BHoFsY3xJA6iF
	ofmS7XtmOCpuoLBhqlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyn6-0000000BgXN-2J06;
	Sat, 20 Dec 2025 15:22:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyn3-0000000BgWt-2qsV;
	Sat, 20 Dec 2025 15:22:42 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766244141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSC5dC1xvaYRCUO3l4CkD8cm4hyN/yZ7o0xpaiSUKsA=;
	b=xCiwepZOHQITosAhQ1dZA/p+5dhqc/nTO71S2xf8k5DTEUbqE2mD9sUdhP2YDgICU+q3nT
	iFpiQhuCTdkU2HJYMaBDJkIojLxSGHJZaoHeyHs4lJdjdrav7EbDRF1zxdevh/9Vs+IVle
	VRUpraFZ/yVYALCPzzzbS9PAOtVng5L0LJEiOAnv02/OnQFbpOCW3Jg8BkKL0B3YGHqxWU
	A6KIAt9ZKyMfoQWz/mpVpohTfPtIBapm5sCjR9y+21Bnqg6XihCwZ9wIHaVz0WHyLl8Ftq
	bmHvnbWK9mlzU7yoCbiyNg1WEfys/QRiLLeLTXocg11Esx7z5L0oJTTax4+2Rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766244141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSC5dC1xvaYRCUO3l4CkD8cm4hyN/yZ7o0xpaiSUKsA=;
	b=15DBvIf8QVMUUilPL9P1A1VhCyMUcV4cZRjGiQCUIOlwegD1TI67a7Qumc7sYsyzWRcyfW
	gfmdWLM2FvoKCWDw==
To: Xu Lu <luxu.kernel@bytedance.com>, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-imsic: Adjust vs irq files num according
 to MMIO resources
In-Reply-To: <CAPYmKFvE3ZnsbTFYHe8T2tkF10G08dnEQ5KEdied_6wGjztv7A@mail.gmail.com>
References: <20251220085550.42647-1-luxu.kernel@bytedance.com>
 <CAPYmKFvE3ZnsbTFYHe8T2tkF10G08dnEQ5KEdied_6wGjztv7A@mail.gmail.com>
Date: Sat, 20 Dec 2025 16:22:19 +0100
Message-ID: <87o6nt9o0k.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_072241_894013_8453D82B 
X-CRM114-Status: UNSURE (   4.36  )
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

On Sat, Dec 20 2025 at 17:03, Xu Lu wrote:
>>                 kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
>> -                                           BIT(gc->guest_index_bits) - 1);
>> +                                           BIT(gc->nr_guest_files) - 1);
>
> Typo here. I will resend this patch.

And please change the subject line to something comprehensible. 'vs irq
files num' says absolutely nothing.

Thanks,

        tglx


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
