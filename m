Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041A2CCD199
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=p4ktKfv3gBfIdeq6189RTfjOLziS0gY9AxGGoVHaLYk=; b=OYHI03BeJpcILqM93+Cf5o9nhQ
	ok97SkAhAdTDbWO8JnVd68MOGasNNjypecn4atwvBSBxGGBlS5B0C+Fr2eDNksLbLJtzhz1GXXh/r
	ncsKbJ6DJqISJMsHct6vGJcSHVxg/W6LIyirPUw1nz8p3tBxRBXB/tS4M+Rbl/UGVA0GcXQXr8d/f
	oyRHs/mqghSTcBfvtjJ1F/kBTfFIrIEY4xQmmthhw5DYB/yklsfpAt54IWss6USYRg8oBlDKyykbJ
	GXCuNWXJu5N0Ulxc0nyB/A1TpLSgCXSqjVXgELmyhFiP/Phfw92HNmiCRCT000drWmBWoXA0DYScE
	NSdQF7GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Yo-00000002eKe-2Fgm;
	Wed, 15 Oct 2025 18:49:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96Yn-00000002eJe-0Jin
	for kvm-riscv@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=; b=CK6qsV2R+od1mO2btrHnNYAJdB
	hAamNMp2Pji7s8iSFD9cnO0Q/FOCnmT8y0X4d97oUNToKutsGL5fGOGezzAygjcbOC5GIbkUVVG1X
	Ny1AtfKjWGM9t0NZayr9v0dJEjzuZbs9tTCOhwBIbQjmOEAmnWUKiqWSrvFXaEZFWIIm++1Kb206j
	OZ17IPdp7RzlsopFXS6THv2f/Sw2q5DkL32EHX/Pst37ZJ+VMVw8mxfs8KwrWzaMq6xWg1+PW4qzJ
	cMZbCtYBcohStp6TxygE22tE6GqvYNwnHvAQaHZh0B8GwOMivb7BGya46awyH35vF8ALMPvl4QAD5
	tnaWNpKA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96YU-00000006914-0slq
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 18:49:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc5bso13385708a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Oct 2025 11:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760554135; x=1761158935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=;
        b=uWW9SEImkZ1Wcog0/FXfsWMxOtg0nt0jP3W07wVQORtT+uI+nGFGqa0/f0bVkhZJ9t
         N6jhQ8195xiA6BAww+A3jYoxTgbmu7IQkwmzUu9EGoFhn2N8/Ks6vQvcMiZPjuqAMuSn
         +qWEjOsNTGb8pE+LHVs1t7qV9xuyW9sjIkGyk+MOzflJAKSGPEj4nwz57Cey1AM9PUIa
         oWy5BTVXn5t4LUzWGWmqn9J3JvCgrXEnJaGpNcEbzXAPPvNKcNx2vVZ09AnsWuygO72a
         UHdQBvTENRuo6KmsQl3Ewo6h986vUDPDiwr/r1qYK0q2io2tBOO8GFIvV/8SnLWTeAtT
         900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554135; x=1761158935;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3naOg0AXa4lxy2J7qWFZUYdZmmuSUah42Rbajn2HebA=;
        b=LQl1lttg9Y+9baJEBzgeGVUP8l+dS2rpKoI0wyNu4HP1hkm8W+XxjhXi3HK5FxmZym
         h3lmoOOUBoY25r+haBPi1MhaWOQ4Js96vI0Rc1xZcJ4nJxZVbpE2ymVLBL8qLqJR3bd3
         njBCGZPC4MdUH85f7lblCX6jF1Plmq4dr9HIrLTEy2mWX0wgB5C+EHhC+9zGTqH+9QIO
         a3UlAuAdGXlAKngkj+HnAitg95xw+/0pYJlqNShRApJP1zJaa7tIDKxxNMLPKNMxo1y+
         G+Hlqselpt5KsV7aD/6eQWR5ZC4itxLGl130DKQJ5fUTt0cbQa0qpv39dDoatX6RBtAd
         RwGg==
X-Forwarded-Encrypted: i=1; AJvYcCXZljU2cvCD0Zrwr2gx91UlE64llSuWJS/KQg+7M8H32u2Z1tfM3S/LL6vqv9DqXvvd5Tyrp2tiuu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkvOxRFgDfnOKvd1RrPEg6o0pT3AStp0OWqy3fEBLB9xJpJn8G
	pum3CNJhxVqOC+7vCrRixqf6OhqhAaCkiGBid/YIZ5DhA2d67e7NzhnTMMXcXVbaxnXt65jNWFd
	JF8JVxg==
X-Google-Smtp-Source: AGHT+IE9eJmZgE8/vrWWkRhltj63ksxMU8MKwID4HHHoGFacVC2zof2bk9aQHK5Js4MPCgK0DcLQje9LyvY=
X-Received: from pjpx13.prod.google.com ([2002:a17:90a:a38d:b0:33b:51fe:1a93])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3909:b0:336:bfcf:c50b
 with SMTP id 98e67ed59e1d1-33b513865a2mr39206696a91.20.1760554134578; Wed, 15
 Oct 2025 11:48:54 -0700 (PDT)
Date: Wed, 15 Oct 2025 11:48:52 -0700
In-Reply-To: <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com> <20250806195706.1650976-33-seanjc@google.com>
 <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com> <aN1vfykNs8Dmv_g0@google.com> <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Message-ID: <aO_slNn8X1A84sI-@google.com>
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Sandipan Das <sandidas@amd.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>, 
	Mingwei Zhang <mizhang@google.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Sandipan Das <sandipan.das@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_194908_237280_ECDCCB47 
