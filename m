Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1914C77B7C
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOxbq2YGskBnDYRIMldyGUzWpROwXRLaJcAIJ4RzCl8=; b=jj1jKjI3vKT2ro
	NwRkw00QotJJKQD5rgY5teqeKl/bvLCyVXUF9xi78j+cKckM6OMCrAAYNSWINrGKyaOCTVBelWkyD
	+7SbJvXhD10+qunAq+Yrj1WVZvAM70I7DNHznt7horD+/7TBKChwAb1623nC+frsgJkGDsCxjNH4+
	1rx/YThO3sOHAHXzSg6eCVLShpyNRbypGfTGt9qIrTg6npp2Rj9els5tz6P6mqnIvsE5MRuswEQ/G
	EPj11ZYInioxetbXzQd6xt7dUcO4uVbX7YN/9AgO14MLyjXGfq310RdQgg4iPRMuVzHdrCIQaCz0T
	btXoS61qkR7iz0z4pWXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkV8-00000003UnN-0kZ2;
	Mon, 23 Jun 2025 16:58:34 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThFc-00000002shu-1V8l
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:30:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b321bd36a41so675567a12.2
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750685419; x=1751290219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKn166nhd2vRAB+vjvAn9tp9brfNmr3hAAU8p4nKNcM=;
        b=GbC7hrkSc/qMykCeIQ1Jas0DnSpMjJteQySjr7zll1t60zu+8M2ww4BnkTaNtqSM6h
         X3CCgJemcxNgfNXc8OlNjXswPtlJY6WGIeDo3Zg7mQA7F7tL3Aa+PYZuaOkSf2Xz8beg
         sxeJfILj9Pa2Y5IlfbyZEckqm/6qa1ZfnbRB/p+syPmhYHvsHGVQLmWs5mobmahscycS
         PEG4cAZT5fpVvEL8lhQEIKvvTHcDXJ9g/PqSIWNzV2NrziHCJwPSzOkVWs2haJCBVRyX
         1p3M3OfWgpAXLUrkWz7pMKc7+8MgzcOUq4m69cpMo5vdHl492Dsu4ThNRCuDTHoQ8yin
         uUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685419; x=1751290219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKn166nhd2vRAB+vjvAn9tp9brfNmr3hAAU8p4nKNcM=;
        b=mMSfAN1nj7rChk42xe3wJ3nTxsgKpRqvUL/o5T/ZZ3E4MH2mPEItuxP649sClLaEf7
         6DgDx9/xdyvQUU1G31TKUCVRSO13qK0LtRpSa00HlZJXRHHbpQPZ+re0zQFkATyBeFy1
         Ok2NPMqUCnf/6tL4uKYvUbxm01pXEtLloYThrRhXHVuFoR3xfu4z7Oxhgy4TDtIKYjYL
         O2U+vcEauQYPcSNhofDcJtP4N9LZ3j5BuCmnEYpPOAQmg7ZvqMGmc89NG2T34I4+KfJf
         0OCHK8lABoPEubYzY/zkTHRp7txrMNEAJmv5kG1yvMN8HLhiRJaaYE+ZpaIp66FJKIEU
         p+jg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGs1z/PQOo/2H/asVMvffDUHtYK3k8wktRRvEd0L6LA+v8t8u8mCdwKN/qLw9KNOb692aid/OqEc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr4oF5lncJw2eMATPfb4le/lBLSZkuhV8uGaVkhPD+rI8y3jC9
	BjLPA/F1v+5xz1O9yW7M1SQ4CUaG1jxjUryVfx94DVjjzrEmmN3SlwBCvV9flXsM/tcOuug1qMa
	RnZyQnjywJi+9uBS7KT6w+IpSvs4SpQZgfGx8AFLwaQ==
X-Gm-Gg: ASbGncs+t+VtQikyfC50QldcX9ULwKfTn4TQrpo3Kxa8yu0lov6TEVCA5o2J8j8ESsJ
	G3Ou4aDCWQ1Wp078+iMQUrzic8khSA8mzvDLxEEaWo2PM1S5OsHmb9GZWC/FPzZqPrbn108RiLJ
	VC9OeWR7dlUTFuRm8hws6PFI9l/CG0PZt1qQDjza+wRcYII6rpCvxh147N
