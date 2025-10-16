Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5475CCD193
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 00:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isMopbRNx8ehI4n9fPN6pJXE8ktkKVob7oQASBL1Nss=; b=PaNd4wxOwdQ+7C
	HJMzkStJ6m7NepHMmowGoIxDuqHZS6j+TEyDKdlq1sY+jGG/BtzQe8HjmvCWdoU1DnTDhMbY/u016
	hD9cDcitjpaisyzHttNdVe/XZ9/DAEi1hoSQKOLIkKuou1iXLIn6YcTzepM74FO/0F3LhXjCUk6y0
	47iL7ulEe0Gt2m/gYFnRDadXgnlTt3YWQbLQlAbrhJ0d8OtB+iBEn1LcySfkyJbyXFh0kbzqusAx6
	RQODKRrPMjP1ixfvAWoBwuVeVBLRFMirIH7s12oydskRb33IdTWMNiHQX7EVjtzoyrXC8Jegnch7B
	cp85/M90DI9a6Px07deg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BU1-000000037Gp-0lui;
	Thu, 16 Oct 2025 00:04:41 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BTx-000000037Fz-3yVT;
	Thu, 16 Oct 2025 00:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760573078; x=1792109078;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+JrivgWyUgg+pmx0+52mYBdTXkR4tEzcKUO0ehqXf7s=;
  b=QvcBuq3wY1Cl1T1klhEt90xTeZT/mspknFP/SmDDRGi8sYmv4bF+n/d8
   R2PDDAI7bLHb8BFyWwQ/E4z/5tChdE1frjPOIuYj3+3oqNMl0tx+gQLqw
   Qz91cfrAcCo1O+V0PI7mcF0GFFiajcFuTeSvhVoAyjoWdrpNHoeR7w31j
   ShlrDu+FGFRBtrxorrioQc6v8XfxZ1+bjnFlJXKDquqa/AJITR08TmMFq
   +MDxHNtgcHGj5Ol7kZN1RvN4FcrpWYoZkZBA7FJtV4JOqa6DfzLG59JfE
   kHZsH3xTZHHnY7jOvFYlC0wCvB3NkzCP1M1hqbU58LTTOZ31Oxz20pWXu
   g==;
X-CSE-ConnectionGUID: 5+fpaFsxQcqkAsuhKs9DJQ==
X-CSE-MsgGUID: LTFRNXMiT2ypeKIU8bRbug==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85377194"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="85377194"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:04:36 -0700
X-CSE-ConnectionGUID: R752COMtRQqyVd5oHvt9WQ==
X-CSE-MsgGUID: 3PO6qZFiQTmjq3l7JbpGAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182097810"
Received: from unknown (HELO [10.238.2.75]) ([10.238.2.75])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:04:29 -0700
Message-ID: <ea123839-80fd-4555-8da2-adbd060a2082@linux.intel.com>
Date: Thu, 16 Oct 2025 08:04:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
To: Sean Christopherson <seanjc@google.com>
Cc: Sandipan Das <sandidas@amd.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-33-seanjc@google.com>
 <f896966e-8925-4b4f-8f0d-f1ae8aa197f7@amd.com> <aN1vfykNs8Dmv_g0@google.com>
 <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
 <aO_slNn8X1A84sI-@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aO_slNn8X1A84sI-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_170438_147848_61786440 
X-CRM114-Status: GOOD (  14.50  )
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

