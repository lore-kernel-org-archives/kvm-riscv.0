Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10909E7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzrt/LjK2wRKI8j+qqn3lhXdYpGpr3cNdlx+3UEk7yE=; b=QOecC1AUGt3Tda
	362fIx3dSLijX0ptyAhn+wHYcXP7IJkr37NtLOHIoBrZW5UX72w+qz8zXPptpJg6eMda/5Lk/Lj/d
	rY0w2aHFF9eH9pN1rVapSr925WIOX5dnk2f2RFLc9y+Hg5u9NfuTjJV6x5BEW2z8b7fhJYckV9Yw2
	5VBx/U4+nzNAbulb40MtZAZyrPCPrKAXJEjx/cNB6SZN9W9LLrmFRJ+2Gqop7ENm/A0hCP8YKD1eB
	V54immLf2+95Ru1NVCpWfSMtvLkdqMXMfDMcRJ7fVwpIDfjDMpnJQXVc1Q1qPobEuaUxhL/4HBLVy
	WreO9dCdVaBDKJE5FR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0du-000000031n8-3DB3;
	Fri, 13 Dec 2024 08:03:22 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0d2-000000031bU-3Q4B;
	Fri, 13 Dec 2024 08:02:29 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8hdT5hV5z9str;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkzwJyV56MEz; Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8hdT4bL5z9sST;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 87B638B773;
	Fri, 13 Dec 2024 09:02:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XDvAIJXlZlMl; Fri, 13 Dec 2024 09:02:21 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B4EE8B763;
	Fri, 13 Dec 2024 09:02:20 +0100 (CET)
Message-ID: <0b1ea054-22bb-4380-a1e4-8be988d8746d@csgroup.eu>
Date: Fri, 13 Dec 2024 09:02:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241212125516.467123-4-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_000229_003316_782AABF7 
X-CRM114-Status: GOOD (  10.09  )
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

CgpMZSAxMi8xMi8yMDI0IMOgIDEzOjU1LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6Cj4gRnJv
bTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBTdXBwb3J0IGZvciBLVk0gb24g
MzItYml0IEJvb2sgSUlJLXMgaW1wbGVtZW50YXRpb25zIHdhcyBhZGRlZCBpbiAyMDEwCj4gYW5k
IHN1cHBvcnRzIFBvd2VyTWFjLCBDSFJQLCBhbmQgZW1iZWRkZWQgcGxhdGZvcm1zIHVzaW5nIHRo
ZSBGcmVlc2NhbGUgRzQKPiAobXBjNzR4eCksIGUzMDAgKG1wYzgzeHgpIGFuZCBlNjAwIChtcGM4
Nnh4KSBDUFVzIGZyb20gMjAwMyB0byAyMDA5Lgo+IAo+IEVhcmxpZXIgNjAzLzYwNC83NTAgbWFj
aGluZXMgbWlnaHQgd29yayBidXQgd291bGQgYmUgZXZlbiBtb3JlIGxpbWl0ZWQKPiBieSB0aGVp
ciBhdmFpbGFibGUgbWVtb3J5Lgo+IAo+IFRoZSBvbmx5IGxpa2VseSB1c2VycyBvZiBLVk0gb24g
YW55IG9mIHRoZXNlIHdlcmUgdGhlIGZpbmFsIEFwcGxlCj4gUG93ZXJNYWMvUG93ZXJCb29rL2lC
b29rIEc0IG1vZGVscyB3aXRoIDJHQiBvZiBSQU0gdGhhdCB3ZXJlIGF0IHRoZSBoaWdoCj4gZW5k
IDIwIHllYXJzIGFnbyBidXQgYXJlIGp1c3QgYXMgb2Jzb2xldGUgYXMgdGhlaXIgeDg2LTMyIGNv
dW50ZXJwYXJ0cy4KPiBUaGUgY29kZSBoYXMgYmVlbiBvcnBoYW5lZCBzaW5jZSAyMDIzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9ib29rM3MuaCAgICAgfCAgMTkgLS0tLQo+ICAgYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2t2bV9ib29rM3NfYXNtLmggfCAgMTAgLS0KCnBtYWMzMl9k
ZWZjb25maWc6IHNvbWV0aGluZyBpcyBnb2luZyB3cm9uZyB3aXRoIGhlYWRlcnM6CgogICBDQyAg
ICAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvYXNtLW9mZnNldHMucwpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L21tdS1oYXNoLmg6MjAsCiAg
ICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jvb2sz
c182NC5oOjE0LAogICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2t2bV9ib29rM3MuaDozODAsCiAgICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20va3ZtX3BwYy5oOjIyLAogICAgICAgICAgICAgICAgICBmcm9tIC4vYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2RiZWxsLmg6MTcsCiAgICAgICAgICAgICAgICAgIGZyb20g
YXJjaC9wb3dlcnBjL2tlcm5lbC9hc20tb2Zmc2V0cy5jOjM2OgouL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oOjE3OiB3YXJuaW5nOiAiX1BBR0VfRVhFQyIgCnJl
ZGVmaW5lZAogICAgMTcgfCAjZGVmaW5lIF9QQUdFX0VYRUMgICAgICAgICAgICAgIDB4MDAwMDEg
LyogZXhlY3V0ZSBwZXJtaXNzaW9uICovCiAgICAgICB8CkluIGZpbGUgaW5jbHVkZWQgZnJvbSAu
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvcGd0YWJsZS5oOjgsCiAgICAgICAgICAg
ICAgICAgIGZyb20gLi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vcGd0YWJsZS5oOjE4LAogICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9wZ3RhYmxlLmg6NiwKICAgICAgICAg
ICAgICAgICAgZnJvbSAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9rdXAuaDo0MywKICAgICAg
ICAgICAgICAgICAgZnJvbSAuL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS91YWNjZXNzLmg6OCwK
ICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oOjEyLAogICAg
ICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9zY2hlZC90YXNrLmg6MTMsCiAgICAg
ICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3NjaGVkL3NpZ25hbC5oOjksCiAgICAg
ICAgICAgICAgICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L3JjdXdhaXQuaDo2LAogICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9wZXJjcHUtcndzZW0uaDo3LAogICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9mcy5oOjMzLAogICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9jb21wYXQuaDoxNywKICAgICAgICAgICAgICAgICAgZnJvbSBh
cmNoL3Bvd2VycGMva2VybmVsL2FzbS1vZmZzZXRzLmM6MTI6Ci4vYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmg6MzA6IG5vdGU6IHRoaXMgaXMgdGhlIApsb2NhdGlv
biBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbgogICAgMzAgfCAjZGVmaW5lIF9QQUdFX0VYRUMg
ICAgICAweDIwMCAgIC8qIHNvZnR3YXJlOiBleGVjIGFsbG93ZWQgKi8KICAgICAgIHwKCgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
