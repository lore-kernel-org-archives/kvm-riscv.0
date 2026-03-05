Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDF9F33A9D
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+9cg93NRob0o6SESCtytiAMvCj6PLAD3oB6/hrGAiU=; b=eNN1JQ9tNXHmaT
	co+TCNLW9J7zQZ5vzZYN7ts/apDb/wrUWLP3jsXJkQreP0rD9Xw/Nv6rRkVSUnz2Ska0yIjoyaU+o
	S/+lXroNjipqSNc5isM71JUAjn1DThMCDiGQivIDjm7hqJ2veXwvEijBAzCbMG5NliEjaRB5LApgp
	nXJ+jm+CtEJaNU0mMu0MYIErFkFYAvVMwQPJH51CoVZtF0+/83ompBojIEb3uXAvykzd/cFO7qDp8
	kaJPVmDNRFhivwavWQ4CdTLP7j7vu3wM7rMmYYcaHY/0efZzli6Xrqwb0wNLOnPsFVDUJKKqtWb+A
	97Qnwv2f9cRkiskdiJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTP-00000002Ijh-33hu;
	Thu, 05 Mar 2026 17:26:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTN-00000002IiZ-3JXh
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:26:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1584723e87.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731611; cv=none;
        d=google.com; s=arc-20240605;
        b=ie32cVG37rKvw+YECKDKiUQ2XrUPg6hOYCBnvL+EgxU7HW/D+5f4fI+HlgWInFcnV3
         0NIxAgsyIinNaGGQcS0eFyR8cs9OU7eWs4jqja3foME7bheAE3IapsuKStGAHzu/TOtn
         EPm8yoH6MtLCgNvE9PAPHjbESDjIjKE7lh2LzfPgEwx+qqVMKt5Vsh3dIplcq/J/Bk+d
         f0Rb1XbmbsqayUJyTXJPefji91/R5rK6j9kE3ZmrfKAoWOvswXpXEbuunHGl/PdDLRbL
         1WxVAp3xLk6ha4OngucVlYP5Q8pzykALQcJcLfSm2/XkmFqwgArPuMKQEO50mVPd/pFg
         7BYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        fh=eT6ZjBspFk0QgFLGnntdz2n7zi4BjQ2q/fbWpUtGpUc=;
        b=gjFkmqHCFfEfLXk3/PgcCFTayxyK0yUG0BCQNdzhPn6DloRpBxhEtkb8nUwf4TaACG
         LVVkSr2jO7q1Jt+uRyc7WlqJrBwTnqoUOHUBC2oStlf5FrRLie+7H4EXXxw1ShkQrW0b
         XjF4MIoMZHjm7QXjsi4+bCH7g+CjZQQEFLgtkkusT6zNsyilFw5L8dgekMgZW4yYFLfq
         bxblgwKcl2ku+FbYJbNu3L3SXJfyDdrlUwl2gMYcPgNWZulkjxIrqxhnMv2R0F/3p9s2
         iOOTQNPUFD2Ymef73ERSvtStFsP0KDutS6MBxd77PHYbhW+vR+P5+1/lgoffQvM9K7DJ
         YB7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731611; x=1773336411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=tJM+5WiyXHIkTBItRsVXNII23tawwOogmqTUCQyeg90SQCR9hJ2YpPdHzIAK+xQMNM
         u064CrnRw0O6dCcKQtTZMhcXO1NHIHro9SkxNjFHaAVq7SY4igNFoAq/bmNucfQZJlhQ
         AAfIXFfYJLkgG1nL+J20HFEPkGziDWHcOyY6C02n+kIMYn/eETzH9vu5TNfxW3GbIckn
         FxC1AvpAbNmLlZlKz1D5g7TuUQtta07P2MPow9dxmRXb27THEDvLxdrx7eBKLyUTzQeL
         5VwRtdgTVub1BJdzByzE0POK3raTwhkBsaD6k4HkMRk+pF0fvj/fGimfOh+IS5MBfjJf
         aNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731611; x=1773336411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=fPFNM6UrCh4spUaTC+fodlUmsY/Xp5KKFhP/fVdDdHB99X0eyNW8fb0X0InzCqs5M8
         iH17DmnAC0t7dWw6FS2r2FBDFVm6E5Ny2B806hwNOpFaemzC4B/T8cidQq+VjRQMQsFx
         PStJxOACt2HLUJ/Mi9GwZUgZAEdI9fAz9+51wPbiRtGj22FwulK+xcdpto6fcblBaqHk
         c8IvaGjCaHgtwM0YTqB1mqKRiZhAgYSag8CA+I5wZv+vKeh2vxC9xlbdFn0JSVQq4Ejn
         Fx29hkykhXM/AWorImGBJOEsr8xb66c/5NYhWNL+OelxzHeiqr7LCKeHLgB8KYb/9MAG
         ywkA==
