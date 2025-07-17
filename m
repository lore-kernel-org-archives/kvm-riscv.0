Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B31C83F22
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjfJOLOtogfxDCdZ4gx3iUD6KkHJXtRrkUsgCpqbTGc=; b=C4lon5hvHmHZ3t
	5NImrbamlMMx9rgxYyOBkaJ5twl6nJfbU6utw10y6sn+er1VMpuJjKxNrRK0zZq9v2mh5g3hspTV0
	nwRmNCaHVuSDtmW0E80sktjiHZnAxWJPB1kTrkHSQ1u1w/aXfHO/2DXwu8gOxvpPgB+XHhRSoRG8d
	emdLj5g29eq/0bd/ru+aJtQZG8kUjfXyH1gFwYLnAvRvWVTxv2rEKtVkn0zSwgdUYYj0mt7wnlC6/
	7ItCzZTJVFXPnSCaRZaclT1La7mzVG9j8xWHCMRDQmlw9TXYQsgnB7G6/B/aSOjHJVJRsH0IQQf2x
	HYZdXnFIe25MK+fKYuAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucORi-0000000AE6J-2gJN;
	Thu, 17 Jul 2025 13:14:46 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNLq-0000000A40g-3Icr
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 12:04:39 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-8762a0866a3so15627039f.2
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752753878; x=1753358678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QcVJX052LEXBJv99aAWEE5wFktIbYwNU2eZQCUhFGg=;
        b=mN3YVFZ9a2PINGmQgWpQFF83OOyGaPDs6NAuQS/X6sklMLg17zFifbwENgdOQ7ZLwf
         sJ8lh+gzio3WqM+Bd+/cZ0BIP/Qgy2qDJTLdLD01pph55XV4QsMo99jB5oqYZexb8Dl4
         QFQ3ruzoivR0VCBHyMX50b6oeHkrXfivwWX+HL2LL5NuQIXlNZF20xN9+Vasonc+r9E9
         JWnp68c4xi+mML26eFRaijEU56zPqgtT9Vy0Gk4lw0leN9YwRqUUc5z5qi4/SStDpIno
         UHaOgd02bolfCqf/6HRKz/ghEmdrWbEhAXHcIL+r5sv3g+zpFQJkCgmd0Rfygv8+9cwH
         0GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753878; x=1753358678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QcVJX052LEXBJv99aAWEE5wFktIbYwNU2eZQCUhFGg=;
        b=ekT6l+f0UgkYwmh3+mURBIhoVXlpYWZhUFWnFku+zAb72Bp99XxCU8xaAqfw+hpkuM
         Xgu4eP5ovBxdLRsSTEGdX63nl/cwRCmtfEryWxub9H3se/ZJZPnl0Fc2DicjE5M8TS8k
         TCACcNLPmIYhgUQIsoSgxPGAdQGtBT8Bkbb5zvN20wCVX2cTbl0inpuGaFuOedn4wuM9
         Ux380V3RqdM2Aw+NZcrHNxDzh9fHktpkeX7GBF5Spc2dOA3pYC5ysNa570hqXAvMGxk1
         50IR4bCrG5D57mnuNvoNsZJCIRCMCF+LuzX5pZzH/F5jkNkeLBlBBDZjBP72VI3nhgZ2
         kt4A==
X-Forwarded-Encrypted: i=1; AJvYcCVHL7hKxf3uuNvjrf1izWQMytT2MDlpsIY6qXUwITJhfP73cGdcQNDtIUENfpeDkF3qpModktSB8Lo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx947QqI438UkFgtC1xUYOO2m/LOBVCJDoH/rV6NpBCS/gcBZsY
	sLm5U7+Yj3c6LjmOUmFNbhjqWEFgUHe+61xefWC2YKoyrVacDOdRDJx8iDAvyfP9Xw+FfcR1vUo
	GM06n1BL5O53mia1B3mmCXf4bjOrI92xWNQUVKCwpLg==
X-Gm-Gg: ASbGncsBwo2szSPZKGMKAcfggD17cH68cqPWqTyBFrvT06eBc0O9nEfnMzIgsQc9L3Z
	+cQnMpDziY06bgxUCjOywtEI73QfOJKOfMmbIzIsCosmzRn/7QMxOUZwfr4yLzJ5ieWz8QGi6oM
	IHcyEjYELFUDe+y/uruzWJitoR7jOCMIs2righI0VbV1Xkm9p5hO76rafreQ+9w99qOJxUVf+Fs
	W/C
X-Google-Smtp-Source: AGHT+IHUjN0WtpcP4Ro+lSCJYUTyuKmTlKwKgPzpi8LVsCv5TFEcqprpyTpUikU7+qtzrB5+BO+NiFTYY7tWuiIfMM8=
X-Received: by 2002:a05:6602:7185:b0:875:bbf0:8bf with SMTP id
 ca18e2360f4ac-87c01356e4emr274220339f.5.1752753877857; Thu, 17 Jul 2025
 05:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1750164414.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 17:34:18 +0530
X-Gm-Features: Ac12FXwbyEoUlz3T8TSIi03E9WKp7zPs9qMqtNqR8ejTADSP2ePNd_lJkM8wKLc
Message-ID: <CAAhSdy3gYp7uc6ddpNxHhSQDRFDBMiUW3EOf695U77C2JH=HhA@mail.gmail.com>
Subject: Re: [PATCH 0/5] RISC-V: KVM: Allow zicop/bfloat16 exts for guest
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_050438_824550_118F6C95 
X-CRM114-Status: UNSURE (   7.59  )
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

T24gVHVlLCBKdW4gMTcsIDIwMjUgYXQgNjo0OOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gQWR2
ZXJ0aXNlIHppY29wL2JmbG9hdDE2IGV4dGVuc2lvbnMgdG8gS1ZNIGd1ZXN0IHdoZW4gdW5kZXJs
eWluZwo+IGhvc3Qgc3VwcG9ydHMgaXQsIGFuZCBhZGQgdGhlbSB0byBnZXQtcmVnLWxpc3QgdGVz
dC4KPgo+IFF1YW4gWmhvdSAoNSk6Cj4gICBSSVNDLVY6IEtWTTogUHJvdmlkZSBVQVBJIGZvciBa
aWNib3AgYmxvY2sgc2l6ZQo+ICAgUklTQy1WOiBLVk06IEFsbG93IFppY2JvcCBleHRlbnNpb24g
Zm9yIEd1ZXN0L1ZNCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgYmZsb2F0MTYgZXh0ZW5zaW9uIGZv
ciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmljYm9wIGV4dGVuc2lv
biB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgYmZs
b2F0MTYgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0CgpQbGVhc2Ugc2VuZCB2MiBvZiB0
aGlzIHNlcmllcyBhZGRyZXNzaW5nIERyZXcncyBjb21tZW50cy4KClJlZ2FyZHMsCkFudXAKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
