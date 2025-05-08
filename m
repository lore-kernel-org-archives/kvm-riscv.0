Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240CEC3ABC9
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 22:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=revQRViI7YOdhh+/ggwzf12oc1/IlkwTt/aZooQZJEg=; b=HddCeykAsCkNQy
	MWkQw1g4TkQ/Ff+03eYVTpI4OuMEAewsYLnHwJrwcIiaYpIIwhH9iPR3amg5TEcf2gMOhhKvN3XyD
	uI1oGqL3tbTQXdQPFagoQKpdTTYF/tDNrallXvI8H96dVBZSJ3RwNWNK3qxLE/uDMcZbR0ON1x19B
	5y4SjyxsCAMvjz6DyfvmLu3LE5jpv5IXjvzskxd4Kr/0oOcPZ8Cpc3lnBJvGGMOSBPzr9y1rMrBsK
	6MyeX4dS/5vwsbvL91IxTzFabrBpU1Zlsi3kMD+Q+9q9b8ACbPp0XDCzaksLgorhA2bJsRFOz0RXc
	TGhJiJE3Cu8aVMlypjWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDA6n-00000001vqk-1ngd;
	Thu, 08 May 2025 22:52:53 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDA6k-00000001voR-2Iva
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 22:52:51 +0000
Message-ID: <4618bd56-c085-4147-b119-d2f57e17ebec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746744767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVUIn3q1JFdYUFjgqyctbUvKd01vJdtvdQeZ0/vC43Y=;
	b=PJk/lmKo7NOwOpC15l9ImrjsFfO7HEDN1mA+5rMBeabobpM5fmIg5J0V4mkYKA+VwOgGuk
	GFieYhcuyrpBC006QXIQvijs5b/Tf8Hrn+iXDe1KsqEN9CYJSfd6eMkyRNIMerVGpNM+4B
	xtxbc8nMk2tJ09P5HyXhXM1iLuesBdU=
Date: Thu, 8 May 2025 15:52:25 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 04/14] riscv: sbi: add FWFT extension interface
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
 <20250424173204.1948385-5-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-5-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_155250_727124_0AC0BE1E 
