Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF025C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 00:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pJyBT9njhCI6pOQeXppNo5cIyJUYJQGw5kK0xuAzqI=; b=eTLlSmqWE/OPws
	6ZWQFcpxWEjTV6U+/uCdTrcf+SGFxqoWAw4REi2WCexjWB3GHOM3abQiUzw0nu5o9WOOhOzRORWgk
	iZgvo8qo6cDyKfkxIpi1lQtP0gCPK+lTn4884N9Rqk5Yr7X8y6/9PYfY4tP56ZZ0w1JSUe9hpJ1Nn
	y15Oa8djP8oVRqkn7I8xvYjvtca7ZLmkw5kBldgoZHZczpo44r3x3dCaOMKLJIZLXCw4BNPNuigZL
	d8U3T3jzu+/08yPVQ/zMOwhjPYjUf4fHLNM9/HFk4gFEj/z7YJLrYFrvAdu/L92cq+4yfyNmJwZxt
	Qe2tJQliyOq5NOrQuOvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCpE7-0000000H2Th-1hW2;
	Thu, 08 May 2025 00:35:03 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCpE4-0000000H2Pn-1SYT
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 00:35:01 +0000
Message-ID: <ec73105c-f359-4156-8285-b471e3521378@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746664483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pU21r1AALBbTx/oUKK/Y9bNXG599CWsACufdbKUbqOw=;
	b=OSqRsCV4qL2fo52Kc0kdhJbHN7ycGcOhAPFKIhgbmwX7rTfdAlpHaDcJpo9fvsJ9NnZJfS
	SBwKQi4dnGQT0j8jhx3iAgcyFnZj/GZMh2BW8YWIhZ+RJw6SxTKtD6NUdL5tP4J7UZw+qt
	D1Ugcu2fXazyL3Vi18jQ7QXRm5LI7u0=
Date: Wed, 7 May 2025 17:34:38 -0700
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <D9Q05T702L8Y.3UTLG7VXIFXOK@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_173500_532102_9DBC1D97 
X-CRM114-Status: GOOD (  27.49  )
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

