Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A3BC54F98
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84FzpspqQiMLM4j6xXnBVbFnoyfRn3GKFe6xb73EBTk=; b=oMPYtPpA6suA+c
	ATxBzPswk/VRV1DJODW4lC8l3fkWi29ZVjNRC+3cY9c3ND1VqqIcFe8bD0ELCHr74NNMA4EH6LeeH
	EeskhpeWV3BUs3A7LPBvGFjkuOByRAhavZGYInR4fpTfOQTvLioFWarOypxbvdXAyQ3l+FR0+lxb6
	uLsN3NVttKttXvC4mO+NBCHZeZGyMDr4dfgyEaDoROnsRJzj6vjNxri9kmtNHYwd5I2saVTwuwpDe
	m+c7QX0WQ2OS2GbpQGCh9DidrJ3g850UvLh3obSiS/WMpGyCQyKasXHGaCdRTPpS4XQKMkBrk4bDz
	ndHWspHJw2kNSJH+rR6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok85-00000005jXZ-0IpE;
	Tue, 28 Jul 2026 15:54:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok82-00000005jWW-30DC
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:54:03 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47db714766aso703722f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785254041; cv=none;
        d=google.com; s=arc-20260327;
        b=G0vFp9kTrdh63snG7Gaop1NYW0aqISr4w2MCDLopSMIH0JEIXGYxwvnbWUscdvuLT6
         lVFV/e4M/9p0KOA4HLkwtJ4x4/vDId6Ok7sqDAqkm7AwIrKAWMPWsZxaobw9s2Q7/OT4
         BUasUz9WqGjGS6SotzJ/5bh4yxyN7mkacc4hWGz0qWvq7XUP2561fHtL3eufvHYT3bvA
         ttbIiC3GxgbUdLnGobBFnK7XE7DS8l9GUZxKgx/562aX9XNEUM9GmVLNRhp305csGqPD
         6KXEpY1Dfah7f0fnyl3b8NyD8cHcwPyu1Q/LrWUbJo0oc7YAxsBIB0VVP1Z5HAjqq11J
         WH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        fh=edil4wAz9P8FcNZE+IXos+poK6RYAXRVlGW9WuxJIE8=;
        b=KVvGG/GoyGFOUW7ckPEpcwzpDYkCjsNd8Ch1/7Ncww/oTQu/j/+TxjTt0qNa6avSy2
         8z2ArzoWajYnRdlI+x/mHbBGsheGBqx89TfokTwmBdDlHd1V6hvKz8knLy6v4rPLoOyQ
         zfTfpSIM5odthKLCyP073T1H6BTZRnKCm6Li8XctdgjD/Na5DOBvTKOSpcDDhqTZNCx4
         EHwJRxwtfSFe9DHW4pT20wzp6pUvJSIQV3JIozSJvajZRroLa9MnaDXbanOHs3zEgqnV
         NxBPbuDFGKPy5utyFkhjxxdrcLy//nOjulL9UB+nST/YrJhyPtiB8p+FbKdVqAQq2kss
         KsFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785254041; x=1785858841; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=RZaP1lkSKh309fI1zLtqOFu2ZMexPzCm5/rkds+9zeNLbXStK9u/5+c9B+iZi11ZN5
         AULcENnSQehExF8wV9Gk/Ac0UHqAN+OABqB2yYZ3iVMla974SG8TMyz20Jh7HqdAWzWB
         xuaXA9J3g8DJi5IbEzI0EX6fUmtE1gthMZHNy/4AJkIPhCmPrq5smjFArHGZmlhQnDCN
         OdRXt4jPsr4YruMOnOFu1U7ba3ANEaV3SXnsZEr5rDcratWkJKFaMWYZsQXP0fpMpriV
         sNAMXjPi/6+6IY3q1mZF0cW7W0PUmiqSKn83YJr2DfB0c9ktKoA4PVEQzLpRGftMPavz
         recw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254041; x=1785858841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+U7EUowm/WpYWZVDDqRkyNBdiXnZeoZAf0Tk6pkUOwY=;
        b=rLvtBoMD15p6ZAgzR51MxiavxTPVXEICbmy0v2dYxe9eEbIVN2qFEZ3vLymoRtutuj
         B6yj9hih/S1ioJiHXGoJIVk44rRWGbewr1dX1xmgrt5IY/bUVZR2D5JesaEasb3n8bEU
         +kI97A1fXgDl4ZZdKARFBYjZiy6bt5ePIfSExtBXdbbRCyem+GtlXiuok3MNJVKYurLQ
         zvtTU6bbYfzykHbzo8N3GXPiS/nk+2vbrEFRxjzeJ2QbTXqM92I0pxY+NUfefHZSaktw
         pcbDhjvszSAu+qg2w2m6MWXmgd0PShaO2PZP8UEpaFpHqQrwL1y4aOLAmEDHFs0P12gC
         hLvA==
