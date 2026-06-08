Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2BCD6E79
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4E9yH9Qzurt3i8M65YGdp4JESMhs0NYreIvfGd7eM4=; b=Ccws8idVblNiAg
	lwzTR91Br5OnjjJF0dAIMgp2/WagIhsIIl5bSCHVkcKQbLPMVjp7z7a6NWj7QZY0nh9vC1AXY6Sle
	urXZ2+KBUoJmxuAM4+ba19HMtVxs+uFT8rUxMRvg4HM6yK3j15tegpGkDBFzUe/UGUxIbif2GH3c9
	ElTr/vYPE4sy6wiWsT4L5vo5IHElCo/d5dpuWrhmhQ3Lzot4UYU++j+VAYgpZnNS9NWSz56+rASzE
	yOKb2/aU9LfU7YcXRPbhx6NS9CbP1FSgZMjnbdqBZXzkRpotulSio2D203WIEMmBX3S2WWQ10qKvT
	iX16D4n40LrTCDUQHjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWd96-000000046Sf-3qKe;
	Mon, 08 Jun 2026 16:48:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWd93-000000046Rz-3R9s
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 16:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780937291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HO1z1hECglS3oHNycHe52C8L+SIuRFyFX5+d24s3Qxo=;
	b=Pkvn9Av8ODbUpDp4UhKrhlhaVOKqGbF8/0TgF7oatjAFx8JCILE53Q0iZPq5V/fRCfda2C
	ILnfvfP6cGPP8bKxDj2MiNPlUzfZbTo1YFl9g6Zp2JLugHeV8qJq30YhEmDbPAIQzaWTEn
	H+0xrnL+99YRJTISntY7jz7sMqGiOy8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-jTkQIDEiMJ6cjZxqb-ZLkw-1; Mon,
 08 Jun 2026 12:48:07 -0400
X-MC-Unique: jTkQIDEiMJ6cjZxqb-ZLkw-1
X-Mimecast-MFC-AGG-ID: jTkQIDEiMJ6cjZxqb-ZLkw_1780937285
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DA901800605;
	Mon,  8 Jun 2026 16:48:04 +0000 (UTC)
