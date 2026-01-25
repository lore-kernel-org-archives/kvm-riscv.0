Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76021E63C82
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 06:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isRIN71u8nNJWSqpQWJFvGdIONm9aJAFyDmVXnUU438=; b=RB7vQBfg3cszT5
	cBUZJWODGF9vuQrYUv0rlUNC8HOZ/j0F6xuy/pMzO6lW34SdQrxnZV/02xT3J7DP9DLw9yyAL24ew
	tYvdPytixjn+TYpn8eU0u2ImB2bqi9E+XXzH/xWIyNF9pftILK1EUy4HnCJAdAVH8zjKyYTfj3SAi
	VK5WgOMUik8RQCVx8iBXmrplVqNHIMRV1S7F8g0Lr1dQBnKZyWQBzWL7m0xs9Y1ZS/JPIew92Tlmr
	QXBMDQXx6pE76AvuABDyYoq/lk5A7Cn13qlaBHfYYBeUbKdqBuDn5jxBtYlV38/fW7T170EaJJF/L
	pOKQKwKKB963U2kJrhFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtK6-0000000Au7I-06Ey;
	Sun, 25 Jan 2026 06:10:10 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtK3-0000000Au6U-24fD
	for kvm-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 06:10:08 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6610800b78eso988228eaf.0
        for <kvm-riscv@lists.infradead.org>; Sat, 24 Jan 2026 22:10:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769321406; cv=none;
        d=google.com; s=arc-20240605;
        b=IQtzkeJfYRifxupqEvq6UQ6VhJPPuRh2HFLqp/uXWNwcjctc07mmP25v/d+6vPQXtI
         SoPJtWOFj6Zja/cOE4VDtGrxFJ8HSd+q6Fyo2YP3ugWIGGxTnMG79z1E2REd2FJYxhDe
         8xxs8unRmqoD3wstOyIWgPHU84ZE/WYYD3hQKDudhRFiqIJQqpI3H4or+g2foB/dDMVy
         D8zS/jizBX5RZHXOqWUx4b1rNQ9IiaNVHUwdzW9qXrhIe3U3jT4oi8pYNncCE9E+VmMW
         r4dn7lY+8exEP6z4q95Q4CJtTxH0atGJxVFml7IR7shAS0nVzjZAZlztwwImC0f1i0yC
         tj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        fh=IvD0yBCj6SdygGErOo2jtLvBL9m/m10Ase+0COISIpQ=;
        b=OHxLfX8IJf3jrqUj2iHaMzZ1ikynw/CoATa/WaoOoNZG9QN/FEb7e2X0a6cDWhYQPl
         1cNyo9u2anjRxIT3j1ImxX7M1SG2FQJ8PsBXgh9g7k7ipJFGIx+HWXzLkxN1I09qwndZ
         r8CMReK+Uo3ieeTvARqdrzBtgUm7pMeHsLwnNABNb3ZE6KtwVsHSNSyakLuvqJXRWf+H
         bDxqHLh2+sjibOJIc8myLy+vBRT2EEahFro4BSb0IDUWeLtlAjozD/HCli3WqgA9PaLC
         CMAg9u6fWU1SLAF0l5OK10nFLAUHnwnn54BI7gVXZPopJmdoflP2fXuUxP/EW6ey6F+4
         GLRQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769321406; x=1769926206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        b=ukA/2+zmpIZX/w9q9UkKCIGfj3zTpjxKaDOIrHYeCVMp4Zmrzcq3QQ0EDIAtQI7hqT
         +vKtlPM7vVnSlEbLsHo8oUs3CMp05Cj8eGfZtBmVX8wcaFp7rW5N1vqWWPNkgP9+NxZS
         bpPhYL0i0GZkvMSpCXdzkotmcmrjFnOdiw3IYy2utHozd9PUlhyiMWoADkA1sCl0bnyg
         3J9z/PtUhLFF3MUfs3oOelECwNTU2jAUFfq2jWIrBw00WctmTGsxD9lNtpuSyXcd3/3X
         DnS1rDUcmuzikGKT41ZFvqRUQeUJE+Q7cwVKCzHhOHVnPj/hrGyn7Gphzpc1BXfWXjOb
         Tc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769321406; x=1769926206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        b=Y6wamHV6SR9xxP8FAJ2FLSlOZjCoUiu24q3BVJKSyO5DOB3PB2J4MTBKlCPghnk9VZ
         AuPDRYhPxZpdW3pRdBQMokLHAd9KfsbemeFootIr/ZO27BxsgOBY7OYpbRXbE7qk2lFs
         su0T9Y1sBCzwF1EVLAq8/EtTYxoiJBz95/4vaNRWe2Oi9Y1UmjAUjxowpdpdVrXaP2sk
         1aSa7vZnp5wlxERfTVrcFtv1g/oSaM+RKQI/+NnHpCcO/FB1Lgmcg4KkBnP4/v018EX6
         vXefSKetghPueVCp77SaHiZK2wunKpKCmDJOTV/Y9z1m05jkyuFURXvasHjGVTS5Uvez
         l8wA==
