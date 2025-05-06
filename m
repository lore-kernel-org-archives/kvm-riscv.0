Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F88CC3ABBC
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 May 2025 23:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kApyAQRGYg+Q3OFUT/cjy/p5hZr1wCiNL3HrHJBmOtY=; b=pfNWFwIqCw4anC
	+dVzM6LTLMZ25vl0J2a89FgWch7n1prPO6a7joD6nZOt+S5lHE6SlG/A1bWDaR8KPFGfMZxQ8oMth
	hFJO9CJI3JCAr7+FS33KQIzSy3thLd+FFkEYXzkHLBNVdI3D6rgkVfJp5geztImgMO/KG4rLTPocr
	yB7wkd7ks7rKW+T7VEw/QNidndlOz23RtbLXWMcIsQnGVDZEUXVd8rRSZ8S8y0IY2EY6TUXaNoTnq
	2+GPcyGHwFpArA1Ux7q31FeEQP6H3jO+ELnBlZDaOHyOf35ABm6G1yHP+LOtKKhixReF2KYQbIsyy
	kcXfXWbTbIiQwMhkdhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRpf-0000000DgSL-1ZJI;
	Tue, 06 May 2025 23:36:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMyv-0000000D67v-2c4E
	for kvm-riscv@bombadil.infradead.org;
	Tue, 06 May 2025 18:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Yg0ojWgQyQzU5i4Zxk36RG+sOM1+p0j0oZkxihGIqjM=; b=qHWQLDAKwqs+ooWsDctHwFE2jw
	YJbmG65TgZY/N5krP+eKpFulzGFNdi4LaIaLhMjrkMbynGQT3rSjuJdO5yYFKb8cuakgjOSHA8cRK
	YVBNrrbQUYSJ8ELWdf9BD+yPH2/IBrxk8GMbRx5+gjqQUdFUqQhANDzEap3JWVajwNHtuLO/VRJHM
	uOUSpqvLoV0dd0Ho0aV62ChN226vbs1P3sl8ED9YYoVOLmK1vXAdYLzWafz1uEzOomqzRzERhc7SA
	KePcvqSucnJBPDepJlaIWjdCpyNkJKAytiUkgMfq5CAYIf9936Eif5leJ2w+45fJ5QZg1S34NuheN
	xD7rpLHg==;
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCMys-0000000Fg5F-1jhM
	for kvm-riscv@lists.infradead.org;
	Tue, 06 May 2025 18:25:28 +0000
Message-ID: <bc0f1273-d596-47dd-bcc6-be9894157828@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746555888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg0ojWgQyQzU5i4Zxk36RG+sOM1+p0j0oZkxihGIqjM=;
	b=k0R83fqYWpu7LJn4XbkVaJzLInKcqjnv1ZRLheQSZAv864qp2zIP1leM7Q9wUmA/lM8AHO
	DXPpLHFHSkf7TaG3pm7MA9uOLqSQCnIDRmLFBRFB6aVPp2ow0PEjJgrTFCJnYc+CVnogx5
	J+s+IM6OyoMt8Axfr7Mcsh+LkLx2WbA=
Date: Tue, 6 May 2025 11:24:41 -0700
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <D9OYWFEXSA55.OUUXFPIGGBZV@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_192526_660794_9F591D61 
X-CRM114-Status: GOOD (  19.03  )
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

