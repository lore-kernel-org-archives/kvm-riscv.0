Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449E2C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 22:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZnPaWPk7q17AGGDBXbUbEsJcifjm/sLYPIcGJsw3V8=; b=JdTy86tGYAvRBA
	wcW5fKV5+gD4RHfbZioRB8hG27tCD2gVyorfwGcTaMNog6yXWHYrk0nVIrdsG/7/6ckxwqW4DdnTD
	etICjPU9E75i8Ar2iVQa6G3iz0WQlHyg74PBVp+xeIGa6SQMdtClJ3Jlxi55G7ba32YBzMDrusd90
	GFpBFak6SciHcXtYlsbjO61U0U2HJjJhd9BIfNhOlnw6ZtbOGX5fH0Cm+O7xHZ1vREDJprsdCt2kj
	dPW/FzmVcC40e80NXIfIc5mo7z0DkOtwNhuSUBKXwcS8hgsxxElcPFKlDGI3GmeBV5MK+aEEX39p9
	ynaDR1nrn9bfBIxuV0eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWBV-0000000541i-47uu;
	Fri, 09 May 2025 22:27:13 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDWBT-0000000541B-2PSR
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 22:27:13 +0000
Message-ID: <260a8c6a-f92f-41c8-a212-8f9f8ddf6b5b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746829628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jteVl+qSFnN6ueuKmbFExf6FzhNWgyq6s4G+Z3sYIiU=;
	b=PaPQgo3bkhPNazELJ9NUurbL3qAdnBDCM4rrLX089JO2lMY65sw7yCqZXRHmBesqO7f/3y
	LfpsLOI5NX6Bdx4UA8VAF/1JFUss+cvO+g7o3w1o5jSktrnZADu/9+aYXof68HipAsZDQa
	Ud0eqikeeTnxFGNBnXOEyoFRQc9FAKo=
Date: Fri, 9 May 2025 15:26:52 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V Guests
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
 <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
 <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
 <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com>
 <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
 <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <D9QTOYMN362W.398FE9SQB0S4X@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_152712_083879_865316E4 
X-CRM114-Status: GOOD (  18.74  )
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

