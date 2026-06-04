Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAF7CD6E68
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 05:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4qMjtwWF2AhK/L9NOe6vuxGSU+8wXP9NIScwXNYSpM=; b=H5Ow/h9aGlrgV0
	hKDwf+VTgzamjuNmVtuAq0dT1v192iZcnG64Rs7VBoGlY9JSxIPCJ4s5f469C1FO44BAZ82mcOUe9
	d7FFzSdPYBlU3PAXt+/OYZZGwEG4xPehFGq50NWLWdKkdnR/CxUDcT/ui8vY1WCf/MjZcRt/djRvG
	HiirRYhyYFazRp4y2u7YMFSMWcadhLx+MEVBWSuy5xVQFCTqU8me8lzMaITXfInR1XmXgiS699cZP
	/gEe1LKJCNok1aF2yEgZSKXeNU/ZaCLNiyVRgtPrS7ry63Dp1Kcn1B+/7xlBA+XkyKKsqSwlZy1/o
	bOgAoDXiG7knlAxGmGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0oy-0000000GBVg-2IT0;
	Thu, 04 Jun 2026 05:40:48 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0ow-0000000GBUp-07Pn
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 05:40:47 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-69e1eae4eb4so234926eaf.2
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 22:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780551645; cv=none;
        d=google.com; s=arc-20240605;
        b=kP9mbXqCh1me76XQaWh2PR74pj5UgMtmolIid1ycXuJmm3qPd1T4xU42A953Si/+AW
         w/ER4KDEkBDYHNPbiVKMwO8bYQ47B3z6mqocRziyS4TrW3Tq0YsU1FVfyYZrnKjzM2QH
         nJqlV7OJJL6sLj0FbL+T3Ztt7esXCvUCS4uUfNhOcAE9T8XI/ZzHv8grZpZa0DOFQ5Uy
         o/IpSgqXH/4jES7dpvj3+Az1KX5Ywb8rElq84iRruy5YhCV2fZiI50x9N2c7wzFZ9a1t
         ka3e/WaJBtDdsrZA4Gp6sCpaym6WoBNXKmKTOzSX1Ls+yEpPhIcHU6gaX0L9tIAuehvQ
         h0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=usx7JIclZBP48czky2PIbdzhjqBH7d8Co30aVJaLTDs=;
        fh=nsy5dhEbtFL/w1n/6T6ObUx3QoeowyjG4c1KdOPhKyQ=;
        b=gVHiCJYNJrwyxWFAemtkcgN4hIU/37JqI1mSyyYyGGWCRRcWfhGjm6YG+GnA+QNwNh
         PpTRvcN2fXjzIpItBrcxHAhrLDcXuhklQikCgw2y7qXFI5n9AsVTDse7JKMyarHWzScl
         9aOPbvUZsXwtNUdRnZuEEEBJrlkSlQsPIceAbgLQAW29NHcXUzVwAPl7LH98Qgee+EUW
         Slm2rWm/0+bACNXQzXIyXBa0jAf5fKt55ZSSABlWbfXEdbstwBhVh7a08zItjPcB0diL
         il9JWDitwiNsq1hF1vouYbN2BngDotd3Y2JjcXlN1MozicZQRXXxJWKAlA0rKUdkDvXz
         7s1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780551645; x=1781156445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usx7JIclZBP48czky2PIbdzhjqBH7d8Co30aVJaLTDs=;
        b=wpPDtA8ZQMpJzn3MgQo1eSxD2uEoBESAshYA/3W8atX7uygGKRCHx8ksERoJjjN8oz
         6sHZl5g9Q3kFnfslXzIJRM/hJk0i5uy2KiS4zVkaRMecpzFbjIej7mwG/10J/uEIUNyb
         VOSQb7TtaffpfZ3fH5cL+I2OOSN/4TGhBLZEg8Bnm8Zo8JWBmPJ50EA1NuKfrLZO+UJK
         PgrjQeKXBK6aoaOR2QtRpmFAOv9X34e5aI7D/XiGinXiiW+iMOCoKvJHCGc7AkR8fedZ
         B6MGp1Wv1N2guw20dkVbefhWklbQwMiaNSFWXuHE/hYIVWvxYtsONQV5/WFtEt6fw4t8
         OICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780551645; x=1781156445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=usx7JIclZBP48czky2PIbdzhjqBH7d8Co30aVJaLTDs=;
        b=mCnpChid5X5ouY9d0c5T9flDMuoZe6m9XhQAfO5rLN9/Numy05VwiGezsveOnNOo7E
         B4OGDtTalzbmhQVHj+94W2lgd83ZCANYuklvnA03a0gCWp7p66cbrQFEGunrrp3jjAIg
         4cMYZMDyYtkEr2HjJFemeFwcUJcQHU1trrUe89SLjKvrtdrMMxvq0NPx2j2PTHZ54SU4
         XCiNCDdlhK6YQzfjHMKicIrnnY+waAaUjHH1z9kxbkuGRVLtur2mDmidwGkB+7+jVrfq
         SL0V5jSM+0k+id+MgV/W2nN7OgUe1gWz6ATh6YP8HcHP5TLNHgOt9k8aUSCPn/DNjJgf
         3KFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xAHhalGazHBe7Xvsp4Ju3GjxwvX+6eREn1gOm3OCNfRMAVOTbRXfDQNrFgE1RJMRgZQVVEdMS4MM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxe2eztc1Py4PfQ2u0zA8zI59lO9L3YJuCvNp3knG0qOE6P2q4
	uodOSj/k7Ds/u57GTLc1vyuaBfU2s6m7euiPdz40oScq7fTv/DOsIOqM6fDddqrra8M0BFiautu
	Bku8uo6VZZXMTInvSdLvMsxojkarzlBibNgouFD7V1A==
