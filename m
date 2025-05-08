Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490EAC3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvnJWJbWsI3fZ58ypHpx4SU6z1dwL9zdd/CElpMtLmU=; b=GF48SJlr/chYSC
	mqiPPtGw0VaaubHS8PF39DomTGcrmbvr6EZfeV+I8x+3lpmdnHnr95QcQgNaqFI4P/T4nD2LMGWYp
	etXQW/eOFJVoYCAQKfbsWUJ/V9cl9lh703f4H0v2o3LHe+haTVW4tJxCnT077wbRdwuGBG5t5Asi3
	gq/FU7Kk18O0U6PquZYItMNGYBBo4ETI5kbYUfFGk6jqpgXStIDq9StAxkSQb/RQW6+Lhvzw44fud
	ub1IVPXFg5wnKK2Vd8fRZAkMFY3CrieTSwYrpC9RYNZ3lyz0614WRBq8rI5Xf4MopyqVORo0Rj0xT
	Mxj0BI6GXdJNxiok3I9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAF6-00000001wdt-4BaI;
	Thu, 08 May 2025 23:01:29 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDAF4-00000001wd8-0xU5
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 23:01:27 +0000
Message-ID: <4032b00c-1194-45b1-b1e5-4e9237ed7948@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746745283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0podyQbI7EjhnM5+iaMAYRW3Emc7fSDLhAlACBiE+s0=;
	b=qK6Zu79QrmwiVhmb0SUwlF/AmfkzMu19qf+dkBevTT2rvx0rNBA3gTno6MqT2qWTf4fMVs
	gxD/PLt/EvSGIoMy129aGZ3w/Mkk5JRRS22r4+ABA1HHZbWa7Qf9RDrbOXY3uZqUb00KyB
	qWyz0v9qW0KNNtOBJ9/V3dY4gkoObkE=
Date: Thu, 8 May 2025 16:01:12 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 05/14] riscv: sbi: add SBI FWFT extension calls
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-6-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-6-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_160126_404845_6EE0DFD3 
X-CRM114-Status: GOOD (  18.33  )
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBBZGQgRldG
VCBleHRlbnNpb24gY2FsbHMuIFRoaXMgd2lsbCBiZSByYXRpZmllZCBpbiBTQkkgVjMuMCBoZW5j
ZSwgaXQgaXMKPiBwcm92aWRlZCBhcyBhIHNlcGFyYXRlIGNvbW1pdCB0aGF0IGNhbiBiZSBsZWZ0
IG91dCBpZiBuZWVkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgfCAyMCArKysr
KysrKysrKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGluZGV4IGQ1N2U0ZGFlN2RhYy4uMDcwMDE0ZmYzNWQ0
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKPiBAQCAtMjk5LDYgKzI5OSw4IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZl
bmNlX3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4gICAJcmV0
dXJuIDA7Cj4gICB9Cj4gICAKPiArc3RhdGljIGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOwo+ICsK
CnN1cGVyIG5pdDogQ2FuIGRlY2xhcmUgdGhpcyBhbG9uZyB3aXRoIHN0cnVjdCBmd2Z0X3NldF9y
ZXEgc28gdGhhdCB0aGV5IAphcmUgdG9nZXRoZXIgPyBZb3UgY2FuIG1vdmUgdGhlIHNiaV9md2Z0
X3NldCB0byBiZWxvdyB0aGUgc3RydWN0IApmd2Z0X3NldF9yZXEuCgo+ICAgLyoqCj4gICAgKiBz
YmlfZndmdF9zZXQoKSAtIFNldCBhIGZlYXR1cmUgb24gdGhlIGxvY2FsIGhhcnQKPiAgICAqIEBm
ZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBiZSBzZXQKPiBAQCAtMzA5LDcgKzMxMSwxNSBAQCBz
dGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sg
KmNwdV9tYXNrLAo+ICAgICovCj4gICBpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNp
Z25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICAgewo+IC0JcmV0dXJuIC1F
T1BOT1RTVVBQOwo+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4gKwo+ICsJaWYgKCFzYmlfZndmdF9z
dXBwb3J0ZWQpCj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsKPiArCXJldCA9IHNiaV9lY2Fs
bChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9TRVQsCj4gKwkJCWZlYXR1cmUsIHZhbHVlLCBm
bGFncywgMCwgMCwgMCk7Cj4gKwo+ICsJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJl
dC5lcnJvcik7Cj4gICB9Cj4gICAKPiAgIHN0cnVjdCBmd2Z0X3NldF9yZXEgewo+IEBAIC0zNDgs
NiArMzU4LDkgQEAgaW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFz
aywgdTMyIGZlYXR1cmUsCj4gICAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAo+ICAgCX07Cj4g
ICAKPiArCWlmICghc2JpX2Z3ZnRfc3VwcG9ydGVkKQo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsK
PiArCj4gICAJaWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCj4gICAJ
CXJldHVybiAtRUlOVkFMOwo+ICAgCj4gQEAgLTY3OSw2ICs2OTIsMTEgQEAgdm9pZCBfX2luaXQg
c2JpX2luaXQodm9pZCkKPiAgIAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3Rl
ZFxuIik7Cj4gICAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwo+ICAgCQl9
Cj4gKwkJaWYgKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMywgMCkgJiYKPiAr
CQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpKSB7Cj4gKwkJCXByX2luZm8o
IlNCSSBGV0ZUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gKwkJCXNiaV9md2Z0X3N1cHBvcnRl
ZCA9IHRydWU7Cj4gKwkJfQo+ICAgCX0gZWxzZSB7Cj4gICAJCV9fc2JpX3NldF90aW1lciA9IF9f
c2JpX3NldF90aW1lcl92MDE7Cj4gICAJCV9fc2JpX3NlbmRfaXBpCT0gX19zYmlfc2VuZF9pcGlf
djAxOwoKT3RoZXJ3aXNlLCBMR1RNLgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9rdm0tcmlzY3YK