Ck9uIDUvOC8yNSA2OjQ1IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0wN1Qx
NzozNDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4+IE9u
IDUvNy8yNSA3OjM2IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PiAyMDI1LTA1LTA2VDEx
OjI0OjQxLTA3OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2PjoKPj4+PiBP
biA1LzYvMjUgMjoyNCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+PiAyMDI1LTA1LTA1
VDE0OjM5OjI1LTA3OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT46Cj4+Pj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBU
aGlzIHNlcmllcyBleHRlbmRzCj4+Pj4+PiB0aG9zZSB0byBlbmFibGUgdG8gY29ycmVwc29uZGlu
ZyBoc3RhdGVlbiBiaXRzIGluIFBBVENIMS4gVGhlIHJlbWFpbmluZwo+Pj4+Pj4gcGF0Y2hlcyBh
ZGRzIGxhenkgZW5hYmxpbmcgc3VwcG9ydCBvZiB0aGUgb3RoZXIgYml0cy4KPj4+Pj4gVGhlIElT
QSBoYXMgYSBwZWN1bGlhciBkZXNpZ24gZm9yIGhzdGF0ZWVuL3NzdGF0ZWVuIGludGVyYWN0aW9u
Ogo+Pj4+Pgo+Pj4+PiAgICAgIEZvciBldmVyeSBiaXQgaW4gYW4gaHN0YXRlZW4gQ1NSIHRoYXQg
aXMgemVybyAod2hldGhlciByZWFkLW9ubHkgemVybwo+Pj4+PiAgICAgIG9yIHNldCB0byB6ZXJv
KSwgdGhlIHNhbWUgYml0IGFwcGVhcnMgYXMgcmVhZC1vbmx5IHplcm8gaW4gc3N0YXRlZW4KPj4+
Pj4gICAgICB3aGVuIGFjY2Vzc2VkIGluIFZTLW1vZGUuCj4+Pj4gQ29ycmVjdC4KPj4+Pgo+Pj4+
PiBUaGlzIG1lYW5zIHdlIG11c3QgY2xlYXIgYml0IDYzIGluIGhzdGF0ZWVuIGFuZCB0cmFwIG9u
IHNzdGF0ZWVuCj4+Pj4+IGFjY2Vzc2VzIGlmIGFueSBvZiB0aGUgc3N0YXRlZW4gYml0cyBhcmUg
bm90IHN1cHBvc2VkIHRvIGJlIHJlYWQtb25seSAwCj4+Pj4+IHRvIHRoZSBndWVzdCB3aGlsZSB0
aGUgaHlwZXJ2aXNvciB3YW50cyB0byBoYXZlIHRoZW0gYXMgMC4KPj4+PiBDdXJyZW50bHksIHRo
ZXJlIGFyZSB0d28gYml0cyBpbiBzc3RhdGVlbi4gRkNTUiBhbmQgWlZUIHdoaWNoIGFyZSBub3QK
Pj4+PiB1c2VkIGFueXdoZXJlIGluIG9wZW5zYmkvTGludXgvS1ZNIHN0YWNrLgo+Pj4gVHJ1ZSwg
SSBndWVzcyB3ZSBjYW4ganVzdCBtYWtlIHN1cmUgdGhlIGN1cnJlbnQgY29kZSBjYW4ndCBieSBt
aXN0YWtlCj4+PiBsYXppbHkgZW5hYmxlIGFueSBvZiB0aGUgYm90dG9tIDMyIGhzdGF0ZWVuIGJp
dHMgYW5kIGhhbmRsZSB0aGUgY2FzZQo+Pj4gcHJvcGVybHkgbGF0ZXIuCj4+IEkgY2FuIHVwZGF0
ZSB0aGUgY292ZXIgbGV0dGVyIGFuZCBsZWF2ZSBhIGNvbW1lbnQgYWJvdXQgdGhhdC4KPj4KPj4g
RG8geW91IHdhbnQgYSBhZGRpdGlvbmFsIGNoZWNrIGluIHNzdGF0ZWVuCj4+IHRyYXAoa3ZtX3Jp
c2N2X3ZjcHVfaHN0YXRlZW5fZW5hYmxlX3N0YXRlZW4pCj4+IHRvIG1ha2Ugc3VyZSB0aGF0IHRo
ZSBuZXcgdmFsdWUgZG9lc24ndCBoYXZlIGFueSBiaXRzIHNldCB0aGF0IGlzIG5vdAo+PiBwZXJt
aXR0ZWQgYnkgdGhlIGh5cGVydmlzb3IgPwo+IEkgd2FudGVkIHRvIHByZXZlbnQga3ZtX3Jpc2N2
X3ZjcHVfaHN0YXRlZW5fbGF6eV9lbmFibGUoKSBmcm9tIGJlaW5nCj4gYWJsZSB0byBtb2RpZnkg
dGhlIGJvdHRvbSAzMiBiaXRzLCBiZWNhdXNlIHRoZXkgYXJlIGd1ZXN0LXZpc2libGUgYW5kCj4g
S1ZNIGRvZXMgbm90IGhhbmRsZSB0aGVtIGNvcnJlY3RseSAtLSBpdCdzIGFuIGludGVybmFsIEtW
TSBlcnJvciB0aGF0Cj4gc2hvdWxkIGJlIG1hZGUgb2J2aW91cyB0byBmdXR1cmUgcHJvZ3JhbW1l
cnMuCgpTdXJlLiBJIHdpbGwgYWRkIHNvbWV0aGluZyBhbG9uZyB0aG9zZSBsaW5lcy4KCgo+Pj4+
IEluIGNhc2UsIHdlIG5lZWQgdG8gZW5hYmxlIG9uZSBvZiB0aGUgYml0cyBpbiB0aGUgZnV0dXJl
LCBkb2VzIGh5cGV2aXNvcgo+Pj4+IG5lZWQgdG8gdHJhcCBldmVyeSBzc3RhdGVlbiBhY2Nlc3Mg
Pwo+Pj4gV2UgbmVlZCB0byB0cmFwIHNzdGF0ZWVuIGFjY2Vzc2VzIGlmIHRoZSBndWVzdCBpcyBz
dXBwb3NlZCB0byBiZSBhYmxlIHRvCj4+PiBjb250cm9sIGEgYml0IGluIHNzdGF0ZWVuLCBidXQg
dGhlIGh5cGVydmlzb3Igd2FudHMgdG8gbGF6aWx5IGVuYWJsZQo+Pj4gdGhhdCBmZWF0dXJlIGFu
ZCBzZXRzIDAgaW4gaHN0YXRlZW4gdW50aWwgdGhlIGZpcnN0IHRyYXAuCj4+IFllcy4gVGhhdCdz
IHdoYXQgUEFUQ0ggNCBpbiB0aGlzIHNlcmllcyBkb2VzLgo+IEkgd2FzIHRoaW5raW5nIGFib3V0
IHRoZSBjb3JyZWN0IGVtdWxhdGlvbi4KPgo+IGUuZy4gZ3Vlc3Qgc2V0cyBzc3RhdGVlbiBiaXQg
WCB0byAxLCBidXQgS1ZNIHdhbnRzIHRvIGhhbmRsZSB0aGUgZmVhdHVyZQo+IFggbGF6aWx5LCB3
aGljaCBtZWFucyB0aGF0IGhzdGF0ZWVuIGJpdCBYIGlzIDAuCj4gaHN0YXRlZW4gYml0IFNFMCBt
dXN0IGJlIDAgaW4gdGhhdCBjYXNlLCBiZWNhdXNlIEtWTSBtdXN0IHRyYXAgdGhlIGd1ZXN0Cj4g
YWNjZXNzIHRvIGJpdCBYIGFuZCBwcm9wZXJseSBlbXVsYXRlIGl0Lgo+IFdoZW4gdGhlIGd1ZXN0
IGFjY2Vzc2VzIGEgZmVhdHVyZSBjb250cm9sbGVkIGJ5IHNzdGF0ZWVuIGJpdCBYLCBLVk0gd2ls
bAo+IGxhemlseSBlbmFibGUgdGhlIGZlYXR1cmUgYW5kIHRoZW4gc2V0IHNzdGF0ZWVuIGFuZCBo
c3RhdGVlbiBiaXQgWC4KClllYWguIFRoYXQncyBwb3NzaWJsZS4gVGhlIGN1cnJlbnQgc2VyaWVz
IGlzIGp1c3QgdHJ5aW5nIHRvIHRyYXAgJiAKZW5hYmxlIHJhdGhlcgp0aGFuIHRyYXAgJiBlbXVs
YXRlIGV4Y2VwdCBmb3IgZmV3IEFJQSByZWxhdGVkIGJpdHMgd2hpY2ggdHJhcCBldmVuIHdpdGgg
CmhzdGF0ZWVuCmJpdCBzZXQgZHVlIHRvIHN3IGZpbGUgaW5zdGVhZCBvZiB2c2ZpbGUuCgpPbmNl
IHdlIGhhdmUgc3VjaCByZXF1aXJlbWVudCBhbnkgb3RoZXIgZmVhdHVyZSBiaXQsIHdlIGNhbiBl
eHRlbmQgdGhlIApnZW5lcmljCnRyYXAgJiBlbmFibGUgZnJhbWV3b3JrIHRvIHRyYXAgJiBlbXVs
YXRlLgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
