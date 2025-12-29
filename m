Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4878E92FE3
	for <kvm-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 23:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nJqSsduYJ6x/1dx60UN9BCNkzSgVg6XiBnn5HMVg+h8=; b=MEnyGSsKG6B4/ekN4bc4XCqhpU
	8wxAiBbllnJaY64Gj8JCW2gpGiYm2FW+GMYYWrrH/Fj1Xvlr/YQMDnuN0iTELsNCLW+dafn8RAzWB
	lmuNxoKhE9kRZq3MHVYOOAvicvXQtby4GEhFXZk66w1BicG70y8OMAhlEzFHzauAqWM/MM62CznFF
	oA1FRzijPMVUMrFqXPHXumzXCc5S+3aAr0pL9/GWrBj2Mx4jBSRy8QCEXY70Xi36glg9lF8R4PUqB
	HOaZgd5Nvyn1vwAZwNJj4jAuL3H9AiG7Fg9KYyCxNupDv1SxwpsNN+qaHNVKHJYLeR/v6ViLdApW8
	5bxnanyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaN7A-00000004ADW-43v4;
	Mon, 29 Dec 2025 23:57:28 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaN77-00000004ABx-0NIh
	for kvm-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 23:57:27 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso17965642b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 29 Dec 2025 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767052643; x=1767657443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaCAmCD1pI2PB4kVDvq818qZSC88KaBTxMeyOFyVIUw=;
        b=Exbi19g3iSDD1XlqrHs8hWXWfmGesph4xEIEbHgDuiBvpXDanlClvqhxWfmVOv6b2X
         u35MpWa+wCc9krpswJEDzLDIGel0bqzE6PM7NoiU18jC84uTEvHIJDI7F2ZzM4+elE7K
         6h5OfCk2Dt7J9TO+R4VK/8qbdTU6axjopdF2Rx/8SUKexFc0ERSicHfdocV6XEKGQIp4
         vJhozZaaUvTy7sEDBYpJVoRCXxicW130vtn0xfH6iUzbp891u4BniP3pO0PasBaEgSiQ
         4D3uHWji4cT4HxCqiJR97xASV+7IGhKfJNHnGWIjFjNZYlUwwaFBfHP8/Y+ADfM2t03X
         EHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767052643; x=1767657443;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vaCAmCD1pI2PB4kVDvq818qZSC88KaBTxMeyOFyVIUw=;
        b=jXwW19V4GU/W1f1+rjWJI9n3bdvBPCQg0kwITUGUEAauJfRL704z+zJ99UajxDN85e
         MxDAqBQpUURN9XRWI9GgQzEsTftrBvkngBQ1E5U+AJft7hZ3m4WYPkqGX2jOa89/nbbG
         airxuukszvfUPLbit0jop4X05ejbrh1aymrCWBmU1dVRMVgyTT33FeEn/N4bDyC/8NBr
         262O87n/f+jvVpWOUhyBzu2/6wCaXIvHB361AbQIRnEOH+uZbU61OQZTEBOY3wJyGpWp
         kaGfEP4C0X4aGKvSqaauiAP3FRAK0XqpHaMyg/JaJ5jCCNXw+Xpm9jc57/XCoUDMgJFX
         aNiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVngMs3q4dvoN6pm9uL1ANmD2kAv5L4qry68VNgEyzoSbLrjyFhd+uF7CXb9QboKWfzHexPM7ju0ps=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0cauXfagrOEkRWcYlsgs6UmZXU61h5xSufigcgt2+XlxF9uyl
	smOqaRBfqcHkgoWJw151OjjkxbUcPgpKkMIwrbn+3WU1CQ8GGB/UHTWUPA29eo75lxZalT61dFO
	jUcb2Ig==
