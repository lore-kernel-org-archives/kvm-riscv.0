Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12313D1D493
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 20:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eV5TIfRGrprV9mNPBVQ7MkcGY/kT20XjIeJeMISnbws=; b=RYoAjq0kQQFadQJpiGM+RkPHFk
	893cZDrjPyKKWil1JlUhp45/4l8jif+QG0rGxPxltRsikYohvIZ+jxY3TtTXf0EjOXfuWeLST33gr
	MlYxzYbcuQ+3JT6dPCsOxhpvlAYt0Izuqa0oVWBLeE+5KONiwoYqx1aGjoeKGfxIEDNdElpE5pcq5
	fVvhVZP+xel5dpIEx+nTV8xxkjJ6LGCFLVTuUNjfUBkRp6pO9lXIW7+QaqsSEOFBv0cB625028sv8
	q0+RVz9j1qtheeOQjsZPxcQvHvM6luzUzSNrQFd0p0XAttdBbUZxlV8Gunr+TPVYPloYpGuqk2oOc
	IKooeLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwdA-00000000paB-3FHc;
	Thu, 08 Jan 2026 20:29:16 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwd7-00000000pYW-16hn
	for kvm-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 20:29:14 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso7334253a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 08 Jan 2026 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767904151; x=1768508951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncr9wQixKp0DuZvt8wQRxeDUwFvl6Ym9a7uU4tCK5vA=;
        b=Ej+vC5yU7yywOXnKItyW3jPZYoTWAJ4F4cbEMn1Ag3mlW5ZQQ1faJ4du/uISaWLnvo
         +sr8zBeNgJ+YDTEEOTH5pdRLrLusgUa3T3JRrC1fLwQnzDkjszh+AeIXTAm1B8gzH82f
         fLQfMxC24eI8hOTs8MTyYNis9WEvtvETR/cYAseURPuijN9EedjC01ilEutJf6d44NiA
         oyXMdxOfDiTfC6ccxZ0wNxKWGTAHZR0IpuoF3cRBPZhyMc+MYajA8g0CW68fl3CbFe3l
         1L38bq34Xp2So8L3nygdATb39VpglY2RP2DqO7JyLBtQv/b5YCG1SvjbDg1ui+xhbI+9
         Ntfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904151; x=1768508951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncr9wQixKp0DuZvt8wQRxeDUwFvl6Ym9a7uU4tCK5vA=;
        b=UGC/wy6wuZVrHZ3kzUCTg6vjOIS+xG6YJ9qoG/3PlhqWTazwZEZD/pLhL3garc9Ljp
         iIu3ttbkyWGuH5pPWh9kTqkIdkkFc9teraxy6diWh30Pf0RBlhvbKJSO1ZgH1qLZgCRZ
         XjWBx21NcY0jOKVVlp2fpzmRLffnCbe82gMBbmzIHvx3pqt83BIDIA8r6DXwqaR7FYqQ
         KMseowBhkCRD8jsZKY8e0EGwsiOjZl0ouUTOyDwykQyhoBfBKiU62p/9SadEgagMFxbj
         2WThCW8vFIRsU4fJRqihou6E9H4kgUIJAOt9+eI4O0oYqB4f0SSCCNPdiTTZc0CYG12e
         CvGA==
X-Forwarded-Encrypted: i=1; AJvYcCVBB1jkcGM0nTxCr2A0+zOE3mmdriMtqhHTYIwncfLS5jCGwDV0CBzsK6Cz/0AQkzIKX9h0hcIplwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCHz0f44IuO8NyyipZ9sf4lS7u/f6kaqYNOJQMuIQxlGzvzw3c
	g4DCnkxg/mBYz7zORo9TTFWWut2dn38XqE2PBoq67Tlg5YPfeteCUe55pyvNxqyXz0vMKQNOipR
	WQ2HglA==
X-Google-Smtp-Source: AGHT+IESJ6DBGvd9XcEdp+Peyz/5rANQAvVoqUp8W0UHChsh0K8dNusc9fRWmWPXBczuvgljaqvYKeQ4Bc0=
X-Received: from pjop14.prod.google.com ([2002:a17:90a:930e:b0:33b:52d6:e13e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2647:b0:340:dd2c:a3f5
 with SMTP id 98e67ed59e1d1-34f68c30870mr6773023a91.3.1767904151387; Thu, 08
 Jan 2026 12:29:11 -0800 (PST)
Date: Thu, 8 Jan 2026 12:29:09 -0800
In-Reply-To: <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com> <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com> <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
 <aV_3-lhnZ-MoKnjv@google.com> <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
Message-ID: <aWATlfisv8ZVZi0c@google.com>
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122913_295799_2AF95365 
X-CRM114-Status: GOOD (  19.81  )
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

On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> On Thu, Jan 08, 2026 at 10:31:22AM -0800, Sean Christopherson wrote:
> > On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> > > >  	/*
> > > > -	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
> > > > +	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
> > > >  	 * affects both L1 and L2.  However...
> > > >  	 */
> > > > -	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
> > > > +	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
> > > >  
> > > >  	/*
> > > > -	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
> > > > -	 * 0xc0000000.
> > > > +	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
> > > > +	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
> > > > +	 * respectively.
> > > 
> > > Are these ranges correct? I thought L2 GPA range [0xc0002000,
> > > 0xc0004000) will map to [0xc0000000, 0xc0002000).
> > 
> > Gah, no.  I looked at the comments after changing things around, but my eyes had
> > glazed over by that point.
> > 
> > > Also, perhaps it's better to express those in terms of the macros?
> > > 
> > > L2 GPA range [TEST_MEM_ALIAS_BASE, TEST_MEM_ALIAS_BASE + 2*PAGE_SIZE)
> > > will map to [TEST_MEM_BASE, TEST_MEM_BASE + 2*PAGE_SIZE)?
> > 
> > Hmm, no, at some point we need to concretely state the addresses, so that people
> > debugging this know what to expect, i.e. don't have to manually compute the
> > addresses from the macros in order to debug.
> 
> I was trying to avoid a situation where the comment gets out of sync
> with the macros in a way that gets confusing. Maybe reference both if
> it's not too verbose?
> 
> 	/*
> 	 * ... pages in the L2 GPA range [0xc0002000, 0xc0004000) at
> 	 * TEST_MEM_ALIAS_BASE will map to [[0xc0000000, 0xc0002000) at
> 	 * TEST_MEM_BASE.
> 	 */

Heh, your solution to a mitigate a comment getting out of sync is to add more
things to the comment that can get out of sync :-D

Unless you feel very strongly about having the names of the macros in the comments,
I'd prefer to keep just the raw addresses.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
