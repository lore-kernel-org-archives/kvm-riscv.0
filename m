Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CF4C5AD49
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMXOFuzVwpr9346x2IhMK/v6aj0MDmEejTXsLAf5ZKE=; b=We0yjVw7xCRwa5
	38fNoHqC+wB0EI3oTz+/7roxduCRLSc4rnfeg/w2VG3jQNIsnMuZhDZfeRCDo87t6xSXoIWSsotvt
	/ZjCQoBb4weKdAPTVE1PUdt/eDF7jszEgBFzuVICeSoSKYHaLn6RW1I2SH/T5V2quPLWZVXky9Kq2
	7+TqIYY8suM2tOkqsC4SWo4VnmfdV/hWhfwszYsHpc3gUcnTSpK/12sY6672nAqfpOZzCoc1aSbzc
	qGz+SB9I2Q89ToAYdz600NssFtUCdzG9RGDESHr8QLvWfQRnTtFw85qi5YLd3CF6WSRB2v0wamaUS
	pJDVmaTewulqgXFVKqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMc1B-0000000C4Fi-3SrV;
	Wed, 04 Jun 2025 00:30:09 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMc18-0000000C4Eq-0nF4
	for kvm-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 00:30:08 +0000
Message-ID: <6138a043-5b5b-46af-ba8b-01dac55dee23@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748997001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8MZYMhTjyXQwSFJY/e0Bg+aJ/DYLC4LmKmte6yFXBpM=;
	b=WEPUnmjl01eoxpfj2bo/wjnCnhorQhBLZ1U6kM9OBHA8kNJHz74sZvC5bbf9Xq5wG8FEwv
	2RVwYAOiBOU0zVcu1kuuJpmJnm5Ki55YySE0AfXWX4gcRbFoRZDZsm2tjcyYXSTjjwAR5F
	F+e/j1567odazU5Fm1OHqh6K6+KqGGI=
Date: Tue, 3 Jun 2025 17:29:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
 <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
 <20250528-ff9f6120de39c3e4eefc5365@orel>
 <1169138f-8445-4522-94dd-ad008524c600@linux.dev>
 <DA8KL716NTCA.2QJX4EW2OI6AL@ventanamicro.com>
 <2bac252c-883c-4f8a-9ae1-283660991520@linux.dev>
 <DA9G60UI0ZLC.1KIWBXCTX0427@ventanamicro.com>
 <0dcd01cd-419f-4225-b22c-cbaf82718235@linux.dev>
 <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DACVBRLJ5MMV.1COZ83HBMUD6A@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_173006_982896_7210E654 
X-CRM114-Status: GOOD (  25.11  )
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

