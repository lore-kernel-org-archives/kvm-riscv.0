Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61029E7AD40
	for <kvm-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJXIRxr/EEa99EFUBJluBRl0YXNYLN+zSfwxyXHILwU=; b=OgOZkeaukb+iq4
	hCw0L/eTcY5ayuy2ku3+pmpwh6p60vEDPPHOdoaeIQUMJEhCEaDQ8Qhr/senApLTXdznP4jAPFDwC
	gtkrXPFn8oidVEC4T6RtLu6U1/F73ePnxXipXYcr3Gstt9W+Ffn9aBEpA6UfNzxBGXQlnu00TFiQg
	0aPLgbqX601AEbxE7K/zmrQIOU8LaU66Mc438e087FcM9BDXaK9tW7XeahL6jnLy4VugJOeTlRQw0
	DVVreYZO7/m9jQc4zH2+TTdOZI+MBvlSgFedOfELxO4GoM6AFQvILJ0zJiknaE65uxP2kPaQJffZI
	MB1m5AtWGxAdOzfL39QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoW-000000007va-3e0A;
	Thu, 25 Dec 2025 06:27:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYeoU-000000007ug-34PH;
	Thu, 25 Dec 2025 06:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766644027; x=1798180027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p1XfubM0YWj6WnMP8u+aCWSf2k0v8QcI9Wgv+fon5Ck=;
  b=E4dzvruNcXQE5dw9kyc+jRTBrmIE7QvS576jan+va5QuBsyRkHFlktZH
   vS/jnf6/P0u400jmA2rsbb2BQmmm2qun4SR/Xcsa79iHWj80++5q4vlVY
   LKhE+gXWjunWXMVTVyp5HlAFlMe6KxxmVMYU42qVkeWNEDxNUeAuPrK/F
   9/JZZhfCsAIv1FOKpt0qc53RNF+jHSoTLTBLNWwelZh8DMgTQFjje2r+a
   6cCb3dznAgHmk8riR5vVQZH4dMfne9Dey9KfneJg/RkABA1/qKC6rLnH8
   5BpiLgNRR4KWcJuxdFqdzXA1+moZ/16Jr51pec23Hvjhg9nbFNbDKoV17
   g==;
X-CSE-ConnectionGUID: OTv80gozRRqW02uziagCxA==
X-CSE-MsgGUID: tcAwYgnpTG+NBpXxdUordw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68340500"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68340500"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:27:06 -0800
X-CSE-ConnectionGUID: DUtRii2LTCeg4q7vXPJ1zA==
X-CSE-MsgGUID: a7dRTs5tS6S+a0BISdFYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200649863"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 22:26:59 -0800
Message-ID: <43d1cde6-2277-4f3c-8e7d-59e6edb2228a@linux.intel.com>
Date: Thu, 25 Dec 2025 14:26:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/44] KVM: x86/pmu: Snapshot host (i.e. perf's)
 reported PMU capabilities
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
 <20251206001720.468579-16-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-16-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_222706_805582_8A8BBD19 
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

Ck9uIDEyLzYvMjAyNSA4OjE2IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IFRha2Ug
YSBzbmFwc2hvdCBvZiB0aGUgdW5hZHVsdGVyYXRlZCBQTVUgY2FwYWJpbGl0aWVzIHByb3ZpZGVk
IGJ5IHBlcmYgc28KPiB0aGF0IEtWTSBjYW4gY29tcGFyZSBndWVzdCB2UE1VIGNhcGFiaWxpdGll
cyBhZ2FpbnN0IGhhcmR3YXJlIGNhcGFiaWxpdGllcwo+IHdoZW4gZGV0ZXJtaW5pbmcgd2hldGhl
ciBvciBub3QgdG8gaW50ZXJjZXB0IFBNVSBNU1JzIChhbmQgUkRQTUMpLgo+Cj4gUmV2aWV3ZWQt
Ynk6IFNhbmRpcGFuIERhcyA8c2FuZGlwYW4uZGFzQGFtZC5jb20+Cj4gVGVzdGVkLWJ5OiBYdWRv
bmcgSGFvIDx4dWRvbmcuaGFvQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgYXJjaC94ODYva3ZtL3BtdS5j
IHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL3BtdS5jIGIvYXJjaC94ODYva3ZtL3BtdS5jCj4gaW5kZXggNDg3YWQx
OWEyMzZlLi43YzIxOTMwNWI2MWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYva3ZtL3BtdS5jCj4g
KysrIGIvYXJjaC94ODYva3ZtL3BtdS5jCj4gQEAgLTEwOCw2ICsxMDgsOCBAQCB2b2lkIGt2bV9p
bml0X3BtdV9jYXBhYmlsaXR5KGNvbnN0IHN0cnVjdCBrdm1fcG11X29wcyAqcG11X29wcykKPiAg
CWJvb2wgaXNfaW50ZWwgPSBib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9J
TlRFTDsKPiAgCWludCBtaW5fbnJfZ3BfY3RycyA9IHBtdV9vcHMtPk1JTl9OUl9HUF9DT1VOVEVS
UzsKPiAgCj4gKwlwZXJmX2dldF94ODZfcG11X2NhcGFiaWxpdHkoJmt2bV9ob3N0X3BtdSk7Cj4g
Kwo+ICAJLyoKPiAgCSAqIEh5YnJpZCBQTVVzIGRvbid0IHBsYXkgbmljZSB3aXRoIHZpcnR1YWxp
emF0aW9uIHdpdGhvdXQgY2FyZWZ1bAo+ICAJICogY29uZmlndXJhdGlvbiBieSB1c2Vyc3BhY2Us
IGFuZCBLVk0ncyBBUElzIGZvciByZXBvcnRpbmcgc3VwcG9ydGVkCgpIaSBTZWFuLAoKSXQgbG9v
a3MgYSBtZXJnaW5nIGVycm9yIGhlcmUuIFdlIGRvbid0IG5lZWQgdGhpcyBwYXRjaC4KClRoZSBv
cmlnaW5hbCBwYXRjaCAiNTFmMzRiMSAoIktWTTogeDg2L3BtdTogU25hcHNob3QgaG9zdCAoaS5l
LiBwZXJmJ3MpCnJlcG9ydGVkIFBNVSBjYXBhYmlsaXRpZXMiKSIgaGFkIGJlZW4gbWVyZ2VkIGlu
dG8gdXBzdHJlYW0gYW5kIHN1YnNlcXVlbnRseQp3ZSBzdWJtaXR0ZWQgYSBuZXcgcGF0Y2ggIjAz
NDQxN2MxNDM5YSAoIktWTTogeDg2L3BtdTogRG9uJ3QgdHJ5IHRvIGdldApwZXJmIGNhcGFiaWxp
dGllcyBmb3IgaHlicmlkIENQVXMiKSIgdG8gZml4IHRoZSB3YXJuaW5nIGludHJvZHVjZWQgZnJv
bQpwcmV2aW91cyBwYXRjaMKgICI1MWYzNGIxICgiS1ZNOiB4ODYvcG11OiBTbmFwc2hvdCBob3N0
IChpLmUuIHBlcmYncykKcmVwb3J0ZWQgUE1VIGNhcGFiaWxpdGllcyIpIi4gVGhhbmtzLgoKLURh
cGVuZyBNaQoKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
