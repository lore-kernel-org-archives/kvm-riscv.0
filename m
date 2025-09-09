Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F449CA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aON8PhrgEgaQ22hsf+gqR9fFfJkxGMfuhuupQwtXqSM=; b=TqIRSNtCOqiPLB
	8IdBJ1BP5E419/qwGHmWxzRBRB6DkezaeEGLM+At5otD5FnnO0UwISPcnau1KnMrT32EYaN+jqn+8
	S3KuKtWOl5Jj49XDOBriFngxcTKjJd9awctd5+EvTMP7Jak32aaGYmqx5SGLIBzxDejaiLWcQA/J5
	6IzSz70hk8h9vHtIFCFxg5AyX/twfJ97Rot10+m9puZWESbuKR8/dLrN+Ll/YlYpNF9mMusVa6T7O
	5/Yv/4HBcwC63dLFobF50XXR50ov93hiKAirBvdn58SkBH9ry0W8GrRym01FOFZ2oPhANAtoqLtNi
	4arSxAClr/99cPPyJj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsHY-00000004wfe-2J3k;
	Tue, 09 Sep 2025 06:56:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvoWD-00000003pRA-1BSr
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 02:55:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7723f0924a3so6779288b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Sep 2025 19:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757386540; x=1757991340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V7NFezUNZ/9TY+iZpIJr32mB1CpxNBuJ5nniRNv+AFI=;
        b=T81UlvhLDyF8ujRqkp2l4j+rGNWRbIAuXpk3ED8vickVibl6A4shnkxB40oJ3LWudP
         pcoG8iTbhV9gF3/vyTQ2c+yKS/QYVP2IVAyeMDkuUDBQ8GZXNeuNV5gnx/QUbjmP7wlC
         7iOnS2VqN19+lIX0RpBVjRQgdTyYXDQfsMzxJu0EZnfH4FrvQRrBH8HZjcIE7124RvGs
         mlJjj/Og222gGoAKXFNniRm1qHMBxjkSc+WCVKLMoA4zzyuux/e7pqxva57NTCDGbnTF
         LPo0JFG+hDwmTN6+vpe8FciQPT2wLcFMRRrU46IIUeYJHCLUySJdhESbcxJwYQi5Xblh
         Y7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757386540; x=1757991340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7NFezUNZ/9TY+iZpIJr32mB1CpxNBuJ5nniRNv+AFI=;
        b=CXwQQRus7vQNCHVZEjJRH4bEzKS6hxjpZ6kvFw1fjxo6IiyScUTFpFAFqumBL/OTsR
         Jip3pk2AqfPY6flbnKPt0z+ZORx2Wj+VZf4t0sB9MM4hye/57wh24VwqHWXWljCwC/nn
         6FEeg7VfDvL9M1xSdK0BKGspKOIsEUp8NK4FA4xfT3GSjlrJEsKTItLQhFCVtzfnzhPE
         8KLGeS4gJ0X6XXj2vRsGM+NggS+hH3To1QXrwfaNXgv1gpwI2DDtcWBoue5duozOKRgp
         BoRketd8HBPmkLAYVdvAAz6qhfkqUjb2RtmAQK6GXnv7iMwdeN4uKzH+VW9I/isLZpIp
         haKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk6J3GSPGU3R+Z8ELUMrdumXljFLNF4g9c92YvrENUG1WK8IhUpCKAl84UqkD/PIkBBS0jtQWEils=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4QsfLmRubqneUjPuB4FvWAuc0WWabmWjFR/F3Z40TJq9KVXk
	sA7BtZEIio1HCJXBLkQFj1c4/nGo274urqo2kx+aNR/oONA/WZRwFFKF
