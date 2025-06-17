Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B675CC7114A
	for <kvm-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 04:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bsvi0XrbC0sYeFtIw9SKPgF0A6krL2mZMsYjF6gkLbY=; b=batAyekWyLSr/X
	2RzTSsdYTSEUStHDVq+2IcyzFQNZg3zqd6whfiPrD82Q5L9HLE1GDz/q1CCld+NfiMDhcgdyare5G
	xQNIo6kKMKOn9h2iDLYPxlUGGry29hxd7x6YBYhYLBPNNMsr9n1QDVuLlVXFRHnECiM9OG5oZgZiO
	QXPM1VtXPXhIoEHx4dCxQ9xsL5Q+vgPaunKw+roJ0Ix3xAohrMz5qCrBrt4MYM9man2P7O7ER4e/a
	Yn2aXFO0+2ksWpWTMs/1U5sOM5vtNHztK34PVkJuVTbt6dWT4Xi8/OmsTSzckedrPRmo0dIIZYUAA
	Lr81W5/vTqjj4zc6Beqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROPZ-00000006DAw-0ahl;
	Tue, 17 Jun 2025 04:59:05 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uROPU-00000006DA9-3jSo
	for kvm-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 04:59:02 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2304674e87.0
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Jun 2025 21:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750136338; x=1750741138; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TabJOmc9YbjjVWqBpFHGZqmoipuAKz7Dqc3oFlaWkHM=;
        b=LjT3Rex+H43FZttPr0O3S1FXDQ64FOmXZxp1Ub5nQyzK/zCEyZXrFI3492CEMLOb7k
         DrpfzsEp0pI7wOLkopwR/25fsDSCybUQx5rlRTKGRPkDhFPScdgGOVCkGIzvDxsjKz5E
         P8YL+l604doAg8fPe8QHsACV5oE4uaNSK1vQrEqetJy6iPH5Hc5SQP1+e74vXhwf60YC
         bDTrYfLODY8zL0G3S6zDDIpS79yItRGEoDA/9hJk1kBw7wmXn8P3TW2/ecwOvFZOHmmZ
         bzO5+ofw54jh5ErmM6hoZEx3HcPsbDfZKKgSA0QOUWVeGUpiVh+eLUSoSvGu80X/sH3/
         NOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136338; x=1750741138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TabJOmc9YbjjVWqBpFHGZqmoipuAKz7Dqc3oFlaWkHM=;
        b=jSzAxWxuIHNLhZg9DjfyVIex8ak9X66F/JOSo679DxhLYYkHeKhkl5bAM9F9ZyXFqa
         XUxTYr9W+b4xlTCxKsxqwUunLRRlkDCOEvcN6BE1y48qHdmkUZu5roxSsSSUH0zWTWgQ
         0jACxe5rvlSTbpwkeeGGqqPFoUjHcGbGT1o12tvJF5rQ2D4+GojAxqMq5TkThQe7StSD
         XvrH/EY+L8ti013pvbiv5UmNzlhQNz7CCoa6Mea/Mk2P/EAzH/WufTxh4WiQrxKTuM8a
         Y2/XS1MZVYXn1hkwkYy++2Sn2rHBRJBFgo9KsLm5yHRRZijmkFQCsmgdS+ZKYlso9Q9O
         XY0w==
X-Forwarded-Encrypted: i=1; AJvYcCWdGCh3gjEOMS/nSd+vDadYogAvuw8PSYQzmtqhnK5+2y+j/LGTdYEGID7lqwoW8ghdrGTAdXUM6mg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSnBRc7bfMR5bNKM3MUwKCEnx61cip3HzkiTSKJqfHpRmecETI
	y3Lc06i7dhzQJ5PP46htwBD2nplfEZ/CuVUIOUhPHpzHbZFkkvJIDQ17VCP/hdyIp7bvhJ+Jq23
	aaEH0iCZKSha5jsJgZZTTrIJB5nyOUzyeY3IU4tpbLg==
