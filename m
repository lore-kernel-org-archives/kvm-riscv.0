Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA63E7717F
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mny7652mXhb435Y63QhQ2/sC/dsMCVsodFjjl6S71Jo=; b=Z9UhoBWnROrrAu6N4arA1uPECM
	FaWqQhMz/tQVx/F+CPLXdtjOZnNegNKJSgEpHjjmJiqNuh+fUbnN/6l/rx4Ne9XwhlE1VrbYchWKY
	gS6jl7759ahCznyOJkJYzlGtOwcCdN6oE/rcx//CJXxwiJJn1Aidrz5ESLvn3DlSG8d3NutTGRkPj
	gCKB72K54ldDuYJPWGvpbnNBrO6ql43p8U+eqpPLr19IFtsQ06iZGSipu77DK0GgdTIRPiV8g6+5o
	V3PEEZWbYJ8qkNW67XbYcdLk+gjWPrF6XptAtwAICRCqJDSxDRnrH1fufw/nd8i7dyZbMEjO8fOfA
	h/KFCEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2nB-00000003PAc-2GLB;
	Fri, 13 Dec 2024 10:21:05 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2mr-00000003P1e-23r3;
	Fri, 13 Dec 2024 10:20:47 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 49C4911401EE;
	Fri, 13 Dec 2024 05:20:43 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 05:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734085243;
	 x=1734171643; bh=IMb1NpbRY5gQZp1GGEw6l+bgS26lmUCIQ/gBSo44bCo=; b=
	hafosO0pH2ac5V+nw0ZbLPTQPoCnj1AnMwiOphXwbkjr1QUumcWVOk+JCGzm6Vmb
	73nqdZMrmCmbHyU430dG2gjy4tDZ775WHwtR1MEiSYXwTfywli7b0zEMaHRIHSdh
	AE1H13704vBMNuzvJODkJQy5lG3XYE8HkHgINCpxlVFDfzg/PQLu7yYC/1vmOkH0
	E54PHfiAFIW5yl+zCHy2iUwzwK/6xX7NSwLqi228bb0yomLI8MToIL3qwswfCmQM
	H3tRpqyfS+mteHS16dbMR/ErgM0WNxEU8A5AIv16aghWGbSONNMlbfWQzebOKNYd
	/KFQCy5py8tXpXUFgRjg9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734085243; x=
	1734171643; bh=IMb1NpbRY5gQZp1GGEw6l+bgS26lmUCIQ/gBSo44bCo=; b=3
	x+4DxUUnFK1oAP04tuB+w/czp3uTokr/Zg9W2b9Zjm630zQGMrBTi7LlvsthmHDF
	v4/n4Fk4g3Zagod+Xc9JyXFWFP5vYTDp5rWmaacipX4mnVDIVKTSojdJ4ioU3A8e
	uwscCfAdWDaV9O09NNUUAkQKVJJMfdiUNxixyh5bJkbTYqKbyuiwtR4YuVDr5LD9
	sflY9mRXNWdt8qb9634QVNe4BzlqbJY1+OrSMiXI653DnKhnRhvf7yZ5LoZqpcc0
	tgtckn6lJN1umcAb3hw3qpJo7MmWcZNcnZhsiwXXq9wRyHrrZJUMx2iIUqYUhNWW
	yVFIUsb95eoywfolRo4qQ==
X-ME-Sender: <xms:eQpcZ3huzLNM1lDyiMsvx3zdY-XIPlyj85bTVQ28NNItrL90D4PEBw>
    <xme:eQpcZ0D14Gc52X5S5ZtfNduM96IUCXe7iD_C4IjaB9BHFrGbc9FpC4kwx3NgdVEmJ
    TFesn6TphuzzfUsCKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpeevgfeigeffgfekteehvedvlefhgeeghedvfedukeeu
    keeugfetveeludeuieehtdenucffohhmrghinhephhgvrggupgekheiggidrshgsnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepfeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnuges
    rghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrrghfsegrmhgriihonh
    drtghomhdprhgtphhtthhopegrthhishhhphesrghtihhshhhprghtrhgrrdhorhhgpdhr
    tghpthhtoheprghnuhhpsegsrhgrihhnfhgruhhlthdrohhrghdprhgtphhtthhopegthh
    hrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepphgr
    lhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvg
    hrkhgvlhgvhidrvgguuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgr
    uh
