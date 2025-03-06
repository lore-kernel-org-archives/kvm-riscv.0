Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5F1C282D1
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I9A62N7okXZI+d/koZci1tqGn38mO1302pLuTM67ivQ=; b=gi6F/uB0wNUH+K3ZR9qtVGNyW6
	MaZAHxqPxkbcbBTaOoDbJ2KBvQtZD4YUngoGtmcDgMzAppy6FHqSkZaAXONchESeABqGZSzonPy1J
	SP7wUwkRLEBg6tIOCIMGjx6d5/00hs1YqfefY4/G+KTkqLPyjLtXe9X6b82fXbF3fiorbZQafDEO9
	hGthrLoeNJuoH5rJzWn3SZTKOjDY+1h5R9At7N3nxRWDkP6/sKeJfRun6ofwWtwuc65MUcp19qP52
	8zzOVWeOEztHqzAAVKfwI5EZVNbjJYVsbclN+NDqijeD5O10C9cx69B/CtJP7Sq1crNKKLAIByyMS
	Hoppc8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJbu-0000000CMHY-0S8C;
	Thu, 06 Mar 2025 22:22:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJXN-0000000CLgp-2Htw
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 22:17:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22379c2e96aso35019925ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 06 Mar 2025 14:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741299472; x=1741904272; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1fVM2KE3EoOsuu2EWcqC1HC9DuBoPNNqkucuTCqqHCw=;
        b=bLByjMLIVg+t0vbqjDQmDbiAUX495jc4PFJGb4p/uKVak+CyiiUYcGBN0VnGPHcVZ5
         my7esb4mLBVQOEljnhhn1UP1OknwpG9d00ijlNVD/h9D5UPw353dof8mHPql/6wy0VuR
         CqqKtLxocfxma9S9pmXLno48wYM0PKYZRuNRFTpCvzd/huSOpKGEBHG9sOt52dTJDH46
         XQxdNipO3z6XNdCLEuwRjMaAoEwsjVghuw7NDyBBymbL8PQo2gk/VsMazbysHd5466ne
         YgIHwtVQKu2rtTv7lDvudmxr8W1cDVn0yk5usyrAczxPsGyD9kxYTRuM+vpDGwTcdbtp
         engw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741299472; x=1741904272;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fVM2KE3EoOsuu2EWcqC1HC9DuBoPNNqkucuTCqqHCw=;
        b=OGkWo4nJ9sFuYXvMAayicoYXJvkWsn6ix51LVJkPH8y/pNA/boFjRVqCryfvrzlca7
         ulwmqolRz6L0AZGZTjKDqV8GbQfbd+T4g0ShLHPt6tMTD26Sd/95zZrysXQflvjA6IMn
         S+DaTTIGnkmp8zILDxBGTVFpm81ycZaeb96fBhYXwxn8Gkfb9rBfj4uMGtnALQ7+HNnl
         EnpTcQb3P/mS3M/7/txO/NlPtiW0fgNr4aWTzzZJVRhWFCgI8g/wNagYg0krVO8ot8W/
         NIyjQfpF0XXq5UkummcbNjIaqWISSOPGLVU7fZ+fwQLwTM+JwT6Nn3jmGjdqm9ekxnAO
         AD7g==
X-Forwarded-Encrypted: i=1; AJvYcCVHHr9KFlfx/mMPXN8oqKJedQQop3GPi582kiEb9QpDdpXzUkWBS2Odz0OIXxQ5zx3pR8XSa99umX8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi75gKAGAtDW5GHzV7bMhZOv2AXdkIEsAFtBeL966me95+nLdf
	8qK/XYRCgdpfQyrLO/CbaLnUn4qU/OH878Z2qOBNmjkElCM5hDDdTD8klLdshEyTF9NHI/eWt/e
	lvQ==
X-Google-Smtp-Source: AGHT+IHj9hf+RSGnxoRCsNAWfapX74dbG0cv1fVCIplmAgCoqTHkKkEEOlwzNxPnN2S64GQaJbv4Oc/F+lY=
X-Received: from pfjg21.prod.google.com ([2002:a05:6a00:b95:b0:736:415f:3d45])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b4a:b0:736:a8db:93b8
 with SMTP id d2e1a72fcca58-736aa9b3970mr1923671b3a.3.1741299471981; Thu, 06
 Mar 2025 14:17:51 -0800 (PST)
Date: Thu, 6 Mar 2025 14:17:50 -0800
In-Reply-To: <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
Mime-Version: 1.0
References: <20250222014526.2302653-1-seanjc@google.com> <a10378eb-4bff-488c-86f7-b4fec20feb6a@redhat.com>
Message-ID: <Z8ofDmVbhjfLVwQD@google.com>
Subject: Re: [RFC kvm-unit-tests PATCH] lib: Use __ASSEMBLER__ instead of __ASSEMBLY__
From: Sean Christopherson <seanjc@google.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, Laurent Vivier <lvivier@redhat.com>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_141753_597561_4CE8E280 
X-CRM114-Status: GOOD (  16.71  )
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

On Thu, Mar 06, 2025, Thomas Huth wrote:
> On 22/02/2025 02.45, Sean Christopherson wrote:
> > Convert all non-x86 #ifdefs from __ASSEMBLY__ to __ASSEMBLER__, and remove
> > all manual __ASSEMBLY__ #defines.  __ASSEMBLY_ was inherited blindly from
> > the Linux kernel, and must be manually defined, e.g. through build rules
> > or with the aforementioned explicit #defines in assembly code.
> > 
> > __ASSEMBLER__ on the other hand is automatically defined by the compiler
> > when preprocessing assembly, i.e. doesn't require manually #defines for
> > the code to function correctly.
> > 
> > Ignore x86, as x86 doesn't actually rely on __ASSEMBLY__ at the moment,
> > and is undergoing a parallel cleanup.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> > 
> > Completely untested.  This is essentially a "rage" patch after spending
> > way, way too much time trying to understand why I couldn't include some
> > __ASSEMBLY__ protected headers in x86 assembly files.
> 
> Thanks, applied (after fixing the spot that Andrew mentioned and another one
> that has been merged in between)!
> 
> BTW, do you happen to know why the kernel uses __ASSEMBLY__ and not
> __ASSEMBLER__? Just grown historically, or is there a real reason?

AFAICT, it's purely historical.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
