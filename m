Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F03C7115C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSrdBmBY9OabMbTDKD+YJpPxIaX0dPAKeXlrWCjFTUE=; b=RIeiRpaMWyG8j6
	KhZ9GDTgJ0ezstdWdvRwCXh1COaeO3riCr2viIv7jpDhO7ynvJ3cvL8Bd63we5Regwp61J6NV8dLe
	409wxMFQb4sjjHCo8Ad8KjhG2zI7SO6sW2yFCySdwAOlmnQzAmNwcbl4oejMG+nGkzxtg94rDYL4m
	U70FClk3tq3CRNPSg8kJ3HpnQI+1sARjo+Iz6m1fAi9XYzf7Bv+wcMqCZJayuteQioqzwDUe4SjMf
	HjNzLeiKaxjpQRK4Z8L5qKESvsyQfADuVfe7BydmshUpqbJgF70uslkSU9jOJzapyW0Sewpy6HH6z
	lo1QfF3+zkhgqPs1vaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfFX-0000000GCg5-3DTZ;
	Fri, 20 Jun 2025 17:09:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfED-0000000GCYm-17jX
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 17:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750439314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2JhiJAXkhU14Ll0oB1qiziLeU4ZWAaHmGVdfC2ondg=;
	b=ci7iFSHPot8XPMfAbdRDpON5E8NMyb/ktcOfS7oWHJUz9Z9nnKV3OKOt4mK2dB3EgAYKZ5
	/As03OWhw8kIHbNBq2/OLbt9XclaY5RcHEdZE6iVhiczKWc2z0ZAvRAQ57h+d0J/lN93H9
	C9R9j1X3us2sBXfFLn/pYwBeTBWU4iw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-v5OlgVhjNrmyCzYz303ovQ-1; Fri, 20 Jun 2025 13:08:33 -0400
X-MC-Unique: v5OlgVhjNrmyCzYz303ovQ-1
X-Mimecast-MFC-AGG-ID: v5OlgVhjNrmyCzYz303ovQ_1750439312
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso1164728f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 10:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439312; x=1751044112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JhiJAXkhU14Ll0oB1qiziLeU4ZWAaHmGVdfC2ondg=;
        b=aC9eFSe4qufBQ6C7ApEJYLRY0Ych3EgFpRm6b8mbPZ/9oWlI4Knc71ffIILfKPam37
         cVfYoXYWtDYNav+jAG1l4GleV/FiWZNj7GlV/Wn3n+YpCNuxuEbWE9wLrKMgYs4H3bBo
         JdQ/w3Fi9BzejZQapnAb61THcAWi5XkSIyuLOvkNGDJpJ/1bxiROWyA6wbv+ktsALtv8
         o705gk4ragvX/Oe/A5Vnx1yP2Qv/uHoPfvWlxxyEY7QJAOh3YCCiBOFWkTZ0xWguNfno
         Hc1KbQl5t4jw8H7dAm3I5st7A6naYwmH+nALQEk9F0TTVIF9K4vrGRW3Bw53IFgieR0z
         O3Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXG04Aw44z187KTWjQo64LwIWajy9SODbWaMxAEtkQ5t4CpfpquJgk8F8EKnUXIKhL3dn8oHiVcQD8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkZQ4BEiRoJq3mPdzq684921Y4p5mR5IcPEdyICGsNOTOH6L+y
	c7bQe27StorV5dmXrfTstRBMePK8IqZ7mXnQ801nFeRRBB927CL1yTvQhcLicTtsghUhoITLkOL
	NXLz+YDKUvzW25m/l7p1T4N8YYniouTUTB41SBCoOyKMUSjBdwk3F1Tc4wwLPyu1AoO+cMNOUvL
	5E+wGbwxorme1QuddsniM6WDSWT8o7dMDyZxe7sNOalA==
X-Gm-Gg: ASbGncvw1Q5UnkO3+eKvT2BXxDsc2Vm8PbhE6ACMJdYzOrWh8emeGbijtCy97at5jRg
	uUN/T+/4l4IvmjElhFNr9Kil0iAJYDPuw2+G+Gf2tSV6VXMUHwGvAW9F7/tIzKdXjPJHTr7GDI3
	MHZAI=
X-Received: by 2002:a05:6000:4028:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a6d12eb400mr3172669f8f.48.1750439311802;
        Fri, 20 Jun 2025 10:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IiJVica4CS4GrLqH/peAyHZsEjszEJMo8N5OhMmLN0zTZVLBNwPF+ffHrcbwAch+4I3rcLG9lKHNtCYnJX8=
X-Received: by 2002:a05:6000:4028:b0:3a5:27ba:47c7 with SMTP id
 ffacd0b85a97d-3a6d12eb400mr3172647f8f.48.1750439311454; Fri, 20 Jun 2025
 10:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
In-Reply-To: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jun 2025 19:08:19 +0200
X-Gm-Features: Ac12FXxYI2NgPN6AIYShUhEnPB6Bl3WgJoZhauSYbs8tPxyDZoJzys7gQd2IPaA
Message-ID: <CABgObfbTtTRYyTHbP7sduZFkB31EDvRmSAJKpQHcNugjAALV2Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.16 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JWzS4GAmCN4_pYcJDY6xTPMhnPEOycYLaXjp25GTaQ0_1750439312
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_100837_382330_0FDF6F92 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgMjoxOOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHR3byBTQkkgcmVsYXRl
ZCBmaXhlcyBmb3IgdGhlIDYuMTYga2VybmVsIHdoaWNoIGZvY3VzCj4gb24gYWxpZ25pbmcgdGhl
IFNCSSBSRkVOQ0UgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgU0JJIHNwZWMuCj4KPiBQbGVhc2Ug
cHVsbC4KClB1bGxlZCwgdGhhbmtzLgoKUGFvbG8KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
