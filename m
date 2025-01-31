Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D184C0218F
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 17:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFqi0U1GtPy/GUv2kfy1M7alTUGEOGZXC6CV1b/SEtE=; b=NA1CT7dj54Ei3l
	9PgULt6RFn1DuTffU8g5Rcj+EoeEvX7WyMcjl/2XLPBVAibs5iZXzIMr5Jw3UHLazhuK3ELr7jmVG
	pk6DgzTCqtgxgC5vFWBc4wjSt9Guxg69pHTM4qCEV+f7+dBI9KCQAwWdtJXvzfGEyRuSP62f7xUXZ
	HRYBILxJqV36Px0/df03E3E0pnFyY/TOOxYUWbtwlzpTcQKWVYtN7zahwiEZlv9eAu3cmvi4yiFGW
	OC9k09YyvyzGm+LDVLoHamyItZLn5Tpa+FAcRFbjNe5SyEKw2T55OMBI0twL+cBbHdbg13umq7eO6
	WsU2icaSOqPmMAPpv4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduU1-0000000B4rV-33qn;
	Fri, 31 Jan 2025 17:07:09 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduTz-0000000B4qX-2JxG
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 17:07:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so2567386e87.1
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Jan 2025 09:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738343225; x=1738948025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2ObSa2ktByBUTSMTXb6jDkF0AzkOuGCrmxpYzPmVH0=;
        b=Txgtk0t36BMfZQcEXSNvkizbs4XylNLyYe1BRIRMH5yBH4YoqwiU8z9rUSSIQi8Bf6
         u9q/awjaO+EqA83UmrTm4NpBEmknQag1XKHytXxdudWAvqTlrQYDRpdpI8PHkuLXM9g3
         Fi+MzqeV5wB5Vw9zPALDXV9tcLEJ59yhl+kxv44JKurvFFV5O3NnsKTIFAgGUpacS9ba
         OI6NVtiQtvtcambUZH+vfGl0kTZQVXxI7eM2WN7dE5YmFw6WdIMr+nXU9wzcMbwa3DOQ
         4DQWVuq0/Tg0wr45NCn9Maoh16F+W0cSX/vPBIIA9caaQLIXQRT/afS89+D6I6qpXSAO
         UGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343225; x=1738948025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2ObSa2ktByBUTSMTXb6jDkF0AzkOuGCrmxpYzPmVH0=;
        b=YO770pOlEEEFtWpWOAhOKW+A/RWeHV8HFrsDMzAug5YpXDl4byfncQWYcMy6NdBcwG
         82DzUXqyVvaMeQ57FadA0fbXXPHkVnsAxJ5m/dcHATDCtT5ivzgQyljeEmisBLaFrzLT
         hQ91MwkP0jaVHyqUo0acccLUbhZn4AuQ1gMN/M/0DipssuEBoqxkJayCs9zSeMpruAGi
         tjj8xOvFiJK8BxgmveaQPUg4vliG61t6SrYd5RE3FtI1L/gg4QqmRkAdPdMYoC9naaJf
         s/fSMADxDRgKAfZtkV+H0xb7B4IclAFS0+qJOfrRKwFcFjxtKuls3sdZSrMVxZvdIAoA
         Obdg==
X-Gm-Message-State: AOJu0Yw9r6lUqheIeVXIALQYZHJxmUfrcziWGYhs+keGLQpbWT79jdpr
	yv/Ey2HLMCcuq8z6qPMjiip+2ome6mD0FlUwuLDSlfXxQxZvaxET2Keg3Y3LMWCn6Q2ZiMA+an9
	PSpN5H0l0GuV4SNTv92jbJrR4a3azvv8cYRfBdPwTj8lKzQDz1sM=
X-Gm-Gg: ASbGncs9ucJPe75fqLaovvBOacwO16aeWvd+tHuewuxg3FpXeb/oOg7iItN11yhEAU5
	vBf5VjgzxrcevFm9I6p+1TjfoMOyEEntfhuDchvULK/oNPcxDRaPgB0DWGYI+3hWuSEcWkT899Q
	==
