Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37DE6748D
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pHAVq7XIQTc+0tpT81p3NqRvuczTmsfrqeEHX/qnuA=; b=btVtDW7l9SND5e
	gs5lAcrdr/0aFG7qAXLRzhlrYhsieT9ii06HngIfdi8CXCfUrS/oI88xGv78R8+lBqDX99v7kyQ9G
	GV0jcXjouMmc/PDTBIFLXmX0etCfbKnBO9j897q/yo4xKJECnK8qBgna9XQdM2LTuHLU5+JCjBbi1
	jh0BVGH/HNJSmCx6S1ccte9OWZA8LOWKS8gIvcZPGmLQP3o71/ZgcTSKf3KLsGiIpd8sHRviMHLgP
	OV8+fzKi03E9rbltkdzQgglQsj+9ar2GfyKdVhpbaS/OLM8q0UDXhpdnTcfunv80LvGfB1BO0yxdT
	zHPRisZaKfFDi0EOcwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbgv-0000000DU31-0KLc;
	Mon, 22 Dec 2025 08:54:57 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbgq-0000000DU1k-3Bz0
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 08:54:55 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-5eae7bb8018so1409708137.2
        for <kvm-riscv@lists.infradead.org>; Mon, 22 Dec 2025 00:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766393688; x=1766998488; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjjAwkMD2imy40IRBrToPSHKCp6ZXBS0wOi95O1acFk=;
        b=cfTEa0KrLscF4kDQ923I9/Fxy+8gnG2HF3KaQTlkdkkb2f13oDx3vtek8Mhoo4ZIBX
         rjgOA5lYFT0aWKaS/5Srz4XVHqKEEMHoT3Aw09Pe8u8TM/R3S/1Sfmml1QRjWJcUU2as
         vHKQTjH+t2FIAwoqsEPezvNk7s16HAYcXgelPrL1+h46TJqtw67YvNat9SEnRChJ3DYe
         RamOFT/KBjV4tmUbB6ot286JCNtDRuZwRLuUa+a87scV7O6ykcUVEyCP63a87SNY0w/C
         FA/6MplPKUY3vJHbm9kf2qOgXDCDmX6NAOW+ywTVIOlIHUoads9AjwGfSzVh1T6fCqqN
         WC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393688; x=1766998488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjjAwkMD2imy40IRBrToPSHKCp6ZXBS0wOi95O1acFk=;
        b=Z069Y0qRJRNEpW++FBahNxM3nm3k45913eA0bJhkh6QCt6foQvOgK41vI4L2No+ikJ
         CjhiYSrUulCFKF72DhfM8tzVpgUHmJ4Lx6MMlyk2bYNpxFK+xxnYoLMKwOhWtSe4FazK
         nEH5hzqAVA0gGmvXER94CB/5F7v49UG3qApaU+AIcGWXySR5ynpTX55G5Ha+hWdXht9L
         Bx1S9r8lB/9107qiWosMSrK19Ss/LFYytBbOiI2YitB6mTJdK7TS9gdx2DCQ3JRby1HY
         qoRv2XKeASiLlfJikCfBvrwSd0bod71FFOi3ifAMJNvc14RfrSHfycB2RVvp6swIBp9a
         j3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCVOyczF9tnUNP5Q+dLE+CrWUQ1aLDVz9Wiuu6wNHU4wbjytI70UI2V/lksXDwJ7vzCgFmuwmk5XVKU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxM6Io83o/wQ4lwMe2sPeFQnRWEfEE+CR4nF3TDW19r919D8L4V
	vx5fGKTYvigQXxooGh4/rZc9LoLea8h8S18UwUHRCGPQ4R5DUwa9DeNTwlGVk61SHJ3eb9hRYBf
	mjgo/377jeXauUgbKdBmrKt1xkHBVRxsKuPN48ZZfhA==
X-Gm-Gg: AY/fxX4v3egMLVqzCIYLkSX8xEMPCBMHfWrJIyciZJEElfKzuDySij0vAeBLu0gy/cD
	rXKWlfuYV059ajGEmRjhI1CRI5X3vvJxFZM/Do7iCroJ1SdVjhkkWGoSQ/3UgkCS+PwsApDhq/6
	D/ZtVTMofUv+hALtfHcc3it7PUhCZpMDWZNcvA/Oo2mdbzlIQqhvA9N/s9m6veYveg8JL4JMnrp
	Mrs0SCBsuUHogIRPO67vieut6trSd0NdWppIGQOWtsvtqcm/ml7GQsmm0/R+lwkx0haBVOOBbXr
X-Google-Smtp-Source: AGHT+IECxbABLBViJLOC0p0+OMMWXiOeS29bWYNP2/R8n3SXGrBWEHPNKMJxAXasPiTotTezNxqtzCtN15d2YuAd2zY=
X-Received: by 2002:a05:6102:c07:b0:5db:f573:a2c with SMTP id
 ada2fe7eead31-5eb1a67d804mr2923800137.13.1766393687811; Mon, 22 Dec 2025
 00:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20251220163713.34040-1-luxu.kernel@bytedance.com> <CAAhSdy1rHO407BwLtP-s5J1fJtcp2GfvvhtEEpnN2AOn79s8qg@mail.gmail.com>
