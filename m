Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B475E77180
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S4U7TRryWg2j1m2GRT+7tb0bSysTX9HXcryq35xtxf4=; b=2/pswpcKAaRnWJHHxFIF0yWgCH
	+Nto+yhfHbClHKonuyHjXVE209CVFSvGRG92jt1W1GwRXuW93Uuh3kgHhhWlrcXha/uCZnZBMkyAr
	SPU8AWA6ZcYp4zQhZYl+vhcxY82wvKWRb2HJE16jxz9lKp6rbBFhWahgBJVmJKmi2R3X2hhKhT2O6
	FMx+N32etEKwZ2bUUIfQbPJuhgCXU7a3vAsexUqs2nsQzyUdvKnceTPrTerGhs1Tm9nc+VEyWHFSF
	OchiGDV3ZqQUcAVl64kk2A9Xs7DPII+WcCwL/5/tX+X3QTjOJ21MIeXZr5rdxH6I3Slc8GgGXeJcb
	9KFgtdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0gA-000000032Ji-0bsU;
	Fri, 13 Dec 2024 08:05:42 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0ee-000000031xv-2auO;
	Fri, 13 Dec 2024 08:04:10 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54FCB25401E2;
	Fri, 13 Dec 2024 03:04:04 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 03:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734077044;
	 x=1734163444; bh=xkdaBG8UMFyF010HWwrn18x+gfYMEYxilRcPMsaZiVs=; b=
	kwRlWruOQXnYuoGU4ct7wnbZzpq8GbzYC5uXTtj+ieZM03zuV+Tt9PLNpT0OkMP6
	K+i+RioQx0MTsgKt/M2b/PppfO3/x8ivdmXMgbKUtmfNssVe+GGwRCqCkPq5bfbN
	N8dyhtPQ4Y8dIw971ni0aAoroFXoZxvgetECTodVWa9EpbwIvPIt4iAHApW4roYn
	PLrV8oyDOOASxjzAJyxzXvs+w4ofKcTCDsZGygnEaPjBbVKKTcJ7ROn5U4zmudTy
	pHmGayBV63ZE/DwrQOOgYnfHnYBuEJEH5T2XxdxRUAamVnwYsphSP+hCQiLbMifs
	oeM1bdqzKH8E+n2zDWnHaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734077044; x=
	1734163444; bh=xkdaBG8UMFyF010HWwrn18x+gfYMEYxilRcPMsaZiVs=; b=w
	f5Gfd1bCGgDhcncBvskPNse389eQ0QEfGBCs/NoAeMsbZBsXO0YkbIDC96jSrJMp
	cNCa/5XjhA9LfhZLrr53T1E4loiHvDt1z6QQB8J1wFfiLQFQKw8FXuqapGsrT7H3
	3aygnrdo/gs3YOJRdiVQ//Rs2j4wszfdrvufgk8UlHWrhRdlWosh1d47qkqAAYmB
	khTX32HWGUwaBjac774RnINOTDWu5CQPe6Ug4YkIu7urQDpHwn157ajEAIblPN1d
	PXruLjz38Mj0+8MiAVWehfM8jxaCtTPZqVTvceHDBYe0vw7bdf7vvMez/f94RXZJ
	FGQnbO2l3OSOVvbmRJsgA==
X-ME-Sender: <xms:cepbZwHYOLdK2uLiclp-OM6t1Q7gEnVCC9TlLMzbw6ClQ1So0jUu5g>
    <xme:cepbZ5X6JlxRboE-OfGKmIOU19X6A6KLzaGL6IIsRwzSmlXK0mcMvG9MPVdsEZmsw
    ZN8TN8gQeTOoFz0KY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeeigdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeeh
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrrghfsegrmhgriihonhdrtghomhdprhgtphhtthhopegrthhishhhphesrg
    htihhshhhprghtrhgrrdhorhhgpdhrtghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhl
    thdrohhrghdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghp
    thhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruh
X-ME-Proxy: <xmx:cepbZ6LndnD8ZSZeGggeTF_B5V_DgMVWx-1ulNhV23ajSDoVV-Ti_w>
    <xmx:cepbZyGY9wBofw83hXJKg-3q6hMTZIhwUkue-0Cp7reEPrBTSbMuKQ>
    <xmx:cepbZ2UwyfQQq1czPmiqjUcFhf7znIqD5iwIE5qoLNE82ddwPCTk7Q>
    <xmx:cepbZ1P1Jq82_ZoB3xLrj4H6gt9wqcGRFechLH3v8hR7FqCjabg6Sw>
    <xmx:dOpbZw0XsZIrhDEJP9jq1aOwBLm0frAM5cG3_b5M1E0thNTIztJg5TAk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A3682220072; Fri, 13 Dec 2024 03:04:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 09:03:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: kvm@vger.kernel.org, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
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
Message-Id: <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
In-Reply-To: <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_000409_089171_07467E26 
X-CRM114-Status: GOOD (  15.35  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQsIGF0IDA0OjUxLCBBLiBXaWxjb3ggd3JvdGU6Cj4gT24gRGVj
IDEyLCAyMDI0LCBhdCA2OjU14oCvQU0sIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+IAo+PiBJIHN1
Ym1pdHRlZCBhIHBhdGNoIHRvIHJlbW92ZSBLVk0gc3VwcG9ydCBmb3IgeDg2LTMyIGhvc3RzIGVh
cmxpZXIKPj4gdGhpcyBtb250aCwgYnV0IHRoZXJlIHdlcmUgc3RpbGwgY29uY2VybnMgdGhhdCB0
aGlzIG1pZ2h0IGJlIHVzZWZ1bCBmb3IKPj4gdGVzdGluZyAzMi1iaXQgaG9zdCBpbiBnZW5lcmFs
LCBhcyB0aGF0IHJlbWFpbnMgc3VwcG9ydGVkIG9uIHRocmVlIG90aGVyCj4+IGFyY2hpdGVjdHVy
ZXMuIEkgaGF2ZSBnb25lIHRocm91Z2ggdGhvc2UgdGhyZWUgbm93IGFuZCBwcmVwYXJlZCBzaW1p
bGFyCj4+IHBhdGNoZXMsIGFzIGFsbCBvZiB0aGVtIHNlZW0gdG8gYmUgZXF1YWxseSBvYnNvbGV0
ZS4KPj4gCj4+IFN1cHBvcnQgZm9yIDMyLWJpdCBLVk0gaG9zdCBvbiBBcm0gaGFyZHdhcmUgd2Fz
IGRyb3BwZWQgYmFjayBpbiAyMDIwCj4+IGJlY2F1c2Ugb2YgbGFjayBvZiB1c2VycywgZGVzcGl0
ZSBDb3J0ZXgtQTcvQTE1L0ExNyBiYXNlZCBTb0NzIGJlaW5nCj4+IG11Y2ggbW9yZSB3aWRlbHkg
ZGVwbG95ZWQgdGhhbiB0aGUgb3RoZXIgdmlydHVhbGl6YXRpb24gY2FwYWJsZSAzMi1iaXQKPj4g
Q1BVcyAoSW50ZWwgQ29yZSBEdW8vU2lsdmVydGhvcm5lLCBQb3dlclBDIGUzMDAvZTUwMC9lNjAw
LCBNSVBTIFA1NjAwKQo+PiBjb21iaW5lZC4KPgo+Cj4gSSBkbyB1c2UgMzItYml0IEtWTSBvbiBh
IENvcmUgRHVvIOKAnFlvbmFo4oCdIGFuZCBhIFBvd2VyIE1hYyBHNCAoTUREKSwgZm9yCj4gcHVy
cG9zZXMgb2YgYmlzZWN0aW5nIGtlcm5lbCBpc3N1ZXMgd2l0aG91dCBoYXZpbmcgdG8gcmVib290
IHRoZSBob3N0Cj4gbWFjaGluZSAod2hlbiBpdCBjYW4gYmUgZHVwbGljYXRlZCBpbiBhIEtWTSBl
bnZpcm9ubWVudCkuCj4KPiBJIHN1cHBvc2UgaXQgd291bGQgc3RpbGwgYmUgcG9zc2libGUgdG8g
cnVuIHRoZSBob3N0cyBvbiA2LjEyIExUUyBmb3IKPiBzb21lIHRpbWUgd2l0aCBuZXdlciBndWVz
dHMsIGJ1dCBpdCB3b3VsZCBiZSB1bmZvcnR1bmF0ZS4KCldvdWxkIGl0IGJlIGFuIG9wdGlvbiBm
b3IgeW91IHRvIGp1c3QgdGVzdCB0aG9zZSBrZXJuZWxzIG9uIDY0LWJpdAptYWNoaW5lcz8gSSBh
c3N1bWUgeW91IHByZWZlciB0byBkbyBuYXRpdmUgYnVpbGRzIG9uIDMyLWJpdCBoYXJkd2FyZQpi
ZWNhdXNlIHRoYXQgZml0cyB5b3VyIHdvcmtmbG93LCBidXQgb25jZSB5b3UgZ2V0IGludG8gZGVi
dWdnaW5nCmluIGEgdmlydHVhbCBtYWNoaW5lLCB0aGUgcmVzdWx0cyBzaG91bGQgZ2VuZXJhbGx5
IGJlIHRoZSBzYW1lIHdoZW4KYnVpbGRpbmcgYW5kIHJ1bm5pbmcgb24gYSA2NC1iaXQgaG9zdCBm
b3IgYm90aCB4ODYtMzIgYW5kIHBwYzMyLWNsYXNzaWMsCnJpZ2h0PwoKICAgICAgQXJuZAoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