X-CRM114-Status: GOOD (  18.46  )
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBUaGlzIFNC
SSBleHRlbnNpb25zIGVuYWJsZXMgc3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVhdHVyZSB0
aGF0IGFyZQo+IHVuZGVyIE0tbW9kZSBjb250cm9sIChGb3IgaW5zdGFuY2UsIFN2YWR1IG1lbnZj
ZmcgQURVRSBiaXQsIFNzZGJsdHJwCj4gRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRvIHNl
dCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKPiBtYXNrIGFzIHdlbGwgYXMgZm9y
IHRoZSBvbmxpbmUgY3B1IG1hc2suCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aCB8IDE3ICsrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyAgICAgIHwgNTcg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDc0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBpbmRleCA3ZWMyNDlmZWE4
ODAuLjNiYmVmNTZiY2VmYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+IEBAIC01MDMsNiArNTAz
LDIzIEBAIGludCBzYmlfcmVtb3RlX2hmZW5jZV92dm1hX2FzaWQoY29uc3Qgc3RydWN0IGNwdW1h
c2sgKmNwdV9tYXNrLAo+ICAgCQkJCXVuc2lnbmVkIGxvbmcgYXNpZCk7Cj4gICBsb25nIHNiaV9w
cm9iZV9leHRlbnNpb24oaW50IGV4dCk7Cj4gICAKPiAraW50IHNiaV9md2Z0X3NldCh1MzIgZmVh
dHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gK2ludCBz
YmlfZndmdF9zZXRfY3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAo+
ICsJCQkgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4gKy8qKgo+
ICsgKiBzYmlfZndmdF9zZXRfb25saW5lX2NwdXMoKSAtIFNldCBhIGZlYXR1cmUgb24gYWxsIG9u
bGluZSBjcHVzCj4gKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSB0byBiZSBzZXQKPiArICogQHZh
bHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKPiArICogQGZsYWdzOiBGV0ZUIGZlYXR1
cmUgc2V0IGZsYWdzCj4gKyAqCj4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0
ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KPiArICovCj4gK3N0YXRpYyBpbmxpbmUgaW50
IHNiaV9md2Z0X3NldF9vbmxpbmVfY3B1cyh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1
ZSwKPiArCQkJCQkgICB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICt7Cj4gKwlyZXR1cm4gc2JpX2Z3
ZnRfc2V0X2NwdW1hc2soY3B1X29ubGluZV9tYXNrLCBmZWF0dXJlLCB2YWx1ZSwgZmxhZ3MpOwo+
ICt9Cj4gKwo+ICAgLyogQ2hlY2sgaWYgY3VycmVudCBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9u
IGlzIDAuMSBvciBub3QgKi8KPiAgIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9zcGVjX2lzXzBfMSh2
b2lkKQo+ICAgewo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NiaS5jCj4gaW5kZXggMWQ0NGMzNTMwNWE5Li5kNTdlNGRhZTdkYWMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9zYmkuYwo+IEBAIC0yOTksNiArMjk5LDYzIEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNl
X3YwMihpbnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4gICAJcmV0dXJu
IDA7Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIHNiaV9md2Z0X3NldCgpIC0gU2V0IGEgZmVhdHVy
ZSBvbiB0aGUgbG9jYWwgaGFydAo+ICsgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgSUQgdG8gYmUg
c2V0Cj4gKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0Cj4gKyAqIEBmbGFn
czogRldGVCBmZWF0dXJlIHNldCBmbGFncwo+ICsgKgo+ICsgKiBSZXR1cm46IDAgb24gc3VjY2Vz
cywgYXBwcm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCj4gKyAqLwo+ICtpbnQg
c2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBs
b25nIGZsYWdzKQo+ICt7Cj4gKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gK30KPiArCj4gK3N0cnVj
dCBmd2Z0X3NldF9yZXEgewo+ICsJdTMyIGZlYXR1cmU7Cj4gKwl1bnNpZ25lZCBsb25nIHZhbHVl
Owo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCWF0b21pY190IGVycm9yOwo+ICt9Owo+ICsK
PiArc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0X3NldCh2b2lkICphcmcpCj4gK3sKPiArCXN0cnVj
dCBmd2Z0X3NldF9yZXEgKnJlcSA9IGFyZzsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gc2Jp
X2Z3ZnRfc2V0KHJlcS0+ZmVhdHVyZSwgcmVxLT52YWx1ZSwgcmVxLT5mbGFncyk7Cj4gKwlpZiAo
cmV0KQo+ICsJCWF0b21pY19zZXQoJnJlcS0+ZXJyb3IsIHJldCk7Cj4gK30KPiArCj4gKy8qKgo+
ICsgKiBzYmlfZndmdF9zZXRfY3B1bWFzaygpIC0gU2V0IGEgZmVhdHVyZSBmb3IgdGhlIHNwZWNp
ZmllZCBjcHVtYXNrCj4gKyAqIEBtYXNrOiBDUFUgbWFzayBvZiBjcHVzIHRoYXQgbmVlZCB0aGUg
ZmVhdHVyZSB0byBiZSBzZXQKPiArICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNl
dAo+ICsgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAo+ICsgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKPiArICoKPiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3Ms
IGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgo+ICsgKi8KPiAraW50IHNi
aV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCj4g
KwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICt7
Cj4gKwlzdHJ1Y3QgZndmdF9zZXRfcmVxIHJlcSA9IHsKPiArCQkuZmVhdHVyZSA9IGZlYXR1cmUs
Cj4gKwkJLnZhbHVlID0gdmFsdWUsCj4gKwkJLmZsYWdzID0gZmxhZ3MsCj4gKwkJLmVycm9yID0g
QVRPTUlDX0lOSVQoMCksCj4gKwl9Owo+ICsKPiArCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xP
QkFMX0ZFQVRVUkVfQklUKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCW9uX2VhY2hfY3B1
X21hc2sobWFzaywgY3B1X3NiaV9md2Z0X3NldCwgJnJlcSwgMSk7Cj4gKwo+ICsJcmV0dXJuIGF0
b21pY19yZWFkKCZyZXEuZXJyb3IpOwo+ICt9Cj4gKwo+ICAgLyoqCj4gICAgKiBzYmlfc2V0X3Rp
bWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KPiAgICAqIEBz
dGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hvdWxk
IGZpcmUuCgpMR1RNLgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5j
b20+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
