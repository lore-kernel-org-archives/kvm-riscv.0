Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2EAE7718D
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yDLsWo81zvB2hyVWQlmx+wCGnQO0J0xFIzzDZ6RVnhw=; b=aJO0Uzlzu0MvI5syOJx41jMOIF
	HgLNmgsg1e03fH4Sq4ymdyuusC+LLWt3KYBUlGY405OF/xdMEvHzm7wwLMk63z4J9LrvCuZC2SB10
	RYGTvnoLWfwztbWOpBt4yu+gJ4kIG1IAZzmH7tL71II2Wi0uEudD6Q9XIwsD4LVSX2hI6ECGMLAAU
	1igO6Ab5o3F5jUdRwa0TCSIegSChCmUu7XGJ7lNfXUzMiWs+iT9TF886aHwn+kXBX2ylO3pJ0pnI2
	xUXxekDupmZn4BZS28O/ePCW4LZDLDh2D9w/Jlvxo7x6Vwprgqy13lMH3HjUtA0vELNQRCzENashs
	yw2hlyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTDJ-00000008qAn-0di9;
	Sun, 22 Dec 2024 21:10:13 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTDF-00000008q9w-2ssV;
	Sun, 22 Dec 2024 21:10:11 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CCB13254014C;
	Sun, 22 Dec 2024 16:10:06 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 22 Dec 2024 16:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734901806;
	 x=1734988206; bh=hulTvbjJTbiMpwmmuDqHExl8kaak2t3tdounhjMSlCc=; b=
	gVX/P4ikj9XEI/+cpRAyHo110fjFeMbQdMaRUVUz47rdhluQuKIjLSjWB9AbPXDs
	4Ls1wD3OrCmiYlebxXD9KzWXIIj32by19AEnbpFxJEbOh6qfFAV6YmE37p8V05S1
	yB1LWIOAZdw947Wr/zGLNvvbnUu6K2zWS6k79+CViIkpElJP2g/FycUlMXyXc1LD
	fbvQQuzMLq6odjtfkKUAnUH1PgUJDILigxDreB0sFy1z/gD47TDcJT45czeVvvfM
	/F0kCp8lwqmlYqCiI6LVWG0bziH4ye0/NLrqx2COQ6oCe/myEpEdFpJaUIfw3M64
	ruV9wbeVbewsGl8Nylud9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734901806; x=
	1734988206; bh=hulTvbjJTbiMpwmmuDqHExl8kaak2t3tdounhjMSlCc=; b=c
	T/39VKfmYYGpPFLzEnGljLXRDNOhQVu0uwFo0sm1AuxEvzTR2WJvOYF5bG6x6K3r
	rcJXApCyeGJ+lrBAskGbsIVqZvHHNXy75pAXU3twNx25lonRiWkClBCunLAZmbdA
	9gmqL82hVdygkY1Ggdrtcjrs1orLCmwnI67qfhFThtk7kPCqOdmwSzg34c026/DG
	RbIrC5+l28S9GvQKJUmT+vctE90E/1OoATyJlyNzrlGZ+LPP5sav8ApwWya3+eDh
	r6pyiKZIl6p1MZSAgjdvb/XZ7afZVPKgghCFf3DWgTJZYwkbaRDzW5B7GOpsuNMS
	7ujVDMDCk/bst9xdb9apw==
