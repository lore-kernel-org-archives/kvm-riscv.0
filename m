Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC149C5B552
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sf6kQbXKdPaYTjfH4ge6xig1daG63OBaJhB7shbnwFQ=; b=hj/rPy797gAUw1
	PUiuxzQCNuFSWm1a9jFvyELhTFb58h0aj+KbX0OYJn1kTur0O5c4lYAKLa/amHVghW/W4JApiYANY
	0okdddQdsW9uzSJAfeS42dz6O2qIPWuqmtaKBEVfvio4hxdA9ELnjLMf0NmKgx1DzxlET7bpYYfWW
	I5qeL52ZHslYffToa6YYq8JgtU0ftBbrtj9emrkZUUbjMKEtqYT7i2n2jJQmxPZSkNVm9+yLjbI6y
	CSl5CaNxNjFywaKs+zypt3EAchyM1y0QxnTqdxA2OIQIKslZny/uw0g7MpVUqJq/Q5jJd0I/MxTK1
	G7oiRNXA8q8ysusXyAqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtN0-000000061Ja-2U6Q;
	Tue, 10 Jun 2025 07:26:06 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtMx-000000061J6-3ZkI
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 07:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540364; x=1781076364;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5Y3rWuErxoP+DxbOXS+XbWOfhUALPrEO4AVaKLW4xWY=;
  b=cLtzMBC2aPcNK3rQ4kedZTMEFYE/GXpFg2ubJ6zRv7P1uJm++VAXBU+a
   4YzWaW+MG/j/oEazKxfmHpA0Zb/gRWJZXPbiLR9/H3fri8ljmg9RmY20T
   BKegRnRHbVwnnPmxqCXyK5DZkHRYRFJvEeXYj9EBEJItBr9DEPYbXzgRX
   XRpTLQYPTYWb8NFZPGhD6/rX2KoJ+UdgB155F96ocSor5GzfZDTLo2kMv
   fOum61mqextERczJr7I6+zky8p6XAmlOFLH8RW+EgUFlFuVnS6cadWcYG
   xmcuU8Wah7iZTsrd1nngXPVGcSR0Ah70s1w+F25f+DlOYkvizFUu+fIBl
   w==;
X-CSE-ConnectionGUID: 3AQ3yzrxSu6D5TAPNqrlqg==
X-CSE-MsgGUID: ZPyGHTFXRdiwf43SoYIHYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61906029"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="61906029"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:25:47 -0700
X-CSE-ConnectionGUID: JUpyczpCRl+RBIe4uKd3Xg==
X-CSE-MsgGUID: IrHAYlSaQziqxQQTivncUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="177668479"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:25:45 -0700
Message-ID: <cf52eac4-a366-41a1-9a4a-962efdb260ca@linux.intel.com>
Date: Tue, 10 Jun 2025 15:25:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 11/16] x86/sev: Use VC_VECTOR from
 processor.h
To: Sean Christopherson <seanjc@google.com>,
 Andrew Jones <andrew.jones@linux.dev>, Janosch Frank
 <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Nico_B=C3=B6hr?= <nrb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-12-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20250529221929.3807680-12-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_002603_951455_EEE0A483 
X-CRM114-Status: GOOD (  10.44  )
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

Ck9uIDUvMzAvMjAyNSA2OjE5IEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IFVzZSBW
Q19WRUNUT1IgKGRlZmluZWQgaW4gcHJvY2Vzc29yLmggYWxvbmcgd2l0aCBhbGwgb3RoZXIga25v
d24gdmVjdG9ycykKPiBhbmQgZHJvcCB0aGUgb25lLW9mZiBTRVZfRVNfVkNfSEFORExFUl9WRUNU
T1IgbWFjcm8uCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+ICBs
aWIveDg2L2FtZF9zZXYuYyB8IDQgKystLQo+ICBsaWIveDg2L2FtZF9zZXYuaCB8IDYgLS0tLS0t
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2xpYi94ODYvYW1kX3Nldi5jIGIvbGliL3g4Ni9hbWRfc2V2LmMKPiBpbmRl
eCA2NjcyMjE0MS4uNmMwYTY2YWMgMTAwNjQ0Cj4gLS0tIGEvbGliL3g4Ni9hbWRfc2V2LmMKPiAr
KysgYi9saWIveDg2L2FtZF9zZXYuYwo+IEBAIC0xMTEsOSArMTExLDkgQEAgZWZpX3N0YXR1c190
IHNldHVwX2FtZF9zZXZfZXModm9pZCkKPiAgCSAqLwo+ICAJc2lkdCgmaWR0cik7Cj4gIAlpZHQg
PSAoaWR0X2VudHJ5X3QgKilpZHRyLmJhc2U7Cj4gLQl2Y19oYW5kbGVyX2lkdCA9IGlkdFtTRVZf
RVNfVkNfSEFORExFUl9WRUNUT1JdOwo+ICsJdmNfaGFuZGxlcl9pZHQgPSBpZHRbVkNfVkVDVE9S
XTsKPiAgCXZjX2hhbmRsZXJfaWR0LnNlbGVjdG9yID0gS0VSTkVMX0NTOwo+IC0JYm9vdF9pZHRb
U0VWX0VTX1ZDX0hBTkRMRVJfVkVDVE9SXSA9IHZjX2hhbmRsZXJfaWR0Owo+ICsJYm9vdF9pZHRb
VkNfVkVDVE9SXSA9IHZjX2hhbmRsZXJfaWR0Owo+ICAKPiAgCXJldHVybiBFRklfU1VDQ0VTUzsK
PiAgfQo+IGRpZmYgLS1naXQgYS9saWIveDg2L2FtZF9zZXYuaCBiL2xpYi94ODYvYW1kX3Nldi5o
Cj4gaW5kZXggZWQ2ZTMzODUuLmNhNzIxNmQ0IDEwMDY0NAo+IC0tLSBhL2xpYi94ODYvYW1kX3Nl
di5oCj4gKysrIGIvbGliL3g4Ni9hbWRfc2V2LmgKPiBAQCAtMzksMTIgKzM5LDYgQEAKPiAgYm9v
bCBhbWRfc2V2X2VuYWJsZWQodm9pZCk7Cj4gIGVmaV9zdGF0dXNfdCBzZXR1cF9hbWRfc2V2KHZv
aWQpOwo+ICAKPiAtLyoKPiAtICogQU1EIFByb2dyYW1tZXIncyBNYW51YWwgVm9sdW1lIDIKPiAt
ICogICAtIFNlY3Rpb24gIiNWQyBFeGNlcHRpb24iCj4gLSAqLwo+IC0jZGVmaW5lIFNFVl9FU19W
Q19IQU5ETEVSX1ZFQ1RPUiAyOQo+IC0KPiAgLyoKPiAgICogQU1EIFByb2dyYW1tZXIncyBNYW51
YWwgVm9sdW1lIDIKPiAgICogICAtIFNlY3Rpb24gIkdIQ0IiCgpMR1RNLsKgCgpSZXZpZXdlZC1i
eTogRGFwZW5nIE1pIDxkYXBlbmcxLm1pQGxpbnV4LmludGVsLmNvbT4KCgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
