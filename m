Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A67DC35FF1
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtcaWm6flGiCxXqjYkXSqBxlVIlxbwQRJTrwXIijCeg=; b=UXuibk2T2iyW6Z
	D0UYyRAtSXTGKsRk5btVcDFZSW09sPPniJH/MVmaR/+JbRdDb34v2KqRn8aA2yG0VBBwNyApukVVB
	lloYl+SH3t4K6qc3S5jXWrC3QSBg73K88kUM4IOge4xF+EbQU4DgVLfJn2fcu8azFFDY+hz6INtTf
	APKbIqNno8Wq/LL2oV4lDmIXUX4UlkIt65Q+IDAMyeMvobmBTdJPWMr35sVmIzLajIUJQv5j8IJuw
	VU/OWX7bWGYGhqIo5+ZwsmCXGrY3Oa/ZSBKNyfGwZ3jy05xHOmnhwMuEZieVeQGsFd5km7Nbz1vB7
	65NzWufYnBAMHjcffR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tun1o-000000088I2-0JKX;
	Wed, 19 Mar 2025 06:35:48 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tun1B-000000088Ci-0xxK
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 06:35:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5497e7bf2e0so7369588e87.3
        for <kvm-riscv@lists.infradead.org>; Tue, 18 Mar 2025 23:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742366107; x=1742970907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRcMBAnBB1cdPSStkQP8KD4Ik0+X3f5WUJpWyEcmszQ=;
        b=kqt3mdgaxKhBp2P0c+x3OEEPtZfbu1gMon0gLZTaGD9kOQlgkf1syyd6D/kkgzt3yM
         iYVLtV9bsa9EoENaEb70nnp4TZdc0C3AczXifmTll2wGhTLokH39Dx1PsGn7TAwCCzNL
         qTK+TnGpTCVU1q7vwJ90nz5LQW0q/kThHu/u9IYWlUI35wADK+0DyyQKkKp+S7zWRMib
         uCsLUwV9yyr/6KAn6EOUQ8m70WsDLSGMW1QNDUUsyrksGYKsbiyR99SGUCmHQv8i5c3T
         ZCJN1ICnNopKnpxNESTrQxb84XGiMxGyN2crwnp4wLQLE/Gjw6n+OuWy4QjOyyNXsEWh
         lM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742366107; x=1742970907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRcMBAnBB1cdPSStkQP8KD4Ik0+X3f5WUJpWyEcmszQ=;
        b=l2/1x3R8DWRnDYFU5IWMoGkgFmtECJxtLeXqwQXoLBOHp/MufrPozStM+mica7IMED
         pRp9kvlsw0sR431ZJPjNPzVudwv63HSbIdfhd0IIrI36cNuR+smke9hioxYT6pKrFw9h
         ohj8MFwtXzrTC2zbkFIR5bSUalbafIUE9un+Ad0IjWQd+eSeJhbdhvSLvAux68bZR/+P
         e0bezd0qP4Gff3oX9Q+sWfACckxH2CrJ2FDJTSL5mgkcLBA5d5QPfIEM73DfWxifLAIz
         cworqHNRSzIylGGqhlnCHCnYMCms+79HDUBq5jpltDLQSXAaGvA+AZTS7WyjMk2kxUBA
         qu5A==
X-Forwarded-Encrypted: i=1; AJvYcCVOa+/EFDZ14PwM0rg6Ss/OmF3z2szU2Rug4LHKgNTFH/P9oV3hXG2fnoACUGpmqMD2YaZV5woAqSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVXheAy1kKsSBe3FSD27H1xHSq/3PRAZpCE/FzjBlqpFDFapvl
	uPbgY3I1eAkzpPWWL7cwARWtvWzG5YQoNDpBSuWJhIdkFpO+KZh4xXx+ThTCsgyXx4M+D3rMj6J
	m8bOKi1pQb2g3V6Ei++wPJ/YMPdvS1kARRvLmgg==
