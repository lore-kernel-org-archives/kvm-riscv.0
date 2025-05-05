Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C6AC3ABC2
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 May 2025 04:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I2gc3nNEaU53GXZ5NEGLaodU5cqr5cTExu98pRSMKj8=; b=od5nZrRNPaFcgD/xyi2JROSE7s
	nNKXM/S4/lDKTngmOiEtD6DU4+sVMyApjth7uGEMml5oVnszA6Gq6YPrSNmhGHkSF6Y3N6bTd61Oq
	jID9hqhjoJuysSzYTZkiTL0oqxTf8rNsj8iL/lp5/wFaDaWgE+2Bvor6wJf9pWWr/W3yBVC0Lj0+v
	LkDmSi5CP5UssSu0/xYcY5+zF6HLxPbOlOdLzhWU2csoqzCvcLqpZgz7gNCzoTu52uDx1ZjxM9tO1
	FowmmFchEhRcw/tCGenHXlMgCFnVNdBo1BAPtxaN+hWmct2ZjFUrgEFGDIT3PedIsfg7EdApUfcE2
	DsRBR9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAMt-0000000AK2T-0WtL;
	Tue, 06 May 2025 04:57:23 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5CL-000000092wM-0AYr
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 23:26:10 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4123093b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 16:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746487568; x=1747092368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4cNJ7zUGr7tO+W7VEbJ8gglNZQhXjP3xsTkrEaO8DE=;
        b=si0x0RcpgosbSGQa672FgtWarAd0P5fqpUsCQKTj26tdzhI47gZkT6ppDfMKz61T7y
         RGiFzemT6YI6sfESjzHzlXFKyLSXbO+5dlAubrDzmocaqYAMZQNxYeDosBUUczA7v0NB
         sDOe3rl/tlipc7BUG2REsM+xq6wZVlVkPiAKH6Nak6n1AmgL+xFCS15/RfUnO6Gy51II
         1ApaWZf3f8QNpF6Hdr77GCAAW74/RMVrC++bvF00XIyPEiYeZZVVbkgs6d6MnqiML/+Q
         O/XCDQh7+pNXEyutGfw5dYEGL1Qvxe2eIB/v2HSFLPrpXWg6tJsg0446EC4CoemipwLX
         Qj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487568; x=1747092368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4cNJ7zUGr7tO+W7VEbJ8gglNZQhXjP3xsTkrEaO8DE=;
        b=wur1BbFJzJCnAl7SuLNacKiUSDYIDEzS/mgWB7G+OF8B825Mg3MhJQksDcMDGXRb+0
         fpoQoLwyTDB+crC/t6QgI0JPZ3lyL1tl715SLoqowUa93YuGzehyFeC+NrWYXop5t+T6
         mXfs9OnNxmU/ns5U6OI1D7USB7qp2g5cJ6+oMgHltdUaUNYDUFAxyGixAGzLW5/BZCyd
         1nBzJ97qKlJQcGppUXUvrZ470FUyqFHMrPvHQ+FPdtvVXvSYDck1d/nCl/PjGd5ljAMx
         gUQSd9ETyZReP6PYrQKoSmiBQ+182hwfCn7l6VsP+DY1sik32qYmLa7CI4mRCB4ZRXEg
         pIPw==
X-Forwarded-Encrypted: i=1; AJvYcCWl42pz54Pm95ROKIB+06aq9/iBvdDRWjavPWQgXWVpGNiyDPKaZZAaF8LO0f9B00ypuIEX0fOIojk=@lists.infradead.org
X-Gm-Message-State: AOJu0YylVps7l0p5DVuhfFT7KNhWZiWvUeWuTjmpd7BYM/uE/KPzDhi/
	vAMwfYFw40uT3Qykb6a457jO+K9u1/wG3Q4LEH3gbdnnt72P8zGzEYfgctU/zb7yAaTvmKu9xP1
	kxw==
