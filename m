Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E098DE77182
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qAYbbDIbEWmOblil7e4bUIJ5RzvFLi8GDwus2zCVyCA=; b=WsTNOYhANnQHqPTbsr6LPmwCzG
	i7qm5VJPe5LxYra+BNW+LT6xgwUvolql8DrjfqQ4UnAxb20RikP8XhCNiTG2XZfNzmb0l27h3tbbX
	MOE1yBrSckE/6xwaIwf2r+TaJtFXqmX9ekQrrp43ghpBOCq7BA2fDBX164vg4mSrREyjGPjaacT2o
	O6STXrJgJqAecY2AAdXh+vkjC1d4lpnOqz8pi5q2uVVjoGTqNxNkUPPDm0/STWsMv6qm6nkPoAKH6
	YfMm69FU+bIVU2MGtymAfXeBpGmhuR+W2CMWG3rQP40xu4SxyAcULrjlc33ClhwgNB8uBdNSPqx+H
	nG0uU0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqQj-00000001uHs-2kV8;
	Thu, 12 Dec 2024 21:09:05 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqQg-00000001uGw-1m8m;
	Thu, 12 Dec 2024 21:09:03 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 8EE3F1383EA7;
	Thu, 12 Dec 2024 16:09:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 12 Dec 2024 16:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734037740;
	 x=1734124140; bh=9IqZ6rAQRKbEW2J4TH6/7CA/VSmhrZDWQ3WoMQkxePk=; b=
	sI9WQo0hT8RZfeLkFWtOxYBaixCFsKGWtj1oeld5wv+OdD59xfdJ/DXtsqqA5hQt
	iqOuvNi/VCCSpWXoYZS39BY5IDFhiWrgN7uGOEI80sW1mD86lUNNrJYsuinhpIUd
	yIhPLs4TywRs8rOz9rzJVi1JgzrdiimkQ65PkMgb0vc72c6LR+JnVMGUs4NEk77r
	sTzT5VObzwIahbjTu14Sn072AKr3QmyqW4t6gUI+fj8oxqiYAtMZnJGpw6KFvWj9
	/oN1Ya0/vGY1kQzpziYR1O6rbYPBKcOKtWSh2D/iBJcvpmOMOKrODid3HPvM9yZy
	4mjyZbZRdPqpqpSkulf93g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734037740; x=
	1734124140; bh=9IqZ6rAQRKbEW2J4TH6/7CA/VSmhrZDWQ3WoMQkxePk=; b=V
	2xBxaHcyH7nhSIq8a4Shpv1fzPD4TS4/o7IMn+qgKdxGHqV8eH8bVojf4NDKmYId
	wQ5mTyohsX3YXFFFXfGAVLTVSHsgcVGB32ZuEuPEcsvKgPnNjr/ytl8Rol4AdGUH
	z4RYUE/LTQ4TSRFibOFJaAUAU9Y1y3XSO4DmEg/vuNB3umXTPRa+lqY4thL/yeSX
	+gWisPsU3ubkDeY87y6wmDYrll/Y7H8BuqaYXv7BQKRu+NAHz633wh9LSFMjsRCc
	Sl9zQV4xpWiKN9OVoZ2hImjbuMrL8rLGDuVpu5KmhMLyFaTOGnXlPY4RfqWnGL3Q
	tyRAAaDN7xrgHEaKtYX0A==
X-ME-Sender: <xms:6lBbZyw5SFn4lKEQCjXQULlKKQ3fuezYL-a0vCHYGD3K-FVjpKNC4A>
    <xme:6lBbZ-T7owsIHjUc1TlBe8pyoFKFV3A4XgfmG_C3lywr1GwU4Q9tIxa9IUfSJ4uZZ
    5abI64AlwCYCLWcu3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeehgddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrrghfsegrmhgriihonhdrtghomhdprhgtphhtthhopegrthhishhhphesrg
    htihhshhhprghtrhgrrdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhl
    thdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghp
    thhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:6lBbZ0VwsS4U5Dh3P7otMqmSIAVEsOO6G7LJsCShu6InWS5ECnRScA>
    <xmx:6lBbZ4g36ua-0NY8XWqhtFeQFSxll2Gb7OcvFB5JwEkVcXBPt7efZw>
    <xmx:6lBbZ0CZQR2tq0T2mN9rDgYjaqBp7grBCA0XYnDCiY-g_gO8TIGx1w>
    <xmx:6lBbZ5JchKyroSqzawYqmB-bFcM24AfcbmVsrLAOC-nqaNsZvK-LMA>
    <xmx:7FBbZ-xtl9XJ4zczjb9ueyrbQc4qE0emOqr48sDEu3vHDq2m0T8uPYzW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 134EC2220072; Thu, 12 Dec 2024 16:08:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 12 Dec 2024 22:08:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
