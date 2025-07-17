Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69C4C83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fVlWCOphL3TSTFDOCKTRJxhQ+Q3NUi1vG0f49HI2mg=; b=qOuOlC3UY/KY4Q
	DWQVZ9ZL5chUXCN/sFGy5uxexhSgyYJh+qC1P2i7u8nqCJ9fNbOCsesylz91ur8qWJlr8m/7x9eua
	ELTTPLsyLrFZ6VxI7ICN080wz/J0wBhk/CWQHO4yoxMZz/IoFamIdcDQTIl7P1A2yFhY/mfCtwbPM
	n/vjIM7Uu+XKt9RJSf2+nLzql7l0Pck6ZxoIrq2AQw/pIgMacUkwKK6YMJeXa0FohXQAfn2bKtcg7
	yFNhEATdTPP02UD3xtzWYQ5oPGRxGariph5pR8B6lpPYcf6vcR0VgaMUcyavk5GoFgnoBM8cH7PiD
	D/6dXdKQI4EfzqyESzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHql-00000009GYr-0yey;
	Thu, 17 Jul 2025 06:12:11 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHpn-00000009GQZ-0czq
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:11:12 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-879c737bc03so16646039f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752732670; x=1753337470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFXDSElKOOqp2lhmXXGsXGr9VDCoQ/FfrBr7vY0pwQs=;
        b=gHbOG18vMJTSr6bdKjmIfJ363Os7rJ4ZaMRh8c8DbZ60hSEcTmKbHzAVLcQZK8v0Zq
         zEO5MNZ7PO0u6BYjhJS4rSMfMmraVReTr15tTJAoC4Snsx1aLZHTPeNnY3Jl77mYXeQH
         esNwBNFibs6zGn0JcrGGV5g7pir5cb/wtqHz3WUdq2WNjbFrP/tsHYc9NGDkpDJgU15I
         U6o6I/dbyMVWxV767sfhwRU/cDvDfcTQ2/DE673WIm3My1etAZ+w7JCFc1U8KCtGPtAr
         GL7M9Mx+hBMROEP0Sk4oATmMTBxXKh8PQeWEicpVlxddzcN8eNg62mVsDohrGBhShunj
         N9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732670; x=1753337470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFXDSElKOOqp2lhmXXGsXGr9VDCoQ/FfrBr7vY0pwQs=;
        b=pHubImZw0V6Eplns0NrEdke2e5GO8Pn9p/Gsp6BnNuqcwK2PqNYA/pdpzaIJuapECb
         2/eLkIL3p0HU8GRPtRQG7V4miKQusBiW7JBr1Yq22DTKo2BLS81kaYKbnNeAFjg2aMIu
         rDF8qX5Atga0sGHT0vhBG0QcKxgRTTrvn5gwsbzatChvnVnQLMLGBw2g1f6fcPP3iOR9
         YcC9pHu5n/cHbvEwXbBB4CQDQ5NjQiX7hj+cvfedVg6Jl8OWbM+a3CULqdLDNeTGQ/s2
         lSHXjq0xebyYJEXlFp3qweBhnZvkbtc1O3HzSWsniq8MpDmY7ptFBhu/4a9gpf0zN4G1
         Loxw==
X-Forwarded-Encrypted: i=1; AJvYcCVz3yr0YwHm94m9Wi6UtBIr5HuTe5Kfn6IGIAoatLk3B/H8wZcvxw9+5X9LJKwShxBP/hMFCeUz8b4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFpfUAPpCvNL0JNGS7+thIEguKQ6o6lO/CWa3IgFDfTvhQfU2f
	prf45wpH0zCb7WCwqEINnF5ER7O76esnktHU7VGfIf1hYjJaQBOtaDMljbQ/OWwsKtoa05jDuUr
	mrEvEQzHENpaSf2zlLki94XBqZJmcwDk6731jaWQUFg==
X-Gm-Gg: ASbGncup0KW1g57pYgvCdplYdrQ9ThDMa5ry5s03472Vc+Boq4b8w3bcpeWe2C4f4E5
	YJIisH+Zihyqvp2vcuV2ghRajr0TqTm0e9LwR44QoObs6vpnqkjbUczyuauutRDxlTb+yCbUQ5I
	B7Le4YXBJdWM5jgqUS8XttiZ2q9+x+yaWwxpT/mtfhASw6WecEyl60BL+wCxmnABUGpu7Aluxw/
	dRz0w==
