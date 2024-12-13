Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835E0E7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aQsprNb0lAXB07cCLxOcV5uqW3T7akMRSyZda66m+n0=; b=k9kawJuGoxt1GYPP82Tq5RXh3o
	xf8kbJ3kTDw03y7zF40aRPxo2rhIjB0falFSYNxp0noat35ZBTekZxde9W64XcTeKb+g8Ta6Mdeis
	ZMXqnlPOZDg90C77HoOd02NJ+38pKKL1VD5l4yFSbCQTSmDfihXlDKa+BJ2ZoFYlPQwgSHAsPo7ON
	qKpiR/EniDrrdF6FI1xlSy2GGvyrr8bIlDnRlE+HBQloU6n3ldyP+WytDp9wPsO3vazOrBfijrUAl
	nkUF0mOJnq1xr+5HDIPB+nQaMHb26grufk2hxsvAbK9NvKJN3OmWmN4WBIDSLy0+k7hIBSFDPHpmx
	ToBPA1IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1Yu-00000003Agq-1Dbh;
	Fri, 13 Dec 2024 09:02:16 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1YY-00000003AZE-3yP2;
	Fri, 13 Dec 2024 09:01:56 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 6EFA31140122;
	Fri, 13 Dec 2024 04:01:52 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 04:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734080512;
	 x=1734166912; bh=KcDskYQHGeNJcKXr8vywUEry2qDL5/kORB9rm8d5fFw=; b=
	dK9y/1FdaKVIktwmmYapHHaxHxKc0BP7khWZUu3r7h1f0sQlQa4dZFPSsaSQt+Iu
	B59X/dAUbnp20AR2b786YF8D04YF58T1uzpW4lVTmgKyAEab9Odf3JWSG6PLCL2r
	cIBOAzkixOIZmoUsK62qOojH4jNcAbztjeKbDhOgibIe3Pv/NGMWaHo/551gaUP3
	sYnTI2POMGTHtEOcGVgbt5DO2eYOveMqn918pRMgcp7dbwcqpo9bBJLGMfiMBzQu
	ZgX08C35wFu1QYADEBx+IIquX5cS6Xc25HusMbbwZaSKCdWGJy+GQnHJfrJeMFRA
	ys2/b38Gqv72zFx/0driDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734080512; x=
	1734166912; bh=KcDskYQHGeNJcKXr8vywUEry2qDL5/kORB9rm8d5fFw=; b=y
	9jkp9U1MIwaisuqjg7nK41SoLvyk0NQkR82Usqh9Dw4HGzL7mRtCj1li+xZ9MUoS
	T+iUdxLdpng7pksc/57Tbo2FGZLssQXYXp88cbvtg++tjPJvLhOu9qqwRxe+ZtPw
	4VZcyTgnCWf6+CvTWGxl4WBTXuAHInOohNNk9cigaf/oW9YowizNTnLuvvEYhlw8
	p/NNVd1Mz9oC0oDs7Mqxs4UJ9bMb1r0tT0IE+Z3nMIUpN6/PeX23PxN5DKw6xsXe
	agDUIFGvMUWekQaR3CN8811GJyJW4h1kgALJ95ARgDCRa1aYbbE2asyLTMDV4til
	4uK1t6tSG4opJ6lzQwIvg==
