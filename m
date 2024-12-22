Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC8E77188
	for <kvm-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dV7FY2/yewF4KczhO/7Wa24p6jnWPSoiE3SQOmqtc6U=; b=i4qDu76DN+86OI
	TMXHjfnmvPM2HMCrdcFQ4Yd9mdnaXaeAAIprcMnFvND3HvT16uxbpiFkb9QofNgctoWSOOqsbcRKv
	n+/LqR9vdF8bHzD32kJ/qj6SZpHO8o/S6cJsGzQynyl3V4tyDf8Tqwzu93aWGMOkdiWuowBR+XHUB
	RFa+mOX4AZn2GCM7VPHi3JrKSlEeOpT4fhMdzje7nvcVB+ilyPu7LHh/jmuRIjIdadkPtJPgr/u0+
	R44bKdijVVSXb8QyKiDvP6knVqb0H/C5ejOGNk+kZDKdk/av+vOaGsZBjFZ1neqPA5SbPFbzq6FFg
	9FFycrGhXv6LuLuoJE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPUbW-00000008ujB-3iQW;
	Sun, 22 Dec 2024 22:39:18 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPUbT-00000008uil-0MwM;
	Sun, 22 Dec 2024 22:39:16 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4BMMNW3F022029;
	Sun, 22 Dec 2024 16:23:32 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4BMMNR4S022013;
	Sun, 22 Dec 2024 16:23:27 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 22 Dec 2024 16:23:26 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "A. Wilcox" <AWilcox@wilcox-tech.com>, Arnd Bergmann <arnd@kernel.org>,
        kvm@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/5] powerpc: kvm: drop 32-bit book3s
Message-ID: <20241222222325.GD20626@gate.crashing.org>
References: <20241221214223.3046298-1-arnd@kernel.org> <20241221214223.3046298-5-arnd@kernel.org> <9B9E07F0-3373-4F59-BE4C-E6C425B3C36D@Wilcox-Tech.com> <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6253307c-d3d6-485f-9d01-12787b457a99@app.fastmail.com>
User-Agent: Mutt/1.4.2.3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_143915_803524_D8DD3BB2 
X-CRM114-Status: GOOD (  17.20  )
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

