Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE910C3ABCB
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 May 2025 18:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AgNVUCunSRN1htjqRtyWJtKPgRDjo94rK6p+iPKsOyM=; b=B86jIoxAEcyD0P
	R6EXQCc0gzC5c3+Zrp0JHHWj9i2bUCF3/9P437V2mALzeaY9733vbyc2iQBGGtSZW9lBa3OPuGLN5
	kFXQE/5+uRCBp3yb/CEsGsP/K0wcNrwFX4/bGegULx0gpDUTvEF4BXpn8N8is8440SYq4Dq+gy4Pb
	Q/UPnFhv4/GxG28lRQ2UdY5b67LvKyL999sV7bngKo0CgDVRaowZ4CtWem9Sn+6yCZM7ougKj+DcZ
	29Tj+DEqIbO1CnHMh2P+Xt9b6zGQoJZPACkGhnHpomGYnHwH1Wy74RvdpczZEeccSonz4jYgPkoLh
	Q+GFKT3k6kmd1/HE4Ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXdw-0000000AJh4-1utg;
	Mon, 12 May 2025 18:12:48 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXS4-0000000AGuU-0V3H
	for kvm-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:00:34 +0000
Message-ID: <f27b0506-4841-4650-a0ee-0fe1643fdf37@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747072827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ma5n1WWRt3IZMb/J5uvgHDAZKLn3T38CaI/Jo/Q76W4=;
	b=hGlf2DxK/ll+4zVXxruxyenHniDCnXz8vzRbFapb8hUS/itdZEy/TPz0teFHV4TatUnnP5
	BZv20ibsOKJy8hV5P8G/DZG5leGxmgDJH5uq+u9fW1PbSJFjurDRqz8BLE1IErge+GiHcI
	Rumre5V3Jb6JPbLB6RELqbbucJ4f7ug=
Date: Mon, 12 May 2025 11:00:21 -0700
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
 <1c385a47-0a01-4be4-a34b-51a2f168e62d@linux.dev>
 <fe9d801b-007d-476d-97fe-96d0f3d218cd@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <fe9d801b-007d-476d-97fe-96d0f3d218cd@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_110032_709201_0D3385BA 
X-CRM114-Status: GOOD (  14.57  )
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