X-Forwarded-Encrypted: i=1; AJvYcCUPh+3AlAnHn/Emqub8xyTQVost4RdYDb7EYYO0/Ysvsb14N1OHy0HtktMcf9U3IPk26Ujb72nx+mw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzG8m1heCBlgZvYf018HROegb3vzW0aaZeeaMWoUYWJlVO3jZx
	gmbUX8BHFPkuzsfyRhTAgcrLgDHDiuxJs0WKin4LBmipLI+p1nldg9PKFjIMND+IbhGsFfzLXez
	MRmexDyHazBaHXmkqbpWsOsT4pRSvQdCRKq0MQmNt
X-Gm-Gg: ATEYQzxGk84CwPwueNqDzp0a33G9c6USL2ul3kMq7H3q1ti+2wE5UgtJewRmLC2oTVI
	hPhACMNm5fuXaJ72nn+rks6U9KLvDXjTTgmRuzQ51HP+0WItVFl/b+OFeixqlhhvt93e2QKI657
	tAn26lsFdxYqpBcVVbY02M/Gca+AgBaY2LRMLa76TIiiLiXWCY50OVnPpw4VqwYxRjg9mVlxJhv
	fZQtneGBqa+eFFX2mgctnKlaOm7SeumQYqVFWbLxVzQXezV74l9jJu1+CKj4TZDTJ1Ncrsp2HaA
	GU6l23Z8
X-Received: by 2002:a05:6512:696:b0:5a1:2f18:5e19 with SMTP id
 2adb3069b0e04-5a12f185e8bmr1324271e87.22.1772731610293; Thu, 05 Mar 2026
 09:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <aam77t8fe5RKSr2Q@google.com>
In-Reply-To: <aam77t8fe5RKSr2Q@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:22 -0800
X-Gm-Features: AaiRm52LsX1aPJ2JM5xqUBPHr_QH0uBSIJaRMA7nyUfm3apWkfHV7m2i8095U3w
Message-ID: <CALzav=etzo9A7FNQrbLCmj=pNLN5fO-a5isP1k6MuTDkJw1bqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092653_851520_86ECB8B0 
X-CRM114-Status: GOOD (  14.84  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCA5OjIy4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYsIERhdmlkIE1h
dGxhY2sgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyByZW5hbWVzIHR5cGVzIGFjcm9zcyBhbGwgS1ZN
IHNlbGZ0ZXN0cyB0byBtb3JlIGFsaWduIHdpdGgKPiA+IHR5cGVzIHVzZWQgaW4gdGhlIGtlcm5l
bDoKPiA+Cj4gPiAgIHZtX3ZhZGRyX3QgLT4gZ3ZhX3QKPiA+ICAgdm1fcGFkZHJfdCAtPiBncGFf
dAo+ID4KPiA+ICAgdWludDY0X3QgLT4gdTY0Cj4gPiAgIHVpbnQzMl90IC0+IHUzMgo+ID4gICB1
aW50MTZfdCAtPiB1MTYKPiA+ICAgdWludDhfdCAgLT4gdTgKPiA+Cj4gPiAgIGludDY0X3QgLT4g
czY0Cj4gPiAgIGludDMyX3QgLT4gczMyCj4gPiAgIGludDE2X3QgLT4gczE2Cj4gPiAgIGludDhf
dCAgLT4gczgKPiA+Cj4gPiBUaGUgZ29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRoZSBL
Vk0gc2VsZnRlc3RzIGNvZGUgbW9yZSBjb25jaXNlCj4gPiAodGhlIG5ldyB0eXBlIG5hbWVzIGFy
ZSBzaG9ydGVyKSBhbmQgbW9yZSBzaW1pbGFyIHRvIHRoZSBrZXJuZWwsIHNpbmNlCj4gPiBzZWxm
dGVzdHMgYXJlIGRldmVsb3BlZCBieSBrZXJuZWwgZGV2ZWxvcGVycy4KPiA+Cj4gPiB2MjoKPiA+
ICAtIFJlYXBwbHkgdGhlIHNlcmllcyBvbiB0b3Agb2Yga3ZtL3F1ZXVlCj4gPgo+ID4gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI1MDUwMTE4MzMwNC4yNDMzMTkyLTEtZG1hdGxh
Y2tAZ29vZ2xlLmNvbQo+Cj4gU29ycnksIEkgd2FzIHRvbyBzbG93IGFuZCBtaXNzZWQgdGhlIHdp
bmRvdyB0byBnZXQgdGhpcyBpbnRvIGt2bS9uZXh0IHdpdGhvdXQKPiBjYXVzaW5nIGEgZGlzYXN0
ZXIgb2YgbWVyZ2UgY29uZmxpY3RzLgo+Cj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0byBzZW5k
IGEgdjMgdGhvdWdoLiAgSSdsbCBwcmVwIGEgdjMsIGEgYnJhbmNoLCBhbmQgc2VuZAo+IFBhb2xv
IGEgcHVsbCByZXF1ZXN0IGR1cmluZyB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCgpTb3VuZHMgZ29v
ZCwgdGhhbmtzIFNlYW4uCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2t2bS1yaXNjdgo=
