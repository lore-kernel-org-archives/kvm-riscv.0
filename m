Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDC2C3ABBE
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5zjSIFMYTj6JJHdPya9ASvyyHOtze6c6I2YiNU+6wI=; b=NfNBTs0Pl9xg1i
	u+X9hhaDVqUawPDxgwZKNHd2ay4zKgZlzRZ39jx9WNp/r/mPHT9VlF1Eu/0VSadXJAtSaGE0J5UzV
	5q/YLPDZF2u8l0J5exnviu0HoJkc75B5DZlVQP8sMi8cncr9d2qBi4pSRqJ7+gK74rfrAktvzGYHH
	oWMI+IOfoZBo5CuU5c4BsoeZaP20j4L2KaeO721tymvr1Bt6DsFOIy54FjFZ3+vzZ+ebS8kCk8omi
	6DPyMGF2EBitvmNACOJTjuiCBwF40p7xNrieSQmkyGwTbIYjoiQTSScRL1dlxz0TnIgIT6mVyt4xc
	W46tzZbGZo4nmBlrxM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD12u-00000000iiO-3Lqa;
	Thu, 08 May 2025 13:12:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD126-00000000icf-03FI
	for kvm-riscv@bombadil.infradead.org;
	Thu, 08 May 2025 13:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nIIzVOYBzARToag3Hu6HMwC8LbExnwHHAZ9eRtDBxjM=; b=DN3dDT72jUPYt4L7gkqoy87Riu
	Soiaztfz+q4gXJKOjMaSmrwH2kA0HZmAQJEibf1OhrZuACZNvqRQAqGhMKU9AnOcw+ROKZZmn7Sm0
	+WdnY2wLz/oYkzLRqva4l3x0wjOMfXeKjHP3LMznmgGX/XAV/+OVPk7fUZyASyu8B8+mOHzeY/Zca
	6hBolFb6kmpOgUVy0HjmzK+oCCvF60/gJHdRyPtmiMp6m/NjAvSSlfjvwhr64GE2qPJMUJSutKUGL
	OCw2F4SahZpM8dkKawwnHQMzl/a1ged7wqKcw/SqZq2E+OHebBkHLcw7F8OdHryPCPvMQrV/hehdi
	+VVHv/qw==;
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uD122-0000000G3Pf-2PAG
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 13:11:24 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so4896905ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 08 May 2025 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746709879; x=1747314679; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIIzVOYBzARToag3Hu6HMwC8LbExnwHHAZ9eRtDBxjM=;
        b=dkzTofKSTGfH8L98Ar7UHMPkZeiSYvKxXoe29d0w5usRfmAQI6XXhJ6hygOrM16tSp
         ABDUotRpowMkXFGDhxOYapdbAIu8a4KIzLl5b1OQmHL12dUrBNzpto6X59AITF62yWGr
         q9EsnHOJUytdAEKDNAo6/MKF0Ajj9IAmrpA+mZv4FfcbcjZ6zKC8yqE8TEDSPUF5kpbd
         PHaObda8Y1dYeBYNTCv5MPsXN6nWjweVLG0hF5xCY4giSfCZpWGcjt0/qpAZHi4M8Gx5
         ySL6zzzCwT4bqOYHPcKVtxkO6t+NA7I+uIYqme7ZkiPFHviIaJHtRd/GMM4mPsgcNNvi
         H+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709879; x=1747314679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIIzVOYBzARToag3Hu6HMwC8LbExnwHHAZ9eRtDBxjM=;
        b=oSBU80ueqmD/ZuePazzKeKwI3Z1eqNnhVuFvteLLfyIbpApaSVu8LjHazkjYO5SUcK
         l0XzIq/xlHFEDX/LYx63ClZROPHHg5AKjWhQ3VxWi5z+IRwXYrUQiASBDcwi1dWzEPwF
         j+U1IR9rU5urX3FUAzQlkaq3cFJ74qQAzJi74+0qBqwtHc1f2PDgssh7eCY9WfP1Qcru
         gppPqrpQUSKDPY6cQy9UDZVoiDyMbxbzXHpmw243CMDxxhNlKnXnQYnKgRrdUze3h7vm
         Ym+6yiLHfmoo/hFpGXPuYAHVruOnPW9w8IFGyyIr8/2q6dpWxakiqlKmILgaaLDcCK27
         AwKQ==
X-Gm-Message-State: AOJu0YxOm6/e6wzJMf8VXHwcXXnoMHbZ/Pz4J9lpIfKfvDf2nU9LKyqb
	mCnMtXnWKBCOG9WwiTVbyY7n1DpLE0hETnsJ+s4Tk9h2ZCFItCCqclv3ccJ6bkqPtkO2kR36BdU
	NwuD/Iq+AD+snnA6uHhmly/8D5M7C/xlscsmHyw==