X-ME-Sender: <xms:KoBoZ6UNMDC2oHWNRW_N2BgYv2O-s87xJMQZ_FVUatfd-xvkOMlJNg>
    <xme:KoBoZ2kpyqI0jV0t138UlngOhCds9yB7ByImCXDeYc2EHlG4_dl_C6HHQEpfsafv4
    lUfozXcipGpkls5Tdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeegueeifffgueduuedtkeeggeffheefleegteeg
    geevgeetleeiieevveeffeduteenucffohhmrghinhepohhpvghnshhouhhrtggvrdhorh
    hgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefhe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhr
    tghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtph
    htthhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegr
    thhishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulh
    htrdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhho
    uhhprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtph
    htthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhp
    vgesvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:KoBoZ-ZPdCMm-lShnjs_K52FgIRuio-VuZgSA3b-nt11bSrGqgehdA>
    <xmx:KoBoZxUVOvla7YwN8AwMXqBbbsjCIBNPftikOdIPI4fEbY-V66B_Ug>
    <xmx:KoBoZ0mcSy693-wwD_p3JOrUM4PlpEGv3NEXA_d16f6Y-Hf5q49URw>
    <xmx:KoBoZ2e9zYYd3C9e47i3uKuVTQh-dBzDrJ1pNnStMySFHX31HwW81A>
    <xmx:LoBoZ3GdpY_hoWY0LseweO3la8GJqDdw7KCr7e7zq3aXnz5TRGQNhVuG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C20132220072; Sun, 22 Dec 2024 16:10:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 22:09:14 +0100
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
Message-Id: <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
In-Reply-To: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
 <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_131009_788206_3EDBCD6D 
X-CRM114-Status: GOOD (  30.73  )
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

