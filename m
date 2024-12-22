Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DCE7718B
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 02:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMoEqwtkY7x5XLY687DLCTxO5XSbmxygIsiixqMR+p4=; b=yqVl1e8Xw2WM0R
	7GeCkENpkRDKnTKNOWA1oYnbPpjRJSa2+55C29JinLFj4t8tErHhKWWaZqrRwJaBu+4i7iZ3xv7bT
	+3iZ5mYw10bqlTlCJTt5b5KkY70i16mQL8XaF9Muk9FQMIEx0anAjnF9X4SLyWeBqjXj/hdFAH6Cn
	5269mDkPB9F+IslTyFyap6dMxHlHggwVRQmEY8pwS4Im9kAgz5f/+/dWqnMyf1GC1W4t040RDTHpf
	MVauyp0+gf23cYCq5Ti5E3R2GxUQ9f10R50+Yj9F2k59bKlsvuFAXJ5qd9D2xVWPadm9sZLJ5B0kg
	AUrYT0KKVLAyF8CMbYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPBXT-00000007gcO-3Vu3;
	Sun, 22 Dec 2024 02:17:51 +0000
Received: from mail.wilcox-tech.com ([45.32.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPBXP-00000007gSE-3RTb
	for kvm-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 02:17:49 +0000
Received: (qmail 18201 invoked from network); 22 Dec 2024 02:13:27 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 22 Dec 2024 02:13:27 -0000
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20241221214223.3046298-5-arnd@kernel.org>
Date: Sat, 21 Dec 2024 20:13:12 -0600
Cc: kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>,
 Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Message-Id: <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com>
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-5-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_181747_903164_3492BE33 
X-CRM114-Status: GOOD (  22.35  )
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

T24gRGVjIDIxLCAyMDI0LCBhdCAzOjQy4oCvUE0sIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAK
PiBTdXBwb3J0IGZvciBLVk0gb24gMzItYml0IEJvb2sgSUlJLXMgaW1wbGVtZW50YXRpb25zIHdh
cyBhZGRlZCBpbiAyMDEwCj4gYW5kIHN1cHBvcnRzIFBvd2VyTWFjLCBDSFJQLCBhbmQgZW1iZWRk
ZWQgcGxhdGZvcm1zIHVzaW5nIHRoZSBGcmVlc2NhbGUgRzQKPiAobXBjNzR4eCksIGUzMDAgKG1w
YzgzeHgpIGFuZCBlNjAwIChtcGM4Nnh4KSBDUFVzIGZyb20gMjAwMyB0byAyMDA5Lgo+IAo+IEVh
cmxpZXIgNjAzLzYwNC83NTAgbWFjaGluZXMgbWlnaHQgd29yayBidXQgd291bGQgYmUgZXZlbiBt
b3JlIGxpbWl0ZWQKPiBieSB0aGVpciBhdmFpbGFibGUgbWVtb3J5Lgo+IAo+IFRoZSBvbmx5IGxp
a2VseSB1c2VycyBvZiBLVk0gb24gYW55IG9mIHRoZXNlIHdlcmUgdGhlIGZpbmFsIEFwcGxlCj4g
UG93ZXJNYWMvUG93ZXJCb29rL2lCb29rIEc0IG1vZGVscyB3aXRoIDJHQiBvZiBSQU0gdGhhdCB3
ZXJlIGF0IHRoZSBoaWdoCj4gZW5kIDIwIHllYXJzIGFnbyBidXQgYXJlIGp1c3QgYXMgb2Jzb2xl
dGUgYXMgdGhlaXIgeDg2LTMyIGNvdW50ZXJwYXJ0cy4KPiBUaGUgY29kZSBoYXMgYmVlbiBvcnBo
YW5lZCBzaW5jZSAyMDIzLgo+IAo+IFRoZXJlIGlzIHN0aWxsIGEgbmVlZCB0byBzdXBwb3J0IDMy
LWJpdCBndWVzdHMgaW4gb3JkZXIgdG8gYmV0dGVyCj4gZGVidWcgcHJvYmxlbXMgb24gcHBjMzIg
a2VybmVscy4gVGhpcyBzaG91bGQgd29yayBpbiB0aGVvcnkgb24gYm90aAo+IDY0LWJpdCBib29r
ZSBhbmQgb24gNjQtYml0IGJvb2szcyBob3N0cywgYnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8KPiBj
b25maXJtIHRoYXQgdGhpcyBpcyBzdGlsbCB0aGUgY2FzZSBiZWZvcmUgdGhlIGtub3duIHdvcmtp
bmcgb3B0aW9uCj4gZ2V0cyByZW1vdmVkLgoKCkkgY2FuIGNvbmZpcm0gdGhhdCBydW5uaW5nIDYu
MTIuNSBvbiBhIFA5IGhvc3QsIHRyeWluZyB0byBib290IGEgNi42CjMyLWJpdCBrZXJuZWwgZ2F2
ZSBtZToKCkRldGVjdGVkIFJBTSBrZXJuZWwgYXQgNDAwMDAwICgxMzMwYzhjIGJ5dGVzKSAKICAg
ICAgIFdlbGNvbWUgdG8gT3BlbiBGaXJtd2FyZQoKICBDb3B5cmlnaHQgKGMpIDIwMDQsIDIwMTcg
SUJNIENvcnBvcmF0aW9uIEFsbCByaWdodHMgcmVzZXJ2ZWQuCiAgVGhpcyBwcm9ncmFtIGFuZCB0
aGUgYWNjb21wYW55aW5nIG1hdGVyaWFscyBhcmUgbWFkZSBhdmFpbGFibGUKICB1bmRlciB0aGUg
dGVybXMgb2YgdGhlIEJTRCBMaWNlbnNlIGF2YWlsYWJsZSBhdAogIGh0dHA6Ly93d3cub3BlbnNv
dXJjZS5vcmcvbGljZW5zZXMvYnNkLWxpY2Vuc2UucGhwCgpCb290aW5nIGZyb20gbWVtb3J5Li4u
CiAKKCAzODAgKSBEYXRhIFNlZ21lbnQgRXhjZXB0aW9uIFsgLWJmYzAwMDAwIF0KCgogICAgUjAg
Li4gUjcgICAgICAgICAgIFI4IC4uIFIxNSAgICAgICAgIFIxNiAuLiBSMjMgICAgICAgICBSMjQg
Li4gUjMxCjAwMDAwMDAwMDE0YTExMjQgICAwMDAwMDAwMDAwMDAwMDAwICAgMDAwMDAwMDAwMTM1
YjRhYyAgIDAwMDAwMDAwMDAwMDAwMDAgICAKMDAwMDAwMDAwZGM3MGYzMCAgIGZmZmZmZmZmYzAw
MDAwMDAgICAwMDAwMDAwMDBkYzcwZmE0ICAgMDAwMDAwMDAwMTczNjAwYyAgIAowMDAwMDAwMDAw
MDAwMDAwICAgMDAwMDAwMDAwZTQ3NzAxMCAgIDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDAw
NDAwMDAwICAgCmZmZmZmZmZmMDE0MWJlNGMgICAwMDAwMDAwMDAxNDlhYjc0ICAgMDAwMDAwMDBm
ZmZmZmZmZiAgIDAwMDAwMDAwMDAwMDAwMDggICAKMDAwMDAwMDBjMDAxNGI2YyAgIDAwMDAwMDAw
MjAwMDA0MDIgICAwMDAwMDAwMDQwNDAwMDAwICAgMDAwMDAwMDAwMTZmMjAwMCAgIApmZmZmZmZm
ZjQwNDAwMDAwICAgMDAwMDAwMDAwMDAwMDAwMCAgIDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAw
MDBkYzcwZjYwICAgCjAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDAwMDAwMDAwICAgMDAwMDAw
MDAwZTczZDQ5MCAgIDAwMDAwMDAwMDE0OWYwMDAgICAKMDAwMDAwMDAwMDAwMDAwMCAgIDAwMDAw
MDAwMGU3NTYxMTggICAwMDAwMDAwMDBkYzcwZmEwICAgZmZmZmZmZmY0MDQwMDAwMCAgIAoKICAg
IENSIC8gWEVSICAgICAgICAgICBMUiAvIENUUiAgICAgICAgICBTUlIwIC8gU1JSMSAgICAgICAg
REFSIC8gRFNJU1IKICAgICAgICA4MDAwMDQwMiAgIDAwMDAwMDAwMDE0YTExMjQgICAwMDAwMDAw
MDAxNGExMTI4ICAgZmZmZmZmZmYwMTQxYmU0YyAgIAowMDAwMDAwMDIwMDQwMDAwICAgMDAwMDAw
MDAwMDAwMDAwMCAgIDgwMDAwMDAwMDAwMDMwMDAgICAgICAgICAgIDAwMDAwMDAwICAgCgoKMiA+
IAoKV2hpY2ggaXMgdGhlIHNhbWUgdGhpbmcgdGhhdCBoYXBwZW5zIGlmIHlvdSBib290IGEgMzIt
Yml0IExpbnV4IGtlcm5lbApvbiBhIHBoeXNpY2FsIDY0LWJpdCBQb3dlciBtYWNoaW5lLiAgVGhp
cyBpcyBwcm9iYWJseSBiZWNhdXNlIEtWTSBpcwpzbyBtdWNoIG1vcmUgYWNjdXJhdGUgdGhhbiBU
Q0cgZm9yIFBvd2VyIGVtdWxhdGlvbiA6KQoKVGhhdCBzYWlkLCBJIHdvdWxkIGxpa2UgdG8ga2Vl
cCB0aGUgc3VwcG9ydCBhbGl2ZSBmb3IgbW9yZSB0aGFuIGp1c3QKcHBjMzIga2VybmVsIHRlc3Rp
bmcuICBUaGVyZSBhcmUgcGxlbnR5IG9mIFBvd2VyIE1hY3Mgd2l0aCBlbm91Z2gKbWVtb3J5IHRv
IHJ1biBzb21lIGVudmlyb25tZW50cyB3aXRoaW4gS1ZNLiAgQWTDqWxpZeKAmXMgbmV3IHJlbGVh
c2UKYm9vdHMgYSBmdWxsIFhGQ0UgZGVza3RvcCBpbiB1bmRlciAzMDAgTUIgUkFNLCBzbyBldmVu
IGEgMSBHQiBtYWNoaW5lCmhhcyBlbm91Z2ggbWVtb3J5IHRvIHJ1biBBbWlnYU9TLCBNYWMgT1Mg
OSwgb3IgYW5vdGhlciBYRkNFIGluIEtWTS4KCkkgaGF2ZSBmb3VuZCBhIGZldyBidWdzIGluIHRl
c3RpbmcgbmV3ZXIga2VybmVscywgYW5kIG9uZSBvZiB0aGVtCmFmZmVjdHMgYWxsIHRhcmdldHMg
bG93ZXIgdGhhbiBQb3dlcjcsIHdoaWNoIG1lYW5zIDMyLWJpdCBhbmQgNjQtYml0IEJFLgpJIGFt
IHByZXBhcmluZyB0byBzZW5kIHRob3NlIHBhdGNoZXMgaW4uICBJIHdpbGwgY29udGludWUgc2hh
a2luZyBvdXQKYW55IHJlbWFpbmluZyBidWdzIG9uIG15IDMyLWJpdCBob3N0LiAgSSBob3BlIHRo
YXQgdGhlc2UgcGF0Y2hlcyBjYW4KYmUgdXNlZnVsLCBhbmQgcG9zc2libHkgc3RpbXVsYXRlIG1v
cmUgaW50ZXJlc3Qgc28gMzItYml0IHN1cHBvcnQgY2FuCmJlIG1haW50YWluZWQgYWdhaW4uCgpJ
biBmYWlybmVzcywgSSBkbyBhZ3JlZSB0aGF0IHRoZXJlIGlzIHZlcnkgbGl0dGxlIHZhbHVlIGlu
IGtlZXBpbmcgMzItYml0Ck1JUFMgb3IgUklTQy1WIHN1cHBvcnQgc2luY2UgdGhlIGNoaXBzIHRo
YXQgc3VwcG9ydCBpdCBhcmUgc28gbGltaXRlZC4KMzItYml0IFBvd2VyIGhvd2V2ZXIgc2VydmVz
IGFjdHVhbCBwdXJwb3Nlcy4gIDMyLWJpdCB4ODYgY291bGQgYmUgdXNlZnVsCnRvIG1ha2Ugc3Vy
ZSDigJxLVk0gb24gMzItYml0IGluIGdlbmVyYWzigJ0gaXMgZWFzaWVyIHRvIGtlZXAgZ29pbmcs
CmJ1dCBpZiBpdCBpcyBjYXVzaW5nIG1haW50ZW5hbmNlIGlzc3VlcyB0aGVuIEkgc3VwcG9zZSBp
dCBjYW4gZ28uCgpTaW5jZXJlbHksCi1Bbm5hCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