X-Forwarded-Encrypted: i=1; AJvYcCVxr+iNw3Z8g46TU3SYMnyp1C2yd3Aubl/Lt/7VKPrDgkl/YREtmCjg/kv5HiN+4/BOxcKhETi75bE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOIL+vxVkRnTaWKZI1mDEW/kYmCt+wh9T47i8GEO04hHOuZIQ4
	oX5a6ikqu7Oso8Ia8zgf36F0LnKVfWFDVu8n71uRK1fVlgGmPih1J8heKJV1oY7oZQU7pe8Kuib
	yjTtsFFX4EeH8Dxip/J+eP8PwsllCGkpvGdwrC89yiQ==
X-Gm-Gg: AZuq6aJFKolYaSxvpt/zKwTB3qMPXMgndKpq17OQ3vbB1SVB7eSnf4Ra4hXGFtZ/9w5
	Vi96oQJrnRmIscr/b0ujrGPj2E4W/tEv/DTnmX/P2G0peP+He6tcVZ7GfzTpiD8NaM2Mz1u2fqJ
	0yoPbXw5HdApidIujWjfZM93SfkYdmIq30NcVhDouXH2R2pzts+Kjnj72u1vkB71GaHph+XhXDN
	vXvCTpEtsORp9zlj2zvJg6qnXgde3RK6VfUkT085xgpzX/29KOoVmjVZckhrCBVQIDpMf8nBGNK
	dJzyfsQN9h8QJATm4WjRqIGAKNmlib5pQ26XL7C77I6vc+4ee6r9dKTvC3N8BjHZjB0=
X-Received: by 2002:a05:6820:4c10:b0:65f:6601:b348 with SMTP id
 006d021491bc7-662e04852c3mr466071eaf.62.1769321404333; Sat, 24 Jan 2026
 22:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20260125060441.2437515-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260125060441.2437515-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Jan 2026 11:39:53 +0530
