Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C960E7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 06:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdaMDMbrYLIGbc3y5/dtJF1iXlkqhd1KVsiwAt8a588=; b=MKsm6MWRuvsEX1
	d7fZOA11fdcZJdOIZ28Qe6xWT+M/PxIvsUQvJqo8RGi+7gezLPpUfXmUpXlGInvSzxZ0t9J2o4Sct
	iRZyzEHdTwbSxNs3P1VPyoupMpvTwphdkBa4dD0OxN3ucXYQV0hq4Rsp3m4CHTlSAUvMUe2+tq6FM
	7AurddsGUs9yZnQQtZSue7a+L+PoV2y0w8pAMN8XIJ0AZkB5L71MCxTS3otYCzwlrWNWEjVIm6Enl
	wcZYSUvydhJx9bvXRkuW8t5K8yAjywC2eFfkxMBIOIgN/9bxrFtMFIWfMMTDPU1lCpzGJ27wR/u/r
	KYsU7WYN/89yfeQ7zCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLz6r-00000002rY8-2p5t;
	Fri, 13 Dec 2024 06:25:09 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLz6p-00000002rWl-2SC2;
	Fri, 13 Dec 2024 06:25:09 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8fTB6fpSz9str;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDOGWM-FGhTz; Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8fTB5dPqz9stm;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACB7C8B773;
	Fri, 13 Dec 2024 07:25:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FXHjhDgv36wk; Fri, 13 Dec 2024 07:25:02 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A60F8B763;
	Fri, 13 Dec 2024 07:25:01 +0100 (CET)
Message-ID: <1f1beb34-65cc-4038-a8b2-de8af3e0703e@csgroup.eu>
Date: Fri, 13 Dec 2024 07:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] powerpc: kvm: drop 32-bit booke
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
 <20241212125516.467123-3-arnd@kernel.org>
 <3589ad69-13df-40f1-88c2-55d39790bbac@csgroup.eu>
 <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1633f30e-d885-4f31-a14d-11881e16deb9@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_222507_786852_5D9FA381 
X-CRM114-Status: GOOD (  14.65  )
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

