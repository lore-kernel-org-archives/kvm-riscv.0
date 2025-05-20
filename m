Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DCCC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 May 2025 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0Vr0bBnDKO78y3x0M2aui6dvgFoA6JZkeYiWZ9y8lU=; b=xYJhFAZmLJohxq
	Klwxw5NID1EDp8REUPWvUGwNuEZqkHtt7I7ldtRin1LU172/ReYgelYRr0tk28N4rMv9cr+E3kb7A
	cu4lKEtBzieN75iiYLqbXgR24RtnGJihAMfesvu7b0c+9VPWsBeyN4bhTTwaH1/mBx6ZebEH3c4Ik
	RSEpcOQW6lnpdlV4oH7KcuQgBtHZSQs+7ZUspdG9ARpfc/Gx4G/vW0x03FQ2r6M1ESRjrSUb1ci1N
	C/liSht0IgdT6WTCWM3A7v3jSbOd9tHYH1a/FgHph3o6CbHTXzg0Hb1hlXgcearGG+0PqtoYv7VQd
	ML26V3M/BRpnTe2NGt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPed-0000000DUXK-3IUc;
	Tue, 20 May 2025 16:17:23 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP7x-0000000DOAI-07d3
	for kvm-riscv@lists.infradead.org;
	Tue, 20 May 2025 15:43:38 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d948ce7d9dso18455565ab.2
        for <kvm-riscv@lists.infradead.org>; Tue, 20 May 2025 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747755816; x=1748360616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2VRa/jUrsGCKDxS5Z6TMKwtooPNwiNaoz1os+RUkm4=;
        b=mG6rtYuIvtZf1UVxjOjq3iA4n45RWbwaq2vJbDDFbukUoBxhCflSr4oOD/Sz+r5Ahq
         tOEuIJ5MZoXMZ5+s/4ytyn0xae4dIwC/k5q+meCoFFRjj/6GFT4oAoSemel5Z4dzHF4y
         pATuP5cQHa0BY+mtHThQdLO6ZyIYNWe/GNZgu+ZHpGjUzVR5D+BVAUK0DzCSBskFKSb9
         Qsx7EzXTndI2UZZDTkVmAozKxc2L2/G8iBqDjiSuycJns91GkPAo+JkNmHzYW5sBZkZ5
         dKQgkTXCKQ1Nw1ofZ79ORC0WxvAjXwrB2pQfFtTi3uN/4awWUTWup5M8+WpomUqJCD34
         sabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747755816; x=1748360616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2VRa/jUrsGCKDxS5Z6TMKwtooPNwiNaoz1os+RUkm4=;
        b=iYmBzfvScfGevr/3CNyQB/yBh10AO7SaynSH15iusX9rYQu83Iuk1zPpSXxG/hyovx
         ky3iMuIjKzXU21jRvGksbklrHb+ts4XP7ZfQ8qAdoNc9K5KJkKTYX3YEedSgWxVBKmL+
         MPMjCdk9EAQsb6xDzAiJd/PNu+uZnX09Hl4nw1dHUsqFhFQGihHeVaMbdcCqY+oIRNWJ
         FltKwO172HJE+J8k1/k2r9KsJz0P0ANdcNKNBHdgmKGq3C56ncnid4KYICBdnRtaxeqb
         ywg6qlUV7rgNPUqg1nu+ZLqaSnfDHadWMcKTApvV5rtWZT3Z2l/NUEnEozlLqBqle2vg
         oJOQ==
X-Gm-Message-State: AOJu0YyyE7gELnSqXGAOW5EdhqyvwjfglZzmpWuDsyi/APpALlC+Bf8Z
	/d2N16FQPnOCO0RjVW4OxWAdiOCwoEyKC14tFvx8qs02JQMPkWe/RzHXbZUqrYtGJDgQDIzoGLf
	WMK1ZN4eUTS05cYH3OCwneJFacNCPA4+AreYyZat8IA==
X-Gm-Gg: ASbGncu1/4dhf7TkhNWgSbJX+0Zmli65wvM6urjHlkF3I24pLP7udxRF9bRB1VDwVsc
	UmvmtpufETYgr5pHYO8LoBsv6uAqbqKcO9vtrINGMYrdgqK9LbUwIBEomw4c8CxyRY1gUzNR/RD
	jBVYXx6p/G0jofOcr72y2meHaXG68sqndhaA==
X-Google-Smtp-Source: AGHT+IF3svIngYATXdacDmgtwqS4kspeKGV9kirg85JkxovKAXbQkjkXEoyYlC+whI2UvtEsLa8NT9F24c12+s1HAI0=
X-Received: by 2002:a05:6e02:308b:b0:3db:74b3:3875 with SMTP id
 e9e14a558f8ab-3db8435664amr168934525ab.22.1747755815659; Tue, 20 May 2025
 08:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <20250515143723.2450630-5-rkrcmar@ventanamicro.com> <CAAhSdy1Z43xRC7tGS21-5rcX7uMeuWCHhABSuqNzELbp26aj0Q@mail.gmail.com>
 <DA04W4PO99EJ.1XWOAUMZV4BXG@ventanamicro.com>