X-Gm-Gg: Acq92OGRO5Ixj+LVo+DawFL2yYoFJxGiaCU7AOaeuCPzv4laz86kM4st9O/USvsL7P7
	ATTWjItX17xTqcqa39qNAKc2fktpxHjeuO8F3Ys1bDKxLeRGyI9IFLySaydccb5BHHGrZrGsk6o
	Qlkmx3K5lAQgHBWUtAAWM8GnX/Pr73jh2MuXLdIVMnJXnXqSRI8nALk3iCsyCk56Z+h2dLlgiQ6
	H1yA7nrCW46R9KEn57b12l2Kmlo80SFFNz4r78w0t6PhPUi5G4pjv9p/FEgwV7tLmZJ2eki5BTi
	aaYyif5IZyBIyh61gpcl1NlZV6xg3F++cY18cz4CNaZ2g0uhf59QCcMC2dSxgKNKG4sRa2r8eZI
	7mma9a6i+LSrIM9+gQHhghVWqkWQRYrkGvDdZ312QtiAdmP4=
X-Received: by 2002:a05:6820:f064:b0:69d:e4c8:86f6 with SMTP id
 006d021491bc7-69e47e92580mr2972770eaf.15.1780551644917; Wed, 03 Jun 2026
 22:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260520152148.131272-1-tjytimi@163.com> <20260520152148.131272-3-tjytimi@163.com>
In-Reply-To: <20260520152148.131272-3-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 11:10:32 +0530
X-Gm-Features: AVHnY4KLKxgI8rZ055_ZYdjTGmDv_9K6n7Qflz8bYHec2u1kZ7uWSMP1jn70no8
Message-ID: <CAAhSdy2MhnN_6t2_Gpds-bVk+LzYCZsYTe+QXw-CMHdc58o2EA@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: riscv: Check hugetlb block mappings against
 memslot bounds
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, kvm <kvm@vger.kernel.org>, 
	kvm-riscv <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224046_076500_D8AFFC47 