CgpMZSAxMi8xMi8yMDI0IMOgIDIyOjA4LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6Cj4gT24g
VGh1LCBEZWMgMTIsIDIwMjQsIGF0IDE5OjM1LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+PiBM
ZSAxMi8xMi8yMDI0IMOgIDEzOjU1LCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6Cj4+PiBGcm9t
OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+Pj4KPj4+IFN1cHBvcnQgZm9yIDY0
LWJpdCBob3N0cyByZW1haW5zIHVuY2hhbmdlZCwgZm9yIGJvdGggMzItYml0IGFuZAo+Pj4gNjQt
Yml0IGd1ZXN0cy4KPj4+Cj4gCj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3ZtX2Jv
b2szc18zMi5oICAgIHwgIDM2IC0tCj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va3Zt
X2Jvb2tlLmggICAgICAgIHwgICA0IC0KPj4+ICAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9r
dm1fYm9va2VfaHZfYXNtLmggfCAgIDIgLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICB8ICAyMiArLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICB8ICAxNSAtCj4+PiAgICBhcmNoL3Bvd2VycGMva3ZtL2Jv
b2szc18zMl9tbXVfaG9zdC5jICAgICAgIHwgMzk2IC0tLS0tLS0tLS0tLS0tCj4+PiAgICBhcmNo
L3Bvd2VycGMva3ZtL2Jvb2tlLmMgICAgICAgICAgICAgICAgICAgIHwgMjY4IC0tLS0tLS0tLS0K
Pj4+ICAgIGFyY2gvcG93ZXJwYy9rdm0vYm9va2UuaCAgICAgICAgICAgICAgICAgICAgfCAgIDgg
LQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rZV9lbXVsYXRlLmMgICAgICAgICAgICB8ICA0
NCAtLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9ib29rZV9pbnRlcnJ1cHRzLlMgICAgICAgICB8
IDUzNSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgICBhcmNoL3Bvd2VycGMva3ZtL2Jvb2tlaHZf
aW50ZXJydXB0cy5TICAgICAgIHwgMTAyIC0tLS0KPj4+ICAgIGFyY2gvcG93ZXJwYy9rdm0vZTUw
MC5jICAgICAgICAgICAgICAgICAgICAgfCA1NTMgLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+ICAg
IGFyY2gvcG93ZXJwYy9rdm0vZTUwMC5oICAgICAgICAgICAgICAgICAgICAgfCAgNDAgLS0KPj4+
ICAgIGFyY2gvcG93ZXJwYy9rdm0vZTUwMF9lbXVsYXRlLmMgICAgICAgICAgICAgfCAxMDAgLS0t
LQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9lNTAwX21tdV9ob3N0LmMgICAgICAgICAgICB8ICA1
NCAtLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS9lNTAwbWMuYyAgICAgICAgICAgICAgICAgICB8
ICAgNSArLQo+Pj4gICAgYXJjaC9wb3dlcnBjL2t2bS90cmFjZV9ib29rZS5oICAgICAgICAgICAg
ICB8ICAxNCAtCj4+PiAgICAxNyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIxOTQg
ZGVsZXRpb25zKC0pCj4+PiAgICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2t2bV9ib29rM3NfMzIuaAo+Pj4gICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzMyX21tdV9ob3N0LmMKPj4+ICAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Bvd2VycGMva3ZtL2Jvb2tlX2ludGVycnVwdHMuUwo+Pj4gICAgZGVsZXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcG93ZXJwYy9rdm0vZTUwMC5jCj4+Cj4+IExlZnQgb3ZlciA/Cj4+Cj4+IGFyY2gv
cG93ZXJwYy9rZXJuZWwvaGVhZF9ib29rZS5oOiNpbmNsdWRlIDxhc20va3ZtX2FzbS5oPgo+PiBh
cmNoL3Bvd2VycGMva2VybmVsL2hlYWRfYm9va2UuaDojaW5jbHVkZSA8YXNtL2t2bV9ib29rZV9o
dl9hc20uaD4KPj4gYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkX2Jvb2tlLmg6ICAgICAgIGIKPj4g
a3ZtcHBjX2hhbmRsZXJfXGludG5vXCgpX1xzcnIxCj4gCj4gQXMgZmFyIGFzIEkgY2FuIHRlbGws
IHRoZXNlIGFyZSBzdGlsbCBuZWVkZWQgZm9yIGU1NTAwL2U2NTAwLAo+IGJ1dCB5b3Uga25vdyBt
b3JlIGFib3V0IHRoZSBwbGF0Zm9ybSB0aGFuIEkgZG8uCgokIGdpdCBncmVwIGt2bXBwY19oYW5k
bGVyXyBhcmNoL3Bvd2VycGMvCmFyY2gvcG93ZXJwYy9rdm0vYm9va2Vodl9pbnRlcnJ1cHRzLlM6
IApfR0xPQkFMKGt2bXBwY19oYW5kbGVyX1xpbnRub1woKV9cc3JyMSkKCkluIHlvdXIgcGF0Y2gg
eW91IHJlbW92ZSB0aGUgaW5jbHVkZSBvZiBoZWFkX2Jvb2tlLmggZnJvbSB0aGVyZToKCmRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2tlaHZfaW50ZXJydXB0cy5TIApiL2FyY2gvcG93
ZXJwYy9rdm0vYm9va2Vodl9pbnRlcnJ1cHRzLlMKaW5kZXggOGI0YTQwMjIxN2JhLi5jNzUzNTBm
YzQ0OWUgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9va2Vodl9pbnRlcnJ1cHRzLlMK
KysrIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rZWh2X2ludGVycnVwdHMuUwpAQCAtMTgsMTMgKzE4
LDkgQEAKICAjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+CiAgI2luY2x1ZGUgPGFzbS9iaXRz
cGVybG9uZy5oPgoKLSNpZmRlZiBDT05GSUdfNjRCSVQKICAjaW5jbHVkZSA8YXNtL2V4Y2VwdGlv
bi02NGUuaD4KICAjaW5jbHVkZSA8YXNtL2h3X2lycS5oPgogICNpbmNsdWRlIDxhc20vaXJxZmxh
Z3MuaD4KLSNlbHNlCi0jaW5jbHVkZSAiLi4va2VybmVsL2hlYWRfYm9va2UuaCIgLyogZm9yIFRI
UkVBRF9OT1JNU0FWRSgpICovCi0jZW5kaWYKCiAgI2RlZmluZSBMT05HQllURVMJCShCSVRTX1BF
Ul9MT05HIC8gOCkKCiQgZ2l0IGdyZXAgaGVhZF9ib29rZS5oCmFyY2gvcG93ZXJwYy9rZXJuZWwv
YXNtLW9mZnNldHMuYzojaW5jbHVkZSAiaGVhZF9ib29rZS5oIgphcmNoL3Bvd2VycGMva2VybmVs
L2hlYWRfNDR4LlM6I2luY2x1ZGUgImhlYWRfYm9va2UuaCIKYXJjaC9wb3dlcnBjL2tlcm5lbC9o
ZWFkXzg1eHguUzojaW5jbHVkZSAiaGVhZF9ib29rZS5oIgoKJCBnaXQgZ3JlcCBoZWFkXzg1eHgu
bwphcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlOm9iai0kKENPTkZJR19QUENfODV4eCkgICAg
ICAgICAgICAgKz0gCmhlYWRfODV4eC5vCgpDT05GSUdfUFBDXzg1eHggZGVwZW5kcyBvbiBDT05G
SUdfUFBDMzIuCgpDT05GSUdfRTU1MDBfQ1BVIGFuZCBDT05GSUdfRTY1MDBfQ1BVIGJvdGggZGVw
ZW5kIG9uIENPTkZJR19QUEM2NC4KClNvIHllcyBpdCBpcyB1c2VkIG9uIGU1NTAwL2U2NTAwIGJ1
dCBvbmx5IHdoZW4gdGhleSBydW4gYSAzMiBiaXRzIGtlcm5lbCAKYnVpbHQgd2l0aCBDT05GSUdf
UFBDXzg1eHguIElzbid0IGl0IHdoYXQgeW91IHdhbnQgdG8gZ2V0IHJpZCBvZiB3aXRoIAp0aGlz
IHBhdGNoID8KCkFtIEkgbWlzc2luZyBzb21ldGhpbmcgPwoKQ2hyaXN0b3BoZQoKLS0gCmt2bS1y
aXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
