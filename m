Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E33C83F17
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5dndon6dc2/KDBIHkGgb5rzCwUTNwzuxlv964wb6LfM=; b=GCZhKvrTNLu6awIRt31MZ/Yl0M
	oRHg0ObjMrJVYGeLuhIMmUhn+hzc6O3H7U1vZPDgtHjtI3sKyvAdqc9qIGfNOYXAV2EOQT7vb/03i
	w9XhyVhbnfzBElItMLL2mY9gDOgjqtK6YgdIKib57SX37petjcsZfHpQ542CHkINa3OJNI6YxTmUe
	00NlIU2UJmSArrmSa9wGcfj3yaueCdYWil5k9wa9plexu+vKF2ITtgRWn4stvG9/y/VwZ+lByxVdv
	u1kkePt/OpkpFZHIKhTDLv7PrtJ30XJbS8x+njxeipeZcDrPjLW5tVusR89ykW4VtwuZ8LADxpxtz
	sTT5woGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZf2B-0000000AJPa-15Gm;
	Thu, 10 Jul 2025 00:21:07 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZezn-0000000AJ9Q-02uS
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 00:18:40 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74b537e8d05so308653b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752106717; x=1752711517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzig2qiNR2jhkyqAnMUWUMLsoL1y25Rwtu/Ci6IzXQ=;
        b=yz/ahq3HwNcBRsTuRAaJaKVC4d5FgviGwmk52eAxurDJKlah4u19hcTy8LvAGNQkqh
         elZFe7oi837JWJH7XwY96i3/Rp9wBfXszs6KkwKWxMjJ5kj/F8GgkR0f9koU9oNFEII8
         u0pgyqAQE38RlLqBOf+bORxqXnDsCViUryiYLHnskpUit1cAdMKm4DX98Ku36mMRNVyM
         KqcniCDs2mxon9S0btHghlMm3ZpAXtQ4wPmp9ID36/v+HK2iWskQWsDh7YNUmME9E4Tt
         82ZPlHeCCNlonyzly3GxyecFnD3tHtd4wSRjSJkj4frouDLfVrIQP41EiDLOoEtKCIBV
         muEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752106717; x=1752711517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLzig2qiNR2jhkyqAnMUWUMLsoL1y25Rwtu/Ci6IzXQ=;
        b=fnqlZh2w7e6D8g3/KEaWlzqwvGclYv6VpAwdf+7ZqNYrg892IcnLWOolM49OoXD9Df
         qQmcunXspUPmT8v6Di/q9J88MYWcwtlA4RtpikeMJmr7cBoOAHHuLn33PqsrOFgGjNx2
         QOwc1F/OrHE33j03J5YTySBYn99lgINNm6cBfW3o8YwclakllLmP+VYP51jXjrlHlueW
         m1/EfGOLTEQdimKOaPI+bWmW2btAuopG/gcAwCFKddf8BMfPzzvlTz72hjf6/qkuttNQ
         fEfyfGtFPkf3HkIPshJ8wSFEXIctXfoB/Mb3vttSWcMnUWqqfXk0K3BZauCZHfO8eO5g
         NfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXqP98ZBy4/G9EHt81iiyg3/XkMDIoBVtBtObxaLT6EmAcY3MbW5w/LNLsAOwW0xWy20NmLs4Bvxc8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNAFbLXGXbJjMqWcRaMVeaOyQIqevXlBkZ0Y61OGDc5StsKEsQ
	4auumWP4fgQtiYF1dB953IzP37T9FYL+dQIiRxpoR3coikwLz8v/KbcvRkyIJDH3Ltx9MI5PePO
	to6wv9Q==
X-Google-Smtp-Source: AGHT+IGmcLB52wz+0J/dhZKKbkmNXvfa8dV1v82Mgkyx1EZoNNqGtWbyrclr+1fJ90IPY76axoD2ssci7/I=
X-Received: from pfme10.prod.google.com ([2002:aa7:98ca:0:b0:748:55b9:ffbe])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1795:b0:742:3fb4:f992
 with SMTP id d2e1a72fcca58-74ea64572dcmr6278110b3a.10.1752106717633; Wed, 09
 Jul 2025 17:18:37 -0700 (PDT)
Date: Wed, 9 Jul 2025 17:18:36 -0700
In-Reply-To: <aG71_sKK3jzIs0vt@linux.dev>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-12-vipinsh@google.com>
 <aG71_sKK3jzIs0vt@linux.dev>
Message-ID: <aG8G3GNi_PlqgvnB@google.com>
Subject: Re: [PATCH v2 11/15] KVM: selftests: Auto generate default tests for
 KVM Selftests Runner
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_171839_043102_95D8BA3D 
X-CRM114-Status: GOOD (  24.68  )
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

On Wed, Jul 09, 2025, Oliver Upton wrote:
> On Fri, Jun 06, 2025 at 04:56:15PM -0700, Vipin Sharma wrote:
> > Add logic in Makefile.kvm to auto generate default test files for KVM
> > Selftests Runner. Preserve the hierarchy of test executables for
> > autogenerated files.
> > 
> > Autogeneration of default test files guards against missing these files
> > for new tests cases or rename of existing ones. These autogenerated
> > files will be checked in so that during git-diff one can easily identify
> > if the existing test files for the same test binary also needs an
> > update. It also add new tests automatically in the default coverage.
> 
> I'm not sure I'm sold on the merits of committing these to the tree. My
> preference would be to prioritize signal to noise and just commit the
> 'interesting' test configurations and generate the defaults from
> $(TEST_PROGS) somewhere they're gitignored.

Yeah, I don't love it either, even though I suggested it.

> There's no amount of foolproofing that'll prevent folks from renaming a
> test name w/o updating the 'interesting' test configurations that depend
> upon it. Seriously -- I'm sure I'll manage to break it at least once :)

I was more worried about clobbering someone's (poorly named) default.test, e.g.
if the user modifies or creates their own default.test and the building selftests
overwrites their file.

The main reason I pushed for committing the default testcases is to avoid having
to figure out when and where to generate the testcases.  I don't like the idea
of generating testcase on *every* build; it's not slow, but ugh it seem beyond
wasteful, and it feels weird to dump files into the output directory that the
user might not want.

The obvious alternative would be to add a dedicated make command.  The more I
think about it, the more I think that's probably the way to go.  We already have
to `make headers_install`, so having to do `make testcases_install` or whatever
doesn't seem too onerous.  The biggest conundrum is probably what to put in a
.gitignore for folks that do in-tree builds.  I guess maybe we could add
default.test to the .gitignore?  That'd "document" that that name is reserved,
i.e. would help prevent people from trying to create their own default.test
files.

And since the runner supports listing multiple testcase directories, it'd be
quite easy to "install" the defaults to a dedicated directory while also pulling
testcases that are commited to the repo.

> On top of that, there's a lot of selftests that take no arguments. Not
> sure what we gain having a duplicated definition for these ones outside
> of $(TEST_PROGS).

The defaults are purely a way to communicate the existence of the tests to the
runner.  My hacky bash scripts for running selftests copies all binaries into a
directly and then runs everything in the "output" directory, but that has obvious
flaws :-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
