Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C061CCD8CA8
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 05:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ/gLq8J3cdx/DJA1ptH5jcYONaHnXWNF3t0zCj8U1w=; b=V50KivBDNRo5PB
	5/zTu7Xq3aqMj7ln4UfnCeSb8UBWNf5FMPTfEIzJFlAwXJf/gx7UqwBDgPRTmZ52o+S/ZQyOJ02rs
	gnm1s3k3kmATr66yvtmQFynmTHq+zbuwP8uuXTtNQFf0glQbOqLFCmRi8WslHTzSGYzfmTR2CA4/f
	Xp42eXm2wsci41bALi5vq11gUETC0BpY2E4wmYMltycuheTLtFZK3JreZCWld02cLRQXn7MsFNOxC
	1rkVdJxrqr9ZxU+jP/8v7e01LAzxYoVKBk4yFMcm2d81zZeoM6dzrChBu8npBR3/6XCqgBfMbsi8A
	E7nY/VjM6PtfiBXD/+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMok-0000000FGyV-00FT;
	Tue, 16 Jun 2026 05:58:34 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMog-0000000FGxh-3Zqr
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 05:58:32 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so70738eec.1
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Jun 2026 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589509; x=1782194309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=eiEm9Ido7Ts6f/iS7TxUvCuz+yry19/S9SiEopMQe/zXxznA6UFUtm+qIx6wLbEKO9
         4fNUF24FzybQJqPI4tX1S8dIMqNyfEeHga2lnlNWVy3GbPO5n2kwmpvJUm0mK85A65Xc
         h2eNakVrmSMTEEBsXBpDVeCJ/3LVSj2y5omdtE/qqe1+pfB664FIE81UV1NZ7/DP7+32
         a1WyeaFVUGx3ArPlwKYpS37eV2pXN+ZPC05IIunz31UWY4ZgR8Z+9y3NSQBRxoC+cmvn
         qWzYFzU5fB5sfrmo9f07WWTLHp6osNZIPXcaVnGZcYxE3k9eKtL1MyUsxczz0DeN+tqw
         7EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589509; x=1782194309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=q3of62UFyaeTIHkSYvX1IO9Nf12rby8W6uVe6vxwzr4AQsSHO4o2zwynlkdCbVrShT
         r76uv4QeCO9zB3vPW9hpCG96YmV4UD2keVblUzPlmBFModpQNUFOTrYuhsdlJCfcLlqj
         mbNmOuTbxEFIU/TuztNTNDv8AkQkZv5VtGygMwLnNOUHkoA8Wt1/5Aa4Cszmq1rTuae/
         15L6Ag8supKU7WAJIk3PBJsrjrP/zD5ZhS5aQQmgAKVpkjHFv6Ybd8NGyh1nh1cpoEiN
         vkDHW+isKKqY4U38+KsE5skIjKke0+2qqRVK7CfEcDq31nzaol+ZHq/52SwjfaJHycJT
         6WJg==
X-Forwarded-Encrypted: i=1; AFNElJ/6BjnFJrqURAhZah8HWjxU3e9ruCbwMOCneAvbt7qt9mZHZyETYhhA1lXhzZeL0Vi5dgzn7xALuNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYEEs9VhT1kJMt9a1qlXX6aBf/wpNYpDwHIc68l+nmux8xBjvK
	hsVYgUO55bNsyOj3jlV6Vw9xvZfPH3CNhGMa7J9Z8xkRp0FwXqedXTLz
X-Gm-Gg: Acq92OF7lFgrD00SyznHG700vWxctogPSm/94hBymk6gQRHUwkEa7LkGG6CqlCDhv2A
	wOcjeBEdIFngxkB3VuKolCci+Shzlum6aRRhtMdRpSPSkFd8KitrAp3ES/4Xwq9Q1d6fTkZu3EB
	aU87+WLjMbSBnmWbv/sQV/z+cPee9C+IzOUuESW21bOblBY5AQunCdz32vbTu9ADXE2PowPnPsb
	B5d/tO1ZSD4Vh5Pssa2tOpyngoNvTHXUqCKqdUYwFaLVOaS2B6OY0Od5SNq5wGBknAnwHS6Z51w
	N4DnIU204IarVPdwsO0ux28QNNrbUH3zZlTaNA0NzLTAGp/FqFTn54fKMqyfMuUA7F1+xdNnSuf
	SfEb7aWXb4hQP5YV0iQTJnj+uuLLBKH9aM/q5RNSlBjzOXsJHnAvkjUO7UKRLXjWvrbTHdZlITp
	FijkCD2crS788=
X-Received: by 2002:a05:693c:63d4:b0:30b:6191:7f96 with SMTP id 5a478bee46e88-30b6191bf72mr3509252eec.30.1781589509451;
        Mon, 15 Jun 2026 22:58:29 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm18135283eec.15.2026.06.15.22.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:58:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:58:26 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
Message-ID: <ajDmAmq4_hYCDEfp@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof>
 <aioJ_5SIXdGQg55R@blinky>
 <87se6tejoe.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87se6tejoe.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_225830_898325_2DE58DAE 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Jun 11, 2026 at 07:21:37AM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
> > of the data is generated from the riscv-unified-db and because it is in
> > the Ziclsd extension, c.ld is included for 32-bit in the c.ld
> > description [2]. 
> 
> Oh :( We probably should amend the base spec to mention that.
> 
> >> > +        compressed_name=${name##c.*}
> >> 	   ^^^^^^^^^^^^^^^
> >> 	   this name is misleading
> >
> > That's fair, I can rename it to be something like "compressed_inst"?
> 
> My issue is that "compressed_name" indicates that it holds the
> compressed variant of the name. But it actually is empty if the
> instruction is compressed, otherwise it is the original instruction name.
> 
> I am not sure what is a better name. Perhaps just inline this to the
> usage below.

Oh I see, I'll come up with a name that is more clear on inline it.

> 
> Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
