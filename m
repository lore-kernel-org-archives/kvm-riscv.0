Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082E0CA0ED1
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QL4VXijI9v+7++/C9F/IylYq14T3rAvQ95daxG63zeM=; b=JVoiw8rEs9klu2
	DRV/abSyfRhvufrsOymDvnCotS+puudmGY3bDgqD232oW5Ft+bbL/F80tNtGRA7avIKA0f0N+7Oay
	dOafWn834jNdrpG4PkU1dqkyxZ/GMXAzfhPAD7P9eHTfwXau6s0Tus8dF4yTZtbDX4yg9BQlrntf3
	yTgsNjNsKmmRV6kZrK8fhxXgVU5YjIn9OwjJyNZWk7OOhztH5zZUKKTPAl3/1QyUTcYRzX/1DHIG6
	TNGcY9sDOIKI/DyJ1TNLaUqSBNZluPpUXkfb8609Y0p9uumwgEAd5mUMh3QvclmA9rT3R8Sww703y
	CtM0S7/4D6WfwfRYD0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufb-00000006rDe-17kb;
	Mon, 18 Aug 2025 07:52:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unuYv-00000006oHE-32LN;
	Mon, 18 Aug 2025 07:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C9EE601EC;
	Mon, 18 Aug 2025 07:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8460C4AF09;
	Mon, 18 Aug 2025 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755503148;
	bh=f5gFJWZNQokzZOq71ViHREuQpbfVbZrgOrUABXKAViM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ffsh8y/O2JaZVNiMDIHY6BS5ex3bNjgqkeVeRgHjjgOrXt/CKunYwGK+7E+KZr+Wj
	 A/7JOszRNc/HY8nA69woYUxdbkEtCzGDoZpAxbNELAgAKWEK7+8o05C0dTIgSdZDR2
	 hSWufsu7FkJwAgMl4nobHGwul506MVUmFvN83RsimrHJDPG2O27L2zq4R6H5OTr0QB
	 0NIDBNW9ZGZFNRwAQRpHGhnLrENgoVosGVy6uiZxMOx/zQKaAJFcv9mGzQVkfdkNQw
	 BZyDxO1LMmyDWyq9e241PkiTNzMu/WbkvL60XM4i/GsftrbiI/fNaYYmeem9e4k7PU
	 AVPqZ1djdeiEw==
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e4193083so3616353f8f.3;
        Mon, 18 Aug 2025 00:45:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNLHpStH0lbWBHB3thO5uLEB9D2eNDN2/8QeAhNAIpAxNlECOcy6AXDvYmcypvzq+q90S1BQ6lBwesUOk=@lists.infradead.org, AJvYcCXw/tWbqrEi5rPS7VSEEssfGzcOz8PDeGlcHEBI6XF8m28Z49PWjB4zsJy6xefrvXJuAcKMkqixwBI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXRtwbV/+fGwlTSYtccPw0veozRkpZHEpw5q7wEerjpBqsflXN
	yLiiKLGbWG+gfTajP4EYnMNr1pcKjQjyTsxzrbYF/1oKnFVhVc3flBGI+NS/E6s8drnoo4kuUit
	wHNfz5UKmzI9vTW69JVhme2Wno5/AUEI=
X-Google-Smtp-Source: AGHT+IGB7LkhStNqvvKRj/omAM1mb4ypfuPD4iQ0j12D2cQIIBZbw8yOGFfbBk4SzXwHAZG+XPtcy3nV7EaiWd9UgmY=
X-Received: by 2002:a5d:5887:0:b0:3b9:15eb:6464 with SMTP id
 ffacd0b85a97d-3bb66f11537mr8108831f8f.15.1755503147364; Mon, 18 Aug 2025
 00:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250818054207.21532-1-fangyu.yu@linux.alibaba.com> <CAJF2gTTqPMVTNdHL7PUwobXQr3dwzKPi13ZDpmkVz+3VXHLZVw@mail.gmail.com>
