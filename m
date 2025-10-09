Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CCDCAC5BB
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 02:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDj8uX4J93EFgqsRb8v9hvJu872If1rTwOGV1J7b820=; b=YZ6mhkzc13Ut+m
	JECi8VpU7yBlS64uHDc21QCbeHmSB55MRTP64XZw4PM+tSbXUamoFupvpQY3kW+tR4R7OM3ygLiKM
	9SsoYPYf6i1FNjXu1BX7YKe5XqA7dPM58nsjr1wC08DWhuWzlMhYao98DtHnKDNsHPmQY/zS2GAO6
	LlKUzJnygUVKu2VsyNnBXNZ1cJDIYuyErpqizo8sVB9SFi0dcfOJWiLsRpxsxxJ/Snh/hPTF20EjQ
	JG93Yocu7A6VgSITzvRBldOsZ35C11Jn+X78WIq/9FtFgBC9tRojWG0VMvWo38bd3TsV6S+KFxPfw
	GGaz/w9GxYnvjVpvOGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6gG3-000000052mH-3REd;
	Thu, 09 Oct 2025 02:19:55 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6gG0-000000052lV-2op4;
	Thu, 09 Oct 2025 02:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759976392; x=1791512392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MKwwAjIvNTVYzVSKLCj93oAfQ4vIbNdKNB8W0YNJ6Qg=;
  b=jWnV7xEk04QWrE2+NGmlMd9EEqy73hMijmfZO+h9i8ZFPqPDN6Jc35gm
   YB2VLHysWhmrqGkIRdvP0lvV+a2f6AsqLL3MlhWLidjPNmKEsVFXeHFen
   0XVjA5Qaxmhk2wasazg31GUXjbFrFu1RdROp+1v2b2YBe3T+LYi0R5UDi
   iGq8rwW7Qf9b00/RJHG6hKh9jYRmnJs9vONxiZEBV1RoqboH74a0nganv
   5bKQBoidw2VM+U/a80YC6yXWGk85442pLXEB+efI8s8odAjsjCkveb3p2
   ByKtzEH9vc3oSxbLZ+XMROF7yfp+3Z1FK/ljQqueOoFGfop6cGxeJTA5s
   g==;
X-CSE-ConnectionGUID: 0UKaID5KSwSF33iuY9kevw==
X-CSE-MsgGUID: XoR0pU4/TD+x2BJ2AKpujQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62097734"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62097734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 19:19:51 -0700
X-CSE-ConnectionGUID: SjjAIAIGQgGwYyFr6uTBmQ==
X-CSE-MsgGUID: dnnE1byERkONzbCEalT4rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,215,1754982000"; 
   d="scan'208";a="211538774"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.232.209]) ([10.124.232.209])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 19:19:44 -0700
Message-ID: <0276af52-c697-46c3-9db8-9284adb6beee@linux.intel.com>
Date: Thu, 9 Oct 2025 10:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
To: Sean Christopherson <seanjc@google.com>, Sandipan Das <sandidas@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
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
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aN1vfykNs8Dmv_g0@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_191952_781522_53669A45 
X-CRM114-Status: GOOD (  24.09  )
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

