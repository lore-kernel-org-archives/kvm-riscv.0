Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7778FC88E45
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZ3+TXSPGRqdgiNgkntgRsMqWXnOUr0+0NeUEVghQno=; b=mAepn/fFoFkYZ3
	yw0KSWuj8vKWaTtn8BiPJE9TX4AgafBmqtBHspBkPt3Qf9K5YVM+DUz7pUXyKvrHuzfMYcUeoVEeX
	AzmpInowOttx3cvHCPL+Tzb60UaIe1+8LsVtHMcrpU17uiqEn+Piq4xR4Jw1HM1+nsu8TTVRSHcyj
	Zw1EcByBHf/e64iHAjPgrS2kYL0gKVIofcARQU8EpRL+Nyq/dSoXTrVpUIOQDUnkZQs3G3zTr5vvg
	g9Jz91Yi30BGBCCwH22g7KVMQduP2Eqa4kCT7Rh4Iw0jJNAx2Qu/HHn4GgAD+a9/KWjpVOuX+zBZR
	EiULhiaZI5AUYDvjKdUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcp-0000000G0yW-0bpM;
	Fri, 11 Sep 2026 07:24:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcm-0000000G0w7-0mur
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-485850cf499so421320f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Sep 2026 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789111478; cv=none;
        d=google.com; s=arc-20260327;
        b=bMvQf8LucEWSG3KxCcQWVwXTrWsiiDncf7AGdTORepI61vMiWykFVkqe2lY22uWveq
         xUbKhFz60lY1WKXlo0vI54zFUb7r2oHrxJhFqyb5SdcJiUwsIlgUShOH+J9nInoeSQbA
         Olw88viivo51zPj5m+XdhmwITcj7MRhsk3pBgZPurc8wgTYXKN5tvXQa4l9jPhSR85xS
         zctceeTmxvsDMDbiuzejPdZAUjGRRL4QR1bfAew9XjKeuoX9PdbAvqt+AZzc8rNb+/f9
         AnzERrZ8H2lk7OBUSa7A7q83LMVjGEhqnELH/vC/EnEZKwbCrra7lPvNAlgj+QenaGK1
         2pIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        fh=tJ8LCegsrq+bhZDTHTb1ml0ti1gOaEn5F0RLf3llSsE=;
        b=r8vwVizhIapIGxIEu18+dmtrut/dG16SOaqORxmXa4WJkcfXMuLOAGtzlF/HmBbnms
         HeD+0fEEthgnCDQYVZRJ8MEzgEzrIv1po/RVAeX3EjbHRE8vF1//4c8PJ8gBwT0Kgs0m
         3VGBbzMZK6tuY+mFCzNxkz+atdRh196eF9XZcOfGEE1FUrMRoOs7rOofucGpF9WRd7wq
         znBehmorjhn6HmH4aWZpmlW7fi2oB0ExDqKNMtOtyF/zJBZ7XBXyWg7C2y2wxeOJLGfs
         YPLpgDvex1tWRRfZkzDLZEHHgu/cPefVYPF1QZbzQW5w+PMreMJONLOeT32SnpDmbUeC
         Fb3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789111478; x=1789716278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=U0JvGDzeGsslVqBcmTgaz2nvSwJszExjP1uRkUQPJyY2DezQ9+yNPcOYimD6hR+kQ2
         HnDQ+E1geBmjxlQVUK+0Oy9e1JufaMTIxJ6QdC5ezPEUoI8z1nLuGKL0NaRVQxuhbwqg
         CR762DT1N4rlFugrba3ro1QMjcwkltzn9TMpvyWHSz3CTey/z3cBjI0AEpZtgR7UJ3A7
         VCb8wz4eV4HEytpMiBagiCLbQ3ufw/w4xU9tJfFPv6vOa6lrAOWZJSGGIna9yAtk6NEP
         D4NiyqBpbMn6p6+H5v1T3tHMWEkCu4WjQbm4OBCLxnJ4J80fyUy7H9+AVYXgsoxWX5H4
         LTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111478; x=1789716278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZBw3ZTwOIgY959yo8ebXtIDcCXQztOd/7/v3zr0SCc=;
        b=BOd6vmCI+Rc2xAsmK2yVEA62MR8ptXSiLLd0msq0IDwmEYLcJEwfDhYVo6seCCLL6h
         tv/EUCOq6qoPAUVpFYWaacjSabQvoqUGBdAl2r8iJZhh2AZSbq9Qwdal1PKfxONO9BY8
         tESPeCE68RnFdHKvjDPudpeRjp+1a4+WmMr3Cm2KkGgGkbU+iQX1llwvLz+WaduoQryf
         +cNtH3F0FQ2CL9DeCH87xRmLUtfzoInswgnJc99onV9Zsa9201carYq5UDwGPzarVf73
         Q3AkCD2OwX4xqj6rE0CSRvPbX0NH/1I0pRrnkRqaV5hgfPKLR4YKYozI3Q/ogrUiMwW9
         k3lg==
X-Forwarded-Encrypted: i=1; AKwUvByiZuAjoRoPPapOGpQHqp/rQbwYLPmenD4fwEQqC4LLFee0V8X2lG7++aAmBmf855iSFrhhc6xqk6A=@lists.infradead.org
X-Gm-Message-State: AFuF++k8262DcKmGSRBukC/mDJ2B+WTmCh00+MaBaEdN0jR7M/CjdJdP
	qXRT6jCZNRcSdaO6qbao0EV60L12ZxfXICLIl/HZsYRBO23VElHyfWTRrRGt6JiJOtHhvjsYkzb
	uzIALblZqOV1x8pKvzqtguZNLBUiIJL2OkAG/fYsMJQ==
