Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81102D3B9B6
	for <kvm-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 01:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E99aMaqzpYFsUEjFBv1SqA8ZLCipH17x3TFxaVfSs6Q=; b=cyUzYhGXMnhOKf
	8uNWu297BsFsT6+jGuQJzko4FhesC2ZAYjlPJwIQJRDi/1+SdvnH/4HXMzNd2Bm5C+eQ3zJ7H6zBw
	5U2zdiAE3b7mLhH2fgArBZ/ZnTv0FXCQ4pxh8yQ1mhRYR1J/ZALUGHhfGgqF7t5aZNWJ0rylQyVT2
	C2rxB0mmIV8jMZak7zYd2iWqg+VpKjfSaGYY7IaWZUYoaY72wC59d9mikFOqjf8TroC5i8Vvay5HU
	LDhoAy0tBuJNy3Yi0/1aOig+NecDWqEYICANQ8Ns4ns3W11ATp2Z8tpabLA6ldvEKyrHzLP/lnSCD
	03jPr1ca+qh/kMX4Mmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8hW-0000000Exfm-2QGr;
	Wed, 10 Dec 2025 01:09:06 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT8hU-0000000ExfL-1Vtd;
	Wed, 10 Dec 2025 01:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765328944; x=1796864944;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7Sw6PITpzapkD99/tAnwNI3D6Ucw9JU8bsiOsehlJts=;
  b=FoffeohhpA77GufSVMykhaVh+BaJakLO/wN/IbFWz848fbMsH4RYAqZe
   tIwFhRasNS+/2t0tS3vVxvDAt3zCzXZUk45arf75G1xQ9dEvTnrLR1fke
   aBJdY3mo3l6WTVu9V7O5MpGe/MQYHg8yNC80wv6HdOE4Yc02RW0tMz0zK
   T9we6Uq+mJRWQQFrBoMFP8bWHC2YRGG/PZxWDvuMD0nzi+Z7u6Duko1jg
   Qfl6TXWZnGoy+0O6kas3LMBDrzpvE8nfnsti3J+HD2h8eUX0BgKvaKmlD
   kVQ5mPE/pBy6nsHaVXsTlJu2hShAJ4Eww5936UZtnJeykAywxKZaWhnUD
   g==;
X-CSE-ConnectionGUID: irH/A8EGRC6JQB2YauS2rQ==
X-CSE-MsgGUID: Al43oxFuT8mNQdHkmn1GIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67190221"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67190221"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:09:02 -0800
X-CSE-ConnectionGUID: 21iGYDOORw+11NIMlPnpaw==
X-CSE-MsgGUID: WFDJ3r6bSDGlQ9mRnDj7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="200862410"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:08:54 -0800
Message-ID: <fad66209-6dc1-4067-87df-9aa1105e3017@linux.intel.com>
Date: Wed, 10 Dec 2025 09:08:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 37/44] KVM: VMX: Dedup code for removing MSR from
 VMCS's auto-load list
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-38-seanjc@google.com>
 <2440b9bf-a2a1-4f66-94b2-71f47d62f3db@linux.intel.com>
 <aTheSQb9fhXmZKw6@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aTheSQb9fhXmZKw6@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_170904_437490_753B2AC9 
X-CRM114-Status: GOOD (  26.72  )
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