Ck9uIDEwLzE2LzIwMjUgMjo0OCBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiBPbiBU
aHUsIE9jdCAwOSwgMjAyNSwgRGFwZW5nIE1pIHdyb3RlOgo+PiBPbiAxMC8yLzIwMjUgMjoxNCBB
TSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPj4+IE9uIEZyaSwgU2VwIDI2LCAyMDI1LCBT
YW5kaXBhbiBEYXMgd3JvdGU6Cj4+Pj4gT24gOC83LzIwMjUgMToyNiBBTSwgU2VhbiBDaHJpc3Rv
cGhlcnNvbiB3cm90ZToKPj4+Pj4gKwlyZXR1cm4ga3ZtX25lZWRfcGVyZl9nbG9iYWxfY3RybF9p
bnRlcmNlcHQodmNwdSkgfHwKPj4+Pj4gIAkgICAgICAgcG11LT5jb3VudGVyX2JpdG1hc2tbS1ZN
X1BNQ19HUF0gIT0gKEJJVF9VTEwoa3ZtX2hvc3RfcG11LmJpdF93aWR0aF9ncCkgLSAxKSB8fAo+
Pj4+PiAgCSAgICAgICBwbXUtPmNvdW50ZXJfYml0bWFza1tLVk1fUE1DX0ZJWEVEXSAhPSAoQklU
X1VMTChrdm1faG9zdF9wbXUuYml0X3dpZHRoX2ZpeGVkKSAtIDEpOwo+Pj4+PiAgfQo+Pj4+IFRo
ZXJlIGlzIGEgY2FzZSBmb3IgQU1EIHByb2Nlc3NvcnMgd2hlcmUgdGhlIGdsb2JhbCBNU1JzIGFy
ZSBhYnNlbnQgaW4gdGhlIGd1ZXN0Cj4+Pj4gYnV0IHRoZSBndWVzdCBzdGlsbCB1c2VzIHRoZSBz
YW1lIG51bWJlciBvZiBjb3VudGVycyBhcyB3aGF0IGlzIGFkdmVydGlzZWQgYnkgdGhlCj4+Pj4g
aG9zdCBjYXBhYmlsaXRpZXMuIFNvIFJEUE1DIGludGVyY2VwdGlvbiBpcyBub3QgbmVjZXNzYXJ5
IGZvciBhbGwgY2FzZXMgd2hlcmUKPj4+PiBnbG9iYWwgY29udHJvbCBpcyB1bmF2YWlsYWJsZS5v
Cj4+PiBIbW0sIEkgdGhpbmsgSW50ZWwgd291bGQgYmUgdGhlIHNhbWU/ICBBaCwgbm8sIGJlY2F1
c2UgdGhlIGhvc3Qgd2lsbCBoYXZlIGZpeGVkCj4+PiBjb3VudGVycywgYnV0IHRoZSBndWVzdCB3
aWxsIG5vdC4gIEhvd2V2ZXIsIHRoYXQncyBub3QgZGlyZWN0bHkgcmVsYXRlZCB0bwo+Pj4ga3Zt
X3BtdV9oYXNfcGVyZl9nbG9iYWxfY3RybCgpLCBzbyBJIHRoaW5rIHRoaXMgd291bGQgYmUgY29y
cmVjdD8KPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3BtdS5jIGIvYXJjaC94ODYv
a3ZtL3BtdS5jCj4+PiBpbmRleCA0NDE0ZDA3MGM0ZjkuLjRjNWIyNzEyZWU0YyAxMDA2NDQKPj4+
IC0tLSBhL2FyY2gveDg2L2t2bS9wbXUuYwo+Pj4gKysrIGIvYXJjaC94ODYva3ZtL3BtdS5jCj4+
PiBAQCAtNzQ0LDE2ICs3NDQsMTMgQEAgaW50IGt2bV9wbXVfcmRwbWMoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBpZHgsIHU2NCAqZGF0YSkKPj4+ICAgICAgICAgcmV0dXJuIDA7Cj4+
PiAgfQo+Pj4gIAo+Pj4gLWJvb2wga3ZtX25lZWRfcGVyZl9nbG9iYWxfY3RybF9pbnRlcmNlcHQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Pj4gK3N0YXRpYyBib29sIGt2bV9uZWVkX3BtY19pbnRl
cmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+PiBUaGUgZnVuY3Rpb24gbmFtZSBrdm1fbmVl
ZF9wbWNfaW50ZXJjZXB0KCkgc2VlbXMgYSBsaXR0bGUgYml0IG1pc2xlYWRpbmcKPj4gYW5kIG1h
a2UgdXNlcnMgdGhpbmsgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNoZWNrIGlmIGEgY2VydGFp
biBQTUMgaXMKPj4gaW50ZXJjZXB0ZWQuIE1heWJlIHdlIGNhbiByZW5hbWUgdGhlIGZ1bmN0aW9u
IHRvwqBrdm1fbmVlZF9nbG9iYWxfaW50ZXJjZXB0KCkuCj4gWWVhaCwgSSBkb24ndCBsb3ZlIGt2
bV9uZWVkX3BtY19pbnRlcmNlcHQoKSBlaXRoZXIuICBCdXQga3ZtX25lZWRfZ2xvYmFsX2ludGVy
Y2VwdCgpCj4gZmVlbHMgdG9vIGNsb3NlIHRvIGt2bV9uZWVkX3BlcmZfZ2xvYmFsX2N0cmxfaW50
ZXJjZXB0KCkuCj4KPiBNYXliZSBzb21ldGhpbmcgbGlrZSBrdm1fbmVlZF9hbnlfcG1jX2ludGVy
Y2VwdCgpPwoKSXQgc291bmRzIGdvb2QgdG8gbWUuIFRoYW5rcy4KCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