X-Google-Smtp-Source: AGHT+IFs82iZrMFUBe/Um77R6mZCtOyNM2zzn8fFKGEUvfFdFbOehTmWdf7D5nF7WYhoGzjYDtAoO24FpnA=
X-Received: from pfoc5.prod.google.com ([2002:aa7:8805:0:b0:73c:6d5:ce4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:600d:b0:736:2d84:74da
 with SMTP id d2e1a72fcca58-740919e16d9mr1113768b3a.10.1746487567641; Mon, 05
 May 2025 16:26:07 -0700 (PDT)
Date: Mon, 5 May 2025 16:26:06 -0700
In-Reply-To: <20250505194836.GB1168139.vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com> <20250222005943.3348627-3-vipinsh@google.com>
 <aBKWmRDBrjeZhAW0@google.com> <20250505194836.GB1168139.vipinsh@google.com>
Message-ID: <aBlJDjBe3LXT8mbK@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Create KVM selftest runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_162609_105355_3B9C54A7 
X-CRM114-Status: GOOD (  30.93  )
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

On Mon, May 05, 2025, Vipin Sharma wrote:
> On 2025-04-30 14:31:05, Sean Christopherson wrote:
> > Printing the timestamps to the console isn't terrible interesting, and IMO isn't
> > at all worth the noise.
> > 
> > The PID is nice, but it needs to be printed _before_ the test finishes, and it
> > needs to track the PID of the test.  If getting that working is non-trivial,
> > definitely punt it for the initial commit.
> > 
> > And presumably INFO is the level of logging.  That needs to go.
> > 
> 
> Instead of removing timestamp, I can just print HH:MM:SS, I think it
> provides value in seeing how fast runner and tests are executing.

I can probably live with that. :-)

> > I think we should also provide controls for the verbosity of the output.  E.g. to
> > skip printing tests that pass entirely.  My vote would be for a collection of
> > boolean knobs, i.e. not a log_level or whatever, because inevitably we'll end up
> > with output that isn't strictly "increasing".
> > 
> > Adding a param to disable printing of passed tests is presumably trivial, so maybe
> > do that for the initial commit, and then we can work on the fancier stuff?
> 
> You mean some command line options like:
> 	testrunner --print-passed --print-failed
> 	testrunner --print-skipped
> 	testrunner --print-timeouts
> 	testrunner --quiet

Ya, something like that.

> I can provide few options in the first commit, and then later we can
> extend it based on usages.

+1 

> > A not-quite-mandatory, but very-nice-to-have feature would be the ability to
> > display which tests Passed/Failed/Skipped/Timed Out/Incomplete, with command line
> > knobs for each.  My vote is for everything but Passed on-by-default, though it's
> > easy enough to put a light wrapper around this (which I'll do no matter what), so
> > my preference for the default doesn't matter all that much.
> > 
> > That could tie into the above idea of grabbing keys to print such information on-demand.
> > 
> 
> This will be very involved feature, lets punt it to a later versions, if
> needed.

Sounds good.

> > The runner should have an (on-by-default?) option to abort if the output directory
> > already exists, e.g. so that users don't clobber previous runs.  And/or an option
> > to append a timestamp, e.g. $result.yyyy.mm.dd.MM.SS, so that all users don't end
> > up writing the same wrapper to generate a timestamp.
> > 
> > Having a no-timestamp + overwrite mode is also useful, e.g. when I'm running in
> > a more "interactive" mode where I'm doing initial testing of something, and I
> > don't care about
> > 
> 
> We can provide user an option like:
> 	testrunner --output result_TIME
> 
> then internally runner will replace TIME with the current time?

Why overload --output and then have to do more parsing?  I assume adding options
is easy, so presumably --append-timestamp would be just as easy to add.

> If user doesn't provide _TIME then we can overwrite the directory
> provided.

I don't see any reason to tie those two together.  Again, on the assumption that
adding options is mechaincally easy, I'd much rather have --overwrite or whatever.

In general, so long as it doesn't meaningfully increase complexity, make the
interface as flexible as possible so that the runner has a decent chance of being
able to handle whatever use cases people come up with, without needing constant
tweaking and churn.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