In-Reply-To: <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-3-arnd@kernel.org>
 <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
Subject: Re: [RFC 2/5] powerpc: kvm: drop 32-bit booke
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_130902_527980_30E75293 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBEZWMgMTIsIDIwMjQsIGF0IDE5OjM1LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDEyLzEyLzIwMjQgw6AgMTM6NTUsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KCj4+IAo+PiBTdXBwb3J0IGZvciA2NC1i
aXQgaG9zdHMgcmVtYWlucyB1bmNoYW5nZWQsIGZvciBib3RoIDMyLWJpdCBhbmQKPj4gNjQtYml0
IGd1ZXN0cy4KPj4gCgo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdm1fYm9vazNzXzMy
LmggICAgfCAgMzYgLS0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jvb2tlLmgg
ICAgICAgIHwgICA0IC0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jvb2tlX2h2
X2FzbS5oIHwgICAyIC0KPj4gICBhcmNoL3Bvd2VycGMva3ZtL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgIHwgIDIyICstCj4+ICAgYXJjaC9wb3dlcnBjL2t2bS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICB8ICAxNSAtCj4+ICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfMzJfbW11X2hvc3Qu
YyAgICAgICB8IDM5NiAtLS0tLS0tLS0tLS0tLQo+PiAgIGFyY2gvcG93ZXJwYy9rdm0vYm9va2Uu
YyAgICAgICAgICAgICAgICAgICAgfCAyNjggLS0tLS0tLS0tLQo+PiAgIGFyY2gvcG93ZXJwYy9r
dm0vYm9va2UuaCAgICAgICAgICAgICAgICAgICAgfCAgIDggLQo+PiAgIGFyY2gvcG93ZXJwYy9r
dm0vYm9va2VfZW11bGF0ZS5jICAgICAgICAgICAgfCAgNDQgLS0KPj4gICBhcmNoL3Bvd2VycGMv
a3ZtL2Jvb2tlX2ludGVycnVwdHMuUyAgICAgICAgIHwgNTM1IC0tLS0tLS0tLS0tLS0tLS0tLS0K
Pj4gICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2tlaHZfaW50ZXJydXB0cy5TICAgICAgIHwgMTAyIC0t
LS0KPj4gICBhcmNoL3Bvd2VycGMva3ZtL2U1MDAuYyAgICAgICAgICAgICAgICAgICAgIHwgNTUz
IC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgYXJjaC9wb3dlcnBjL2t2bS9lNTAwLmggICAgICAg
ICAgICAgICAgICAgICB8ICA0MCAtLQo+PiAgIGFyY2gvcG93ZXJwYy9rdm0vZTUwMF9lbXVsYXRl
LmMgICAgICAgICAgICAgfCAxMDAgLS0tLQo+PiAgIGFyY2gvcG93ZXJwYy9rdm0vZTUwMF9tbXVf
aG9zdC5jICAgICAgICAgICAgfCAgNTQgLS0KPj4gICBhcmNoL3Bvd2VycGMva3ZtL2U1MDBtYy5j
ICAgICAgICAgICAgICAgICAgIHwgICA1ICstCj4+ICAgYXJjaC9wb3dlcnBjL2t2bS90cmFjZV9i
b29rZS5oICAgICAgICAgICAgICB8ICAxNCAtCj4+ICAgMTcgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyMTk0IGRlbGV0aW9ucygtKQo+PiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jvb2szc18zMi5oCj4+ICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzMyX21tdV9ob3N0LmMKPj4gICBkZWxldGUgbW9k
ZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2t2bS9ib29rZV9pbnRlcnJ1cHRzLlMKPj4gICBkZWxldGUg
bW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2t2bS9lNTAwLmMKPgo+IExlZnQgb3ZlciA/Cj4KPiBh
cmNoL3Bvd2VycGMva2VybmVsL2hlYWRfYm9va2UuaDojaW5jbHVkZSA8YXNtL2t2bV9hc20uaD4K
PiBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfYm9va2UuaDojaW5jbHVkZSA8YXNtL2t2bV9ib29r
ZV9odl9hc20uaD4KPiBhcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfYm9va2UuaDogICAgICAgYiAK
PiBrdm1wcGNfaGFuZGxlcl9caW50bm9cKClfXHNycjEKCkFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0
aGVzZSBhcmUgc3RpbGwgbmVlZGVkIGZvciBlNTUwMC9lNjUwMCwKYnV0IHlvdSBrbm93IG1vcmUg
YWJvdXQgdGhlIHBsYXRmb3JtIHRoYW4gSSBkby4KCiAgICAgICBBcm5kCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
