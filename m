Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992DC61CE8
	for <kvm-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoWKtVEgzx28buCPODZ8xk0J7PyWwSRX8d2p5cGftjE=; b=EJNgM8Dx3mNaie
	9AHOBwzTiTW+JxosQhAhmPrHtFqUYQ3S5mHnfYOqCA6nrlNv1blzSwtkQI8rX1LUuwNgKEmXOvGj4
	B80WmYERf5OUIvz1hmpHGFjJpwY3H1IEN+/9BRrGBJ+NRWcSnHsNEJ6MlR43weUZYm5KF5YGhRP4B
	8VWP4Tg922uWkdW4mU0Q1iodh08td30baWCjRSYS+JaTnsDF/dCziQlBJLitQkxrNsJgQLoxy6gft
	bnavnw+sqITgVlOXewLyaQtU7M/DXj8Ls1NZ3Hl6LjHT5UKQTI8UbrlPro3S2mPelnd6j9Xu3Be/o
	Idj87YYBCQ2UY3gevaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqCq-00000002eXY-1E0q;
	Sun, 15 Jun 2025 16:27:40 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQqCo-00000002eWq-08tH
	for kvm-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 16:27:39 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553a4f3ae42so3196025e87.3
        for <kvm-riscv@lists.infradead.org>; Sun, 15 Jun 2025 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750004856; x=1750609656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1cLVyVDfZ4m9C6IXP3marLwW8jsCdan5/7A3Ogl53Q=;
        b=GJsAsTbThjgUgmLf879HbFLGOfrP9QV1Sa3IAgaZA/0JDBqXgX1Bw6CK/bqMTfFngg
         +vE8zvQ9FBm7MwGmXF/Jzrv+J96A7LPtAZIjzdikWSXbKhC+axxtKuVsD1Ki+qKenNcB
         PN9y+Y3xPLjjZZr3GklBB9JVHNQLyceBwAKYHroSw9Hk+fFDbLz8RtcJqJMmQAaAo7+m
         6wDV9l2utDxJh1DYbWo+KQUpQddSOuCREsVALH1jjzZ1eRwIRKk/3z6N7OPEsNvEfkbw
         be6UbEep0KhE5CoZlFEDlgm4KyvRS9Jggjo3zCpZnL9a6m/7YchAsoBZWgg7oQujyQmX
         4SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750004856; x=1750609656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1cLVyVDfZ4m9C6IXP3marLwW8jsCdan5/7A3Ogl53Q=;
        b=clzXY0qmf8PcmTxKzGOav6ZtubUSWySUQruoLpTIOgLxyiv7Ecw8BuRrkcDKwUz6p5
         NCGS9glGsYSDw29BfJmfBju5ByFE3u/S2IuBdq7K2tzERtRRrVSwPkLB9hFKXCDoLDQ/
         wjju+1yYlf2BtCynAilnlvLbikDKn19E6ksYDW3XCrB2XHqTIluv4JoNukBDNjQo3vor
         xWA1HK0gY4RphXiQLQyVkulK2k5xx2PgjBZ7knPMEDg/D7DtoGFX2FKaYZ+/gz/Vdrkx
         jwexYXfWBhPlxKkjoCRKotTMcckh69h98jiK4JjUfjIKI/+RJfm2Vtl2RFRvyJ3lOOI+
         7UFw==
X-Forwarded-Encrypted: i=1; AJvYcCUbBbM53zIOR4qlexK/uKktL1DVLjsnqiSYBbnBOitwEnkNlVgwUj5AWiCjNm7E466j5JyT5LPiPOc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+0NEW4yYJ4sIiSZjfOcR66IqrsBgZv4C+zTP2ZhbM/jqU6EwG
	jqZa1gc3f3EcStWf+9vVkPVowK8RVkOabO27d5DiFfPu2W6EvKEYYtSoAssEEPY8kk6aM5dkxlV
	alvvM6wWxekAfitPgE0ViK7v0o/SPON7vKmNSHB6quw==
