Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BE7E7717F
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 09:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZUtyevIWP92n0AvTNwjMkRuoTHF5m1X7riqOyKSIilo=; b=T4zR2DddgI8QoCzrTz8kQXR81Q
	38hxea/Igs7JTMxPq1+Eb9Mk2F/5wKFzfaI/cFV4PjNVpXSqb+K7CPI07DIIOjkbYvr1Tee6bVVRW
	HgpQ8B6Yxctwu8MM0vZroZV1L9T7/4VGkoRtOpfdxoZQZz2poE1cTGjP6iPCUOcqWYn2xQMx69wGy
	ut0hckJM6rHBqxz6O1h3BF1/FN9bWxC3E8tvC85jPEg3ZWuqbRN5iKOwp9F/y472+pAkg+m0HT4jQ
	NuFdasq0Joef5bOUMx7yet5g+bHphstc/Y6YNKuUjP5LF+0CWw/YHO8tFKpj8FNbmSoHUhRPfj2c3
	R0sxxTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1uz-00000003FWB-03f7;
	Fri, 13 Dec 2024 09:25:05 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1tl-00000003F9e-3QkI;
	Fri, 13 Dec 2024 09:23:51 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54AC925401E6;
	Fri, 13 Dec 2024 04:23:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 04:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734081828;
	 x=1734168228; bh=n3jJEXDlikai5BIZE32F7/anjx2vQjCMi91W2c/0OIU=; b=
	s4TV2CZcFzkScS6acPGBCbdFq7V/Dy9RHjeZpO9D08kgTWi83d99z4rSFRDlfItn
	79LEae3O/sswqtGNjOgw6p7A2uwEeu0rfXX0KGnM24oGxe10TsYGKNa9gjwrHH1M
	77z/q7KtVruOe0OdOi5TRWS78SiFNa+SiVNFQ+rpodntJZ3b8xuSM3Xs5Z+TlZPj
	jYk2eN1Px/XuwrJJme56jgHrfrvdu83wF+LObLjV/zkYuwMf0uA5hR0Zcu2ry91Q
	Ry+Uz0q570BdWx1QqFQRL9PRUaVrmXH8DYuhm9SCjYYBS5lrtdgQP9GSk2sX+/SO
	z2MPOgw3vU3Pc2EnX/A7kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734081828; x=
	1734168228; bh=n3jJEXDlikai5BIZE32F7/anjx2vQjCMi91W2c/0OIU=; b=g
	WU5S28dBtpaWIxa/WfM5+DNCtPcxjWDKZ5b2kRMCICSJF1Jbck+yyL1ak4Ck+oF0
	nox2Q2CbaqUmj7XEf9+21T4ImwGeKoHVi5AE+xHWohHrRQcDoHgKvZ4Yr4kY6gni
	YZIOiSrcIdaQcI0AhGo/p4lWcpMTXzfQ5zLFgCQXQPUT1krKF2v2ZDBcSySmQnjw
	BJqoRz6HxfoszAxXbUwIJzPE5lcC5KeaE/0Fici6VhdoTdJ/8znEVN09XLsFhFrI
	al6U/3+bf4zSqkaual62alMbdvj4QXQ12jAo9/gjiXpO0Ig4vhKGaXWuY4LUKeOi
	9cB+GvrtMyfHT96cMjZ9Q==
X-ME-Sender: <xms:I_1bZ3bSMslrR4QcwZjgzRBZ5UKLplvFQPQjA0HoCnQRTVB04lTnEA>
    <xme:I_1bZ2a8d_Q2fZ0Na0kNwzMS2ZkTU1yxsCa3UliYufnRsy7JexVQuLspvw1Yp0hIM
    JzKyNy6s59A2VINbsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegrth
    hishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhht
    rdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphht
    thhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhpvg
    esvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:I_1bZ58zp8MDxlCvv9u8Ry7AWm65nv4xnbOyH4IiLbt8eU9JURJk6A>
    <xmx:I_1bZ9pACUTZW8WwPhf4QcxSOuYSxTAQPur06CGzF5qEKPbeOcByjA>
    <xmx:I_1bZyo9cFmEKSDlhBCOYIixy__LIbIAUQqjIMpbNVa2B_j7nEn0sg>
    <xmx:I_1bZzRjXDv_56jhWmo6jXwpR2ylFASCuDSuCjtAjXh0sDj2yp1RYQ>
    <xmx:JP1bZ_ItKkj-d1aQhFXJA5zdxncKJIEWh0breQRKQ_juZTDHL4INUEmF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CDDBA2220072; Fri, 13 Dec 2024 04:23:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 10:23:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@suse.de>, "Arnd Bergmann" <arnd@kernel.org>
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
Message-Id: <e67c5757-26be-4fa6-932e-c7e51858081b@app.fastmail.com>
In-Reply-To: <mvm4j39ghrj.fsf@suse.de>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-2-arnd@kernel.org> <mvm4j39ghrj.fsf@suse.de>
Subject: Re: [RFC 1/5] mips: kvm: drop support for 32-bit hosts
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012349_917363_52C234F5 
X-CRM114-Status: UNSURE (   5.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2024, at 14:20, Andreas Schwab wrote:
> On Dez 12 2024, Arnd Bergmann wrote:
>
>> KVM support on MIPS was added in 2012 with both 32-bit and 32-bit mode
>
> s/32-bit/64-bit/ (once)
>

Fixed now, thanks,

     Arnd

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
