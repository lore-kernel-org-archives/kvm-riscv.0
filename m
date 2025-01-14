Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4928BE77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB1akjebW+GHXxnkMEppUyHcRCTVK2HlgPktSw/YWww=; b=0Ycb/p8W7DL/Sb
	Zusp9IhvisKDMumoUtd68CwJShsNCuJts5eCT/CCDZFnWvogq0HkXNzHy3/plJGw8RrPap+EHJxub
	qzfNgpZhf4YlI6jxnTt0VIOiF6H7gdlEPnEdam5NzI33LVXOcACVSg2JvG9urRJtw6R5xE7yYRLU1
	zMtdkmkJRC/erNKxV3gQk12OXuUBaBjBXXhnV2wpb2SHjTfn7aNH0iMdPFfXGi+L/G7ysT71bloAv
	zl5JydN2MIeE4Mazi1whKfTtEMboIRz/B3Yi19riJmYivAz/pAyczg4GcvlQUzImPd0LnumMWuVMj
	yeo+Ey6jJPt/yjPz9Z4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXm1g-00000009T3M-3eM7;
	Tue, 14 Jan 2025 18:52:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXm0d-00000009Swa-2VoL
	for kvm-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2eozFwwdtkEYzJ2hyZvHDykhTKQHMj/tbtFgxiV9nmk=; b=HV/2Lg63juuM0uluBIc2g+wJLs
	ItaXQGSuguGXhjnnbJglBjSDkvcdNOlpyks4FoUc2xkOk1mrvA8PCZJoBT29XeJrKowVim+3srRIq
	/2hrkVD0uQlTbuq1f3AZkm2x4TUOFgKnBQ0gn/csuN4Bz792qihuw95lhLcGyYIahMPmplyVE+MLa
	wTb+7bBwVOFz3aCWqXpQ/h03IWSmXA4917hrPt1qppngMv3eublvFoCHfV9QYYiJr0TArGGLxc9On
	vcLZqGrf3FM1JFTfdI5bMLdUOKviJxugC3/nk3gShIP9UYP3LxWhSLcoJifyZITYd6yOjNTKKFoLy
	pP2OGOug==;
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXm0Z-0000000AYiO-3GC8
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:51:25 +0000
Date: Tue, 14 Jan 2025 19:51:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736880667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eozFwwdtkEYzJ2hyZvHDykhTKQHMj/tbtFgxiV9nmk=;
	b=bDwVpiqwthykPiL4DaZF3p8XdHuWrRCxyc+t3QoVxlq9WllkrRjz253Cd2sapgSU4PpTuG
	DBtaCXDW1u7il2zRd6EYwHlzoZ1xsuWES603N8XxALx+eGQSDb769jEfu92II30o+alkaZ
	mznHVpGOOinL8YdOWHkCwYRK3h0Supg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <20250114-a36510d222fc3410b9b7654e@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
 <20250113-45b57478be2241a35ffa1b67@orel>
 <Z4acKHEn/dE0yLM2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4acKHEn/dE0yLM2@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_185123_966692_2BAA0F8C 
X-CRM114-Status: GOOD (  21.32  )
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

On Tue, Jan 14, 2025 at 05:17:28PM +0000, Alexandru Elisei wrote:
...
> > > +# $arch will have changed when cross-compiling.
> > > +[ -z "$processor" ] && processor=$(get_default_processor $arch)
> > 
> > The fact that $arch and $processor are wrong until they've had a chance to
> 
> $processor is never wrong. $processor is unset until either the user sets it
> with --processor, or until this line. This patch introduces $default_processor
> only for the purpose of having an accurate help text, it doesn't change when and
> how $processor is assigned.

I should have said "The fact that $arch and $default_processor are wrong..."

> 
> > be converted might be another reason for the $do_help idea. But it'll
> > always be fragile since another change that does some sort of conversion
> > could end up getting added after the '[ $do_help ] && usage' someday.
> 
> configure needs to distinguish between:
> 
> 1. The user not having specified --processor when doing ./configure.
> 2. The user having set --processor.
> 
> If 1, then kvm-unit-tests can use the default $processor value for $arch,
> which could have also been specified by the user.
> 
> If 2, then kvm-unit-tests should not touch $processor because that's what the
> user wants.
> 
> Do you see something wrong with that reasoning?

If we output $default_processor in usage() before it's had a chance to be
set correctly based on a given cross arch, then it won't display the
correct name.

> 
> Also, I don't understand why you say it's fragile, since configure doesn't

I wrote "it'll always be fragile" where 'it' refers to the most recent
object of my paragraph ("the $do_help idea"). But, TBH, I'm not sure
how important it is to get the help text accurate, so we can just not
care if we call usage() with the wrong strings sometimes.

Thanks,
drew

> touch $processor until this point (and unless the user sets it, of course).
> 
> Thanks,
> Alex
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