X-Gm-Gg: ASbGncvLjCeGOnAC1bJ85Hm8ZqS2tQp0OWVvKyc1D3a/bFdWNqTHg5eX1FEk58zHjvP
	7V3ToNhjeGqt+H53+UPu/W6FT0eqrprzN2JmSWb+8DkAMlKB4M9f684gZviRHwZeZ3rj6yfzYcL
	w9Z9cyWSveQndYOPtbUq8FR2D56dh0JHeZzQ==
X-Google-Smtp-Source: AGHT+IHQLQeo4Cv5ChZYTmyYcmLv/sbqMMoInT3yPEcu0Vzy2BhXgfYdd3qe4Af9myyCvg8pUIR3RpvOggHqQ9hf9zI=
X-Received: by 2002:a05:6e02:1809:b0:3d8:2178:5c63 with SMTP id
 e9e14a558f8ab-3da738d5abcmr87761745ab.4.1746709879462; Thu, 08 May 2025
 06:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com> <CAAhSdy3y0-hz59Nrqvvhp=+cWJe1s50K7EpuZmKBqfy-XQFd1Q@mail.gmail.com>
 <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
In-Reply-To: <D9QOY9TMQXSX.2VOEKVRCXKOO1@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 May 2025 18:41:08 +0530
X-Gm-Features: ATxdqUFytTSYeO2NMWgtWuuoNAjjyJfo1ZnV22TOYS1tMfbGTisHt7Mnprxdk_c
Message-ID: <CAAhSdy0-9OQmBf2VkJJFb+Gmwk3hmNapkjvJYvT06CG9eULDgQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_141122_920732_771DF6B4 
X-CRM114-Status: GOOD (  15.85  )
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

T24gVGh1LCBNYXkgOCwgMjAyNSBhdCAzOjMy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNS0wOFQxMTo0ODowMCswNTozMCwg
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz46Cj4gPiBPbiBUaHUsIEFwciAzLCAyMDI1
IGF0IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4g
d3JvdGU6Cj4gPj4KPiA+PiBUaGUgU0JJIHJlc2V0IHN0YXRlIGhhcyBvbmx5IHR3byB2YXJpYWJs
ZXMgLS0gcGMgYW5kIGExLgo+ID4+IFRoZSByZXN0IGlzIGtub3duLCBzbyBrZWVwIG9ubHkgdGhl
IG5lY2Vzc2FyeSBpbmZvcm1hdGlvbi4KPiA+Pgo+ID4+IFRoZSByZXNldCBzdHJ1Y3R1cmVzIG1h
a2Ugc2Vuc2UgaWYgd2Ugd2FudCB1c2Vyc3BhY2UgdG8gY29udHJvbCB0aGUKPiA+PiByZXNldCBz
dGF0ZSAod2hpY2ggd2UgZG8pLCBidXQgSSdkIHN0aWxsIHJlbW92ZSB0aGVtIG5vdyBhbmQgcmVp
bnRyb2R1Y2UKPiA+PiB3aXRoIHRoZSB1c2Vyc3BhY2UgaW50ZXJmYWNlIGxhdGVyIC0tIHdlIGNv
dWxkIHByb2JhYmx5IGhhdmUganVzdCBhCj4gPj4gc2luZ2xlIHJlc2V0IHN0YXRlIHBlciBWTSwg
aW5zdGVhZCBvZiBhIHJlc2V0IHN0YXRlIGZvciBlYWNoIFZDUFUuCj4gPj4KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KPiA+Cj4g
PiBRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNgo+Cj4gWzUvNV0gd2FzIGFscmVhZHkg
YXBwbGllZCwgd2hpY2ggbWVhbnMgdGhhdCBbMy81XSB3b3VsZCBiZSBuaWNlciB3aXRoCj4KPiAg
IG1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAwLCBzaXplb2YodmNwdS0+YXJjaC5z
bXN0YXRlZW5fY3NyKSk7Cj4KPiBpbiB0aGUgbmV3IGZ1bmN0aW9uIChrdm1fcmlzY3ZfdmNwdV9j
b250ZXh0X3Jlc2V0KSB3aGVyZSB3ZSBtZW1zZXQoMCkKPiB0aGUgb3RoZXIgY3NyIGNvbnRleHQu
Cj4KPiBTaG91bGQgSSBhZGQgYSBwYXRjaCB0byBkbyB0aGF0IGluIHYyPwoKWWVzLCBwbGVhc2Ug
YWRkIGl0IHRvIHlvdXIgdjIuIEkgd2lsbCB1cGRhdGUgbXkgcXVldWUgYWNjb3JkaW5nbHkuCgpS
ZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