X-Gm-Gg: ASbGnctlw/fgclJW3qpXh1bR2xFKoME4p/BHENo9ZikBv8izSaIbbO5nThVN1ePXjce
	O01+qgCaQ3+Acv+2RIj+UWiEs1RyVCvrwgzD3C24bOxWVHtLSncpUFvOH8ymSqT4Fa3XJYoI3Df
	MSQF9TnUgCnj0smncZul+I3XefgTM+lliP3cWxrrcqp9az6yAik1FsHv0MK1FhQCUv+ct3VX6/0
	cLDVLu1QPMBHFoOPVFdonbyX4yQfVXT2gvP3IwYTm/km3gq6h7qf4GUkYJiwv5fofH7Y8qmghd1
	iAxvk98JOPjnyERPH+nCRLvam21+sTAnpRJdPc5Avts3FDLea79uirkEUPBHwAmoV8Cs01UpsNx
	TnmTfwCL7jhBZ4VurelWwM498
X-Google-Smtp-Source: AGHT+IGTk7kMp2IT5Z7e4RQR0eUxgkzozncIuV7L+9UF2UwaRosR7Y5VHClxc7W4D0jW9l7zfJ+Juw==
X-Received: by 2002:a05:6a21:6d9c:b0:250:f80d:b32d with SMTP id adf61e73a8af0-25335e6f177mr14935575637.0.1757386540098;
        Mon, 08 Sep 2025 19:55:40 -0700 (PDT)
Received: from localhost ([1.146.54.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-77466118071sm397877b3a.24.2025.09.08.19.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 19:55:39 -0700 (PDT)
Date: Tue, 9 Sep 2025 12:55:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Wu Fei <atwufei@163.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, wu.fei9@sanechips.com.cn, 
	kvm-riscv@lists.infradead.org, joel@jms.id.au
Subject: Re: [kvm-unit-tests PATCH] riscv: Fix sbi-deps expansion for older
 GNU Make
Message-ID: <6hg2b4gqryu6afn4ob3ir33y5yw34ubx6t5mjo6dkq52w6tkv5@7kvmtr3lyneh>
References: <202509050748.5857mUY1083256@mse-fl1.zte.com.cn>
 <20250905-947146894bc614df37a82dfb@orel>
 <87674b60-1882-4566-b92d-23b75a2df187@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87674b60-1882-4566-b92d-23b75a2df187@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_195541_325523_776860BF 
X-CRM114-Status: GOOD (  26.66  )
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

On Sat, Sep 06, 2025 at 08:32:16AM +0800, Wu Fei wrote:
> On 9/5/25 11:37 PM, Andrew Jones wrote:
> 
> > On Fri, Sep 05, 2025 at 03:43:12PM +0800, wu.fei9@sanechips.com.cn wrote:
> > >  From b8b66e40566bb89de57e45b08fc72446b26a7bfb Mon Sep 17 00:00:00 2001
> > > From: Wu Fei <wu.fei9@sanechips.com.cn>
> > > Date: Fri, 5 Sep 2025 14:31:48 +0800
> > > Subject: [PATCH] riscv: Fix sbi-deps expansion for older GNU Make
> > > 
> > > The prerequisite $$($$*-deps) cannot be expanded to $(TEST_DIR)/sbi-deps
> > > in 4.2.1 Make, rename it to sbi-deps without the prefix path.
> > > 
> > > Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> > > ---
> > >   riscv/Makefile | 10 +++++-----
> > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > Hi Wu Fei,
> > 
> > It looks like you ran into and fixed the same thing as some others. Take a
> > look at this patch and thread here [1]. I think Nicholas' solution is more
> > complete since it includes the notdir. However, assuming your solution
> > works, it makes me wonder why it's not necessary?
> 
> 
> Hi Drew,
> 
> 
> Yes, it should be the same thing. I didn't subscribe the mailing list yet
> yesterday, when I checked the archives I found Joel had reported it. It
> should be better to reply to that thread directly but I didn't figure out
> how to do that at that time.
> 
> 
> Regarding notdir, yes, this patch happened to work on Make 4.2.1 but not
> work on 4.3.

Right, I believe the older make is not including the riscv/ directory
name as part of the secondary expansion. Make 4.2 => sbi-deps,
Make 4.3 => riscv/sbi-deps. So if you just change the variable name
to make 4.2 happy then you break 4.3. You need to also strip the
directory name from the expansion to keep 4.3 happy.

Thanks,
Nick

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