X-Google-Smtp-Source: AGHT+IGu79+w/1iTydyOb3iR4taTuwPxtPcuXKJds6zRsSfn7JBghSM3G8ek0JWSy/1KVlrd+peqLwdyzoR9Y9aqHTI=
X-Received: by 2002:a05:6512:3c9e:b0:53e:368c:ac48 with SMTP id
 2adb3069b0e04-543e4bd95damr4297791e87.11.1738343224864; Fri, 31 Jan 2025
 09:07:04 -0800 (PST)
MIME-Version: 1.0
References: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
In-Reply-To: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 31 Jan 2025 22:36:53 +0530
X-Gm-Features: AWEUYZmAAYp1I1YaZuO-UFbOAMkotZXa_YA6c-7ppPfxp4KftnBpqtExmyCnBXo
Message-ID: <CAK9=C2UUnP0xV-p6NMH8ma2-hB2K52_5Ug-OKJWcSq1xwBXCFw@mail.gmail.com>
Subject: Re: [QUESTION] Understanding in-kernel irqchip (APLIC + IMSIC)
 behavior with multiple devices and interrupt handling
To: Samuele Paone <s.paone@virtualopensystems.com>
Cc: kvm-riscv@lists.infradead.org, Alvise Rigo <a.rigo@virtualopensystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_090707_591482_1355FCD0 
X-CRM114-Status: GOOD (  21.86  )
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