In-Reply-To: <DA04W4PO99EJ.1XWOAUMZV4BXG@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 21:13:24 +0530
X-Gm-Features: AX0GCFudAM8hKKKbM9JFa9_NSe9H8wPOJAH-Y_DVCC6e_pSoJwQHL9S3iyHiauo
Message-ID: <CAAhSdy1uKpp=WKXmbnH5BQvTSrK9o-Jd6+nCrQEi3A3efLX52g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084337_073955_09772056 
X-CRM114-Status: GOOD (  22.89  )
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

T24gTW9uLCBNYXkgMTksIDIwMjUgYXQgNTo1NeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDUtMTZUMTc6NTU6MDUrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gVGh1LCBNYXkgMTUsIDIw
MjUgYXQgODoyMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+Pgo+ID4+IEFkZCBhIHRvZ2dsZWFibGUgVk0gY2FwYWJpbGl0eSB0byByZXNl
dCB0aGUgVkNQVSBmcm9tIHVzZXJzcGFjZSBieQo+ID4+IHNldHRpbmcgTVBfU1RBVEVfSU5JVF9S
RUNFSVZFRCB0aHJvdWdoIElPQ1RMLgo+ID4+Cj4gPj4gUmVzZXQgdGhyb3VnaCBhIG1wX3N0YXRl
IHRvIGF2b2lkIGFkZGluZyBhIG5ldyBJT0NUTC4KPiA+PiBEbyBub3QgcmVzZXQgb24gYSB0cmFu
c2l0aW9uIGZyb20gU1RPUFBFRCB0byBSVU5OQUJMRSwgYmVjYXVzZSBpdCdzCj4gPj4gYmV0dGVy
IHRvIGF2b2lkIHNpZGUgZWZmZWN0cyB0aGF0IHdvdWxkIGNvbXBsaWNhdGUgdXNlcnNwYWNlIGFk
b3B0aW9uLgo+ID4+IFRoZSBNUF9TVEFURV9JTklUX1JFQ0VJVkVEIGlzIG5vdCBhIHBlcm1hbmVu
dCBtcF9zdGF0ZSAtLSBJT0NUTCByZXNldHMKPiA+PiB0aGUgVkNQVSB3aGlsZSBwcmVzZXJ2aW5n
IHRoZSBvcmlnaW5hbCBtcF9zdGF0ZSAtLSBiZWNhdXNlIHdlIHdvdWxkbid0Cj4gPj4gZ2FpbiBt
dWNoIGZyb20gaGF2aW5nIGEgbmV3IHN0YXRlIGl0IGluIHRoZSByZXN0IG9mIEtWTSwgYnV0IGl0
J3MgYSB2ZXJ5Cj4gPj4gbm9uLXN0YW5kYXJkIHVzZSBvZiB0aGUgSU9DVEwuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4K
PiA+PiAtLS0KPiA+PiBJZiB3ZSB3YW50IGEgcGVybWFuZW50IG1wX3N0YXRlLCBJIHRoaW5rIHRo
YXQgTVBfU1RBVEVfVU5JTklUSUFMSVpFRAo+ID4+IHdvdWxkIGJlIHJlYXNvbmFibGUuICBLVk0g
Y291bGQgcmVzZXQgb24gdHJhbnNpdGlvbiB0byBhbnkgb3RoZXIgc3RhdGUuCj4gPgo+ID4gWWVz
LCBNUF9TVEFURV9VTklOSVRJQUxJWkVEIGxvb2tzIGJldHRlci4gSSBhbHNvIHN1Z2dlc3QKPiA+
IHRoYXQgVkNQVSBzaG91bGQgYmUgcmVzZXQgd2hlbiBzZXRfbXBzdGF0ZSgpIGlzIGNhbGxlZCB3
aXRoCj4gPiBNUF9TVEFURV9VTklOSVRJQUxJWkVEIGFuZCB0aGUgY3VycmVudCBzdGF0ZSBpcwo+
ID4gTVBfU1RBVEVfU1RPUFBFRC4KPgo+IFRoYXQgd291bGQgcmVzdWx0IGluIHR3byByZXNldHMg
KHN0b3BwZWQgLT4gdW5pbml0aWFsaXplZCAtPiAqKSwgdW5sZXNzCj4gd2UgY2hhbmdlZCB0aGUg
bG9naWMuCj4KPiBXb3VsZCB5b3UgcHJlZmVyIHRvIHJlc2V0IG9uIHRyYW5zaXRpb24gdG8gdGhl
IG5ldyBwZXJtYW5lbnQgbXBfc3RhdGU/Cj4gTVBfU1RBVEVfSU5JVF9SRUNFSVZFRCBzZWVtcyBh
IG1vcmUgZml0dGluZyBuYW1lIGZvciB0aGUgc3RhdGUsIHRoZW4uCj4KCkxldCdzIG5vdCBpbnRy
b2R1Y2UgdW5uZWNlc3Nhcnkgc3RhdGUgdHJhbnNpdGlvbnMgYW5kIGdvIGFoZWFkIHdpdGgKTVBf
U1RBVEVfSU5JVF9SRUNFSVZFRAoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNgoKVGhhbmtzLApBbnVw
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
