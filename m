Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA4FE7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFfnqyMi6kmKgrVEf8QS5FQT4x5pYsYm+OAKBUH0eHs=; b=iyvHwGHpk+xtrD
	HlLBhztTdMj4x2yuwyEImsG6eVBSD/WoNo0Gu/YWl1Z/3ve9fIauSqGCg/L3L/B7PKGyUrE7ScDIL
	lM41fFQEZPKcOmA9ii46kSvomqpaj3zdK5k/ptCcHkZBi2dEUP1iZpLYyMhFEgMRUbdzWJmN+fXXV
	hFU0HDHbu4IX+14sBAyH60R0vXICZNP9vgb7gaMLQLiPENhmHzNKBZA3Z/CvLZtbEGumQqhpFDtd0
	9BMqENn3xG3kY/0CnDx2iRMOtl2utq2EnggGO364EAbrebEJeEbUNpnedEjdwFF/oXm9BKhViM/gK
	JGKSMLezevr5diFEyI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1HR-0000000385f-18sF;
	Fri, 13 Dec 2024 08:44:13 +0000
Received: from mail.wilcox-tech.com ([45.32.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1HH-00000003830-1zgH
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 08:44:04 +0000
Received: (qmail 23536 invoked from network); 13 Dec 2024 08:42:53 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 13 Dec 2024 08:42:53 -0000
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
Date: Fri, 13 Dec 2024 02:42:41 -0600
Cc: Arnd Bergmann <arnd@arndb.de>,
 Arnd Bergmann <arnd@kernel.org>,
 kvm@vger.kernel.org,
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
Message-Id: <CE1F96B2-7213-4352-B80F-6E669F5EED97@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
 <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
 <6e971322-8b21-4d73-922c-a6032c6fe9bd@app.fastmail.com>
 <79b9abfe-cfb8-4ef0-8a4b-7b87787e6549@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_004403_521671_30F97AEA 
X-CRM114-Status: GOOD (  23.23  )
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

T24gRGVjIDEzLCAyMDI0LCBhdCAyOjIw4oCvQU0sIFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJl
ZGhhdC5jb20+IHdyb3RlOgo+IAo+IE9uIDEyLzEzLzI0IDA5OjAzLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+PiBPbiBGcmksIERlYyAxMywgMjAyNCwgYXQgMDQ6NTEsIEEuIFdpbGNveCB3cm90ZToK
Pj4+IE9uIERlYyAxMiwgMjAyNCwgYXQgNjo1NeKAr0FNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Pj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
Cj4+Pj4gCj4+Pj4gSSBzdWJtaXR0ZWQgYSBwYXRjaCB0byByZW1vdmUgS1ZNIHN1cHBvcnQgZm9y
IHg4Ni0zMiBob3N0cyBlYXJsaWVyCj4+Pj4gdGhpcyBtb250aCwgYnV0IHRoZXJlIHdlcmUgc3Rp
bGwgY29uY2VybnMgdGhhdCB0aGlzIG1pZ2h0IGJlIHVzZWZ1bCBmb3IKPj4+PiB0ZXN0aW5nIDMy
LWJpdCBob3N0IGluIGdlbmVyYWwsIGFzIHRoYXQgcmVtYWlucyBzdXBwb3J0ZWQgb24gdGhyZWUg
b3RoZXIKPj4+PiBhcmNoaXRlY3R1cmVzLiBJIGhhdmUgZ29uZSB0aHJvdWdoIHRob3NlIHRocmVl
IG5vdyBhbmQgcHJlcGFyZWQgc2ltaWxhcgo+Pj4+IHBhdGNoZXMsIGFzIGFsbCBvZiB0aGVtIHNl
ZW0gdG8gYmUgZXF1YWxseSBvYnNvbGV0ZS4KPj4+PiAKPj4+PiBTdXBwb3J0IGZvciAzMi1iaXQg
S1ZNIGhvc3Qgb24gQXJtIGhhcmR3YXJlIHdhcyBkcm9wcGVkIGJhY2sgaW4gMjAyMAo+Pj4+IGJl
Y2F1c2Ugb2YgbGFjayBvZiB1c2VycywgZGVzcGl0ZSBDb3J0ZXgtQTcvQTE1L0ExNyBiYXNlZCBT
b0NzIGJlaW5nCj4+Pj4gbXVjaCBtb3JlIHdpZGVseSBkZXBsb3llZCB0aGFuIHRoZSBvdGhlciB2
aXJ0dWFsaXphdGlvbiBjYXBhYmxlIDMyLWJpdAo+Pj4+IENQVXMgKEludGVsIENvcmUgRHVvL1Np
bHZlcnRob3JuZSwgUG93ZXJQQyBlMzAwL2U1MDAvZTYwMCwgTUlQUyBQNTYwMCkKPj4+PiBjb21i
aW5lZC4KPj4+IAo+Pj4gCj4+PiBJIGRvIHVzZSAzMi1iaXQgS1ZNIG9uIGEgQ29yZSBEdW8g4oCc
WW9uYWjigJ0gYW5kIGEgUG93ZXIgTWFjIEc0IChNREQpLCBmb3IKPj4+IHB1cnBvc2VzIG9mIGJp
c2VjdGluZyBrZXJuZWwgaXNzdWVzIHdpdGhvdXQgaGF2aW5nIHRvIHJlYm9vdCB0aGUgaG9zdAo+
Pj4gbWFjaGluZSAod2hlbiBpdCBjYW4gYmUgZHVwbGljYXRlZCBpbiBhIEtWTSBlbnZpcm9ubWVu
dCkuCj4+PiAKPj4+IEkgc3VwcG9zZSBpdCB3b3VsZCBzdGlsbCBiZSBwb3NzaWJsZSB0byBydW4g
dGhlIGhvc3RzIG9uIDYuMTIgTFRTIGZvcgo+Pj4gc29tZSB0aW1lIHdpdGggbmV3ZXIgZ3Vlc3Rz
LCBidXQgaXQgd291bGQgYmUgdW5mb3J0dW5hdGUuCj4+IFdvdWxkIGl0IGJlIGFuIG9wdGlvbiBm
b3IgeW91IHRvIGp1c3QgdGVzdCB0aG9zZSBrZXJuZWxzIG9uIDY0LWJpdAo+PiBtYWNoaW5lcz8g
SSBhc3N1bWUgeW91IHByZWZlciB0byBkbyBuYXRpdmUgYnVpbGRzIG9uIDMyLWJpdCBoYXJkd2Fy
ZQo+PiBiZWNhdXNlIHRoYXQgZml0cyB5b3VyIHdvcmtmbG93LCBidXQgb25jZSB5b3UgZ2V0IGlu
dG8gZGVidWdnaW5nCj4+IGluIGEgdmlydHVhbCBtYWNoaW5lLCB0aGUgcmVzdWx0cyBzaG91bGQg
Z2VuZXJhbGx5IGJlIHRoZSBzYW1lIHdoZW4KPj4gYnVpbGRpbmcgYW5kIHJ1bm5pbmcgb24gYSA2
NC1iaXQgaG9zdCBmb3IgYm90aCB4ODYtMzIgYW5kIHBwYzMyLWNsYXNzaWMsCj4+IHJpZ2h0Pwo+
IAo+IENlcnRhaW5seSBmb3IgeDg2LTMyOyBwcGMzMiBzaG91bGQgYmUgYWJsZSB0byB1c2UgUFIt
c3RhdGUgKGFrYQo+IHRyYXAgYW5kIGVtdWxhdGUpIEtWTSBvbiBhIDY0LWJpdCBob3N0IGJ1dCBp
dCdzIGEgYml0IG1vcmUgcGlja3kuCj4gQW5vdGhlciBwb3NzaWJpbGl0eSBmb3IgcHBjMzIgaXMg
anVzdCBlbXVsYXRpb24gd2l0aCBRRU1VLgo+IAo+IFBhb2xvCgoKTW9zdCBvZiB0aGUgcmVhc29u
IEkgdXNlIEtWTSBpbnN0ZWFkIG9mIGVtdWxhdGlvbiBpcyBiZWNhdXNlIEkgZG9u4oCZdAp0cnVz
dCBRRU1VIGVtdWxhdGlvbiBhdCBhbGwuICBUaGVyZSB3YXMgZXZlbiBhIGtlcm5lbCBidWcgdGhh
dCB3YXMKaW50cm9kdWNlZCBhZmZlY3RpbmcgMzItYml0IHg4NiBpbiB0aGUgNC4wIGN5Y2xlIHRo
YXQgb25seSBoYXBwZW5lZApiZWNhdXNlIFFFTVUgd2FzbuKAmXQgZW11bGF0aW5nIHdyaXRlcyB0
byAlY3I0IHByb3Blcmx5WzFdLiAgQW5kIFBQQzMyCmVtdWxhdGlvbiBpcyBmYXIgd29yc2UgdGhh
biB4ODZfMzIuICBIb3dldmVyLCBJIHByb2JhYmx5IGNvdWxkIGVuZAp1cCBkb2luZyB4ODZfMzIg
dGVzdGluZyBvbiBhIGNvbWJpbmF0aW9uIG9mIGJhcmUgbWV0YWwgbWFjaGluZXMgYW5kCktWTSBv
biB4ODZfNjQsIHN1cmUuCgpBcyBmb3IgUG93ZXI6IEkgd2lsbCBhZG1pdCBJIGhhdmVu4oCZdCB0
ZXN0ZWQgbGF0ZWx5LCBidXQgd2VsbCBpbnRvCnRoZSA1IHNlcmllcyAoNS40LCBhdCBsZWFzdCks
IHlvdSBjb3VsZG7igJl0IGJvb3QgYSBwcGMzMiBMaW51eCBrZXJuZWwKb24gYW55IDY0LWJpdCBj
YXBhYmxlIGhhcmR3YXJlLiAgSXQgd291bGQgdGhyb3cgd2hhdCBJIGJlbGlldmUgd2FzIGFuCmFs
aWdubWVudCBlcnJvciB3aGlsZSBxdWllc2NpbmcgT3BlbkZpcm13YXJlIGFuZCB0b3NzIHlvdSBi
YWNrIHRvIGFuCuKAmG9rID7igJkgcHJvbXB0LiAgVW5mb3J0dW5hdGVseSBJIGNhbuKAmXQgZmlu
ZCBhbnkgb2YgdGhlIGJ1ZyByZXBvcnRzCm9yIE1MIHRocmVhZHMgZnJvbSB0aGUgdGltZSAtIGl0
IHdhcyBhIGtub3duIGJ1ZyBpbiB0aGUgMi42IGRheXMgLSBidXQKdGhlIGFuc3dlciB3YXMgYWx3
YXlzIOKAnHdoeSBhcmUgeW91IGJvb3RpbmcgYSBwcGMzMiBrZXJuZWwgb24gdGhhdApoYXJkd2Fy
ZSBhbnl3YXk/ICBJdOKAmXMgYSBwcGM2NCBtYWNoaW5lIeKAnSAgSXMgdGhpcyBhIGNhc2Ugd2hl
cmUKdGhhdCB3b3VsZCBiZSBhY2NlcHRlZCBhcyBhIGxlZ2l0aW1hdGUgYnVnIG5vdz8gIEl0IHdv
dWxkIGJlIGxvdmVseQp0byB1c2UgbXkgbGFyZ2VseS1TTVQgMy4wIEdIeiBQb3dlcjkgYm94IGZv
ciBtb3JlIG9mIG15IGtlcm5lbCB0ZXN0aW5nCih3aGVyZSBwb3NzaWJsZSkgaW5zdGVhZCBvZiBy
ZWx5aW5nIG9uIGEgOTMzIE1IeiBzaW5nbGUtdGhyZWFkIEc0LgoKLWFydwoKWzFdOiBodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvY29tbWl0Lz9pZD1hODMzNTgxZTM3MmE7Ckl0IGhhZCBzb21lIGZvcm0gb2Ygc2VjdXJpdHkg
aW1wYWN0IG9uIFBlbnRpdW0tY2xhc3MgbWFjaGluZXMsIHRvbywKYXMgUkRQTUMgYmVjYW1lIGF2
YWlsYWJsZSB0byBub24tcm9vdCBldmVuIHdoZW4gL3N5cy9kZXZpY2VzL2NwdS9yZHBtYwp3YXMg
MC4KLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