T24gU3VuLCBEZWMgMjIsIDIwMjQgYXQgMTA6MDk6MTRQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBTdW4sIERlYyAyMiwgMjAyNCwgYXQgMDM6MTMsIEEuIFdpbGNveCB3cm90ZToK
PiA+IE9uIERlYyAyMSwgMjAyNCwgYXQgMzo0MuKAr1BNLCBBcm5kIEJlcmdtYW5uIDxhcm5kQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ICAgICBSMCAuLiBSNyAgICAgICAgICAgUjggLi4gUjE1
ICAgICAgICAgUjE2IC4uIFIyMyAgICAgICAgIFIyNCAuLiBSMzEKPiA+IDAwMDAwMDAwMDE0YTEx
MjQgICAwMDAwMDAwMDAwMDAwMDAwICAgMDAwMDAwMDAwMTM1YjRhYyAgIDAwMDAwMDAwMDAwMDAw
MDAgICAKPiA+IDAwMDAwMDAwMGRjNzBmMzAgICBmZmZmZmZmZmMwMDAwMDAwICAgMDAwMDAwMDAw
ZGM3MGZhNCAgIDAwMDAwMDAwMDE3MzYwMGMgICAKPiA+IDAwMDAwMDAwMDAwMDAwMDAgICAwMDAw
MDAwMDBlNDc3MDEwICAgMDAwMDAwMDAwMDAwMDAwMCAgIDAwMDAwMDAwMDA0MDAwMDAgICAKPiA+
IGZmZmZmZmZmMDE0MWJlNGMgICAwMDAwMDAwMDAxNDlhYjc0ICAgMDAwMDAwMDBmZmZmZmZmZiAg
IDAwMDAwMDAwMDAwMDAwMDggICAKPiA+IDAwMDAwMDAwYzAwMTRiNmMgICAwMDAwMDAwMDIwMDAw
NDAyICAgMDAwMDAwMDA0MDQwMDAwMCAgIDAwMDAwMDAwMDE2ZjIwMDAgICAKPiA+IGZmZmZmZmZm
NDA0MDAwMDAgICAwMDAwMDAwMDAwMDAwMDAwICAgMDAwMDAwMDAwMDAwMDAwMCAgIDAwMDAwMDAw
MGRjNzBmNjAgICAKPiA+IDAwMDAwMDAwMDAwMDAwMDAgICAwMDAwMDAwMDAwMDAwMDAwICAgMDAw
MDAwMDAwZTczZDQ5MCAgIDAwMDAwMDAwMDE0OWYwMDAgICAKPiA+IDAwMDAwMDAwMDAwMDAwMDAg
ICAwMDAwMDAwMDBlNzU2MTE4ICAgMDAwMDAwMDAwZGM3MGZhMCAgIGZmZmZmZmZmNDA0MDAwMDAg
ICAKPiA+Cj4gPiAgICAgQ1IgLyBYRVIgICAgICAgICAgIExSIC8gQ1RSICAgICAgICAgIFNSUjAg
LyBTUlIxICAgICAgICBEQVIgLyBEU0lTUgo+ID4gICAgICAgICA4MDAwMDQwMiAgIDAwMDAwMDAw
MDE0YTExMjQgICAwMDAwMDAwMDAxNGExMTI4ICAgZmZmZmZmZmYwMTQxYmU0YyAgIAo+ID4gMDAw
MDAwMDAyMDA0MDAwMCAgIDAwMDAwMDAwMDAwMDAwMDAgICA4MDAwMDAwMDAwMDAzMDAwICAgICAg
ICAgICAwMDAwMDAwMCAgIAo+ID4KPiA+Cj4gPiAyID4gCj4gPgo+ID4gV2hpY2ggaXMgdGhlIHNh
bWUgdGhpbmcgdGhhdCBoYXBwZW5zIGlmIHlvdSBib290IGEgMzItYml0IExpbnV4IGtlcm5lbAo+
ID4gb24gYSBwaHlzaWNhbCA2NC1iaXQgUG93ZXIgbWFjaGluZS4gIFRoaXMgaXMgcHJvYmFibHkg
YmVjYXVzZSBLVk0gaXMKPiA+IHNvIG11Y2ggbW9yZSBhY2N1cmF0ZSB0aGFuIFRDRyBmb3IgUG93
ZXIgZW11bGF0aW9uIDopCj4gCj4gRGlkIHlvdSBhc2sga3ZtIHRvIGVtdWxhdGUgYSAzMi1iaXQg
cGxhdGZvcm0gdGhvdWdoPyBTaW5jZSB0aGUKPiByZWdpc3RlciBkdW1wIHNob3dzIDY0LWJpdCBy
ZWdpc3RlcnMsIG15IGd1ZXNzIGlzIHRoYXQgdGhpcyBpcyB0aGUKPiByZXN1bHQgb2YgdHJ5aW5n
IHRvIGxvYWQgYSAzMi1iaXQga2VybmVsIG9uICItbWFjaGluZSBwc2VyaWVzCj4gLWNwdSBuYXRp
dmUiLCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBndWVzdCBrZXJuZWwuIEkgd291bGQK
PiBleHBlY3QgdGhhdCB5b3UgbmVlZCBhdCBsZWFzdCBhIDMyLWJpdCBtYWNoaW5lIHR5cGUgKG1h
Yzk5LAo+IHBlZ2Fzb3MyKSBhbmQgbGlrZWx5IGFsc28gYSAzMi1iaXQgQ1BVICg3NDQ3YSwgZTYw
MCkuCgpTTE9GIGFsd2F5cyBzaG93cyA2NC1iaXQgcmVnaXN0ZXJzOyBTTE9GIG9ubHkgZXZlciBy
dW5zIGFzIDY0LWJpdApwcm9ncmFtLiAgVGhlICpjbGllbnQqIHByb2dyYW0gY2FuIGJlIDMyLWJp
dCBvZiBjb3Vyc2UsIGJ1dCB0aGUgZHVtcApvZiBTUlIxIGhlcmUgc2hvd3MgU0Y9MSAodGhlIHRv
cCBiaXQgdGhlcmUpLiAgTm8gaWRlYSB3aGF0IHdhcyBydW5uaW5nCmF0IHRoZSB0aW1lLCBidXQg
c29tZXRoaW5nIGluIHRoZSBrZXJuZWwgSSBndWVzcz8KCihUbyBzaG93IHRoZSBsYXN0IHNldCBj
bGllbnQgc3RhdGUsIHVzZQogIGNpcmVncyAucmVncwp0aGUgdGhpbmcgZXhjZXB0aW9ucyBwcmlu
dCBpcyB2aWEKICBlcmVncyAucmVncwpzbyB5b3UnbGwgcHJvYmFibHkgZmlndXJlIG91dCB0aGUg
Zm9ybWF0IDstKSApCgpJZiB0aGUgY2xpZW50IHByb2dyYW0gaXMgYSAzMi1iaXQgRUxGIGZpbGUs
IFNMT0Ygc3RhcnRzIHRoZSBjbGllbnQKcHJvZ3JhbSB3aXRoIFNGPTAuCgoKU2VnaGVyCgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