X-Google-Smtp-Source: AGHT+IHF1Hcuk/RAkT+EseXWRNvrv+2qmNTXnsVVg6nxOR87Q4OB77LUweEQu2VwDvVZDZZRDNtkS3pR8bqS8cw2TjI=
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-3159d8d685dmr23055733a91.24.1750685418484; Mon, 23 Jun 2025
 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com> <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
In-Reply-To: <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 21:30:07 +0800
X-Gm-Features: AX0GCFuZrApuLifWgQXPn_CdwuukUUywAVgWxIPzad1ai5Q1hxJEOckJdpBbxn8
Message-ID: <CAPYmKFvT6HcFByEq+zkh8UBUCyQS_Rv4drnCUU0o-HQ4eScVdA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_063020_747394_919B15A6 
X-CRM114-Status: GOOD (  33.05  )
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

SGkgQ2zDqW1lbnQsCgpPbiBNb24sIEp1biAyMywgMjAyNSBhdCA4OjM14oCvUE0gQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAyMy8wNi8yMDI1
IDE0OjEyLCBYdSBMdSB3cm90ZToKPiA+IEhpIENsw6ltZW50LAo+ID4KPiA+IE9uIE1vbiwgSnVu
IDIzLCAyMDI1IGF0IDQ6MDXigK9QTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIDIwLzA2LzIwMjUgMTQ6MDQsIFJhZGlt
IEtyxI1tw6HFmSB3cm90ZToKPiA+Pj4gMjAyNS0wNi0yMFQxNzoxNzoyMCswODowMCwgWHUgTHUg
PGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+ID4+Pj4gRGVsZWdhdGUgaWxsZWdhbCBpbnN0
cnVjdGlvbiBmYXVsdCB0byBWUyBtb2RlIGluIGRlZmF1bHQgdG8gYXZvaWQgc3VjaAo+ID4+Pj4g
ZXhjZXB0aW9ucyBiZWluZyB0cmFwcGVkIHRvIEhTIGFuZCByZWRpcmVjdGVkIGJhY2sgdG8gVlMu
Cj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5j
ZS5jb20+Cj4gPj4+PiAtLS0KPiA+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+Pj4+
IEBAIC00OCw2ICs0OCw3IEBACj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJJVChFWENfSU5TVF9JTExFR0FMKSAgICB8IFwKPiA+Pj4KPiA+Pj4gWW91IHNob3Vs
ZCBhbHNvIHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2bV9yaXNjdl92Y3B1X2V4aXQuCj4gPj4+
Cj4gPj4+IEFuZCB3aHkgbm90IGRlbGVnYXRlIHRoZSBvdGhlcnMgYXMgd2VsbD8KPiA+Pj4gKEVY
Q19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NFU1Ms
Cj4gPj4+ICBFWENfU1RPUkVfQUNDRVNTLCBhbmQgRVhDX0lOU1RfQUNDRVNTLikKPiA+Pgo+ID4+
IEN1cnJlbnRseSwgT3BlblNCSSBkb2VzIG5vdCBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGV4Y2VwdGlv
biBieSBkZWZhdWx0IGFuZAo+ID4+IGhhbmRsZXMgbWlzYWxpZ25lZCBhY2Nlc3MgYnkgaXRzZWxm
LCB0aGlzIGlzIChwYXJ0aWFsbHkpIHdoeSB3ZSBhZGRlZAo+ID4+IHRoZSBGV0ZUIFNCSSBleHRl
bnNpb24gdG8gcmVxdWVzdCBzdWNoIGRlbGVnYXRpb24uIFNpbmNlIHNvbWUgc3VwZXJ2aXNvcgo+
ID4+IHNvZnR3YXJlIGV4cGVjdCB0aGF0IGRlZmF1bHQsIHRoZXkgZG8gbm90IGhhdmUgY29kZSB0
byBoYW5kbGUgbWlzYWxpZ25lZAo+ID4+IGFjY2Vzc2VzIGVtdWxhdGlvbi4gU28gdGhleSBzaG91
bGQgbm90IGJlIGRlbGVnYXRlZCBieSBkZWZhdWx0Lgo+ID4KPiA+IEl0IGRvZXNuJ3QgbWF0dGVy
IHdoZXRoZXIgdGhlc2UgZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIGluIG1lZGVsZWcuCj4KPiBO
b3Qgc3VyZSB0byB0b3RhbGx5IHVuZGVyc3RhbmQsIGJ1dCBpZiB0aGUgZXhjZXB0aW9ucyBhcmUg
bm90IGRlbGVnYXRlZAo+IGluIG1lZGVsZWcsIHRoZXkgd29uJ3QgYmUgZGVsZWdhdGVkIHRvIFZT
LW1vZGUgZXZlbiB0aG91Z2ggaGVkZWxlZyBiaXQKPiBpcyBzZXQgcmlnaHQgPyBUaGUgc3BlYyBz
YXlzOgo+Cj4gQSBzeW5jaHJvbm91cyB0cmFwIHRoYXQgaGFzIGJlZW4gZGVsZWdhdGVkIHRvIEhT
LW1vZGUgKHVzaW5nIG1lZGVsZWcpCj4gaXMgZnVydGhlciBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSBp
ZiBWPTEgYmVmb3JlIHRoZSB0cmFwIGFuZCB0aGUKPiBjb3JyZXNwb25kaW5nIGhlZGVsZWcgYml0
IGlzIHNldC4KClllcywgeW91IGFyZSByaWdodC4gVGhlIGlsbGVnYWwgaW5zbiBleGNlcHRpb24g
aXMgc3RpbGwgdHJhcHBlZCBpbiBNCm1vZGUgaWYgaXQgaXMgbm90IGRlbGVnYXRlZCBpbiBtZWRl
bGVnLiBCdXQgZGVsZWdhdGluZyBpdCBpbiBoZWRlbGVnCmlzIHN0aWxsIHVzZWZ1bC4gVGhlIG9w
ZW5zYmkgd2lsbCBjaGVjayBDU1JfSEVERUxFRyBpbiB0aGUgZnVuY3Rpb24Kc2JpX3RyYXBfcmVk
aXJlY3QuIElmIHRoZSBleGNlcHRpb24gaGFzIGJlZW4gZGVsZWdhdGVkIHRvIFZTLW1vZGUgaW4K
Q1NSX0hFRExFRywgb3BlbnNiaSBjYW4gZGlyZWN0bHkgcmV0dXJuIGJhY2sgdG8gVlMtbW9kZSwg
d2l0aG91dCB0aGUKb3ZlcmhlYWQgb2YgZ29pbmcgYmFjayB0byBIUy1tb2RlIGFuZCB0aGVuIGdv
aW5nIGJhY2sgdG8gVlMtbW9kZS4KCj4KPgo+Cj4gPiBLVk0gaW4gSFMtbW9kZSBkb2VzIG5vdCBo
YW5kbGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBvciBtaXNhbGlnbmVkCj4gPiBhY2Nlc3MgYW5kIG9u
bHkgcmVkaXJlY3RzIHRoZW0gYmFjayB0byBWUy1tb2RlLiBEZWxlZ2F0aW5nIHN1Y2gKPiA+IGV4
Y2VwdGlvbnMgaW4gaGVkZWxlZyBoZWxwcyBzYXZlIENQVSB1c2FnZSBldmVuIHdoZW4gdGhleSBh
cmUgbm90Cj4gPiBkZWxlZ2F0ZWQgaW4gbWVkZWxlZzogb3BlbnNiaSB3aWxsIGNoZWNrIHdoZXRo
ZXIgdGhlc2UgZXhjZXB0aW9ucyBhcmUKPiA+IGRlbGVnYXRlZCB0byBWUy1tb2RlIGFuZCByZWRp
cmVjdCB0aGVtIHRvIFZTLW1vZGUgaWYgcG9zc2libGUuIFRoZXJlCj4gPiBzZWVtcyB0byBiZSBu
byBjb25mbGljdHMgd2l0aCBTU0UgaW1wbGVtZW50YXRpb24uIFBsZWFzZSBjb3JyZWN0IG1lIGlm
Cj4gPiBJIG1pc3NlZCBhbnl0aGluZy4KPgo+IEFGQUlVLCB0aGlzIG1lYW5zIHRoYXQgc2luY2Ug
bWVkZWxlZyBiaXQgZm9yIG1pc2FsaWduZWQgYWNjZXNzZXMgd2VyZQo+IG5vdCBkZWxlZ2F0ZWQg
dXAgdG8gdGhlIGludHJvZHVjdGlvbiBvZiB0aGUgRldGVCBleHRlbnNpb24sIFZTLW1vZGUKPiBn
ZW5lcmF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3ZXJlIGhhbmRsZWQgYnkgT3BlblNCSSByaWdo
dCA/IE5vdyB0aGF0Cj4gd2UgYXJlIHJlcXVlc3Rpbmcgb3BlblNCSSB0byBkZWxlZ2F0ZSBtaXNh
bGlnbmVkIGFjY2Vzc2VzLCBIUy1tb2RlCj4gaGFuZGxlcyBpdCdzIG93biBtaXNhbGlnbmVkIGFj
Y2Vzc2VzIHRocm91Z2ggdGhlIHRyYXAgaGFuZGxlci4gV2l0aCB0aGF0Cj4gY29uZmlndXJhdGlv
biwgaWYgVlMtbW9kZSBnZW5lcmF0ZSBhIG1pc2FsaWduZWQgYWNjZXNzLCBpdCB3aWxsIGVuZCB1
cAo+IGJlaW5nIHJlZGlyZWN0ZWQgdG8gVlMtbW9kZSBhbmQgd29uJ3QgYmUgaGFuZGxlIGJ5IEhT
LW1vZGUuCj4KPiBUbyBzdW1tYXJpemUsIHByaW9yIHRvIEZXRlQsIG1lZGVsZWcgd2Fzbid0IGRl
bGVnYXRpbmcgbWlzYWxpZ25lZAo+IGFjY2Vzc2VzIHRvIFMtbW9kZToKPgo+IC0gVlMtbW9kZSBt
aXNhbGlnbmVkIGFjY2VzcyAtPiB0cmFwIHRvIE0tbW9kZSAtPiBPcGVuU0JJIGhhbmRsZSBpdCAt
Pgo+IEJhY2sgdG8gVlMtbW9kZSwgbWlzYWxpZ25lZCBhY2Nlc3MgZml4ZWQgdXAgYnkgT3BlblNC
SQoKWWVzLCB0aGlzIGlzIHdoYXQgSSB3YW50IHRoZSBwcm9jZWR1cmUgb2YgaGFuZGxpbmcgaWxs
ZWdhbCBpbnNuCmV4Y2VwdGlvbnMgdG8gYmUuIEFjdHVhbGx5IGl0IG5vdyBiZWhhdmVzIGFzOgoK
VlMtbW9kZSBpbGxlZ2FsIGluc24gZXhjZXB0aW9uIC0+IHRyYXAgdG8gTS1tb2RlIC0+IE9wZW5T
QkkgaGFuZGxlcyBpdAotPiBCYWNrIHRvIEhTLW1vZGUsIGRvZXMgbm90aGluZyAtPiBCYWNrIHRv
IFZTLW1vZGUuCgpJIHdhbnQgdG8gYXZvaWQgZ29pbmcgdGhyb3VnaCBIUy1tb2RlLgoKPgo+IE5v
dyB0aGF0IExpbnV4IHVzZXMgU0JJIEZXRlQgdG8gZGVsZWdhdGVzIG1pc2FsaWduZWQgYWNjZXNz
ZXMgKHdpdGhvdXQKPiBoZWRlbGVnIGJlaW5nIHNldCBmb3IgbWlzYWxpZ25lZCBkZWxlZ2F0aW9u
LCBidXQgdGhhdCBkb2Vzbid0IHJlYWxseQo+IG1hdHRlciwgdGhlIG91dGNvbWUgaXMgdGhlIHNh
bWUpOgo+Cj4gLSBWUy1tb2RlIG1pc2FsaWduZWQgYWNjZXNzIC0+IHRyYXAgdG8gSFMtbW9kZSAt
PiByZWRpcmVjdGlvbiB0bwo+IFZTLW1vZGUsIG5lZWRzIHRvIGhhbmRsZSB0aGUgbWlzYWxpZ25l
ZCBhY2Nlc3MgYnkgaXRzZWxmCj4KPgo+IFRoaXMgbWVhbnMgdGhhdCBwcmV2aW91c2x5LCBtaXNh
bGlnbmVkIGFjY2VzcyB3ZXJlIHNpbGVudGx5IGZpeGVkIHVwIGJ5Cj4gT3BlblNCSSBmb3IgVlMt
bW9kZSBhbmQgbm93IHRoYXQgRldGVCBpcyB1c2VkIGZvciBkZWxlZ2F0aW9uLCB0aGlzIGlzbid0
Cj4gdHJ1ZSBhbnltb3JlLiBTbywgb2xkIGtlcm5lbCBvciBzdWVwcnZpc29yIHNvZnR3YXJlIHRo
YXQgIGluY2x1ZGVkIGNvZGUKPiB0byBoYW5kbGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyB3aWxsIGNy
YXNoLiBEaWQgSSBtaXNzZWQgc29tZXRoaW5nID8KCkdyZWF0ISBZb3UgbWFrZSBpdCB2ZXJ5IGNs
ZWFyISBUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEJ1dCBldmVuCndoZW4gbWlzYWxpZ24g
ZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIHRvIEhTLW1vZGUsIEtWTSBzZWVtcyB0byBkbwpub3Ro
aW5nIGJ1dCByZWRpcmVjdCB0byBWUy1tb2RlIHdoZW4gVk0gZ2V0IHRyYXBwZWQgZHVlIHRvIG1p
c2FsaWduCmV4Y2VwdGlvbnMuIFNvIG1heWJlIHdlIGNhbiBkaXJlY3RseSBkZWxlZ2F0ZSB0aGUg
bWlzYWxpZ25lZApleGNlcHRpb25zIGluIGhlZGVsZWcgdG9vIGJlZm9yZSBydW5uaW5nIFZDUFUg
YW5kIHJldHJpZXZlIHRoZW0gYWZ0ZXIKVkNQVSBleGlzdHMuIEFuZCB0aGVuIHRoZSBoYW5kbGlu
ZyBwcm9jZWR1cmUgd2lsbCBiZToKClZTLW1vZGUgbWlzYWxpZ25lZCBleGNlcHRpb24gLT4gdHJh
cCB0byBWUy1tb2RlIC0+IFZTIGhhbmRsZXMgaXQgLT4KQmFjayB0byBWVS1tb2RlLgoKUGxlYXNl
IGNvcnJlY3QgbWUgaWYgSSBtaXNzZWQgYW55dGhpbmcuCgpCZXN0IFJlZ2FyZHMsCgpYdSBMdQoK
Pgo+IE5vdGU6IHRoaXMgaXMgbm90IGRpcmVjdGx5IHJlbGF0ZWQgdG8geW91ciBzZXJpZXMgYnV0
IG15IGludHJvZHVjdGlvbiBvZgo+IEZXRlQgIQo+Cj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+
ID4KPiA+IEJlc3QgUmVnYXJkcywKPiA+IFh1IEx1Cj4gPgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+
Cj4gPj4gQ2zDqW1lbnQKPiA+Pgo+ID4+Pgo+ID4+PiBUaGFua3MuCj4gPj4+Cj4gPj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+ID4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKPiA+Pgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