X-Forwarded-Encrypted: i=1; AHgh+RoVx/LXYqUvbKQeXc1vFGxkPbSHVeTQ5IXp4aYu4xCdaFZh/bgenRqj40Svy9HTWFgkFlDbUJAwon0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ20WGDjMOWb5lxgLrhodhmON5T1VaDZyOZWBHcpu6WnBrZgfG
	At9vqzc2v17mN8M+PUZsuoWgloe2PDtG/YJpxrJk2g6+LnndJ4SxOjpEGE7xc6jGI++6Sm2cV7q
	oVOmcqowO4ejswR1SdO5BnTLaSLKscn7ygJ4J0QJUCg==
X-Gm-Gg: AR+sD133tRnILPC3pALmK/RQPnNUrUwCWjmqtJpq0LHkXxOGOQmna27n4NaBWD90JeL
	4EtA1xE4mmLDovG36wYOUzURXSuY2AmpzaIsw9KNO0j/QjwIKSFbx8ECrjTDHzzREdcRgjsw9M1
	nBoKMZmQJliYhVu/yKKG1b9LAJxhRHSL6DCygXNGYiSbvrXBjSeQxduKV8KT8n77vmBHrAze0It
	SPRwx+HwZGZOTNSzYQG32lrotZMQhOeOD/1MHM0B9F4txAwTCG3d1I+3o0DN7fHFUwPSG15u4Aw
	iCOKzmGGjm+f+VqUN4GykO7bbvsH1bEM9NgWBsDwMrkc+rQXztEFQyRra19MeKDFzRbwCzKn/c4
	7YulzMA5RTyf9ri0=
X-Received: by 2002:a5d:5f51:0:b0:45e:dd32:92fa with SMTP id
 ffacd0b85a97d-47fb1e9992amr3932927f8f.12.1785254040632; Tue, 28 Jul 2026
 08:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260709115610.287420-1-yhchen312@gmail.com>
In-Reply-To: <20260709115610.287420-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:23:49 +0530
X-Gm-Features: AUfX_mwzsyiunp_bPATfO_O8RiK5DjkNzGjCdX_kznFgbSWBNjYBF0Izm64N9aI
Message-ID: <CAAhSdy2r8Ei9ESdSJB8McC1T=Atp0yNa2MxEbOWNVRTUM_8YFA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add kvm-riscv.wfi_trap_policy to control
 VS-mode WFI trapping
To: "Yuhang.chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Quan Zhou <zhouquan@iscas.ac.cn>, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085402_771562_98CC737C 
X-CRM114-Status: GOOD (  16.45  )
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

