Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66820CCD1A5
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 07:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXtMQLiU7mieEIT3HNg6OrAWCFJu6C+HFXmx4PtQAlo=; b=pCT1jE/wf4bB7Z
	4n9JoG1rjNlm7feb5ckXgqK1jkpXfYFKt+dicPFYz6ux9ADnlXLK9boDTNyJWrLZkyJ2M2lW0n/22
	mQw6LcC+acHS/Pox3YBZjNK63M1jxsRtaMUfbkU+8u9FHda4Og3pGNzAG57GDnGoL3WENn46ACLjt
	YY56A7+P+TgnM3kUOI+jH+W7ocYX6w758QyNGF3cnRGP+ekpmxtP3sbfZioZkw3vzwi9nR56Vuhho
	Mp6+diM1PJf0L6mE9gYnBCgDGMj9SJ/ISgbZdQm0k10uOUFhTVwqCVBvlMB+j68O6g4olO6lySATs
	oAef2hxCm3mnVaiT0q9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCO3-00000008XCJ-0d5m;
	Fri, 24 Oct 2025 07:38:59 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCO0-00000008XBE-0rK1;
	Fri, 24 Oct 2025 07:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761291537; x=1792827537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mqrmnotooRW9zCLkNbwsBqACdnSVp7ozY0nJzWJwIdI=;
  b=VDZnkcOiK5jMO2ANywbp1hhvrsp5/LL+/HJkLKpH+rGvx/WbmJfgktB2
   8JVC1seEsBZPltlYvCeaaHMwTFUmjX+pG15rxOASdK0WWdn/lFotrGo/Y
   Es1lxCz8gBsVhoqAZZ4sFhC11PPEieJe3STILpG/CTasr1Cl4UIUfh9AU
   J5PkIl0tYKFOlVyyfW9nzYeNzzlFOoNlNwHk7gegnIWEYq7FS2m1P8K9l
   xj0P2aCU4igJKAX6spZU2U9fuQC4F+t4L0TPqHYJth1lf9vLPpJfTItj2
   guodjgaL3EwcQTKxAHHHeLjC57djzpZmi8diDXqkz63yiGBBF0bODFNHQ
   g==;
