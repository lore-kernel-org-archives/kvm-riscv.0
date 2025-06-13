Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA27EC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJp0b5bSCSDkJ6x32A3xvdWGYuRr6s/hdHsc0ZxvYic=; b=b4/tMkyovSHo8v
	toG+/RRw/axJj79JI7GzwN8tOCHkuG6WzbZIxivd5337UkfqrPZUU2ZodaznXXGLIP0yegOwFJwTK
	gfKZr/iCV5doynHRtVXuSQD2/TqHPbqIu3ZzZeW2Vq6SvkvaArJvBlWH9E9M0vr1XMPvJMwzOEmTQ
	KHcooUiHQHproAbx0qVoQOK4fOgPoKgNeU0qtsQTfsYRYtMEkOI8hRWaazK64N7AFcXZ0hfFvja2K
	Lj4WDL7UdVPUPprTCbqXT+KCePMf/uQI+Lkf4rUBlCbnLmPuZG8u5p1h5X3bWz9dQFTUxeiA2yCNE
	JzJa+fh9CYcZX6gbhNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3Nw-0000000GLum-2QLT;
	Fri, 13 Jun 2025 12:19:52 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ3G3-0000000GLCd-2X81
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 12:11:45 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-408d14c7ebeso1215709b6e.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Jun 2025 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749816703; x=1750421503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsOlh25eLPnAb9J/+yH/D8rpShrHOWsq5A94rPdZuNA=;
        b=t4wqqxLv+G9VHSNxcmo5+Ime/K5g2vyEkrZ/6Hlai57qksZyZ4W/LJH2BQNYPse8uF
         9I7zE1B0YU6c+uF+bdhYI3w1N9P7Ee8BQ3A6nbACJQtsNIQg41pzF6YdHUoksaIADNAW
         U48B7ZqPs3km8sFJr1aQxcQad6QQUM44qs1E9kz6fCtY86BsZg/0udpof6Tx3JXOR5Ux
         733CSSj6VLmhvaUqlCbUG8lo5MLsOUPbZmdObzZH+wqvcLEnq8o91GtwAA12B59pHr7Q
         +4FMqiffGw7tGFdrcnCNLuQE3S1E8RFrTPf/kRSVB4E0VliulFci8jP7A/RBj2cccbG0
         u5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816703; x=1750421503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsOlh25eLPnAb9J/+yH/D8rpShrHOWsq5A94rPdZuNA=;
        b=S+5gpXPVjjB+Oh32b95Cbu8k457u1Qb/WnwgyHIeCi5iYkvnUXS67zuLwgxsUxlCJW
         CS8jzkTh8lnFXKKCr2ViuKALLbJ29WxRzp66BdmtGWSVhpfCa8bPWFXPyPsOF+gGm0LU
         rkolae0hAaOjMd08g0ulBY1+mHeE93Vl/9WJQorbPbPgy3CcCjdtXyPsDTOdyWVfhb/7
         3BXlAtfOJtUIkNI0KfmLVp6eUi7OcF44k/BhB6LW5Zt/GwmOtIb4OifZHQOXl4WpBmB0
         CybY9T6RlFyB2UjBM1lhazRUcha9xu21rxXeVJkYazofmBj9D79FWNxtjqBGq0SZ/px7
         fU9w==
X-Forwarded-Encrypted: i=1; AJvYcCUTpUS4RDnlndGFhCnPaDVn8nIgL2NU5VGYVSTwx96gjkRgqy7rTodejOOpjugBfLfsVZQAzXRazes=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcE4cwTP79vsZg4dKUkwUqVBY3zGQ6fQPsS9us1eOFzShvcJGH
	k1r7Qkwwh0jhqIRAw6vYTujV1S8YpdXvp4tly94ZdJHlobxxxQS/9eXyInU6rMGolcGQi37/GiP
	jIGAIoxdMsrCAefY4zlJ2agWrJ965ScK9zmTLChJ447t3SYfY8UiBkpI=
X-Gm-Gg: ASbGncvQkN0JuCZsoqSc9VDTNkS7mwiZJPHpxfvxyCzMGeix3cNH7Z7uT/FgujRO8o2
	jCOia0gRTQaDwVAEi/GUK4h9LcfNuOyDFeRHiBQT4qCtyYa28wr4N+bo6YSLWP5eVt7JP9yIk7Z
	remc1LVRLmKZoWiLporFLvqUEgLJa0VgneQgTpGsfN+YOt
X-Google-Smtp-Source: AGHT+IHJC1Pv5X0E431WwxEhgIgJc8iiqdlIrKoTpZ/T0clkN02QwfmvZZtxt0sqPjGUJGPFIV/xXPIH8smfAe45evY=
X-Received: by 2002:a05:6214:2344:b0:6f8:b4aa:2a4d with SMTP id
 6a1803df08f44-6fb3e604d8bmr40326486d6.31.1749816692043; Fri, 13 Jun 2025
 05:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250612200747.683635-1-jesse@rivosinc.com> <20250613-68a39013932d854741a41c4c@orel>
