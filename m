Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B1CCAC59A
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RaUWUoCmddybazMR1N1WIBu48jBzZWY+CNb9ZGtXO7A=; b=XZUdlU9aDPzEDy
	0pItGR5FGvYziN5hq3VrWI3N4/G/g62lilbeo9P1Kb11VPjEHxegE8AEh94s+wTZoRtqfErdSH716
	ckF40NT7FnADGlqvVOiW3zyeIjVx0PwuAHHRG+Yeu5l6LBBW3jgrKQbL8nOCwccPtMxeOlCUEgv2c
	bv7JaeVcUNf7fDjfTkFRYR7G8kN0RooiAS8LkyBuaVvkFcTNIzJv+xkLM2RN15jKTNczPX2S0YC79
	U33xCdfsWVH19M/M2EpS3RRaiO9KTf7SALxqyh4xz73KnSHi0l24wUqbLCCpg0Y+17oAd1Zy76gYO
	cjUcfpTOEYkjJotPoMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYwd-00000002fOj-2Knh;
	Fri, 19 Sep 2025 11:06:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzYwa-00000002fLg-0wwo
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 11:06:25 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3e8ef75b146so1812341f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758279982; x=1758884782; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0gpwB10/6E2U+Sby0w+MPfG8NeegflF3tJftb7joqA=;
        b=VUtf2s7y4ZZo6G7Hdxk/FFG/EzAvPofX7FzNwiT4+d84a2YoM1+3k2QX99VNINprLV
         L9WvjDbbZafXnAJnvvNlDxmRlmnC7rLFfwbZU215RiW64gPvEuaSj0TNRnFNpOQwV8Yt
         w18f4bDrNSrRNwzxHs6APqg1XCxHTh8J3vPy49rdIOKZeB1meicLDHK3BQPoqGHKeW0B
         XaWatks9jUTgEkOePugNo5lYJk0+KaRy5nXDyWZxdWL+QPSVEsnddcHkpHlHZnmmYPfe
         So3g1d6ZWwewXppcYmDXHJdQKqTOQe2sFBweNQeFfDNzO9Yg0c6QrWUmYrFPByMkmIYT
         JXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279982; x=1758884782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0gpwB10/6E2U+Sby0w+MPfG8NeegflF3tJftb7joqA=;
        b=iz195bn25Lh6szVEM63B4xeKbnCxHc3cJ8jBDhayLpQ7f4eFPuRV5LYP7fTDSxBsUQ
         8snP6SxvvOK1MZlxUZIWsWoTZrgl0z+/HyS8+iauEe8A8WISXrNo8ZP/zp5dIg30A8H2
         WjJr1nEZxqf7pPHLSkxBEGzePN7/wDvtQH46LSHhzxtqMMguNy1gXB7VG02i5WNtKid5
         Lre7DGPYtIZKNhfKhudTK7FP6FpdXQqTveNncNS5BvMvIedYEE464V9Tv7DOUTV2TQwG
         X+dgJ0frMd6gY3OI1wvlreO8DnGEcaHTvKSah7Jnd+oRo+haVD9SEnYbWhERBSz8AZ29
         M/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEuNnP9QCC3lgnfajmfJbO5uANbk93owCvopgTFGcjPLdPBcup6YaEqFgrvgxGZjE9ln1/Q+DF1lg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKdmXo103hSsoU9PmVbMGf2TP8h8cjPOz+budU3Vgoa8KJ0ib
	Se5yHUJnhRqO7GteLR/nmDICJPaq7t+/V3SPTZpiKW+hwNsmyRKmOhOn
X-Gm-Gg: ASbGncv74l7MQELx7ib2ib2Lw6OSeWSbN6HwYg3NovJcyishDSFkWjXFNQ4t2iKRwTx
	bTfng70SuQ6NNaQhy0Kj/fRPDI/FH3HRr1dIJ9a/LFbG4XUQ0GI0riHms6Joy1DZXAOzoO9KkQQ
	xw0kTCsNkQWZXRi/BmQmiixBsPh8bvT6Oe848wfgAQdxuRjwC4ee9rVgmAQlcPC+BlW2DLlWcHd
	CNdfdBpjGElSCUzOMg9K0bztjVkLGjBH0MVbYBk+sOz3DUx+oXzIlC73woSjNbB6a+lTB6Ug7T+
	crB8MrbCjvXQoKE7le437RINkZPtQhCpHsydtYopQ5UC6dd/S+3xj8M5p5XjaS5EBfLkSm8SEvh
	3v/2f6/rPGuzIyzS1+T3a
X-Google-Smtp-Source: AGHT+IF2Z0bInAWZqDYYETRVnCkFEjbkAn2Fex4pkyig1CAMuVquXF5ao4cQ8XxsbTLy1k2XXr+50A==
X-Received: by 2002:a05:6000:2881:b0:3eb:dcf:bfa4 with SMTP id ffacd0b85a97d-3ee868a75b0mr2033940f8f.54.1758279981950;
        Fri, 19 Sep 2025 04:06:21 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46138694957sm139550595e9.4.2025.09.19.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:06:21 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:06:15 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	ajones@ventanamicro.com, brs@rivosinc.com, anup@brainfault.org,
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension
 support
Message-ID: <aM05J6FU0xG3SBzR@andrea>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea>
 <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
 <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_040624_280721_6558D688 
X-CRM114-Status: GOOD (  16.74  )
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

> > > (not a review, just looking at this diff stat) is changing the fastpath
> > >
> > >   read_unlock()
> > >   read_lock()
> > >
> > > from something like
> > >
> > >   fence rw,w
> > >   amodadd.w
> > >   amoadd.w
> > >   fence r,rw
> > >
> > > to
> > >
> > >   fence rw,rw
> > >   amoadd.w
> > >   amoadd.w
> > >   fence rw,rw
> > >
> > > no matter Zalasr or !Zalasr.  Similarly for other atomic operations with
> > > release or acquire semantics.  I guess the change was not intentional?
> > > If it was intentional, it should be properly mentioned in the changelog.
> >
> > Sorry about that. It is intended. The atomic operation before
> > __atomic_acquire_fence or operation after __atomic_release_fence can
> > be just a single ld or sd instruction instead of amocas or amoswap. In
> > such cases, when the store release operation becomes 'sd.rl', the
> > __atomic_acquire_fence via 'fence r, rw' can not ensure FENCE.TSO
> > anymore. Thus I replace it with 'fence rw, rw'.

But you could apply similar changes you performed for xchg & cmpxchg: use
.AQ and .RL for other atomic RMW operations as well, no?  AFAICS, that is
what arm64 actually does in arch/arm64/include/asm/atomic_{ll_sc,lse}.h .

  Andrea


> This is also the common implementation on other architectures who use
> aq/rl instructions like ARM. And you certainly already knew it~

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
