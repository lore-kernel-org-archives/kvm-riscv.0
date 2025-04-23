Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494A2C369C2
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=leZJKDxfX6wQN/0P82tO9Atm0iItEKl1MWrZJuxz8RU=; b=RD+tFpIrpkk3fK
	SHAj4Q3+ghDIOo9A/cMMw+6A4XZJc+Hj8FPqhgM7eplh3xAbWzMwCF9Akfd5LmUtyxAKDFbNAGvK6
	pVl3FJJ7H0QyzmLQSdJMdrMpXtUWmAlX1TaJ4UwLmKTvs4H4s+OZhW7s0YGoCjUHPZWHDSTwazbrD
	U5NkCYgadOtbpQyluj4/hFxGasostXTV68CyWknSKsVgnb4DyDl0ENLIwO3YRFcvVKTilCKlMDtPg
	xru6WhMId/aCh+SEknGc2/QlSn1bvsPx223U3O6npI76KMcBopDkUM9tnubTLk+yGQEm6ab+TCQm4
	XvF7m8T47lKQHscmbXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Nbs-00000008rLo-3pEp;
	Wed, 23 Apr 2025 00:05:04 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7NZz-00000008r3T-0EKs
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 00:03:09 +0000
Message-ID: <42e1d440-24a0-4bdb-b21f-fedf8b7be4fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745366573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WZGPFf3wMnSbU09hVmCJjsXY+G6x3DIKE+UVsiEcfVo=;
	b=VhzsM7SfNxZBX8mRw1/QEzjMwF2pH593aPmDUeBsHCgaieFXrT8VRFFfIFY3prO034W1jt
	+bTJq+wjNisRfusKlmRzBCJP9HI2Txq8P/OmG2NCMR2VbCR5tIP+SSMbok6Kn2a6giMEZY
	1zMY3nOiwGnbm9AccKkxUE1U9Y6IROA=
Date: Tue, 22 Apr 2025 17:02:44 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v5 11/21] RISC-V: perf: Restructure the SBI PMU code
To: Will Deacon <will@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
 <20250327-counter_delegation-v5-11-1ee538468d1b@rivosinc.com>
 <20250404134937.GA29394@willie-the-truck>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250404134937.GA29394@willie-the-truck>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_170307_223910_895C7C54 
X-CRM114-Status: GOOD (  14.10  )
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

T24gNC80LzI1IDY6NDkgQU0sIFdpbGwgRGVhY29uIHdyb3RlOgo+IE9uIFRodSwgTWFyIDI3LCAy
MDI1IGF0IDEyOjM1OjUyUE0gLTA3MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+PiBXaXRoIFNzY2Nm
Zy9TbWNkZWxlZywgd2Ugbm8gbG9uZ2VyIG5lZWQgU0JJIFBNVSBleHRlbnNpb24gdG8gcHJvZ3Jh
bS8KPj4gYWNjZXNzIGhwbWNvdW50ZXIvZXZlbnRzLiBIb3dldmVyLCB3ZSBkbyBuZWVkIGl0IGZv
ciBmaXJtd2FyZSBjb3VudGVycy4KPj4gUmVuYW1lIHRoZSBkcml2ZXIgYW5kIGl0cyByZWxhdGVk
IGNvZGUgdG8gcmVwcmVzZW50IGdlbmVyaWMgbmFtZQo+PiB0aGF0IHdpbGwgaGFuZGxlIGJvdGgg
c2JpIGFuZCBJU0EgbWVjaGFuaXNtIGZvciBocG1jb3VudGVyIHJlbGF0ZWQKPj4gb3BlcmF0aW9u
cy4gVGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIHVwZGF0ZSB0aGUgS2NvbmZpZyBuYW1lcyB0bwo+
PiBtYXRjaCB0aGUgbmV3IGRyaXZlciBuYW1lIGNsb3NlbHkuCj4+Cj4+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+Pgo+PiBSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4KPj4gLS0tCj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQo+PiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfcG11LmggICAgICAgICAgICAgfCAgIDQgKy0KPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV92Y3B1X3NiaS5oICAgICAgICAgICAgIHwgICAyICstCj4+ICAgYXJjaC9yaXNjdi9r
dm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+PiAgIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPj4g
ICBkcml2ZXJzL3BlcmYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2
ICstCj4+ICAgZHJpdmVycy9wZXJmL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgNCArLQo+PiAgIGRyaXZlcnMvcGVyZi97cmlzY3ZfcG11LmMgPT4gcmlzY3ZfcG11X2Nv
bW1vbi5jfSAgfCAgIDAKPj4gICBkcml2ZXJzL3BlcmYve3Jpc2N2X3BtdV9zYmkuYyA9PiByaXNj
dl9wbXVfZGV2LmN9IHwgMjE0ICsrKysrKysrKysrKystLS0tLS0tLS0KPiAKPiBJJ20gc3RpbGwg
YWdhaW5zdCB0aGlzIHJlbmFtaW5nIGNodXJuLiBJdCBzdWNrcyBmb3IgYmFja3BvcnRpbmcgYW5k
Cj4geW91J3JlIGFsc28gY2hhbmdpbmcgdGhlIG5hbWUgb2YgdGhlIGRyaXZlciwgd2hpY2ggY291
bGQgYmUgdXNlZCBieQo+IHNjcmlwdHMgaW4gdXNlcnNwYWNlIChlLmcuIG1vZHVsZSBsaXN0aW5n
cywgdWRldiBydWxlcywgY21kbGluZSBvcHRpb25zKQo+IAoKCk9rLiBJIHdpbGwgcmV2ZXJ0IHRo
ZSBmaWxlIGFuZCBkcml2ZXIgbmFtZSBjaGFuZ2UuIEkgaG9wZSBjb25maWcgCnJlbmFtaW5nIGFu
ZCBjb2RlIHJlZmFjdG9yaW5nIHRvIHNlcGFyYXRlIGNvdW50ZXIgZGVsZWdhdGlvbiAoaHcgbWV0
aG9kKSAKdnMgU0JJIGNhbGxzIChmaXJtd2FyZSBhc3Npc3RlZCBtZXRob2QpIGFyZSBva2F5ID8K
Cgo+IFdpbGwKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
