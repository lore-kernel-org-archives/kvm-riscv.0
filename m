Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70C1D3B98B
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HpO4aw7iDALSkZ1gM2DNV42hAUvHCumV55CM2L7ZwSU=; b=km5ENOP+kFV4J8Qki+i31N5pNH
	wtZ5RDtTn3BewH8qcBx097KWUwwQDtQh38LiMOFQEiy5+mN6e9ATUvXJuP2J7orOUJIX+QcEBCrTU
	gABSoFjEZKR6tSsCOBjcsuSXMq6MexlA47X6QgnSxA+EQypE9gY+Dix6nfZo/9BmGD7xDDg1wWXIo
	hDHkGqf+BsMZ1j36p6mSD9t9GiLBXHfNwSNfGcn+RMm3a/X4Os7cetxkLefw96o6jDQsnXe7jATW/
	uVX5s41K2TsDvMoimUye5GFJh/MxwZsutE/K1hCO0V3G7n5CYzB807dj++jLy+LTTEQDcEC7amPj/
	nCmive3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1eJ-0000000EbfT-3xqo;
	Tue, 09 Dec 2025 17:37:19 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT1eG-0000000EbeC-1IH7
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 17:37:17 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34a43e96860so2484070a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Dec 2025 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765301835; x=1765906635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSI8Pxf1Wt9ews+8G0JZ3VLNAwMte4kHmIud1VFkk60=;
        b=278FBzCE+y5fA/HJuBFb4hdiwv6h+b2a8XBth8Q/sY88L5i9jbds7jCuT5UQTac0vb
         3KBXY6nwt03AW48xLzeB/83jUDeuAUhUj85cxqt8S37VnHT+Qzihc1agbS84WgKFkf1C
         KC5wguOhRzq2c/rZflmyKyij8kCMM1TbQ4VnNISTW4+l1CdS9cWc2TomeUtOJqiCH6HD
         c8x+vUj+0eZbMSgTTMtQpsV0EbznYjiszpP5PVkJVlGbknTYr9zERsatDQEuiks0JXCX
         dGlhR3u1mZsfz20iU5Tx8Ob5CQY/SmbbIXgpZApKOs8WeJES6n9RqyhTY9L7K8wdO0Of
         hHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765301835; x=1765906635;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RSI8Pxf1Wt9ews+8G0JZ3VLNAwMte4kHmIud1VFkk60=;
        b=H5Yd0mzuxeHuP+xfKksjGlSdG2QvzXlUv13TvGgIOB4kyw299uykqXfw+dN3FspyQI
         DkWpH7R39/P6OqwCqBzQgrpPfaUn5JkeP2E8vHtZJgorvAb0h0o9Ez7XyQNIRURns/MR
         VbrClDkc+zTTMVzcxG6oFFxkkKDCnjIXxfrkaoBmUFsbGvULBYKn9nUfqRV3sIEP2tLc
         Q6PzA7l2m4Tl2yau0RFhhDZQuZQ1/Dip3NUvvLtwAen0yTwHJtelLejeiww8IVTqqjvs
         yvP0P6/qQdPvojKJKZrGmeOcN7zyrPBiNciFKyHZIc/LVk3EmJyAUHEKIF9Ss+rIfo48
         kjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMbWICZIX/pzi2uRsmelcSCJxnaXRIzkxlvzsi1k3soYwypGgQgru99g90qlza96fSfFfzHRi+O2M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQT0iLsAyJuWP8leTurhBN8l8X65Twdf58XJRgbZ12bCo6X/u/
	qo1GOS/rdOWks4DdV9E8y5GzT8vB8sByIzcM84nA9anRklxLFt9LBjZVIWDW8VbnRn52KMw1csc
	hIfkKFw==
