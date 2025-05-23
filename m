Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF96C54ED1
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 17:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiGa7go98pfD5Rgj8UAHYhIXW8aJ999PuOPy7csigQU=; b=heti1Jq4Akai1n
	vr7P5P0zIk7F71ADVtFZlioEbjsOezgdHker8CwgAsIFQKtF64ftC+poCjN7QRR7LVOcCMN8rhwJc
	gXkfJ7tofivJA4htmUzskQIT4zat2Q8HiKVoZ1YaE/w/wsRMxMRJBna8Rd7GlVAUI0QeLyxJyzPhG
	P6sQc4GgYdH8EZzyObFuoMd03iq4YgahRWpgo075bkx7/p7dL0JXKJvU2HRRN8eHv914CO6iP9oY3
	0yg7SbfYi7wCyr8t/Hc/3oklRA//Ax0/Uv1LKVLxugfLOYjbXjSxMdm3FF9PUFAoenfL+eDvnYLSc
	N7tRZq+xu9wRP2iPx/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWTJ-00000004as3-2qME;
	Fri, 23 May 2025 17:46:17 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWRz-00000004aYt-1l5A
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 17:44:56 +0000
Message-ID: <7ad8cfad-745f-4626-a2ce-eab33998a711@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748022283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQan1lP1SvjQ3YoRxtVwG6BShbKuywXf8Ct5XNCQIOg=;
	b=NAYkbMnBv2evElrcBOFds8eWgU1fYgMA3/0NEOiNFfz9SqkvlWQGDOpCmog0ZWqn9eNse8
	fgii+JDcSH7sb67ucwZRsWTjlg7ojV58E/jfFNqNTcCx/JnTYuL4z8vytXAqUB3iq1OggA
	4d+3iHUV/8HVnz+o13xmZw9cjoW8J+s=
Date: Fri, 23 May 2025 10:44:37 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev>
 <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
 <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com>
 <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_104455_602398_86A4D3C1 
X-CRM114-Status: GOOD (  24.11  )
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