Ck9uIDUvNi8yNSAyOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0wNVQx
NDozOToyNS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Ogo+PiBUaGlz
IHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGVuYWJsaW5nIGhzdGF0ZWVuIGJpdHMgbGF6aWx5IGF0
IHJ1bnRpbWUKPj4gaW5zdGVhZCBvZiBzdGF0aWNhbGx5IGF0IGJvb3RpbWUuIFRoZSBib290IHRp
bWUgZW5hYmxpbmcgaGFwcGVucyBmb3IKPj4gYWxsIHRoZSBndWVzdHMgaWYgdGhlIHJlcXVpcmVk
IGV4dGVuc2lvbnMgYXJlIHByZXNlbnQgaW4gdGhlIGhvc3QgYW5kL29yCj4+IGd1ZXN0LiBUaGF0
IG1heSBub3QgYmUgbmVjZXNzYXJ5IGlmIHRoZSBndWVzdCBuZXZlciBleGVyY2lzZSB0aGF0Cj4+
IGZlYXR1cmUuIFdlIGNhbiBlbmFibGUgdGhlIGhzdGF0ZWVuIGJpdHMgdGhhdCBjb250cm9scyB0
aGUgYWNjZXNzIGxhemlseQo+PiB1cG9uIGZpcnN0IGFjY2Vzcy4gVGhpcyBwcm92aWRlcnMgS1ZN
IG1vcmUgZ3JhbnVsYXIgY29udHJvbCBvZiB3aGljaAo+PiBmZWF0dXJlIGlzIGVuYWJsZWQgaW4g
dGhlIGd1ZXN0IGF0IHJ1bnRpbWUuCj4+Cj4+IEN1cnJlbnRseSwgdGhlIGZvbGxvd2luZyBoc3Rh
dGVlbiBiaXRzIGFyZSBzdXBwb3J0ZWQgdG8gY29udHJvbCB0aGUgYWNjZXNzCj4+IGZyb20gVlMg
bW9kZS4KPj4KPj4gMS4gQklUKDU4KTogSU1TSUMgICAgIDogU1RPUEVJIGFuZCBJTVNJQyBndWVz
dCBpbnRlcnJ1cHQgZmlsZQo+PiAyLiBCSVQoNTkpOiBBSUEgICAgICAgOiBTSVBIL1NJRUgvU1RP
UEkKPj4gMy4gQklUKDYwKTogQUlBX0lTRUwgIDogSW5kaXJlY3QgY3NyIGFjY2VzcyB2aWEgc2lz
ZWxlY3Qvc2lyZWcKPj4gNC4gQklUKDYyKTogSFNFTlZDRkcgIDogU0VOVkNGRyBhY2Nlc3MKPj4g
NS4gQklUKDYzKTogU1NUQVRFRU4wIDogU1NUQVRFRU4wIGFjY2Vzcwo+Pgo+PiBLVk0gYWxyZWFk
eSBzdXBwb3J0IHRyYXAvZW5hYmxpbmcgb2YgQklUKDU4KSBhbmQgQklUKDYwKSBpbiBvcmRlcgo+
PiB0byBzdXBwb3J0IHN3IHZlcnNpb24gb2YgdGhlIGd1ZXN0IGludGVycnVwdCBmaWxlLgo+IEkg
ZG9uJ3QgdGhpbmsgS1ZNIHRvZ2dsZXMgdGhlIGhzdGF0ZWVuIGJpdHMgYXQgcnVudGltZSwgYmVj
YXVzZSB0aGF0Cj4gd291bGQgbWVhbiB0aGVyZSBpcyBhIGJ1ZyBldmVuIGluIGN1cnJlbnQgS1ZN
LgoKVGhpcyB3YXMgYSB0eXBvLiBJIG1lYW50IHRvIHNheSB0cmFwL2VtdWxhdGUgQklUKDU4KSBh
bmQgQklUKDYwKS4KVGhpcyBwYXRjaCBzZXJpZXMgaXMgdHJ5aW5nIHRvIGVuYWJsZSB0aGUgdG9n
Z2xpbmcgb2YgdGhlIGhzdGF0ZWVuIGJpdHMgCnVwb24gZmlyc3QgYWNjZXNzLgoKU29ycnkgZm9y
IHRoZSBjb25mdXNpb24uCgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgVGhpcyBzZXJpZXMgZXh0ZW5kcwo+PiB0aG9zZSB0byBlbmFibGUgdG8g
Y29ycmVwc29uZGluZyBoc3RhdGVlbiBiaXRzIGluIFBBVENIMS4gVGhlIHJlbWFpbmluZwo+PiBw
YXRjaGVzIGFkZHMgbGF6eSBlbmFibGluZyBzdXBwb3J0IG9mIHRoZSBvdGhlciBiaXRzLgo+IFRo
ZSBJU0EgaGFzIGEgcGVjdWxpYXIgZGVzaWduIGZvciBoc3RhdGVlbi9zc3RhdGVlbiBpbnRlcmFj
dGlvbjoKPgo+ICAgIEZvciBldmVyeSBiaXQgaW4gYW4gaHN0YXRlZW4gQ1NSIHRoYXQgaXMgemVy
byAod2hldGhlciByZWFkLW9ubHkgemVybwo+ICAgIG9yIHNldCB0byB6ZXJvKSwgdGhlIHNhbWUg
Yml0IGFwcGVhcnMgYXMgcmVhZC1vbmx5IHplcm8gaW4gc3N0YXRlZW4KPiAgICB3aGVuIGFjY2Vz
c2VkIGluIFZTLW1vZGUuCgpDb3JyZWN0LgoKPiBUaGlzIG1lYW5zIHdlIG11c3QgY2xlYXIgYml0
IDYzIGluIGhzdGF0ZWVuIGFuZCB0cmFwIG9uIHNzdGF0ZWVuCj4gYWNjZXNzZXMgaWYgYW55IG9m
IHRoZSBzc3RhdGVlbiBiaXRzIGFyZSBub3Qgc3VwcG9zZWQgdG8gYmUgcmVhZC1vbmx5IDAKPiB0
byB0aGUgZ3Vlc3Qgd2hpbGUgdGhlIGh5cGVydmlzb3Igd2FudHMgdG8gaGF2ZSB0aGVtIGFzIDAu
CgpDdXJyZW50bHksIHRoZXJlIGFyZSB0d28gYml0cyBpbiBzc3RhdGVlbi4gRkNTUiBhbmQgWlZU
IHdoaWNoIGFyZSBub3QgCnVzZWQgYW55d2hlcmUgaW4gb3BlbnNiaS9MaW51eC9LVk0gc3RhY2su
CgpJbiBjYXNlLCB3ZSBuZWVkIHRvIGVuYWJsZSBvbmUgb2YgdGhlIGJpdHMgaW4gdGhlIGZ1dHVy
ZSwgZG9lcyBoeXBldmlzb3IgCm5lZWQgdG8gdHJhcCBldmVyeSBzc3RhdGVlbiBhY2Nlc3MgPwpB
cyBwZXIgbXkgdW5kZXJzdGFuZGluZywgaXQgc2hvdWxkIGJlIGhhbmRsZWQgaW4gdGhlIGhhcmR3
YXJlIGFuZCBhbnkgCndyaXRlIGFjY2VzcyB0byB0byB0aG9zZSBiaXRzIHNob3VsZCBiZSBtYXNr
ZWQKd2l0aCBoc3RhdGVlbiBiaXQgdmFsdWUgc28gdGhhdCBpdCBtYXRjaGVzLiBUaGF0J3Mgd2hh
dCB3ZSBkbyBpbiBRZW11IGFzIAp3ZWxsLgoKCj4gVGhhbmtzLgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
