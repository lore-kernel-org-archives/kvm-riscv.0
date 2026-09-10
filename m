Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A9C79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl05KT20ptQf5vPUjytE1nab9mGn4r4QCwYMbfxHxP4=; b=NuqWWL4IY0XaEy
	aaDE23ds9lCHIzQcr8L478Cn3jklYdF9IVMwjUyRA1FKaCtqOccRHhyhdk7ZqxLIXtngUylzBUkaZ
	0GPX8b1iuruD4stqox0Sg2OrOwMYEIU6ktK7rznjqQaFmdrEaOvbK7nPculZFwnbjJgjSh4RMJdDh
	IdqxFLm/pZ5tQsYIR+7zJghD8FXw37Op9yuP+YERgRZDHPnrgQ4kjKHaWGxbZQVG5qC+KIEYXXEI9
	KJWZLZRo9Mk2glwgHUHAF971wDcXxrbeIWqo7U4r+FbiaILNM23Ld+AZr1Xqsuv770obHEbKiLI2P
	lQtxQOuTAes5fytYFDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOp-0000000DmpG-1zoL;
	Thu, 10 Sep 2026 08:44:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aOm-0000000Dmo1-3kYJ
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 08:44:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso55893475e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 01:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789029887; cv=none;
        d=google.com; s=arc-20260327;
        b=kwzf4JJUrYjeQiUQF90lZ2ICdnwTZDmqa0uBObN6c2XzesQ4Gvjt1XAAnRB3DBh0QM
         vhHwfkUcsfl6rxy4HG3vIb0qRPxSdpw4FI0umvBnUibQeU1QqHrcaFya0/0FIUkNSpRx
         nOSqDqCm54f6ZlfrGG7d4XHO0lFc3SOtaaCKlRgbSQJ47BDKegSPpRO1MuzeyZaSV6MS
         0Njf4YH/dCuGwcvh3ed26piClu+/OkXNe2siMbu0YqmXCinLg46EsdbIOP7XHMhufvUq
         9vhxl5H4lR0pR5mt3/ZpHXCrBSGu6JSG6+GkXHVabpQ37ZZcWye4YcLkax/jV/AwlHzt
         kMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        fh=Vv/t2HQijni3BcqOH1Kiqsdnvqgz1qCSB3r5jBEv/kA=;
        b=A73VqKvoGrdyTRHS7nMQ9J5J4n2VyQf5u/lloK54DKyRWeBEgpIKJJ7/2yVbsHiGkp
         aYJgOLIlQBBI7qmB26EckGCOJVqng/ZLKNMILGbrUko4uxarr7rnU727/lFfPCRdn/Bp
         nm1kKZYuFn2SGIqpH5nzQOgB5vau3wjWUlm+L5HVhmm8mymE5IEsTiWdXmxEPt5ndzUs
         gXsyQDJzef6+GZirbm5gOLAYO6kQeOE5/PZYNPlftfvCRDVsMG+KvxcHwA8ff1IGX2iY
         /p7WjA5VwXtwekk1PfpP1va5dZXOWXGNoZQgQr0xUL54osT0QGwjRwQNHme/vwF0DgJJ
         qo4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789029887; x=1789634687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        b=FsYTkcnpM+8LBUyLmaIeds2qRwqL+aC+gPJUWgysHuJV/BwaUMgOlOq+oqybaJsYmR
         r7VbqCGVY9yBnY4MaLnPMOPVeSW0k9BiuYdc/f1iBoFFoz5ZyyfhKM8iNEZ0/qyo6BYj
         TVwz12EOfS5omOo9e5HjTKkbNFIYzvNSeFzej2qvWOiyP9vkjo/OqNskxU23PPKUAINJ
         Ezc9QowKnC0jUc8sOvfoj6t3DICQ5KfCUt31jza0T/5Ax/TpXgTnO79LCxpzBwsf+n/p
         BR9XdFiuoAs36+Xa8LYKNqhvK2CjYNDsCOwlSffooSDHd2ctq65tF7snP9rJwAgcXF1a
         tjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029887; x=1789634687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scbEHeSfgSCcxK7Ny73Kn4g0gC7DW9iSvZ1f2Vwg208=;
        b=n+9E1Z8Yf+YaWkRz8DSdXI2qcUohbtHyBUD4Mgf6H/21kgGaZqUiHO+lE7Q8GJWN3f
         g2QKQBqQICxKZ3bfOiFPYy0U9DaGsuVcyY3+IiHSlA4djtWbczKn4Uzy7ppo8xH64hVp
         jKpP6KGkbB3r8wQ3EA9GBIYHg3zBwchSIjnJHZfuDd5Fk8LPYu13aO7pbBNKKifqHTc3
         Ll/Ihv/4MT8LOwfaGB2Nm/zZuL7EdE5az5U8jifsFjrphmTkKySFIXiUR3qM7GXtpPdA
         VnQxC3CNyESkVhotaehRPNWmFEtXwhTpBwaEiOF0/d87golOWY3UzPmQKJD4sZNrsggZ
         YoOw==
