Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2CFE77184
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 07:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cLFykElJtlV0Bxxn9yLHKtijxDZvjRNNQhTYVZ5ysk=; b=w27Ta00HsZzkcN
	zj5Ho5EoKBG4qSsc2vXRXCtuR6cObwBqULvgcslxe8z8g248pUOIV4zIg3Fmd9s3bJFGS5Y+1ZDxc
	0NkRlexXH6MoAzMPhnQtiOKGNEG5hXQ2I7vsHbKnXVmVxYgQ43x0q6VgBbm7KzxLeWh4VdK9QKEGi
	nNPK67DiH9Ty1PHMq9aKAL5pBN0qtSYpK/IggqNasGyD9IneFxuYajwX/b4Ae67DH5KaBY3rjUg8K
	gWq3NXzXA1TIE7cxR3oucwibZ4uYqjtp4mTUJ8nYPlueNx1bjslec4PzTH8j4ng/FdwiKOOrZ/KLo
	wDwdsJmWWoGEvAkt4g9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAZf-000000011Kk-2ofa;
	Thu, 19 Dec 2024 07:03:55 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOAZc-000000011Iu-0Mnz
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 07:03:54 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-844e06e5d11so15349739f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Dec 2024 23:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734591831; x=1735196631; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IyRYMrQ+U88prMKntBAgM3/KLNAlFs7l2A7rj6Z5wI=;
        b=RoNb+07Wbugz5w/THp/JpJt56+Dg9N0Y/acMd6gfumszw8fvnRvkuU4mOD1gY+T33V
         i0ZORmvhHRRbQPNMZTYzWyaHv97cNfn+k0MVR31jn09M28e1Oktqeupt7KEUzhUoPoGn
         9rXlcqQ2Nclzlkp8aGvcs3sVlC5AOPtev4zFU+eTmhPTh5U0oFhXFqjebeCIzah0e33I
         AIl3yRCHe3/DCrpZunv3weaiELC4ocm272ORsM/sru2H7o6XHrWNnheDYPToPwQojYoe
         U0OwSa5CtrR36byshygNsgjfJkRuu+gVbbT+p7rQJ9g6H4Hb3us8lRikq2SaSevom1cU
         hvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734591831; x=1735196631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IyRYMrQ+U88prMKntBAgM3/KLNAlFs7l2A7rj6Z5wI=;
        b=Jm6Cfhdt4xN7wn1sirwIsgRRAOQ+5WsyLIUrZs1oI02huIF6PY3W1UpSAXXn4tfhst
         kImi3ugXIaH7kehURoksTJIf6b+SC4v1sMUUObouOnNwN3oNUH+xkJ0qqXN7QKA9Dlww
         nU+Pj1GMr/AoMB+dfHMvLUD3r1B3+fSSqGQS+LH6qkFhd17Kw+7SP6QSWDpu7CVP50Dg
         b4YKdHAv01RjuaMQJ7wXnT+9T21KRnY0AaOlCdXsSrHmEMXiyc83uftSnAV8Ab2F1hfP
         npNrizD4cXaXDuUOsocrUQ5dYJWCNDdHp4b5ouzd05mVj9WBO5esdwqzr1kaIbvj/WQE
         H/IA==
X-Forwarded-Encrypted: i=1; AJvYcCXL1iFJHIL+RxNzToOwSdbkPu4xz7fgqcDMuRXqyR8J0Ouq65pa+ZO4nOQAZl//hA1HlLudRqzywk8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCuZ7lUYNywPkYdPeFKk26SNt7zGHvwaVKf2GNvLVN+Mx90qR
	3dHFUj2ImUdZUpuRekmeMiF/X+d9EI7bC+AcIw/itp2o87TQIOn+uQOEwiQYBoeVoLaFx8B6vVB
	IPEAMeUmAarBwy+7XjBvM+9W7EJq8loG654+TZg==
X-Gm-Gg: ASbGncsFC9gAN/QjLy8ryeIjjDB7f6O6bX1vD73TzgvOfi1U6AMh0qoQaY7EbpVX+bj
	e6pboXyhIf938GILmqjoAxN6lg/7tw8C1f/Yj8dho
X-Google-Smtp-Source: AGHT+IG7K8LVwmKDLwQagB5eeJHC8noPY3o49G9HivcQ4b1KpCh7GGt+VMTIDEX4ZGjSzWgbcXm6Uq3kn17dO0L7Z2c=
X-Received: by 2002:a05:6e02:1c0a:b0:3a8:1195:f216 with SMTP id
 e9e14a558f8ab-3bdc0bc8506mr46871165ab.10.1734591830886; Wed, 18 Dec 2024
 23:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