X-Gm-Gg: ASbGncvCKKkFHIKOStl/PvL1VfBE08uRzFVxCbS+lONTLIdytNltGTtdKuzdznMMECk
	ZVQq2e73v7oar8zIblgukWkB8o57A/yc9C4ZyEFSuix9i2qAMhsMF+ZQWAAPlLJ5w/VBUM83+Fl
	aA5eZNOm/anYpoT513YL/UcuQizIXXJOoQ+Ka7QNuQs5oG
X-Google-Smtp-Source: AGHT+IFH8UXFsAgXaqMjPDngF+lr7LJYJmQ6Doqaj2U7P69oabZRjWW7AlVBQ0Razbz6dxJNJnlmZobYZZyydWbrHDc=
X-Received: by 2002:a05:6512:110d:b0:553:2450:5895 with SMTP id
 2adb3069b0e04-553b6e71411mr3168533e87.4.1750136338338; Mon, 16 Jun 2025
 21:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250613065743.737102-1-apatel@ventanamicro.com>
 <20250613065743.737102-7-apatel@ventanamicro.com> <422c5677-48d1-41be-b128-595829c27167@linux.dev>
In-Reply-To: <422c5677-48d1-41be-b128-595829c27167@linux.dev>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 17 Jun 2025 10:28:45 +0530
X-Gm-Features: AX0GCFvh2GOQL0PlDDoaK4dE-NJWM8cyM_PZVHGF4_9faoB70s17Wy1wHH6F0Fs
Message-ID: <CAK9=C2UQAKk3kVswTzKRG43Ds3T3etfK-45Y+Uv2g3wn+Qg1fg@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_215901_000301_B436CE50 
X-CRM114-Status: GOOD (  22.18  )
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