X-ME-Sender: <xms:_vdbZ0qTnQBR86V-26V7PwhiMt6EEOYyMJdQegNWyfIcMUul5BQDMg>
    <xme:_vdbZ6pOmhGV-0SqTm9SVZhXl3Esg36401-Xn-9c04EyxA_rLCt4YIUf7_WGeZQPr
    h7mA5Z75gO13wD9K68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeeigdduvdeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:_vdbZ5OSeAlRqL3zOYYLR1X80rYHtqF6jBXE73wHfeMrnsspuNFT7Q>
    <xmx:_vdbZ77mbTrJNcWXjBhg21C-rqRNfaAmqyeKfarmU1qDt_y02i9PgA>
    <xmx:_vdbZz63hVVtxzP8SiiuBk7PK7jRHjcw-DvalTx04b58_fplYVXqag>
    <xmx:_vdbZ7hVn74LynEuieqMVfKOF46Ga4XVKlg6Bvd6Bg6xYi1WPJklbQ>
    <xmx:APhbZ4YwaWQ6QTbli2kpKoPosiJj5J8RDuON2m1n3uQoKbesPqFgt2Ao>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CD88F2220072; Fri, 13 Dec 2024 04:01:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 10:01:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "A. Wilcox" <AWilcox@wilcox-tech.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>, kvm@vger.kernel.org,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
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
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <1c8ce6c9-6693-4cfb-8e40-3a641734daff@app.fastmail.com>
In-Reply-To: <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
 <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
 <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_010155_040942_B2197C3B 