X-CRM114-Status: GOOD (  28.83  )
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgODo1MuKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBSSVNDLVYgS1ZNIGhhcyB1c2VkIHRoZSBodWdldGxiIFZNQSBzaXpl
IGRpcmVjdGx5IGFzIHRoZSBHLXN0YWdlCj4gbWFwcGluZyBzaXplIHNpbmNlIHN0YWdlLTIgcGFn
ZSB0YWJsZSBzdXBwb3J0IHdhcyBhZGRlZC4gVGhhdCBpcyBzYWZlCj4gb25seSBpZiB0aGUgYmxv
Y2sgY292ZXJlZCBieSB0aGUgZmF1bHQgaXMgZnVsbHkgY29udGFpbmVkIGluIHRoZQo+IG1lbXNs
b3QgYW5kIHRoZSB1c2Vyc3BhY2UgYWRkcmVzcyBoYXMgdGhlIHNhbWUgb2Zmc2V0IGFzIHRoZSBH
UEEKPiB3aXRoaW4gdGhhdCBibG9jay4KPgo+IFRoZSBUSFAgcGF0aCBhbHJlYWR5IGNoZWNrcyB0
aG9zZSBjb25zdHJhaW50cyBiZWZvcmUgaW5zdGFsbGluZyBhIFBNRAo+IGJsb2NrIG1hcHBpbmcu
IFRoZSBodWdldGxiIHBhdGggZGlkIG5vdCwgc28gYW4gdW5hbGlnbmVkIG1lbXNsb3QgY291bGQK
PiBtYWtlIEtWTSBpbnN0YWxsIGEgUE1EIG9yIFBVRCBzaXplZCBHLXN0YWdlIGJsb2NrIHRoYXQg
Y292ZXJzIG1lbW9yeQo+IG91dHNpZGUgdGhlIHNsb3Qgb3IgbWFwcyB0aGUgd3JvbmcgaG9zdCBw
YWdlcy4KPgo+IFNlbGVjdCBodWdldGxiIG1hcHBpbmcgc2l6ZXMgdGhyb3VnaCB0aGUgc2FtZSBt
ZW1zbG90LWJvdW5kYXJ5IGNoZWNrLAo+IGZhbGxpbmcgYmFjayBmcm9tIFBVRCB0byBQTUQgdG8g
UEFHRV9TSVpFLiBXaGVuIGEgc21hbGxlciBodWdldGxiCj4gbWFwcGluZyBzaXplIGlzIHNlbGVj
dGVkLCBmYXVsdCB0aGUgR0ZOIGFsaWduZWQgdG8gdGhhdCBzZWxlY3RlZCBzaXplCj4gaW5zdGVh
ZCBvZiB0aGUgb3JpZ2luYWwgVk1BIHNpemUuCj4KPiBBbHNvIGtlZXAgaHVnZXRsYiBtYXBwaW5n
cyBvdXQgb2YgdHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KCkuIE9uY2UKPiB0aGUgaHVnZXRs
YiBwYXRoIGhhcyBjaG9zZW4gUEFHRV9TSVpFLCBwcm9tb3RpbmcgaXQgYWdhaW4gdGhyb3VnaCB0
aGUKPiBUSFAgaGVscGVyIHdvdWxkIG1pc3MgdGhlIGh1Z2V0bGIgZmFsbGJhY2sgZGVjaXNpb24u
Cj4KPiBGaXhlczogOWQwNWMxZmVlODM3ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBzdGFnZTIg
cGFnZSB0YWJsZSBwcm9ncmFtbWluZyIpCj4gU2lnbmVkLW9mZi1ieTogSmlueXUgVGFuZyA8dGp5
dGltaUAxNjMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDQwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDEwYmU4ZjY4My4uZDIzNzhi
YjFmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rdm0vbW11LmMKPiBAQCAtNDIzLDEyICs0MjMsMzMgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
dHJhbnNwYXJlbnRfaHVnZXBhZ2VfYWRqdXN0KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgIHJl
dHVybiBQQUdFX1NJWkU7Cj4gIH0KPgo+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBodWdldGxiX21h
cHBpbmdfc2l6ZShzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICptZW1zbG90LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaHZhLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFwX3Np
emUpCj4gK3sKPiArICAgICAgIHN3aXRjaCAobWFwX3NpemUpIHsKPiArICAgICAgIGNhc2UgUFVE
X1NJWkU6Cj4gKyAgICAgICAgICAgICAgIGlmIChmYXVsdF9zdXBwb3J0c19nc3RhZ2VfaHVnZV9t
YXBwaW5nKG1lbXNsb3QsIGh2YSwgUFVEX1NJWkUpKQoKVGhpcyBwYXRjaCBpcyBtYXJrZWQgd2l0
aCBhIEZpeGVzIHRhZyBidXQgZG9lcyBub3QgaW5jbHVkZSB0aGUgY2hhbmdlcwphZGRpbmcgbWFw
X3NpemUgcGFyYW1ldGVyIHRvIGZhdWx0X3N1cHBvcnRzX2dzdGFnZV9odWdlX21hcHBpbmcoKS4K
CkkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIHNxYXNoIFBBVENIMSBpbnRvIHRoaXMgcGF0Y2ggZm9y
IGNvbXBsZXRuZXNzIG9mCnRoaXMgcGF0Y2ggYXMgRml4LgoKUmVnYXJkcywKQW51cAoKPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFVEX1NJWkU7Cj4gKyAgICAgICAgICAgICAgIGZh
bGx0aHJvdWdoOwo+ICsgICAgICAgY2FzZSBQTURfU0laRToKPiArICAgICAgICAgICAgICAgaWYg
KGZhdWx0X3N1cHBvcnRzX2dzdGFnZV9odWdlX21hcHBpbmcobWVtc2xvdCwgaHZhLCBQTURfU0la
RSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBNRF9TSVpFOwo+ICsgICAgICAg
ICAgICAgICBmYWxsdGhyb3VnaDsKPiArICAgICAgIGNhc2UgUEFHRV9TSVpFOgo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gUEFHRV9TSVpFOwo+ICsgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIG1hcF9zaXplOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICBpbnQga3ZtX3Jp
c2N2X21tdV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90
ICptZW1zbG90LAo+ICAgICAgICAgICAgICAgICAgICAgICBncGFfdCBncGEsIHVuc2lnbmVkIGxv
bmcgaHZhLCBib29sIGlzX3dyaXRlLAo+ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3Zt
X2dzdGFnZV9tYXBwaW5nICpvdXRfbWFwKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0Owo+ICAgICAg
ICAga3ZtX3Bmbl90IGhmbjsKPiArICAgICAgIGJvb2wgaXNfaHVnZXRsYjsKPiAgICAgICAgIGJv
b2wgd3JpdGFibGU7Cj4gICAgICAgICBzaG9ydCB2bWFfcGFnZXNoaWZ0Owo+ICAgICAgICAgZ2Zu
X3QgZ2ZuID0gZ3BhID4+IFBBR0VfU0hJRlQ7Cj4gQEAgLTQ2MiwxNiArNDgzLDIzIEBAIGludCBr
dm1fcmlzY3ZfbW11X21hcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fbWVtb3J5
X3Nsb3QgKm1lbXNsb3QsCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICAgICAg
ICAgfQo+Cj4gLSAgICAgICBpZiAoaXNfdm1faHVnZXRsYl9wYWdlKHZtYSkpCj4gKyAgICAgICBp
c19odWdldGxiID0gaXNfdm1faHVnZXRsYl9wYWdlKHZtYSk7Cj4gKyAgICAgICBpZiAoaXNfaHVn
ZXRsYikKPiAgICAgICAgICAgICAgICAgdm1hX3BhZ2VzaGlmdCA9IGh1Z2VfcGFnZV9zaGlmdCho
c3RhdGVfdm1hKHZtYSkpOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICB2bWFfcGFn
ZXNoaWZ0ID0gUEFHRV9TSElGVDsKPiAgICAgICAgIHZtYV9wYWdlc2l6ZSA9IDFVTEwgPDwgdm1h
X3BhZ2VzaGlmdDsKPiAgICAgICAgIGlmIChsb2dnaW5nIHx8ICh2bWEtPnZtX2ZsYWdzICYgVk1f
UEZOTUFQKSkKPiAgICAgICAgICAgICAgICAgdm1hX3BhZ2VzaXplID0gUEFHRV9TSVpFOwo+ICsg
ICAgICAgZWxzZSBpZiAoaXNfaHVnZXRsYikKPiArICAgICAgICAgICAgICAgdm1hX3BhZ2VzaXpl
ID0gaHVnZXRsYl9tYXBwaW5nX3NpemUobWVtc2xvdCwgaHZhLCB2bWFfcGFnZXNpemUpOwo+Cj4g
KyAgICAgICAvKgo+ICsgICAgICAgICogRm9yIGh1Z2V0bGIgbWFwcGluZ3MsIHZtYV9wYWdlc2l6
ZSBtaWdodCBoYXZlIGJlZW4gcmVkdWNlZCBmcm9tIHRoZQo+ICsgICAgICAgICogVk1BIHNpemUg
dG8gYSBzbWFsbGVyIHNhZmUgbWFwcGluZyBzaXplLgo+ICsgICAgICAgICovCj4gICAgICAgICBp
ZiAodm1hX3BhZ2VzaXplID09IFBNRF9TSVpFIHx8IHZtYV9wYWdlc2l6ZSA9PSBQVURfU0laRSkK
PiAtICAgICAgICAgICAgICAgZ2ZuID0gKGdwYSAmIGh1Z2VfcGFnZV9tYXNrKGhzdGF0ZV92bWEo
dm1hKSkpID4+IFBBR0VfU0hJRlQ7Cj4gKyAgICAgICAgICAgICAgIGdmbiA9IEFMSUdOX0RPV04o
Z3BhLCB2bWFfcGFnZXNpemUpID4+IFBBR0VfU0hJRlQ7Cj4KPiAgICAgICAgIC8qCj4gICAgICAg
ICAgKiBSZWFkIG1tdV9pbnZhbGlkYXRlX3NlcSBzbyB0aGF0IEtWTSBjYW4gZGV0ZWN0IGlmIHRo
ZSByZXN1bHRzIG9mCj4gQEAgLTUxMyw4ICs1NDEsMTIgQEAgaW50IGt2bV9yaXNjdl9tbXVfbWFw
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqbWVtc2xvdCwK
PiAgICAgICAgIGlmIChtbXVfaW52YWxpZGF0ZV9yZXRyeShrdm0sIG1tdV9zZXEpKQo+ICAgICAg
ICAgICAgICAgICBnb3RvIG91dF91bmxvY2s7Cj4KPiAtICAgICAgIC8qIENoZWNrIGlmIHdlIGFy
ZSBiYWNrZWQgYnkgYSBUSFAgYW5kIHRodXMgdXNlIGJsb2NrIG1hcHBpbmcgaWYgcG9zc2libGUg
Ki8KPiAtICAgICAgIGlmICghbG9nZ2luZyAmJiAodm1hX3BhZ2VzaXplID09IFBBR0VfU0laRSkp
Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogQ2hlY2sgaWYgd2UgYXJlIGJhY2tlZCBieSBhIFRI
UCBhbmQgdGh1cyB1c2UgYmxvY2sgbWFwcGluZyBpZgo+ICsgICAgICAgICogcG9zc2libGUuIEh1
Z2V0bGIgbWFwcGluZ3MgYWxyZWFkeSBzZWxlY3RlZCB0aGVpciB0YXJnZXQgc2l6ZSBhYm92ZSwK
PiArICAgICAgICAqIHNvIGRvIG5vdCBwcm9tb3RlIHRoZW0gdGhyb3VnaCB0aGUgVEhQIGhlbHBl
ci4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFsb2dnaW5nICYmICFpc19odWdldGxiICYm
IHZtYV9wYWdlc2l6ZSA9PSBQQUdFX1NJWkUpCj4gICAgICAgICAgICAgICAgIHZtYV9wYWdlc2l6
ZSA9IHRyYW5zcGFyZW50X2h1Z2VwYWdlX2FkanVzdChrdm0sIG1lbXNsb3QsIGh2YSwgJmhmbiwg
JmdwYSk7Cj4KPiAgICAgICAgIGlmICh3cml0YWJsZSkgewo+IC0tCj4gMi40My4wCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