Ck9uIDEwLzIvMjAyNSAyOjE0IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IE9uIEZy
aSwgU2VwIDI2LCAyMDI1LCBTYW5kaXBhbiBEYXMgd3JvdGU6Cj4+IE9uIDgvNy8yMDI1IDE6MjYg
QU0sIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4+PiBGcm9tOiBEYXBlbmcgTWkgPGRhcGVu
ZzEubWlAbGludXguaW50ZWwuY29tPgo+Pj4KPj4+IEZvciB2Q1BVcyB3aXRoIGEgbWVkaWF0ZWQg
dlBNVSwgZGlzYWJsZSBpbnRlcmNlcHRpb24gb2YgY291bnRlciBNU1JzIGZvcgo+Pj4gUE1DcyB0
aGF0IGFyZSBleHBvc2VkIHRvIHRoZSBndWVzdCwgYW5kIGZvciBHTE9CQUxfQ1RSTCBhbmQgcmVs
YXRlZCBNU1JzCj4+PiBpZiB0aGV5IGFyZSBmdWxseSBzdXBwb3J0ZWQgYWNjb3JkaW5nIHRvIHRo
ZSB2Q1BVIG1vZGVsLCBpLmUuIGlmIHRoZSBNU1JzCj4+PiBhbmQgYWxsIGJpdHMgc3VwcG9ydGVk
IGJ5IGhhcmR3YXJlIGV4aXN0IGZyb20gdGhlIGd1ZXN0J3MgcG9pbnQgb2Ygdmlldy4KPj4+Cj4+
PiBEbyBOT1QgcGFzc3Rocm91Z2ggZXZlbnQgc2VsZWN0b3Igb3IgZml4ZWQgY291bnRlciBjb250
cm9sIE1TUnMsIHNvIHRoYXQKPj4+IEtWTSBjYW4gZW5mb3JjZSB1c2Vyc3BhY2UtZGVmaW5lZCBl
dmVudCBmaWx0ZXJzLCBlLmcuIHRvIHByZXZlbnQgdXNlIG9mCj4+PiBBbnlUaHJlYWQgZXZlbnRz
ICh3aGljaCBpcyB1bmZvcnR1bmF0ZWx5IGEgc2V0dGluZyBpbiB0aGUgZml4ZWQgY291bnRlcgo+
Pj4gY29udHJvbCBNU1IpLgo+Pj4KPj4+IERlZmVyIHN1cHBvcnQgZm9yIG5lc3RlZCBwYXNzdGhy
b3VnaCBvZiBtZWRpYXRlZCBQTVUgTVNScyB0byB0aGUgZnV0dXJlLAo+Pj4gYXMgdGhlIGxvZ2lj
IGZvciBuZXN0ZWQgTVNSIGludGVyY2VwdGlvbiBpcyB1bmZvcnR1bmF0ZWx5IHZlbmRvciBzcGVj
aWZpYy4KPiAuLi4KPgo+Pj4gICNkZWZpbmUgTVNSX0FNRDY0X0xCUl9TRUxFQ1QJCQkweGMwMDAw
MTBlCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3BtdS5jIGIvYXJjaC94ODYva3ZtL3Bt
dS5jCj4+PiBpbmRleCA0MjQ2ZTFkMmNmY2MuLjgxN2VmODUyYmRmOSAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gveDg2L2t2bS9wbXUuYwo+Pj4gKysrIGIvYXJjaC94ODYva3ZtL3BtdS5jCj4+PiBAQCAt
NzE1LDE4ICs3MTUsMTQgQEAgaW50IGt2bV9wbXVfcmRwbWMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1bnNpZ25lZCBpZHgsIHU2NCAqZGF0YSkKPj4+ICAJcmV0dXJuIDA7Cj4+PiAgfQo+Pj4gIAo+
Pj4gLWJvb2wga3ZtX25lZWRfcmRwbWNfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
Pj4+ICtib29sIGt2bV9uZWVkX3BlcmZfZ2xvYmFsX2N0cmxfaW50ZXJjZXB0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKPj4+ICB7Cj4+PiAgCXN0cnVjdCBrdm1fcG11ICpwbXUgPSB2Y3B1X3RvX3Bt
dSh2Y3B1KTsKPj4+ICAKPj4+ICAJaWYgKCFrdm1fdmNwdV9oYXNfbWVkaWF0ZWRfcG11KHZjcHUp
KQo+Pj4gIAkJcmV0dXJuIHRydWU7Cj4+PiAgCj4+PiAtCS8qCj4+PiAtCSAqIFZNd2FyZSBhbGxv
d3MgYWNjZXNzIHRvIHRoZXNlIFBzZWR1by1QTUNzIGV2ZW4gd2hlbiByZWFkIHZpYSBSRFBNQwo+
Pj4gLQkgKiBpbiBSaW5nMyB3aGVuIENSNC5QQ0U9MC4KPj4+IC0JICovCj4+PiAtCWlmIChlbmFi
bGVfdm13YXJlX2JhY2tkb29yKQo+Pj4gKwlpZiAoIWt2bV9wbXVfaGFzX3BlcmZfZ2xvYmFsX2N0
cmwocG11KSkKPj4+ICAJCXJldHVybiB0cnVlOwo+Pj4gIAo+Pj4gIAkvKgo+Pj4gQEAgLTczNSw3
ICs3MzEsMjIgQEAgYm9vbCBrdm1fbmVlZF9yZHBtY19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+Pj4gIAkgKiBjYXBhYmlsaXRpZXMgdGhlbXNlbHZlcyBtYXkgYmUgYSBzdWJzZXQg
b2YgaGFyZHdhcmUgY2FwYWJpbGl0aWVzLgo+Pj4gIAkgKi8KPj4+ICAJcmV0dXJuIHBtdS0+bnJf
YXJjaF9ncF9jb3VudGVycyAhPSBrdm1faG9zdF9wbXUubnVtX2NvdW50ZXJzX2dwIHx8Cj4+PiAt
CSAgICAgICBwbXUtPm5yX2FyY2hfZml4ZWRfY291bnRlcnMgIT0ga3ZtX2hvc3RfcG11Lm51bV9j
b3VudGVyc19maXhlZCB8fAo+Pj4gKwkgICAgICAgcG11LT5ucl9hcmNoX2ZpeGVkX2NvdW50ZXJz
ICE9IGt2bV9ob3N0X3BtdS5udW1fY291bnRlcnNfZml4ZWQ7Cj4+PiArfQo+Pj4gK0VYUE9SVF9T
WU1CT0xfR1BMKGt2bV9uZWVkX3BlcmZfZ2xvYmFsX2N0cmxfaW50ZXJjZXB0KTsKPj4+ICsKPj4+
ICtib29sIGt2bV9uZWVkX3JkcG1jX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4+
PiArewo+Pj4gKwlzdHJ1Y3Qga3ZtX3BtdSAqcG11ID0gdmNwdV90b19wbXUodmNwdSk7Cj4+PiAr
Cj4+PiArCS8qCj4+PiArCSAqIFZNd2FyZSBhbGxvd3MgYWNjZXNzIHRvIHRoZXNlIFBzZWR1by1Q
TUNzIGV2ZW4gd2hlbiByZWFkIHZpYSBSRFBNQwo+Pj4gKwkgKiBpbiBSaW5nMyB3aGVuIENSNC5Q
Q0U9MC4KPj4+ICsJICovCj4+PiArCWlmIChlbmFibGVfdm13YXJlX2JhY2tkb29yKQo+Pj4gKwkJ
cmV0dXJuIHRydWU7Cj4+PiArCj4+PiArCXJldHVybiBrdm1fbmVlZF9wZXJmX2dsb2JhbF9jdHJs
X2ludGVyY2VwdCh2Y3B1KSB8fAo+Pj4gIAkgICAgICAgcG11LT5jb3VudGVyX2JpdG1hc2tbS1ZN
X1BNQ19HUF0gIT0gKEJJVF9VTEwoa3ZtX2hvc3RfcG11LmJpdF93aWR0aF9ncCkgLSAxKSB8fAo+
Pj4gIAkgICAgICAgcG11LT5jb3VudGVyX2JpdG1hc2tbS1ZNX1BNQ19GSVhFRF0gIT0gKEJJVF9V
TEwoa3ZtX2hvc3RfcG11LmJpdF93aWR0aF9maXhlZCkgLSAxKTsKPj4+ICB9Cj4+IFRoZXJlIGlz
IGEgY2FzZSBmb3IgQU1EIHByb2Nlc3NvcnMgd2hlcmUgdGhlIGdsb2JhbCBNU1JzIGFyZSBhYnNl
bnQgaW4gdGhlIGd1ZXN0Cj4+IGJ1dCB0aGUgZ3Vlc3Qgc3RpbGwgdXNlcyB0aGUgc2FtZSBudW1i
ZXIgb2YgY291bnRlcnMgYXMgd2hhdCBpcyBhZHZlcnRpc2VkIGJ5IHRoZQo+PiBob3N0IGNhcGFi
aWxpdGllcy4gU28gUkRQTUMgaW50ZXJjZXB0aW9uIGlzIG5vdCBuZWNlc3NhcnkgZm9yIGFsbCBj
YXNlcyB3aGVyZQo+PiBnbG9iYWwgY29udHJvbCBpcyB1bmF2YWlsYWJsZS5vCj4gSG1tLCBJIHRo
aW5rIEludGVsIHdvdWxkIGJlIHRoZSBzYW1lPyAgQWgsIG5vLCBiZWNhdXNlIHRoZSBob3N0IHdp
bGwgaGF2ZSBmaXhlZAo+IGNvdW50ZXJzLCBidXQgdGhlIGd1ZXN0IHdpbGwgbm90LiAgSG93ZXZl
ciwgdGhhdCdzIG5vdCBkaXJlY3RseSByZWxhdGVkIHRvCj4ga3ZtX3BtdV9oYXNfcGVyZl9nbG9i
YWxfY3RybCgpLCBzbyBJIHRoaW5rIHRoaXMgd291bGQgYmUgY29ycmVjdD8KPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rdm0vcG11LmMgYi9hcmNoL3g4Ni9rdm0vcG11LmMKPiBpbmRleCA0NDE0
ZDA3MGM0ZjkuLjRjNWIyNzEyZWU0YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9rdm0vcG11LmMK
PiArKysgYi9hcmNoL3g4Ni9rdm0vcG11LmMKPiBAQCAtNzQ0LDE2ICs3NDQsMTMgQEAgaW50IGt2
bV9wbXVfcmRwbWMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpZHgsIHU2NCAqZGF0
YSkKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IC1ib29sIGt2bV9uZWVkX3BlcmZfZ2xv
YmFsX2N0cmxfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArc3RhdGljIGJvb2wg
a3ZtX25lZWRfcG1jX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCgpUaGUgZnVuY3Rp
b24gbmFtZSBrdm1fbmVlZF9wbWNfaW50ZXJjZXB0KCkgc2VlbXMgYSBsaXR0bGUgYml0IG1pc2xl
YWRpbmcKYW5kIG1ha2UgdXNlcnMgdGhpbmsgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIHRvIGNoZWNr
IGlmIGEgY2VydGFpbiBQTUMgaXMKaW50ZXJjZXB0ZWQuIE1heWJlIHdlIGNhbiByZW5hbWUgdGhl
IGZ1bmN0aW9uIHRvwqBrdm1fbmVlZF9nbG9iYWxfaW50ZXJjZXB0KCkuCgpPdGhlcnMgbG9vayBn
b29kIHRvIG1lLiBUaGFua3MuCgoKPiAgewo+ICAgICAgICAgc3RydWN0IGt2bV9wbXUgKnBtdSA9
IHZjcHVfdG9fcG11KHZjcHUpOwo+ICAKPiAgICAgICAgIGlmICgha3ZtX3ZjcHVfaGFzX21lZGlh
dGVkX3BtdSh2Y3B1KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gIAo+IC0gICAg
ICAgaWYgKCFrdm1fcG11X2hhc19wZXJmX2dsb2JhbF9jdHJsKHBtdSkpCj4gLSAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOwo+IC0KPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBOb3RlISAgQ2hl
Y2sgKmhvc3QqIFBNVSBjYXBhYmlsaXRpZXMsIG5vdCBLVk0ncyBQTVUgY2FwYWJpbGl0aWVzLCBh
cwo+ICAgICAgICAgICogS1ZNJ3MgY2FwYWJpbGl0aWVzIGFyZSBjb25zdHJhaW5lZCBiYXNlZCBv
biBLVk0gc3VwcG9ydCwgaS5lLiBLVk0ncwo+IEBAIC03NjIsNiArNzU5LDEzIEBAIGJvb2wga3Zt
X25lZWRfcGVyZl9nbG9iYWxfY3RybF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+
ICAgICAgICAgcmV0dXJuIHBtdS0+bnJfYXJjaF9ncF9jb3VudGVycyAhPSBrdm1faG9zdF9wbXUu
bnVtX2NvdW50ZXJzX2dwIHx8Cj4gICAgICAgICAgICAgICAgcG11LT5ucl9hcmNoX2ZpeGVkX2Nv
dW50ZXJzICE9IGt2bV9ob3N0X3BtdS5udW1fY291bnRlcnNfZml4ZWQ7Cj4gIH0KPiArCj4gK2Jv
b2wga3ZtX25lZWRfcGVyZl9nbG9iYWxfY3RybF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICt7Cj4gKwo+ICsgICAgICAgcmV0dXJuIGt2bV9uZWVkX3BtY19pbnRlcmNlcHQodmNw
dSkgfHwKPiArICAgICAgICAgICAgICAha3ZtX3BtdV9oYXNfcGVyZl9nbG9iYWxfY3RybCh2Y3B1
X3RvX3BtdSh2Y3B1KSk7Cj4gK30KPiAgRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX25lZWRfcGVyZl9n
bG9iYWxfY3RybF9pbnRlcmNlcHQpOwo+ICAKPiAgYm9vbCBrdm1fbmVlZF9yZHBtY19pbnRlcmNl
cHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+IEBAIC03NzUsNyArNzc5LDcgQEAgYm9vbCBrdm1f
bmVlZF9yZHBtY19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgaWYg
KGVuYWJsZV92bXdhcmVfYmFja2Rvb3IpCj4gICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+
ICAKPiAtICAgICAgIHJldHVybiBrdm1fbmVlZF9wZXJmX2dsb2JhbF9jdHJsX2ludGVyY2VwdCh2
Y3B1KSB8fAo+ICsgICAgICAgcmV0dXJuIGt2bV9uZWVkX3BtY19pbnRlcmNlcHQodmNwdSkgfHwK
PiAgICAgICAgICAgICAgICBwbXUtPmNvdW50ZXJfYml0bWFza1tLVk1fUE1DX0dQXSAhPSAoQklU
X1VMTChrdm1faG9zdF9wbXUuYml0X3dpZHRoX2dwKSAtIDEpIHx8Cj4gICAgICAgICAgICAgICAg
cG11LT5jb3VudGVyX2JpdG1hc2tbS1ZNX1BNQ19GSVhFRF0gIT0gKEJJVF9VTEwoa3ZtX2hvc3Rf
cG11LmJpdF93aWR0aF9maXhlZCkgLSAxKTsKPiAgfQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
