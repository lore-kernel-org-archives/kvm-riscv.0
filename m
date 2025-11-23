Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA5CFA46B
	for <kvm-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF9pdeJwPxkKSUxXD/8HSXv5UN8Ag7yPf74IeuGvcq8=; b=omAyFoyKwPyYij
	B/Y+ciX2eYeR+XaMqXNISwyebSOezUU8lammUlQ5JgHxsVqpTmuiqfQX85+3In/SMjFDpx9sz1lXI
	pwWFpHF8A7UF5DY2mS9VjYnEY8J8BL3EVwhwbylG/tBPSJ+SJKjj3pRer2UB4vgC24pVu6vR6ua2A
	gWP2PmkHwxmHHfdYeuqYcOk06cAqkxdo0i2Nzo477muNlYz4+cd4Ahr/artbwL8qNgazjyw9LPMUs
	e4jO+xfpeqDBbV09rfWXemCt2r9s21uX3gDgehUV0/vcAxnv3bXfDcZhssa/oX3eNSzqKBLQ4Pwaw
	HcOwqwuI06GRWmSAziDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN2Z5-0000000A9Xn-1VsV;
	Sun, 23 Nov 2025 05:23:11 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN2Yv-0000000A9WW-2dg8
	for kvm-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 05:23:10 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-4337076ae3fso15340725ab.1
        for <kvm-riscv@lists.infradead.org>; Sat, 22 Nov 2025 21:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1763875379; x=1764480179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M+bsitxdcyHBcSA8b07GYs4Cob261gapfpxGSvBT4Q=;
        b=BKuDdf4hMdUEG6wKkdXvWE8KxgB/KWhQcv4z8n0XCSd4lYhhPLQfmwhCjhYyWu5gcO
         4JlzBGh48+1OtzZUc8Pzy4MlI17YngCRcOWp3ihREAcbxq/7MWy3znL2eilHydam1Q7X
         HZ3hGpWkFPDipN0px6187rPmt93hWPn2stbLZztICPfB/uZvqkMS677Mxf+UYOMnkG2a
         JuvnJOompD3mCxrd8IJqmlXWjoG+EX+rL/V5GtOvLO/yvjqsjSqsU4+xxtaMgBmeUVKv
         +sBjVqkCAksaqbPUYRUDWAW24ngdX1YNJilclbWhTyPkZrXv/rtUryhaDaNqT3liQsKH
         ltuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763875379; x=1764480179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9M+bsitxdcyHBcSA8b07GYs4Cob261gapfpxGSvBT4Q=;
        b=DaHUFPn/nYawbfw0aB6MX17fjdZttAXZH3etWGh0+ePI5+hP6YxPTV88uSkN5PCurm
         l7GH2YWvN4/kkB30k8cQp2LFi0ClNnUqurhq4f4xzp8a/y4j1L3EQ5tCt6RCS3t22n/K
         jXOM/d6upGsS/AZRDYjv8Q91morALTxXGCTSUnVOSaQy2HeNmULKADzVOD2iwTZFLMfn
         wn+dzc2ubLmZslq/McZzGxZJ6tudlyElOEW+3UUvxGTWM9TyWGwsNPRc7FUm0ugq0ATy
         eTV4HtFBwjZXDcIIwiw4PlviqAcyro+Q0h1ot0t6j6BdmXCyY/S3O/KZaa4MCDjUFkKU
         5UkA==
X-Forwarded-Encrypted: i=1; AJvYcCV8hknMFhQOThugpp0c9VDvdJLRR7e4B6+zOOm60eFk3tDjv3L/V3qUihY1xSMnjsaNQI9puGCTo+I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvgjq46HFleyRKULb5Th67+Bsyo7yw6ooM2J8ZkHPe9nQkZF7a
	HnJb6qJAWAbdR+9OeSogUqG9V/rezptwq8DX+bvuq6LArsKL3teVhZRUiRaBsJmRcIUgd9C8RKc
	CdDU1sVmxIKuaXs3YkgkmfW9zSphQXnJyFG/avuIWdw==
X-Gm-Gg: ASbGncso8pZ3Hu9qhGv1QLRjTbBhtd91NSKRdFo60Do0XlFMYagTRKtR0QkQX8Zjbfp
	kzU13yVztbbHlduw58aowkgT4fJ+MSe0vpyVdmpSd0lA1/weODtnO4ZkWRnZmjjOACMuPZt93v1
	4tOdt7bHJP4rLzJxJJ2skgvljwblTXNMkLq92ZbouQys8y739mzej7yVbK/FdN7i92NJF2KLjZr
	/qlJTYi5m5SuH98m5y3WAVWDV70hYE9JxxD3t36QeV3ikpRgJhZIRLsSbP9pWPAETQvJ3x8q+ak
	3n7CLj8bLvAxF5Qr5nEKVqARU85S+Q==
