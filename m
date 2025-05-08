Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F318C3ABC6
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CchLoTZnzfJWHMO0+bfBAqmWU2qpJmgQjlcStbgdiL8=; b=mmWUc9DW23hXya
	GBuEQ3sg8EPADo7Lzq0e/3F60TIMfy4WzoMmdxlnDbQhxfoYRWgldyQD2dgnwx4B7Oi2Eyhm4dNpm
	BzW60B4+0734HozfnTHHy+xVitBhKFdDyIuTtrV8waSBskgZBKY3e3Vjvmbz7eKgwHStp+X5xSaPm
	stHagsp2ccspECX33/ka+utEt+cbosVd54C1wQYxN0bvKLgY0C7MFhr87cTgyo+J9COMKNhnZPjCE
	AqcLR65seiCN4aAyaLFnEnngWeVu8p4uyxzQ2ZAZNJPv7lpCvZFFh9039flQ+KWol+J0FRa7LlnMQ
	OJpko6wK1o2ZE6MDmg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7h9-00000001k5D-3UF4;
	Thu, 08 May 2025 20:18:15 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7h7-00000001k3q-22sc;
	Thu, 08 May 2025 20:18:14 +0000
Message-ID: <eab937fc-6d9f-46b4-9c45-e8defa31f038@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746735490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCMU+yBPYWIBqtx4wjHgX8QEBpwX3EBt77ds4u9eyfA=;
	b=xZWoJtMGJ++IS2qmyND2yhJRoBrczbjEo2hlwL/TGR0NLs3NA+1wjTsb6ZNV39r57Kep0f
	WK/pqk/zOpQNeIUS/pr0Q3jfn53kCi2Xq8zdnPb2Sf+yQK3L9/klTRciIsSpxH8Mb0yP6n
	92cBRHwE1HIrrJTuMlEikZ6N96AmwwQ=
Date: Thu, 8 May 2025 13:18:05 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/14] riscv: sbi: remove useless parenthesis
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
 <20250424173204.1948385-3-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-3-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_131813_661744_30A84427 
X-CRM114-Status: GOOD (  12.20  )
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBBIGZldyBw
YXJlbnRoZXNpcyBpbiBjaGVjayBmb3IgU0JJIHZlcnNpb24vZXh0ZW5zaW9uIHdlcmUgdXNlbGVz
cywKPiByZW1vdmUgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDYg
KysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCj4gaW5kZXggMTk4OWI4Y2FkZTFiLi4xZDQ0YzM1MzA1YTkgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
YmkuYwo+IEBAIC02MDksNyArNjA5LDcgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKPiAg
IAkJfSBlbHNlIHsKPiAgIAkJCV9fc2JpX3JmZW5jZQk9IF9fc2JpX3JmZW5jZV92MDE7Cj4gICAJ
CX0KPiAtCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMCwgMykpICYm
Cj4gKwkJaWYgKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMCwgMykgJiYKPiAg
IAkJICAgIHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9TUlNUKSkgewo+ICAgCQkJcHJfaW5m
bygiU0JJIFNSU1QgZXh0ZW5zaW9uIGRldGVjdGVkXG4iKTsKPiAgIAkJCXBtX3Bvd2VyX29mZiA9
IHNiaV9zcnN0X3Bvd2VyX29mZjsKPiBAQCAtNjE3LDggKzYxNyw4IEBAIHZvaWQgX19pbml0IHNi
aV9pbml0KHZvaWQpCj4gICAJCQlzYmlfc3JzdF9yZWJvb3RfbmIucHJpb3JpdHkgPSAxOTI7Cj4g
ICAJCQlyZWdpc3Rlcl9yZXN0YXJ0X2hhbmRsZXIoJnNiaV9zcnN0X3JlYm9vdF9uYik7Cj4gICAJ
CX0KPiAtCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpICYm
Cj4gLQkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfREJDTikgPiAwKSkgewo+ICsJ
CWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDIsIDApICYmCj4gKwkJICAg
IHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9EQkNOKSA+IDApIHsKPiAgIAkJCXByX2luZm8o
IlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gICAJCQlzYmlfZGVidWdfY29uc29s
ZV9hdmFpbGFibGUgPSB0cnVlOwo+ICAgCQl9CgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0
aXNocEByaXZvc2luYy5jb20+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