In-Reply-To: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 12:33:39 +0530
X-Gm-Features: AbW1kvaeKrmON3-aRkJn8oFVJnZKK1n-LGgp_tS3faKBQ12slThrlN-_Fqb1ysk
Message-ID: <CAAhSdy3pHHJ7hqEvjnhFaTW7SQTmAU67b8KXgbtwi6-YHv_pwQ@mail.gmail.com>
Subject: Re: [PATCH RFC v4 0/3] riscv: add Svukte extension
To: Max Hsu <max.hsu@sifive.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_230352_185263_E7F4D644 
X-CRM114-Status: GOOD (  24.12  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgNTowM+KAr1BNIE1heCBIc3UgPG1heC5oc3VAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBSSVNDLVYgcHJpdmlsZWdlZCBzcGVjIHdpbGwgYmUgYWRkZWQgd2l0
aCBTdnVrdGUgZXh0ZW5zaW9uIFsxXQo+Cj4gU3Z1a3RlIGludHJvZHVjZSBzZW52Y2ZnLlVLVEUg
YW5kIGhzdGF0dXMuSFVLVEUgYml0ZmllbGQuCj4gd2hpY2ggbWFrZXMgdXNlci1tb2RlIGFjY2Vz
cyB0byBzdXBlcnZpc29yIG1lbW9yeSByYWlzZSBwYWdlIGZhdWx0cwo+IGluIGNvbnN0YW50IHRp
bWUsIG1pdGlnYXRpbmcgYXR0YWNrcyB0aGF0IGF0dGVtcHQgdG8gZGlzY292ZXIgdGhlCj4gc3Vw
ZXJ2aXNvciBzb2Z0d2FyZSdzIGFkZHJlc3Mtc3BhY2UgbGF5b3V0Lgo+Cj4gSW4gdGhlIExpbnV4
IGtlcm5lbCwgc2luY2UgdGhlIGhzdGF0dXMuSFUgYml0IGlzIG5vdCBlbmFibGVkLAo+IHRoZSBm
b2xsb3dpbmcgcGF0Y2hlcyBvbmx5IGVuYWJsZSB0aGUgdXNlIG9mIHNlbnZjZmcuVUtURS4KPgo+
IEZvciBHdWVzdCBlbnZpcm9ubWVudHMsIGJlY2F1c2UgYSBHdWVzdCBPUyAobm90IGxpbWl0ZWQg
dG8gTGludXgpCj4gbWF5IGhvbGQgbWFwcGluZ3MgZnJvbSBHVkEgdG8gR1BBLCB0aGUgR3Vlc3Qg
T1Mgc2hvdWxkIGRlY2lkZQo+IHdoZXRoZXIgdG8gZW5hYmxlIHRoZSBwcm90ZWN0aW9uIHByb3Zp
ZGVkIGJ5IHRoZSBTdnVrdGUgZXh0ZW5zaW9uLgo+Cj4gU2luY2UgdGhlIEd1ZXN0IE9TIG1heSB1
dGlsaXplIHRoZSBTdnVrdGUgZXh0ZW5zaW9uIHNpbXBseSBieSBzZXR0aW5nCj4gdGhlIHNlbnZj
ZmcuVUtURSB3aXRob3V0IGFueSB0cmFwIHRvIGhvc3QuIEluIHRoZSB2aWV3IG9mIFZNTSwgdGhl
Cj4gU3Z1a3RlIGV4dGVuc2lvbiBzaG91bGQgYmUgYWx3YXlzIHByZXNlbnRlZC4gVGhlcmVmb3Jl
IGFkZGluZyBhbgo+IGV4dHJhIGVudHJ5IGluIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2Fs
bG93ZWQoKS4KPgo+IElmIHRoZSBHdWVzdCBlbnZpcm9ubWVudCB3YW50cyB0byBjaGFuZ2Ugc2Vu
dmNmZy5VS1RFLCBLVk0gYWxyZWFkeQo+IHByb3ZpZGVzIHRoZSBzZW52Y2ZnIENTUiBzd2FwIHN1
cHBvcnQgdmlhCj4ga3ZtX3Jpc2N2X3ZjcHVfc3dhcF9pbl8oaG9zdHxndWVzdClfc3RhdGUuCj4g
VGh1cywgdGhlcmUgaXMgbm8gY29uY2VybiBhYm91dCB0aGUgR3Vlc3QgT1MgYWZmZWN0aW5nIHRo
ZSBIb3N0IE9TLgo+Cj4gVGhlIGZvbGxvd2luZyBwYXRjaGVzIGFkZAo+IC0gZHQtYmluZGluZyBv
ZiBTdnVrdGUgSVNBIHN0cmluZwo+IC0gQ1NSIGJpdCBkZWZpbml0aW9uLCBJU0EgZGV0ZWN0aW9u
LCBzZW52Y2ZnLlVLVEUgZW5hYmxlbWVudCBpbiBrZXJuZWwKPiAtIEtWTSBJU0Egc3VwcG9ydCBm
b3IgU3Z1a3RlIGV4dGVuc2lvbgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAtIHJlYmFzZSBvbiByaXNj
di9mb3ItbmV4dAo+IC0gYWRkIGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQoKSBl
bnRyeSBhZGRyZXNzZWQgYnkgQW51cAo+ICAgYW5kIEFuZHJldyBmcm9tIHYyL3YzIHBhdGNoZXMu
Cj4gICAtIHVwZGF0ZSB0aGUgY292ZXIgbGV0dGVyIGZvciB0aGUgZGV0YWlsZWQgcmVhc29uCj4g
LSB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIG9uIGR0LWJpbmRpbmcgZm9yIHRoZSBTdnVrdGUg
SVNBIHN0cmluZwo+IC0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIw
MjQxMTIwLWRldi1tYXhoLXN2dWt0ZS12My12My0wLTFlNTMzZDQxYWUxNUBzaWZpdmUuY29tLwo+
Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIHJlYmFzZSBvbiByaXNjdi9mb3ItbmV4dAo+IC0gZml4ZWQg
dHlwbyBpbiB0aGUgZHQtYmluZGluZyBmb3IgdGhlIFN2dWt0ZSBJU0Egc3RyaW5nCj4gLSB1cGRh
dGVkIHRoZSBjb21taXQgbWVzc2FnZSBmb3IgS1ZNIHN1cHBvcnQgZm9yIHRoZSBTdnVrdGUgZXh0
ZW5zaW9uCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA5
MjctZGV2LW1heGgtc3Z1a3RlLXJlYmFzZS0yLXYyLTAtOWFmZTU3YzMzYWVlQHNpZml2ZS5jb20v
Cj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gcmViYXNlIG9uIHJpc2N2L2Zvci1uZXh0IChyaXNjdi1m
b3ItbGludXMtNi4xMi1tdzEpCj4gLSBtb2RpZnkgdGhlIGRlc2NyaXB0aW9uIG9mIGR0LWJpbmRp
bmcgb24gU3Z1a3RlIElTQSBzdHJpbmcKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI0MDkyMC1kZXYtbWF4aC1zdnVrdGUtcmViYXNlLXYxLTAtNzg2NGE4OGE2
MmJkQHNpZml2ZS5jb20vCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Yt
aXNhLW1hbnVhbC9wdWxsLzE1NjQgWzFdCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXgu
aHN1QHNpZml2ZS5jb20+Cj4KPiAtLS0KPiBNYXggSHN1ICgzKToKPiAgICAgICBkdC1iaW5kaW5n
czogcmlzY3Y6IEFkZCBTdnVrdGUgZW50cnkKPiAgICAgICByaXNjdjogQWRkIFN2dWt0ZSBleHRl
bnNpb24gc3VwcG9ydAo+ICAgICAgIHJpc2N2OiBLVk06IEFkZCBTdnVrdGUgZXh0ZW5zaW9uIHN1
cHBvcnQgZm9yIEd1ZXN0L1ZNCgpPdmVyYWxsLCB0aGlzIHNlcmllcyBsb29rcyBnb29kIHRvIG1l
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcy1wZXIg
TGludXggUklTQy1WIHBhdGNoIGFjY2VwdGFuY2UgcG9saWN5LCB3ZSB3aWxsIGhhdmUgdG8Kd2Fp
dCB1bnRpbCB0aGUgc3BlYyBpcyBmcm96ZW4uCgpSZWdhcmRzLApBbnVwCgo+Cj4gIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA5ICsrKysr
KysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0u
aCAgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDUgKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKysKPiAgNiBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gLS0tCj4gYmFzZS1jb21taXQ6IGZhYzA0
ZWZjNWM3OTNkY2NiZDA3ZTJkNTlhZjlmOTBiN2ZjMGRjYTQKPiBjaGFuZ2UtaWQ6IDIwMjQxMjEz
LWRldi1tYXhoLXN2dWt0ZS12NC0zNDEwMWVjOTQ1ZTkKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+
IE1heCBIc3UgPG1heC5oc3VAc2lmaXZlLmNvbT4KPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