T24gVHVlLCBKYW4gNywgMjAyNSBhdCAxMDozNuKAr1BNIFNhbXVlbGUgUGFvbmUKPHMucGFvbmVA
dmlydHVhbG9wZW5zeXN0ZW1zLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBldmVyeW9uZSwKPiBJIGhh
dmUgYSBmZXcgcXVlc3Rpb25zIHJlZ2FyZGluZyB0aGUgaW4ta2VybmVsIGlycWNoaXAKPiBpbXBs
ZW1lbnRhdGlvbiwgc3BlY2lmaWNhbGx5IGluIHRoZSBjb250ZXh0IG9mIEFQTElDIGFuZCBJTVNJ
QyBmb3IKPiBSSVNDLVY6Cj4KPiAxLiAqKkJlaGF2aW9yIHdpdGggTXVsdGlwbGUgRGV2aWNlcyoq
OiBEb2VzIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uCj4gc3VwcG9ydCB0aGUgY3JlYXRpb24g
b2YgYSBWTSB3aXRoIGJvdGggUENJIGRldmljZXMgKHRoYXQgdXNlIE1TSSkgYW5kCj4gTU1JTyBk
ZXZpY2VzICh0aGF0IHVzZSB3aXJlZCBpbnRlcnJ1cHRzKT8KClllcywgaXRzIHN1cHBvcnRlZC4K
Ck1TSXMgZnJvbSBib3RoIFBDSWUgYW5kIFBsYXRmb3JtIGRldmljZXMgYXJlIHByb2Nlc3NlZCBi
eSBJTVNJQy4KV2lyZWQgaW50ZXJydXB0cyBhcmUgaGFuZGxlZCB0aHJvdWdoIEFQTElDIE1TSS1t
b2RlIHdoZXJlIHRoZQpBUExJQyBjb252ZXJ0cyBpbnRlcnJ1cHQgc3RhdGUgY2hhbmdlIGludG8g
TVNJIHdyaXRlcy4KCj4gSWYgc3VjaCBhIHNjZW5hcmlvIGlzIG5vdCBzdXBwb3J0ZWQsIGhvdyBj
YW4gSSBjb25maWd1cmUgYW4gTU1JTwo+IGRldmljZSB0byB1c2UgTVNJIGludGVycnVwdHM/IFdv
dWxkIGl0IGFsbCBib2lsIGRvd24gdG8gc29tZSBkZXZpY2UKPiB0cmVlIGNvbmZpZ3VyYXRpb24K
PiAoaS5lLiwgdGhlIE1NSU8gZGV2aWNlIHRyZWUgbm9kZSAiaW50ZXJydXB0cyIgcHJvcGVydHkg
cmVmZXJlbmNpbmcgdGhlCj4gSU1TSUMgcmF0aGVyIHRoYW4gdGhlIEFQTElDIGRpcmVjdGx5KT8K
ClBsYXRmb3JtIChvciBNTUlPKSBkZXZpY2VzIHdpdGggTVNJIHN1cHBvcnQgZG9uJ3QgbmVlZCB0
aGUgImludGVycnVwdHMiCkRUIHByb3BlcnR5LCBpbnN0ZWFkIHRoZSAibXNpLXBhcmVudCIgRFQg
cHJvcGVydHkgaXMgdXNlZCB0byBwb2ludCB0bwp0aGUgSU1TSUNzLgoKPgo+IDIuIEkgZmluZCB1
bmNsZWFyIGhvdyB0aGUgdmFyaWFibGUgYGxldmVsYCBpcyB1c2VkIGluc2lkZSBmdW5jdGlvbgo+
IGBrdm1fcmlzY3ZfYWlhX2FwbGljX2luamVjdGAgaW4gYGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxp
Yy5jYAo+Cj4gYGBgCj4gc3dpdGNoIChpcnFkLT5zb3VyY2VjZmcgJiBBUExJQ19TT1VSQ0VDRkdf
U01fTUFTSykgewo+IGNhc2UgQVBMSUNfU09VUkNFQ0ZHX1NNX0VER0VfUklTRToKPiBpZiAobGV2
ZWwgJiYgIShpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9JTlBVVCkgJiYKPiAgICAgIShp
cnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9QRU5ESU5HKSkKPiBpcnFkLT5zdGF0ZSB8PSBB
UExJQ19JUlFfU1RBVEVfUEVORElORzsKPiAgICAgICAgICAgICAgICAgbGV2ZWwgPSAwOwo+IGJy
ZWFrOwo+IGNhc2UgQVBMSUNfU09VUkNFQ0ZHX1NNX0VER0VfRkFMTDoKPiBpZiAoIWxldmVsICYm
IChpcnFkLT5zdGF0ZSAmIEFQTElDX0lSUV9TVEFURV9JTlBVVCkgJiYKPiAgICAgIShpcnFkLT5z
dGF0ZSAmIEFQTElDX0lSUV9TVEFURV9QRU5ESU5HKSkKPiBpcnFkLT5zdGF0ZSB8PSBBUExJQ19J
UlFfU1RBVEVfUEVORElORzsKPiBicmVhazsKPiBjYXNlIEFQTElDX1NPVVJDRUNGR19TTV9MRVZF
TF9ISUdIOgo+IGlmIChsZXZlbCAmJiAhKGlycWQtPnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX1BF
TkRJTkcpKQo+IGlycWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9QRU5ESU5HOwo+IGJyZWFr
Owo+IGNhc2UgQVBMSUNfU09VUkNFQ0ZHX1NNX0xFVkVMX0xPVzoKPiBpZiAoIWxldmVsICYmICEo
aXJxZC0+c3RhdGUgJiBBUExJQ19JUlFfU1RBVEVfUEVORElORykpCj4gaXJxZC0+c3RhdGUgfD0g
QVBMSUNfSVJRX1NUQVRFX1BFTkRJTkc7Cj4gYnJlYWs7Cj4gfQo+Cj4gaWYgKGxldmVsKQo+IGly
cWQtPnN0YXRlIHw9IEFQTElDX0lSUV9TVEFURV9JTlBVVDsKPiBlbHNlCj4gaXJxZC0+c3RhdGUg
Jj0gfkFQTElDX0lSUV9TVEFURV9JTlBVVDsKPiBgYGAKPgo+IENvbnNpZGVyaW5nIGBlZGdlX3Jp
c2VgIGludGVycnVwdHMsIGFzIGZhciBhcyBJIGNhbiBzZWUsIHRoZQo+IEFQTElDX0lSUV9TVEFU
RV9JTlBVVCBpcyBzZXQgb25seSBpbiB0aGUgY29kZSBhYm92ZQo+ICBidXQgcHJldmVudHMgZWRn
ZV9yaXNlIGludGVycnVwdHMgZnJvbSBiZWluZyBzZXQgcGVuZGluZy4KPiBNb3Jlb3ZlciwgaW4g
YSBzeXN0ZW0gZW11bGF0b3IgaW1wbGVtZW50YXRpb24gdGhhdCB1c2VzIGluLWtlcm5lbCBJUlFD
SElQIGFuZAo+IElycUZkLCB0aGlzIHZhcmlhYmxlIGlzIGhhcmQtY29kZWQgKGB2aXJ0L2t2bS9l
dmVudGZkLmNgIGluIGZ1bmN0aW9uCj4gYGlycWZkX3dha2V1cGAgd2hlbiBpdCBjYWxscyBga3Zt
X2FyY2hfc2V0X2lycV9pbmF0b21pY2ApCj4gaW4gdGhlIGtlcm5lbCBhcyAxLgoKVGhlIElOUFVU
IGJpdCBpbiB0aGUgSVJRIHN0YXRlIHJlcHJlc2VudHMgdGhlIHJhdyBpbnB1dApzdGF0ZSB3aGVy
ZWFzIHRoZSBQRU5ESU5HIGJpdCBpbiB0aGUgSVJRIHN0YXRlIHJlcHJlc2VudHMKdGhhdCBnaXZl
biBJUlEgbmVlZHMgdG8gYmUgdGFrZW4gYnkgQ1BVLgoKPgo+IDMuICoqTVNJLW9ubHkgU3VwcG9y
dCBpbiB0aGUgaXJxY2hpcCoqOiBUaGUgaW4ta2VybmVsIGlycWNoaXAKPiBkb2N1bWVudGF0aW9u
IHN0YXRlcyB0aGF0IGl0IG9ubHkgc3VwcG9ydHMgTVNJLiBIb3dldmVyLCB0aGUgUklTQy1WCj4g
aGFyZHdhcmUgZG9jdW1lbnRhdGlvbiBtZW50aW9ucyB0aGF0IEFQTElDIGNhbiB0YWtlIHdpcmVk
IGludGVycnVwdHMKPiBhcyBpbnB1dCBhbmQgY29udmVydCB0aGVtIHRvIE1TSSB0byBmb3J3YXJk
IHRvIElNU0lDLiBDb3VsZCBzb21lb25lCj4gY2xhcmlmeSB3aGF0IGlzIG1lYW50IGJ5ICJNU0kt
b25seSIgc3VwcG9ydCBpbiB0aGlzIGNvbnRleHQ/IEFyZSB0aGVyZQo+IHNwZWNpZmljIGNvbnN0
cmFpbnRzIG9yIGltcGxlbWVudGF0aW9uIGRldGFpbHMgdGhhdCBsaW1pdCB0aGUgaXJxY2hpcAo+
IHRvIG9ubHkgc3VwcG9ydCBNU0kgZm9yIHZpcnR1YWxpemF0aW9uPwoKVGhlIEtWTSBpbi1rZXJu
ZWwgQUlBIHZpcnR1YWxpemF0aW9uIG9ubHkgaGFzIEhXIGFjY2VsZXJhdGlvbiBmb3IKSU1TSUMg
d2hlcmVhcyB0aGUgQVBMSUMgTVNJLW1vZGUgaXMgc3RpbGwgdHJhcC1uLWVtdWxhdGVkLgoKPgo+
IDQuICoqRGV2aWNlIHRyZWUgbm9kZSBkaWZmZXJlbmNlcyoqOiBIb3cgd291bGQgYSBkZXZpY2Ug
dHJlZSBub2RlIGJhY2tlZAo+IGJ5IE1TSSBpbnRlcnJ1cHQgZGlmZmVyIGZyb20gYSBkZXZpY2Ug
YmFja2VkIGJ5IGEgd2lyZWQgaW50ZXJydXB0PwoKSXQgaXMgZGlmZmVyZW50aWF0ZWQgdXNpbmcg
Im1zaS1wYXJlbnQiIGFuZCAiaW50ZXJydXB0cyIgRFQgcHJvcGVydHkuCgpSZWdhcmRzLApBbnVw
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
