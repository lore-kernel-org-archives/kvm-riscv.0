Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C64FAC5516F
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1lb+RCtsx4GfiiGwjQrxgltXguZfkZV2cqVqtzMfhE=; b=2R+DTdG6F0vWpP
	g6gTuR+nObJH7kc0nwZv1XCaovOZ3IEbRD/C7KWiilRWc+C82urNF5H7QigHEJVhiKNqbWku1wW0B
	Y6wqAfw6MiK50PhGwo/jmCKUn+ZEFADW08M4YaVedylJzRJ1NSKcYQSH5gfcfxGWP6IIGY99YtNQ8
	c97kErh8ZV1tJvG7MJKlTYySNoDBdTqrBZ/Ps4DofnMVfDb9MGZTm2vplS2CYuEiJQRdALqBR2vJX
	ov5jQoTcgXmczD45VyTSo/sq4vpeSQflopEC8gUifZdB3Mg10VyB8dEMAI57YV/s56oNJmPfXxjOn
	Cn+cQY/VDO5CN6GZHwOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5S2-0000000E5eD-1PfK;
	Sat, 01 Aug 2026 08:52:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5S0-0000000E5dK-1QgM
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:52:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so16509091fa.2
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785574330; cv=none;
        d=google.com; s=arc-20260327;
        b=BRGQ99Ef76AVhnZhVaKuVnKmakILPdFrUGMSgfKc9ml338qdoNWh+sLsiiTrni3hqF
         s15x11G1zCnLR0RvyYu5eKJT9kecLx5a/72ZfgW93iWpYrk8JDfkL7GElrRCupeCh4qE
         QDaFyLno34IbcWNi6Tpn45pPqS5e0OsizribsZl9/B75rzTuqnYxisYm/I/NnxRI4FzJ
         9FXI95ByEyaPzxetJfUDSIIAki8i3y7S7JjMi/6LSiqxyHZCfRYsChpSDFNeJ5qUyPDe
         nZCC8WyoSKZOPzkNEIXJ7Af6TwpHssYAzqiRas44Yfbk8x6CNfEHoewXK7LO+EEtrbn6
         XJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OolFLJ3qIJliRKXCQGXygUbNJuKJwRQO7ZGmC2zl2Cg=;
        fh=RY08N8y7M+bMu8NdANmSDdqhy+MxTCrpmIivDEu4fRw=;
        b=bBQQmRM1iXONqmn15sBf1+lwW6zXI9Hdr6dLBS0QxRXiPEq/OhCCtx5u5IIFDOF9GM
         4nrVWegxtb2KkB/9oMj3ydwe2/tavncMLjycQsll/v1gXoyL8IzlDsqUztXF1WZSVY0V
         1WPF6HFoF13bNYeK0fZW0QMx7B9wZh933sEMQXjE0RvhfMUZF+j3p2gdhoBr/YPpfJ84
         nHC0t7/Dy7UQmWRV39YXB9NuAyWpmOboYRCUc60Z01wcxxR7sjA8fxQOJUu8o0H0MNIW
         xT4v45fMaCNu7eQluP486JoeZKoGQ8ph5TqL2dP7gpZ4A/j+zZW04xbBwAXVsWsvF8aZ
         UPRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785574330; x=1786179130; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OolFLJ3qIJliRKXCQGXygUbNJuKJwRQO7ZGmC2zl2Cg=;
        b=up/MuFApZ0envuqzrNi58ArhfqB3/aTJYTRH+dM4zXXxKgw/425kCQthBSL5hJz3s/
         V0MTfg7XrRBQg+B5AzvxV06HFl4CbaFv3DswwVnDakwJyZ/3Dup3Qkh4DX+hmpDHLsT6
         vzLbpvs3uZsMKBM+hBtdWQCw4BtJ5ZmDWSiTMJfz5SXKTfUrYASLaE6lulkVj3hTF7ue
         4bQHs1/K2Zsioa+iYl6CWYKKFya1giPrrmVK9EkxEzRHQ98YHo1Th2MBwoMJ76oZd2M0
         3WINwJalZW5iU2nxGFMxeBP9iaSZUImKQbOzmv9JbGYtlciQdBBxBtJSMBRhcBWekTj1
         BvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785574330; x=1786179130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OolFLJ3qIJliRKXCQGXygUbNJuKJwRQO7ZGmC2zl2Cg=;
        b=dRGqmbhYdNpiYstFTpSNn4SUWVF10GxAkKpgog+LSP5ABYWbm1II6ks6W/B5D7ybaJ
         wGO/3Froev+zSWReWP0ogWNOE696t0c+vJGIAIDU5tmzy4wU4b6he3IV9EysiE2g5Uq8
         YdU0H/5ii7nzRisW4QIYnwPZvylzO3jVf0ATwsHZiwyHQqLav4ZQZzsRaq1y+uL6GZqH
         zyxzZIQGQmj4ICXUEYg2DjNmdAZyq9z7T8/3gY3wuweLSVBVQl7AsHDLU3zL2QTT4Vu8
         LhAEqElXyxn9IzFEtEkR5G1qaULT4sBLpjr3kFYSb91WJ4cG/21QgsRdII6jX7pOJXdj
         2hfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqINifrQVXFMNdl5pFxFoQjKG54ivvVTXg2643jtEvQl+MFn31h47APNiV9NKGWYpLphpqN5F2qbvU=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywen4lz7EuiV7QIkzysu1pFB5S10PaR96tPLNKdJrpULbWzRjlw
	z+Hx6Clr7VzFYRL4s+Tu6iQnk+jMSOiAEdBnJYtnzmtphviliLloH0SWsZMni7+rH0vSUTdalI0
	HZ0+76Rf0J87v5cOOdL0RxuHe/A3WlEsbt+X/CSuF1g==