Ck9uIDEyLzEwLzIwMjUgMTozNyBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBPbiBN
b24sIERlYyAwOCwgMjAyNSwgRGFwZW5nIE1pIHdyb3RlOgo+PiBPbiAxMi82LzIwMjUgODoxNyBB
TSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPj4+IEFkZCBhIGhlbHBlciB0byByZW1vdmUg
YW4gTVNSIGZyb20gYW4gYXV0by17bG9hZCxzdG9yZX0gbGlzdCB0byBkZWR1cCB0aGUKPj4+IG1z
cl9hdXRvbG9hZCBjb2RlLCBhbmQgaW4gYW50aWNpcGF0aW9uIG9mIGFkZGluZyBzaW1pbGFyIGZ1
bmN0aW9uYWxpdHkgZm9yCj4+PiBtc3JfYXV0b3N0b3JlLgo+Pj4KPj4+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJz
b24gPHNlYW5qY0Bnb29nbGUuY29tPgo+Pj4gLS0tCj4+PiAgYXJjaC94ODYva3ZtL3ZteC92bXgu
YyB8IDMxICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCj4+PiBpbmRl
eCA1MmJjYjgxN2NjMTUuLmE1MWY2NmQxYjIwMSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L2t2
bS92bXgvdm14LmMKPj4+ICsrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKPj4+IEBAIC0xMDQw
LDkgKzEwNDAsMjIgQEAgc3RhdGljIGludCB2bXhfZmluZF9sb2Fkc3RvcmVfbXNyX3Nsb3Qoc3Ry
dWN0IHZteF9tc3JzICptLCB1MzIgbXNyKQo+Pj4gIAlyZXR1cm4gLUVOT0VOVDsKPj4+ICB9Cj4+
PiAgCj4+PiArc3RhdGljIHZvaWQgdm14X3JlbW92ZV9hdXRvX21zcihzdHJ1Y3Qgdm14X21zcnMg
Km0sIHUzMiBtc3IsCj4+PiArCQkJCXVuc2lnbmVkIGxvbmcgdm1jc19jb3VudF9maWVsZCkKPj4+
ICt7Cj4+PiArCWludCBpOwo+Pj4gKwo+Pj4gKwlpID0gdm14X2ZpbmRfbG9hZHN0b3JlX21zcl9z
bG90KG0sIG1zcik7Cj4+PiArCWlmIChpIDwgMCkKPj4+ICsJCXJldHVybjsKPj4+ICsKPj4+ICsJ
LS1tLT5ucjsKPj4+ICsJbS0+dmFsW2ldID0gbS0+dmFsW20tPm5yXTsKPj4gU29tZXRpbWVzIHRo
ZSBvcmRlciBvZiBNU1Igd3JpdGluZyBkb2VzIG1hdHRlciwgZS5nLiwgUEVSRl9HTE9CQUxfQ1RS
TCBNU1IKPj4gc2hvdWxkIGJlIHdyaXR0ZW4gYXQgbGFzdCBhZnRlciBhbGwgUE1VIE1TUiB3cml0
aW5nLgo+IEhtbSwgbm8uICBfSWZfIEtWTSB3ZXJlIHdyaXRpbmcgZXZlbnQgc2VsZWN0b3JzIHVz
aW5nIHRoZSBhdXRvLWxvYWQgbGlzdHMsIHRoZW4KPiBLVk0gd291bGQgbmVlZCB0byBib29rZW5k
IHRoZSBldmVudCBzZWxlY3RvciBNU1JzIHdpdGggUEVSRl9HTE9CQUxfQ1RSTD0wIGFuZAo+IFBF
UkZfR0xPQkFMX0NUUkw9PG5ldyBjb250ZXh0IChndWVzdCB2cy4gaG9zdCk+LiAgRS5nLiBzbyB0
aGF0IGd1ZXN0IFBNQyBjb3VudHMKPiBhcmVuJ3QgcG9sbHV0ZWQgd2l0aCBob3N0IGV2ZW50cywg
YW5kIHZpY2UgdmVyc2EuCj4KPiBBcyB0aGluZ3Mgc3RhbmQgdG9kYXksIHRoZSBvbmx5IG90aGVy
IE1TUnMgYXJlIFBFQlMgYW5kIHRoZSBEUyBhcmVhIGNvbmZpZ3VyYXRpb24KPiBzdHVmZiwgYW5k
IGtpbmRhIHRvIG15IGVhcmxpZXIgcG9pbnQsIEtWTSBwcmUtemVyb2VzIE1TUl9JQTMyX1BFQlNf
RU5BQkxFIGFzIHBhcnQKPiBvZiBhZGRfYXRvbWljX3N3aXRjaF9tc3IoKSB0byBlbnN1cmUgYSBx
dWllc2NlbnQgcGVyaW9kIGJlZm9yZSBWTS1FbnRlci4KPgo+IEhlaCwgYW5kIHdyaXRpbmcgUEVS
Rl9HTE9CQUxfQ1RSTCBsYXN0IGZvciB0aGF0IHNlcXVlbmNlIG1pZ2h0IGFjdHVhbGx5IGJlCj4g
cHJvYmxlbWF0aWMuICBFLmcuIGxvYWQgaG9zdCBQRUJTIHdpdGggZ3Vlc3QgUEVSRl9HTE9CQUxf
Q1RSTCBhY3RpdmUuCj4KPiBBbnl3YXlzLCBJIGFncmVlIHRoYXQgdGhpcyBtaWdodCBiZSBicml0
dGxlLCBidXQgdGhpcyBpcyBhbGwgcHJlLWV4aXN0aW5nIGJlaGF2aW9yCj4gc28gSSBkb24ndCB3
YW50IHRvIHRhY2tsZSB0aGF0IGhlcmUgdW5sZXNzIGl0J3MgYWJzb2x1dGVseSBuZWNlc3Nhcnku
CgpZZWFoLCB0aGlzIHdvbid0IGNhdXNlIGFueSByZWFsIGlzc3VlIGZvciBjdXJyZW50IGNvZGUu
wqAKCgo+Cj4gT3Igd2FpdCwgYnkgIndyaXRpbmciIGRvIHlvdSBtZWFuICJ3cml0aW5nIE1TUnMg
dG8gbWVtb3J5IiwgYXMgb3Bwb3NlZCB0byAid3JpdGluZwo+IHZhbHVlcyB0byBNU1JzIj8gIFJl
Z2FyZGxlc3MsIEkgdGhpbmsgbXkgYW5zd2VyIGlzIHRoZSBzYW1lOiB0aGlzIGlzbid0IGEgcHJv
YmxlbQo+IHRvZGF5LCBzbyBJJ2QgcHJlZmVyIHRvIG5vdCBzaHVmZmxlIHRoZSBvcmRlcmluZyB1
bmxlc3MgaXQncyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4KCkFjdHVhbGx5IGJvdGguIEFzIFNETSBz
dWdnZXN0cywgY3VycmVudCBhbnkgbWFuaXB1bGF0aW9uIGZvciBQTVUgTVNScywgdGhlCmJlbG93
IG9yZGVyIHNob3VsZCBiZSBmb2xsb3dlZC4KCi0gZGlzYWJsZSBhbGwgUE1VIGNvdW50ZXJzIGJ5
IHdyaXRpbmcgUEVSRl9HTE9CQUxfQ1RSTCB0byAwLgoKLSBtYW5pcHVsYXRlIFBNVSBNU1JzLgoK
LSBFbmFibGUgdGhlIG5lZWRlZCBQTVUgY291bnRlcnMgYnkgd3JpdGluZyBQRVJGX0dMT0JBTF9D
VFJMLgoKU28gdGhlcmUgaXMgYSBpbXBsaWNpdCBvcmRlciBvbiB0aGUgTVNSIHdyaXRpbmcgaW4g
ZmFjdC7CoAoKRm9yIEtWTSwgaWYgTVNSIGF1dG8tbG9hZCBsaXN0IGZlYXR1cmUgaXMgdXNlZCB0
byBhdXRvbWF0aWNhbGx5IHJlc3RvcmUgdGhlCmhvc3QvZ3Vlc3QgTVNScywgS1ZNIG5lZWRzIHRv
IGZvbGxvdyB0aGUgYWJvdmUgb3JkZXIgdG8gZmlsbCB0aGUgTVNSCmF1dG8tbG9hZCBsaXN0IGFu
ZCB0aGVuIGV4cGVjdCB0aGVzZSBNU1JzIGFyZSB3cml0dGVuIGJ5IFZNWCBpbiB0aGUKZGVzaWdu
ZWQgb3JkZXIuCgpCdXQgc2luY2UgaXQgd29uJ3QgY2F1c2UgYW55IHJlYWwgaXNzdWUgbm93LCBp
dCdzIGZpbmUgZm9yIG1lIHRvIGhhbmRsZSBpdAp1bnRpbCB0aGVyZSBpcyBhIHJlYWwgbmVjZXNz
aXR5LgoKCj4KPj4gU28gZGlyZWN0bHkgbW92aW5nIHRoZSBsYXN0IE1TUiBlbnRyeSBpbnRvIGNs
ZWFyZWQgb25lIGNvdWxkIGJyZWFrIHRoZSBNU1IKPj4gd3JpdGluZyBzZXF1ZW5jZSBhbmQgbWF5
IGNhdXNlIGlzc3VlIGluIHRoZW9yeS4KPj4KPj4gSSBrbm93IHRoaXMgd29uJ3QgcmVhbGx5IGNh
dXNlIGlzc3VlIHNpbmNlIGN1cnJlbnRseSB2UE1VIHdvbid0IHVzZSB0aGUgTVNSCj4+IGF1dG8t
bG9hZCBmZWF0dXJlIHRvIHNhdmUgYW55IFBNVSBNU1IsIGJ1dCBpdCdzIHN0aWxsIHVuc2FmZSBm
b3IgZnV0dXJlIHVzZXMuwqAKPj4KPj4gSSdtIG5vdCBzdXJlIGlmIGl0J3Mgd29ydGh5IHRvIGRv
IHRoZSBzdHJpY3QgTVNSIGVudHJ5IHNoaWZ0IHJpZ2h0IG5vdy4KPj4KPj4gUGVyaGFwcyB3ZSBj
b3VsZCBhZGQgYSBtZXNzYWdlIHRvIHdhcm4gdXNlcnMgYXQgbGVhc3QuCj4gSG1tLCB5ZWFoLCBi
dXQgSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoZXJlL2hvdyBiZXN0IHRvIGRvY3VtZW50IHRoaXMu
ICBCZWNhdXNlCj4gaXQncyBub3QganVzdCB0aGF0IHZteF9yZW1vdmVfYXV0b19tc3IoKSBhcmJp
dHJhcmlseSBtYW5pdXBsYXRlcyB0aGUgb3JkZXIsIGUuZy4KPiBtdWx0aXBsZSBjYWxscyB0byB2
bXhfYWRkX2F1dG9fbXNyKCkgYXJlbid0IGd1YXJhbnRlZWQgdG8gcHJvdmlkZSBvcmRlcmluZyBi
ZWNhdXNlCj4gb25lIG9yIG1vcmUgTVNScyBtYXkgYWxyZWFkeSBiZSBpbiB0aGUgbGlzdC4gIEFu
ZCB0aGUgInNwZWNpYWwiIE1TUnMgdGhhdCBjYW4gYmUKPiBzd2l0Y2hlZCB2aWEgZGVkaWNhdGVk
IFZNQ1MgZmllbGRzIGZ1cnRoZXIgbXVkZHkgdGhlIHdhdGVycy4KPgo+IFNvIEknbSB0ZW1wdGVk
IHRvIG5vdCBhZGQgYSBjb21tZW50IHRvIHRoZSBoZWxwZXJzLCBvciBldmVuIHRoZSBzdHJ1Y3Qg
ZmllbGRzLAo+IGJlY2F1c2UgdW5mb3J0dW5hdGVseSBpdCdzIGxhcmdlbHkgYSAiSGVyZSBiZSBk
cmFnb25zISIgdHlwZSB3YXJuaW5nLiA6LS8KCkkgc2VlLiBUaGFua3MuCgoKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
