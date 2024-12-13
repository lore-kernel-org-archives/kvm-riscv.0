Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542C8E7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2kOmK/EduTixBhePCl0ITvpkF3zfUIsBYwlZ3WbD28M=; b=CkHats+1LA37xJFBHn0JiYloz/
	9G2hTdOflRhC/sZm5nzNBj3568MzxmV4XCPxr5lffd1CWaY27YS0zceu+xWoZPS6lnLmxXv8AhZHI
	ovIuTpKrJ6HuZmS3r/Z4N9K0XsKyuLhRa9K0Jab8Mt3WE+apyEmw/tiM4XWNNRab9vQf/HS8afyzY
	5JujKD+goZgQRT9ea1hdaZL9Q+6MinupkaGwpOK0udAPbfhQsL9cujKkd2Si2O87US9b5xmmbjYKQ
	tOtOG8rEBHyyML4V9THRBX/GI1CSYGVljQgNOCGDwrLymZkXE3q2yyU0e7Md4OqtJPoP6Fmx+9/S/
	iCPx+KXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM34y-00000003Rz6-499a;
	Fri, 13 Dec 2024 10:39:28 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM34u-00000003RyE-3uv8;
	Fri, 13 Dec 2024 10:39:26 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 22A071140122;
	Fri, 13 Dec 2024 05:39:23 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 05:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734086362;
	 x=1734172762; bh=Wpmvv7rOIASgAsPA9YY0CjRAOWqGE5dKTI6oeaAjQsA=; b=
	svmWQJ3jUDwyTjtvXgDTfNmPiFm/sT6IfG+8CWL+e1E0AInZhl8p5UKax+wMo35f
	myLPtmB+5yYfSbfyj/qCO006nYOR+kuinLYz6+aoskK3zRfSb85JV0l3V96uAnET
	pUL5M8Qr0xxtZp9+220BHt5P+bvvJjUXpvVzk0kyMdohGdFBKcYoj1yFTAghWPC1
	ESCWm4oC8k7SSnHv/cpM350JLvJEcywzFGM4V3iJTjoFf46WHGRY9e29q7MHCYXX
	f2+l7EHyVfT5KDk9XUHcLA9TdOR+02PGMrSoAqoLlANb3hfm6iQIuIvl1tWOebbn
	OAVZtM7/kB57Am1sK824eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734086362; x=
	1734172762; bh=Wpmvv7rOIASgAsPA9YY0CjRAOWqGE5dKTI6oeaAjQsA=; b=Y
	uknyNOfW5x3i4eadPgo0/13SZlOVNBORH13Qea0h68nPo6kac9sVqMg0ipDBnEK+
	MFQITm+eCAlqVHbKJPcqrHEmpfLdUo7pQdjyvwFcpooo7Rvdg+oyJtD9fMZcCin4
	8q1nD8oBrdb4/gMQ/VXQONjCpAv9VJ9bbuyA74xt/rLuyEFP5MzOTsJukoPFb6+u
	wn9PcMaCe5SPCviK6l721qmzQvUGBRMTzD5EWRHZtKNpC87Cgdc2426/OXc2dC77
	3k+RgWkuaG6uj1CG5T4sWtSseDZQxYpf3m575iLl7aUHqNlvl3YyKkUHXTu5dFIK
	NjexF9Xq3oNico1L01Eig==
X-ME-Sender: <xms:2Q5cZ4IbLlfncl3aMEXOK6HmHI6nOUC12FcfLP7-OJjTC4cLykmlVg>
    <xme:2Q5cZ4KeJuscIBl3EXG99ecoSIJTTJYgTogDH5OBBqKxEEtFsgFJyxH5T-Jr7NyC4
    vJxk7jfSfY_Bnb9JO0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefgedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegrth
    hishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhht
    rdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphht
    thhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhpvg
    esvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:2Q5cZ4uhEqVwIWmlKABp7YxiWheuNKHklS06rgYgOG5WSbWzSRIdpQ>
    <xmx:2Q5cZ1YWGcG-BZPfYCyspFMyqrkAxbBQc5OhRUdLbZAkQnYR1BMsCw>
    <xmx:2Q5cZ_aKSykWyn1pThE9bHU1SqW6iK2dJnoNTxOIw5XrXs1C4jtuDQ>
    <xmx:2Q5cZxDLsWPmWnp45hCYSbYnVQtJ8mnJdnHhHdy6giGcNrT_ZE5f6Q>
    <xmx:2g5cZ3p36DdJF2lZIuxBVJ6f0_C5j-FvB7wonKJ7qVVUxqJ-OQlXJnSV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A9A6A2220072; Fri, 13 Dec 2024 05:39:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 11:39:00 +0100
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
Message-Id: <e5b03a9f-332f-4a13-84c6-6b739cd5aa25@app.fastmail.com>
In-Reply-To: <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
 <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
 <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
 <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_023925_736251_B3A86429 
X-CRM114-Status: UNSURE (   7.19  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQsIGF0IDExOjI3LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+
IExlIDEzLzEyLzIwMjQgw6AgMTE6MDQsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoKPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF8zMi5oIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9oZWFkXzMyLmgKPj4gaW5kZXggOWNiYTdkYmY1OGRkLi4yNGU4OWRhZGM3NGQgMTAwNjQ0
Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF8zMi5oCj4+ICsrKyBiL2FyY2gvcG93
ZXJwYy9rZXJuZWwvaGVhZF8zMi5oCj4+IEBAIC0xNzIsNyArMTcyLDYgQEAgX0FTTV9OT0tQUk9C
RV9TWU1CT0woXG5hbWVcKClfdmlydCkKPj4gICAjZGVmaW5lCVNUQVJUX0VYQ0VQVElPTihuLCBs
YWJlbCkJCVwKPj4gICAJX19IRUFEOwkJCQkJXAo+PiAgIAkuID0gbjsJCQkJCVwKPj4gLQlET19L
Vk0gbjsJCQkJXAo+PiAgIGxhYmVsOgo+PiAgIAo+PiAgICNlbHNlCj4KPiBUaGVuIHRoZSBjb21w
bGV0ZSBtYWNybyBzaG91bGQgZ28gYXdheSBiZWNhdXNlIGJvdGggdmVyc2lvbnMgYXJlIG5vdyAK
PiBpZGVudGljYWw6Cj4KPiAtI2lmZGVmIENPTkZJR19QUENfQk9PSzNTCj4gLSNkZWZpbmUJU1RB
UlRfRVhDRVBUSU9OKG4sIGxhYmVsKQkJXAo+IC0JX19IRUFEOwkJCQkJXAo+IC0JLiA9IG47CQkJ
CQlcCj4gLWxhYmVsOgo+IC0KPiAtI2Vsc2UKPiAgICNkZWZpbmUJU1RBUlRfRVhDRVBUSU9OKG4s
IGxhYmVsKQkJXAo+ICAgCV9fSEVBRDsJCQkJCVwKPiAgIAkuID0gbjsJCQkJCVwKPiAgIGxhYmVs
Ogo+CgpUaGFua3MsIEkndmUgZm9sZGVkIHRoYXQgY2hhbmdlIGludG8gbXkgcGF0Y2ggbm93LgoK
ICAgICAgQXJuZAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