X-Gm-Gg: ASbGncsik/Oq3WgulG4OO6UwrPoPFc6Q3ppaNXTwfTafxb2hTOAcqRoqIM1PtON3DvO
	OKzGQQX/KGQy1tKU1S3a9snYhApKCcI9NNSQhWix/qrzGB1Pv3DKnOYP00yxpP9EcBAwtgUIJCH
	L1WIlPvGgDcORkWFyMyomCMS//0ZU=
X-Google-Smtp-Source: AGHT+IG2DF9ysJOnGisWYlJRKJjNI7goJzS2EHde/phn2/2Rqicusog58ZNjwKuNH+aDT8iIlFKP1DPR1Tk9Qcbg6iY=
X-Received: by 2002:a05:6512:2c89:b0:54a:cc09:eacc with SMTP id
 2adb3069b0e04-54acc09ebcemr366625e87.39.1742366106954; Tue, 18 Mar 2025
 23:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
In-Reply-To: <20250317-kvm_exit_fix-v1-1-aa5240c5dbd2@rivosinc.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 19 Mar 2025 12:04:55 +0530
X-Gm-Features: AQ5f1JqvoOcfbMQnETX7LXFFQmbgXKx4mcvkbI8cra0TF1szaF4KZK20bqrxCC4
Message-ID: <CAK9=C2XzuUO3NiKOwwa+Xyh+j7XUtHNBb=YCbe49kHHJY0Ke8Q@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Teardown riscv specific bits after kvm_exit
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_233509_291982_7708100A 
X-CRM114-Status: GOOD (  17.26  )
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

