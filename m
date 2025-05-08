Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DFFC3ABC6
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Q8U3FfP+yi/NQWrheaLDf1odqrXnbfJ+1ocb9a50Ag=; b=yTpTwlw9A7TLMz
	b/0YTlodiA9qU+v3rmPwtWW73sbhwt1Ff3Z9PRmwcYzxb0iJiE3xsOJXMYq84Q9yef2Arp75MwJPL
	ZB+qDgIDrxuZ62eQFmBVKJtydxrTYlv0Q1NOqeluDGZltxDui1V0vK9Oz1jDrgSytch0cm9ZC0cAX
	3pD+iYSBmLcAuROGaz0LXVlewRCFnb4nydXTmUsopgQNy7zNssIlKnUooPsBYqWovsA2L+xHj3jzj
	M0hpOAmIlWHf5sQ9Nh4vv1cqckYPPOdY0oVZPPN0wRuR2IeTUzP2oGENGbc8KNu6VgsaJqd0xs3LT
	ufrfFEs6TDK6CgU+d72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD8qA-00000001qTZ-2D5l;
	Thu, 08 May 2025 21:31:38 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7gZ-00000001jwE-1tK0
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 20:17:40 +0000
Message-ID: <adbf1bdb-b4a6-4004-91a2-8ae1a7c6485d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746735446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xW1lyde1rFoYHMdSte95ffiRHM0n9sNPG5Z2FF4OZhU=;
	b=L0zvo6Uag5ujjLttWPBQRpOjKck0A5r5ywbrj41FXX+z3dHgUk0x2eXomtoQssNCK+iBy3
	RirtEwpbTb/ma2HieBXVtB24FXb/KN4AxY/YiVsFaIiSWU3PNo5aPXAAelxFmCtu6o0DwU
	gh9pwRbnSKEBkg162bdGTfqujxdAOt8=
Date: Thu, 8 May 2025 13:17:20 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 01/14] riscv: sbi: add Firmware Feature (FWFT) SBI
 extensions definitions
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
 <20250424173204.1948385-2-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-2-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_131739_635231_4DA79CFC 
X-CRM114-Status: GOOD (  12.34  )
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBUaGUgRmly
bXdhcmUgRmVhdHVyZXMgZXh0ZW5zaW9uIChGV0ZUKSB3YXMgYWRkZWQgYXMgcGFydCBvZiB0aGUg
U0JJIDMuMAo+IHNwZWNpZmljYXRpb24uIEFkZCBTQkkgZGVmaW5pdGlvbnMgdG8gdXNlIHRoaXMg
ZXh0ZW5zaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5k
QHNpZml2ZS5jb20+Cj4gVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygr
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+IGluZGV4IDNkMjUwODI0MTc4Yi4uYmIwNzdkMGM5MTJm
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gQEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0
X2lkIHsKPiAgIAlTQklfRVhUX0RCQ04gPSAweDQ0NDI0MzRFLAo+ICAgCVNCSV9FWFRfU1RBID0g
MHg1MzU0NDEsCj4gICAJU0JJX0VYVF9OQUNMID0gMHg0RTQxNDM0QywKPiArCVNCSV9FWFRfRldG
VCA9IDB4NDY1NzQ2NTQsCj4gICAKPiAgIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lvbnMgbXVz
dCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KPiAgIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFS
VCA9IDB4MDgwMDAwMDAsCj4gQEAgLTQwMiw2ICs0MDMsMzMgQEAgZW51bSBzYmlfZXh0X25hY2xf
ZmVhdHVyZSB7Cj4gICAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWChfX2kpCQkoKF9fcmlz
Y3ZfeGxlbiAvIDgpICogKF9faSkpCj4gICAjZGVmaW5lIFNCSV9OQUNMX1NITUVNX1NSRVRfWF9M
QVNUCQkzMQo+ICAgCj4gKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZlYXR1cmUgZXh0ZW5z
aW9uICovCj4gKyNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVAkJMHgwCj4gKyNkZWZpbmUgU0JJX0VY
VF9GV0ZUX0dFVAkJMHgxCj4gKwo+ICtlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7Cj4gKwlTQklf
RldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRwkJPSAweDAsCj4gKwlTQklfRldGVF9MQU5ESU5HX1BB
RAkJCT0gMHgxLAo+ICsJU0JJX0ZXRlRfU0hBRE9XX1NUQUNLCQkJPSAweDIsCj4gKwlTQklfRldG
VF9ET1VCTEVfVFJBUAkJCT0gMHgzLAo+ICsJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9
IDB4NCwKPiArCVNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTgkJPSAweDUsCj4gKwlTQklf
RldGVF9MT0NBTF9SRVNFUlZFRF9TVEFSVAkJPSAweDYsCj4gKwlTQklfRldGVF9MT0NBTF9SRVNF
UlZFRF9FTkQJCT0gMHgzZmZmZmZmZiwKPiArCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX1NUQVJU
CQk9IDB4NDAwMDAwMDAsCj4gKwlTQklfRldGVF9MT0NBTF9QTEFURk9STV9FTkQJCT0gMHg3ZmZm
ZmZmZiwKPiArCj4gKwlTQklfRldGVF9HTE9CQUxfUkVTRVJWRURfU1RBUlQJCT0gMHg4MDAwMDAw
MCwKPiArCVNCSV9GV0ZUX0dMT0JBTF9SRVNFUlZFRF9FTkQJCT0gMHhiZmZmZmZmZiwKPiArCVNC
SV9GV0ZUX0dMT0JBTF9QTEFURk9STV9TVEFSVAkJPSAweGMwMDAwMDAwLAo+ICsJU0JJX0ZXRlRf
R0xPQkFMX1BMQVRGT1JNX0VORAkJPSAweGZmZmZmZmZmLAo+ICt9Owo+ICsKPiArI2RlZmluZSBT
QklfRldGVF9QTEFURk9STV9GRUFUVVJFX0JJVAkJQklUKDMwKQo+ICsjZGVmaW5lIFNCSV9GV0ZU
X0dMT0JBTF9GRUFUVVJFX0JJVAkJQklUKDMxKQo+ICsKPiArI2RlZmluZSBTQklfRldGVF9TRVRf
RkxBR19MT0NLCQkJQklUKDApCj4gKwo+ICAgLyogU0JJIHNwZWMgdmVyc2lvbiBmaWVsZHMgKi8K
PiAgICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxUCTB4MQo+ICAgI2RlZmluZSBTQklf
U1BFQ19WRVJTSU9OX01BSk9SX1NISUZUCTI0Cj4gQEAgLTQxOSw2ICs0NDcsMTEgQEAgZW51bSBz
YmlfZXh0X25hY2xfZmVhdHVyZSB7Cj4gICAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVEFSVEVE
IC03Cj4gICAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04Cj4gICAjZGVmaW5lIFNC
SV9FUlJfTk9fU0hNRU0JLTkKPiArI2RlZmluZSBTQklfRVJSX0lOVkFMSURfU1RBVEUJLTEwCj4g
KyNkZWZpbmUgU0JJX0VSUl9CQURfUkFOR0UJLTExCj4gKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VU
CQktMTIKPiArI2RlZmluZSBTQklfRVJSX0lPCQktMTMKPiArI2RlZmluZSBTQklfRVJSX0RFTklF
RF9MT0NLRUQJLTE0Cj4gICAKPiAgIGV4dGVybiB1bnNpZ25lZCBsb25nIHNiaV9zcGVjX3ZlcnNp
b247Cj4gICBzdHJ1Y3Qgc2JpcmV0IHsKClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hw
QHJpdm9zaW5jLmNvbT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
