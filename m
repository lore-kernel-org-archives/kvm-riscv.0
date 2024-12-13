Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8FCE7717F
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaT8FNnmqhZPztl9I27O+e23HNefWNntjXxh0H7olK4=; b=z2f/EI7KMxeE2u
	wLGU+CIo0jIWky/DTAAkBtMRYKwccNhRJsyDreR1wlzZScTQVJE8A7Y2a0KH6JSGF+8mZpDGTaLoh
	nkubnC90sUiCWtbTr/R0gsbFlOhBl9MHxQtDCOtXABr43LO99hYFu4X8NWJrqiMFt/jnV/vBbO+j4
	FW7tAcuILfdXhGPABYfk51Xa2EmaHulsCjCnIjeXRs7vvEa6QMXg2w5l+6OXjR6oqKfKMRbpiNoL1
	kDBfnUgCVZ7o5tF3LBu1GYf/jwFsrZs7qtPoEUR5gQ567oVF/l1z1s6zptAcpGIIeBDkN3+V9tWZU
	JDhlquFrLxp+dX3Fttmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3sa-00000003Z8n-1CnS;
	Fri, 13 Dec 2024 11:30:44 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2tW-00000003PvP-3TvT;
	Fri, 13 Dec 2024 10:27:40 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8ls307LNz9sSd;
	Fri, 13 Dec 2024 11:27:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4LjWUMC-i0O; Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8ls26Grzz9sSH;
	Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C07B88B773;
	Fri, 13 Dec 2024 11:27:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SmQbPCkQpRec; Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 679968B763;
	Fri, 13 Dec 2024 11:27:33 +0100 (CET)
Message-ID: <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
Date: Fri, 13 Dec 2024 11:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 kvm@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
 <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
 <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022739_018296_3DC3D3CF 
X-CRM114-Status: UNSURE (   6.35  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxMy8xMi8yMDI0IMOgIDExOjA0LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaGVhZF8zMi5oIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9oZWFkXzMyLmgKPiBpbmRleCA5Y2JhN2RiZjU4ZGQuLjI0ZTg5ZGFkYzc0ZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2hlYWRfMzIuaAo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvaGVhZF8zMi5oCj4gQEAgLTE3Miw3ICsxNzIsNiBAQCBfQVNNX05PS1BST0JFX1NZ
TUJPTChcbmFtZVwoKV92aXJ0KQo+ICAgI2RlZmluZQlTVEFSVF9FWENFUFRJT04obiwgbGFiZWwp
CQlcCj4gICAJX19IRUFEOwkJCQkJXAo+ICAgCS4gPSBuOwkJCQkJXAo+IC0JRE9fS1ZNIG47CQkJ
CVwKPiAgIGxhYmVsOgo+ICAgCj4gICAjZWxzZQoKVGhlbiB0aGUgY29tcGxldGUgbWFjcm8gc2hv
dWxkIGdvIGF3YXkgYmVjYXVzZSBib3RoIHZlcnNpb25zIGFyZSBub3cgCmlkZW50aWNhbDoKCi0j
aWZkZWYgQ09ORklHX1BQQ19CT09LM1MKLSNkZWZpbmUJU1RBUlRfRVhDRVBUSU9OKG4sIGxhYmVs
KQkJXAotCV9fSEVBRDsJCQkJCVwKLQkuID0gbjsJCQkJCVwKLWxhYmVsOgotCi0jZWxzZQogICNk
ZWZpbmUJU1RBUlRfRVhDRVBUSU9OKG4sIGxhYmVsKQkJXAogIAlfX0hFQUQ7CQkJCQlcCiAgCS4g
PSBuOwkJCQkJXAogIGxhYmVsOgoKLSNlbmRpZgoKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