X-CRM114-Status: GOOD (  21.55  )
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

T24gVGh1LCBPY3QgMDksIDIwMjUsIERhcGVuZyBNaSB3cm90ZToKPiAKPiBPbiAxMC8yLzIwMjUg
MjoxNCBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IE9uIEZyaSwgU2VwIDI2LCAy
MDI1LCBTYW5kaXBhbiBEYXMgd3JvdGU6Cj4gPj4gT24gOC83LzIwMjUgMToyNiBBTSwgU2VhbiBD
aHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+Pj4gKwlyZXR1cm4ga3ZtX25lZWRfcGVyZl9nbG9iYWxf
Y3RybF9pbnRlcmNlcHQodmNwdSkgfHwKPiA+Pj4gIAkgICAgICAgcG11LT5jb3VudGVyX2JpdG1h
c2tbS1ZNX1BNQ19HUF0gIT0gKEJJVF9VTEwoa3ZtX2hvc3RfcG11LmJpdF93aWR0aF9ncCkgLSAx
KSB8fAo+ID4+PiAgCSAgICAgICBwbXUtPmNvdW50ZXJfYml0bWFza1tLVk1fUE1DX0ZJWEVEXSAh
PSAoQklUX1VMTChrdm1faG9zdF9wbXUuYml0X3dpZHRoX2ZpeGVkKSAtIDEpOwo+ID4+PiAgfQo+
ID4+IFRoZXJlIGlzIGEgY2FzZSBmb3IgQU1EIHByb2Nlc3NvcnMgd2hlcmUgdGhlIGdsb2JhbCBN
U1JzIGFyZSBhYnNlbnQgaW4gdGhlIGd1ZXN0Cj4gPj4gYnV0IHRoZSBndWVzdCBzdGlsbCB1c2Vz
IHRoZSBzYW1lIG51bWJlciBvZiBjb3VudGVycyBhcyB3aGF0IGlzIGFkdmVydGlzZWQgYnkgdGhl
Cj4gPj4gaG9zdCBjYXBhYmlsaXRpZXMuIFNvIFJEUE1DIGludGVyY2VwdGlvbiBpcyBub3QgbmVj
ZXNzYXJ5IGZvciBhbGwgY2FzZXMgd2hlcmUKPiA+PiBnbG9iYWwgY29udHJvbCBpcyB1bmF2YWls
YWJsZS5vCj4gPiBIbW0sIEkgdGhpbmsgSW50ZWwgd291bGQgYmUgdGhlIHNhbWU/ICBBaCwgbm8s
IGJlY2F1c2UgdGhlIGhvc3Qgd2lsbCBoYXZlIGZpeGVkCj4gPiBjb3VudGVycywgYnV0IHRoZSBn
dWVzdCB3aWxsIG5vdC4gIEhvd2V2ZXIsIHRoYXQncyBub3QgZGlyZWN0bHkgcmVsYXRlZCB0bwo+
ID4ga3ZtX3BtdV9oYXNfcGVyZl9nbG9iYWxfY3RybCgpLCBzbyBJIHRoaW5rIHRoaXMgd291bGQg
YmUgY29ycmVjdD8KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3BtdS5jIGIvYXJj
aC94ODYva3ZtL3BtdS5jCj4gPiBpbmRleCA0NDE0ZDA3MGM0ZjkuLjRjNWIyNzEyZWU0YyAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gveDg2L2t2bS9wbXUuYwo+ID4gKysrIGIvYXJjaC94ODYva3ZtL3Bt
dS5jCj4gPiBAQCAtNzQ0LDE2ICs3NDQsMTMgQEAgaW50IGt2bV9wbXVfcmRwbWMoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpZHgsIHU2NCAqZGF0YSkKPiA+ICAgICAgICAgcmV0dXJu
IDA7Cj4gPiAgfQo+ID4gIAo+ID4gLWJvb2wga3ZtX25lZWRfcGVyZl9nbG9iYWxfY3RybF9pbnRl
cmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ID4gK3N0YXRpYyBib29sIGt2bV9uZWVkX3Bt
Y19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IAo+IFRoZSBmdW5jdGlvbiBuYW1l
IGt2bV9uZWVkX3BtY19pbnRlcmNlcHQoKSBzZWVtcyBhIGxpdHRsZSBiaXQgbWlzbGVhZGluZwo+
IGFuZCBtYWtlIHVzZXJzIHRoaW5rIHRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byBjaGVjayBpZiBh
IGNlcnRhaW4gUE1DIGlzCj4gaW50ZXJjZXB0ZWQuIE1heWJlIHdlIGNhbiByZW5hbWUgdGhlIGZ1
bmN0aW9uIHRvwqBrdm1fbmVlZF9nbG9iYWxfaW50ZXJjZXB0KCkuCgpZZWFoLCBJIGRvbid0IGxv
dmUga3ZtX25lZWRfcG1jX2ludGVyY2VwdCgpIGVpdGhlci4gIEJ1dCBrdm1fbmVlZF9nbG9iYWxf
aW50ZXJjZXB0KCkKZmVlbHMgdG9vIGNsb3NlIHRvIGt2bV9uZWVkX3BlcmZfZ2xvYmFsX2N0cmxf
aW50ZXJjZXB0KCkuCgpNYXliZSBzb21ldGhpbmcgbGlrZSBrdm1fbmVlZF9hbnlfcG1jX2ludGVy
Y2VwdCgpPwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