Ck9uIDYvMy8yNSA0OjQwIEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAyNS0wNS0zMFQx
MjoyOTozMC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4+IE9u
IDUvMzAvMjUgNDowOSBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4gMjAyNS0wNS0yOVQx
MTo0NDozOC0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4+Pj4g
T24gNS8yOS8yNSAzOjI0IEFNLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+Pj4+IEkgb3JpZ2lu
YWxseSBnYXZlIHVwIG9uIHRoZSBpZGVhLCBidXQgSSBmZWVsIGtpbmRhIGJhZCBmb3IgRHJldyBu
b3csIHNvCj4+Pj4+IHRyeWluZyBhZ2FpbjoKPj4+PiBJIGFtIHNvcnJ5IGlmIHNvbWUgb2YgbXkg
cmVwbGllcyBjYW1lIGFjcm9zcyBpbiB0aGUgd3Jvbmcgd2F5LiBUaGF0IHdhcwo+Pj4+IG5ldmVy
Cj4+Pj4gdGhlIGludGVudGlvbi4KPj4+IEkgZGlkbid0IG1lYW4gdG8gYWNjdXNlIHlvdSwgbXkg
YXBvbG9naWVzLiAgSSBhZ3JlZSB3aXRoIERyZXcncwo+Pj4gcG9zaXRpb25zLCBzbyB0byBleHBh
bmQgb24gYSBxdWVzdGlvbiB0aGF0IHdhc24ndCB0b3VjaGVkIGluIGhpcyBtYWlsOgo+Pj4KPj4+
Pj4gRXZlbiBpZiB1c2Vyc3BhY2Ugd2FudHMgU0JJIGZvciB0aGUgTS1tb2RlIGludGVyZmFjZSwg
c2VjdXJpdHkgbWluZGVkCj4+Pj4gVGhpcyBpcyBwcm9iYWJseSBhIDNyZCBvbmUgPyBXaHkgd2Ug
d2FudCBNLW1vZGUgaW50ZXJmYWNlIGluIHRoZSB1c2VyCj4+Pj4gc3BhY2UgPwo+Pj4gSXQgaXMg
YWJvdXQgdHVybmluZyBLVk0gaW50byBhbiBJU0EgYWNjZWxlcmF0b3IuCj4+Pgo+Pj4gQSBndWVz
dCB0aGlua3MgaXQgaXMgcnVubmluZyBpbiBTL0hTLW1vZGUuCj4+PiBUaGUgZWNhbGwgaW5zdHJ1
Y3Rpb24gdHJhcHMgdG8gTS1tb2RlLiAgUklTQy1WIEggZXh0ZW5zaW9uIGRvZXNuJ3QKPj4+IGFj
Y2VsZXJhdGUgTS1tb2RlLCBzbyB3ZSBoYXZlIHRvIGVtdWxhdGUgdGhlIHRyYXAgaW4gc29mdHdh
cmUuCj4+IFdlIGRvbid0IG5lZWQgdG8gYWNjZWxlcmF0ZSBNLW1vZGUuIFRoYXQncyB0aGUgYmVh
dXR5IG9mIHRoZSBSSVNDLVYgSAo+PiBleHRlbnNpb24uCj4gKEl0IGlzIGEgZ2FwIHRvIG1lLiA6
XSkKUklTQy1WIEggZXh0ZW5zaW9uIGlzIGRlc2lnbmVkIHRvIHZpcnR1YWxpemUgUy1tb2RlIGFu
ZCBVLW1vZGUuIE5vdCBNLW1vZGUuCkkgZG9uJ3QgdGhpbmsgcmV0cm9maXR0aW5nIE0tbW9kZSB2
aXJ0dWFsaXphdGlvbiBoYXMgYWJzb2x1dGVseSBhbnkgCmJlbmVmaXQuIEl0IGhhcwptYW55IGNo
YWxsZW5nZXMgdGhhdCB3aWxsIHByb2JhYmx5IHJlc3VsdCBpbiBwb29yIHBlcmZvcm1hbmNlLiBJ
dCBjYW4gYmUgCmEgaG9iYnkgcHJvamVjdApidXQgSSBhbSBub3Qgc3VyZSBpZiBpdCBjYW4gYmUg
YWRvcHRlZCBpbiBwcm9kdWN0aW9uLgoKQXJlIHRoZXJlIGFueSBzaW1pbGFyIHVzZSBjYXNlcyBp
biBvdGhlciBJU0FzID8gRG9lcyBhbnlib2R5IHN1cHBvcnQgCnZpcnR1YWxpemFpbmcgRUwzIGlu
IEFSTTY0ID8KCj4+IFRoZSBJU0EgaXMgZGVzaWduZWQgaW4gc3VjaCBhIHdheSB0aGF0IHRoZSBT
QkkgaXMgdGhlIGludGVyZmFjZSBiZXR3ZWVuCj4+IHRoZSBzdXBlcnZpc29yIGVudmlyb25tZW50
IChWUy9IUykKPj4gYW5kIHRoZSBzdXBlcnZpc29yIGV4ZWN1dGlvbiBlbnZpcm9ubWVudCAoSFMv
TSkuCj4gVGhlIElTQSBzYXlzIG5vdGhpbmcgYWJvdXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHNh
aWQgaW50ZXJmYWNlLgo+Cj4gUmV0dXJuaW5nIDQyIGluIHgyMSBhcyBhIHJlc3BvbnNlIHRvIGFu
IGVjYWxsIHdpdGggMHgxMCBpbiBhNyBhbmQgMHgzIGluCj4gYTYgaXMgcGVyZmVjdGx5IHZhbGlk
IFJJU0MtViBpbXBsZW1lbnRhdGlvbiB0aGF0IEtWTSBjdXJyZW50bHkgY2Fubm90Cj4gdmlydHVh
bGl6ZS4KCklmIHRoZSBjb25jZXJuIGlzIG9ubHkgc3VwcG9ydGluZyBhbiBvbGRlciB2ZXJzaW9u
IG9mIFNCSSB2ZXJzaW9uLCB3ZSAKY2FuIHN1cHBvcnQgdGhhdCB3aXRoIG9uZXJlZwppbnRlcmZh
Y2UgdG9kYXkuIEkgdGhpbmsgSSBhbHJlYWR5IGFncmVlZCBvbiB0aGF0IGVhcmxpZXIgaW4gdGhp
cyB0aHJlYWQgCmFuZCByZXZpc2UgdGhpcyBzZXJpZXMgdG8gaGF2ZQppdCByZWFkeSBmb3IgcmV2
aWV3LgoKCj4+PiBUaGUgSVNBIGRvZXNuJ3Qgc2F5IHRoYXQgTS1tb2RlIG1lYW5zIFNCSS4gIFdl
IHRyeSByZWFsbHkgaGFyZCB0byBoYXZlCj4+PiBTQkkgb24gYWxsIFJJU0MtViwgYnV0IEkgdGhp
bmsgS1ZNIGlzIHRha2luZyBpdCBhIGJpdCB0b28gZmFyLgo+Pj4KPj4+IFdlIGNhbiBkaXNjdXNz
IGhvdyBiZXN0IHRvIGRlc2NyaWJlIFNCSSwgc28gdXNlcnNwYWNlIGNhbiBjaG9vc2UgdG8KPj4+
IGFjY2VsZXJhdGUgdGhlIE0tbW9kZSBpbiBLVk0sIGJ1dCBJIHRoaW5rIHRoYXQgdGhlIGFiaWxp
dHkgdG8gZW11bGF0ZQo+Pj4gTS1tb2RlIGluIHVzZXJzcGFjZSBzaG91bGQgYmUgcHJvdmlkZWQu
Cj4+IEkgYW0gc3RpbGwgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgdGhlIGFkdmFudGFnZXMgb2YgZW11
bGF0aW5nIHRoZSBNLW1vZGUKPj4gaW4gdGhlIHVzZXIgc3BhY2UuCj4+IENhbiB5b3UgcGxlYXNl
IGVsYWJvcmF0ZSA/Cj4gVGhpcyB0aHJlYWQgYWxyZWFkeSBoYXMgYSBsb3Qgb2YgdGhlbSwgc28g
dG8gYXZvaWQgcmVwZWF0aW5nIHRoZW0sIEkKPiBoYXZlIHRvIGdvIGludG8gcXVpdGUgbmljaGUg
dXNlLWNhc2VzOgo+IFdoZW4gZGV2ZWxvcGluZyBNLW1vZGUgc29mdHdhcmUgb24gUklTQy1WICh3
aGVuIFJJU0MtViBoYXMgbW9yZSB1c2VmdWwKPiBpbXBsZW1lbnRhdGlvbnMgdGhhbiBRRU1VKSwg
YSBkZXZlbG9wZXIgbWlnaHQgd2FudCB0byBhY2NlbGVyYXRlIHRoZQo+IFMvVS1tb2RlcyBpbiBL
Vk0uCj4gSXQgaXMgYWxzbyBzaW1wbGVyIHRvIGltcGxlbWVudCBhbiBvbGQgU0JJIGludGVyZmFj
ZSAoZXNwZWNpYWxseSB3aXRoCj4gYnVncy9xdWlya3MpIGlmIHZpcnR1YWxpemF0aW9uIGp1c3Qg
ZXhlY3V0ZXMgdGhlIG9sZCBNLW1vZGUgYmluYXJ5Lgo+Cj4gV2h5IG11c3QgS1ZNIHByZXZlbnQg
dXNlcnNwYWNlIGZyb20gdmlydHVhbGl6aW5nIFJJU0MtVj8KCklmIHRoZXJlIGlzIGEgdmFsaWQg
dXNlIGNhc2UgdGhhdCBjYW4gYmUgcHV0IGludG8gcHJvZHVjdGlvbiBvcgppZiB5b3UgaGF2ZSBh
bnkgcHJvdG90eXBlIHRoYXQgaXQgaGFzIGJldHRlciBwZXJmb3JtYW5jZSB0aGVuIHdlIGNhbiAK
aGF2ZSBpdC4KSW4gYWJzZW5jZSBvZiBlaXRoZXIsIGlzbid0IGl0IGJldHRlciB0byBzcGVuZCBv
dXIgZW5lcmd5IG9uIHRoaW5ncyB0aGF0IAphY3R1YWxseSBtYXR0ZXIKcmlnaHQgbm93IGFuZCBp
bXByb3ZlIFJJU0MtViB2aXJ0dWFsaXphdGlvbiBwZXJmb3JtYW5jZSByYXRoZXIgdGhhbiAKc29t
ZXRoaW5nIHRoYXQKbWF5IG9yIG1heSBub3QgYmUgcG9zc2libGUgaW4gdGhlIHZlcnkgZmFyIGZ1
dHVyZS4KCj4+IEkgYW0gYXNzdW1pbmcgeW91IGFyZSBub3QgaGludGluZyBOZXN0ZWQgdmlydHVh
bGl6YXRpb24gd2hpY2ggY2FuIGJlCj4+IGFjaGlldmVkIHdpdGggZXhpc3RpbmcKPj4gSVNBIHBy
b3ZpZGVkIG1lY2hhbmlzbXMgYW5kIGFjY2VsZXJhdGVkIGJ5IFNCSSBOQUNMLgo+IFJpZ2h0LCBJ
IGFtIHRhbGtpbmcgYWJvdXQgdmlydHVhbGl6YXRpb24gb2YgUklTQy1WLCBiZWNhdXNlIEkgZG9u
J3QgaGF2ZQo+IGEgY3J5c3RhbCBiYWxsIHRvIGZpZ3VyZSBvdXQgd2hhdCB1c2VycyB3aWxsIHdh
bnQuCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