Ck9uIDUvMTIvMjUgMToxNCBBTSwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Cj4gT24gMDkvMDUv
MjAyNSAwMjoxOCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+IE9uIDQvMjQvMjUgMTA6MzEgQU0sIENs
w4PCqW1lbnQgTMODwqlnZXIgd3JvdGU6Cj4+PiBUaGlzIFNCSSBleHRlbnNpb25zIGVuYWJsZXMg
c3VwZXJ2aXNvciBtb2RlIHRvIGNvbnRyb2wgZmVhdHVyZSB0aGF0IGFyZQo+Pj4gdW5kZXIgTS1t
b2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUgbWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0
cnAKPj4+IERURSwgZXRjKS4gQWRkIGFuIGludGVyZmFjZSB0byBzZXQgbG9jYWwgZmVhdHVyZXMg
Zm9yIGEgc3BlY2lmaWMgY3B1Cj4+PiBtYXNrIGFzIHdlbGwgYXMgZm9yIHRoZSBvbmxpbmUgY3B1
IG1hc2suCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4+PiAtLS0KPj4+ICDCoCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwg
MTcgKysrKysrKysrKysKPj4+ICDCoCBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuY8KgwqDCoMKgwqAg
fCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+ICDCoCAyIGZpbGVz
IGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4+IGlu
ZGV4IDdlYzI0OWZlYTg4MC4uM2JiZWY1NmJjZWZjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaAo+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aAo+Pj4gQEAgLTUwMyw2ICs1MDMsMjMgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNlX3Z2bWFfYXNp
ZChjb25zdCBzdHJ1Y3QKPj4+IGNwdW1hc2sgKmNwdV9tYXNrLAo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhc2lkKTsKPj4+ICDCoCBsb25nIHNi
aV9wcm9iZV9leHRlbnNpb24oaW50IGV4dCk7Cj4+PiAgwqAgK2ludCBzYmlfZndmdF9zZXQodTMy
IGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcKPj4+IGZsYWdzKTsK
Pj4+ICtpbnQgc2JpX2Z3ZnRfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrLCB1MzIg
ZmVhdHVyZSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyB2YWx1
ZSwgdW5zaWduZWQgbG9uZyBmbGFncyk7Cj4+PiArLyoqCj4+PiArICogc2JpX2Z3ZnRfc2V0X29u
bGluZV9jcHVzKCkgLSBTZXQgYSBmZWF0dXJlIG9uIGFsbCBvbmxpbmUgY3B1cwo+Pj4gKyAqIEBm
ZWF0dXJlOiBUaGUgZmVhdHVyZSB0byBiZSBzZXQKPj4+ICsgKiBAdmFsdWU6IFRoZSBmZWF0dXJl
IHZhbHVlIHRvIGJlIHNldAo+Pj4gKyAqIEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncwo+
Pj4gKyAqCj4+PiArICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVy
cm9yIGNvZGUgb3RoZXJ3aXNlLgo+Pj4gKyAqLwo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IHNiaV9m
d2Z0X3NldF9vbmxpbmVfY3B1cyh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZwo+Pj4gdmFsdWUs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBmbGFncykKPj4+ICt7Cj4+PiArwqDCoMKgIHJldHVybiBzYmlfZndmdF9zZXRfY3B1
bWFzayhjcHVfb25saW5lX21hc2ssIGZlYXR1cmUsIHZhbHVlLCBmbGFncyk7Cj4+PiArfQo+Pj4g
Kwo+Pj4gIMKgIC8qIENoZWNrIGlmIGN1cnJlbnQgU0JJIHNwZWNpZmljYXRpb24gdmVyc2lvbiBp
cyAwLjEgb3Igbm90ICovCj4+PiAgwqAgc3RhdGljIGlubGluZSBpbnQgc2JpX3NwZWNfaXNfMF8x
KHZvaWQpCj4+PiAgwqAgewo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4+IGluZGV4IDFkNDRjMzUzMDVhOS4uZDU3ZTRk
YWU3ZGFjIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+PiBAQCAtMjk5LDYgKzI5OSw2MyBAQCBzdGF0aWMg
aW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0Cj4+PiBjcHVtYXNrICpj
cHVfbWFzaywKPj4+ICDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gIMKgIH0KPj4+ICDCoCArLyoq
Cj4+PiArICogc2JpX2Z3ZnRfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIG9uIHRoZSBsb2NhbCBoYXJ0
Cj4+PiArICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElEIHRvIGJlIHNldAo+Pj4gKyAqIEB2YWx1
ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0Cj4+PiArICogQGZsYWdzOiBGV0ZUIGZlYXR1
cmUgc2V0IGZsYWdzCj4+PiArICoKPj4+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBwcm9w
cmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCj4+PiArICovCj4+PiAraW50IHNiaV9m
d2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBm
bGFncykKPj4+ICt7Cj4+PiArwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+ICt9Cj4+PiAr
Cj4+PiArc3RydWN0IGZ3ZnRfc2V0X3JlcSB7Cj4+PiArwqDCoMKgIHUzMiBmZWF0dXJlOwo+Pj4g
K8KgwqDCoCB1bnNpZ25lZCBsb25nIHZhbHVlOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGZs
YWdzOwo+Pj4gK8KgwqDCoCBhdG9taWNfdCBlcnJvcjsKPj4+ICt9Owo+Pj4gKwo+Pj4gK3N0YXRp
YyB2b2lkIGNwdV9zYmlfZndmdF9zZXQodm9pZCAqYXJnKQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3Ry
dWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOwo+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4gKwo+
Pj4gK8KgwqDCoCByZXQgPSBzYmlfZndmdF9zZXQocmVxLT5mZWF0dXJlLCByZXEtPnZhbHVlLCBy
ZXEtPmZsYWdzKTsKPj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+ICvCoMKgwqDCoMKgwqDCoCBhdG9t
aWNfc2V0KCZyZXEtPmVycm9yLCByZXQpOwo+PiBXaGF0IGhhcHBlbnMgd2hlbiBjcHVYIGV4ZWN1
dGVkIGZpcnN0IHJlcG9ydGVkIGFuIGVycm9yIGJ1dCBjcHVZCj4+IGV4ZWN1dGVkIHRoaXMgZnVu
Y3Rpb24gbGF0ZXIgYW5kIHJlcG9ydCBzdWNjZXNzLgo+Pgo+PiBUaGUgZXJyb3Igd2lsbCBiZSBt
YXNrZWQgaW4gdGhhdCBjYXNlLgo+IFdlIGFjdHVhbGx5IG9ubHkgc2V0IHRoZSBiaXQgaWYgYW4g
ZXJyb3IgaGFwcGVuZWQgKGNvbnNpZGVyIGl0IGFzIGEKPiBzdGlja3kgZXJyb3IgYml0KS4gU28g
aWYgQ1BVeSByZXBvcnRzIHN1Y2Nlc3MsIGl0IHdvbid0IGNsZWFyIHRoZSBiaXQuCgpBaGggeWVz
LiBJIG1pc3NlZCB0aGF0LgoKPiBUaGFua3MsCj4KPiBDbMOpbWVudAo+Cj4+PiArfQo+Pj4gKwo+
Pj4gKy8qKgo+Pj4gKyAqIHNiaV9md2Z0X3NldF9jcHVtYXNrKCkgLSBTZXQgYSBmZWF0dXJlIGZv
ciB0aGUgc3BlY2lmaWVkIGNwdW1hc2sKPj4+ICsgKiBAbWFzazogQ1BVIG1hc2sgb2YgY3B1cyB0
aGF0IG5lZWQgdGhlIGZlYXR1cmUgdG8gYmUgc2V0Cj4+PiArICogQGZlYXR1cmU6IFRoZSBmZWF0
dXJlIElEIHRvIGJlIHNldAo+Pj4gKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUg
c2V0Cj4+PiArICogQGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCj4+PiArICoKPj4+ICsg
KiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBwcm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhl
cndpc2UuCj4+PiArICovCj4+PiAraW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4+PiAr
ewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZndmdF9zZXRfcmVxIHJlcSA9IHsKPj4+ICvCoMKgwqDCoMKg
wqDCoCAuZmVhdHVyZSA9IGZlYXR1cmUsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnZhbHVlID0gdmFs
dWUsCj4+PiArwqDCoMKgwqDCoMKgwqAgLmZsYWdzID0gZmxhZ3MsCj4+PiArwqDCoMKgwqDCoMKg
wqAgLmVycm9yID0gQVRPTUlDX0lOSVQoMCksCj4+PiArwqDCoMKgIH07Cj4+PiArCj4+PiArwqDC
oMKgIGlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRVUkVfQklUKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4gKwo+Pj4gK8KgwqDCoCBvbl9lYWNoX2NwdV9t
YXNrKG1hc2ssIGNwdV9zYmlfZndmdF9zZXQsICZyZXEsIDEpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBy
ZXR1cm4gYXRvbWljX3JlYWQoJnJlcS5lcnJvcik7Cj4+PiArfQo+Pj4gKwo+Pj4gIMKgIC8qKgo+
Pj4gIMKgwqAgKiBzYmlfc2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0
aW1lciBldmVudC4KPj4+ICDCoMKgICogQHN0aW1lX3ZhbHVlOiBUaGUgdmFsdWUgYWZ0ZXIgd2hp
Y2ggbmV4dCB0aW1lciBldmVudCBzaG91bGQgZmlyZS4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
