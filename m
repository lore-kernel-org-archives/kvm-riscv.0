Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574FEC71130
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk8IL142cCEHqrYVtxU8pwAZb6RHVhiXhj0z0tW/qog=; b=i0E4kndEWGguJg
	i4K43aHldcPuWJMmXgmiJjwEURf02OsaBB5+i2OsmkUoKUmKSazJNuOXYn23y0TuxuOgPQfW0fhyo
	sfimPFg3c/fYRdkSilD3/gWPuz2Ersr8Mq9lsBYle//qN93Emgoah6VuSh3zX1vuDB8TNbDmK8xXL
	mguEa0WBBEIev52xKI85xI9CH1lAM+gnr9fqr3pGWU/t7iazzSnZaos9UYmexlW2nhG6P1GscaD8z
	VkDjCgnDYsptrw2p6KshsZdYoDxU3+J9F5HPyNUtAlBPiCso0cfJpNE52OPAWz7s9tsVFe+Vu4hMl
	//fXRZlHzPcEPG/yLGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqgl-00000003JbY-2liR;
	Mon, 07 Jul 2025 18:35:39 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYptK-00000003Cjp-35mI
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 17:44:36 +0000
Date: Mon, 7 Jul 2025 19:44:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751910267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDUHijd7Ti9O17zyCdhODo2Lyk368Lrbom0BpvxiUD4=;
	b=i/Yg7aZ876/AQ5JodBsxWooLMdVJqSThZmfMA1OCDworQ2VnK/uDFy8dalHu62qiMbZByg
	ll0gEP/g1nQD9jhQg+V+UnwI+oqPYesg1m2Do+dJs0KCu//V2luZX12094ChwH/DaEiQL0
	uP89BFd2VAfNpUI8VzMPTIfxjcACVZ8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jesse Taube <jesse@rivosinc.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, alexandru.elisei@arm.com, cleger@rivosinc.com, 
	jamestiotio@gmail.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [kvm-unit-tests PATCH 2/2] riscv: Add kvmtool support
Message-ID: <20250707-cdad2acc36fb5c313042bd86@orel>
References: <20250704151254.100351-4-andrew.jones@linux.dev>
 <20250704151254.100351-6-andrew.jones@linux.dev>
 <CALSpo=YKMa142xhS8KSEenBLemaK6rqYKEd3FotQtCjpV5CciQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALSpo=YKMa142xhS8KSEenBLemaK6rqYKEd3FotQtCjpV5CciQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_104435_181649_81454BF2 
X-CRM114-Status: GOOD (  16.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMDg6Mjg6MzBBTSAtMDcwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gT24gRnJpLCBKdWwgNCwgMjAyNSBhdCA4OjEz4oCvQU0gQW5kcmV3IEpvbmVzIDxhbmRy
ZXcuam9uZXNAbGludXguZGV2PiB3cm90ZToKPiA+Cj4gPiBhcm0vYXJtNjQgc3VwcG9ydHMgcnVu
bmluZyB0ZXN0cyB3aXRoIGt2bXRvb2wgYXMgYSBmaXJzdCBjbGFzcyBjaXRpemVuLgo+ID4gTW9z
dCB0aGUgY29kZSB0byBkbyB0aGF0IGlzIGluIHRoZSBjb21tb24gc2NyaXB0cywgc28ganVzdCBh
ZGQgdGhlIHJpc2N2Cj4gPiBzcGVjaWZpYyBiaXRzIG5lZWRlZCB0byBhbGxvdyByaXNjdiB0byB1
c2Uga3ZtdG9vbCBhcyBhIGZpcnN0IGNsYXNzCj4gPiBjaXRpemVuIHRvby4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5kZXY+Cj4gCj4gUmV2
aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+CgpUaGFua3MhCgouLi4K
PiA+ICBlbHNlCj4gPiAtICAgIGlmIFsgIiRhcmNoIiAhPSAiYXJtNjQiIF0gJiYgWyAiJGFyY2gi
ICE9ICJhcm0iIF07IHRoZW4KPiA+ICsgICAgaWYgWyAiJGFyY2giICE9ICJhcm0iIF0gJiYgWyAi
JGFyY2giICE9ICJhcm02NCIgXSAmJgo+ID4gKyAgICAgICBbICIkYXJjaCIgIT0gInJpc2N2MzIi
IF0gJiYgWyAiJGFyY2giICE9ICJyaXNjdjY0IiBdOyB0aGVuCj4gCj4gQXJlIHRoZXJlIHBsYW5z
IHRvIGFkZCBpMzg2IGFuZCB4ODZfNjQgdG9vPwoKSSBkb24ndCBoYXZlIHBsYW5zIG15c2VsZiwg
YXQgbGVhc3Qgbm90IHJpZ2h0IG5vdywgYnV0IEkgdGhpbmsgaXQnZCBiZQpnb29kIHRvIGRvIGl0
LCBzbyBpdCdkIGJlIGdyZWF0IGlmIHNvbWVib2R5IHdvdWxkIHdyaXRlIHRoZSBwYXRjaCBhbmQK
ZG8gdGhlIHRlc3RpbmcuCgouLi4KPiA+ICsgICAgICAgY29tbWFuZD0iJCh0aW1lb3V0X2NtZCkg
JGt2bXRvb2wgcnVuIgo+ID4gKyAgICAgICBpZiAoIFsgIiRIT1NUIiA9ICJyaXNjdjY0IiBdICYm
IFsgIiRBUkNIIiA9ICJyaXNjdjMyIiBdICkgfHwKPiA+ICsgICAgICAgICAgKCBbICIkSE9TVCIg
PSAicmlzY3YzMiIgXSAmJiBbICIkQVJDSCIgPSAicmlzY3Y2NCIgXSApOyB0aGVuCj4gCj4gU2hv
dWxkbid0IHRoZXJlIGJlIGEgY2hlY2sgbGlrZSB0aGlzIG9uIGFybSBmb3Igd2hlbiAgWyAiJEhP
U1QiID0KPiAiYXJtIiBdICYmIFsgIiRBUkNIIiA9ICJhYXJjaDY0IiBdPwoKYXJtIGt2bSBoYXMg
YmVlbiBsb25nIGRlcHJlY2F0ZWQgYW5kIHJlbW92ZWQgZnJvbSBMaW51eCBzbyB3ZSBzaG91bGQK
YWN0dWFsbHkgcmVtb3ZlIGFueSByZWZlcmVuY2VzIHRvIEhPU1Q9PWFybSB0aHJvdWdob3V0IHRo
ZSBmcmFtZXdvcmsKdG9vLCBzaW5jZSBpdCBjYW4ndCBoYXBwZW4gKGFueSBtb3JlKS4KClRoYW5r
cywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
