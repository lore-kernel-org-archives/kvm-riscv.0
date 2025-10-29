Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04365CCD1BF
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 06:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ONiEHidwSWmmLPhCw3QX4RBLblNMgCmge7iyGCRXxM=; b=eZhTwTtw7ad1kW
	/1Q8EA/O6LzdSlWizj27MSxHKdYlK+9/T0bU3p/A24030hnRUG9cYZBFKX6crC3U7tuOa7cMGwFZV
	fMSlwN7MkAt0zmaVnjDVq4K8ZEgED4o/pc8kkCZ3UomiPMK10i7a+zxgVBY/pF5TPH/oDVggE+0pU
	Wzy/V6OsBamBl72re9uMz+DfKlV8TKCFlmIbbuX5eIvmk01TUiim0LXIEVN2s1cAUFPsMrf79oNpW
	VzcgDNHWrbac1icLSOcH76z/UN56U+/fUpBkZUedpQAJW6Z8U550UdqJn/Of7FPuD1pAMARPYCdY7
	/dafqNdazxbGbug1cMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzow-0000000HVPc-1Tny;
	Wed, 29 Oct 2025 06:38:10 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDzou-0000000HVOd-2W5q;
	Wed, 29 Oct 2025 06:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761719888; x=1793255888;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GQBcTt3q3jYhlQdBtZfxngxuplRCCGIsPQTXwR3o7QE=;
  b=VutCnYb16ShCw0/WazHyKZT7AWhVGxvnYP4qm0V/GYgXxX829JEh7m5U
   RlUtIR6TEJrT/nIB5z3HDvy6hWA58RbUn/7periIfJXEkMxE0GuDRQqsG
   cwZ/br2MumbG/CnNYbIGf3OtZwDCgxtvq3YCPKe2jz8JXIzkBzUeD7XAE
   TAFVOq7jeglQTf5+JwXFmhNDLIUU+zGix1lt1U/RJQxj6UHbiWGvr81/j
   u2DaaE/2yeHEYvEtYAkjXm1rO/KrzCg6TSNLGzpcJMyp8NC6xbDehnZnj
   VP68/fWwAuDnGLSoaZJ5Tz7L9+vP5ZQN4JTAHBPs65yspdzXWF1KLUZfG
   w==;
X-CSE-ConnectionGUID: LGJTmKf1QtOrn1TabjqaMQ==
X-CSE-MsgGUID: neVnEXLJRUyLKD7R1I4wSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75176263"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="75176263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:38:04 -0700
X-CSE-ConnectionGUID: 8nQPxS3sQHujSGq7kBId9A==
X-CSE-MsgGUID: W9e750ZQTU6M5dFb3BxcwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="190701774"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:37:57 -0700
Message-ID: <71006f78-7afa-4821-8bd1-9cd5b8d62a33@linux.intel.com>
Date: Wed, 29 Oct 2025 14:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: seanjc@google.com, ackerleytng@google.com, anup@brainfault.org,
 aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, chenhuacai@kernel.org,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, ira.weiny@intel.com,
 kai.huang@intel.com, kas@kernel.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, maddy@linux.ibm.com, maobibo@loongson.cn,
 maz@kernel.org, michael.roth@amd.com, oliver.upton@linux.dev,
 palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
 vannapurve@google.com, x86@kernel.org, yan.y.zhao@intel.com,
 zhaotianrui@loongson.cn
References: <aP-1qlTkmFUgTld-@google.com>
 <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_233808_677325_F3A69F19 
X-CRM114-Status: GOOD (  32.47  )
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