X-Google-Smtp-Source: AGHT+IF01QfJyQMefqtK6K31hKuroqHVJNbfRoBUWtdmJCmhcOeVgxFHACALHAoTtmmMAVZj3g7jLJEfDcjT3Imbm5Y=
X-Received: by 2002:a05:6602:164a:b0:879:c4a1:1020 with SMTP id
 ca18e2360f4ac-879c4a1138amr581946839f.9.1752732670109; Wed, 16 Jul 2025
 23:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749810735.git.zhouquan@iscas.ac.cn> <20e116efb1f7aff211dd8e3cf8990c5521ed5f34.1749810735.git.zhouquan@iscas.ac.cn>
In-Reply-To: <20e116efb1f7aff211dd8e3cf8990c5521ed5f34.1749810735.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 11:40:58 +0530
X-Gm-Features: Ac12FXzV5Y-LW3CLzhO1n-a_ZnyRISIIMhwEfUeHXAPilMPIemTKisuILYRl6qQ
Message-ID: <CAAhSdy3yjCXHucCzQzXg2BUJM7aYrb2Fd0taJQw=AEnvfnsNAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Enable ring-based dirty memory tracking
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_231111_188857_929BCC8D 
X-CRM114-Status: GOOD (  23.90  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgNTowOOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gRW5h
YmxlIHJpbmctYmFzZWQgZGlydHkgbWVtb3J5IHRyYWNraW5nIG9uIHJpc2N2Ogo+Cj4gLSBFbmFi
bGUgQ09ORklHX0hBVkVfS1ZNX0RJUlRZX1JJTkdfQUNRX1JFTCBhcyByaXNjdiBpcyB3ZWFrbHkK
PiAgIG9yZGVyZWQuCj4gLSBTZXQgS1ZNX0RJUlRZX0xPR19QQUdFX09GRlNFVCBmb3IgdGhlIHJp
bmcgYnVmZmVyJ3MgcGh5c2ljYWwgcGFnZQo+ICAgb2Zmc2V0Lgo+IC0gQWRkIGEgY2hlY2sgdG8g
a3ZtX3ZjcHVfa3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMgZm9yIGNoZWNraW5nCj4gICB3
aGV0aGVyIHRoZSBkaXJ0eSByaW5nIGlzIHNvZnQgZnVsbC4KPgo+IFRvIGhhbmRsZSB2Q1BVIHJl
cXVlc3RzIHRoYXQgY2F1c2UgZXhpdHMgdG8gdXNlcnNwYWNlLCBtb2RpZmllZCB0aGUKPiBga3Zt
X3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHNgIHRvIHJldHVybiBhIHZhbHVlIChjdXJyZW50bHkg
b25seQo+IHJldHVybnMgMCBvciAxKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhv
dXF1YW5AaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNwoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgfCAgMiAr
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSArCj4gIGFyY2gvcmlz
Y3Yva3ZtL0tjb25maWcgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5j
ICAgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QK
PiBpbmRleCAxYmQyZDQyZTY0MjQuLjVkZTBmYmZlMmZjMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiBAQCAtODMxNiw3ICs4MzE2LDcgQEAgY29yZSBjcnlzdGFsIGNsb2NrIGZyZXF1ZW5j
eSwgaWYgYSBub24temVybyBDUFVJRCAweDE1IGlzIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Lgo+ICA3
LjM2IEtWTV9DQVBfRElSVFlfTE9HX1JJTkcvS1ZNX0NBUF9ESVJUWV9MT0dfUklOR19BQ1FfUkVM
Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPgo+IC06QXJjaGl0ZWN0dXJlczogeDg2LCBhcm02NAo+ICs6QXJjaGl0ZWN0dXJlczog
eDg2LCBhcm02NCwgcmlzY3YKPiAgOlR5cGU6IHZtCj4gIDpQYXJhbWV0ZXJzOiBhcmdzWzBdIC0g
c2l6ZSBvZiB0aGUgZGlydHkgbG9nIHJpbmcKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgK
PiBpbmRleCA1ZjU5ZmQyMjZjYzUuLmVmMjdkNDI4OWRhMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAjZGVmaW5lIF9fS1ZNX0hBVkVfSVJR
X0xJTkUKPgo+ICAjZGVmaW5lIEtWTV9DT0FMRVNDRURfTU1JT19QQUdFX09GRlNFVCAxCj4gKyNk
ZWZpbmUgS1ZNX0RJUlRZX0xPR19QQUdFX09GRlNFVCA2NAo+Cj4gICNkZWZpbmUgS1ZNX0lOVEVS
UlVQVF9TRVQgICAgICAtMVUKPiAgI2RlZmluZSBLVk1fSU5URVJSVVBUX1VOU0VUICAgIC0yVQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnIGIvYXJjaC9yaXNjdi9rdm0vS2Nv
bmZpZwo+IGluZGV4IDcwNGMyODk5MTk3ZS4uNWE2MjA5MWIwODA5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4gQEAg
LTI1LDYgKzI1LDcgQEAgY29uZmlnIEtWTQo+ICAgICAgICAgc2VsZWN0IEhBVkVfS1ZNX01TSQo+
ICAgICAgICAgc2VsZWN0IEhBVkVfS1ZNX1ZDUFVfQVNZTkNfSU9DVEwKPiAgICAgICAgIHNlbGVj
dCBIQVZFX0tWTV9SRUFET05MWV9NRU0KPiArICAgICAgIHNlbGVjdCBIQVZFX0tWTV9ESVJUWV9S
SU5HX0FDUV9SRUwKPiAgICAgICAgIHNlbGVjdCBLVk1fQ09NTU9OCj4gICAgICAgICBzZWxlY3Qg
S1ZNX0dFTkVSSUNfRElSVFlMT0dfUkVBRF9QUk9URUNUCj4gICAgICAgICBzZWxlY3QgS1ZNX0dF
TkVSSUNfSEFSRFdBUkVfRU5BQkxJTkcKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggZTBhMDFhZjQyNmZmLi4wNTAyMTI1
ZWZiMzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4gQEAgLTY5MCw3ICs2OTAsMTQgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICB9Cj4gIH0KPgo+IC1zdGF0aWMg
dm9pZCBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gKy8qKgo+ICsgKiBjaGVja192Y3B1X3JlcXVlc3RzIC0gY2hlY2sgYW5kIGhhbmRsZSBwZW5k
aW5nIHZDUFUgcmVxdWVzdHMKPiArICogQHZjcHU6ICAgICAgdGhlIFZDUFUgcG9pbnRlcgo+ICsg
Kgo+ICsgKiBSZXR1cm46IDEgaWYgd2Ugc2hvdWxkIGVudGVyIHRoZSBndWVzdAo+ICsgKiAgICAg
ICAgIDAgaWYgd2Ugc2hvdWxkIGV4aXQgdG8gdXNlcnNwYWNlCj4gKyAqLwo+ICtzdGF0aWMgaW50
IGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAg
ewo+ICAgICAgICAgc3RydWN0IHJjdXdhaXQgKndhaXQgPSBrdm1fYXJjaF92Y3B1X2dldF93YWl0
KHZjcHUpOwo+Cj4gQEAgLTczNSw3ICs3NDIsMTIgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X2No
ZWNrX3ZjcHVfcmVxdWVzdHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fY2hlY2tfcmVxdWVzdChLVk1fUkVRX1NURUFMX1VQREFURSwgdmNwdSkpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUo
dmNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2RpcnR5X3JpbmdfY2hlY2tfcmVx
dWVzdCh2Y3B1KSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGt2bV9yaXNj
dl91cGRhdGVfaHZpcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gQEAgLTkxNyw3ICs5MjksOSBA
QCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4g
ICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF91cGRhdGUodmNwdSk7Cj4KPiAt
ICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHModmNwdSk7Cj4gKyAg
ICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKHZjcHUpOwo+
ICsgICAgICAgICAgICAgICBpZiAocmV0IDw9IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4KPiAgICAgICAgICAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7Cj4KPiAtLQo+
IDIuMzQuMQo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
