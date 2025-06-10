Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFA2C677C4
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fr/gDNeOWCqupUhPkdmFG9HmmgWNp3nZK7OD7sZTkIE=; b=o+oYzid4nTsd7CNe5mxnbXx+6n
	IuJSLmZKhKH3LAWIGn1onTtAf0pPbBmN7grDvb91nvXSug7LBh7PaHRGpWyXWE8PGc7BVImHq+2Ta
	enqP2P82iwZWhM1smsLq+yrRKh9b3hO423w9CPAlhiwyQOSXEz8miWnpcBpHU2z+m/Eu0R94dn+dR
	f5FhNxPZYUTbg34FlrrjxDfu2rDJgelqulk0cb6/mHHvINGThcpDyXLqiYOgxI3iTf9UZAmJ9B0Yb
	4Q9PcN6ltWdbAJMX5RXvMCc285MFPSWp4sCL9NAgzq4whPVYTeX7VQiaJNKxCkfChwz/aXBBjTp5b
	/9aoEvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4wq-00000007xIL-3FtZ;
	Tue, 10 Jun 2025 19:47:52 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1dq-00000007RWl-46dU
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:16:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-310e7c24158so5423445a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 09:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749572162; x=1750176962; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cUiAnBaABBi8MmezG61ur8Gw02SUWXIVP1zr4GYN+eo=;
        b=SKO7jY0fjvuGMrkMjks9JK6uEH5QXDfNUOxQf9y5F2LQyXHtvoZ293GocCnkChdfic
         96z2Hg6bAqXvXnY2XBwuRGlXKQ90Cwoj2drBe6IWThvuKF7umwsqvmMdqCPJXtgE8gBE
         4VK9SLd0CvhLMvfVE9ErPGIDhXa0HAptVzMYPZryhRzAGqtjmsXyeqrJNMB3K60mN19N
         aq50d1YMvH+KH3FLvKM8F64xgKImfPC5wqNGR59mS5gfQkpidhHPgaYO/Uc1rn4G58mn
         acjclQXLWF7XRw1tFHGVW3h/jPBiGgHdYI6Srt0t3qjTJh+fu7UkUhcJ1Y/3lQAph1PF
         piVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749572162; x=1750176962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUiAnBaABBi8MmezG61ur8Gw02SUWXIVP1zr4GYN+eo=;
        b=sAU0SqRYZ4m9zjwv97XIdvKPDMKWJ9ObTxUq8OLqcW1RpxPmetXmY2+Svs/0/v4dG+
         F0JxoqJnzgeg1dDopIOBwnrhI6o+llnRMlzs9kmeHEns6IMu8xs+SN/cq9QqHBAA1vRP
         jtevhg7mVKdHioXqWRSiF1gRyZGNDF7ci7Kr9xcw9dsFjJNPdEjt+xbVp6CDmvDP3EY1
         k2hbydjCWx+7k0MNUWm6ZnQ+Vh/BqHLsSke4h4JYQ/JlejxdWRsCdx22d0PqUqSVAHrn
         GomDWIhZxytk+HN2YdBg6sHaaaGpeNqJ2M2nTp+btwHKyDi0qjgO4inTqMHHBvW/VclT
         MVwA==
X-Forwarded-Encrypted: i=1; AJvYcCV98E5oJbSngFxw5g3sB3l4QGGqMz9R6+BdTOdZxGaaBZHA7CmOew5VHwHK34QoLOVfcyqzl7ve2i0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaviF1ZW1lPOG4HGaBaf3Rz7Utv/AdoOXXZAq9YUIaSn87gFK6
	Poh1qqwIcAyNsrccEGMd0vaGEWmYqSsReNjypjBQRyx0SQV4rXN4teXcgRrvYLUdZzJhOKmrg9y
	f1nxV/A==
X-Google-Smtp-Source: AGHT+IFXepQ7WyapQC/S8+sadNNKa7dRlJl1xoZOq4ObQKiG309XNQlCV5UWTBLTlgr03UbH2Wtya4oGIg8=
X-Received: from pjbst14.prod.google.com ([2002:a17:90b:1fce:b0:2ea:29de:af10])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3906:b0:311:ad7f:3281
 with SMTP id 98e67ed59e1d1-313af10ad5dmr288344a91.12.1749572161888; Tue, 10
 Jun 2025 09:16:01 -0700 (PDT)
Date: Tue, 10 Jun 2025 09:16:00 -0700
In-Reply-To: <ffb5e853-dedc-45bb-acd8-c58ff2fc0b71@linux.intel.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com> <20250529221929.3807680-8-seanjc@google.com>
 <ffb5e853-dedc-45bb-acd8-c58ff2fc0b71@linux.intel.com>
Message-ID: <aEhaQITromUV7lIO@google.com>
Subject: Re: [kvm-unit-tests PATCH 07/16] x86/pmu: Rename pmu_gp_counter_is_available()
 to pmu_arch_event_is_available()
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "Nico =?utf-8?B?QsO2aHI=?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_091603_015945_8612402E 
X-CRM114-Status: GOOD (  17.42  )
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

On Tue, Jun 10, 2025, Dapeng Mi wrote:
> On 5/30/2025 6:19 AM, Sean Christopherson wrote:
> > @@ -51,7 +51,7 @@ void pmu_init(void)
> >  		}
> >  		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
> >  		pmu.gp_counter_mask_length = pmu.nr_gp_counters;
> > -		pmu.gp_counter_available = (1u << pmu.nr_gp_counters) - 1;
> > +		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
> 
> "available architectural events" and "available GP counters" are two
> different things. I know this would be changed in later patch 09/16, but
> it's really confusing. Could we merge the later patch 09/16 into this patch?

Ya.  I was trying to not mix too many things in one patch, but looking at this
again, I 100% agree that squashing 7-9 into one patch is better overall.

> > @@ -463,7 +463,7 @@ static void check_counters_many(void)
> >  	int i, n;
> >  
> >  	for (i = 0, n = 0; n < pmu.nr_gp_counters; i++) {
> > -		if (!pmu_gp_counter_is_available(i))
> > +		if (!pmu_arch_event_is_available(i))
> >  			continue;
> 
> The intent of check_counters_many() is to verify all available GP and fixed
> counters can count correctly at the same time. So we should select another
> available event to verify the counter instead of skipping the counter if an
> event is not available.

Agreed, but I'm going to defer that for now, this series already wanders in too
many directions.  Definitely feel free to post a patch.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