X-Gm-Gg: AR+sD12UFT65fC8xPqMV2NAm0nx/5TsIAfYiCpxuI8L1V7uL+Av9f965a5+OVQIgR2E
	xsLt/HeLb0VekRdNsSQ/i/18bpspz9pQQRZuzOAyNFnAo82PxwfesIGmH3FMDFFMajyrK/rbUqq
	c1AklF9CUGsedmOW/kDPhVITzE757ArxfMaIS6dfcZLAS+UFKMjboF6EE/G2hftTXPaephZGpaQ
	6X+mkAZoGg4hkvCPa9q5azyxYC9Fbo7KWLQdBIjU9wVJ7XqM+3M3JfXS0pwT6Urxv3g9BXI2ttD
	eUz+CAZ45ZSnEOK1zwB4OamD7WqoqTMYsN9jtB2JSmJsjg2Qr5Lsd6I9NP7OtGq+R+BeSFtdIqY
	KfC2d5OCpqtTTCu6BcvuK0VB+GjxcvbM2H/FkSKCfk99IAhNaHr0oozImmvwsspTg
X-Received: by 2002:ac2:5a45:0:b0:5b0:1433:13b9 with SMTP id
 2adb3069b0e04-5b2e4f34619mr363739e87.25.1785574330267; Sat, 01 Aug 2026
 01:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260716064112.2387938-1-yhchen312@gmail.com>