Ck9uIDUvNy8yNSA3OjM2IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0wNlQx
MToyNDo0MS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4+IE9u
IDUvNi8yNSAyOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PiAyMDI1LTA1LTA1VDE0
OjM5OjI1LTA3OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT46Cj4+Pj4gVGhp
cyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBlbmFibGluZyBoc3RhdGVlbiBiaXRzIGxhemlseSBh
dCBydW50aW1lCj4+Pj4gaW5zdGVhZCBvZiBzdGF0aWNhbGx5IGF0IGJvb3RpbWUuIFRoZSBib290
IHRpbWUgZW5hYmxpbmcgaGFwcGVucyBmb3IKPj4+PiBhbGwgdGhlIGd1ZXN0cyBpZiB0aGUgcmVx
dWlyZWQgZXh0ZW5zaW9ucyBhcmUgcHJlc2VudCBpbiB0aGUgaG9zdCBhbmQvb3IKPj4+PiBndWVz
dC4gVGhhdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSBpZiB0aGUgZ3Vlc3QgbmV2ZXIgZXhlcmNpc2Ug
dGhhdAo+Pj4+IGZlYXR1cmUuIFdlIGNhbiBlbmFibGUgdGhlIGhzdGF0ZWVuIGJpdHMgdGhhdCBj
b250cm9scyB0aGUgYWNjZXNzIGxhemlseQo+Pj4+IHVwb24gZmlyc3QgYWNjZXNzLiBUaGlzIHBy
b3ZpZGVycyBLVk0gbW9yZSBncmFudWxhciBjb250cm9sIG9mIHdoaWNoCj4+Pj4gZmVhdHVyZSBp
cyBlbmFibGVkIGluIHRoZSBndWVzdCBhdCBydW50aW1lLgo+Pj4+Cj4+Pj4gQ3VycmVudGx5LCB0
aGUgZm9sbG93aW5nIGhzdGF0ZWVuIGJpdHMgYXJlIHN1cHBvcnRlZCB0byBjb250cm9sIHRoZSBh
Y2Nlc3MKPj4+PiBmcm9tIFZTIG1vZGUuCj4+Pj4KPj4+PiAxLiBCSVQoNTgpOiBJTVNJQyAgICAg
OiBTVE9QRUkgYW5kIElNU0lDIGd1ZXN0IGludGVycnVwdCBmaWxlCj4+Pj4gMi4gQklUKDU5KTog
QUlBICAgICAgIDogU0lQSC9TSUVIL1NUT1BJCj4+Pj4gMy4gQklUKDYwKTogQUlBX0lTRUwgIDog
SW5kaXJlY3QgY3NyIGFjY2VzcyB2aWEgc2lzZWxlY3Qvc2lyZWcKPj4+PiA0LiBCSVQoNjIpOiBI
U0VOVkNGRyAgOiBTRU5WQ0ZHIGFjY2Vzcwo+Pj4+IDUuIEJJVCg2Myk6IFNTVEFURUVOMCA6IFNT
VEFURUVOMCBhY2Nlc3MKPj4+Pgo+Pj4+IEtWTSBhbHJlYWR5IHN1cHBvcnQgdHJhcC9lbmFibGlu
ZyBvZiBCSVQoNTgpIGFuZCBCSVQoNjApIGluIG9yZGVyCj4+Pj4gdG8gc3VwcG9ydCBzdyB2ZXJz
aW9uIG9mIHRoZSBndWVzdCBpbnRlcnJ1cHQgZmlsZS4KPj4+IEkgZG9uJ3QgdGhpbmsgS1ZNIHRv
Z2dsZXMgdGhlIGhzdGF0ZWVuIGJpdHMgYXQgcnVudGltZSwgYmVjYXVzZSB0aGF0Cj4+PiB3b3Vs
ZCBtZWFuIHRoZXJlIGlzIGEgYnVnIGV2ZW4gaW4gY3VycmVudCBLVk0uCj4+IFRoaXMgd2FzIGEg
dHlwby4gSSBtZWFudCB0byBzYXkgdHJhcC9lbXVsYXRlIEJJVCg1OCkgYW5kIEJJVCg2MCkuCj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHRyeWluZyB0byBlbmFibGUgdGhlIHRvZ2dsaW5nIG9mIHRo
ZSBoc3RhdGVlbiBiaXRzCj4+IHVwb24gZmlyc3QgYWNjZXNzLgo+Pgo+PiBTb3JyeSBmb3IgdGhl
IGNvbmZ1c2lvbi4KPiBObyB3b3JyaWVzLCBpdCdzIG15IGZhdWx0IGZvciBtaXNyZWFkaW5nLgo+
IEkgZ290IGNvbmZ1c2VkLCBiZWNhdXNlIHRoZSBjb2RlIGxvb2tlZCBsaWtlIGdlbmVyaWMgbGF6
eSBlbmFibGVtZW50LAo+IHdoaWxlIGl0J3MgcmVhbGx5IG9ubHkgZm9yIHRoZSB1cHBlciAzMiBi
aXRzIGFuZCB0aGlzIHNlcmllcyBpcyBub3QgbGF6eQo+IHRvZ2dsaW5nIGFueSBWUy1tb2RlIHZp
c2libGUgYml0cy4KPgo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgVGhpcyBzZXJpZXMgZXh0ZW5kcwo+Pj4+IHRob3NlIHRvIGVuYWJsZSB0
byBjb3JyZXBzb25kaW5nIGhzdGF0ZWVuIGJpdHMgaW4gUEFUQ0gxLiBUaGUgcmVtYWluaW5nCj4+
Pj4gcGF0Y2hlcyBhZGRzIGxhenkgZW5hYmxpbmcgc3VwcG9ydCBvZiB0aGUgb3RoZXIgYml0cy4K
Pj4+IFRoZSBJU0EgaGFzIGEgcGVjdWxpYXIgZGVzaWduIGZvciBoc3RhdGVlbi9zc3RhdGVlbiBp
bnRlcmFjdGlvbjoKPj4+Cj4+PiAgICAgRm9yIGV2ZXJ5IGJpdCBpbiBhbiBoc3RhdGVlbiBDU1Ig
dGhhdCBpcyB6ZXJvICh3aGV0aGVyIHJlYWQtb25seSB6ZXJvCj4+PiAgICAgb3Igc2V0IHRvIHpl
cm8pLCB0aGUgc2FtZSBiaXQgYXBwZWFycyBhcyByZWFkLW9ubHkgemVybyBpbiBzc3RhdGVlbgo+
Pj4gICAgIHdoZW4gYWNjZXNzZWQgaW4gVlMtbW9kZS4KPj4gQ29ycmVjdC4KPj4KPj4+IFRoaXMg
bWVhbnMgd2UgbXVzdCBjbGVhciBiaXQgNjMgaW4gaHN0YXRlZW4gYW5kIHRyYXAgb24gc3N0YXRl
ZW4KPj4+IGFjY2Vzc2VzIGlmIGFueSBvZiB0aGUgc3N0YXRlZW4gYml0cyBhcmUgbm90IHN1cHBv
c2VkIHRvIGJlIHJlYWQtb25seSAwCj4+PiB0byB0aGUgZ3Vlc3Qgd2hpbGUgdGhlIGh5cGVydmlz
b3Igd2FudHMgdG8gaGF2ZSB0aGVtIGFzIDAuCj4+IEN1cnJlbnRseSwgdGhlcmUgYXJlIHR3byBi
aXRzIGluIHNzdGF0ZWVuLiBGQ1NSIGFuZCBaVlQgd2hpY2ggYXJlIG5vdAo+PiB1c2VkIGFueXdo
ZXJlIGluIG9wZW5zYmkvTGludXgvS1ZNIHN0YWNrLgo+IFRydWUsIEkgZ3Vlc3Mgd2UgY2FuIGp1
c3QgbWFrZSBzdXJlIHRoZSBjdXJyZW50IGNvZGUgY2FuJ3QgYnkgbWlzdGFrZQo+IGxhemlseSBl
bmFibGUgYW55IG9mIHRoZSBib3R0b20gMzIgaHN0YXRlZW4gYml0cyBhbmQgaGFuZGxlIHRoZSBj
YXNlCj4gcHJvcGVybHkgbGF0ZXIuCgpJIGNhbiB1cGRhdGUgdGhlIGNvdmVyIGxldHRlciBhbmQg
bGVhdmUgYSBjb21tZW50IGFib3V0IHRoYXQuCgpEbyB5b3Ugd2FudCBhIGFkZGl0aW9uYWwgY2hl
Y2sgaW4gc3N0YXRlZW4gCnRyYXAoa3ZtX3Jpc2N2X3ZjcHVfaHN0YXRlZW5fZW5hYmxlX3N0YXRl
ZW4pCnRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBuZXcgdmFsdWUgZG9lc24ndCBoYXZlIGFueSBiaXRz
IHNldCB0aGF0IGlzIG5vdCAKcGVybWl0dGVkIGJ5IHRoZSBoeXBlcnZpc29yID8KCj4+IEluIGNh
c2UsIHdlIG5lZWQgdG8gZW5hYmxlIG9uZSBvZiB0aGUgYml0cyBpbiB0aGUgZnV0dXJlLCBkb2Vz
IGh5cGV2aXNvcgo+PiBuZWVkIHRvIHRyYXAgZXZlcnkgc3N0YXRlZW4gYWNjZXNzID8KPiBXZSBu
ZWVkIHRvIHRyYXAgc3N0YXRlZW4gYWNjZXNzZXMgaWYgdGhlIGd1ZXN0IGlzIHN1cHBvc2VkIHRv
IGJlIGFibGUgdG8KPiBjb250cm9sIGEgYml0IGluIHNzdGF0ZWVuLCBidXQgdGhlIGh5cGVydmlz
b3Igd2FudHMgdG8gbGF6aWx5IGVuYWJsZQo+IHRoYXQgZmVhdHVyZSBhbmQgc2V0cyAwIGluIGhz
dGF0ZWVuIHVudGlsIHRoZSBmaXJzdCB0cmFwLgpZZXMuIFRoYXQncyB3aGF0IFBBVENIIDQgaW4g
dGhpcyBzZXJpZXMgZG9lcy4KPiBJZiBoc3RhdGVlbiBpcyAxIGZvciBhbGwgZmVhdHVyZXMgdGhh
dCB0aGUgZ3Vlc3QgY291bGQgY29udHJvbCB0aHJvdWdoCj4gc3N0YXRlZW4sIHdlIGNhbiBhbmQg
c2hvdWxkIGp1c3Qgc2V0IHRoZSBTRSBiaXQgKDYzKSB0byAxIGFzIHdlbGwuCj4KPj4gQXMgcGVy
IG15IHVuZGVyc3RhbmRpbmcsIGl0IHNob3VsZCBiZSBoYW5kbGVkIGluIHRoZSBoYXJkd2FyZSBh
bmQgYW55Cj4+IHdyaXRlIGFjY2VzcyB0byB0byB0aG9zZSBiaXRzIHNob3VsZCBiZSBtYXNrZWQK
Pj4gd2l0aCBoc3RhdGVlbiBiaXQgdmFsdWUgc28gdGhhdCBpdCBtYXRjaGVzLiBUaGF0J3Mgd2hh
dCB3ZSBkbyBpbiBRZW11IGFzCj4+IHdlbGwuCj4gUmlnaHQsIGhhcmR3YXJlIHdpbGwgZG8gdGhl
IGpvYiBtb3N0IG9mIHRoZSB0aW1lLiAgSXQncyByZWFsbHkgb25seSBmb3IKPiB0aGUgbGF6eSBt
YXNraW5nLCBiZWF1c2UgaWYgd2UgZG9uJ3QgdHJhcCB0aGUgc3RhdGVlbiBhY2Nlc3NlcywgdGhl
eQo+IHdvdWxkIGRpZmZlciBmcm9tIHdoYXQgdGhlIGd1ZXN0IHNob3VsZCBzZWUuCgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
