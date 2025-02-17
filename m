Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE36C0219E
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6gMQ1xbFZb100HP9T2zUHhxSf5Nf4W+YAhKvJRZ4wOI=; b=m1dBnhH7YHyl2o
	2IPJwmBxpaPAkAtNmIY7UE9asaAkcTTh1/igQZzqWFJ/yXHLnhi34WZWdwWSO9PouyN0Vfyldg4Wa
	L5gy7QqKqZGNzVev7Zbe5J4yRdR81D16633Km6+1RnRE6yOVRBzXn1FalBHGaGlXEf1tK0CAUCR5G
	FsPAcD/pyqUAdzOfGr0gF6Psqqlr6/gs4mD2T4UJ50FhKssZ+ce5oiRZp/hotolGncURcen9xCDDE
	CI4M2TeivDQrAbCWpYCNg8L34WcTaR9NfpgVWSY32MC656xJFBpIK4thfkTgz5Jm6fQEdvpTomye1
	Nq9VGWzaVCBHbfkhq2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoX-00000004EHS-2SxG;
	Mon, 17 Feb 2025 10:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoV-00000004EGu-3KIY
	for kvm-riscv@bombadil.infradead.org;
	Mon, 17 Feb 2025 10:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=; b=lL2qa1nWBws7G1ezP4pFS0NJVI
	pQ5Tn27ShjoOgumhmiiefvWfVhFITTArtoqlzrJ+hYL57bQwTBNbl2ABAa0lkSDvsm4vRDHReKRiD
	IcRd71hX55VRdUNa1uP5vP4Sozk2L0+M/w95+o3pLXvUYPbkSO7WBC291ncIOivCz57ouTcbuxKqh
	oFV1lKv6WHNlfj/D1S9YeGuXHjCRW6ZJkgMv70EpmN+k6DUNp0aMsJLC1itLwlnE8fBlGM5twSgUH
	JXPWFM4Wzb74n0oPou8IB5L9CAfcSAgOIRjMAoJLs7xghRLzsVjNrPZahOgcRvE5eggtlvZMrdEfs
	VStRvZXA==;
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyoS-00000001mZv-3uHT
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 10:57:22 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d19f5ce8a0so7984345ab.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 02:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1739789838; x=1740394638; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=;
        b=YzM8uNsZ+1ynOF12/GWkHDJfBAaw4dDcFkPisJCYqW38BVimFLXQurmHu7h75+1mSz
         k0GIDLmj2L82ZMQTG2XAfaUo7UksqPn8Mz8Tc+KODuYw8bzj9J13ij40JQmWVDaVP4Ob
         jvoUmpptLFcTjMe+etVBT1Irley14xSw0Tj0CHuFkDXTe0JV+DchqjSkAhcX97cIHwSU
         yanN/pCwo+l/zuHNw82uOW4nk04RGbOY+gDgeYR1gGi+bi4ZpTrjOYeUpOYFKRwxIZ5E
         5eob8kbPUB9b1VUcoae8KucUhRI9RLIysMEmZcImnO/RbKUvV+6yoF6HEaNaDyQjKt43
         957g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789838; x=1740394638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsTtMyTsJbWMVKOlmUKSf/JarHtELa1O22QRRoXh8xk=;
        b=do7y7bAmaGOT3tzwboPg0IgqoZdiBoEmWX8BHT6NtqkC/hqdQJ3+2x612eS130maWN
         4+VX+fxR7J+VWDxR3VDuHW2CsEldm3hx41gTEfSonGgmxkQRUrN0prJaaqNnmHqa9hA5
         ZiaanPY6a+Aio4cywTiQi+qThENs0BnqvIDZn3/UM/SaaJHEjMNNB4JIe79nVjmc6u+B
         cEn0f5U9rtbDdeMO4L/MJEEn3rbbmHoZYYHe7zeBF/+uAAFyADVG0mRcT5sUdDFkuSjy
         OBwHrUXjRQwZfGCyG9nOJrQltQKCUDysXD/NS5WTSn8aOwiCUEDK7CxE9BTnVJe+ihWa
         gM1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUHC8knOSaU9F4UkuGLqVouevb3eMJm5UP45b1hUBIoBOV5XfAEss+uMQLD9vC8KyUA7j1/HBnp24=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo1qzqB2lTFv20itUzh1qhDcTXBz2iF/6FbidFr0jtsBaS5aGk
	LYgvVwPMi/oqQOJWu6PBJGy7L84V5FcgVqDOsa92lSsu5kDVh/OhYc697ET3vvnxTCw0kJPjN1u
	f7/jhaSKft+70TkZW3Bi++ka0y1WjRNJWRbfFAA==