In-Reply-To: <CAAhSdy1rHO407BwLtP-s5J1fJtcp2GfvvhtEEpnN2AOn79s8qg@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 22 Dec 2025 16:54:37 +0800
X-Gm-Features: AQt7F2pkcAOiOlwtxXEG4A39Cprf60Uga7ZPIQ4UoNfpOFWLK7KONbylokDEJEs
Message-ID: <CAPYmKFuNB_iKGtXN815WZvZ5zz8-=NcaLrL0uqS9U4snVZPaTA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] irqchip/riscv-imsic: Adjust the number
 of available guest irq files
To: Anup Patel <anup@brainfault.org>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005453_148364_F2545DE5 
X-CRM114-Status: GOOD (  27.61  )
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

Um9nZXIgdGhhdCEKCk9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDE6MDTigK9QTSBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgRGVjIDIwLCAyMDI1IGF0
IDEwOjA34oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4K
PiA+IER1cmluZyBpbml0aWFsaXphdGlvbiwga2VybmVsIG1hcHMgdGhlIE1NSU8gcmVzb3VyY2Vz
IG9mIElNU0lDLCB3aGljaCBpcwo+ID4gcGFyc2VkIGZyb20gQUNQSSBvciBEVFMgYW5kIG1heSBu
b3Qgc3RyaWN0bHkgY29udGFpbnMgYWxsIGd1ZXN0Cj4gPiBpbnRlcnJ1cHQgZmlsZXMuIFBhZ2Ug
ZmF1bHQgaGFwcGVucyB3aGVuIEtWTSB3cm9uZ2x5IGFsbG9jYXRlcyBhbgo+ID4gdW5tYXBwZWQg
Z3Vlc3QgaW50ZXJydXB0IGZpbGUgYW5kIHdyaXRlcyBpdC4KPgo+IFRoZSBtb3RpdmF0aW9uIGlz
IG5vdCBjbGVhciBmcm9tIHRoZSBhYm92ZSB0ZXh0IGFuZCBuZWVkcyB0byBpbXByb3ZlLgo+Cj4g
SG93IGFib3V0IHRoZSBmb2xsb3dpbmcgPwo+Cj4gQ3VycmVudGx5LCBLVk0gYXNzdW1lcyB0aGUg
bWluaW11bSBvZiBpbXBsZW1lbnRlZCBIR0VJRSBiaXRzIGFuZAo+ICJCSVQoZ2MtPmd1ZXN0X2lu
ZGV4X2JpdHMpIC0gMSIgYXMgdGhlIG51bWJlciBvZiBndWVzdCBmaWxlcyBhdmFpbGFibGUKPiBh
Y3Jvc3MgYWxsIENQVXMuIFRoaXMgd2lsbCBub3Qgd29yayBvbmx5IHdoZW4gQ1BVcyBoYXZlIGRp
ZmZlcmVudCBudW1iZXIKPiBvZiBndWVzdCBmaWxlcyBiZWNhdXNlIEtWTSBtYXkgaW5jb3JyZWN0
bHkgYWxsb2NhdGUgYSBndWVzdCBmaWxlIG9uIGEgQ1BVCj4gd2l0aCBmZXdlciBndWVzdCBmaWxl
cy4KPgo+ID4KPiA+IFRodXMsIGR1cmluZyBpbml0aWFsaXphdGlvbiwgd2UgY2FsY3VsYXRlIHRo
ZSBudW1iZXIgb2YgYXZhaWxhYmxlIGd1ZXN0Cj4KPiBzL1RodXMsIGR1cmluZyBpbml0aWFsaXph
dGlvbi9UbyBhZGRyZXNzIHRoZSBhYm92ZS8KPgo+ID4gaW50ZXJydXB0IGZpbGVzIGFjY29yZGlu
ZyB0byBNTUlPIHJlc291cmNlcyBhbmQgY29uc3RyYWluIHRoZSBudW1iZXIgb2YKPiA+IGd1ZXN0
IGludGVycnVwdCBmaWxlcyB0aGF0IGNhbiBiZSBhbGxvY2F0ZWQgYnkgS1ZNLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4g
PiAgYXJjaC9yaXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8IDcgKysrKysrLQo+ID4gIGlu
Y2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oICAgICB8IDMgKysrCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gPiBp
bmRleCBkYWQzMTgxODU2NjAwLi5jYWMzYzJiNTFkNzI0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vYWlhLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gPiBAQCAtNjMw
LDcgKzYzMCw3IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiA+ICAgICAgICAgICov
Cj4gPiAgICAgICAgIGlmIChnYykKPiA+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25y
X2hnZWkgPSBtaW4oKHVsb25nKWt2bV9yaXNjdl9haWFfbnJfaGdlaSwKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKGdjLT5ndWVzdF9pbmRleF9iaXRz
KSAtIDEpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBn
Yy0+bnJfZ3Vlc3RfZmlsZXMpOwo+ID4gICAgICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpID0gMDsKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNj
di1pbXNpYy1zdGF0ZS5jCj4gPiBpbmRleCBkYzk1YWQ4NTZkODBhLi4xZTk4MmNlMDI0YTQ3IDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4g
PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiA+IEBAIC03
OTQsNyArNzk0LDcgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVj
dCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4gPgo+ID4gIGludCBfX2luaXQgaW1zaWNfc2V0dXBf
c3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ID4gIHsK
PiA+IC0gICAgICAgdTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRfaXJxcywgbnJfbW1pb3MsIG5y
X2hhbmRsZXJzID0gMDsKPiA+ICsgICAgICAgdTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRfaXJx
cywgbnJfbW1pb3MsIG5yX2d1ZXN0X2ZpbGVzLCBucl9oYW5kbGVycyA9IDA7Cj4gPiAgICAgICAg
IHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICpnbG9iYWw7Cj4gPiAgICAgICAgIHN0cnVjdCBp
bXNpY19sb2NhbF9jb25maWcgKmxvY2FsOwo+ID4gICAgICAgICB2b2lkIF9faW9tZW0gKiptbWlv
c192YSA9IE5VTEw7Cj4gPiBAQCAtODg4LDYgKzg4OCw3IEBAIGludCBfX2luaXQgaW1zaWNfc2V0
dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ID4g
ICAgICAgICB9Cj4gPgo+ID4gICAgICAgICAvKiBDb25maWd1cmUgaGFuZGxlcnMgZm9yIHRhcmdl
dCBDUFVzICovCj4gPiArICAgICAgIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgPSBCSVQoZ2xvYmFs
LT5ndWVzdF9pbmRleF9iaXRzKSAtIDE7Cj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9w
YXJlbnRfaXJxczsgaSsrKSB7Cj4gPiAgICAgICAgICAgICAgICAgcmMgPSBpbXNpY19nZXRfcGFy
ZW50X2hhcnRpZChmd25vZGUsIGksICZoYXJ0aWQpOwo+ID4gICAgICAgICAgICAgICAgIGlmIChy
Yykgewo+ID4gQEAgLTkyOCw2ICs5MjksMTAgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0
ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gPiAgICAgICAg
ICAgICAgICAgbG9jYWwtPm1zaV9wYSA9IG1taW9zW2luZGV4XS5zdGFydCArIHJlbG9mZjsKPiA+
ICAgICAgICAgICAgICAgICBsb2NhbC0+bXNpX3ZhID0gbW1pb3NfdmFbaW5kZXhdICsgcmVsb2Zm
Owo+ID4KPgo+IE5lZWQgY29tbWVudHMgZXhwbGFpbmluZyB3aHkgd2UgYXJlIHRha2luZyB0aGUK
PiBtaW5pbXVtIG51bWJlciBvZiBndWVzdCBmaWxlcyBhY3Jvc3MgQ1BVcy4KPgo+ID4gKyAgICAg
ICAgICAgICAgIG5yX2d1ZXN0X2ZpbGVzID0gKHJlc291cmNlX3NpemUoJm1taW9zW2luZGV4XSkg
LSByZWxvZmYpIC8gSU1TSUNfTU1JT19QQUdFX1NaIC0gMTsKPiA+ICsgICAgICAgICAgICAgICBn
bG9iYWwtPm5yX2d1ZXN0X2ZpbGVzID0gZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyA+IG5yX2d1ZXN0
X2ZpbGVzID8gbnJfZ3Vlc3RfZmlsZXMgOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzOwo+Cj4gZ2xvYmFsLT5ucl9ndWVz
dF9maWxlcyA9IG1pbihucl9ndWVzdF9maWxlcywgZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyk7Cj4K
PiA+ICsKPiA+ICAgICAgICAgICAgICAgICBucl9oYW5kbGVycysrOwo+ID4gICAgICAgICB9Cj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oIGIv
aW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+IGluZGV4IDc0OTQ5NTJjNTUx
ODcuLjQzYWVkNTIzODUwMDggMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lycWNoaXAv
cmlzY3YtaW1zaWMuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2lj
LmgKPiA+IEBAIC02OSw2ICs2OSw5IEBAIHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnIHsKPiA+
ICAgICAgICAgLyogTnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBpZGVudGl0aWVzICovCj4gPiAg
ICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9p
ZHM7Cj4gPgo+ID4gKyAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50ZXJydXB0IGZpbGVzIHBl
ciBjb3JlICovCj4gPiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBucl9ndWVzdF9maWxlczsKPiA+ICsKPiA+ICAgICAgICAgLyogUGVyLUNQVSBJTVNJQyBh
ZGRyZXNzZXMgKi8KPiA+ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2NvbmZpZyBfX3BlcmNw
dSAgICAgICpsb2NhbDsKPiA+ICB9Owo+ID4gLS0KPiA+IDIuMjAuMQo+ID4KPgo+IFJlZ2FyZHMs
Cj4gQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