T24gTW9uLCBNYXIgMTcsIDIwMjUgYXQgMToxMeKAr1BNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IER1cmluZyBhIG1vZHVsZSByZW1vdmFsLCBrdm1fZXhpdCBp
bnZva2VzIGFyY2ggc3BlY2lmaWMgZGlzYWJsZQo+IGNhbGwgd2hpY2ggZGlzYWJsZXMgQUlBLiBI
b3dldmVyLCB3ZSBpbnZva2UgYWlhX2V4aXQgYmVmb3JlIGt2bV9leGl0Cj4gcmVzdWx0aW5nIGlu
IHRoZSBmb2xsb3dpbmcgd2FybmluZy4gS1ZNIGtlcm5lbCBtb2R1bGUgY2FuJ3QgYmUgaW5zZXJ0
ZWQKPiBhZnRlcndhcmRzIGR1ZSB0byBpbmNvbnNpc3RlbnQgc3RhdGUgb2YgSVJRLgo+Cj4gWzI1
NDY5LjAzMTM4OV0gcGVyY3B1IElSUSAzMSBzdGlsbCBlbmFibGVkIG9uIENQVTAhCj4gWzI1NDY5
LjAzMTczMl0gV0FSTklORzogQ1BVOiAzIFBJRDogOTQzIGF0IGtlcm5lbC9pcnEvbWFuYWdlLmM6
MjQ3NiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4gWzI1NDY5LjAzMTgwNF0gTW9kdWxl
cyBsaW5rZWQgaW46IGt2bSgtKQo+IFsyNTQ2OS4wMzE4NDhdIENQVTogMyBVSUQ6IDAgUElEOiA5
NDMgQ29tbTogcm1tb2QgTm90IHRhaW50ZWQgNi4xNC4wLXJjNS0wNjk0Ny1nOTFjNzYzMTE4ZjQ3
LWRpcnR5ICMyCj4gWzI1NDY5LjAzMTkwNV0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFl
bXUgKERUKQo+IFsyNTQ2OS4wMzE5MjhdIGVwYyA6IF9fZnJlZV9wZXJjcHVfaXJxKzB4YTIvMHgx
NTAKPiBbMjU0NjkuMDMxOTc2XSAgcmEgOiBfX2ZyZWVfcGVyY3B1X2lycSsweGEyLzB4MTUwCj4g
WzI1NDY5LjAzMjE5N10gZXBjIDogZmZmZmZmZmY4MDA3ZGIxZSByYSA6IGZmZmZmZmZmODAwN2Ri
MWUgc3AgOiBmZjIwMDAwMDAwODhiZDUwCj4gWzI1NDY5LjAzMjI0MV0gIGdwIDogZmZmZmZmZmY4
MTMxY2VmOCB0cCA6IGZmNjAwMDAwODBiOTY0MDAgdDAgOiBmZjIwMDAwMDAwODhiYWY4Cj4gWzI1
NDY5LjAzMjI4NV0gIHQxIDogZmZmZmZmZmZmZmZmZmZmYyB0MiA6IDUyNDkyMDc1NzA2MzcyNjUg
czAgOiBmZjIwMDAwMDAwODhiZDkwCj4gWzI1NDY5LjAzMjMyOV0gIHMxIDogZmY2MDAwMDA5OGIy
MTA4MCBhMCA6IDAzN2Q1MjdhMTVlYjRmMDAgYTEgOiAwMzdkNTI3YTE1ZWI0ZjAwCj4gWzI1NDY5
LjAzMjM3Ml0gIGEyIDogMDAwMDAwMDAwMDAwMDAyMyBhMyA6IDAwMDAwMDAwMDAwMDAwMDEgYTQg
OiBmZmZmZmZmZjgxMjJkYmY4Cj4gWzI1NDY5LjAzMjQxMF0gIGE1IDogMDAwMDAwMDAwMDAwMGZm
ZiBhNiA6IDAwMDAwMDAwMDAwMDAwMDAgYTcgOiBmZmZmZmZmZjgxMjJkYzEwCj4gWzI1NDY5LjAz
MjQ0OF0gIHMyIDogZmY2MDAwMDA4MGMyMmViMCBzMyA6IDAwMDAwMDAyMDAwMDAwMjIgczQgOiAw
MDAwMDAwMDAwMDAwMDFmCj4gWzI1NDY5LjAzMjQ4OF0gIHM1IDogZmY2MDAwMDA4MGMyMmUwMCBz
NiA6IGZmZmZmZmZmODBjMzUxYzAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWzI1NDY5LjAzMjU4
Ml0gIHM4IDogMDAwMDAwMDAwMDAwMDAwMyBzOSA6IDAwMDA1NTU1NmI3ZmI0OTAgczEwOiAwMDAw
N2ZmZmYwZTEyZmEwCj4gWzI1NDY5LjAzMjYyMV0gIHMxMTogMDAwMDdmZmZmMGUxM2U5YSB0MyA6
IGZmZmZmZmZmODEzNTRhYzcgdDQgOiBmZmZmZmZmZjgxMzU0YWM3Cj4gWzI1NDY5LjAzMjY2NF0g
IHQ1IDogZmZmZmZmZmY4MTM1NGFjOCB0NiA6IGZmZmZmZmZmODEzNTRhYzcKPiBbMjU0NjkuMDMy
Njk4XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogZmZmZmZmZmY4MDA3ZGIxZSBj
YXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+IFsyNTQ2OS4wMzI3MzhdIFs8ZmZmZmZmZmY4MDA3ZGIx
ZT5dIF9fZnJlZV9wZXJjcHVfaXJxKzB4YTIvMHgxNTAKPiBbMjU0NjkuMDMyNzk3XSBbPGZmZmZm
ZmZmODAwN2RiZmM+XSBmcmVlX3BlcmNwdV9pcnErMHgzMC8weDVlCj4gWzI1NDY5LjAzMjg1Nl0g
WzxmZmZmZmZmZjAxM2E1N2RjPl0ga3ZtX3Jpc2N2X2FpYV9leGl0KzB4NDAvMHg0MiBba3ZtXQo+
IFsyNTQ2OS4wMzM5NDddIFs8ZmZmZmZmZmYwMTNiNGU4Mj5dIGNsZWFudXBfbW9kdWxlKzB4MTAv
MHgzMiBba3ZtXQo+IFsyNTQ2OS4wMzUzMDBdIFs8ZmZmZmZmZmY4MDA5YjE1MD5dIF9fcmlzY3Zf
c3lzX2RlbGV0ZV9tb2R1bGUrMHgxOGUvMHgxZmMKPiBbMjU0NjkuMDM1Mzc0XSBbPGZmZmZmZmZm
ODAwMGMxY2E+XSBzeXNjYWxsX2hhbmRsZXIrMHgzYS8weDQ2Cj4gWzI1NDY5LjAzNTQ1Nl0gWzxm
ZmZmZmZmZjgwOWVjOWE0Pl0gZG9fdHJhcF9lY2FsbF91KzB4NzIvMHgxMzQKPiBbMjU0NjkuMDM1
NTM2XSBbPGZmZmZmZmZmODA5ZjVlMTg+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTQ4LzB4MTU2Cj4K
PiBJbnZva2UgYWlhX2V4aXQgYW5kIG90aGVyIGFyY2ggc3BlY2lmaWMgY2xlYW51cCBmdW5jdGlv
bnMgYWZ0ZXIga3ZtX2V4aXQKPiBzbyB0aGF0IGRpc2FibGUgZ2V0cyBhIGNoYW5jZSB0byBiZSBj
YWxsZWQgZmlyc3QgYmVmb3JlIGV4aXQuCj4KPiBGaXhlczogNTRlNDMzMjBjMmJhICgiUklTQy1W
OiBLVk06IEluaXRpYWwgc2tlbGV0YWwgc3VwcG9ydCBmb3IgQUlBIikKClRoZSBrdm1fcmlzY3Zf
dHJlYWRvd24oKSB3YXMgaW50cm9kdWNlZCBieSBzb21lIG90aGVyIGNvbW1pdCBzbwp3ZSBzaG91
bGQgaW5jbHVkZSBhIHNlY29uZCBGaXhlcyB0YWcgd2hpY2ggaXM6CgpGaXhlczogZWRlZDY3NTRm
Mzk4ICgicmlzY3Y6IEtWTTogYWRkIGJhc2ljIHN1cHBvcnQgZm9yIGhvc3QgdnMgZ3Vlc3QKcHJv
ZmlsaW5nIikKCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KCk90aGVyd2lzZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2t2bS9tYWluLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
YWluLmMgYi9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiBpbmRleCAxZmE4YmU1ZWU1MDkuLjRiMjQ3
MDVkYzYzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tYWluLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS9tYWluLmMKPiBAQCAtMTcyLDggKzE3Miw4IEBAIG1vZHVsZV9pbml0KHJpc2N2
X2t2bV9pbml0KTsKPgo+ICBzdGF0aWMgdm9pZCBfX2V4aXQgcmlzY3Zfa3ZtX2V4aXQodm9pZCkK
PiAgewo+IC0gICAgICAga3ZtX3Jpc2N2X3RlYXJkb3duKCk7Cj4gLQo+ICAgICAgICAga3ZtX2V4
aXQoKTsKPiArCj4gKyAgICAgICBrdm1fcmlzY3ZfdGVhcmRvd24oKTsKPiAgfQo+ICBtb2R1bGVf
ZXhpdChyaXNjdl9rdm1fZXhpdCk7Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogNDcwMWYzM2ExMDcw
MmQ1ZmM1NzdjMzI0MzRlYjYyYWRkZTBhMWFlMQo+IGNoYW5nZS1pZDogMjAyNTAzMTYta3ZtX2V4
aXRfZml4LTc3Y2QwNjMyZDc0MAo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaCBwYXRyYQo+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
