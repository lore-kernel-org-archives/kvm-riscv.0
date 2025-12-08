Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB2D3B7DD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F41x3NdIpN1pw6MNTgi2YWDCdyZDwldmGX/gvhiO2O4=; b=K/OsGPm9ZldWsP
	5+iUvhmDmN8lA4cbSbHpVi3miPB8szGqrLPLJXhN1rrvElRG3bFaifcePyESPEl0fqafbV54NIbn2
	K7H8wiUG7Ysq3OfufB4YySNBI/1RZXcLJNk2kmWPQoy3hx1YFGR9mwZtPUbakYks0sVsdApo0Xjpp
	snpT9Tjri2Rn1btmIhvOLsaHyLrcoiXDC5aP2VcuBQOyo/Tx+hhkqNvel552nSgfHf8YtZdJm70Sd
	5sLiwATYSeXoOu22j0YmtwbeBJ6gEAuUI3eJA/Yi5B0w+S3awwarSQj8B84i6ULphsYQwd76txspG
	Ta/jcoNrASSccH19GzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXZH-0000000CsJT-36L8;
	Mon, 08 Dec 2025 09:30:09 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXZE-0000000CsIy-1UPY;
	Mon, 08 Dec 2025 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186205; x=1796722205;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JcvwqgFLZTsix0sYAKimzPeJUH3wC8yywdSyJTN0AOA=;
  b=nXofIik18CH0JQSzkCZXBhsdsW6oayriLxNss4v2cHQ2prAOIIt/QQB4
   zpi2zaUEejwjuSPLwMjF8nuA8R7nq+XU9DRpwrJCmoDLFPaICSMJVzgyn
   C6+cPy0uLjsJ3ozTF10vCLzfa/I6v8HuHtQwAeOU39IzDWTtHZmZ3uRVs
   nAtXPnGvzucTC+O6tSR81ZzpFoI47cKbJ3mR4Qi81tkDZjkaUxoM3Vw9v
   vlL1k3g8hv/zTATX7bizX3KpGyC+b+LxOtU+9cAjQ5KISHUiOTZSg+PZK
   3QdYjBO5f5qGii8JcoDJYcJVbze9ajrIRTtIwyMTFPrafABBtmUnKXmSE
   g==;
X-CSE-ConnectionGUID: 3ziNoRN8Qd646LI7dmBZGg==
X-CSE-MsgGUID: KqlQfh9rTJWeLbF4AFXV4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="70979405"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="70979405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:30:04 -0800
X-CSE-ConnectionGUID: hxoRms/XQeW3zbu9VYpNCQ==
X-CSE-MsgGUID: qMxDtETuSwGp66ogCtei0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200067632"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:29:56 -0800
Message-ID: <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
Date: Mon, 8 Dec 2025 17:29:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-38-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-38-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013004_512851_9770B2E2 
X-CRM114-Status: GOOD (  19.58  )
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