X-Forwarded-Encrypted: i=1; AKwUvBzE0YiGmrMTw7wxkp/KbChiUL5e4P6lx+YFJbIE/TanPxKfO0s4oDe3SvckZvnUZR6Qila05Oj00Mk=@lists.infradead.org
X-Gm-Message-State: AFuF++nc+sgBGcnbgzd3yebQ1/2Ts1O8mDLHlMAEx6XSOUc3x7a+vUgg
	LHWtUgIcw5kZdoeVUMDqh0tXZMwr0VQ41L7vDKFe5cBvgCfaZExe+qn+UL32BfqdMxVFeIa9nNw
	6vcJl17entDC28OYXbIM8D378ctBaKTEIMm7V2g/cLA==
X-Gm-Gg: AYBFou2uWLeOBkUN+e/yoE2uslZGj9lRZxVszrxA25++AK8gEc0N/wK1nbCkQyMf8Nn
	cCIbWgnhKBLhYMlegq9hRHFIod5EZAfNfEZmGJHmjiYkwpQ7PHyPIWbHUUWEfpC5e1pYRDsgk5A
	r0/LIYoJZMPE+UeJw0jONDCawrYCeQQFWnWyiJIlfeQRoeeeaYCFOAbU0rNyAufof8b1Dld2K54
	BUXjDwqQc+2eFIiBWM7sPJM+rRtMDnDrbrXtWCyoB0TP5sG5H8gAWrIJDmxbh6jl/4chlSVBmou
	pHx7rsHfZtLFFtBaPR7fD/qQBfY/bm/bj7GlQhiX3PUhZkdj5hBLWdt/9hM+w1ajg5RLvaqpaQY
	sndzsdRQY6WysoZPxKZyUKNC+KJkmQuD1045bGGgghtaQcXpt75b5t1+gq+PXQqCodeWKQhoOis
	s=
X-Received: by 2002:a05:600c:3148:b0:49d:1e3d:3b3f with SMTP id
 5b1f17b1804b1-49d1e3d3b56mr116962455e9.8.1789029886716; Thu, 10 Sep 2026
 01:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
 <20260731163550.46991-1-mhun512@gmail.com>
