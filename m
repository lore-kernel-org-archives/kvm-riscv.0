Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C3C83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JR1p9S17lG7Gp/wDXpzZnWGCTnfKhrulC8l2lkA0bO4=; b=nfqwI4Vh4ILji/
	ExbhyXQZXp07MEnfxEqUtWg3gNxXmfoGNMrjd80FH0rjDeomol5m4Wn0S0r6qhV5WIxKm2wGkbQxZ
	w3wnvQLGrRVC/7dZ6qlHFYSPG8UgBNvy7nJ/y5bl5JGZD1b5pvgARSZHNFc19qd4bLlMY0tjfBaMI
	hR+zwkcY/Cp3Q+fipifHXh5IfNGkBxgrxCseU1EtljxMYpFNmBCM/ZpEEw190GDaPp0PMjXn7qhu2
	VbEg7rAh4kAVhg8FGSMBS29qw+tFWb6+7JIVxe99JP3kKCHgl6aQJ9tJRiPjWMnUO0F0DcH0Ouq4Y
	DlHdhxjH9ro3e1F/UPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQmB-0000000AWy5-2xDz;
	Thu, 17 Jul 2025 15:44:03 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQGk-0000000ATvq-0fom
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:11:35 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7e32c9577ddso104176185a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752765093; x=1753369893; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=CizQx1gEjFt3BFIanQ+ATcBMsDAzrJ/Vplns1qtNKerVcOu1t2fYVUJdfj4bhnZ0mh
         Nc9eTpUuKg/LP3PeoRxvHMY66LYpBLYitbm5U8a/7IuZYffTqUTKo2PfCY2J2OcEaNdA
         4oYJ72IqDmbSl/gPbwimAF6b/fxDEsm5K4Ni9w94oV8YWDE7n+N4HvIoU+7QTJKGXZ1w
         wufe019/oLlRQXBpkOw6LWv337oBxAkbVocleAW4WSmk2j1HAhNF6eX9ioJmROCS7qXd
         uyNY6MeGDiKpXuHe0eNi15g7menzV3dIvOd9p13cEe2UbOumhTzrP4blGlpNNC1GTxFu
         TSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765093; x=1753369893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCn0C31hN22UugwY+nNOxL0Cz8wHEu8jqXWG+wcYuqQ=;
        b=qVfsn7IOU2GLciJ+QwM/wnVfru8eEgJnAX2YCKtB/SnGxsr6EzakylAef6A9tnyDVA
         RXRJRIrO3K3hva5DNsDIubQV/53j0/pTGUb6GV0jhXYoB2GKGwK2UXs1ezeP9zCu+SLD
         EJZ3MNQQnfMkTyk9tLkqGdO3M2tR9RFaj9OJK8DMuW9IC17i0qhwO5ef4SdfBdM1Fycb
         C97MDUcfk6ZuU7b7uLu4gb5QOjd7CaOd7uhkdqUTDm26DY/n/wIzoFEUIfsW0qco6fQp
         yWyQdIl4SZDAcYb2xs9C1ezQqefoZudD2waoeWmGwT6MmfTHKVVbuxXY0NdRwPpR4bLy
         cKsA==
X-Forwarded-Encrypted: i=1; AJvYcCUc6coMCONhy8HN9D2YnTLOS3Gst+rurVVuOl9rDoYft5UL1gO23Du44RUhpkysZHhW+ZBTPJyvQTg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQH2PfXUiEIEmz3Gvss0Cu97PsHSDooi3OnSLYyvGyiZp/yMlp
	KssUFScXP0z0ydGRS/3hStHfHxYLCtUQdXEPjjLZf90D9z0piIAJMkXUbOeNJlpeAgGpo6vKQ4B
	x2pN36ujutvS60f5hfGN1eZBBQwJ97GLx8MZ/pQKKQg==
X-Gm-Gg: ASbGncsKWP+iDxfeK2whjGAYzYNZtl2DcELYqsvhkGAXztthmlG+a7j1fcn9pE2h0Pk
	zsI3qiM9qwWtpwPuSw5tq21Al//7byJASA77zYE6epK4RMpUdddcsuEKYsLtVH/O7q+9gJcw2B7
	2iWBmmT+ed5h5NQfcjJZ98I0sDm9xwMCr0DZKquXwoGLm9U52yAjlfKTnRWLTpLwmpu3klO9z0d
	8FuETqY
