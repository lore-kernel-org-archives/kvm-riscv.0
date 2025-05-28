Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2959C5AD49
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 May 2025 14:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD0M9WjtKZ5rtbhVa6AiQQNKVn3pEeQkbXwBKnxau3A=; b=NgMNyD5dkpIMcm
	1EDzaSPoL97lSjAiX5LDKa6siSLm0jl/vujwrrYXojvffGEhQcidhIe1caSx6YLzB0MA8pg4SzoKa
	FDTtbCEaZV1G6cMERhe9W47YDA1nwcNUf9AMiyI6pIY59dCoVKwKRMQVU8XU/6sUC3E+QQsO37Fgd
	LhBPJBAgMU1HBYixyicAwJjvJwQnBgLQcN7kSeJ4e7ktnqz3XYxfna5IsEYoXTOCpSKBE9CNtz/vi
	FTWs3Pj8sRzOclNNNgbCQCn/nfUzM9di2FaNYRRNRjaQhK+GO+seuxY1fh4i03evAZZcS/3WYeXJc
	EuJ2HjWGwVJtAY0bBclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHlu-0000000DOwY-2IXw;
	Wed, 28 May 2025 14:28:46 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHa3-0000000DLe9-3KS1
	for kvm-riscv@lists.infradead.org;
	Wed, 28 May 2025 14:16:33 +0000
Message-ID: <ace8be22-3dba-41b0-81f0-bf6d661b4343@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748441779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5mLYhkH15cgSjxuuv6l4kYe/fzzBQUwpR9u2pfZOy8=;
	b=qjpKfob7Z9nwJXoxx5GUB/npEZom5q2cVoX+WSrhUvhCp38miksFI15n7HED2ElCpa+Gzh
	rMarA3QV5uYksrG/9PUOkqwZt07frFarx52lcp28KkCgCK6TwCddvcYR3TQi0qP59jouqi
	jrs60IDKyBiuILyERrfCfy38ldk8MHk=
Date: Wed, 28 May 2025 07:16:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
To: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
 <20250526-224478e15ee50987124a47ac@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250526-224478e15ee50987124a47ac@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_071631_973531_0DED4665 
X-CRM114-Status: GOOD (  20.16  )
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