X-Google-Smtp-Source: AGHT+IEeM18++lwaiORFJZl8Hjs+peRhie1yZlJt5sthIKBDB3m3u408rffnRcPQtJ+QKEExmaV3WTWoC+TcPLmKbAA=
X-Received: by 2002:a05:6e02:3f09:b0:433:7826:2b69 with SMTP id
 e9e14a558f8ab-435b8e4fcb7mr70415215ab.11.1763875379029; Sat, 22 Nov 2025
 21:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Nov 2025 10:52:46 +0530
X-Gm-Features: AWmQ_bmj4zuHx-QBwVeyguW577J_Oqmu-RcG3kza0f4RZhq14OWm6aCQT2gQVtM
Message-ID: <CAAhSdy2Y=qk27Khy+fzOCidop7+tNqoDb0CFwAJ_p090NV46vQ@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Fix guest page fault within HLV* instructions
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_212302_012907_B6AF3361 
X-CRM114-Status: GOOD (  22.11  )
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

T24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgNzowNuKAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBITFYqIGluc3RydWN0aW9ucyBhdCB0aGUgSFMgbW9k
ZSwgYSBndWVzdCBwYWdlIGZhdWx0Cj4gbWF5IG9jY3VyIHdoZW4gYSBnLXN0YWdlIHBhZ2UgdGFi
bGUgbWlncmF0aW9uIGJldHdlZW4gdHJpZ2dlcmluZyB0aGUKPiB2aXJ0dWFsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiBhbmQgZXhlY3V0aW5nIHRoZSBITFYqIGluc3RydWN0aW9uLgo+Cj4gVGhpcyBt
YXkgYmUgYSBjb3JuZXIgY2FzZSwgYW5kIG9uZSBzaW1wbGVyIHdheSB0byBoYW5kbGUgdGhpcyBp
cyB0bwo+IHJlLWV4ZWN1dGUgdGhlIGluc3RydWN0aW9uIHdoZXJlIHRoZSB2aXJ0dWFsICBpbnN0
cnVjdGlvbiBleGNlcHRpb24KPiBvY2N1cnJlZCwgYW5kIHRoZSBndWVzdCBwYWdlIGZhdWx0IHdp
bGwgYmUgYXV0b21hdGljYWxseSBoYW5kbGVkLgo+Cj4gRml4ZXM6IGI5MWYwZTRjYjhhMyAoIlJJ
U0MtVjogS1ZNOiBGYWN0b3Itb3V0IGluc3RydWN0aW9uIGVtdWxhdGlvbiBpbnRvIHNlcGFyYXRl
IHNvdXJjZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMTkKClJlZ2FyZHMsCkFudXAK
Cj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYzOgo+IC0gQWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIGF2
b2lkIHJlcGVhdGluZyB0aGUgc2FtZSBwYXJhZ3JhcGgoc3VnZ2VzdGVkIGJ5IGRyZXcpCj4gLSBM
aW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MTExMTEz
NTUwNi44NTI2LTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+Cj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIFJlbW92ZSB1bm5lY2Vzc2FyeSBtb2RpZmljYXRpb25zIGFuZCBhZGQgY29tbWVudHMo
c3VnZ2VzdGVkIGJ5IEFudXApCj4gLSBVcGRhdGUgRml4ZXMgdGFnCj4gLSBMaW5rIHRvIHYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDkxMjEzNDMzMi4yMjA1My0x
LWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNw
dV9pbnNuLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNu
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IGluZGV4IGRlMWY5NmVhNjIyNS4uNGQ4
OWI5NDEyOGFlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBAQCAtMjk4LDYgKzI5OCwyMiBAQCBzdGF0
aWMgaW50IHN5c3RlbV9vcGNvZGVfaW5zbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBr
dm1fcnVuICpydW4sCj4gICAgICAgICByZXR1cm4gKHJjIDw9IDApID8gcmMgOiAxOwo+ICB9Cj4K
PiArc3RhdGljIGJvb2wgaXNfbG9hZF9ndWVzdF9wYWdlX2ZhdWx0KHVuc2lnbmVkIGxvbmcgc2Nh
dXNlKQo+ICt7Cj4gKyAgICAgICAvKioKPiArICAgICAgICAqIElmIGEgZy1zdGFnZSBwYWdlIGZh
dWx0IG9jY3VycywgdGhlIGRpcmVjdCBhcHByb2FjaAo+ICsgICAgICAgICogaXMgdG8gbGV0IHRo
ZSBnLXN0YWdlIHBhZ2UgZmF1bHQgaGFuZGxlciBoYW5kbGUgaXQKPiArICAgICAgICAqIG5hdHVy
YWxseSwgaG93ZXZlciwgY2FsbGluZyB0aGUgZy1zdGFnZSBwYWdlIGZhdWx0Cj4gKyAgICAgICAg
KiBoYW5kbGVyIGhlcmUgc2VlbXMgcmF0aGVyIHN0cmFuZ2UuCj4gKyAgICAgICAgKiBDb25zaWRl
cmluZyB0aGlzIGlzIGEgY29ybmVyIGNhc2UsIHdlIGNhbiBkaXJlY3RseQo+ICsgICAgICAgICog
cmV0dXJuIHRvIHRoZSBndWVzdCBhbmQgcmUtZXhlY3V0ZSB0aGUgc2FtZSBQQywgdGhpcwo+ICsg
ICAgICAgICogd2lsbCB0cmlnZ2VyIGEgZy1zdGFnZSBwYWdlIGZhdWx0IGFnYWluIGFuZCB0aGVu
IHRoZQo+ICsgICAgICAgICogcmVndWxhciBnLXN0YWdlIHBhZ2UgZmF1bHQgaGFuZGxlciB3aWxs
IHBvcHVsYXRlCj4gKyAgICAgICAgKiBnLXN0YWdlIHBhZ2UgdGFibGUuCj4gKyAgICAgICAgKi8K
PiArICAgICAgIHJldHVybiAoc2NhdXNlID09IEVYQ19MT0FEX0dVRVNUX1BBR0VfRkFVTFQpOwo+
ICt9Cj4gKwo+ICAvKioKPiAgICoga3ZtX3Jpc2N2X3ZjcHVfdmlydHVhbF9pbnNuIC0tIEhhbmRs
ZSB2aXJ0dWFsIGluc3RydWN0aW9uIHRyYXAKPiAgICoKPiBAQCAtMzIzLDYgKzMzOSw4IEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjdC0+c2VwYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnV0cmFwKTsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAodXRyYXAuc2NhdXNlKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAoaXNfbG9hZF9ndWVzdF9wYWdlX2ZhdWx0KHV0cmFwLnNjYXVzZSkpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdXRyYXAuc2VwYyA9IGN0LT5zZXBjOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCh2Y3B1
LCAmdXRyYXApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4g
QEAgLTM3OCw2ICszOTYsOCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19sb2FkKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAgICAgaW5z
biA9IGt2bV9yaXNjdl92Y3B1X3VucHJpdl9yZWFkKHZjcHUsIHRydWUsIGN0LT5zZXBjLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnV0cmFwKTsK
PiAgICAgICAgICAgICAgICAgaWYgKHV0cmFwLnNjYXVzZSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChpc19sb2FkX2d1ZXN0X3BhZ2VfZmF1bHQodXRyYXAuc2NhdXNlKSkKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAxOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIC8qIFJlZGlyZWN0IHRyYXAgaWYgd2UgZmFpbGVkIHRvIHJlYWQgaW5zdHJ1Y3Rpb24g
Ki8KPiAgICAgICAgICAgICAgICAgICAgICAgICB1dHJhcC5zZXBjID0gY3QtPnNlcGM7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCh2Y3B1LCAm
dXRyYXApOwo+IEBAIC01MDQsNiArNTI0LDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X21taW9fc3Rv
cmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAg
ICAgICAgICBpbnNuID0ga3ZtX3Jpc2N2X3ZjcHVfdW5wcml2X3JlYWQodmNwdSwgdHJ1ZSwgY3Qt
PnNlcGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmdXRyYXApOwo+ICAgICAgICAgICAgICAgICBpZiAodXRyYXAuc2NhdXNlKSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGlzX2xvYWRfZ3Vlc3RfcGFnZV9mYXVsdCh1dHJhcC5zY2F1
c2UpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgLyogUmVkaXJlY3QgdHJhcCBpZiB3ZSBmYWlsZWQgdG8gcmVhZCBp
bnN0cnVjdGlvbiAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHV0cmFwLnNlcGMgPSBjdC0+
c2VwYzsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGly
ZWN0KHZjcHUsICZ1dHJhcCk7Cj4gLS0KPiAyLjUwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