CgpPbiAxMC8yOC8yMDI1IDg6MjggQU0sIFJpY2sgRWRnZWNvbWJlIHdyb3RlOgo+IFRha2UgTU1V
IGxvY2sgYXJvdW5kIHRkaF92cF9pbml0KCkgaW4gS1ZNX1REWF9JTklUX1ZDUFUgdG8gcHJldmVu
dAo+IG1lZXRpbmcgY29udGVudGlvbiBkdXJpbmcgcmV0cmllcyBpbiBzb21lIG5vLWZhaWwgTU1V
IHBhdGhzLgo+Cj4gVGhlIFREWCBtb2R1bGUgdGFrZXMgdmFyaW91cyB0cnktbG9ja3MgaW50ZXJu
YWxseSwgd2hpY2ggY2FuIGNhdXNlCj4gU0VBTUNBTExzIHRvIHJldHVybiBhbiBlcnJvciBjb2Rl
IHdoZW4gY29udGVudGlvbiBpcyBtZXQuIERlYWxpbmcgd2l0aAo+IGFuIGVycm9yIGluIHNvbWUg
b2YgdGhlIE1NVSBwYXRocyB0aGF0IG1ha2UgU0VBTUNBTExzIGlzIG5vdCBzdHJhaWdodAo+IGZv
cndhcmQsIHNvIEtWTSB0YWtlcyBzdGVwcyB0byBlbnN1cmUgdGhhdCB0aGVzZSB3aWxsIG1lZXQg
bm8gY29udGVudGlvbgo+IGR1cmluZyBhIHNpbmdsZSBCVVNZIGVycm9yIHJldHJ5LiBUaGUgd2hv
bGUgc2NoZW1lIHJlbGllcyBvbiBLVk0gdG8gdGFrZQo+IGFwcHJvcHJpYXRlIHN0ZXBzIHRvIGF2
b2lkIG1ha2luZyBhbnkgU0VBTUNBTExzIHRoYXQgY291bGQgY29udGVuZCB3aGlsZQo+IHRoZSBy
ZXRyeSBpcyBoYXBwZW5pbmcuCj4KPiBVbmZvcnR1bmF0ZWx5LCB0aGVyZSBpcyBhIGNhc2Ugd2hl
cmUgY29udGVudGlvbiBjb3VsZCBiZSBtZXQgaWYgdXNlcnNwYWNlCj4gZG9lcyBzb21ldGhpbmcg
dW51c3VhbC4gU3BlY2lmaWNhbGx5LCBob2xlIHB1bmNoaW5nIGEgZ21lbSBmZCB3aGlsZQo+IGlu
aXRpYWxpemluZyB0aGUgVEQgdkNQVS4gVGhlIGltcGFjdCB3b3VsZCBiZSB0cmlnZ2VyaW5nIGEg
S1ZNX0JVR19PTigpLgo+Cj4gVGhlIHJlc291cmNlIGJlaW5nIGNvbnRlbmRlZCBpcyBjYWxsZWQg
dGhlICJURFIgcmVzb3VyY2UiIGluIFREWCBkb2NzCj4gcGFybGFuY2UuIFRoZSB0ZGhfdnBfaW5p
dCgpIGNhbiB0YWtlIHRoaXMgcmVzb3VyY2UgYXMgZXhjbHVzaXZlIGlmIHRoZQo+ICd2ZXJzaW9u
JyBwYXNzZWQgaXMgMSwgd2hpY2ggaGFwcGVucyB0byBiZSB2ZXJzaW9uIHRoZSBrZXJuZWwgcGFz
c2VzLiBUaGUKPiB2YXJpb3VzIE1NVSBvcGVyYXRpb25zICh0ZGhfbWVtX3JhbmdlX2Jsb2NrKCks
IHRkaF9tZW1fdHJhY2soKSBhbmQKPiB0ZGhfbWVtX3BhZ2VfcmVtb3ZlKCkpIHRha2UgaXQgYXMg
c2hhcmVkLgo+Cj4gVGhlcmUgaXNuJ3QgYSBLVk0gbG9jayB0aGF0IG1hcHMgY29uY2VwdHVhbGx5
IGFuZCBpbiBhIGxvY2sgb3JkZXIgZnJpZW5kbHkKPiB3YXkgdG8gdGhlIFREUiBsb2NrLiBTbyB0
byBtaW5pbWl6ZSBpbmZyYXN0cnVjdHVyZSwganVzdCB0YWtlIE1NVSBsb2NrCj4gYXJvdW5kIHRk
aF92cF9pbml0KCkuIFRoaXMgbWFrZXMgdGhlIG9wZXJhdGlvbnMgd2UgY2FyZSBhYm91dCBtdXR1
YWxseQo+IGV4Y2x1c2l2ZS4gU2luY2UgdGhlIG90aGVyIG9wZXJhdGlvbnMgYXJlIHVuZGVyIGEg
d3JpdGUgbW11X2xvY2ssIHRoZSBjb2RlCj4gY291bGQganVzdCB0YWtlIHRoZSBsb2NrIGZvciBy
ZWFkLCBob3dldmVyIHRoaXMgaXMgd2VpcmRseSBpbnZlcnRlZCBmcm9tCj4gdGhlIGFjdHVhbCB1
bmRlcmx5aW5nIHJlc291cmNlIGJlaW5nIGNvbnRlbmRlZC4gU2luY2UgdGhpcyBpcyBjb3Zlcmlu
ZyBhbgo+IGVkZ2UgY2FzZSB0aGF0IHNob3VsZG4ndCBiZSBoaXQgaW4gbm9ybWFsIHVzYWdlLCBi
ZSBhIGxpdHRsZSBsZXNzIHdlaXJkCj4gYW5kIHRha2UgdGhlIG1tdV9sb2NrIGZvciB3cml0ZSBh
cm91bmQgdGhlIGNhbGwuCj4KPiBGaXhlczogMDJhYjU3NzA3YmRiICgiS1ZNOiBURFg6IEltcGxl
bWVudCBob29rcyB0byBwcm9wYWdhdGUgY2hhbmdlcyBvZiBURFAgTU1VIG1pcnJvciBwYWdlIHRh
YmxlIikKPiBSZXBvcnRlZC1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+IFN1
Z2dlc3RlZC1ieTogWWFuIFpoYW8gPHlhbi55LnpoYW9AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4KPiAtLS0KPiBI
aSwKPgo+IEl0IHdhcyBpbmRlZWQgYXdrd2FyZCwgYXMgU2VhbiBtdXN0IGhhdmUgc25pZmZlZC4g
QnV0IHNlZW1zIG9rIGVub3VnaCB0bwo+IGNsb3NlIHRoZSBpc3N1ZS4KPgo+IFlhbiwgY2FuIHlv
dSBnaXZlIGl0IGEgbG9vaz8KPgo+IFBvc3RlZCBoZXJlLCBidXQgYXBwbGllcyBvbiB0b3Agb2Yg
dGhpcyBzZXJpZXMuCj4KPiBUaGFua3MsCj4KPiBSaWNrCj4gLS0tCj4gICBhcmNoL3g4Ni9rdm0v
dm14L3RkeC5jIHwgMTUgKysrKysrKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
dm14L3RkeC5jIGIvYXJjaC94ODYva3ZtL3ZteC90ZHguYwo+IGluZGV4IGRhZWM4OGQ0Yjg4ZC4u
OGJmNWQyNjI0MTUyIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2t2bS92bXgvdGR4LmMKPiArKysg
Yi9hcmNoL3g4Ni9rdm0vdm14L3RkeC5jCj4gQEAgLTI5MzgsOSArMjkzOCwxOCBAQCBzdGF0aWMg
aW50IHRkeF90ZF92Y3B1X2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQgdmNwdV9yY3gp
Cj4gICAJCX0KPiAgIAl9Cj4gICAKPiAtCWVyciA9IHRkaF92cF9pbml0KCZ0ZHgtPnZwLCB2Y3B1
X3JjeCwgdmNwdS0+dmNwdV9pZCk7Cj4gLQlpZiAoVERYX0JVR19PTihlcnIsIFRESF9WUF9JTklU
LCB2Y3B1LT5rdm0pKQo+IC0JCXJldHVybiAtRUlPOwo+ICsJLyoKPiArCSAqIHRkaF92cF9pbml0
KCkgY2FuIHRha2UgYSBleGNsdXNpdmUgbG9jayBvZiB0aGUgVERSIHJlc291cmNlIGluc2lkZQog
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXgogwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgYW4KCj4gKwkg
KiB0aGUgVERYIG1vZHVsZS4gVGhpcyByZXNvdXJjZSBpcyBhbHNvIHRha2VuIGFzIHNoYXJlZCBp
biBzZXZlcmFsCj4gKwkgKiBuby1mYWlsIE1NVSBwYXRocywgd2hpY2ggY291bGQgcmV0dXJuIFRE
WF9PUEVSQU5EX0JVU1kgb24gY29udGVudGlvbi4KPiArCSAqIEEgcmVhZCBsb2NrIGhlcmUgd291
bGQgYmUgZW5vdWdoIHRvIGV4Y2x1ZGUgdGhlIGNvbnRlbnRpb24sIGJ1dCB0YWtlCj4gKwkgKiBh
IHdyaXRlIGxvY2sgdG8gYXZvaWQgdGhlIHdlaXJkIGludmVyc2lvbi4KQ2FuIHdlIGFsc28gYWRk
IHRoZSBkZXNjcmlwdGlvbiB0aGF0IHRoZSBsb2NrIGlzIHRyeWluZyB0byBwcmV2ZW50IGFuIGVk
Z2UgY2FzZQphcyBpbiB0aGUgY2hhbmdlIGxvZyBpZiBub3QgdG9vIHdvcmR5PwoKPiArCSAqLwo+
ICsJc2NvcGVkX2d1YXJkKHdyaXRlX2xvY2ssICZ2Y3B1LT5rdm0tPm1tdV9sb2NrKSB7Cj4gKwkJ
ZXJyID0gdGRoX3ZwX2luaXQoJnRkeC0+dnAsIHZjcHVfcmN4LCB2Y3B1LT52Y3B1X2lkKTsKPiAr
CQlpZiAoVERYX0JVR19PTihlcnIsIFRESF9WUF9JTklULCB2Y3B1LT5rdm0pKQo+ICsJCQlyZXR1
cm4gLUVJTzsKPiArCX0KPiAgIAo+ICAgCXZjcHUtPmFyY2gubXBfc3RhdGUgPSBLVk1fTVBfU1RB
VEVfUlVOTkFCTEU7Cj4gICAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