X-CRM114-Status: GOOD (  17.60  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQsIGF0IDA5OjQyLCBBLiBXaWxjb3ggd3JvdGU6Cj4KPiBBcyBm
b3IgUG93ZXI6IEkgd2lsbCBhZG1pdCBJIGhhdmVu4oCZdCB0ZXN0ZWQgbGF0ZWx5LCBidXQgd2Vs
bCBpbnRvCj4gdGhlIDUgc2VyaWVzICg1LjQsIGF0IGxlYXN0KSwgeW91IGNvdWxkbuKAmXQgYm9v
dCBhIHBwYzMyIExpbnV4IGtlcm5lbAo+IG9uIGFueSA2NC1iaXQgY2FwYWJsZSBoYXJkd2FyZS4g
IEl0IHdvdWxkIHRocm93IHdoYXQgSSBiZWxpZXZlIHdhcyBhbgo+IGFsaWdubWVudCBlcnJvciB3
aGlsZSBxdWllc2NpbmcgT3BlbkZpcm13YXJlIGFuZCB0b3NzIHlvdSBiYWNrIHRvIGFuCj4g4oCY
b2sgPuKAmSBwcm9tcHQuICBVbmZvcnR1bmF0ZWx5IEkgY2Fu4oCZdCBmaW5kIGFueSBvZiB0aGUg
YnVnIHJlcG9ydHMKPiBvciBNTCB0aHJlYWRzIGZyb20gdGhlIHRpbWUgLSBpdCB3YXMgYSBrbm93
biBidWcgaW4gdGhlIDIuNiBkYXlzIC0gYnV0Cj4gdGhlIGFuc3dlciB3YXMgYWx3YXlzIOKAnHdo
eSBhcmUgeW91IGJvb3RpbmcgYSBwcGMzMiBrZXJuZWwgb24gdGhhdAo+IGhhcmR3YXJlIGFueXdh
eT8gIEl04oCZcyBhIHBwYzY0IG1hY2hpbmUh4oCdICBJcyB0aGlzIGEgY2FzZSB3aGVyZQo+IHRo
YXQgd291bGQgYmUgYWNjZXB0ZWQgYXMgYSBsZWdpdGltYXRlIGJ1ZyBub3c/ICBJdCB3b3VsZCBi
ZSBsb3ZlbHkKPiB0byB1c2UgbXkgbGFyZ2VseS1TTVQgMy4wIEdIeiBQb3dlcjkgYm94IGZvciBt
b3JlIG9mIG15IGtlcm5lbCB0ZXN0aW5nCj4gKHdoZXJlIHBvc3NpYmxlKSBpbnN0ZWFkIG9mIHJl
bHlpbmcgb24gYSA5MzMgTUh6IHNpbmdsZS10aHJlYWQgRzQuCgpJJ20gZmFpcmx5IHN1cmUgd2Ug
ZG9uJ3QgYWxsb3cgYm9vdGluZyAzMi1iaXQga2VybmVscyBvbgp0aGUgNjQtYml0IElCTSBDUFVz
IChnNSwgY2VsbCwgUE9XRVIpLCBidXQgYXMgQ2hyaXN0b3BoZQptZW50aW9uZWQgZWFybGllciwg
eW91IGNhbiBhcHBhcmVudGx5IHJ1biBhIDMyLWJpdCBlNTAwCmtlcm5lbCA2NC1iaXQgUW9ySVEu
CgpXaGF0IEkgd2FzIHRoaW5raW5nIG9mIGlzIHB1cmVseSBpbnNpZGUgb2YgcWVtdS9rdm0uIEkg
aGF2ZQpub3QgdHJpZWQgdGhpcyBteXNlbGYsIGJ1dCBJIHNhdyB0aGF0IHRoZXJlIGlzIGNvZGUg
dG8gaGFuZGxlCnRoaXMgY2FzZSBpbiB0aGUga2VybmVsLCBhdCBsZWFzdCBmb3IgUFIgbW9kZToK
CnN0YXRpYyB2b2lkIGt2bXBwY19zZXRfcHZyX3ByKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMy
IHB2cikKewogICAgICAgIHUzMiBob3N0X3B2cjsKCiAgICAgICAgdmNwdS0+YXJjaC5oZmxhZ3Mg
Jj0gfkJPT0szU19IRkxBR19TTEI7CiAgICAgICAgdmNwdS0+YXJjaC5wdnIgPSBwdnI7CiAgICAg
ICAgaWYgKChwdnIgPj0gMHgzMzAwMDApICYmIChwdnIgPCAweDcwMzMwMDAwKSkgewogICAgICAg
ICAgICAgICAga3ZtcHBjX21tdV9ib29rM3NfNjRfaW5pdCh2Y3B1KTsKICAgICAgICAgICAgICAg
IGlmICghdG9fYm9vazNzKHZjcHUpLT5oaW9yX2V4cGxpY2l0KQogICAgICAgICAgICAgICAgICAg
ICAgICB0b19ib29rM3ModmNwdSktPmhpb3IgPSAweGZmZjAwMDAwOwogICAgICAgICAgICAgICAg
dG9fYm9vazNzKHZjcHUpLT5tc3JfbWFzayA9IDB4ZmZmZmZmZmZmZmZmZmZmZlVMTDsKICAgICAg
ICAgICAgICAgIHZjcHUtPmFyY2guY3B1X3R5cGUgPSBLVk1fQ1BVXzNTXzY0OwogICAgICAgIH0g
ZWxzZQogICAgICAgIHsKICAgICAgICAgICAgICAgIGt2bXBwY19tbXVfYm9vazNzXzMyX2luaXQo
dmNwdSk7CiAgICAgICAgICAgICAgICBpZiAoIXRvX2Jvb2szcyh2Y3B1KS0+aGlvcl9leHBsaWNp
dCkKICAgICAgICAgICAgICAgICAgICAgICAgdG9fYm9vazNzKHZjcHUpLT5oaW9yID0gMDsKICAg
ICAgICAgICAgICAgIHRvX2Jvb2szcyh2Y3B1KS0+bXNyX21hc2sgPSAweGZmZmZmZmZmVUxMOwog
ICAgICAgICAgICAgICAgdmNwdS0+YXJjaC5jcHVfdHlwZSA9IEtWTV9DUFVfM1NfMzI7CiAgICAg
ICAgfQouLi4KClNvIEkgYXNzdW1lZCB0aGlzIHdvdWxkIHdvcmsgdGhlIHNhbWUgd2F5IGFzIG9u
IHg4NiBhbmQgYXJtLAp3aGVyZSB5b3UgY2FuIHVzZSB0aGUgMzItYml0IG1hY2hpbmUgZW11bGF0
aW9uIGZyb20gcWVtdSBidXQKc3RpbGwgZW5hYmxlIEtWTSBtb2RlLgoKICAgICAgQXJuZAoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