Ck9uIDEyLzYvMjAyNSA4OjE3IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IEFkZCBh
IGhlbHBlciB0byByZW1vdmUgYW4gTVNSIGZyb20gYW4gYXV0by17bG9hZCxzdG9yZX0gbGlzdCB0
byBkZWR1cCB0aGUKPiBtc3JfYXV0b2xvYWQgY29kZSwgYW5kIGluIGFudGljaXBhdGlvbiBvZiBh
ZGRpbmcgc2ltaWxhciBmdW5jdGlvbmFsaXR5IGZvcgo+IG1zcl9hdXRvc3RvcmUuCj4KPiBObyBm
dW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jIHwgMzEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKPiBpbmRleCA1MmJj
YjgxN2NjMTUuLmE1MWY2NmQxYjIwMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jCj4gKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwo+IEBAIC0xMDQwLDkgKzEwNDAsMjIg
QEAgc3RhdGljIGludCB2bXhfZmluZF9sb2Fkc3RvcmVfbXNyX3Nsb3Qoc3RydWN0IHZteF9tc3Jz
ICptLCB1MzIgbXNyKQo+ICAJcmV0dXJuIC1FTk9FTlQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lk
IHZteF9yZW1vdmVfYXV0b19tc3Ioc3RydWN0IHZteF9tc3JzICptLCB1MzIgbXNyLAo+ICsJCQkJ
dW5zaWduZWQgbG9uZyB2bWNzX2NvdW50X2ZpZWxkKQo+ICt7Cj4gKwlpbnQgaTsKPiArCj4gKwlp
ID0gdm14X2ZpbmRfbG9hZHN0b3JlX21zcl9zbG90KG0sIG1zcik7Cj4gKwlpZiAoaSA8IDApCj4g
KwkJcmV0dXJuOwo+ICsKPiArCS0tbS0+bnI7Cj4gKwltLT52YWxbaV0gPSBtLT52YWxbbS0+bnJd
OwoKU29tZXRpbWVzIHRoZSBvcmRlciBvZiBNU1Igd3JpdGluZyBkb2VzIG1hdHRlciwgZS5nLiwg
UEVSRl9HTE9CQUxfQ1RSTCBNU1IKc2hvdWxkIGJlIHdyaXR0ZW4gYXQgbGFzdCBhZnRlciBhbGwg
UE1VIE1TUiB3cml0aW5nLiBTbyBkaXJlY3RseSBtb3ZpbmcgdGhlCmxhc3QgTVNSIGVudHJ5IGlu
dG8gY2xlYXJlZCBvbmUgY291bGQgYnJlYWsgdGhlIE1TUiB3cml0aW5nIHNlcXVlbmNlIGFuZApt
YXkgY2F1c2UgaXNzdWUgaW4gdGhlb3J5LgoKSSBrbm93IHRoaXMgd29uJ3QgcmVhbGx5IGNhdXNl
IGlzc3VlIHNpbmNlIGN1cnJlbnRseSB2UE1VIHdvbid0IHVzZSB0aGUgTVNSCmF1dG8tbG9hZCBm
ZWF0dXJlIHRvIHNhdmUgYW55IFBNVSBNU1IsIGJ1dCBpdCdzIHN0aWxsIHVuc2FmZSBmb3IgZnV0
dXJlIHVzZXMuwqAKCkknbSBub3Qgc3VyZSBpZiBpdCdzIHdvcnRoeSB0byBkbyB0aGUgc3RyaWN0
IE1TUiBlbnRyeSBzaGlmdCByaWdodCBub3cuClBlcmhhcHMgd2UgY291bGQgYWRkIGEgbWVzc2Fn
ZSB0byB3YXJuIHVzZXJzIGF0IGxlYXN0LgoKVGhhbmtzLgoKCj4gKwl2bWNzX3dyaXRlMzIodm1j
c19jb3VudF9maWVsZCwgbS0+bnIpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBjbGVhcl9hdG9t
aWNfc3dpdGNoX21zcihzdHJ1Y3QgdmNwdV92bXggKnZteCwgdW5zaWduZWQgbXNyKQo+ICB7Cj4g
LQlpbnQgaTsKPiAgCXN0cnVjdCBtc3JfYXV0b2xvYWQgKm0gPSAmdm14LT5tc3JfYXV0b2xvYWQ7
Cj4gIAo+ICAJc3dpdGNoIChtc3IpIHsKPiBAQCAtMTA2MywyMSArMTA3Niw5IEBAIHN0YXRpYyB2
b2lkIGNsZWFyX2F0b21pY19zd2l0Y2hfbXNyKHN0cnVjdCB2Y3B1X3ZteCAqdm14LCB1bnNpZ25l
ZCBtc3IpCj4gIAkJfQo+ICAJCWJyZWFrOwo+ICAJfQo+IC0JaSA9IHZteF9maW5kX2xvYWRzdG9y
ZV9tc3Jfc2xvdCgmbS0+Z3Vlc3QsIG1zcik7Cj4gLQlpZiAoaSA8IDApCj4gLQkJZ290byBza2lw
X2d1ZXN0Owo+IC0JLS1tLT5ndWVzdC5ucjsKPiAtCW0tPmd1ZXN0LnZhbFtpXSA9IG0tPmd1ZXN0
LnZhbFttLT5ndWVzdC5ucl07Cj4gLQl2bWNzX3dyaXRlMzIoVk1fRU5UUllfTVNSX0xPQURfQ09V
TlQsIG0tPmd1ZXN0Lm5yKTsKPiAgCj4gLXNraXBfZ3Vlc3Q6Cj4gLQlpID0gdm14X2ZpbmRfbG9h
ZHN0b3JlX21zcl9zbG90KCZtLT5ob3N0LCBtc3IpOwo+IC0JaWYgKGkgPCAwKQo+IC0JCXJldHVy
bjsKPiAtCj4gLQktLW0tPmhvc3QubnI7Cj4gLQltLT5ob3N0LnZhbFtpXSA9IG0tPmhvc3QudmFs
W20tPmhvc3QubnJdOwo+IC0Jdm1jc193cml0ZTMyKFZNX0VYSVRfTVNSX0xPQURfQ09VTlQsIG0t
Pmhvc3QubnIpOwo+ICsJdm14X3JlbW92ZV9hdXRvX21zcigmbS0+Z3Vlc3QsIG1zciwgVk1fRU5U
UllfTVNSX0xPQURfQ09VTlQpOwo+ICsJdm14X3JlbW92ZV9hdXRvX21zcigmbS0+aG9zdCwgbXNy
LCBWTV9FWElUX01TUl9MT0FEX0NPVU5UKTsKPiAgfQo+ICAKPiAgc3RhdGljIF9fYWx3YXlzX2lu
bGluZSB2b2lkIGFkZF9hdG9taWNfc3dpdGNoX21zcl9zcGVjaWFsKHN0cnVjdCB2Y3B1X3ZteCAq
dm14LAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
