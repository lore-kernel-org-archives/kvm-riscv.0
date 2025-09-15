Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3806DCAC597
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFy/ukUAaMhKKbMW7epAXbaERorKEb6NJdMdAufM0Sk=; b=P6YkGAuBkofylk
	LZe8k5AbwQa/g8pFzjwVH5QrFNPw8Xg88450OhyftndLOv1BdwuMs71NqZ5SQXNbAKLjeWOS2HdcS
	llgK30FpP1cnsJZx4dV5Ykt9/YM4kq5TSv0mcT/XpNp0apIKuh8/mRq6mnIyDv3XXKfSrrD84T389
	tUWSmNN3joFvD5cDcjzFJd91hlJwMavA3I/OLoWu5XjNWn2VPlQ5Y8TuHfWefotEdGvuJ+/KnN/j3
	D3krcdYvAiVMXTGcim9IXQbceJMGqUy8VeKVdQWSK7UJ8YuETIqeIypEL1serSMYnZXTNqBcTY71v
	Z7ycalYGg4i1TInZtkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rR-000000042il-3lCM;
	Mon, 15 Sep 2025 11:59:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rQ-000000042hs-48hq
	for kvm-riscv@bombadil.infradead.org;
	Mon, 15 Sep 2025 11:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=; b=pOsNg1cTrqDR/IHIdBBVewVYV5
	hqRe+d1FbYrMU6MfeyGbHYTsDbqnf+rI8NbfE2y81FpM8sKST45gLIZwckZVp8A6wWx4oam+m9gLs
	Rih3e2ojP4antCEwqrK59wXyse1ax/XWkqqkTvzDLrGPGq2g5oAu5tlXiekggUchLx6r3NhajqKQI
	9CG1A+fWt0Lff+eWhH4cNS9l77EmovgWiJvdq/VNpAYjQ6832ReKbZH5cMKB5xp1+zikL0ZkFk8U+
	BDOnTWPyiFOFzuIbI0wY16m0K6kpg7rNZLj9F4qwn6+i/wDnLRzOfFXG5LjMK6RG3FvPLboFZQV6r
	kP16sG9Q==;
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7rM-00000006xm3-2zQF
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 11:59:07 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-8936326129eso23059939f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757937542; x=1758542342; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=ne65M2J7ZkQAwhEXxrHu00YUT4pQWDiMrP633cB3O5/GDFgviT8Qe2HFO4W51Ep1oP
         L8o4pacU3xIw4TmsDXC4aoKdZ2Y/NvYRniLXbLXxBJnto6FPgX8WbTRU2xQs0BjO7f7O
         S9ErupvpPRFfPM6EqYFoYSgWpLl33NznxF/Tg8J2SZoppiY3wlUqOJZYegJoCkExtrPh
         MBrIt4TPqsFsTCss2csdT18SIu1N9tKUIIXFN4/z/2Dv1hqoapAtmfEehWW/O8LEdPiI
         Af/4MHF34nqTVtaVBfrGOjWAsQYU0YkGahtTyw7+k5JsQYTiYCw3BTnpUn/YU6UtgseR
         Pa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757937542; x=1758542342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+Wo4LOKOK6vQ7K4HYgfgfOSwUdpnB4dRYCTrPRiDio=;
        b=fjJClgcFr4ibV+raTAS3oeOhwnqeRzjhtvDMpgztmREG4e6w95slhKCHXpASjRvRVB
         6fQBWiJ//MHOX6gubvZa9RZ0X9b4XMQ7shPO3NDu1BlLEnkicoCrWNv6LrYO5tYqHX8G
         rDhKp6ReHR/I+PdkXjuyJ1xwUGfuuZ3F+CeDd22lYA4nYgJAiXHliMvx6BMaH5fCoiyB
         m5Y/ygYdmg0OioVLoJX9tnM//qDziiIo38cLiYwO2wN9tRvy0yGvjG9RIYzhr6b3PC0W
         ayZMkhpqOAnOewi/SlSLg2wVi+DyDdiGGkIVMxE8sxI7yHvANaZpZ8Mv7wx+EXTFGxQJ
         DlCw==
X-Forwarded-Encrypted: i=1; AJvYcCVH0IQhml27R3nJTMCZ8N/FpC+28aIIl7/0VywCgRGBPdLfiM3E2rrOxEsk03qlwGKv7kRbL8j7YYg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1wK6+zlioTuss7M98ohXmGBdj2uBsVB5asAfuop8tuums9uKG
	p75hN8hU1408s/KtN4bMIVIxd+pkLMHWpvE791lwUmnortQ2Sk9RHolsDPfx4Nyfj42yjNmfyky
	nwmiUm24EETlf3bqettwam+UBfmZipUxq8K6zdJtzCw==
X-Gm-Gg: ASbGnctmiqeP7zpOhIZuVqNDq5ljdX3Du0hiDBav1fxlPWOIYmU2sdvyqS3pfP3Vvdx
	B5gMXi/YYd1bBqWCVL3871YPfCkIWXIhY/YJcQxBU7Eya0uDrcvhCzY3xnlexyFBNsL0pEL0iN8
	kef0zjLMbEBvPCuXk73aWy0lR7YTl9Gid+wDVWcO/HRNfdi9o+DS9J8h4fUItljUDiPQp3qOK7w
	titoXt7ugOgs2hgULkmZ0IL1kn8qRJBntGRpJUZ