X-Google-Smtp-Source: AGHT+IFtEkvOBWBmPhAZp6fiQBmIeByIj1WwkTuM0S6f9ba1kbmIBgBTopqxljhwYNgNIix+N66SAv3Sd14=
X-Received: from pjbnh9.prod.google.com ([2002:a17:90b:3649:b0:343:6cb7:a68e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8b:b0:343:f509:aa4a
 with SMTP id 98e67ed59e1d1-349a260a9d0mr9559247a91.36.1765301834531; Tue, 09
 Dec 2025 09:37:14 -0800 (PST)
Date: Tue, 9 Dec 2025 09:37:13 -0800
In-Reply-To: <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-38-seanjc@google.com>
 <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Message-ID: <aTheSQb9fhXmZKw6@google.com>
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_093716_342878_1A6C584D 
X-CRM114-Status: GOOD (  27.80  )
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

T24gTW9uLCBEZWMgMDgsIDIwMjUsIERhcGVuZyBNaSB3cm90ZToKPiAKPiBPbiAxMi82LzIwMjUg
ODoxNyBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IEFkZCBhIGhlbHBlciB0byBy
ZW1vdmUgYW4gTVNSIGZyb20gYW4gYXV0by17bG9hZCxzdG9yZX0gbGlzdCB0byBkZWR1cCB0aGUK
PiA+IG1zcl9hdXRvbG9hZCBjb2RlLCBhbmQgaW4gYW50aWNpcGF0aW9uIG9mIGFkZGluZyBzaW1p
bGFyIGZ1bmN0aW9uYWxpdHkgZm9yCj4gPiBtc3JfYXV0b3N0b3JlLgo+ID4KPiA+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC94ODYva3ZtL3Zt
eC92bXguYyB8IDMxICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCj4g
PiBpbmRleCA1MmJjYjgxN2NjMTUuLmE1MWY2NmQxYjIwMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gv
eDg2L2t2bS92bXgvdm14LmMKPiA+ICsrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKPiA+IEBA
IC0xMDQwLDkgKzEwNDAsMjIgQEAgc3RhdGljIGludCB2bXhfZmluZF9sb2Fkc3RvcmVfbXNyX3Ns
b3Qoc3RydWN0IHZteF9tc3JzICptLCB1MzIgbXNyKQo+ID4gIAlyZXR1cm4gLUVOT0VOVDsKPiA+
ICB9Cj4gPiAgCj4gPiArc3RhdGljIHZvaWQgdm14X3JlbW92ZV9hdXRvX21zcihzdHJ1Y3Qgdm14
X21zcnMgKm0sIHUzMiBtc3IsCj4gPiArCQkJCXVuc2lnbmVkIGxvbmcgdm1jc19jb3VudF9maWVs
ZCkKPiA+ICt7Cj4gPiArCWludCBpOwo+ID4gKwo+ID4gKwlpID0gdm14X2ZpbmRfbG9hZHN0b3Jl
X21zcl9zbG90KG0sIG1zcik7Cj4gPiArCWlmIChpIDwgMCkKPiA+ICsJCXJldHVybjsKPiA+ICsK
PiA+ICsJLS1tLT5ucjsKPiA+ICsJbS0+dmFsW2ldID0gbS0+dmFsW20tPm5yXTsKPiAKPiBTb21l
dGltZXMgdGhlIG9yZGVyIG9mIE1TUiB3cml0aW5nIGRvZXMgbWF0dGVyLCBlLmcuLCBQRVJGX0dM
T0JBTF9DVFJMIE1TUgo+IHNob3VsZCBiZSB3cml0dGVuIGF0IGxhc3QgYWZ0ZXIgYWxsIFBNVSBN
U1Igd3JpdGluZy4KCkhtbSwgbm8uICBfSWZfIEtWTSB3ZXJlIHdyaXRpbmcgZXZlbnQgc2VsZWN0
b3JzIHVzaW5nIHRoZSBhdXRvLWxvYWQgbGlzdHMsIHRoZW4KS1ZNIHdvdWxkIG5lZWQgdG8gYm9v
a2VuZCB0aGUgZXZlbnQgc2VsZWN0b3IgTVNScyB3aXRoIFBFUkZfR0xPQkFMX0NUUkw9MCBhbmQK
UEVSRl9HTE9CQUxfQ1RSTD08bmV3IGNvbnRleHQgKGd1ZXN0IHZzLiBob3N0KT4uICBFLmcuIHNv
IHRoYXQgZ3Vlc3QgUE1DIGNvdW50cwphcmVuJ3QgcG9sbHV0ZWQgd2l0aCBob3N0IGV2ZW50cywg
YW5kIHZpY2UgdmVyc2EuCgpBcyB0aGluZ3Mgc3RhbmQgdG9kYXksIHRoZSBvbmx5IG90aGVyIE1T
UnMgYXJlIFBFQlMgYW5kIHRoZSBEUyBhcmVhIGNvbmZpZ3VyYXRpb24Kc3R1ZmYsIGFuZCBraW5k
YSB0byBteSBlYXJsaWVyIHBvaW50LCBLVk0gcHJlLXplcm9lcyBNU1JfSUEzMl9QRUJTX0VOQUJM
RSBhcyBwYXJ0Cm9mIGFkZF9hdG9taWNfc3dpdGNoX21zcigpIHRvIGVuc3VyZSBhIHF1aWVzY2Vu
dCBwZXJpb2QgYmVmb3JlIFZNLUVudGVyLgoKSGVoLCBhbmQgd3JpdGluZyBQRVJGX0dMT0JBTF9D
VFJMIGxhc3QgZm9yIHRoYXQgc2VxdWVuY2UgbWlnaHQgYWN0dWFsbHkgYmUKcHJvYmxlbWF0aWMu
ICBFLmcuIGxvYWQgaG9zdCBQRUJTIHdpdGggZ3Vlc3QgUEVSRl9HTE9CQUxfQ1RSTCBhY3RpdmUu
CgpBbnl3YXlzLCBJIGFncmVlIHRoYXQgdGhpcyBtaWdodCBiZSBicml0dGxlLCBidXQgdGhpcyBp
cyBhbGwgcHJlLWV4aXN0aW5nIGJlaGF2aW9yCnNvIEkgZG9uJ3Qgd2FudCB0byB0YWNrbGUgdGhh
dCBoZXJlIHVubGVzcyBpdCdzIGFic29sdXRlbHkgbmVjZXNzYXJ5LgoKT3Igd2FpdCwgYnkgIndy
aXRpbmciIGRvIHlvdSBtZWFuICJ3cml0aW5nIE1TUnMgdG8gbWVtb3J5IiwgYXMgb3Bwb3NlZCB0
byAid3JpdGluZwp2YWx1ZXMgdG8gTVNScyI/ICBSZWdhcmRsZXNzLCBJIHRoaW5rIG15IGFuc3dl
ciBpcyB0aGUgc2FtZTogdGhpcyBpc24ndCBhIHByb2JsZW0KdG9kYXksIHNvIEknZCBwcmVmZXIg
dG8gbm90IHNodWZmbGUgdGhlIG9yZGVyaW5nIHVubGVzcyBpdCdzIGFic29sdXRlbHkgbmVjZXNz
YXJ5LgoKPiBTbyBkaXJlY3RseSBtb3ZpbmcgdGhlIGxhc3QgTVNSIGVudHJ5IGludG8gY2xlYXJl
ZCBvbmUgY291bGQgYnJlYWsgdGhlIE1TUgo+IHdyaXRpbmcgc2VxdWVuY2UgYW5kIG1heSBjYXVz
ZSBpc3N1ZSBpbiB0aGVvcnkuCj4gCj4gSSBrbm93IHRoaXMgd29uJ3QgcmVhbGx5IGNhdXNlIGlz
c3VlIHNpbmNlIGN1cnJlbnRseSB2UE1VIHdvbid0IHVzZSB0aGUgTVNSCj4gYXV0by1sb2FkIGZl
YXR1cmUgdG8gc2F2ZSBhbnkgUE1VIE1TUiwgYnV0IGl0J3Mgc3RpbGwgdW5zYWZlIGZvciBmdXR1
cmUgdXNlcy7CoAo+IAo+IEknbSBub3Qgc3VyZSBpZiBpdCdzIHdvcnRoeSB0byBkbyB0aGUgc3Ry
aWN0IE1TUiBlbnRyeSBzaGlmdCByaWdodCBub3cuCj4KPiBQZXJoYXBzIHdlIGNvdWxkIGFkZCBh
IG1lc3NhZ2UgdG8gd2FybiB1c2VycyBhdCBsZWFzdC4KCkhtbSwgeWVhaCwgYnV0IEknbSBub3Qg
ZW50aXJlbHkgc3VyZSB3aGVyZS9ob3cgYmVzdCB0byBkb2N1bWVudCB0aGlzLiAgQmVjYXVzZQpp
dCdzIG5vdCBqdXN0IHRoYXQgdm14X3JlbW92ZV9hdXRvX21zcigpIGFyYml0cmFyaWx5IG1hbml1
cGxhdGVzIHRoZSBvcmRlciwgZS5nLgptdWx0aXBsZSBjYWxscyB0byB2bXhfYWRkX2F1dG9fbXNy
KCkgYXJlbid0IGd1YXJhbnRlZWQgdG8gcHJvdmlkZSBvcmRlcmluZyBiZWNhdXNlCm9uZSBvciBt
b3JlIE1TUnMgbWF5IGFscmVhZHkgYmUgaW4gdGhlIGxpc3QuICBBbmQgdGhlICJzcGVjaWFsIiBN
U1JzIHRoYXQgY2FuIGJlCnN3aXRjaGVkIHZpYSBkZWRpY2F0ZWQgVk1DUyBmaWVsZHMgZnVydGhl
ciBtdWRkeSB0aGUgd2F0ZXJzLgoKU28gSSdtIHRlbXB0ZWQgdG8gbm90IGFkZCBhIGNvbW1lbnQg
dG8gdGhlIGhlbHBlcnMsIG9yIGV2ZW4gdGhlIHN0cnVjdCBmaWVsZHMsCmJlY2F1c2UgdW5mb3J0
dW5hdGVseSBpdCdzIGxhcmdlbHkgYSAiSGVyZSBiZSBkcmFnb25zISIgdHlwZSB3YXJuaW5nLiA6
LS8KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2
Cg==