X-Gm-Features: AZwV_QiLy7Qn8vFdFMNh31JEJuULaHJbzToh_4mxXW9q7rEMkbJvRXHHKpISzlk
Message-ID: <CAAhSdy3dWRuJpLMBqrPJ99AqneWvJu1TuU7wW0Fom+awdBupDQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_221007_701750_94E07CE5 
X-CRM114-Status: GOOD (  20.83  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMTE6MzTigK9BTSBKaWFrYWkgWHUgPGppYWthaXBlYW51
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbnVsbCBwb2ludGVyIGNoZWNrIGZvciBpbXNp
Y19zdGF0ZSBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdCBpbgo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
aGFzX2F0dHIoKS4gV2hpbGUgdGhlIGZ1bmN0aW9uIGNoZWNrcyB0aGF0IHRoZQo+IHZjcHUgZXhp
c3RzLCBpdCBkb2Vzbid0IHZlcmlmeSB0aGF0IHRoZSB2Y3B1J3MgaW1zaWNfc3RhdGUgaGFzIGJl
ZW4KPiBpbml0aWFsaXplZCwgbGVhZGluZyB0byBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSB3
aGVuIGFjY2Vzc2VkLgo+Cj4gVGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBkdXJpbmcgZnV6emlu
ZyBvZiBSSVNDLVYgS1ZNIGNvZGUuIFRoZQo+IGNyYXNoIG9jY3VycyB3aGVuIHVzZXJzcGFjZSBj
YWxscyBLVk1fSEFTX0RFVklDRV9BVFRSIGlvY3RsIG9uIGFuCj4gQUlBIElNU0lDIGRldmljZSBi
ZWZvcmUgdGhlIElNU0lDIHN0YXRlIGhhcyBiZWVuIGZ1bGx5IGluaXRpYWxpemVkCj4gZm9yIGEg
dmNwdS4KPgo+IFRoZSBjcmFzaCBtYW5pZmVzdHMgYXM6Cj4gICBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MKPiAgIGRmZmZmZmZmMDAwMDAw
MDEKPiAgIC4uLgo+ICAgZXBjIDoga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cisweDQ2NC8w
eDUwZQo+ICAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmM6OTk4Cj4gICAuLi4KPiAgIGt2bV9y
aXNjdl9haWFfaW1zaWNfaGFzX2F0dHIrMHg0NjQvMHg1MGUgYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmM6OTk4Cj4gICBhaWFfaGFzX2F0dHIrMHgxMjgvMHgyYmMgYXJjaC9yaXNjdi9rdm0vYWlh
X2RldmljZS5jOjQ3MQo+ICAga3ZtX2RldmljZV9pb2N0bF9hdHRyIHZpcnQva3ZtL2t2bV9tYWlu
LmM6NDcyMiBbaW5saW5lXQo+ICAga3ZtX2RldmljZV9pb2N0bCsweDI5Ni8weDM3NCB2aXJ0L2t2
bS9rdm1fbWFpbi5jOjQ3MzkKPiAgIC4uLgo+Cj4gVGhlIGZpeCBhZGRzIGEgY2hlY2sgdG8gcmV0
dXJuIC1FTk9ERVYgaWYgaW1zaWNfc3RhdGUgaXMgTlVMTCwgd2hpY2gKPiBpcyBjb25zaXN0ZW50
IHdpdGggb3RoZXIgZXJyb3IgaGFuZGxpbmcgaW4gdGhlIGZ1bmN0aW9uIGFuZCBwcmV2ZW50cwo+
IHRoZSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuCj4KPiBSZXByb2R1Y2VyIGFuZCBkZXRhaWxl
ZCBhbmFseXNpcyBhdmFpbGFibGUgYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2oxYWthaS90ZW1w
L3RyZWUvbWFpbi8yMDI2MDEyNQoKTm8gbmVlZCBmb3IgYSBsaW5rIHRvIHlvdXIgcGVyc29uYWwg
cmVwbyBvdmVyIGhlcmUuCgpQbGVhc2UgYWRkIEZpeGVzIHRhZyBoZXJlLgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgoKT3RoZXJ3aXNlLCBM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyB8IDMgKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXgg
ZTU5N2U4NjQ5MWMzYi4uOWM1OGE2NjA2ODQ0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk5
NSw2ICs5OTUsOSBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cihzdHJ1Y3Qga3Zt
ICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSkKPgo+ICAgICAgICAgaXNlbCA9IEtWTV9ERVZfUklT
Q1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5hcmNo
LmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICAgICAgICAgcmV0dXJuIGltc2ljX21yaWZf
aXNlbF9jaGVjayhpbXNpYy0+bnJfZWl4LCBpc2VsKTsKPiAgfQo+Cj4gLS0KPiAyLjM0LjEKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