X-CSE-ConnectionGUID: TdVH6mYpSSqLW2OtJimUKA==
X-CSE-MsgGUID: RuFjE/tgT12ZkUc7P5D22A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86100988"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="86100988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:56 -0700
X-CSE-ConnectionGUID: UxV1qHb2TCSYa+TzbX0Eow==
X-CSE-MsgGUID: EwmjUoGZTCaYHb6B07GYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="188424583"
Received: from binbinwu-mobl.ccr.corp.intel.com (HELO [10.124.235.70]) ([10.124.235.70])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:38:46 -0700
Message-ID: <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
Date: Fri, 24 Oct 2025 15:38:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt()
 into its sole caller
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ackerley Tng <ackerleytng@google.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-14-seanjc@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251017003244.186495-14-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003856_295000_5940251E 
X-CRM114-Status: GOOD (  13.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8xNy8yMDI1IDg6MzIgQU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gRm9s
ZCB0ZHhfbWVtX3BhZ2VfcmVjb3JkX3ByZW1hcF9jbnQoKSBpbnRvIHRkeF9zZXB0X3NldF9wcml2
YXRlX3NwdGUoKSBhcwo+IHByb3ZpZGluZyBhIG9uZS1vZmYgaGVscGVyIGZvciBlZmZlY3RpdmVs
eSB0aHJlZSBsaW5lcyBvZiBjb2RlIGlzIGF0IGJlc3QgYQo+IHdhc2gsIGFuZCBzcGxpdHRpbmcg
dGhlIGNvZGUgbWFrZXMgdGhlIGNvbW1lbnQgZm9yIHNtcF9ybWIoKSAgX2V4dHJlbWVseV8KPiBj
b25mdXNpbmcgYXMgdGhlIGNvbW1lbnQgdGFsa3MgYWJvdXQgcmVhZGluZyBrdm0tPmFyY2gucHJl
X2ZhdWx0X2FsbG93ZWQKPiBiZWZvcmUga3ZtX3RkeC0+c3RhdGUsIGJ1dCB0aGUgaW1tZWRpYXRl
bHkgdmlzaWJsZSBjb2RlIGRvZXMgdGhlIGV4YWN0Cj4gb3Bwb3NpdGUuCj4KPiBPcHBvcnR1bmlz
dGljYWxseSByZXdyaXRlIHRoZSBjb21tZW50cyB0byBtb3JlIGV4cGxpY2l0bHkgZXhwbGFpbiB3
aG8gaXMKPiBjaGVja2luZyB3aGF0LCBhcyB3ZWxsIGFzIF93aHlfIHRoZSBvcmRlcmluZyBtYXR0
ZXJzLgo+Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4KPiBSZXZpZXdlZC1ieTog
UmljayBFZGdlY29tYmUgPHJpY2sucC5lZGdlY29tYmVAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6
IEJpbmJpbiBXdSA8YmluYmluLnd1QGxpbnV4LmludGVsLmNvbT4KCk9uZSBuaXQgYmVsb3cuCgpb
Li4uXQo+ICsJLyoKPiArCSAqIElmIHRoZSBURCBpc24ndCBmaW5hbGl6ZWQvcnVubmFibGUsIHRo
ZW4gdXNlcnNwYWNlIGlzIGluaXRpYWxpemluZwo+ICsJICogdGhlIFZNIGltYWdlIHZpYSBLVk1f
VERYX0lOSVRfTUVNX1JFR0lPTi4gIEluY3JlbWVudCB0aGUgbnVtYmVyIG9mCj4gKwkgKiBwYWdl
cyB0aGF0IG5lZWQgdG8gYmUgbWFwcGVkIGFuZCBpbml0aWFsaXplZCB2aWEgVERILk1FTS5QQUdF
LkFERC4KPiArCSAqIEtWTV9URFhfRklOQUxJWkVfVk0gY2hlY2tzIHRoZSBjb3VudGVyIHRvIGVu
c3VyZSBhbGwgbWFwcGVkIHBhZ2VzCiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoF4KIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE5pdDogSXMgcHJlLW1hcHBlZCBiZXR0ZXI/Cj4g
KwkgKiBoYXZlIGJlZW4gYWRkZWQgdG8gdGhlIGltYWdlLCB0byBwcmV2ZW50IHJ1bm5pbmcgdGhl
IFREIHdpdGggYQo+ICsJICogdmFsaWQgbWFwcGluZyBpbiB0aGUgbWlycm9yIEVQVCwgYnV0IG5v
dCBpbiB0aGUgUy1FUFQuCj4gKwkgKi8KPiArCWlmICh1bmxpa2VseShrdm1fdGR4LT5zdGF0ZSAh
PSBURF9TVEFURV9SVU5OQUJMRSkpIHsKPiArCQlpZiAoS1ZNX0JVR19PTihrdm0tPmFyY2gucHJl
X2ZhdWx0X2FsbG93ZWQsIGt2bSkpCj4gKwkJCXJldHVybiAtRUlPOwo+ICsKPiArCQlhdG9taWM2
NF9pbmMoJmt2bV90ZHgtPm5yX3ByZW1hcHBlZCk7Cj4gKwkJcmV0dXJuIDA7Cj4gKwl9Cj4gKwo+
ICsJcmV0dXJuIHRkeF9tZW1fcGFnZV9hdWcoa3ZtLCBnZm4sIGxldmVsLCBwZm4pOwo+ICAgfQo+
ICAgCj4gICBzdGF0aWMgaW50IHRkeF9zZXB0X2xpbmtfcHJpdmF0ZV9zcHQoc3RydWN0IGt2bSAq
a3ZtLCBnZm5fdCBnZm4sCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