T24gVGh1LCBKdWwgOSwgMjAyNiBhdCA1OjI24oCvUE0gWXVoYW5nLmNoZW4gPHloY2hlbjMxMkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEga2VybmVsIGNvbW1hbmQtbGluZSBvcHRpb24sIGt2
bS1yaXNjdi53ZmlfdHJhcF9wb2xpY3k9dHJhcHxub3RyYXAsCj4gdGhhdCBjb250cm9scyB3aGV0
aGVyIGEgV0ZJIGV4ZWN1dGVkIGJ5IGEgVlMtbW9kZSBndWVzdCB0cmFwcyBpbnRvIEtWTQo+IChI
Uy1tb2RlKSBvciBleGVjdXRlcyBuYXRpdmVseS4KPgo+IE1lYXN1cmVkIHJlc3VsdHMgKHdmaV9l
eGl0X3N0YXQgZGVsdGEgLyBndWVzdCB3YWtlIGNvdW50IG92ZXIgMyBzKToKPgo+ICAgcG9saWN5
ICAgICAgICBXRklfRVhJVFMgICBXQUtFX0NOVAo+ICAgLS0tLS0tLS0tLSAgICAtLS0tLS0tLS0g
ICAtLS0tLS0tLQo+ICAgZGVmYXVsdCAgICAgICAyOTUgICAgICAgICAyOTQgICAgICAoPT0gdHJh
cCwgbm8gcmVncmVzc2lvbikKPiAgIHRyYXAgICAgICAgICAgMjk1ICAgICAgICAgMjk0Cj4gICBu
b3RyYXAgICAgICAgICAgMCAgICAgICAgIDI5OAo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzpk
ZWVwc2Vlay12NC1wcm8KPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNj
YXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWhhbmcuY2hlbiA8eWhjaGVuMzEyQGdtYWlsLmNvbT4KPiAt
LS0KPiAgLi4uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCAgICAgICAgIHwgMTQg
KysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8
IDQ0ICsrKysrKysrKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGI1NDkzYTdmOGYyMi4uZWU2NjAzYjMwMDMzIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMu
dHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQKPiBAQCAtMzI1NCw2ICszMjU0LDIwIEBAIEtlcm5lbCBwYXJhbWV0ZXJzCj4KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBub3RyYXA6IGNsZWFyIFdGSSBpbnN0cnVjdGlvbiB0cmFwCj4KPiAr
ICAgICAgIGt2bS1yaXNjdi53ZmlfdHJhcF9wb2xpY3k9Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgW0tWTSxSSVNDVl0gQ29udHJvbCB3aGVuIHRvIHNldCB0aGUgV0ZJIGluc3RydWN0aW9uCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgdHJhcCBmb3IgS1ZNIFZNcy4gV2hlbiBzZXQsIGEgVlMt
bW9kZSBXRkkgdHJhcHMgaW50bwo+ICsgICAgICAgICAgICAgICAgICAgICAgIEtWTSBhbmQgaXMg
ZW11bGF0ZWQ7IHdoZW4gY2xlYXIsIHRoZSBndWVzdCBleGVjdXRlcwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIFdGSSBuYXRpdmVseSBhbmQgYmxvY2tzIHVudGlsIGEgVlMtbW9kZSBpbnRlcnJ1
cHQKPiArICAgICAgICAgICAgICAgICAgICAgICAoZS5nLiB0aGUgc3N0YyB0aW1lcikgaXMgcGVu
ZGluZy4KPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdHJhcDogc2V0IFdGSSBpbnN0cnVj
dGlvbiB0cmFwIChIU1RBVFVTLlZUVz0xKQo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBu
b3RyYXA6IGNsZWFyIFdGSSBpbnN0cnVjdGlvbiB0cmFwIChIU1RBVFVTLlZUVz0wKQo+ICsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBEZWZhdWx0cyB0byB0cmFwLCBwcmVzZXJ2aW5nIHRoZSBw
cmV2aW91cwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHVuY29uZGl0aW9uYWwgYmVoYXZpb3Iu
Cj4gKwoKVGhpcyB3b3VsZCBtZWFuIHRoYXQgZm9yIHRoZSAibm90cmFwIiBwb2xpY3kgdGhlIFZD
UFUgd291bGQgbmV2ZXIKc2xlZXAgYW5kIGluY3JlYXNlIGhvc3QgQ1BVIHV0aWxpemF0aW9uIGV2
ZW4gd2hlbiBWQ1BVIGlzIGlkbGUuCklzIHRoaXMgZXhwZWN0ZWQgYmVoYXZpb3VyID8KClJlZ2Fy
ZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