X-Gm-Gg: ASbGncurtBJuljVr/4jFNrhxSlETVNlBi+JlyxG8ycOWOSZdqzUlPNO2UwaWFuLliCY
	NcIzvq5tZZRY6MVgp8i+i6s5lV6NpxvL5U0vuuFa1NcR9TkV5kcTD2dggqBKJOI5n5MoAQ2sHdA
	==
X-Google-Smtp-Source: AGHT+IF4wt3+bCr8smM4abSpg9jynt5wH6JghaDNkG3zGRYN1zSsdl+CZBbn8XESByuGwGBk4yMvzbUqkz5buCnYAwM=
X-Received: by 2002:a05:6e02:20cf:b0:3d1:a3d0:d064 with SMTP id
 e9e14a558f8ab-3d281755de7mr70090045ab.0.1739789837889; Mon, 17 Feb 2025
 02:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20250217084506.18763-7-ajones@ventanamicro.com> <20250217084506.18763-12-ajones@ventanamicro.com>
In-Reply-To: <20250217084506.18763-12-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Feb 2025 16:27:07 +0530
X-Gm-Features: AWEUYZlXyegh4HuBYLBwZJ9Tly4L0bQenOk0JsQZ_Py81_lO9EAqEQBtXwOwjmo
Message-ID: <CAAhSdy23nJq4Uj9amQ9T4iXtNoCSFLnOjjyp7pm6KdNbH7xkmA@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: KVM: Fix SBI sleep_type use
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, cleger@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_105721_141735_B9CAA9D1 
X-CRM114-Status: GOOD (  14.91  )
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

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMjoxNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHNwZWMgc2F5cyBzbGVlcF90eXBlIGlzIDMy
IGJpdHMgd2lkZSBhbmQgIkluIGNhc2UgdGhlIGRhdGEgaXMKPiBkZWZpbmVkIGFzIDMyYml0IHdp
ZGUsIGhpZ2hlciBwcml2aWxlZ2Ugc29mdHdhcmUgbXVzdCBlbnN1cmUgdGhhdCBpdAo+IG9ubHkg
dXNlcyAzMiBiaXQgZGF0YS4iIE1hc2sgb2ZmIHVwcGVyIGJpdHMgb2Ygc2xlZXBfdHlwZSBiZWZv
cmUKPiB1c2luZyBpdC4KPgo+IEZpeGVzOiAwMjNjMTUxNTFmYmIgKCJSSVNDLVY6IEtWTTogQWRk
IFNCSSBzeXN0ZW0gc3VzcGVuZCBzdXBwb3J0IikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfc3lzdGVtLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfc3lzdGVtLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zeXN0ZW0uYwo+
IGluZGV4IDVkNTVlMDg3OTFmYS4uYmMwZWJiYTg5MDAzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX3N5c3RlbS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlf
c3lzdGVtLmMKPiBAQCAtNCw2ICs0LDcgQEAKPiAgICovCj4KPiAgI2luY2x1ZGUgPGxpbnV4L2t2
bV9ob3N0Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC93b3JkcGFydC5oPgo+Cj4gICNpbmNsdWRlIDxh
c20va3ZtX3ZjcHVfc2JpLmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gQEAgLTE5LDcgKzIw
LDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9zdXNwX2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+Cj4gICAgICAgICBzd2l0Y2ggKGZ1bmNpZCkg
ewo+ICAgICAgICAgY2FzZSBTQklfRVhUX1NVU1BfU1lTVEVNX1NVU1BFTkQ6Cj4gLSAgICAgICAg
ICAgICAgIGlmIChjcC0+YTAgIT0gU0JJX1NVU1BfU0xFRVBfVFlQRV9TVVNQRU5EX1RPX1JBTSkg
ewo+ICsgICAgICAgICAgICAgICBpZiAobG93ZXJfMzJfYml0cyhjcC0+YTApICE9IFNCSV9TVVNQ
X1NMRUVQX1RZUEVfU1VTUEVORF9UT19SQU0pIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXRkYXRhLT5lcnJfdmFsID0gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgICAgICAgICB9Cj4gLS0KPiAyLjQ4LjEKPgoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
