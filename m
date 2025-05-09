Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAFCC3ABBC
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PLwD9gD3SIpwVOaFxjJCL82I4GyK7L5tz9+droJhm4=; b=EDkZcf1xN9fjsD
	0Kgop3cRyh8fvBXAmCTUPchuBXpdaA0QwjMzCufuGmOT5fLmSeG/AVbAXNQ1d9F+c/IrvefF3i5wC
	7K1PBLX0H5bc7wjHPN+eZzn3JYbd7AdVZ3UzF5oFTixMZF/HxZPVkA2Q4316Wqi9+gCq5QRtSPQhC
	6XJdafMzgVHp000cH9I27EeM6rO/LHguPmbWb0CezVwvqObAEiQoat65W0t0W2xpFZ7fhjlU2iv+y
	PLDGqpgxraNakqwMn2+N8WH3UL4xeFVsDLGol0iPhdT2Msn8B8UtR5rHhfmOHcBYnk6L277vHoyJd
	MINcZGHI14NYKS4CGGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJn-00000004ojC-2GZQ;
	Fri, 09 May 2025 20:27:39 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSAY-00000004X9A-47kt;
	Fri, 09 May 2025 18:10:01 +0000
Message-ID: <87b2eade-acda-428e-81af-d4927e517ebe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746814184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=URPGJAItur5ro86msDKguo+AsJb0M+Qreyerm9JUIhE=;
	b=QmAOyYPC6u20ITPaBw6Ha8aJZ5SkuvYHSBzdZn+LukNn9N+RF2l6kZWl4i8HY2iN8xSa3/
	tRR0b2Vwb3FURyyvyNGCNFznDS++FHxCJiarEuklu+4bAraa+0PNDh4WOi8CnQ/hVnXHkT
	cQd2oib4+zm6/z7aTg3m38NqWDWGL6E=
Date: Fri, 9 May 2025 11:09:18 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 14/14] RISC-V: KVM: add support for
 SBI_FWFT_MISALIGNED_DELEG
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
 <20250424173204.1948385-15-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-15-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_110959_163840_92C82544 
X-CRM114-Status: GOOD (  19.10  )
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