In-Reply-To: <CAJF2gTTqPMVTNdHL7PUwobXQr3dwzKPi13ZDpmkVz+3VXHLZVw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 18 Aug 2025 15:45:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
X-Gm-Features: Ac12FXzzM0il7f9K7PUzED9HklQztO75B3sc-fXWfkPu4ViWfodFZHTR1W6vw-E
Message-ID: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
Subject: Re: [PATCH V2] RISC-V: KVM: Write hgatp register with valid mode bits
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	guoren@linux.alibaba.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgMjoxN+KAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgQXVnIDE4LCAyMDI1IGF0IDE6NDLigK9QTSA8ZmFuZ3l1
Lnl1QGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8gdGhlIFJJU0Mt
ViBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSBTcGVjLCB3aGVuIE1PREU9QmFyZQo+ID4gaXMgc2Vs
ZWN0ZWQsc29mdHdhcmUgbXVzdCB3cml0ZSB6ZXJvIHRvIHRoZSByZW1haW5pbmcgZmllbGRzIG9m
IGhnYXRwLgo+ID4KPiA+IFdlIGhhdmUgZGV0ZWN0ZWQgdGhlIHZhbGlkIG1vZGUgc3VwcG9ydGVk
IGJ5IHRoZSBIVyBiZWZvcmUsIFNvIHVzaW5nIGEKPiA+IHZhbGlkIG1vZGUgdG8gZGV0ZWN0IGhv
dyBtYW55IHZtaWQgYml0cyBhcmUgc3VwcG9ydGVkLgo+IEdvb2QgY2F0Y2ghIEl0J3MgYSBidWcu
IFRoZSBjb2RlIHNlZW1zIGNvcGllZCBmcm9tIGFzaWRzX2luaXQoKSwgd2hvc2UKPiBvbGQgdmFs
dWUgaXMgbm90IGJhcmUgbW9kZS4gRm9yIHJlYWwgaGFyZHdhcmUsIGl0IHdvdWxkIGNhdXNlCj4g
cHJvYmxlbXMsIGJ1dCB0aGUgcWVtdSBidWdneSBjb2RlIGhpZGVzIHRoZSBwcm9ibGVtLgo+Cj4g
SXQgbmVlZHMgYSB0YWc6IEZpeGVzOiBmZDdiYjRhMjUxZGYgKCJSSVNDLVY6IEtWTTogSW1wbGVt
ZW50IFZNSUQgYWxsb2NhdG9yIikKPgo+IE90aGVycywgUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJlbmwub3JnPgoKU29ycnkgZm9yIHRoZSB0eXBvOgpSZXZpZXdlZC1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFu
Z3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gLS0tCj4gPiBDaGFu
Z2VzIGluIHYyOgo+ID4gLSBGaXhlZCBidWlsZCBlcnJvciBzaW5jZSBrdm1fcmlzY3ZfZ3N0YWdl
X21vZGUoKSBoYXMgYmVlbiBtb2RpZmllZC4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zt
aWQuYyB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bWlkLmMgYi9hcmNo
L3Jpc2N2L2t2bS92bWlkLmMKPiA+IGluZGV4IDNiNDI2YzgwMDQ4MC4uNWYzMzYyNWY0MDcwIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92bWlkLmMKPiA+IEBAIC0xNCw2ICsxNCw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4L3Nt
cC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5oPgo+ID4gICNpbmNsdWRlIDxhc20v
Y3NyLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9rdm1fbW11Lmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9r
dm1fdGxiLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9rdm1fdm1pZC5oPgo+ID4KPiA+IEBAIC0yOCw3
ICsyOSw3IEBAIHZvaWQgX19pbml0IGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9kZXRlY3Qodm9pZCkK
PiA+Cj4gPiAgICAgICAgIC8qIEZpZ3VyZS1vdXQgbnVtYmVyIG9mIFZNSUQgYml0cyBpbiBIVyAq
Lwo+ID4gICAgICAgICBvbGQgPSBjc3JfcmVhZChDU1JfSEdBVFApOwo+ID4gLSAgICAgICBjc3Jf
d3JpdGUoQ1NSX0hHQVRQLCBvbGQgfCBIR0FUUF9WTUlEKTsKPiA+ICsgICAgICAgY3NyX3dyaXRl
KENTUl9IR0FUUCwgKGt2bV9yaXNjdl9nc3RhZ2VfbW9kZSA8PCBIR0FUUF9NT0RFX1NISUZUKSB8
IEhHQVRQX1ZNSUQpOwo+ID4gICAgICAgICB2bWlkX2JpdHMgPSBjc3JfcmVhZChDU1JfSEdBVFAp
Owo+ID4gICAgICAgICB2bWlkX2JpdHMgPSAodm1pZF9iaXRzICYgSEdBVFBfVk1JRCkgPj4gSEdB
VFBfVk1JRF9TSElGVDsKPiA+ICAgICAgICAgdm1pZF9iaXRzID0gZmxzX2xvbmcodm1pZF9iaXRz
KTsKPiA+IC0tCj4gPiAyLjQ5LjAKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBS
ZW4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
