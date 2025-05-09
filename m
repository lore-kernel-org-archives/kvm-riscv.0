Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB1CC3ABC5
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 May 2025 00:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpp45Jg8Op5SXGwLGNblH/BCrLtp/dlelWewb4oRDUo=; b=fT+yM9nfHZCJsm
	puVX55yNX0MHCf9FTftXi0hVPIze62l4FIGRYa8FFwSYewbAut4M58Hzs+t2wSwgMwPTqAAwdl6me
	5HFcfGMQveHsFDP1+4fcRIaB9JaQAgDmUeNjXuo4gigyKGnrNusetojyzpTU8hdQcQqqmkRqjNIMx
	1JGw44tyvuP433yGNceufrTvDQW0mV9KS1e8I+7H+YweIV720J/PA+/zKV9zrPvjBCVop0yXIdBdk
	V+HhbthBvr4Kch1duW+0IvLXu1dbs6p9YX6AKk8CYc8D6d8FXG1LaNC+tXNUE/SIDcCKDCCm0wHbM
	uW10d3Hyoj+QaCS303wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDBak-000000025gj-32ts;
	Fri, 09 May 2025 00:27:54 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDBah-000000025fy-3qOD
	for kvm-riscv@lists.infradead.org;
	Fri, 09 May 2025 00:27:53 +0000
Message-ID: <a34e5893-0b7e-47e7-a655-a49e3472e0e9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746750469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=focIGU9K6baIuUHoMWczpC1FYpctMA9LpP3THjX0tv8=;
	b=S/yhTzFakjdfMXIvQjosSdkUsGCK+8PEHBvMHiTyVuN7hXwQ0YNKGjTbLAvgLRrcw3avQY
	pduZN1V4KocO2xdemEmx1q1Huf/v1qISawu5FABFATS3F53m1xBxyHSFTO2wCmRWTZQBnq
	23VctDWhLqEMU7OCy3cyW5hPtb9dUTQ=
Date: Thu, 8 May 2025 17:26:52 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 11/14] RISC-V: KVM: add SBI extension init()/deinit()
 functions
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
 <20250424173204.1948385-12-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-12-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_172752_105470_1C9A4246 
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBUaGUgRldG
VCBTQkkgZXh0ZW5zaW9uIHdpbGwgbmVlZCB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSBtZW1vcnkg
YW5kIGRvCj4gaW5pdCB0aW1lIHNwZWNpZmljIGluaXRpYWxpemF0aW9uLiBBZGQgYW4gaW5pdC9k
ZWluaXQgY2FsbGJhY2tzIHRoYXQKPiBhbGxvd3MgdG8gZG8gc28uCj4gCj4gU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysrKwo+ICAgYXJjaC9yaXNj
di9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCj4gICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaS5jICAgICAgICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1fdmNwdV9zYmkuaAo+IGluZGV4IDRlZDYyMDNjZGQzMC4uYmNiOTA3NTdiMTQ5IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gQEAgLTQ5LDYgKzQ5LDE0IEBA
IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHsKPiAgIAo+ICAgCS8qIEV4dGVuc2lvbiBz
cGVjaWZpYyBwcm9iZSBmdW5jdGlvbiAqLwo+ICAgCXVuc2lnbmVkIGxvbmcgKCpwcm9iZSkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiArCj4gKwkvKgo+ICsJICogSW5pdC9kZWluaXQgZnVuY3Rp
b24gY2FsbGVkIG9uY2UgZHVyaW5nIFZDUFUgaW5pdC9kZXN0cm95LiBUaGVzZQo+ICsJICogbWln
aHQgYmUgdXNlIGlmIHRoZSBTQkkgZXh0ZW5zaW9ucyBuZWVkIHRvIGFsbG9jYXRlIG9yIGRvIHNw
ZWNpZmljCj4gKwkgKiBpbml0IHRpbWUgb25seSBjb25maWd1cmF0aW9uLgo+ICsJICovCj4gKwlp
bnQgKCppbml0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICsJdm9pZCAoKmRlaW5pdCkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgIH07Cj4gICAKPiAgIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsK
PiBAQCAtNjksNiArNzcsNyBAQCBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAq
a3ZtX3ZjcHVfc2JpX2ZpbmRfZXh0KAo+ICAgYm9vbCByaXNjdl92Y3B1X3N1cHBvcnRzX3NiaV9l
eHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaWR4KTsKPiAgIGludCBrdm1fcmlzY3ZfdmNw
dV9zYmlfZWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsK
PiAgIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsK
PiArdm9pZCBrdm1fcmlzY3ZfdmNwdV9zYmlfZGVpbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
Cj4gICAKPiAgIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCj4gICAJCQkJICAgdW5zaWduZWQgbG9u
ZyAqcmVnX3ZhbCk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDYwZDY4NGM3NmM1OC4uODc3YmNjODVjMDY3IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHUuYwo+IEBAIC0xODUsNiArMTg1LDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3Bvc3RjcmVhdGUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgCj4gICB2b2lkIGt2bV9hcmNoX3ZjcHVfZGVzdHJv
eShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICB7Cj4gKwlrdm1fcmlzY3ZfdmNwdV9zYmlfZGVp
bml0KHZjcHUpOwo+ICsKPiAgIAkvKiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQgKi8KPiAgIAlr
dm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXgg
ZDFjODNhNzc3MzVlLi4zMTM5ZjE3MWMyMGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtNTA4LDUg
KzUwOCwzMSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiAgIAkJc2NvbnRleHQtPmV4dF9zdGF0dXNbaWR4XSA9IGV4dC0+ZGVmYXVsdF9kaXNh
YmxlZCA/Cj4gICAJCQkJCUtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19ESVNBQkxFRCA6Cj4gICAJ
CQkJCUtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19FTkFCTEVEOwo+ICsKPiArCQlpZiAoZXh0LT5p
bml0ICYmIGV4dC0+aW5pdCh2Y3B1KSAhPSAwKQo+ICsJCQlzY29udGV4dC0+ZXh0X3N0YXR1c1tp
ZHhdID0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFOwo+ICsJfQo+ICt9Cj4g
Kwo+ICt2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+ICt7Cj4gKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUt
PmFyY2guc2JpX2NvbnRleHQ7Cj4gKwljb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNp
b25fZW50cnkgKmVudHJ5Owo+ICsJY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24g
KmV4dDsKPiArCWludCBpZHgsIGk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUo
c2JpX2V4dCk7IGkrKykgewo+ICsJCWVudHJ5ID0gJnNiaV9leHRbaV07Cj4gKwkJZXh0ID0gZW50
cnktPmV4dF9wdHI7Cj4gKwkJaWR4ID0gZW50cnktPmV4dF9pZHg7Cj4gKwo+ICsJCWlmIChpZHgg
PCAwIHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250ZXh0LT5leHRfc3RhdHVzKSkKPiArCQkJY29u
dGludWU7Cj4gKwo+ICsJCWlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID09IEtWTV9SSVND
Vl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRSB8fAo+ICsJCSAgICAhZXh0LT5kZWluaXQpCj4g
KwkJCWNvbnRpbnVlOwo+ICsKPiArCQlleHQtPmRlaW5pdCh2Y3B1KTsKPiAgIAl9Cj4gICB9CgpM
R1RNLgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