T24gNS8yNi8yNSA0OjEzIEFNLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXkgMjYs
IDIwMjUgYXQgMTE6MDA6MzBBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+PiAyMDI1
LTA1LTIzVDEwOjE2OjExLTA3OjAwLCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2
PjoKPj4+IE9uIDUvMjMvMjUgNjozMSBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+Pj4+IDIw
MjUtMDUtMjJUMTI6MDM6NDMtMDc6MDAsIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29t
PjoKPj4+Pj4gVXBncmFkZSB0aGUgU0JJIHZlcnNpb24gdG8gdjMuMCBzbyB0aGF0IGNvcnJlc3Bv
bmRpbmcgZmVhdHVyZXMKPj4+Pj4gY2FuIGJlIGVuYWJsZWQgaW4gdGhlIGd1ZXN0Lgo+Pj4+Pgo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4+
Pj4gLS0tCj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1
X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+Pj4+PiAtI2Rl
ZmluZSBLVk1fU0JJX1ZFUlNJT05fTUFKT1IgMgo+Pj4+PiArI2RlZmluZSBLVk1fU0JJX1ZFUlNJ
T05fTUFKT1IgMwo+Pj4+IEkgdGhpbmsgaXQncyB0aW1lIHRvIGFkZCB2ZXJzaW9uaW5nIHRvIEtW
TSBTQkkgaW1wbGVtZW50YXRpb24uCj4+Pj4gVXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRvIHNl
bGVjdCB0aGUgZGVzaXJlZCBTQkkgdmVyc2lvbiBhbmQgS1ZNIHdvdWxkCj4+Pj4gdGVsbCB0aGUg
Z3Vlc3QgdGhhdCBuZXdlciBmZWF0dXJlcyBhcmUgbm90IHN1cHBvcnRlZC4KPiAKPiBXZSBuZWVk
IG5ldyBjb2RlIGZvciB0aGlzLCBidXQgaXQncyBhIGdvb2QgaWRlYS4KPiAKPj4+Cj4+PiBXZSBj
YW4gYWNoaWV2ZSB0aGF0IHRocm91Z2ggb25lcmVnIGludGVyZmFjZSBieSBkaXNhYmxpbmcgaW5k
aXZpZHVhbCBTQkkKPj4+IGV4dGVuc2lvbnMuCj4+PiBXZSBjYW4gZXh0ZW5kIHRoZSBleGlzdGlu
ZyBvbmVyZWcgaW50ZXJmYWNlIHRvIGRpc2FibGUgYSBzcGVjaWZpYyBTQkkKPj4+IHZlcnNpb24g
ZGlyZWN0bHkKPj4+IGluc3RlYWQgb2YgaW5kaXZpZHVhbCBvbmVzIHRvIHNhdmUgdGhvc2UgSU9D
VEwgYXMgd2VsbC4KPj4KPj4gWWVzLCBJIGFtIGFsbCBpbiBmYXZvciBvZiBsZXR0aW5nIHVzZXJz
cGFjZSBwcm92aWRlIGFsbCB2YWx1ZXMgaW4gdGhlCj4+IEJBU0UgZXh0ZW5zaW9uLgo+IAoKV2Ug
YWxyZWFkeSBzdXBwb3J0IHZlbmRvcmlkL2FyY2hpZC9pbXBpZCB0aHJvdWdoIG9uZSByZWcuIEkg
dGhpbmsgd2UgCmp1c3QgbmVlZCB0byBhZGQgdGhlIFNCSSB2ZXJzaW9uIHN1cHBvcnQgdG8gdGhh
dCBzbyB0aGF0IHVzZXIgc3BhY2UgY2FuIApzZXQgaXQuCgo+IFRoaXMgaXMgY292ZXJlZCBieSB5
b3VyIHJlY2VudCBwYXRjaCB0aGF0IHByb3ZpZGVzIHVzZXJzcGFjZV9zYmkuCgpXaHkgZG8gd2Ug
bmVlZCB0byBpbnZlbnQgbmV3IElPQ1RMIGZvciB0aGlzID8gT25jZSB0aGUgdXNlciBzcGFjZSBz
ZXRzIAp0aGUgU0JJIHZlcnNpb24sIEtWTSBjYW4gZW5mb3JjZSBpdC4KCj4gV2l0aCB0aGF0LCB1
c2Vyc3BhY2UgY2FuIGRpc2FibGUgYWxsIGV4dGVuc2lvbnMgdGhhdCBhcmVuJ3QKPiBzdXBwb3J0
ZWQgYnkgYSBnaXZlbiBzcGVjIHZlcnNpb24sIGRpc2FibGUgQkFTRSBhbmQgdGhlbiBwcm92aWRl
Cj4gYSBCQVNFIHRoYXQgYWR2ZXJ0aXNlcyB0aGUgdmVyc2lvbiBpdCB3YW50cy4gVGhlIG5ldyBj
b2RlIGlzIG5lZWRlZAo+IGZvciBleHRlbnNpb25zIHRoYXQgdXNlcnNwYWNlIHN0aWxsIHdhbnRz
IEtWTSB0byBhY2NlbGVyYXRlLCBidXQgdGhlbgo+IEtWTSBuZWVkcyB0byBiZSBpbmZvcm1lZCBp
dCBzaG91bGQgZGVueSBhbGwgZnVuY3Rpb25zIG5vdCBpbmNsdWRlZCBpbgo+IHRoZSBzZWxlY3Rl
ZCBzcGVjIHZlcnNpb24uCj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