X-Gm-Gg: ASbGnctY6OSugKN5QRMnZmugJfTe0gW+Gu79K6ldU3l+vHgfRRoiiZ65gMWLWEQz+tc
	JkMBYepbqmJHoY5dVE4jZNw5/lGd7RWatqW8ONXNueQKKC0+lJPMYSuo7yIDuKvkMFkXN7dotLv
	dHQfPtBl8wNXEo3CM8xcG6n2BZ/lugZmpnyTKSa628VtKB
X-Google-Smtp-Source: AGHT+IG27iDHVZA2qB3JCv0QAqHHgOhAq2gUOxPR4OwMF9vWoPTVi19GyHNwaRYEuHx4MPN8LUP2+ujKbsMT25Bm2I4=
X-Received: by 2002:a05:6512:4016:b0:553:5d00:be8e with SMTP id
 2adb3069b0e04-553b6f25f26mr1437671e87.37.1750004856092; Sun, 15 Jun 2025
 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel> <aEmsIOuz3bLwjBW_@google.com>
 <20250612-70c2e573983d05c4fbc41102@orel> <aEymPwNM59fafP04@google.com>
In-Reply-To: <aEymPwNM59fafP04@google.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 15 Jun 2025 21:57:24 +0530
X-Gm-Features: AX0GCFu98EH_tsj2wvdqU1Sm1PF-PzSfiINPrNNqzKKg_NIskTS5CgcjEFz6-RY
Message-ID: <CAK9=C2WFA+SDt4MCLj0reQnkkA2kxUmfWhT8HZxjT_DdW8W_rQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in kvm_riscv_gstage_map()
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, zhouquan@iscas.ac.cn, anup@brainfault.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_092738_075875_035D925B 
X-CRM114-Status: GOOD (  18.99  )
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