X-Google-Smtp-Source: AGHT+IGWSzvMBdAgSpc1cQ4FNAzud2F9vkcmbgsGWHl/uECW+mXFCBlsNw6jhBxprH27ZWhYhxw4eDFyKfA=
X-Received: from pjhk89.prod.google.com ([2002:a17:90a:4ce2:b0:34c:1d76:2fe9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9185:b0:343:af1:9a57
 with SMTP id adf61e73a8af0-376aa8e98d6mr28981483637.56.1767052643109; Mon, 29
 Dec 2025 15:57:23 -0800 (PST)
Date: Mon, 29 Dec 2025 15:57:21 -0800
In-Reply-To: <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-16-seanjc@google.com>
 <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Message-ID: <aVMVYY_WkNClfXuj@google.com>
Subject: Re: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's)
 reported PMU capabilities
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
X-CRM114-CacheID: sfid-20251229_155725_142219_03636336 
X-CRM114-Status: GOOD (  19.94  )
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

T24gVGh1LCBEZWMgMjUsIDIwMjUsIERhcGVuZyBNaSB3cm90ZToKPiAKPiBPbiAxMi82LzIwMjUg
ODoxNiBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+IFRha2UgYSBzbmFwc2hvdCBv
ZiB0aGUgdW5hZHVsdGVyYXRlZCBQTVUgY2FwYWJpbGl0aWVzIHByb3ZpZGVkIGJ5IHBlcmYgc28K
PiA+IHRoYXQgS1ZNIGNhbiBjb21wYXJlIGd1ZXN0IHZQTVUgY2FwYWJpbGl0aWVzIGFnYWluc3Qg
aGFyZHdhcmUgY2FwYWJpbGl0aWVzCj4gPiB3aGVuIGRldGVybWluaW5nIHdoZXRoZXIgb3Igbm90
IHRvIGludGVyY2VwdCBQTVUgTVNScyAoYW5kIFJEUE1DKS4KPiA+Cj4gPiBSZXZpZXdlZC1ieTog
U2FuZGlwYW4gRGFzIDxzYW5kaXBhbi5kYXNAYW1kLmNvbT4KPiA+IFRlc3RlZC1ieTogWHVkb25n
IEhhbyA8eHVkb25nLmhhb0BpbnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gveDg2L2t2bS9w
bXUuYyB8IDIgKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9wbXUuYyBiL2FyY2gveDg2L2t2bS9wbXUuYwo+ID4g
aW5kZXggNDg3YWQxOWEyMzZlLi43YzIxOTMwNWI2MWQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3g4
Ni9rdm0vcG11LmMKPiA+ICsrKyBiL2FyY2gveDg2L2t2bS9wbXUuYwo+ID4gQEAgLTEwOCw2ICsx
MDgsOCBAQCB2b2lkIGt2bV9pbml0X3BtdV9jYXBhYmlsaXR5KGNvbnN0IHN0cnVjdCBrdm1fcG11
X29wcyAqcG11X29wcykKPiA+ICAJYm9vbCBpc19pbnRlbCA9IGJvb3RfY3B1X2RhdGEueDg2X3Zl
bmRvciA9PSBYODZfVkVORE9SX0lOVEVMOwo+ID4gIAlpbnQgbWluX25yX2dwX2N0cnMgPSBwbXVf
b3BzLT5NSU5fTlJfR1BfQ09VTlRFUlM7Cj4gPiAgCj4gPiArCXBlcmZfZ2V0X3g4Nl9wbXVfY2Fw
YWJpbGl0eSgma3ZtX2hvc3RfcG11KTsKPiA+ICsKPiA+ICAJLyoKPiA+ICAJICogSHlicmlkIFBN
VXMgZG9uJ3QgcGxheSBuaWNlIHdpdGggdmlydHVhbGl6YXRpb24gd2l0aG91dCBjYXJlZnVsCj4g
PiAgCSAqIGNvbmZpZ3VyYXRpb24gYnkgdXNlcnNwYWNlLCBhbmQgS1ZNJ3MgQVBJcyBmb3IgcmVw
b3J0aW5nIHN1cHBvcnRlZAo+IAo+IEhpIFNlYW4sCj4gCj4gSXQgbG9va3MgYSBtZXJnaW5nIGVy
cm9yIGhlcmUuIFdlIGRvbid0IG5lZWQgdGhpcyBwYXRjaC4KCkdhaCwgcmlnaHQgeW91IGFyZS4g
IEkgb3Zlcmxvb2tlZCBpdCBiZWNhdXNlIGl0IGRpZG4ndCBjb25mbGljdCBvbiBhIHJlYmFzZSwg
YW5kCkkgb25jZSBhZ2FpbiBmb3Jnb3QgdG8gdGVzdCBvbiBhIGh5YnJpZCBQTVUsIGdyci4KClRo
YW5rcyEKCj4gVGhlIG9yaWdpbmFsIHBhdGNoICI1MWYzNGIxICgiS1ZNOiB4ODYvcG11OiBTbmFw
c2hvdCBob3N0IChpLmUuIHBlcmYncykKPiByZXBvcnRlZCBQTVUgY2FwYWJpbGl0aWVzIikiIGhh
ZCBiZWVuIG1lcmdlZCBpbnRvIHVwc3RyZWFtIGFuZCBzdWJzZXF1ZW50bHkKPiB3ZSBzdWJtaXR0
ZWQgYSBuZXcgcGF0Y2ggIjAzNDQxN2MxNDM5YSAoIktWTTogeDg2L3BtdTogRG9uJ3QgdHJ5IHRv
IGdldAo+IHBlcmYgY2FwYWJpbGl0aWVzIGZvciBoeWJyaWQgQ1BVcyIpIiB0byBmaXggdGhlIHdh
cm5pbmcgaW50cm9kdWNlZCBmcm9tCj4gcHJldmlvdXMgcGF0Y2jCoCAiNTFmMzRiMSAoIktWTTog
eDg2L3BtdTogU25hcHNob3QgaG9zdCAoaS5lLiBwZXJmJ3MpCj4gcmVwb3J0ZWQgUE1VIGNhcGFi
aWxpdGllcyIpIi4gVGhhbmtzLgo+IAo+IC1EYXBlbmcgTWkKPiAKPiAKCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