T24gU3VuLCBEZWMgMjIsIDIwMjQsIGF0IDAzOjEzLCBBLiBXaWxjb3ggd3JvdGU6Cj4gT24gRGVj
IDIxLCAyMDI0LCBhdCAzOjQy4oCvUE0sIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4g
d3JvdGU6Cj4+IAo+Cj4KPiBJIGNhbiBjb25maXJtIHRoYXQgcnVubmluZyA2LjEyLjUgb24gYSBQ
OSBob3N0LCB0cnlpbmcgdG8gYm9vdCBhIDYuNgo+IDMyLWJpdCBrZXJuZWwgZ2F2ZSBtZToKPgo+
IERldGVjdGVkIFJBTSBrZXJuZWwgYXQgNDAwMDAwICgxMzMwYzhjIGJ5dGVzKSAKPiAgICAgICAg
V2VsY29tZSB0byBPcGVuIEZpcm13YXJlCj4KPiAgIENvcHlyaWdodCAoYykgMjAwNCwgMjAxNyBJ
Qk0gQ29ycG9yYXRpb24gQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiAgIFRoaXMgcHJvZ3JhbSBhbmQg
dGhlIGFjY29tcGFueWluZyBtYXRlcmlhbHMgYXJlIG1hZGUgYXZhaWxhYmxlCj4gICB1bmRlciB0
aGUgdGVybXMgb2YgdGhlIEJTRCBMaWNlbnNlIGF2YWlsYWJsZSBhdAo+ICAgaHR0cDovL3d3dy5v
cGVuc291cmNlLm9yZy9saWNlbnNlcy9ic2QtbGljZW5zZS5waHAKPgo+IEJvb3RpbmcgZnJvbSBt
ZW1vcnkuLi4KPiAKPiAoIDM4MCApIERhdGEgU2VnbWVudCBFeGNlcHRpb24gWyAtYmZjMDAwMDAg
XQo+Cj4KPiAgICAgUjAgLi4gUjcgICAgICAgICAgIFI4IC4uIFIxNSAgICAgICAgIFIxNiAuLiBS
MjMgICAgICAgICBSMjQgLi4gUjMxCj4gMDAwMDAwMDAwMTRhMTEyNCAgIDAwMDAwMDAwMDAwMDAw
MDAgICAwMDAwMDAwMDAxMzViNGFjICAgMDAwMDAwMDAwMDAwMDAwMCAgIAo+IDAwMDAwMDAwMGRj
NzBmMzAgICBmZmZmZmZmZmMwMDAwMDAwICAgMDAwMDAwMDAwZGM3MGZhNCAgIDAwMDAwMDAwMDE3
MzYwMGMgICAKPiAwMDAwMDAwMDAwMDAwMDAwICAgMDAwMDAwMDAwZTQ3NzAxMCAgIDAwMDAwMDAw
MDAwMDAwMDAgICAwMDAwMDAwMDAwNDAwMDAwICAgCj4gZmZmZmZmZmYwMTQxYmU0YyAgIDAwMDAw
MDAwMDE0OWFiNzQgICAwMDAwMDAwMGZmZmZmZmZmICAgMDAwMDAwMDAwMDAwMDAwOCAgIAo+IDAw
MDAwMDAwYzAwMTRiNmMgICAwMDAwMDAwMDIwMDAwNDAyICAgMDAwMDAwMDA0MDQwMDAwMCAgIDAw
MDAwMDAwMDE2ZjIwMDAgICAKPiBmZmZmZmZmZjQwNDAwMDAwICAgMDAwMDAwMDAwMDAwMDAwMCAg
IDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDBkYzcwZjYwICAgCj4gMDAwMDAwMDAwMDAwMDAw
MCAgIDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDBlNzNkNDkwICAgMDAwMDAwMDAwMTQ5ZjAw
MCAgIAo+IDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDBlNzU2MTE4ICAgMDAwMDAwMDAwZGM3
MGZhMCAgIGZmZmZmZmZmNDA0MDAwMDAgICAKPgo+ICAgICBDUiAvIFhFUiAgICAgICAgICAgTFIg
LyBDVFIgICAgICAgICAgU1JSMCAvIFNSUjEgICAgICAgIERBUiAvIERTSVNSCj4gICAgICAgICA4
MDAwMDQwMiAgIDAwMDAwMDAwMDE0YTExMjQgICAwMDAwMDAwMDAxNGExMTI4ICAgZmZmZmZmZmYw
MTQxYmU0YyAgIAo+IDAwMDAwMDAwMjAwNDAwMDAgICAwMDAwMDAwMDAwMDAwMDAwICAgODAwMDAw
MDAwMDAwMzAwMCAgICAgICAgICAgMDAwMDAwMDAgICAKPgo+Cj4gMiA+IAo+Cj4gV2hpY2ggaXMg
dGhlIHNhbWUgdGhpbmcgdGhhdCBoYXBwZW5zIGlmIHlvdSBib290IGEgMzItYml0IExpbnV4IGtl
cm5lbAo+IG9uIGEgcGh5c2ljYWwgNjQtYml0IFBvd2VyIG1hY2hpbmUuICBUaGlzIGlzIHByb2Jh
Ymx5IGJlY2F1c2UgS1ZNIGlzCj4gc28gbXVjaCBtb3JlIGFjY3VyYXRlIHRoYW4gVENHIGZvciBQ
b3dlciBlbXVsYXRpb24gOikKCkRpZCB5b3UgYXNrIGt2bSB0byBlbXVsYXRlIGEgMzItYml0IHBs
YXRmb3JtIHRob3VnaD8gU2luY2UgdGhlCnJlZ2lzdGVyIGR1bXAgc2hvd3MgNjQtYml0IHJlZ2lz
dGVycywgbXkgZ3Vlc3MgaXMgdGhhdCB0aGlzIGlzIHRoZQpyZXN1bHQgb2YgdHJ5aW5nIHRvIGxv
YWQgYSAzMi1iaXQga2VybmVsIG9uICItbWFjaGluZSBwc2VyaWVzCi1jcHUgbmF0aXZlIiwgd2hp
Y2ggaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgZ3Vlc3Qga2VybmVsLiBJIHdvdWxkCmV4cGVjdCB0
aGF0IHlvdSBuZWVkIGF0IGxlYXN0IGEgMzItYml0IG1hY2hpbmUgdHlwZSAobWFjOTksCnBlZ2Fz
b3MyKSBhbmQgbGlrZWx5IGFsc28gYSAzMi1iaXQgQ1BVICg3NDQ3YSwgZTYwMCkuCgpBY2NvcmRp
bmcgdG8gd2hhdCBQYW9sbyBzYWlkLCB0aGF0IG1heSByZXF1aXJlIFBSIHN0YXRlIGluc3RlYWQK
b2YgSFYgbW9kZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC83OWI5YWJmZS1jZmI4LTRl
ZjAtOGE0Yi03Yjg3Nzg3ZTY1NDlAcmVkaGF0LmNvbS8KCkkgYW0gbm90IGZhbWlsaWFyIGVub3Vn
aCB3aXRoIHRoZSBkZXRhaWxzLCBidXQgZnJvbSB0aGUgc291cmNlIGNvZGUKSSBzZWUgdGhhdCB0
aGlzIGlzIG5vdCB1c3VhbGx5IGVuYWJsZWQsIGFuZCB5b3UgbWF5IGhhdmUgdG8gdHVybgpvZmYg
Q09ORklHX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGFuZCBDT05GSUdfQ09OVEVYVF9UUkFDS0lO
R19VU0VSCmluIG9yZGVyIHRvIGVuYWJsZSBDT05GSUdfS1ZNX0JPT0szU182NF9QUiwgYXMgd2Vs
bCBhcyBwb3NzaWJseQp0dXJuaW5nIG9mZiBDT05GSUdfS1ZNX0JPT0szU182NF9IViAoaXQgbG9v
a3MgbGlrZSBpdCBzaG91bGQKYmUgcG9zc2libGUgdG8gaGF2ZSBib3RoIEhWIGFuZCBQUiBjb2V4
aXN0LCBidXQgdGhlcmUgbWF5IGJlIGJ1Z3MpLgpZb3UgYWxzbyBuZWVkIHRvIGVuc3VyZSB0aGF0
IHlvdSBoYXZlIGxvYWRlZCBrdm1fcHIua28gaW5zdGVhZApvZiBrdm1faHYua28sIGFuZCB0aGF0
IENPTkZJR19QUENfUkFESVhfTU1VIGlzIHR1cm5lZCBvZmYgaWYKeW91IGFyZSBydW5uaW5nIG9u
IGEgcG93ZXI5IGhvc3QsIG90aGVyd2lzZSBrdm1fcHIua28gZmFpbHMgdG8gbG9hZCwKc2VlIGt2
bXBwY19jb3JlX2NoZWNrX3Byb2Nlc3Nvcl9jb21wYXRfcHIoKS4KCj4gVGhhdCBzYWlkLCBJIHdv
dWxkIGxpa2UgdG8ga2VlcCB0aGUgc3VwcG9ydCBhbGl2ZSBmb3IgbW9yZSB0aGFuIGp1c3QKPiBw
cGMzMiBrZXJuZWwgdGVzdGluZy4gIFRoZXJlIGFyZSBwbGVudHkgb2YgUG93ZXIgTWFjcyB3aXRo
IGVub3VnaAo+IG1lbW9yeSB0byBydW4gc29tZSBlbnZpcm9ubWVudHMgd2l0aGluIEtWTS4gIEFk
w6lsaWXigJlzIG5ldyByZWxlYXNlCj4gYm9vdHMgYSBmdWxsIFhGQ0UgZGVza3RvcCBpbiB1bmRl
ciAzMDAgTUIgUkFNLCBzbyBldmVuIGEgMSBHQiBtYWNoaW5lCj4gaGFzIGVub3VnaCBtZW1vcnkg
dG8gcnVuIEFtaWdhT1MsIE1hYyBPUyA5LCBvciBhbm90aGVyIFhGQ0UgaW4gS1ZNLgo+Cj4gSSBo
YXZlIGZvdW5kIGEgZmV3IGJ1Z3MgaW4gdGVzdGluZyBuZXdlciBrZXJuZWxzLCBhbmQgb25lIG9m
IHRoZW0KPiBhZmZlY3RzIGFsbCB0YXJnZXRzIGxvd2VyIHRoYW4gUG93ZXI3LCB3aGljaCBtZWFu
cyAzMi1iaXQgYW5kIDY0LWJpdCBCRS4KPiBJIGFtIHByZXBhcmluZyB0byBzZW5kIHRob3NlIHBh
dGNoZXMgaW4uICBJIHdpbGwgY29udGludWUgc2hha2luZyBvdXQKPiBhbnkgcmVtYWluaW5nIGJ1
Z3Mgb24gbXkgMzItYml0IGhvc3QuICBJIGhvcGUgdGhhdCB0aGVzZSBwYXRjaGVzIGNhbgo+IGJl
IHVzZWZ1bCwgYW5kIHBvc3NpYmx5IHN0aW11bGF0ZSBtb3JlIGludGVyZXN0IHNvIDMyLWJpdCBz
dXBwb3J0IGNhbgo+IGJlIG1haW50YWluZWQgYWdhaW4uCgpEbyB5b3UgbWVhbiAzMi1iaXQgaG9z
dCBLVk0gc3VwcG9ydCBzcGVjaWZpY2FsbHksIG9yIG1vcmUgZ2VuZXJhbGx5CnBvd2VycGMzMiBr
ZXJuZWxzPyBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgcG93ZXJwYzMyIGtlcm5lbCBzdXBwb3J0Cml0
c2VsZiByZW1haW5zIGFjdGl2ZWx5IG1haW50YWluZWQsIHRob3VnaCBhbG1vc3QgYWxsIG9mIHRo
ZSB3b3JrCmlzIG9uIHRoZSBlbWJlZGRlZCBmcmVlc2NhbGUgcGFydHMgcmF0aGVyIHRoYW4gb24g
ZGVza3RvcC4KUG93ZXJNYWMgYW5kIEtWTSBvbiBib29rM3MzMiB3ZXJlIG1hcmtlZCBhcyBvcnBo
YW5lZCBsYXN0IHllYXIsCmJ1dCBoYWRuJ3Qgc2VlbiBtdWNoIGFjdGl2aXR5IGZvciBhIHdoaWxl
IGJlZm9yZSB0aGF0LgoKPiBJbiBmYWlybmVzcywgSSBkbyBhZ3JlZSB0aGF0IHRoZXJlIGlzIHZl
cnkgbGl0dGxlIHZhbHVlIGluIGtlZXBpbmcgMzItYml0Cj4gTUlQUyBvciBSSVNDLVYgc3VwcG9y
dCBzaW5jZSB0aGUgY2hpcHMgdGhhdCBzdXBwb3J0IGl0IGFyZSBzbyBsaW1pdGVkLgo+IDMyLWJp
dCBQb3dlciBob3dldmVyIHNlcnZlcyBhY3R1YWwgcHVycG9zZXMuICAzMi1iaXQgeDg2IGNvdWxk
IGJlIHVzZWZ1bAo+IHRvIG1ha2Ugc3VyZSDigJxLVk0gb24gMzItYml0IGluIGdlbmVyYWzigJ0g
aXMgZWFzaWVyIHRvIGtlZXAgZ29pbmcsCj4gYnV0IGlmIGl0IGlzIGNhdXNpbmcgbWFpbnRlbmFu
Y2UgaXNzdWVzIHRoZW4gSSBzdXBwb3NlIGl0IGNhbiBnby4KCkkgdGhpbmsgaXQgY29tZXMgZG93
biB0byBob3cgbXVjaCBvZiBhIGhhc3NsZSB0aGUgYm9vazNzMzIgS1ZNIHN1cHBvcnQKaXMgZm9y
IGJvdGggdGhlIGNvbnRpbnVlZCBib29rM3MzMiBhcmNoaXRlY3R1cmUgc3VwcG9ydCBhbmQgdGhl
IEtWTQpib29rM3M2NCBjb2RlYmFzZS4gSSB0aGluayBib3RoIG9mIHRoZXNlIGJlbmVmaXQgZnJv
bSBubyBsb25nZXIKaGF2aW5nIHRvIHdvcnJ5IGFib3V0IHRoZSBvcnBoYW5lZCBib29rM3MzMiBr
dm0gY29kZSwgYnV0IEkgY2FuJ3QKdGVsbCBob3cgdGhhdCBzaG91bGQgYmUgd2VpZ2hlZCBhZ2Fp
bnN0IGhvdyB1c2VmdWwgaXQgaXMgZm9yIHlvdQphbmQgb3RoZXIgdXNlcnMgdGhhdCBvY2Nhc2lv
bmFsbHkgdXNlIEtWTSBvbiB0aGF0IGhhcmR3YXJlLgoKICAgICAgQXJuZAoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