X-ME-Proxy: <xmx:eQpcZ3FEgOWNkcGeKkURorYx6QvueeNLqkuTc_Hwx94hTEsT9_8MjA>
    <xmx:egpcZ0QWKlBjJmj7g4B_YZtG_NZWIGeroqsXKuAsAsZjN5Mq79wB0g>
    <xmx:egpcZ0xX4KzLhFwxphxSuo4EEuBLRe9OFVrz62tF1b5HJgyn_Ncy0A>
    <xmx:egpcZ64P6gxah9oEjaEyU5qKQVeZk6phMOorf8qb-RmlMlHNpRDZvA>
    <xmx:ewpcZyi2q0m3LnnLOp-IJ-luaQ5vhyjpu8MHEogB8umRK8eOuJjQ2PhV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D070E2220072; Fri, 13 Dec 2024 05:20:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 11:20:21 +0100
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
Message-Id: <43a3765d-709b-4583-ad27-f9bb46a88440@app.fastmail.com>
In-Reply-To: <1f1beb34-65cc-4038-a8b2-de8af3e0703e@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-3-arnd@kernel.org>
 <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
 <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
 <1f1beb34-65cc-4038-a8b2-de8af3e0703e@csgroup.eu>
Subject: Re: [RFC 2/5] powerpc: kvm: drop 32-bit booke
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022045_591962_95C6F10B 
X-CRM114-Status: GOOD (  15.92  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQsIGF0IDA3OjI1LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDEyLzEyLzIwMjQgw6AgMjI6MDgsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPgo+IFNv
IHllcyBpdCBpcyB1c2VkIG9uIGU1NTAwL2U2NTAwIGJ1dCBvbmx5IHdoZW4gdGhleSBydW4gYSAz
MiBiaXRzIGtlcm5lbCAKPiBidWlsdCB3aXRoIENPTkZJR19QUENfODV4eC4gSXNuJ3QgaXQgd2hh
dCB5b3Ugd2FudCB0byBnZXQgcmlkIG9mIHdpdGggCj4gdGhpcyBwYXRjaCA/Cj4KPiBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nID8KCkkgdGhpbmsgSSBtaXhlZCB1cCBDT05GSUdfUFBDX0U1MDAgYW5k
IENPTkZJR19QUENfODV4eCBhbmQgaGFkbid0CnJlYWxpemVkIHRoYXQgd2UgdXNlIENPTkZJR19Q
UENfQk9PSzNFXzY0IGluc3RlYWQgb2YgUFBDXzg1eHggZm9yCnRoZSA2NC1iaXQgbW9kZS4gSSBm
b3VuZCBhIGZldyBtb3JlIHRoaW5ncyB0aGF0IGNhbiBiZSByZW1vdmVkCm5vdyBhbmQgZm9sZGVk
IGluIHRoZSBwYXRjaCBiZWxvdywgd2hpY2ggaW5jbHVkZXMgeW91ciBzdWdnZXN0aW9ucy4KCiAg
ICAgQXJuZAoKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF84NXh4LlMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL2hlYWRfODV4eC5TCmluZGV4IGY5YTczZmFlNjQ2NC4uNjYxOTAz
ZDMxYjU0IDEwMDY0NAotLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfODV4eC5TCisrKyBi
L2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF84NXh4LlMKQEAgLTQyNSwxNiArNDI1LDEwIEBAIGlu
dGVycnVwdF9iYXNlOgogCW10c3ByCVNQUk5fU1BSR19XU0NSQVRDSDAsIHIxMCAvKiBTYXZlIHNv
bWUgd29ya2luZyByZWdpc3RlcnMgKi8KIAltZnNwcglyMTAsIFNQUk5fU1BSR19USFJFQUQKIAlz
dHcJcjExLCBUSFJFQURfTk9STVNBVkUoMCkocjEwKQotI2lmZGVmIENPTkZJR19LVk1fQk9PS0Vf
SFYKLUJFR0lOX0ZUUl9TRUNUSU9OCi0JbWZzcHIJcjExLCBTUFJOX1NSUjEKLUVORF9GVFJfU0VD
VElPTl9JRlNFVChDUFVfRlRSX0VNQl9IVikKLSNlbmRpZgogCXN0dwlyMTIsIFRIUkVBRF9OT1JN
U0FWRSgxKShyMTApCiAJc3R3CXIxMywgVEhSRUFEX05PUk1TQVZFKDIpKHIxMCkKIAltZmNyCXIx
MwogCXN0dwlyMTMsIFRIUkVBRF9OT1JNU0FWRSgzKShyMTApCi0JRE9fS1ZNCUJPT0tFX0lOVEVS
UlVQVF9EVExCX01JU1MgU1BSTl9TUlIxCiBTVEFSVF9CVEJfRkxVU0hfU0VDVElPTgogCW1mc3By
IHIxMSwgU1BSTl9TUlIxCiAJYW5kaS4gcjEwLHIxMSxNU1JfUFIKQEAgLTUxNywxNiArNTExLDEw
IEBAIEVORF9CVEJfRkxVU0hfU0VDVElPTgogCW10c3ByCVNQUk5fU1BSR19XU0NSQVRDSDAsIHIx
MCAvKiBTYXZlIHNvbWUgd29ya2luZyByZWdpc3RlcnMgKi8KIAltZnNwcglyMTAsIFNQUk5fU1BS
R19USFJFQUQKIAlzdHcJcjExLCBUSFJFQURfTk9STVNBVkUoMCkocjEwKQotI2lmZGVmIENPTkZJ
R19LVk1fQk9PS0VfSFYKLUJFR0lOX0ZUUl9TRUNUSU9OCi0JbWZzcHIJcjExLCBTUFJOX1NSUjEK
LUVORF9GVFJfU0VDVElPTl9JRlNFVChDUFVfRlRSX0VNQl9IVikKLSNlbmRpZgogCXN0dwlyMTIs
IFRIUkVBRF9OT1JNU0FWRSgxKShyMTApCiAJc3R3CXIxMywgVEhSRUFEX05PUk1TQVZFKDIpKHIx
MCkKIAltZmNyCXIxMwogCXN0dwlyMTMsIFRIUkVBRF9OT1JNU0FWRSgzKShyMTApCi0JRE9fS1ZN
CUJPT0tFX0lOVEVSUlVQVF9JVExCX01JU1MgU1BSTl9TUlIxCiBTVEFSVF9CVEJfRkxVU0hfU0VD
VElPTgogCW1mc3ByIHIxMSwgU1BSTl9TUlIxCiAJYW5kaS4gcjEwLHIxMSxNU1JfUFIKQEAgLTY2
MCw4ICs2NDgsNiBAQCBFTkRfQlRCX0ZMVVNIX1NFQ1RJT04KIAlERUJVR19ERUJVR19FWENFUFRJ
T04KIAlERUJVR19DUklUX0VYQ0VQVElPTgogCi0JR1VFU1RfRE9PUkJFTExfRVhDRVBUSU9OCi0K
IAlDUklUSUNBTF9FWENFUFRJT04oMCwgR1VFU1RfREJFTExfQ1JJVCwgQ3JpdGljYWxHdWVzdERv
b3JiZWxsLCBcCiAJCQkgICB1bmtub3duX2V4Y2VwdGlvbikKIApkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9oZWFkX2Jvb2tlLmggYi9hcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfYm9v
a2UuaAppbmRleCAwYjVjMTk5MzgwOWUuLmQxZmZlZjRkMDViNSAxMDA2NDQKLS0tIGEvYXJjaC9w
b3dlcnBjL2tlcm5lbC9oZWFkX2Jvb2tlLmgKKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFk
X2Jvb2tlLmgKQEAgLTMsOCArMyw2IEBACiAjZGVmaW5lIF9fSEVBRF9CT09LRV9IX18KIAogI2lu
Y2x1ZGUgPGFzbS9wdHJhY2UuaD4JLyogZm9yIFNUQUNLX0ZSQU1FX1JFR1NfTUFSS0VSICovCi0j
aW5jbHVkZSA8YXNtL2t2bV9hc20uaD4KLSNpbmNsdWRlIDxhc20va3ZtX2Jvb2tlX2h2X2FzbS5o
PgogI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgkvKiBmb3IgVEhSRUFEX1NISUZUICovCiAK
ICNpZmRlZiBfX0FTU0VNQkxZX18KQEAgLTUyLDcgKzUwLDYgQEAgRU5EX0JUQl9GTFVTSF9TRUNU
SU9OCiAJc3R3CXIxMywgVEhSRUFEX05PUk1TQVZFKDIpKHIxMCk7CQkJCSAgICAgXAogCW1mY3IJ
cjEzOwkJCS8qIHNhdmUgQ1IgaW4gcjEzIGZvciBub3cJICAgKi9cCiAJbWZzcHIJcjExLCBTUFJO
X1NSUjE7CQkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCURPX0tWTQlC
T09LRV9JTlRFUlJVUFRfIyNpbnRubyBTUFJOX1NSUjE7CQkJICAgICBcCiAJYW5kaS4JcjExLCBy
MTEsIE1TUl9QUjsJLyogY2hlY2sgd2hldGhlciB1c2VyIG9yIGtlcm5lbCAgICAqL1wKIAlMT0FE
X1JFR19JTU1FRElBVEUocjExLCBNU1JfS0VSTkVMKTsJCQkJXAogCW10bXNyCXIxMTsJCQkJCQkJ
XApAQCAtMTE0LDI1ICsxMTEsNyBAQCBFTkRfQlRCX0ZMVVNIX1NFQ1RJT04KIAogLm1hY3JvIFNZ
U0NBTExfRU5UUlkgdHJhcG5vIGludG5vIHNycjEKIAltZnNwcglyMTAsIFNQUk5fU1BSR19USFJF
QUQKLSNpZmRlZiBDT05GSUdfS1ZNX0JPT0tFX0hWCi1CRUdJTl9GVFJfU0VDVElPTgotCW10c3By
CVNQUk5fU1BSR19XU0NSQVRDSDAsIHIxMAotCXN0dwlyMTEsIFRIUkVBRF9OT1JNU0FWRSgwKShy
MTApCi0Jc3R3CXIxMywgVEhSRUFEX05PUk1TQVZFKDIpKHIxMCkKLQltZmNyCXIxMwkJCS8qIHNh
dmUgQ1IgaW4gcjEzIGZvciBub3cJICAgKi8KLQltZnNwcglyMTEsIFNQUk5fU1JSMQotCW10b2Ny
ZgkweDgwLCByMTEJLyogY2hlY2sgTVNSW0dTXSB3aXRob3V0IGNsb2JiZXJpbmcgcmVnICovCi0J
YmYJMywgMTk3NWYKLQliCWt2bXBwY19oYW5kbGVyX1xpbnRub1woKV9cc3JyMQotMTk3NToKLQlt
cglyMTIsIHIxMwotCWx3eglyMTMsIFRIUkVBRF9OT1JNU0FWRSgyKShyMTApCi1GVFJfU0VDVElP
Tl9FTFNFCiAJbWZjcglyMTIKLUFMVF9GVFJfU0VDVElPTl9FTkRfSUZTRVQoQ1BVX0ZUUl9FTUJf
SFYpCi0jZWxzZQotCW1mY3IJcjEyCi0jZW5kaWYKIAltZnNwcglyOSwgU1BSTl9TUlIxCiAJQk9P
S0VfQ0xFQVJfQlRCKHIxMSkKIAltcglyMTEsIHIxCkBAIC0xOTgsNyArMTc3LDYgQEAgQUxUX0ZU
Ul9TRUNUSU9OX0VORF9JRlNFVChDUFVfRlRSX0VNQl9IVikKIAlzdHcJcjExLEdQUjExKHI4KTsJ
CQkJCQkgICAgIFwKIAlzdHcJcjksX0NDUihyOCk7CQkvKiBzYXZlIENSIG9uIHN0YWNrCQkgICAq
L1wKIAltZnNwcglyMTEsZXhjX2xldmVsX3NycjE7CS8qIGNoZWNrIHdoZXRoZXIgdXNlciBvciBr
ZXJuZWwgICAgKi9cCi0JRE9fS1ZNCUJPT0tFX0lOVEVSUlVQVF8jI2ludG5vIGV4Y19sZXZlbF9z
cnIxOwkJICAgICAgICAgICAgIFwKIAlCT09LRV9DTEVBUl9CVEIocjEwKQkJCQkJCVwKIAlhbmRp
LglyMTEscjExLE1TUl9QUjsJCQkJCQkgICAgIFwKIAlMT0FEX1JFR19JTU1FRElBVEUocjExLCBN
U1JfS0VSTkVMICYgfihNU1JfTUV8TVNSX0RFfE1TUl9DRSkpOwlcCkBAIC0yNzIsMjMgKzI1MCw2
IEBAIEFMVF9GVFJfU0VDVElPTl9FTkRfSUZTRVQoQ1BVX0ZUUl9FTUJfSFYpCiAJCUVYQ19MRVZF
TF9FWENFUFRJT05fUFJPTE9HKE1DLCB0cmFwbm8rNCwgTUFDSElORV9DSEVDSywgXAogCQkJU1BS
Tl9NQ1NSUjAsIFNQUk5fTUNTUlIxKQogCi0vKgotICogR3Vlc3QgRG9vcmJlbGwgLS0gdGhpcyBp
cyBhIGJpdCBvZGQgaW4gdGhhdCB1c2VzIEdTUlIwLzEgZGVzcGl0ZQotICogYmVpbmcgZGVsaXZl
cmVkIHRvIHRoZSBob3N0LiAgVGhpcyBleGNlcHRpb24gY2FuIG9ubHkgaGFwcGVuCi0gKiBpbnNp
ZGUgYSBLVk0gZ3Vlc3QgLS0gc28gd2UganVzdCBoYW5kbGUgdXAgdG8gdGhlIERPX0tWTSByYXRo
ZXIKLSAqIHRoYW4gdHJ5IHRvIGZpdCB0aGlzIGludG8gb25lIG9mIHRoZSBleGlzdGluZyBwcm9s
b2cgbWFjcm9zLgotICovCi0jZGVmaW5lIEdVRVNUX0RPT1JCRUxMX0VYQ0VQVElPTiBcCi0JU1RB
UlRfRVhDRVBUSU9OKEd1ZXN0RG9vcmJlbGwpOwkJCQkJICAgICBcCi0JbXRzcHIJU1BSTl9TUFJH
X1dTQ1JBVENIMCwgcjEwOwkvKiBzYXZlIG9uZSByZWdpc3RlciAqLwkgICAgIFwKLQltZnNwcgly
MTAsIFNQUk5fU1BSR19USFJFQUQ7CQkJCQkgICAgIFwKLQlzdHcJcjExLCBUSFJFQURfTk9STVNB
VkUoMCkocjEwKTsJCQkJICAgICBcCi0JbWZzcHIJcjExLCBTUFJOX1NSUjE7CQkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCXN0dwlyMTMsIFRIUkVBRF9OT1JNU0FWRSgy
KShyMTApOwkJCQkgICAgIFwKLQltZmNyCXIxMzsJCQkvKiBzYXZlIENSIGluIHIxMyBmb3Igbm93
CSAgICovXAotCURPX0tWTQlCT09LRV9JTlRFUlJVUFRfR1VFU1RfREJFTEwgU1BSTl9HU1JSMTsJ
CQkgICAgIFwKLQl0cmFwCi0KIC8qCiAgKiBFeGNlcHRpb24gdmVjdG9ycy4KICAqLwoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