T24gNC8yNC8yNSAxMDozMiBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBTQklfRldG
VF9NSVNBTElHTkVEX0RFTEVHIG5lZWRzIGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8gZGVsZWdh
dGUKPiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgZXhjZXB0aW9ucy4gU2F2ZSBhbmQgcmVzdG9yZSBp
dCBkdXJpbmcgQ1BVCj4gbG9hZC9wdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRl
YnVnQHJpdm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICB8
ICAzICsrKwo+ICAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwgMzYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRp
b25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDU0Mjc0N2UyYzdmNS4uZDk4ZTM3OTk0NWMzIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUu
Ywo+IEBAIC02NDYsNiArNjQ2LDcgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4gICB7Cj4gICAJdm9pZCAqbnNoOwo+ICAgCXN0cnVjdCBrdm1fdmNwdV9j
c3IgKmNzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPiArCXN0cnVjdCBrdm1fdmNwdV9jb25m
aWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPiAgIAo+ICAgCXZjcHUtPmNwdSA9IC0xOwo+ICAg
Cj4gQEAgLTY3MSw2ICs2NzIsNyBAQCB2b2lkIGt2bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSkKPiAgIAkJY3NyLT52c3R2YWwgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZT
VFZBTCk7Cj4gICAJCWNzci0+aHZpcCA9IG5hY2xfY3NyX3JlYWQobnNoLCBDU1JfSFZJUCk7Cj4g
ICAJCWNzci0+dnNhdHAgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX1ZTQVRQKTsKPiArCQljZmct
PmhlZGVsZWcgPSBuYWNsX2Nzcl9yZWFkKG5zaCwgQ1NSX0hFREVMRUcpOwo+ICAgCX0gZWxzZSB7
Cj4gICAJCWNzci0+dnNzdGF0dXMgPSBjc3JfcmVhZChDU1JfVlNTVEFUVVMpOwo+ICAgCQljc3It
PnZzaWUgPSBjc3JfcmVhZChDU1JfVlNJRSk7Cj4gQEAgLTY4MSw2ICs2ODMsNyBAQCB2b2lkIGt2
bV9hcmNoX3ZjcHVfcHV0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgIAkJY3NyLT52c3R2YWwg
PSBjc3JfcmVhZChDU1JfVlNUVkFMKTsKPiAgIAkJY3NyLT5odmlwID0gY3NyX3JlYWQoQ1NSX0hW
SVApOwo+ICAgCQljc3ItPnZzYXRwID0gY3NyX3JlYWQoQ1NSX1ZTQVRQKTsKPiArCQljZmctPmhl
ZGVsZWcgPSBjc3JfcmVhZChDU1JfSEVERUxFRyk7CgpDYW4gd2UgYXZvaWQgc2F2aW5nIGhlZGVs
ZWcgaW4gdmNwdV9wdXQgcGF0aCBieSB1cGRhdGluZyB0aGUgCmNmZy0+aGVkZWxlZyBpbiBrdm1f
c2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbi4KCldlIGFscmVhZHkgdXBkYXRlIHRo
ZSBoZWRlbGVnIGluIHZjcHVfbG9hZCBwYXRoIGZyb20gY2ZnLT5oZWRlbGVnLgpJZiB0aGUgbmV4
dCB2Y3B1IGRpZCBub3QgZW5hYmxlIGRlbGVnYXRpb24gaXQgd2lsbCBnZXQgdGhlIGNvcnJlY3Qg
CmNvbmZpZyB3cml0dGVuIHRvIGhlZGVsZWcuCgpUaGlzIHdpbGwgc2F2ZSB1cyBhIGNzciByZWFk
IGNvc3QgaW4gZWFjaCBWTSBleGl0IHBhdGggZm9yIHNvbWV0aGluZyAKdGhhdCBpcyBwcm9iYWJs
eSBjb25maWd1cmVkIG9uY2UgaW4gZ3Vlc3QgbGlmZSB0aW1lLgoKPiAgIAl9Cj4gICB9Cj4gICAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYjBmNjZjN2JmMDEwLi5kMTZlZTQ3NzA0MmYg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTE0LDYgKzE0LDggQEAKPiAgICNpbmNs
dWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9m
d2Z0Lmg+Cj4gICAKPiArI2RlZmluZSBNSVNfREVMRUcgKEJJVF9VTEwoRVhDX0xPQURfTUlTQUxJ
R05FRCkgfCBCSVRfVUxMKEVYQ19TVE9SRV9NSVNBTElHTkVEKSkKPiArCj4gICBzdHJ1Y3Qga3Zt
X3NiaV9md2Z0X2ZlYXR1cmUgewo+ICAgCS8qKgo+ICAgCSAqIEBpZDogRmVhdHVyZSBJRAo+IEBA
IC02OCw3ICs3MCw0MSBAQCBzdGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUo
ZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPiAgIAlyZXR1cm4gZmFsc2U7Cj4gICB9
Cj4gICAKPiArc3RhdGljIGJvb2wga3ZtX3NiaV9md2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9z
dXBwb3J0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKwlyZXR1cm4gbWlzYWxpZ25l
ZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcga3ZtX3NiaV9m
d2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsJ
CQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsJCQkJCXVuc2lnbmVkIGxv
bmcgdmFsdWUpCj4gK3sKPiArCWlmICh2YWx1ZSA9PSAxKQo+ICsJCWNzcl9zZXQoQ1NSX0hFREVM
RUcsIE1JU19ERUxFRyk7Cj4gKwllbHNlIGlmICh2YWx1ZSA9PSAwKQo+ICsJCWNzcl9jbGVhcihD
U1JfSEVERUxFRywgTUlTX0RFTEVHKTsKPiArCWVsc2UKPiArCQlyZXR1cm4gU0JJX0VSUl9JTlZB
TElEX1BBUkFNOwo+ICsKPiArCXJldHVybiBTQklfU1VDQ0VTUzsKPiArfQo+ICsKPiArc3RhdGlj
IGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAo+ICsJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsJ
CQkJCXVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+ICt7Cj4gKwkqdmFsdWUgPSAoY3NyX3JlYWQoQ1NS
X0hFREVMRUcpICYgTUlTX0RFTEVHKSA9PSBNSVNfREVMRUc7Cj4gKwo+ICsJcmV0dXJuIFNCSV9T
VUNDRVNTOwo+ICt9Cj4gKwo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVh
dHVyZSBmZWF0dXJlc1tdID0gewo+ICsJewo+ICsJCS5pZCA9IFNCSV9GV0ZUX01JU0FMSUdORURf
RVhDX0RFTEVHLAo+ICsJCS5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25lZF9kZWxl
Z2F0aW9uX3N1cHBvcnRlZCwKPiArCQkuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVk
X2RlbGVnYXRpb24sCj4gKwkJLmdldCA9IGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxl
Z2F0aW9uLAo+ICsJfSwKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
X2NvbmZpZyAqCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