T24gU2F0LCBKdW4gMTQsIDIwMjUgYXQgNjoxNOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUBsaW51eC5kZXY+IHdyb3RlOgo+Cj4KPiBPbiA2LzEyLzI1IDExOjU3IFBNLCBBbnVwIFBhdGVs
IHdyb3RlOgo+ID4gVGhlIGt2bV9hcmNoX2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKCkgZXhwZWN0
ZWQgYnkgS1ZNIGNvcmUgY2FuIGJlCj4gPiBlYXNpbHkgaW1wbGVtZW50ZWQgZm9yIFJJU0MtViB1
c2luZyBrdm1fcmlzY3ZfaGZlbmNlX2d2bWFfdm1pZF9ncGEoKQo+ID4gaGVuY2UgcHJvdmlkZSBp
dC4KPiA+Cj4gPiBBbHNvIHdpdGgga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UoKSBh
dmFpbGFibGUgZm9yIFJJU0MtViwgdGhlCj4gPiBtbXVfd3BfbWVtb3J5X3JlZ2lvbigpIGNhbiBo
YXBwaWx5IHVzZSBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfbWVtc2xvdCgpCj4gPiBpbnN0ZWFkIG9m
IGt2bV9mbHVzaF9yZW1vdGVfdGxicygpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaCB8IDIgKysKPiA+ICAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAg
ICAgICAgICAgIHwgMiArLQo+ID4gICBhcmNoL3Jpc2N2L2t2bS90bGIuYyAgICAgICAgICAgICAg
fCA4ICsrKysrKysrCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+IGluZGV4IGZm
MWY3NmQ2ZjE3Ny4uNjE2MjU3NWUyMTc3IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmgKPiA+IEBAIC00Myw2ICs0Myw4IEBACj4gPiAgICAgICBLVk1fQVJDSF9SRVFfRkxBR1Mo
NSwgS1ZNX1JFUVVFU1RfV0FJVCB8IEtWTV9SRVFVRVNUX05PX1dBS0VVUCkKPiA+ICAgI2RlZmlu
ZSBLVk1fUkVRX1NURUFMX1VQREFURSAgICAgICAgICAgICAgICBLVk1fQVJDSF9SRVEoNikKPiA+
Cj4gPiArI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RMQlNfUkFOR0UKPiA+
ICsKPiA+ICAgI2RlZmluZSBLVk1fSEVERUxFR19ERUZBVUxUICAgICAgICAgKEJJVChFWENfSU5T
VF9NSVNBTElHTkVEKSB8IFwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEJJVChFWENfQlJFQUtQT0lOVCkgICAgICB8IFwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEJJVChFWENfU1lTQ0FMTCkgICAgICAgICB8IFwKPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gPiBp
bmRleCAyOWYxYmQ4NTNhNjYuLmE1Mzg3OTI3YTFjMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ID4gQEAgLTM0NCw3
ICszNDQsNyBAQCBzdGF0aWMgdm9pZCBnc3RhZ2Vfd3BfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3Zt
ICprdm0sIGludCBzbG90KQo+ID4gICAgICAgc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiA+
ICAgICAgIGdzdGFnZV93cF9yYW5nZShrdm0sIHN0YXJ0LCBlbmQpOwo+ID4gICAgICAgc3Bpbl91
bmxvY2soJmt2bS0+bW11X2xvY2spOwo+ID4gLSAgICAga3ZtX2ZsdXNoX3JlbW90ZV90bGJzKGt2
bSk7Cj4gPiArICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfbWVtc2xvdChrdm0sIG1lbXNsb3Qp
Owo+ID4gICB9Cj4gPgo+ID4gICBpbnQga3ZtX3Jpc2N2X2dzdGFnZV9pb3JlbWFwKHN0cnVjdCBr
dm0gKmt2bSwgZ3BhX3QgZ3BhLAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3RsYi5j
IGIvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiA+IGluZGV4IGRhOThjYTgwMWQzMS4uZjQ2YTI3NjU4
YzJlIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdGxiLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3RsYi5jCj4gPiBAQCAtNDAzLDMgKzQwMywxMSBAQCB2b2lkIGt2bV9yaXNjdl9o
ZmVuY2VfdnZtYV9hbGwoc3RydWN0IGt2bSAqa3ZtLAo+ID4gICAgICAgbWFrZV94ZmVuY2VfcmVx
dWVzdChrdm0sIGhiYXNlLCBobWFzaywgS1ZNX1JFUV9IRkVOQ0VfVlZNQV9BTEwsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEtWTV9SRVFfSEZFTkNFX1ZWTUFfQUxMLCBOVUxMKTsKPiA+
ICAgfQo+ID4gKwo+ID4gK2ludCBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1
Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTY0IG5yX3BhZ2VzKQo+ID4gK3sKPiA+ICsgICAgIGt2
bV9yaXNjdl9oZmVuY2VfZ3ZtYV92bWlkX2dwYShrdm0sIC0xVUwsIDAsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuIDw8IFBBR0VfU0hJRlQsIG5yX3BhZ2VzIDw8
IFBBR0VfU0hJRlQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFH
RV9TSElGVCk7Cj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4KPiBMR1RNLiBIb3dldmVyLCBJ
IG5vdGljZWQgdGhhdCBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UgZG9lc24ndAo+IGluY3Jl
bWVudCByZW1vdGVfdGxiX2ZsdXNoX3JlcXVlc3RzL3JlbW90ZV90bGJfZmx1c2ggc3RhdCBjb3Vu
dGVyLgo+Cj4gU28gd2Ugd291bGQgYmUgbG9zaW5nIHRob3NlIHN0YXRzIGhlcmUuIERvIHlvdSBr
bm93IGlmIHRoZXJlIGlzIGEKPiBzcGVjaWZpYyByZWFzb24gYmVoaW5kIG5vdCBzdXBwb3J0aW5n
IHRoZSBzdGF0IGNvdW50ZXJzIGluIHRoZSAqdGxic19yYW5nZQo+IGZ1bmN0aW9uID8KCkxvb2tz
IGxpa2UgdGhpcyB3YXMgbWlzc2VkIG91dCBpbiBnZW5lcmljIGt2bV9mbHVzaF9yZW1vdGVfdGxi
c19yYW5nZSgpLgoKUmVnYXJkcywKQW51cAoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