X-Google-Smtp-Source: AGHT+IHTDrsD99f5SQM6r2xQgpJxH71mXjBKOGQCXs9gTx5sBfVD90LiO27Njr8hwWJISfU1lWc6TvRVPNc4XTqs0j4=
X-Received: by 2002:a05:6e02:3312:b0:423:fd3b:ef72 with SMTP id
 e9e14a558f8ab-423fd3bf017mr46668695ab.0.1757937541951; Mon, 15 Sep 2025
 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
 <f740b716-6c8b-46a5-31ae-ecc37e766152@kernel.org> <aMftcHLgBvH76erX@willie-the-truck>
In-Reply-To: <aMftcHLgBvH76erX@willie-the-truck>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 15 Sep 2025 17:28:48 +0530
X-Gm-Features: AS18NWDM6MzdjjPsw0ij-OL-CWk_57B0_4S3ilJtO7cErapGgoLvo5MzWEvUv3s
Message-ID: <CAAhSdy3wJd5uicJntf+WgTaLciiQsqT1QfUmrZ1Jk9qEONRgPw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_125905_016774_F3984FDE 
X-CRM114-Status: GOOD (  19.46  )
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

SGkgV2lsbCwKCk9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDQ6MTHigK9QTSBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0IDEyOjI1
OjUyQU0gLTA2MDAsIFBhdWwgV2FsbXNsZXkgd3JvdGU6Cj4gPiBPbiBUdWUsIDkgU2VwIDIwMjUs
IEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4KPiA+ID4gU0JJIHYzLjAgc3BlY2lmaWNhdGlvblsxXSBh
ZGRlZCB0d28gbmV3IGltcHJvdmVtZW50cyB0byB0aGUgUE1VIGNoYXBlci4KPiA+ID4gVGhlIFNC
SSB2My4wIHNwZWNpZmljYXRpb24gaXMgZnJvemVuIGFuZCB1bmRlciBwdWJsaWMgcmV2aWV3IHBo
YXNlIGFzCj4gPiA+IHBlciB0aGUgUklTQy1WIEludGVybmF0aW9uYWwgZ3VpZGVsaW5lcy4KPiA+
ID4KPiA+ID4gMS4gQWRkZWQgYW4gYWRkaXRpb25hbCBnZXRfZXZlbnRfaW5mbyBmdW5jdGlvbiB0
byBxdWVyeSBldmVudCBhdmFpbGFibGl0eQo+ID4gPiBpbiBidWxrIGluc3RlYWQgb2YgaW5kaXZp
ZHVhbCBTQkkgY2FsbHMgZm9yIGVhY2ggZXZlbnQuIFRoaXMgaGVscHMgaW4KPiA+ID4gaW1wcm92
aW5nIHRoZSBib290IHRpbWUuCj4gPiA+Cj4gPiA+IDIuIFJhdyBldmVudCB3aWR0aCBhbGxvd2Vk
IGJ5IHRoZSBwbGF0Zm9ybSBpcyB3aWRlbmVkIHRvIGhhdmUgNTYgYml0cwo+ID4gPiB3aXRoIFJB
VyBldmVudCB2MiBhcyBwZXIgbmV3IGNsYXJpZmljYXRpb24gaW4gdGhlIHByaXYgSVNBWzJdLgo+
ID4gPgo+ID4gPiBBcGFydCBmcm9tIGltcGxlbWVudGluZyB0aGVzZSBuZXcgZmVhdHVyZXMsIHRo
aXMgc2VyaWVzIGltcHJvdmVzIHRoZSBncGEKPiA+ID4gcmFuZ2UgY2hlY2sgaW4gS1ZNIGFuZCB1
cGRhdGVzIHRoZSBrdm0gU0JJIGltcGxlbWVudGF0aW9uIHRvIFNCSSB2My4wLgo+ID4gPgo+ID4g
PiBUaGUgb3BlbnNiaSBwYXRjaGVzIGhhdmUgYmVlbiBtZXJnZWQuIFRoaXMgc2VyaWVzIGNhbiBi
ZSBmb3VuZCBhdCBbM10uCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Yt
bm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzL2Rvd25sb2FkL3YzLjAtcmM3L3Jpc2N2LXNi
aS5wZGYKPiA+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFs
L2lzc3Vlcy8xNTc4Cj4gPiA+IFszXSBodHRwczovL2dpdGh1Yi5jb20vYXRpc2hwMDQvbGludXgv
dHJlZS9iNC9wbXVfZXZlbnRfaW5mb192Ngo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlz
aCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBGb3IgdGhlIHNlcmllczoKPiA+
Cj4gPiBBY2tlZC1ieTogUGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+Cj4KPiBJIHdhcyBh
c3N1bWluZyB0aGlzIHNlcmllcyB3b3VsZCBnbyB2aWEgdGhlIFJpc2MtViBhcmNoIHRyZWUgc28g
cGxlYXNlCj4gc2hvdXQgaWYgeW91IHdlcmUgZXhwZWN0aW5nIG1lIHRvIHRha2UgaXQgdmlhIGRy
aXZlcnMvcGVyZi8hCj4KCkJhc2VkIG9uIG9mZmxpbmUgZGlzY3Vzc2lvbiB3aXRoIFBhdWwsIEkg
d2lsbCB0YWtlIHRoaXMgc2VyaWVzCnRocm91Z2ggdGhlIEtWTSBSSVNDLVYgdHJlZS4KClJlZ2Fy
ZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