Ck9uIDUvMjMvMjUgMjoyMCBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IDIwMjUtMDUtMjNU
MTM6Mzg6MjYrMDU6MzAsIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPj4g
T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6NDfigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+PiAyMDI1LTA1LTIyVDE0OjQzOjQwLTA3OjAw
LCBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAbGludXguZGV2PjoKPj4+PiBPbiA1LzE1LzI1IDc6
MzcgQU0sIFJhZGltIEtyw4Rtw4PCocOFIHdyb3RlOgo+Pj4+PiBIZWxsbywKPj4+Pj4KPj4+Pj4g
dGhlIGRlc2lnbiBzdGlsbCByZXF1aXJlcyBhIGRpc2N1c3Npb24uCj4+Pj4+Cj4+Pj4+IFt2MyAx
LzJdIHJlbW92ZXMgbW9zdCBvZiB0aGUgYWRkaXRpb25hbCBjaGFuZ2VzIHRoYXQgdGhlIEtWTSBj
YXBhYmlsaXR5Cj4+Pj4+IHdhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBhbmQgcHJl
dmlld3MgYSBnZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQo+Pj4+PiBsYWNrIG9mIHVzZXJzcGFjZSBj
b250cm9sIG92ZXIgS1ZNIFNCSS4KPj4+Pj4KPj4+PiBJIGFtIHN0aWxsIG1pc3NpbmcgdGhlIG1v
dGl2YXRpb24gYmVoaW5kIGl0LiBJZiB0aGUgbW90aXZhdGlvbiBpcyBTQkkKPj4+PiBIU00gc3Vz
cGVuZCwgdGhlIFBBVENIMiBkb2Vzbid0IGFjaGlldmUgdGhhdCBhcyBpdCBmb3J3YXJkcyBldmVy
eSBjYWxsCj4+Pj4gdG8gdGhlIHVzZXIgc3BhY2UuIFdoeSBkbyB5b3Ugd2FudCB0byBjb250cm9s
IGhzbSBzdGFydC9zdG9wIGZyb20gdGhlCj4+Pj4gdXNlciBzcGFjZSA/Cj4+PiBIU00gbmVlZHMg
Zml4aW5nLCBiZWNhdXNlIEtWTSBkb2Vzbid0IGtub3cgd2hhdCB0aGUgc3RhdGUgYWZ0ZXIKPj4+
IHNiaV9oYXJ0X3N0YXJ0IHNob3VsZCBiZS4KPj4+IEZvciBleGFtcGxlLCB3ZSBoYWQgYSBkaXNj
dXNzaW9uIGFib3V0IHNjb3VudGVyZW4gYW5kIHJlZ2FyZGxlc3Mgb2Ygd2hhdAo+Pj4gZGVmYXVs
dCB3ZSBjaG9vc2UgaW4gS1ZNLCB0aGUgdXNlcnNwYWNlIG1pZ2h0IHdhbnQgYSBkaWZmZXJlbnQg
dmFsdWUuCj4+PiBJIGRvbid0IHRoaW5rIHRoYXQgSFNNIHN0YXJ0L3N0b3AgaXMgYSBob3QgcGF0
aCwgc28gdHJhcHBpbmcgdG8KPj4+IHVzZXJzcGFjZSBzZWVtcyBiZXR0ZXIgdGhhbiBhZGRpbmcg
bW9yZSBrZXJuZWwgY29kZS4KPj4gVGhlcmUgYXJlIG5vIGltcGxlbWVudGF0aW9uIHNwZWNpZmlj
IFMtbW9kZSBDU1IgcmVzZXQgdmFsdWVzCj4+IHJlcXVpcmVkIGF0IHRoZSBtb21lbnQuCj4gSmVz
c2ljYSBtZW50aW9uZWQgdGhhdCBCU0QgcmVxdWlyZXMgc2NvdW50ZXJlbiB0byBiZSBub24temVy
bywgc28KPiB1c2Vyc3BhY2Ugc2hvdWxkIGJlIGFibGUgdG8gcHJvdmlkZSB0aGF0IHZhbHVlLgoK
SmVzc2ljYSBhZG1pdHRlZCB0aGF0IGl0IHdhcyBhIGJ1ZyB3aGljaCBzaG91bGQgYmUgZml4ZWQu
Cgo+IEkgd291bGQgcHJlZmVyIGlmIEtWTSBjb3VsZCBhdm9pZCBnZXR0aW5nIGludG8gdGhvc2Ug
ZGlzY3Vzc2lvbnMuCj4gV2UgY2FuIGp1c3QganVzdCBsZXQgdXNlcnNwYWNlIGJlIGFzIGNyYXp5
IGFzIGl0IHdhbnRzLgoKVGhlIHNjb3VudGVyZW4gc3RhdGUgeW91IG1lbnRpb25lZCBpcyBhbHJl
YWR5IGZpeGVkIG5vdy4KCkkgd291bGQgcHJlZmVyIHRvIGRvIHRoaXMgaWYgdGhlcmUgYXJlIG1v
cmUgb2YgdGhlc2UgaXNzdWVzLiBPdGhlcndpc2UsCndlIG1heSBnYWluIGxpdHRsZSBieSBqdXN0
IGRlbGVnYXRpbmcgbW9yZSB3b3JrIHRvIHRoZSB1c2Vyc3BhY2UgZm9yIG5vIApyZWFzb24uCgo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgV2hlbmV2ZXIgdGhlIG5lZWQgYXJpc2VzLCB3ZSB3
aWxsIGV4dGVuZAo+PiB0aGUgT05FX1JFRyBpbnRlcmZhY2Ugc28gdGhhdCB1c2VyIHNwYWNlIGNh
biBzcGVjaWZ5IGN1c3RvbQo+PiBDU1IgcmVzZXQgdmFsdWVzIGF0IEd1ZXN0L1ZNIGNyZWF0aW9u
IHRpbWUuIFdlIGRvbid0IG5lZWQgdG8KPj4gZm9yd2FyZCBTQkkgSFNNIGNhbGxzIHRvIHVzZXIg
c3BhY2UgZm9yIGN1c3RvbSBTLW1vZGUgQ1NSCj4+IHJlc2V0IHZhbHVlcy4KPiBUaGUgYmVuZWZp
dHMgb2YgYWRkaW5nIGEgbmV3IE9ORV9SRUcgaW50ZXJmYWNlIHNlZW0gdmVyeSBzbWFsbCBjb21w
YXJlZAo+IHRvIHRoZSBkcmF3YmFja3Mgb2YgaGF2aW5nIGV4dHJhIGtlcm5lbCBjb2RlLgoKSG93
ID8gVGhlIGV4dHJhIGtlcm5lbCBjb2RlIGlzIGp1c3QgZmV3IGxpbmVzIHdoZXJlIGl0IGp1c3Qg
cmVnaXN0ZXJzIGEgClNCSSBleHRlbnNpb24gYW5kIGZvcndhcmRzCml0IHRvIHRoZSB1c2Vyc3Bh
Y2UuIFRoYXQncyBmb3IgdGhlIGVudGlyZSBleHRlbnNpb24uCgpGb3IgZXh0ZW5zaW9ucyBsaWtl
IEhTTSwgb25seSBzZWxlY3RpdmUgZnVuY3Rpb25zIHRoYXQgc2hvdWxkIGJlIApmb3J3YXJkZWQg
dG8gdGhlIHVzZXJzcGFjZSB3aGljaApkZWZlYXRzIHRoZSBwdXJwb3NlLgoKTGV0J3Mgbm90IHRy
eSB0byBmaXggc29tZXRoaW5nIHRoYXQgaXMgbm90IGJyb2tlbiB5ZXQuCgo+IElmIHVzZXJzcGFj
ZSB3b3VsZCB3YW50IHRvIHJlc2V0IG9yIHNldHVwIG5ldyBtdWx0aS1WQ1BVcyBWTXMgb2Z0ZW4s
IHdlCj4gY291bGQgYWRkIGFuIGludGVyZmFjZSB0aGF0IGxvYWRzIHRoZSB3aG9sZSByZWdpc3Rl
ciBzdGF0ZSBmcm9tCj4gdXNlcnNwYWNlIGluIGEgc2luZ2xlIElPQ1RMLCBiZWNhdXNlIE9ORV9S
RUcgaXMgbm90IHRoZSBiZXN0IGludGVyZmFjZQo+IGZvciBidWxrIGRhdGEgdHJhbnNmZXIgZWl0
aGVyLgo+Cj4+PiBGb3J3YXJkaW5nIGFsbCB0aGUgdW5pbXBsZW1lbnRlZCBTQkkgZWNhbGxzIHNo
b3VsZG4ndCBiZSBhIHBlcmZvcm1hbmNlCj4+PiBpc3N1ZSwgYmVjYXVzZSBTLW1vZGUgc29mdHdh
cmUgd291bGQgaG9wZWZ1bGx5IGxlYXJuIGFmdGVyIHRoZSBmaXJzdAo+Pj4gZXJyb3IgYW5kIHN0
b3AgdHJ5aW5nIGFnYWluLgo+Pj4KPj4+IEFsbG93aW5nIHVzZXJzcGFjZSB0byBmdWxseSBpbXBs
ZW1lbnQgdGhlIGVjYWxsIGluc3RydWN0aW9uIG9uZSBvZiB0aGUKPj4+IG1vdGl2YXRpb25zIGFz
IHdlbGwgLS0gU0JJIGlzIG5vdCBhIHBhcnQgb2YgUklTQy1WIElTQSwgc28gc29tZW9uZSBtaWdo
dAo+Pj4gYmUgaW50ZXJlc3RlZCBpbiBhY2NlbGVyYXRpbmcgYSBkaWZmZXJlbnQgTS1tb2RlIHNv
ZnR3YXJlIHdpdGggS1ZNLgo+Pj4KPj4+IEknbGwgc2VuZCB2NCBsYXRlciB0b2RheSAtLSB0aGVy
ZSBpcyBhIG1pc3NpbmcgcGFydCBpbiBbMi8yXSwgYmVjYXVzZQo+Pj4gdXNlcnNwYWNlIGFsc28g
bmVlZHMgdG8gYmUgYWJsZSB0byBlbXVsYXRlIHRoZSBiYXNlIFNCSSBleHRlbnNpb24uCj4+Pgo+
PiBbLi4uXSAgICAgICAgICBUaGUgYmVzdCBhcHByb2FjaCBpcyB0byBzZWxlY3RpdmVseSBmb3J3
YXJkIFNCSQo+PiBjYWxscyB0byB1c2VyIHNwYWNlIHdoZXJlIG5lZWRlZCAoZS5nLiBTQkkgc3lz
dGVtIHJlc2V0LAo+PiBTQkkgc3lzdGVtIHN1c3BlbmQsIFNCSSBkZWJ1ZyBjb25zb2xlLCBldGMu
KS4KPiBUaGF0IGlzIGV4YWN0bHkgd2hhdCBteSBwcm9wb3NhbCBkb2VzLCBpdCdzIGp1c3QgdGhh
dCB0aGUgdXNlcnNwYWNlIHNheXMKPiB3aGF0IGlzICJuZWVkZWQiLgo+Cj4gSWYgd2Ugc3RhcnRl
ZCB3aXRoIHRoaXMgbWVjaGFuaXNtLCBLVk0gd291bGQgbm90IGhhdmUgbmVlZGVkIHRvIGFkZAo+
IFNSU1QvU1VTUC9EQkNOIFNCSSBlbXVsYXRpb24gYXQgYWxsIC0tIHRoZXkgd291bGQgYmUgZm9y
d2FyZGVkIGFzIGFueQo+IG90aGVyIHVuaGFuZGxlZCBlY2FsbC4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
