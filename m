Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9729E7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 03:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOd9JkXJW6M+I+HxX8YJDXSmU+DwmH6aZe+Zq+v/mpM=; b=aCWIdtjC6n8YU8
	aHAT+1sx0WA1bjKZEffRq0V4TjF8ADHLKgvZHfhkBqZ95kNEeWaO7i3jMlztWuA6Fqvssjx4g5yhb
	tr5G5o5ZeKBlF/thvbzrzuLJFyGhKuPzepLEBDcHcJPkwRKQyY95ksF6zKcDwIQOanu13KPPykPdU
	WhgqbfVXEtKh259f06LJSa0fIo2G8WvB1yPl8UPLeAexSe2Aym4rOm2tZ4d4eGF/s9cVRn9quoRqy
	FNlPeUTuB+Hs/cFi9cv8bhc/iDkA0f5E4oZ7a9x7rqf7QvqRo7nbkBrga+RkQ3qOgvisbB9ePcpC4
	KoeoG0/d0N4Lg5AZRhww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLwnU-00000002dWn-0c0F;
	Fri, 13 Dec 2024 03:57:00 +0000
Received: from mail.wilcox-tech.com ([45.32.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLwnR-00000002dAT-1Qxv
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 03:56:58 +0000
Received: (qmail 15664 invoked from network); 13 Dec 2024 03:51:32 -0000
Received: from ip98-184-130-195.tu.ok.cox.net (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@98.184.130.195)
  by mail.wilcox-tech.com with ESMTPA; 13 Dec 2024 03:51:32 -0000
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [RFC 0/5] KVM: drop 32-bit host support on all architectures
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20241212125516.467123-1-arnd@kernel.org>
Date: Thu, 12 Dec 2024 21:51:26 -0600
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
Message-Id: <35E5C2A3-94AC-446B-A0A1-84B043DBC890@Wilcox-Tech.com>
References: <20241212125516.467123-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_195657_389146_192C86E2 
X-CRM114-Status: GOOD (  16.75  )
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

T24gRGVjIDEyLCAyMDI0LCBhdCA2OjU14oCvQU0sIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAKPiBJ
IHN1Ym1pdHRlZCBhIHBhdGNoIHRvIHJlbW92ZSBLVk0gc3VwcG9ydCBmb3IgeDg2LTMyIGhvc3Rz
IGVhcmxpZXIKPiB0aGlzIG1vbnRoLCBidXQgdGhlcmUgd2VyZSBzdGlsbCBjb25jZXJucyB0aGF0
IHRoaXMgbWlnaHQgYmUgdXNlZnVsIGZvcgo+IHRlc3RpbmcgMzItYml0IGhvc3QgaW4gZ2VuZXJh
bCwgYXMgdGhhdCByZW1haW5zIHN1cHBvcnRlZCBvbiB0aHJlZSBvdGhlcgo+IGFyY2hpdGVjdHVy
ZXMuIEkgaGF2ZSBnb25lIHRocm91Z2ggdGhvc2UgdGhyZWUgbm93IGFuZCBwcmVwYXJlZCBzaW1p
bGFyCj4gcGF0Y2hlcywgYXMgYWxsIG9mIHRoZW0gc2VlbSB0byBiZSBlcXVhbGx5IG9ic29sZXRl
Lgo+IAo+IFN1cHBvcnQgZm9yIDMyLWJpdCBLVk0gaG9zdCBvbiBBcm0gaGFyZHdhcmUgd2FzIGRy
b3BwZWQgYmFjayBpbiAyMDIwCj4gYmVjYXVzZSBvZiBsYWNrIG9mIHVzZXJzLCBkZXNwaXRlIENv
cnRleC1BNy9BMTUvQTE3IGJhc2VkIFNvQ3MgYmVpbmcKPiBtdWNoIG1vcmUgd2lkZWx5IGRlcGxv
eWVkIHRoYW4gdGhlIG90aGVyIHZpcnR1YWxpemF0aW9uIGNhcGFibGUgMzItYml0Cj4gQ1BVcyAo
SW50ZWwgQ29yZSBEdW8vU2lsdmVydGhvcm5lLCBQb3dlclBDIGUzMDAvZTUwMC9lNjAwLCBNSVBT
IFA1NjAwKQo+IGNvbWJpbmVkLgoKCkkgZG8gdXNlIDMyLWJpdCBLVk0gb24gYSBDb3JlIER1byDi
gJxZb25haOKAnSBhbmQgYSBQb3dlciBNYWMgRzQgKE1ERCksIGZvcgpwdXJwb3NlcyBvZiBiaXNl
Y3Rpbmcga2VybmVsIGlzc3VlcyB3aXRob3V0IGhhdmluZyB0byByZWJvb3QgdGhlIGhvc3QKbWFj
aGluZSAod2hlbiBpdCBjYW4gYmUgZHVwbGljYXRlZCBpbiBhIEtWTSBlbnZpcm9ubWVudCkuCgpJ
IHN1cHBvc2UgaXQgd291bGQgc3RpbGwgYmUgcG9zc2libGUgdG8gcnVuIHRoZSBob3N0cyBvbiA2
LjEyIExUUyBmb3IKc29tZSB0aW1lIHdpdGggbmV3ZXIgZ3Vlc3RzLCBidXQgaXQgd291bGQgYmUg
dW5mb3J0dW5hdGUuCgpCZXN0LAotYXJ3CgoKPiAKPiBJdCBwcm9iYWJseSBtYWtlcyBzZW5zZSB0
byBkcm9wIGFsbCBvZiB0aGVzZSBhdCB0aGUgc2FtZSB0aW1lLCBwcm92aWRlZAo+IHRoZXJlIGFy
ZSBubyBhY3R1YWwgdXNlcnMgcmVtYWluaW5nIChub3QgY291bnRpbmcgcmVncmVzc2lvbiB0ZXN0
aW5nCj4gdGhhdCBkZXZlbG9wZXJzIG1pZ2h0IGJlIGRvaW5nKS4gUGxlYXNlIGxldCBtZSBrbm93
IGlmIHlvdSBhcmUgc3RpbGwKPiB1c2luZyBhbnkgb2YgdGhlc2UgbWFjaGluZXMsIG9yIHRoaW5r
IHRoZXJlIG5lZWRzIHRvIGJlIGRlcHJlY2F0aW9uCj4gcGhhc2UgZmlyc3QuCj4gCj4gICAgICBB
cm5kCgotLQpBbm5hIFdpbGNveCAoc2hlL2hlcikKU1cgRW5naW5lZXJpbmc6IEMrKy9SdXN0LCBE
ZXZPcHMsIFBPU0lYLCBQeS9SdWJ5CldpbGNveCBUZWNobm9sb2dpZXMgSW5jLiAgfCAgQWTDqWxp
ZSBMaW51eAotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
