Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537EAC021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wA12vw99GkUvJZiAEYCR/xBHwQkTRUnQ3iYUcSLUB8=; b=OmohBn/jxyC4XU
	qFUpdyKGg5ac2MJJmuSAs6fAo5tM9R4PNba9lmFKnLhs2cOgyMB7BkwmPmoZbYbQ5vJKeORJRR+bP
	oaHaFoZ0foIW+XluNG90a6j2SYYUIRik5QQmYA2uJWldBCBmzJphmPc7cX9pUtz2tDovVkUHRQ287
	jRQblA8By8JBbF5uKVtHeh0SRLS+kRyfWdtZWOSkDnH+KtSC6suNRwTjec/WCnrAFdmaajQpyU748
	eg+nJiyWALAgWUhU9Ag6yF9LmZr8e10zKcMhX+tLfdEWBWnPeMQcDkRf2hIB00mY8vke8CbHxKkc0
	CepQ9LFr+/aaiL2C1tdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO7G-00000003juM-21e2;
	Tue, 04 Mar 2025 08:59:06 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO6V-00000003jlz-17ON
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 08:58:21 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so2714685e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 04 Mar 2025 00:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741078697; x=1741683497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+xt0a9MOKxcngTL6D0NlkBxMF5DrrijsvR0wGk0H/sc=;
        b=m9Ho3Xh59KL9D5Glf3hdBQh9CTTv722Enrqq/r7JwiT8IV19YAaYkm00+uBBWwcbLS
         pVX9abVCsPn8jh1OImIVCtpdfjvAm1Pmt28IUOjvVRz9DQ+jC8+rwGIUpYRh2ORXJQLr
         KEF/WiVVsu+wJmyhU5eldkLHisCMhHyhyFITNgtZ8QGI7MR5eoaHsFiNfMf420B1nhbZ
         qHKS8eIavMr88h9zwLgZOFqLdKMCvfDTI/nr9xzRLsIHOox/qjFHxSZTy8uAQu11/Kvp
         9PvD/M2bq9FpheRvlxy/nCVXJLuEKqngWaAGiYf6qXyX0kFCHii7KLtUcsl26ycYkzC7
         nVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078697; x=1741683497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xt0a9MOKxcngTL6D0NlkBxMF5DrrijsvR0wGk0H/sc=;
        b=mZsBluZY8ipVqU4zewiDtMjg2hzJtVmOIGPSJU5GiZbGv3ltG7Eyo3mk/QgcKeD4wN
         Ouv96qrx72p5FCGOcfloDBEZGMPtOWWmJXPzOIbeJGL4RygNj6Huea4iCeEFJ4XB8bfQ
         xFPNGWvNeYwNkXedyl2a4qTPSwtzfgMCN27uNDqx/Q4h8Zb1hsSb16ACMSP3ZW8BYxDr
         Zv8ekPbgZM6o7XuiUbPWVoglKwrm+BjDIRo9LMm2bbdSJE9tFp6CsvrHFtOn3OVQGXWJ
         bizpjck8UcYAT4xX1LUk2dCqi8lNdtAIyvgYzJjqA8jXDhPT+mTInNSsF3eFpgGFPYMh
         9CBg==
X-Forwarded-Encrypted: i=1; AJvYcCUOQRx+TV5NMtSZWh54ZYllIi1Qujrd61ctkfvwUPqZkrD7QkbQiRcQf2ABWtaWhtixz0zP/MbmJwM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUZetJJGnCV6tDKaS0jwaRVoHponksB9JlPFzTuCs+Z2kdKl6u
	AeaxK+nC8WGJmtvEYHvEnAKDFUjR9jdvjwgNz1h/GvNpa8XTwtBAKLAQlb7GWdg=
X-Gm-Gg: ASbGnctoynQnD4zQ+u352ZRETS5FuWrmqf1hr7tZsG+59zJ4oQQVBmA6w22oI4taSO8
	CW4vXLAImFICIZWnGmF+VUgsK9zFk4mvhNYNriLivcucWBvISODpGoPJvuyDeMoez4PkbyVaxs3
	T+AUiYRb4PdcbcS1fV7dhljE31UGkGVMhEXw0l/hyTjM0G8lpTyhBfK32NV/FnH520pU5sC9Yln
	ov0v9l4E4ZSUTPQCQtKlA0VHghBVuT6iVwO8DxKqKWsK46ZrtTvvg0H/Vn1HcPf74VWx6M0kC8j
	4PIOTSbvixvOhN9rpxfWegp4/8DHpzbE
X-Google-Smtp-Source: AGHT+IH6MvxZS60faFjjSE/SOwTs7ArGKMS/DI+pAYNkmL1uwIQZP3dtDN6thfBALwaicYstcm9hQg==
X-Received: by 2002:a05:600c:5111:b0:43b:ba52:bcaf with SMTP id 5b1f17b1804b1-43bba52c199mr77383595e9.5.1741078697098;
        Tue, 04 Mar 2025 00:58:17 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485e03asm17306599f8f.95.2025.03.04.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:58:16 -0800 (PST)
Date: Tue, 4 Mar 2025 09:58:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
Message-ID: <20250304-5a85b3a246f14f60f61a45e0@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
 <20250227-f7b303813dab128b5060b0c3@orel>
 <CAHBxVyGGw6Ur4Kdd8Vvwp6viKWPx64w7gNvNiUzmAGeXF2PGoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyGGw6Ur4Kdd8Vvwp6viKWPx64w7gNvNiUzmAGeXF2PGoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005819_296468_8201F403 
X-CRM114-Status: GOOD (  12.83  )
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

T24gTW9uLCBNYXIgMDMsIDIwMjUgYXQgMDE6Mjc6NDdQTSAtMDgwMCwgQXRpc2ggS3VtYXIgUGF0
cmEgd3JvdGU6Cj4gT24gVGh1LCBGZWIgMjcsIDIwMjUgYXQgMTI6MTbigK9BTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIEZlYiAy
NiwgMjAyNSBhdCAxMjoyNTowNlBNIC0wODAwLCBBdGlzaCBQYXRyYSB3cm90ZToKLi4uCj4gSSB3
aWxsIGNoYW5nZSB0aGUgZGVmYXVsdCB2YWx1ZSB0byAwIHRvIGF2b2lkIGFtYmlndWl0eSBmb3Ig
bm93Lgo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3Ugc3Ryb25nbHkgdGhpbmsgd2Ugc2hvdWxk
IHN1cHBvcnQgLW4gMC4KPiBXZSBjYW4gYWx3YXlzIHN1cHBvcnQgaXQuIEkganVzdCBkb24ndCBz
ZWUgdGhlIHBvaW50IG9mIHNwZWNpZnlpbmcgdGhlCj4gdGVzdCB3aXRoIG9wdGlvbnMgdG8gZGlz
YWJsZSBpdCBhbnltb3JlLgo+CgpJIGRvbid0IG1pbmQgbm90IHN1cHBvcnRpbmcgJy1uIDAnLgoK
VGhhbmtzLApkcmV3CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