T24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgMzo1OeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDEyLCAyMDI1LCBBbmRyZXcg
Sm9uZXMgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxMSwgMjAyNSBhdCAwOToxNzozNkFNIC0wNzAw
LCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gPiBMb29rcyBsaWtlIHknYWxsIGFsc28g
aGF2ZSBhIGJ1ZyB3aGVyZSBhbiAtRUVYSVNUIHdpbGwgYmUgcmV0dXJuZWQgdG8gdXNlcnNwYWNl
LAo+ID4gPiBhbmQgd2lsbCBnZW5lcmF0ZSB3aGF0J3MgcHJvYmFibHkgYSBzcHVyaW91cyBrdm1f
ZXJyKCkgbWVzc2FnZS4KPiA+Cj4gPiBPbiAzMi1iaXQgcmlzY3YsIGR1ZSB0byBsb3NpbmcgdGhl
IHVwcGVyIGJpdHMgb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3M/IE9yCj4gPiBpcyB0aGVyZSB5ZXQg
YW5vdGhlciB0aGluZyB0byBmaXg/Cj4KPiBBbm90aGVyIGJ1ZywgSSB0aGluay4gIGdzdGFnZV9z
ZXRfcHRlKCkgcmV0dXJucyAtRUVYSVNUIGlmIGEgUFRFIGV4aXN0cywgYW5kIEkKPiBfYXNzdW1l
XyB0aGF0J3Mgc3VwcG9zZWQgdG8gYmUgYmVuaWduPyAgQnV0IHRoaXMgY29kZSByZXR1cm5zIGl0
IGJsaW5kbHk6Cgpnc3RhZ2Vfc2V0X3B0ZSgpIHJldHVybnMgLUVFWElTVCBvbmx5IHdoZW4gaXQg
d2FzIGV4cGVjdGluZyBhIG5vbi1sZWFmClBURSBhdCBhIHBhcnRpY3VsYXIgbGV2ZWwgYnV0IGdv
dCBhIGxlYWYgUFRFIG90aGVyd2lzZSBpdCByZXR1cm5zIDAgaWYgbGVhZiBQVEUKaXMgYXQgZXhw
ZWN0ZWQgbGV2ZWwuIFRoaXMgYWxsb3dzIGdzdGFnZV9zZXRfcHRlKCkgdG8gd29yayB3aGVuIGFu
IGV4aXN0aW5nClBURSBpcyBiZWluZyBtb2RpZmllZC4gSSB0aGluayB0aGUgYmVsb3cgY2hhbmdl
IGlzIG5vdCBuZWVkZWQgdW5sZXNzIEkgYW0KdG90YWxseSBtaXNzaW5nIHNvbWV0aGluZy4KCj4K
PiAgICAgICAgIGlmICh3cml0YWJsZSkgewo+ICAgICAgICAgICAgICAgICBtYXJrX3BhZ2VfZGly
dHkoa3ZtLCBnZm4pOwo+ICAgICAgICAgICAgICAgICByZXQgPSBnc3RhZ2VfbWFwX3BhZ2Uoa3Zt
LCBwY2FjaGUsIGdwYSwgaGZuIDw8IFBBR0VfU0hJRlQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2bWFfcGFnZXNpemUsIGZhbHNlLCB0cnVlKTsKPiAgICAgICAgIH0g
ZWxzZSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IGdzdGFnZV9tYXBfcGFnZShrdm0sIHBjYWNo
ZSwgZ3BhLCBoZm4gPDwgUEFHRV9TSElGVCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZtYV9wYWdlc2l6ZSwgdHJ1ZSwgdHJ1ZSk7Cj4gICAgICAgICB9Cj4KPiAgICAg
ICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAgIGt2bV9lcnIoIkZhaWxlZCB0byBtYXAgaW4g
Ry1zdGFnZVxuIik7Cj4KPiBvdXRfdW5sb2NrOgo+ICAgICAgICAga3ZtX3JlbGVhc2VfZmF1bHRp
bl9wYWdlKGt2bSwgcGFnZSwgcmV0ICYmIHJldCAhPSAtRUVYSVNULCB3cml0YWJsZSk7Cj4gICAg
ICAgICBzcGluX3VubG9jaygma3ZtLT5tbXVfbG9jayk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+
Cj4gYW5kIGdzdGFnZV9wYWdlX2ZhdWx0KCkgZm9yd2FyZHMgbmVnYXRpdmUgcmV0dXJuIGNvZGVz
Ogo+Cj4gICAgICAgICByZXQgPSBrdm1fcmlzY3ZfZ3N0YWdlX21hcCh2Y3B1LCBtZW1zbG90LCBm
YXVsdF9hZGRyLCBodmEsCj4gICAgICAgICAgICAgICAgICh0cmFwLT5zY2F1c2UgPT0gRVhDX1NU
T1JFX0dVRVNUX1BBR0VfRkFVTFQpID8gdHJ1ZSA6IGZhbHNlKTsKPiAgICAgICAgIGlmIChyZXQg
PCAwKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gYW5kIHNvIGV2ZW50dWFsbHkg
LUVFWElTVCB3aWxsIHByb3BhZ2F0ZSB0byB1c2Vyc3BhY2UuCj4KPiBJIGhhdmVuJ3QgbG9va2Vk
IHRvbyBjbG9zZWx5IGF0IHRoZSBSSVNDLVYgTU1VLCBidXQgSSB3b3VsZCBiZSBzdXJwcmlzZWQg
aWYKPiBlbmNvdW50ZXJpbmcgd2hhdCBlbmRzIHVwIGJlaW5nIGEgc3B1cmlvdXMgZmF1bHQgaXMg
Y29tcGxldGVseSBpbXBvc3NpYmxlLgo+Cj4gPiBUaGUgZGlmZiBsb29rcyBnb29kIHRvIG1lLCBz
aG91bGQgSSB0ZXN0IGFuZCBwb3N0IGl0IGZvciB5b3U/Cj4KPiBJZiB5b3UgdGVzdCBpdCwgSSds
bCBoYXBwaWx5IHdyaXRlIGNoYW5nZWxvZ3MgYW5kIHBvc3QgcGF0Y2hlcy4KPgoKUmVnYXJkcywK
QW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