X-Gm-Gg: AYBFou3nA64/SG75XaOjZkio7BjtY9OO3sqtK3fr1Tm3YAFQ4B0OPQE8arY1UuAOUfm
	8DsfMUyEaY7QirVpRTvyJh63TtTc7D7hkxJptKJ2NJA8AOX8B7gy0x9NdjEzzls/ryGbG0ceZRd
	TcXiE46Dt6OjXGN8Mo5YpYBuYUnE94bTEFAI2bvU9TDCtJUPO5MidMpbgkRZoBkBd27QeSJxyko
	EFqvVMKgdj8vhZc7f2xiyRHZ8rNkggJn9t9fWj094UvdPuUVOvqC2FcgsLH0F3qQZAM+/wk3iAn
	LiIUYduwjBO0RLgzLyHvRmUYTq3jVMuLBCw/vMyWI9GSS1VwmQ1VvjOAo8ub6XzFaTLW5/LsBld
	MwVjP78R0gKnfGyJaMEhicPOy8XSQUNsTaN+xKsvl0fKWV1dNl5XaMO8qvq7JgIWZYdK/PUnIpw
	==
X-Received: by 2002:a05:6000:2005:b0:485:9233:a5ae with SMTP id
 ffacd0b85a97d-486eafd5eb0mr3126572f8f.3.1789111478364; Fri, 11 Sep 2026
 00:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786512671.git.pengpeng@iscas.ac.cn> <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
In-Reply-To: <4852f3b8985c353811fa065e4701d76dc9a7f086.1786512671.git.pengpeng@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Sep 2026 12:54:26 +0530
X-Gm-Features: AcwNN1UilFvQBMBFE1D37iU-TcFZA6Ymj5ixovFg4tSLMmtpRh77_3nZieaFccc
Message-ID: <CAAhSdy2gxgY6yjQRVhgwV2kLB8ZGwsuseOVPWF6KJsjPOLeP_g@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: KVM: Disallow GPA-width changes after AIA init
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Guo Ren <guoren@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002440_252305_8D2DC797 
X-CRM114-Status: GOOD (  15.38  )
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTE6MDnigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEtWTV9FTkFCTEVfQ0FQKEtWTV9DQVBfVk1fR1BBX0JJ
VFMpIGFsbG93cyB1c2Vyc3BhY2UgdG8gcmVkdWNlIHRoZQo+IHN0YWdlLTIgR1BBIHdpZHRoIHdo
aWxlIGEgVk0gaGFzIG5vIHZDUFVzIG9yIG1lbW9yeSBzbG90cy4KPgo+IEFJQSBpbml0aWFsaXph
dGlvbiBjYW4gc3RpbGwgY29tcGxldGUgd2l0aCBhbiBBUExJQyBhbmQgbm8gdkNQVXMgb3IKPiBt
ZW1vcnkgc2xvdHMuICBJbiB0aGF0IHN0YXRlLCB0aGUgQVBMSUMgTU1JTyBkZXZpY2UgaGFzIGFs
cmVhZHkgYmVlbgo+IHJlZ2lzdGVyZWQsIGJ1dCB0aGUgZXhpc3RpbmcgY2hlY2tzIGFsbG93IHVz
ZXJzcGFjZSB0byBzaHJpbmsgdGhlIEdQQQo+IHdpZHRoIGJlbG93IGl0cyBhZGRyZXNzLgo+Cj4g
UmVqZWN0IEdQQS13aWR0aCBjaGFuZ2VzIGFmdGVyIEFJQSBpbml0aWFsaXphdGlvbi4gIEJvdGgg
cGF0aHMgaG9sZAo+IGt2bS0+bG9jaywgc28gdGhlIGNoZWNrIGFsc28gY2xvc2VzIHRoZSByYWNl
IGJldHdlZW4gZmluYWwgQUlBIGFkZHJlc3MKPiB2YWxpZGF0aW9uIGFuZCBwdWJsaWNhdGlvbi4K
Pgo+IEZpeGVzOiA3MjYzYjRmZGIwYjIgKCJSSVNDLVY6IEtWTTogUmV1c2UgS1ZNX0NBUF9WTV9H
UEFfQklUUyB0byBzZWxlY3QgSEdBVFAuTU9ERSIpCj4gU2lnbmVkLW9mZi1ieTogUGVuZ3Blbmcg
SG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZtLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdm0uYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZtLmMKPiBpbmRleCBhOWYwODNmZWViNzYuLjY2ZWRmYWE4NjI0MyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdm0uYwo+
IEBAIC0yNTAsNyArMjUwLDggQEAgaW50IGt2bV92bV9pb2N0bF9lbmFibGVfY2FwKHN0cnVjdCBr
dm0gKmt2bSwgc3RydWN0IGt2bV9lbmFibGVfY2FwICpjYXApCj4gICAgICAgICAgICAgICAgIG11
dGV4X2xvY2soJmt2bS0+bG9jayk7Cj4gICAgICAgICAgICAgICAgIG11dGV4X2xvY2soJmt2bS0+
c2xvdHNfbG9jayk7Cj4KPiAtICAgICAgICAgICAgICAgaWYgKGt2bS0+Y3JlYXRlZF92Y3B1cyB8
fCAha3ZtX2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSkKPiArICAgICAgICAgICAgICAgaWYg
KGt2bS0+Y3JlYXRlZF92Y3B1cyB8fCAha3ZtX2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSB8
fAo+ICsgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXplZChrdm0pKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHIgPSAtRUJVU1k7Cj4gICAgICAgICAgICAgICAgIGVs
c2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm0tPmFyY2gucGdkX2xldmVscyA9IG5ld19s
ZXZlbHM7Cj4gLS0KPiAyLjUwLjEgKEFwcGxlIEdpdC0xNTUpCj4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