In-Reply-To: <20250613-68a39013932d854741a41c4c@orel>
From: Jesse Taube <jesse@rivosinc.com>
Date: Fri, 13 Jun 2025 05:11:19 -0700
X-Gm-Features: AX0GCFuHUtGMaKg3_RCQsNQ4SX_YAxCzufMbBr9KEFIhZ7lDuZSYG-Ra67cDYtc
Message-ID: <CALSpo=Y1uq6zAJYgJOTnVxzaNMmms7-eVSF4U_Z2rJ1zNVU9+w@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] riscv: Allow SBI_CONSOLE with no uart
 in device tree
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_051143_735679_E76074AA 
X-CRM114-Status: GOOD (  25.00  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTI6NTPigK9BTSBBbmRyZXcgSm9uZXMgPGFuZHJldy5q
b25lc0BsaW51eC5kZXY+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMTIsIDIwMjUgYXQgMDE6MDc6
NDdQTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4gPiBXaGVuIENPTkZJR19TQklfQ09OU09M
RSBpcyBlbmFibGVkIGFuZCB0aGVyZSBpcyBubyB1YXJ0IGRlZmluZWQgaW4gdGhlCj4gPiBkZXZp
Y2UgdHJlZSBrdm0tdW5pdC10ZXN0cyBmYWlscyB0byBzdGFydC4KPiA+Cj4gPiBPbmx5IGNoZWNr
IGlmIHVhcnQgZXhpc3RzIGluIGRldmljZSB0cmVlIGlmIFNCSV9DT05TT0xFIGlzIGZhbHNlLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4g
PiAtLS0KPiA+ICBsaWIvcmlzY3YvaW8uYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9yaXNjdi9pby5jIGIvbGliL3Jp
c2N2L2lvLmMKPiA+IGluZGV4IGZiNDBhZGI3Li45NmEzYzA0OCAxMDA2NDQKPiA+IC0tLSBhL2xp
Yi9yaXNjdi9pby5jCj4gPiArKysgYi9saWIvcmlzY3YvaW8uYwo+ID4gQEAgLTEwNCw2ICsxMDQs
NyBAQCBzdGF0aWMgdm9pZCB1YXJ0MF9pbml0X2FjcGkodm9pZCkKPiA+Cj4gPiAgdm9pZCBpb19p
bml0KHZvaWQpCj4gPiAgewo+ID4gKyNpZm5kZWYgQ09ORklHX1NCSV9DT05TT0xFCj4gPiAgICAg
ICBpZiAoZHRfYXZhaWxhYmxlKCkpCj4gPiAgICAgICAgICAgICAgIHVhcnQwX2luaXRfZmR0KCk7
Cj4gPiAgICAgICBlbHNlCj4gPiBAQCAtMTE0LDYgKzExNSw3IEBAIHZvaWQgaW9faW5pdCh2b2lk
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgIkZvdW5kIHVhcnQgYXQgJXAsIGJ1dCBlYXJseSBi
YXNlIGlzICVwLlxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgIHVhcnQwX2Jhc2UsIFVBUlRf
RUFSTFlfQkFTRSk7Cj4gPiAgICAgICB9Cj4gPiArI2VuZGlmCj4KPiBEb2Vzbid0IHRoaXMgZ2Vu
ZXJhdGUgdWFydDBfaW5pdF9mZHQvYWNwaSBkZWZpbmVkIGJ1dCBub3QgdXNlZCB0eXBlcyBvZgo+
IHdhcm5pbmdzPwoKTm8sIGJ1dCBpdCBzaG91bGQgaGF2ZSwgSSdsbCBmaXggaXQuCgo+IFdlIG5l
ZWQgdG8gcHV0IGV2ZXJ5dGhpbmcgdW51c2VkIHVuZGVyIHRoZSAjaWZuZGVmCj4gQ09ORklHX1NC
SV9DT05TT0xFLCBqdXN0IGFzIHVhcnQwX3JlYWQvd3JpdGUgYWxyZWFkeSBhcmUuIEFsdGVybmF0
aXZlbHksCj4gd2UgY2FuIGtlZXAgZXZlcnl0aGluZyBvdXQgb2YgdGhlICNpZm5kZWYgYW5kIGV4
cG9ydC4KClRoZSBwcm9ibGVtIGlzIHVhcnQwX2luaXRfZmR0IHBhbmljcyBpZiBubyBjb21wYXRp
YmxlIHVhcnQgd2FzIGZvdW5kLgoKVGhhbmtzLApKZXNzZSBUYXViZQo+IHZvaWQgc2JpX3B1dHMo
Y29uc3QgY2hhciAqcyk7Cj4gdm9pZCB1YXJ0MF9wdXRzKGNvbnN0IGNoYXIgKnMpOwo+Cj4gdGhl
biBqdXN0IGhhdmUgYSBzaW5nbGUgdXNlIG9mIHRoZSAjaWZkZWYsCj4KPiB2b2lkIHB1dHMoY29u
c3QgY2hhciAqcykKPiB7Cj4gI2lmZGVmIENPTkZJR19TQklfQ09OU09MRQo+ICAgICBzYmlfcHV0
cyhzKTsKPiAjZWxzZQo+ICAgICB1YXJ0MF9wdXRzKHMpOwo+ICNlbmRpZgo+IH0KPgo+IEkgdGhp
bmsgSSBsaWtlIHRoYXQgYmV0dGVyIHNpbmNlIGl0IHdpbGwgZW5zdXJlIGFsbCBjb2RlIGdldHMg
Y29tcGlsZQo+IHRlc3RlZCBhbGwgdGhlIHRpbWUgYW5kIGFsbG93IGFuIFNCSSBjb25zb2xlIHVz
aW5nIHVuaXQgdGVzdCB0byBhbHNvCj4gYWNjZXNzIGl0cyB1YXJ0IGlmIGl0IGhhcyBvbmUsIGp1
c3QgYmVjYXVzZS4uLgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+Cj4gPiAgfQo+ID4KPiA+ICAjaWZk
ZWYgQ09ORklHX1NCSV9DT05TT0xFCj4gPiAtLQo+ID4gMi40My4wCj4gPgo+ID4KPiA+IC0tCj4g
PiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
