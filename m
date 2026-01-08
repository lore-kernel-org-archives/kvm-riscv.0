Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851C3D1D493
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWJCMX2mke2CagXZkFy5gOEkE88c1G7ppS7aM34FQnA=; b=J2ZONXWWBTnkUv
	1GvIawjYhrEQsBbRO6lF+2KTIFONAZL2Z7dZy+AuSrvZx9aMxppRcoUcY9Aqo6S4hBt80BNZcLnys
	GZ3WI4ic1Hs0oj/vNf+OkzEIXJnt3nvRtI/cyP7xv83yduPfKw65xk1nCXHE6GqzqlPof8fMYYAD2
	jsxNcTVXkDHMkdMvzF9qUIstDy2DeChfFZ5rzC1LVo+yTzOIv4kobUwv3EweufdEL2ALSs4bFknVH
	kKezBOAtLmwBN8T02CwOE8DY3/VL76krHQgmV7iwffPVbV2boeNyAdLdWmvTKmgjD2Hdt5LzkVdHZ
	IauF7Yy/AKJCTg9RT2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwhM-00000000qKB-1aRU;
	Thu, 08 Jan 2026 20:33:36 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwhK-00000000qIu-0XhO
	for kvm-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 20:33:35 +0000
Date: Thu, 8 Jan 2026 20:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767904400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lqob6m0vV00E9z3vAvV17AnmV6r8/G5JFmQWsGjfzkA=;
	b=GvqDx8b6D94Zu6W4aoe3fj7eBDt43YEIRHeVXWEDmqy3M3ZbHQ8fO0XbIiq835vHQYDrxZ
	wrABcteH8d9vVTOnXbd3ossltQFBNjWJqxC03UmTyzAO4PXkQMKCPGuCASZqRT+HP6WVTv
	TbJqonNWrKWTeTTIaEw3Qz2uOrCnpUI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
Message-ID: <542ogwlbwiajdw2txep4ra7patrsnporvruqicuffazlai6drv@ybperj2axkl3>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com>
 <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
 <aV_3-lhnZ-MoKnjv@google.com>
 <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
 <aWATlfisv8ZVZi0c@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWATlfisv8ZVZi0c@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_123334_307714_5A5DF7FD 
X-CRM114-Status: GOOD (  20.93  )
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

On Thu, Jan 08, 2026 at 12:29:09PM -0800, Sean Christopherson wrote:
> On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> > On Thu, Jan 08, 2026 at 10:31:22AM -0800, Sean Christopherson wrote:
> > > On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> > > > >  	/*
> > > > > -	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
> > > > > +	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
> > > > >  	 * affects both L1 and L2.  However...
> > > > >  	 */
> > > > > -	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
> > > > > +	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
> > > > >  
> > > > >  	/*
> > > > > -	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
> > > > > -	 * 0xc0000000.
> > > > > +	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
> > > > > +	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
> > > > > +	 * respectively.
> > > > 
> > > > Are these ranges correct? I thought L2 GPA range [0xc0002000,
> > > > 0xc0004000) will map to [0xc0000000, 0xc0002000).
> > > 
> > > Gah, no.  I looked at the comments after changing things around, but my eyes had
> > > glazed over by that point.
> > > 
> > > > Also, perhaps it's better to express those in terms of the macros?
> > > > 
> > > > L2 GPA range [TEST_MEM_ALIAS_BASE, TEST_MEM_ALIAS_BASE + 2*PAGE_SIZE)
> > > > will map to [TEST_MEM_BASE, TEST_MEM_BASE + 2*PAGE_SIZE)?
> > > 
> > > Hmm, no, at some point we need to concretely state the addresses, so that people
> > > debugging this know what to expect, i.e. don't have to manually compute the
> > > addresses from the macros in order to debug.
> > 
> > I was trying to avoid a situation where the comment gets out of sync
> > with the macros in a way that gets confusing. Maybe reference both if
> > it's not too verbose?
> > 
> > 	/*
> > 	 * ... pages in the L2 GPA range [0xc0002000, 0xc0004000) at
> > 	 * TEST_MEM_ALIAS_BASE will map to [[0xc0000000, 0xc0002000) at
> > 	 * TEST_MEM_BASE.
> > 	 */
> 
> Heh, your solution to a mitigate a comment getting out of sync is to add more
> things to the comment that can get out of sync :-D
> 
> Unless you feel very strongly about having the names of the macros in the comments,
> I'd prefer to keep just the raw addresses.

I don't feel strongly :)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