In-Reply-To: <20260716064112.2387938-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:21:58 +0530
X-Gm-Features: AUfX_mzX7yVO0_wbnjUcTQveTiyE93ynqUCnT2aQAUQJKGgBPynLlffjyXq5axI
Message-ID: <CAAhSdy1JJxRsAGxKbOwy38rorCuiVkjp4QD8KCBS4Pc-7zea5g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Account VM-scoped allocations to the VM cgroup
To: yhchen312@gmail.com
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_015212_417254_DC2D6413 
X-CRM114-Status: GOOD (  15.47  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTI6MTHigK9QTSA8eWhjaGVuMzEyQGdtYWlsLmNvbT4g
d3JvdGU6Cj4KPiBGcm9tOiAiWXVoYW5nLmNoZW4iIDx5aGNoZW4zMTJAZ21haWwuY29tPgo+Cj4g
Q2hhcmdlIHRoZSBwZXItVk0gYW5kIHBlci12Q1BVIGFsbG9jYXRpb25zIChzdGFnZS0yIFBHRCwg
QVBMSUMgc3RhdGUsCj4gSU1TSUMgY29udGV4dCwgdmVjdG9yIGNvbnRleHQsIEZXRlQgY29uZmln
LCBQTVUgc25hcHNob3QpIHRvIHRoZQo+IGFsbG9jYXRpbmcgcHJvY2VzcydzIG1lbW9yeSBjZ3Jv
dXAgdmlhIEdGUF9LRVJORUxfQUNDT1VOVCAvIF9fR0ZQX0FDQ09VTlQuCj4gUGVyLUNQVSBtb2R1
bGUtaW5pdCBhbGxvY2F0aW9ucyBhbmQgdHJhbnNpZW50IHNjcmF0Y2ggYnVmZmVycyBhcmUgbGVm
dAo+IHVuYWNjb3VudGVkLgo+Cj4gTWVhc3VyZWQgcmVzdWx0cyAoS1ZNIGd1ZXN0IHJ1biBpbiBh
IG1lbW9yeSBjZ3JvdXA7IFZNIGNncm91cAo+IG1lbW9yeS5jdXJyZW50IGFmdGVyIGd1ZXN0IGJv
b3QpOgo+Cj4gICBWTSBjZ3JvdXAgbWVtb3J5LmN1cnJlbnQgICAgMTA0NDQ4MCBieXRlcwo+Cj4g
QXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzpkZWVwc2Vlay12NC1wcm8KPiBDby1kZXZlbG9wZWQtYnk6
IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBa
aG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBZdWhhbmcuY2hlbiA8
eWhjaGVuMzEyQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5r
cywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgICAgIHwgMyArKy0K
PiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgICAgIHwgNCArKy0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL21tdS5jICAgICAgICAgICB8IDQgKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
ICAgICAgfCAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8IDIgKy0KPiAg
YXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyAgIHwgNCArKy0tCj4gIDYgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS9haWFfYXBsaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4gaW5k
ZXggNzQ4MTA3YzM0N2Q5Li5iZTkwMmVhNjQ4MGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vYWlhX2FwbGljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IEBAIC01
ODEsNyArNTgxLDggQEAgaW50IGt2bV9yaXNjdl9haWFfYXBsaWNfaW5pdChzdHJ1Y3Qga3ZtICpr
dm0pCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAgICAvKiBBbGxvY2F0ZSBB
UExJQyBnbG9iYWwgc3RhdGUgKi8KPiAtICAgICAgIGFwbGljID0ga3phbGxvY19mbGV4KCphcGxp
YywgaXJxcywga3ZtLT5hcmNoLmFpYS5ucl9zb3VyY2VzICsgMSk7Cj4gKyAgICAgICBhcGxpYyA9
IGt6YWxsb2NfZmxleCgqYXBsaWMsIGlycXMsIGt2bS0+YXJjaC5haWEubnJfc291cmNlcyArIDEs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMX0FDQ09VTlQpOwo+ICAg
ICAgICAgaWYgKCFhcGxpYykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gICAg
ICAgICBrdm0tPmFyY2guYWlhLmFwbGljX3N0YXRlID0gYXBsaWM7Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBp
bmRleCBkMzhmNWRlMDgzNGMuLjUwN2Q4MmU1YmM4OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAg
LTExMDgsNyArMTEwOCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5pdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4g
ICAgICAgICAvKiBBbGxvY2F0ZSBJTVNJQyBjb250ZXh0ICovCj4gLSAgICAgICBpbXNpYyA9IGt6
YWxsb2Nfb2JqKCppbXNpYyk7Cj4gKyAgICAgICBpbXNpYyA9IGt6YWxsb2Nfb2JqKCppbXNpYywg
R0ZQX0tFUk5FTF9BQ0NPVU5UKTsKPiAgICAgICAgIGlmICghaW1zaWMpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ICAgICAgICAgdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNp
Y19zdGF0ZSA9IGltc2ljOwo+IEBAIC0xMTIxLDcgKzExMjEsNyBAQCBpbnQga3ZtX3Jpc2N2X3Zj
cHVfYWlhX2ltc2ljX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgaW1zaWMt
PnZzZmlsZV9oZ2VpID0gaW1zaWMtPnZzZmlsZV9jcHUgPSAtMTsKPgo+ICAgICAgICAgLyogU2V0
dXAgSU1TSUMgU1ctZmlsZSAqLwo+IC0gICAgICAgc3dmaWxlX3BhZ2UgPSBhbGxvY19wYWdlcyhH
RlBfS0VSTkVMIHwgX19HRlBfWkVSTywKPiArICAgICAgIHN3ZmlsZV9wYWdlID0gYWxsb2NfcGFn
ZXMoR0ZQX0tFUk5FTF9BQ0NPVU5UIHwgX19HRlBfWkVSTywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ2V0X29yZGVyKHNpemVvZigqaW1zaWMtPnN3ZmlsZSkpKTsKPiAgICAg
ICAgIGlmICghc3dmaWxlX3BhZ2UpIHsKPiAgICAgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUu
Ywo+IGluZGV4IDA4MmY5YjI2MTczMy4uOWIxZDgwOWRhZjJjIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjY5LDgg
KzY2OSw4IEBAIGludCBrdm1fcmlzY3ZfbW11X2FsbG9jX3BnZChzdHJ1Y3Qga3ZtICprdm0pCj4g
ICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBw
Z2RfcGFnZSA9IGFsbG9jX3BhZ2VzKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X29yZGVyKGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3Np
emUpKTsKPiArICAgICAgIHBnZF9wYWdlID0gYWxsb2NfcGFnZXMoR0ZQX0tFUk5FTF9BQ0NPVU5U
IHwgX19HRlBfWkVSTywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X29yZGVy
KGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3NpemUpKTsKPiAgICAgICAgIGlmICghcGdkX3BhZ2UpCj4g
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICAgICAgICAga3ZtLT5hcmNoLnBnZCA9
IHBhZ2VfdG9fdmlydChwZ2RfcGFnZSk7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfcG11LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gaW5kZXggYmI0NmRjYmZiMjRk
Li5lNTAxODc4NDc3OWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMKPiBAQCAtNDUyLDcgKzQ1Miw3IEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV9wbXVfc25hcHNob3Rfc2V0X3NobWVtKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgdW5zaWduZWQgbG9uZyBzCj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+
IC0gICAgICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3NpemUsIEdGUF9B
VE9NSUMpOwo+ICsgICAgICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3Np
emUsIEdGUF9BVE9NSUMgfCBfX0dGUF9BQ0NPVU5UKTsKPiAgICAgICAgIGlmICgha3ZwbXUtPnNk
YXRhKSB7Cj4gICAgICAgICAgICAgICAgIHNiaXJldCA9IFNCSV9FUlJfRkFJTFVSRTsKPiAgICAg
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IGluZGV4IGFiMzlh
YzQ2NGZmZC4uNDk4NGQzZTU0ZTIzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IEBAIC0z
NzcsNyArMzc3LDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9md2Z0X2luaXQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgaW50IGk7Cj4KPiAgICAgICAgIGZ3ZnQtPmNvbmZpZ3Mg
PSBremFsbG9jX29ianMoc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUoZmVhdHVyZXMpKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVJSQVlfU0laRShmZWF0dXJlcyksIEdGUF9L
RVJORUxfQUNDT1VOVCk7Cj4gICAgICAgICBpZiAoIWZ3ZnQtPmNvbmZpZ3MpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gaW5kZXggNjJkMmZi
NzdiYjliLi5kNzQ4ZTdkODI1ZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92
ZWN0b3IuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiBAQCAtNzYsMTEg
Kzc2LDExIEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfaG9zdF92ZWN0b3JfcmVzdG9yZShzdHJ1Y3Qg
a3ZtX2NwdV9jb250ZXh0ICpjbnR4KQo+Cj4gIGludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0
b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAtICAgICAgIHZjcHUtPmFy
Y2guZ3Vlc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBremFsbG9jKHJpc2N2X3ZfdnNpemUsIEdG
UF9LRVJORUwpOwo+ICsgICAgICAgdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRh
cCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTF9BQ0NPVU5UKTsKPiAgICAgICAg
IGlmICghdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAtICAgICAgIHZjcHUtPmFyY2guaG9zdF9jb250ZXh0
LnZlY3Rvci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gKyAg
ICAgICB2Y3B1LT5hcmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXAgPSBremFsbG9jKHJpc2N2
X3ZfdnNpemUsIEdGUF9LRVJORUxfQUNDT1VOVCk7Cj4gICAgICAgICBpZiAoIXZjcHUtPmFyY2gu
aG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkgewo+ICAgICAgICAgICAgICAgICBrZnJlZSh2Y3B1
LT5hcmNoLmd1ZXN0X2NvbnRleHQudmVjdG9yLmRhdGFwKTsKPiAgICAgICAgICAgICAgICAgdmNw
dS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCA9IE5VTEw7Cj4gLS0KPiAyLjM0LjEK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