Received: from [10.44.48.99] (unknown [10.44.48.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A13881800664;
	Mon,  8 Jun 2026 16:47:56 +0000 (UTC)
Message-ID: <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
Date: Mon, 8 Jun 2026 18:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, Melody Wang <huibo.wang@amd.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260608144252.351443-36-joro@8bytes.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: LCegzdu6YjcUIocGTCtB5r-3E_q-39r5FoswWUxk42s_1780937285
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_094813_931509_3398B612 
X-CRM114-Status: GOOD (  21.68  )
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

T24gNi84LzI2IDE2OjQyLCBKw7ZyZyBSw7ZkZWwgd3JvdGU6Cj4gRnJvbTogSm9lcmcgUm9lZGVs
IDxqb2VyZy5yb2VkZWxAYW1kLmNvbT4KPiAKPiBUaGUgYWxnb3JpdGhtIGlzIHRvIGFsd2F5cyBy
dW4gdGhlIGxvd2VzdCBydW5uYWJsZSBwbGFuZS4gUGxhbmUKPiBzd2l0Y2hlcyBhcmUgZG9uZSBi
eSBzdG9wcGluZyB0aGUgY3VycmVudCBwbGFuZSBhbmQgc2V0dGluZyBhbm90aGVyCj4gcnVubmFi
bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9lcmcgUm9lZGVsIDxqb2VyZy5yb2VkZWxAYW1kLmNv
bT4KClRoaXMgd2FzIGxlZnQgYXJiaXRyYXJ5IGluIG15IHZlcnNpb24gYmVjYXVzZSBmb3IgZXhh
bXBsZSBIeXBlci1WIFZUTHMgCnVzZSBoaWdoZXN0LXJ1bm5hYmxlIGluc3RlYWQuICBJdCBhbHNv
IG1hZGUgcHVyZSB1c2Vyc3BhY2Ugc2NoZWR1bGluZyAKcG9zc2libGUsIHRob3VnaCB0aGF0IG1h
eSBub3QgYmUgdmVyeSBpbXBvcnRhbnQgaW4gdGhlIGdyYW5kIHNjaGVtZSBvZiAKdGhpbmdzLgoK
RGlkIHlvdSBkcm9wIGl0IGJlY2F1c2UgaXQgZGlkbid0IHdvcmssIG9yIGp1c3QgZm9yIHNpbXBs
aWNpdHk/CgpQYW9sbwoKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgva3ZtX2hvc3QuaCB8IDE2ICsr
KysrKysrKysrKysrCj4gICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgfCA0NSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDYxIGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIv
aW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gaW5kZXggNWMzZjlkZmExNWVhLi5lMzYxMWU2Y2Mz
ZTQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oCj4gQEAgLTE2OCw2ICsxNjgsNyBAQCBzdGF0aWMgaW5saW5lIGJv
b2wga3ZtX2lzX2Vycm9yX2dwYShncGFfdCBncGEpCj4gICAjZGVmaW5lIEtWTV9SRVFfVk1fREVB
RAkJCSgxIHwgS1ZNX1JFUVVFU1RfV0FJVCB8IEtWTV9SRVFVRVNUX05PX1dBS0VVUCkKPiAgICNk
ZWZpbmUgS1ZNX1JFUV9VTkJMT0NLCQkJMgo+ICAgI2RlZmluZSBLVk1fUkVRX0RJUlRZX1JJTkdf
U09GVF9GVUxMCTMKPiArI2RlZmluZSBLVk1fUkVRX1BMQU5FX1JFU0NIRUQJCTQKPiAgICNkZWZp
bmUgS1ZNX1JFUVVFU1RfQVJDSF9CQVNFCQk4Cj4gICAKPiAgIC8qCj4gQEAgLTMyNCw2ICszMjUs
OCBAQCBzdHJ1Y3Qga3ZtX21taW9fZnJhZ21lbnQgewo+ICAgCXVuc2lnbmVkIGludCBsZW47Cj4g
ICB9Owo+ICAgCj4gKwo+ICsKPiAgIHN0cnVjdCBrdm1fdmNwdV9jb21tb24gewo+ICAgCXN0cnVj
dCBrdm0gKmt2bTsKPiAgIAo+IEBAIC0zODEsNiArMzg0LDggQEAgc3RydWN0IGt2bV92Y3B1X2Nv
bW1vbiB7Cj4gICAKPiAgIAlzdHJ1Y3Qga3ZtX2RpcnR5X3JpbmcgZGlydHlfcmluZzsKPiAgIAo+
ICsJYm9vbCBwbGFuZV9zd2l0Y2g7Cj4gKwo+ICAgCXN0cnVjdCBrdm1fdmNwdV9hcmNoX2NvbW1v
biBhcmNoOwo+ICAgfTsKPiAgIAo+IEBAIC0zODgsNiArMzkzLDEyIEBAIHN0cnVjdCBrdm1fdmNw
dV9jb21tb24gewo+ICAgCWZvciAoKGkpID0gMDsgKGkpIDwgS1ZNX01BWF9QTEFORVM7ICsrKGkp
KQkJXAo+ICAgCQlpZiAoKCh2KSA9IGNvbW1vbi0+dmNwdXNbKGkpXSkgIT0gTlVMTCkKPiAgIAo+
ICsvKiBUcmFja2VkIHBlciBwbGFuZS1WQ1BVIC0gdXNlZCBmb3IgZGVjaWRpbmcgd2hpY2ggcGxh
bmUtdmNwdSB0byBydW4gKi8KPiArZW51bSBrdm1fdmNwdV9zdGF0ZSB7Cj4gKwlTVE9QUEVELAo+
ICsJUlVOTkFCTEUsCj4gK307Cj4gKwo+ICAgc3RydWN0IGt2bV92Y3B1IHsKPiAgIAlzdHJ1Y3Qg
a3ZtICprdm07Cj4gICAJc3RydWN0IGt2bV9wbGFuZSAqcGxhbmU7Cj4gQEAgLTQwMSw2ICs0MTIs
NyBAQCBzdHJ1Y3Qga3ZtX3ZjcHUgewo+ICAgCXN0cnVjdCBrdm1fcnVuICpydW47Cj4gICAKPiAg
IAl1NjQgcGxhbmVfcmVxdWVzdHM7Cj4gKwllbnVtIGt2bV92Y3B1X3N0YXRlIHBsYW5lX3N0YXRl
Owo+ICAgCj4gICAJLyogUzM5MCBvbmx5ICovCj4gICAJYm9vbCB2YWxpZF93YWtldXA7Cj4gQEAg
LTQ0MCw2ICs0NTIsMTAgQEAgc3RydWN0IGt2bV92Y3B1IHsKPiAgIAl1bnNpZ25lZCBwbGFuZV9s
ZXZlbDsKPiAgIH07Cj4gICAKPiArdm9pZCBrdm1fdmNwdV9zZXRfcGxhbmVfcnVubmFibGUoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiArdm9pZCBrdm1fdmNwdV9zZXRfcGxhbmVfc3RvcHBlZChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICtzdHJ1Y3Qga3ZtX3ZjcHUgKmt2bV92Y3B1X3NlbGVj
dF9wbGFuZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsKPiAgIHN0YXRpYyBpbmxpbmUgYm9v
bCBrdm1fdmNwdV93YW50c190b19ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgewo+ICAg
CXJldHVybiB2Y3B1LT5jb21tb24tPndhbnRzX3RvX3J1bjsKPiBkaWZmIC0tZ2l0IGEvdmlydC9r
dm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKPiBpbmRleCA5ZDMwZmQ4NWNlNWYu
LmEzMDEyM2I3NzExMiAxMDA2NDQKPiAtLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCj4gKysrIGIv
dmlydC9rdm0va3ZtX21haW4uYwo+IEBAIC00Mzk3LDYgKzQzOTcsNyBAQCBzdGF0aWMgaW50IGt2
bV9wbGFuZV9pb2N0bF9jcmVhdGVfdmNwdShzdHJ1Y3Qga3ZtX3BsYW5lICpwbGFuZSwgdW5zaWdu
ZWQgbG9uZyBpZAo+ICAgCXZjcHUtPnZjcHVfaWR4ID0gdmNwdS0+Y29tbW9uLT52Y3B1X2lkeDsK
PiAgIAl2Y3B1LT5wbGFuZSA9IHBsYW5lOwo+ICAgCXZjcHUtPnBsYW5lX2xldmVsID0gcGxhbmUt
PmxldmVsOwo+ICsJdmNwdS0+cGxhbmVfc3RhdGUgPSBTVE9QUEVEOwo+ICAgCXZjcHUtPnJ1biA9
IHZjcHUtPmNvbW1vbi0+cnVuOwo+ICAgCj4gICAJa3ZtX3ZjcHVfaW5pdCh2Y3B1LCBrdm0sIGlk
KTsKPiBAQCAtNDkzOCw2ICs0OTM5LDUwIEBAIHN0YXRpYyBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25z
IGt2bV9wbGFuZV9mb3BzID0gewo+ICAgCUtWTV9DT01QQVQoa3ZtX3BsYW5lX2lvY3RsKSwKPiAg
IH07Cj4gICAKPiArdm9pZCBrdm1fdmNwdV9zZXRfcGxhbmVfcnVubmFibGUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQo+ICt7Cj4gKwl2Y3B1LT5wbGFuZV9zdGF0ZSA9IFJVTk5BQkxFOwo+ICsJdmNw
dS0+Y29tbW9uLT5wbGFuZV9zd2l0Y2ggPSB0cnVlOwo+ICsJa3ZtX21ha2VfcmVxdWVzdChLVk1f
UkVRX1BMQU5FX1JFU0NIRUQsIHZjcHUpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xfRk9SX0tWTV9J
TlRFUk5BTChrdm1fdmNwdV9zZXRfcGxhbmVfcnVubmFibGUpOwo+ICsKPiArdm9pZCBrdm1fdmNw
dV9zZXRfcGxhbmVfc3RvcHBlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiArCXZjcHUt
PnBsYW5lX3N0YXRlID0gU1RPUFBFRDsKPiArCWt2bV9tYWtlX3JlcXVlc3QoS1ZNX1JFUV9QTEFO
RV9SRVNDSEVELCB2Y3B1KTsKPiArfQo+ICtFWFBPUlRfU1lNQk9MX0ZPUl9LVk1fSU5URVJOQUwo
a3ZtX3ZjcHVfc2V0X3BsYW5lX3N0b3BwZWQpOwo+ICsKPiArc3RydWN0IGt2bV92Y3B1ICprdm1f
dmNwdV9zZWxlY3RfcGxhbmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKwlzdHJ1Y3Qg
a3ZtX3ZjcHVfY29tbW9uICpjb21tb24gPSB2Y3B1LT5jb21tb247Cj4gKwlzdHJ1Y3Qga3ZtX3Zj
cHUgKnJldCA9IE5VTEw7Cj4gKwl1bnNpZ25lZCBpOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBL
Vk1fTUFYX1BMQU5FUzsgaSsrKSB7Cj4gKwkJaWYgKGNvbW1vbi0+dmNwdXNbaV0gPT0gTlVMTCkK
PiArCQkJY29udGludWU7Cj4gKwo+ICsJCWlmIChjb21tb24tPnZjcHVzW2ldLT5wbGFuZV9zdGF0
ZSA9PSBSVU5OQUJMRSkgewo+ICsJCQlyZXQgPSBjb21tb24tPnZjcHVzW2ldOwo+ICsJCQlicmVh
azsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJaWYgKHJldCA9PSBOVUxMKSB7Cj4gKwkJcmV0ID0gY29t
bW9uLT52Y3B1c1swXTsKPiArCQlyZXQtPnBsYW5lX3N0YXRlID0gUlVOTkFCTEU7Cj4gKwl9Cj4g
Kwo+ICsJY29tbW9uLT5jdXJyZW50X3ZjcHUgPSByZXQ7Cj4gKwo+ICsJY29tbW9uLT5wbGFuZV9z
d2l0Y2ggPSBmYWxzZTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xf
Rk9SX0tWTV9JTlRFUk5BTChrdm1fdmNwdV9zZWxlY3RfcGxhbmUpOwo+ICsKPiAgIHN0YXRpYyBp
bnQga3ZtX2RldmljZV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPiAgIHsKPiAgIAlzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2ID0gZmlscC0+cHJpdmF0
ZV9kYXRhOwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