X-Google-Smtp-Source: AGHT+IHaFJ1sfqQyWiG9DiWncsz3p3oF6sF6SWaO0rxigj/urXDCJiahMXJIk9SDxHRXku+eh2bgCplK2qeaMk0aX54=
X-Received: by 2002:a05:620a:28c6:b0:7e2:77d0:f33d with SMTP id
 af79cd13be357-7e34356b8admr1012854085a.14.1752765092470; Thu, 17 Jul 2025
 08:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com> <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 20:41:21 +0530
X-Gm-Features: Ac12FXzdth30OveMxtaGx1W5ZBrjzTJj5_mIPZDmwmxiXuGuVRtL8fMgmMv9bXQ
Message-ID: <CAAhSdy1LVhWUovNLwfv2Y2eOzjewM005+gUENFDg-gqUaBuBgg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] drivers/perf: riscv: Add SBI v3.0 flag
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081134_351772_413C3BAD 
X-CRM114-Status: GOOD (  15.09  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MzPigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGVyZSBhcmUgbmV3IFBNVSByZWxhdGVkIGZlYXR1cmVz
IGludHJvZHVjZWQgaW4gU0JJIHYzLjAuCj4gMS4gUmF3IEV2ZW50IHYyIHdoaWNoIGFsbG93cyBt
aHBtZXZlbnRYIHZhbHVlIHRvIGJlIDU2IGJpdCB3aWRlLgo+IDIuIEdldCBFdmVudCBpbmZvIGZ1
bmN0aW9uIHRvIGRvIGEgYnVsayBxdWVyeSBhdCBvbmUgc2hvdC4KPgo+IFNpZ25lZC1vZmYtYnk6
IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBpbmRleCA2OThkZThkZGY4OTUu
LmNmZDY5NDZmY2E0MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
Cj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+IEBAIC02Myw2ICs2Myw3IEBA
IFBNVV9GT1JNQVRfQVRUUihldmVudCwgImNvbmZpZzowLTQ3Iik7Cj4gIFBNVV9GT1JNQVRfQVRU
UihmaXJtd2FyZSwgImNvbmZpZzo2Mi02MyIpOwo+Cj4gIHN0YXRpYyBib29sIHNiaV92Ml9hdmFp
bGFibGU7Cj4gK3N0YXRpYyBib29sIHNiaV92M19hdmFpbGFibGU7Cj4gIHN0YXRpYyBERUZJTkVf
U1RBVElDX0tFWV9GQUxTRShzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSk7Cj4gICNkZWZpbmUg
c2JpX3BtdV9zbmFwc2hvdF9hdmFpbGFibGUoKSBcCj4gICAgICAgICBzdGF0aWNfYnJhbmNoX3Vu
bGlrZWx5KCZzYmlfcG11X3NuYXBzaG90X2F2YWlsYWJsZSkKPiBAQCAtMTQ1Miw2ICsxNDUzLDkg
QEAgc3RhdGljIGludCBfX2luaXQgcG11X3NiaV9kZXZpbml0KHZvaWQpCj4gICAgICAgICBpZiAo
c2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkKPiAgICAgICAgICAgICAg
ICAgc2JpX3YyX2F2YWlsYWJsZSA9IHRydWU7Cj4KPiArICAgICAgIGlmIChzYmlfc3BlY192ZXJz
aW9uID49IHNiaV9ta192ZXJzaW9uKDMsIDApKQo+ICsgICAgICAgICAgICAgICBzYmlfdjNfYXZh
aWxhYmxlID0gdHJ1ZTsKPiArCj4gICAgICAgICByZXQgPSBjcHVocF9zZXR1cF9zdGF0ZV9tdWx0
aShDUFVIUF9BUF9QRVJGX1JJU0NWX1NUQVJUSU5HLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInBlcmYvcmlzY3YvcG11OnN0YXJ0aW5nIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtdV9zYmlfc3RhcnRpbmdfY3B1LCBwbXVfc2JpX2R5
aW5nX2NwdSk7Cj4KPiAtLQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