In-Reply-To: <20260731163550.46991-1-mhun512@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 14:14:34 +0530
X-Gm-Features: AcwNN1V28fjgBOHn1dVY71XHW4M_hQYvtSbbXwHks3Yz0rwxCZGQBzSs1WPsOfE
Message-ID: <CAAhSdy27Ou5CJ8CaKE+QdnK_n+rq9nBJHWOu2V02DvUDQFXWcg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Synchronize hrtimer callback during teardown
To: Myeonghun Pak <mhun512@gmail.com>
Cc: atish.patra@linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_014449_373625_5F0A01A7 
X-CRM114-Status: GOOD (  25.43  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMTA6MDXigK9QTSBNeWVvbmdodW4gUGFrIDxtaHVuNTEy
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgbm9uLVNzdGMgaHJ0aW1lciBjYWxsYmFjayBjbGVh
cnMgbmV4dF9zZXQgYmVmb3JlIGl0cyBmaW5hbCB1c2VzIG9mCj4gdGhlIGVuY2xvc2luZyB2Q1BV
LiAgSWYgdGVhcmRvd24gb2JzZXJ2ZXMgbmV4dF9zZXQgYXMgZmFsc2Ugd2hpbGUgdGhlCj4gY2Fs
bGJhY2sgaXMgc3RpbGwgcnVubmluZywga3ZtX3Jpc2N2X3ZjcHVfdGltZXJfY2FuY2VsKCkgc2tp
cHMKPiBocnRpbWVyX2NhbmNlbCgpIGFuZCBrdm1fZGVzdHJveV92Y3B1cygpIGNhbiBmcmVlIHRo
ZSB2Q1BVIGJlZm9yZSB0aGUKPiBjYWxsYmFjayBlbnRlcnMga3ZtX3Jpc2N2X3ZjcHVfc2V0X2lu
dGVycnVwdCgpLgo+Cj4gQSBndWVzdCBjYW4gYXJtIHRoZSB0aW1lciB3aXRoIFNCSSBUSU1FIGFu
ZCByZXF1ZXN0IHNodXRkb3duIHdpdGggU0JJCj4gbGVnYWN5IHNodXRkb3duIG9yIFNSU1QuICBB
IFZNTSB0aGF0IGhvbm9ycyBLVk1fRVhJVF9TWVNURU1fRVZFTlQgYW5kCj4gZGVzdHJveXMgdGhl
IFZNIHN1cHBsaWVzIHRoZSB0ZWFyZG93biBzaWRlIG9mIHRoZSByYWNlOyBubyBwb3N0LWxhdW5j
aAo+IGhvc3QgaW9jdGwgaXMgbmVlZGVkIHRvIGFybSBvciByZXF1ZXN0IHRlYXJkb3duLgo+Cj4g
T24gdXBzdHJlYW0gbWFzdGVyIDYyY2M5MDI0MTU0OCwgZ2VuZXJpYyBLQVNBTiByZXBvcnRlZDoK
Pgo+ICAgQlVHOiBLQVNBTjogc2xhYi11c2UtYWZ0ZXItZnJlZSBpbiBkb19yYXdfc3Bpbl9sb2Nr
Cj4gICBXcml0ZSBvZiBzaXplIDQgYXQgYWRkciBmZjYwMDAwMDA1ZTU4ODk4Cj4KPiAgIGt2bV9y
aXNjdl92Y3B1X3NldF9pbnRlcnJ1cHQKPiAgIGt2bV9yaXNjdl92Y3B1X2hydGltZXJfZXhwaXJl
ZAo+ICAgX19ocnRpbWVyX3J1bl9xdWV1ZXMKPiAgIGhydGltZXJfaW50ZXJydXB0Cj4KPiBUaGUg
b2JqZWN0IHdhcyBhbGxvY2F0ZWQgYnkgS1ZNX0NSRUFURV9WQ1BVIGFuZCBmcmVlZCBjb25jdXJy
ZW50bHkgYnk6Cj4KPiAgIGt2bV9kZXN0cm95X3ZjcHVzCj4gICBrdm1fYXJjaF9kZXN0cm95X3Zt
Cj4gICBrdm1fZGVzdHJveV92bQo+ICAgX19mcHV0Cj4KPiBGb3IgZGV0ZXJtaW5pc3RpYyB2YWxp
ZGF0aW9uLCBJIGFkZGVkIG1kZWxheSgxMDAwKSBpbW1lZGlhdGVseSBhZnRlcgo+IHRoZSBleGlz
dGluZyBuZXh0X3NldCA9IGZhbHNlIGFzc2lnbm1lbnQuICBUaGlzIG9ubHkgd2lkZW5zIHRoZQo+
IGV4aXN0aW5nIHBvc3QtY2xlYXIgY2FsbGJhY2sgd2luZG93LiAgQSBuby1kZWxheSB0cmFjZSBi
dWlsZCBuYXR1cmFsbHkKPiByZWFjaGVkIHRoZSBjYWxsYmFjay1hZnRlci10ZWFyZG93bi1zdGFy
dC9iZWZvcmUtZGVpbml0IG9yZGVyaW5nIGluIDEyCj4gb2YgMjAwIHJ1bnMsIGJ1dCAxLDUwMCBz
dG9jay1rZXJuZWwgc3RyZXNzIGl0ZXJhdGlvbnMgZGlkIG5vdCBwcm9kdWNlIGEKPiBLQVNBTiBy
ZXBvcnQsIHNvIG5hdHVyYWwgcmVwcm9kdWN0aW9uIGlzIHRpbWluZy1zZW5zaXRpdmUuCj4KPiBB
bHdheXMgaW52b2tlIGhydGltZXJfY2FuY2VsKCkgZm9yIGFuIGluaXRpYWxpemVkIHRpbWVyLiAg
UHJlc2VydmUgdGhlCj4gZXhpc3RpbmcgLUVJTlZBTCByZXN1bHQgd2hlbiB0aGUgdGltZXIgaXMg
bm8gbG9uZ2VyIHNldCwgYnV0IG9ubHkgYWZ0ZXIKPiBzeW5jaHJvbml6aW5nIHdpdGggYSBydW5u
aW5nIGNhbGxiYWNrLgo+Cj4gV2l0aCB0aGlzIHBhdGNoLCBocnRpbWVyX2NhbmNlbCgpIGJsb2Nr
ZWQgZm9yIHRoZSBmdWxsIHdpZGVuZWQgY2FsbGJhY2sKPiB3aW5kb3cgYmVmb3JlIHZDUFUgZGVz
dHJ1Y3Rpb24uICBLQVNBTiByZXBvcnRlZCBubyBlcnJvciBpbiAxMDAKPiBmaXhlZC1hbmQtd2lk
ZW5lZCBydW5zIG9yIDIwMCBmaXgtb25seSB0aW1pbmctc3dlZXAgcnVucy4KPgo+IEZpeGVzOiAz
YTlmNjZjYjI1ZTEgKCJSSVNDLVY6IEtWTTogQWRkIHRpbWVyIGZ1bmN0aW9uYWxpdHkiKQo+IENj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IE9wZW5BSTpHUFQtNS42Cj4g
U2lnbmVkLW9mZi1ieTogTXllb25naHVuIFBhayA8bWh1bjUxMkBnbWFpbC5jb20+CgpMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhp
cyBwYXRjaCBhcyBmaXggZm9yIExpbnV4LTcuMy1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBD
aGFuZ2VzIGluIHYyOgo+IC0gQWRkIHRoZSByZXF1aXJlZCBBc3Npc3RlZC1ieSB0cmFpbGVyLgo+
IC0gRHJvcCBzZWN1cml0eUBrZXJuZWwub3JnIGZyb20gdGhlIHJlY2lwaWVudHMuCj4KPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV90aW1lci5jIHwgNyArKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBBSSBkaXNjbG9zdXJlOiBJIHVzZWQg
QUkgYXNzaXN0YW5jZSBkdXJpbmcgdGhlIGF1ZGl0IGFuZCBhbSB0cmVhdGluZyB0aGUKPiBpc3N1
ZSBhcyBwdWJsaWMgYXMgcmVxdWlyZWQgYnkgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3NlY3VyaXR5
LWJ1Z3MucnN0Lgo+IFRoZSByZXByb2R1Y2VyIGFuZCBmdWxsIEtBU0FOIHRyYWNlIGhhdmUgbm90
IGJlZW4gcG9zdGVkIHB1YmxpY2x5IGFuZAo+IGFyZSBhdmFpbGFibGUgb24gcmVxdWVzdC4KPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiBpbmRleCBhZTUzMTMzYzdhYjAuLmEyY2QyNzdhNDA1OSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3RpbWVyLmMKPiBAQCAtNjEsMTAgKzYxLDEzIEBAIGt2bV9yaXNjdl92Y3B1X2hydGlt
ZXJfZXhwaXJlZChzdHJ1Y3QgaHJ0aW1lciAqaCkKPgo+ICBzdGF0aWMgaW50IGt2bV9yaXNjdl92
Y3B1X3RpbWVyX2NhbmNlbChzdHJ1Y3Qga3ZtX3ZjcHVfdGltZXIgKnQpCj4gIHsKPiAtICAgICAg
IGlmICghdC0+aW5pdF9kb25lIHx8ICF0LT5uZXh0X3NldCkKPiArICAgICAgIGlmICghdC0+aW5p
dF9kb25lKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+ICAgICAgICAgaHJ0
aW1lcl9jYW5jZWwoJnQtPmhydCk7Cj4gKwo+ICsgICAgICAgaWYgKCF0LT5uZXh0X3NldCkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB0LT5uZXh0X3NldCA9IGZh
bHNlOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIuNDcuMgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
