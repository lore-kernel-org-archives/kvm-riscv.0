Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2BCA0EE6
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLbGn3m4wk5miisRwQToN66VdqBo2lH7Nb1ayFoKmi4=; b=xcoKe51cx13W4E
	feddsjEZhKKDwmTzPAw0n+GATsrOQi/FQqtRN0WGYGOTCZgXjC1vJvET8G70YnBNZ5hTOfng3PPMz
	RgB7COB2PTZ8+wa2MSl9CXsDrkQywFjs4MtmH9z3kaR4eVr1Y24pfpRfy1pTLGo4R7aCKBC6+e5qy
	Nncd1JDArk1fL1/5bwBBd+d8QNTyM2Y5DWzGJ+kWeG/XqRy2sCL/gwC1GjjzBZAD/kFVmaaTYG84Q
	NSWk3zm2KWhxvHuGt9w+YFtzwoT0Or0fgfVpGieP6i42WK39HDR1hsy9c98zBVO+zketnYslrl3je
	t4WUxgB/KjjH+1genxVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow88-0000000FeV8-2gd0;
	Thu, 21 Aug 2025 03:38:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotsS-0000000FPSJ-1hQu;
	Thu, 21 Aug 2025 01:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBA8641976;
	Thu, 21 Aug 2025 01:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4DEC4CEEB;
	Thu, 21 Aug 2025 01:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755738841;
	bh=45NXROLhzFWPchWEfmo+8RdCuCIUFvLMSvkuiR//zk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AV2O85AWad5xKprLZOTLbAOBXZOAckbHAQUSDaQYLVQvbVAes6PrpXuUcvbs3QtB8
	 BgGv2EZTC2/1U020NEKuQXtZc4ZI+PsM6bAxLSTvcpzfOMLUk8Ctz0U/dht5MYivJh
	 DH5dngak565O0ISJSOuj9vdNYTbK9sr613Z7kZCPaYmljzLfEFwEfM7XK3BLHaD72y
	 Ut+oH9mh7w542Mjz0ku+Lmlul9ycBp703J0IRJXsiYM9zTOipts2cut1LtpKmDFYfU
	 IjEB8dEwh/eNwL+yelFy/KBhiuOg53vex3BMPo4zEY0MrghY9fZds2LFVDruWSi7mZ
	 Cuvk3FnYA5Vgg==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so363409f8f.0;
        Wed, 20 Aug 2025 18:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUztoJpRA1KgzDKXmzm3KhOwzvtIuC+j/0EgSndwS1Nzs4eWPBTupJugNcZOBoa2UoO3cNTMAfgDAEQB8M=@lists.infradead.org, AJvYcCX2flFIVSVXyxL/Nb7OKniszSzTUozMmZl/0cTIDKnWkb6fe4g6siudK7Tv/J78RLrxH3Vz11cWx60=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBgJXAFQjTyrRn52/lr0TtEooWDyt36pIYQmS142eGWve3ncBk
	MIfNRphc/pYyIXIMeI5phrZud5I3p1u7b+doeKHyuwqzHarLBkU7i4Or/086DIf/9Ycy+gUfkhl
	1aSD3qcO4XzGmPg8+P0Q06EZWZ3angSg=
X-Google-Smtp-Source: AGHT+IHZN+pvmQenAfdScnxdgIeND2pxNhMesffXW4PF/YmXxHES0fVAha8XrYgyDwwnSOqPLvKrtGhubH5RGQQu4jQ=
X-Received: by 2002:a5d:5f42:0:b0:3b7:9dc1:74a5 with SMTP id
 ffacd0b85a97d-3c4962226d5mr440951f8f.52.1755738840191; Wed, 20 Aug 2025
 18:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
 <20250820125952.71689-3-fangyu.yu@linux.alibaba.com> <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
In-Reply-To: <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 21 Aug 2025 09:13:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRBpCj+ToxMMTD9w9fkPHvF=SXNm8mJOUAP_J7RUywxuQ@mail.gmail.com>
X-Gm-Features: Ac12FXyrfWTEOIumNm2zK1RJwo1sCg6Y71V-rBfVkEDGBWsArsLczQzhQ0Kly3w
Message-ID: <CAJF2gTRBpCj+ToxMMTD9w9fkPHvF=SXNm8mJOUAP_J7RUywxuQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] RISC-V KVM: Remove unnecessary HGATP csr_read
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_181404_481841_80A6C43B 
X-CRM114-Status: GOOD (  24.67  )
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

