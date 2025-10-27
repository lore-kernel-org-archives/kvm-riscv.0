Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B56CCF9EA
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acgCAXORLwvbT6hQHLMOJtxTM8nKrq/DwyHCN+mJD1c=; b=49b+dB28fLBU4a
	QyZyQZDUX2XFwK1hdgXlxEtMXUncWO6/LJlkFaD3EwEpv3yFB9k2wwCl0v67pMUQtyT25W776UbZM
	7YucuOj60IfNyFSGs1Q4a2iCLxw2DGqVooaIVdVeJcrLkXYeXS7czqSysfq2gwajpw+w7p/3IBmoP
	++rWg1u5XqGqtvg3AZ4Qqe0AFQmEOCM1RFBxWmoTA6jnyHghgHhiXjBjdSUNVp/2Om30pUfmwgS7h
	MgXTBusNyOYsabHswvhmPyH4nfMK6sNX0iLnVHvHt7KQ98An9v1xklLIkEqpsZOLyvedtZ28CX2Zh
	L3784CHToZsaKiMIwiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ77-0000000DTG1-1gBO;
	Mon, 27 Oct 2025 09:02:05 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDJ74-0000000DTEY-1AZY;
	Mon, 27 Oct 2025 09:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761555723; x=1793091723;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=275YkRCyZVfjEDUsCr12iYfs5/SgTlKkXm5iRoBP66c=;
  b=Lk7VvlQ+lMELukesSJ4U/HNL+6uIJX3VLbFRNzRAYgQXRJJgyNThBTgx
   i6BoRT/yysVnE1CGgdGI6eASiEX0Q4nzzNhjMYhY1rqCjRmcBF1A0QJTc
   iyzCEQWM/rhtG23X9KqXJ1KTgeNvmfYtNYbuCZwZwkpKnbNyP0syxj4NM
   WNFL3LrW9w6cjblG57j0Bd4sTCytP7f97m/S2GWiTg3Zmt13dhOGfqWoa
   /yCSKXrQP69cv7CO+UQ0DugXTpwEQ7Jdb4YXX7Sib+cTVJHtVhCLBstpm
   sNaFT3pJqsHYFv0b1OcN8/PPcORCNwou/ZgMuT7IcQsxiwHoTSg3EiCS1
   w==;
X-CSE-ConnectionGUID: o2d6AN4mTaOs8ES9hH05mQ==
X-CSE-MsgGUID: a3/1e8X3QCimkZ8RhJfHJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63723631"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63723631"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:59 -0700
X-CSE-ConnectionGUID: iCVeVDcZSguedVPvO1GnIg==
X-CSE-MsgGUID: rPVV21LWTqG3HlsE3kXlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184892900"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 02:01:51 -0700
Message-ID: <59ae9957-88a8-4777-9bd2-196e8b4eb8ac@linux.intel.com>
Date: Mon, 27 Oct 2025 17:01:49 +0800
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
 <5dea4a3d-c7b7-48f0-b2d5-7597e0cd5f00@linux.intel.com>
 <aPuqYz3ly5a3__mf@google.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <aPuqYz3ly5a3__mf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_020203_048305_C789D7E5 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAxMC8yNS8yMDI1IDEyOjMzIEFNLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+IE9u
IEZyaSwgT2N0IDI0LCAyMDI1LCBCaW5iaW4gV3Ugd3JvdGU6Cj4+Cj4+IE9uIDEwLzE3LzIwMjUg
ODozMiBBTSwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPj4+IEZvbGQgdGR4X21lbV9wYWdl
X3JlY29yZF9wcmVtYXBfY250KCkgaW50byB0ZHhfc2VwdF9zZXRfcHJpdmF0ZV9zcHRlKCkgYXMK
Pj4+IHByb3ZpZGluZyBhIG9uZS1vZmYgaGVscGVyIGZvciBlZmZlY3RpdmVseSB0aHJlZSBsaW5l
cyBvZiBjb2RlIGlzIGF0IGJlc3QgYQo+Pj4gd2FzaCwgYW5kIHNwbGl0dGluZyB0aGUgY29kZSBt
YWtlcyB0aGUgY29tbWVudCBmb3Igc21wX3JtYigpICBfZXh0cmVtZWx5Xwo+Pj4gY29uZnVzaW5n
IGFzIHRoZSBjb21tZW50IHRhbGtzIGFib3V0IHJlYWRpbmcga3ZtLT5hcmNoLnByZV9mYXVsdF9h
bGxvd2VkCj4+PiBiZWZvcmUga3ZtX3RkeC0+c3RhdGUsIGJ1dCB0aGUgaW1tZWRpYXRlbHkgdmlz
aWJsZSBjb2RlIGRvZXMgdGhlIGV4YWN0Cj4+PiBvcHBvc2l0ZS4KPj4+Cj4+PiBPcHBvcnR1bmlz
dGljYWxseSByZXdyaXRlIHRoZSBjb21tZW50cyB0byBtb3JlIGV4cGxpY2l0bHkgZXhwbGFpbiB3
aG8gaXMKPj4+IGNoZWNraW5nIHdoYXQsIGFzIHdlbGwgYXMgX3doeV8gdGhlIG9yZGVyaW5nIG1h
dHRlcnMuCj4+Pgo+Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4+Pgo+Pj4gUmV2
aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4KPj4+
IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+
PiBSZXZpZXdlZC1ieTogQmluYmluIFd1IDxiaW5iaW4ud3VAbGludXguaW50ZWwuY29tPgo+Pgo+
PiBPbmUgbml0IGJlbG93Lgo+Pgo+PiBbLi4uXQo+Pj4gKwkvKgo+Pj4gKwkgKiBJZiB0aGUgVEQg
aXNuJ3QgZmluYWxpemVkL3J1bm5hYmxlLCB0aGVuIHVzZXJzcGFjZSBpcyBpbml0aWFsaXppbmcK
Pj4+ICsJICogdGhlIFZNIGltYWdlIHZpYSBLVk1fVERYX0lOSVRfTUVNX1JFR0lPTi4gIEluY3Jl
bWVudCB0aGUgbnVtYmVyIG9mCj4+PiArCSAqIHBhZ2VzIHRoYXQgbmVlZCB0byBiZSBtYXBwZWQg
YW5kIGluaXRpYWxpemVkIHZpYSBUREguTUVNLlBBR0UuQURELgo+Pj4gKwkgKiBLVk1fVERYX0ZJ
TkFMSVpFX1ZNIGNoZWNrcyB0aGUgY291bnRlciB0byBlbnN1cmUgYWxsIG1hcHBlZCBwYWdlcwo+
PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBeCj4+ICDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBOaXQ6IElzIHByZS1tYXBwZWQgYmV0dGVyPwo+IFllYWgsIHVwZGF0ZWQgKGFu
ZCB0aGVuIGl0IGdldHMgZGVsZXRlZCBhIGZldyBjb21taXRzIGxhdGVyIDotKSApLgpPaCwgcmln
aHQsIG5yX3ByZW1hcHBlZCB3aWxsIGJlIGRyb3BwZWQgbGF0ZXIuCgpTaW5jZSB0aGUgd2hvbGUg
bnJfcHJlbWFwcGVkIHdpbGwgYmUgZHJvcHBlZCwgZG8gd2Ugc3RpbGwgbmVlZCBhIGNsZWFudXAg
cGF0Y2gKbGlrZSBwYXRjaCAxMiB3aGljaCB3aWxsIGJlIGRyb3BwZWQgZmluYWxseT8KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