T24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMTA6NDDigK9QTSBUcm95IE1pdGNoZWxsIDx0cm95Lm1p
dGNoZWxsQGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBXZWQsIEF1ZyAyMCwgMjAyNSBhdCAwODo1
OTo1MlBNICswODAwLCBmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20gd3JvdGU6Cj4gPiBGcm9t
OiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4g
Pgo+ID4gVGhlIEhHQVRQIGhhcyBiZWVuIHNldCB0byB6ZXJvIGluIGdzdGFnZV9tb2RlX2RldGVj
dCgpLCBzbyB0aGVyZQo+ID4gaXMgbm8gbmVlZCB0byBzYXZlIHRoZSBvbGQgY29udGV4dC4gVW5p
ZnkgdGhlIGNvZGUgY29udmVudGlvbgo+ID4gd2l0aCBnc3RhZ2VfbW9kZV9kZXRlY3QoKS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGlu
dXguYWxpYmFiYS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92bWlkLmMgfCA1ICst
LS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bWlkLmMgYi9hcmNoL3Jpc2N2L2t2
bS92bWlkLmMKPiA+IGluZGV4IDVmMzM2MjVmNDA3MC4uYWJiMWMyYmYyNTQyIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdm1pZC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92bWlk
LmMKPiA+IEBAIC0yNSwxNSArMjUsMTIgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyh2bWlkX2xv
Y2spOwo+ID4KPiA+ICB2b2lkIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfZGV0ZWN0KHZv
aWQpCj4gPiAgewo+ID4gLSAgICAgdW5zaWduZWQgbG9uZyBvbGQ7Cj4gPiAtCj4gPiAgICAgICAv
KiBGaWd1cmUtb3V0IG51bWJlciBvZiBWTUlEIGJpdHMgaW4gSFcgKi8KPiA+IC0gICAgIG9sZCA9
IGNzcl9yZWFkKENTUl9IR0FUUCk7Cj4gPiAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCAoa3Zt
X3Jpc2N2X2dzdGFnZV9tb2RlIDw8IEhHQVRQX01PREVfU0hJRlQpIHwgSEdBVFBfVk1JRCk7Cj4g
PiAgICAgICB2bWlkX2JpdHMgPSBjc3JfcmVhZChDU1JfSEdBVFApOwo+ID4gICAgICAgdm1pZF9i
aXRzID0gKHZtaWRfYml0cyAmIEhHQVRQX1ZNSUQpID4+IEhHQVRQX1ZNSURfU0hJRlQ7Cj4gPiAg
ICAgICB2bWlkX2JpdHMgPSBmbHNfbG9uZyh2bWlkX2JpdHMpOwo+ID4gLSAgICAgY3NyX3dyaXRl
KENTUl9IR0FUUCwgb2xkKTsKPiA+ICsgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIDApOwo+IElz
IHNldHRpbmcgSEdBVFAgdG8gMCBpbiBnc3RhZ2VfbW9kZV9kZXRlY3QgbWVhbmluZ2xlc3Mgbm93
PwpJdCdzIG5vdCBtZWFuaW5nbGVzcywgaXQgbWVhbnMga2VlcCBoZ2F0cCBvZmYuIENTUl9IR0FU
UCBpcyBzZXQgdG8gMApieSBnc3RhZ2VfbW9kZV9kZXRlY3QoKSwgYnV0IHRoYXQncyBhbm90aGVy
IGluZGVwZW5kZW50IGZ1bmN0aW9uIHdob3NlCmNvaW5jaWRlbmNlIGlzIHNldCB0byAwLiBBbmQg
aW4gdGhhdCBmdW5jdGlvbiwgd2UgdXNlCiJjc3Jfd3JpdGUoQ1NSX0hHQVRQLCAwKSIsIGJ1dCBo
ZXJlIHdlIGNoYW5nZSB0byBjb25mdXNpbmcgc2F2ZV9vbGQgJgpyZXN0b3JlX29sZCBjb2Rpbmcg
Y29udmVudGlvbj8KClNvLCBrZWVwIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9kZXRlY3QoKSBjb2Rp
bmcgY29udmVudGlvbiBjbGVhci4gV2UKc2hvdWxkIGZvbGxvdyB0aGUgc2FtZSBhcHByb2FjaCBh
cyBnc3RhZ2VfbW9kZV9kZXRlY3QoKSwgdGhhdCBpcywKImNzcl93cml0ZShDU1JfSEdBVFAsIDAp
Ii4KCiAtIFRoZSBmaXJzdCBwYXRjaCBpcyBmb2N1c2VkIG9uIGZpeGluZyBtZWFuaW5nLCBzbyBr
ZWVwIHRoZSBtaW5pbXVtCm1vZGlmaWNhdGlvbnMsIG5vIGNvZGluZyBjb252ZW50aW9uIGNsZWFu
dXAuCiAtIFRoZSBzZWNvbmQgb25lIGlzIGFib3V0IGNvZGluZyBjb252ZW50aW9uLCB3aGljaCBp
cyBubyBuZWVkIHRvIENjOgpzdGFibGVAa2VybmVsLm9yZwoKSG9wZSB0aGUgYWJvdmUgZXhwbGFu
YXRpb24gbWFrZXMgc2Vuc2UuCgo+IElmIHNvLCBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gZHJvcCBp
dCBhbmQganVzdCBrZWVwIHRoZSBvbmUgaGVyZS4KPgo+ICAgICAgICAgICAgICAgICAtIFRyb3kK
Pgo+ID4KPiA+ICAgICAgIC8qIFdlIHBvbGx1dGVkIGxvY2FsIFRMQiBzbyBmbHVzaCBhbGwgZ3Vl
c3QgVExCICovCj4gPiAgICAgICBrdm1fcmlzY3ZfbG9jYWxfaGZlbmNlX2d2bWFfYWxsKCk7Cj4g
PiAtLQo+ID4gMi40OS4wCj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
