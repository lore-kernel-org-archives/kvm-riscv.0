Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D5C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAXwc4/FH2JcI06ypAQS7EJs4XnTX61Ocn8/f5moUyo=; b=JW78/BNN8NztLF
	UYXLzFVA3jOQxaUlPd271Y1PI/9TC/+J196vYx3Of8xVpEmTvVBugSc4i/uac7N+weuw72XKpvGRe
	M7H1hhG89nkPw/hDatpyuu5Yw+UPH+KDbdsIVdhYGUCOkvkcEXThfFgn88V2eMhg5bU61ZZpQ3oGI
	VSX2FVbbePuhuhM78ia3a96nPX/ZKBFW16ekreQ+UPzhy2ChJPaN0QgLjfjm45otWuK7tmHc3W5xd
	Z4OR+NgwZi26IhYx6Revqm8QJ2Rgpl5XwwGZ+DPcpw4hDOnLc1pFvVG05YBle8JXVl87zrrjkKDV6
	9sh2QKkd8EkPN2Cmkkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp43A-000000081xp-0zr4;
	Wed, 29 Jul 2026 13:10:20 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp437-000000081wt-0fm2
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 13:10:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so936688f8f.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 06:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785330615; cv=none;
        d=google.com; s=arc-20260327;
        b=tACZ6lmFUdSEpx8sc8qOb1cHlXa2OZdvBQzvAu6Cdwvl2fNCwbHRzu/IHEP95DKAvg
         +M+QSzrUqXEheAIy+YaZe7yQyMzFIxW2TjhzFidZ8mcB8w+gOBL+gGS2eq50Ei6Q12LD
         Hopae19Yc++i6pDY+JvWsG1kAHq1VhL/Q4exBxjD2HEt5b5b6HJHA3wafWkCVXYdYWwW
         YSloe/o0mseQ95sNp/nQf5kGTnBs3ZeUuUN6/bqtZoPgyYiB45Bh6dFH1/NuVj9dUVNM
         YhnqukgsN32WgeqW2IZ3CSQrCqq+TN9BTrMN2clKeEFxATIXoQ980dFlgwQKLh64eiz8
         s4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        fh=J92uH1sqQDBKr2Akg2ntmkULfAS/ruX2d95VJonlzf8=;
        b=T3Kn6JrI9E5ZXtWgpsjHYoiVkHBVTVa4Hz6dRGhI9pt46dOyGRwriuKf9205LTuwET
         u3qRlm8qprQ7IgBeeuIVOg/A3rKNEGSVAtMtNlkVasATf6onsnEhTMVNAF3HqdXiUNSy
         qZg+cjy7Lqw+S9MoOqxFa8oKp1t/LTfYUdG5KPQkdALsH9SlCgo8UjPlkVkL3XnXwe0z
         +SLNenZEv++Oodl0bKcHE9cZXdMc4A9/rUYrP9bYBpMirJqCwbRsscgbtNX9V8IID3x1
         y/XcB/G/ibwdrQkGBG0wmoIo9vqdDJ8X/4Hftvgysl0wO9tbn00B9hs6JI9zVs7b+jp8
         sjkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785330615; x=1785935415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=jSnPH4lBu1quPZS7CAIObu7nCBSA0XWQ1r6TkFEEoyrhDstum5DNON1VkK+iK59Z7Y
         PzLqDSwgSrO2kayXtvRMYWE9byQfWUnNkTDfmlGWM6J+yAXhfO2JQJ6yIU4+cve4cTEC
         nTLUQfnLkTXch+aL3HjhAeiKUf63gv5+VXy+FR58kE2LbYb9cIwISpmh0cxLiZro8M3v
         r7wx/RQFlVcFzr1GkegwJoJVoSCkS8DkisB7JqKU5RZA1xAPOcpaWUQVQSa7sbu3ZV+e
         muJ67d/CFmiLVTb5j3sIOwpMyDxByhacu779qIlrGxPsqHF5JCJQi6sK4OFTMeU1Aolq
         l7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330615; x=1785935415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlahTC06J1bekMd44QG1g3xZUKIEUfQuaHqFpAEocdM=;
        b=jeG7/iuZdtf+jjXrLzwsPiB5M9eqhGF5bkq4QULU3ArWawxbdxEj5NektKIWO+KhD6
         Ez5RgA7DXJ3tekWt3rWSXUvEgwJdZc9pmZb9AkIkblet3xR3X+g/UTVVNgTXP/hd00zT
         zK5lZpaxX7wUIGU3C1yMjKw6d2EPhbMV8peIYKw5sV5Hrig4uvNoOfqB+OFamtYwOBW/
         Z1Wy2RqOYPXxJHzNivW80/n0jD011qJXonHM1LT/Semdt9r7iWYord6+6JWTK+0A2RRM
         YPcLssu4F8QgSY63VSEpsJZ95UB44DqjJlc2o1lBVb62reE07LQ5g+4pfX8Bua1bPwnY
         crqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+6NWtMO6R5pnxDne1e3OQqU2VgxXWtoVV3zpBk2uWhpVKG3TwedaAMj7CvaWpClJfUjZesVUHAmA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLtVsy7CCVGRU8lecMsoOJT14XWWmdxewz3PQz8XzNgKyKeRGI
	YOJ40W3eaK19pgAhbmKJwvN18aPX3EAAQgKeLtNihZBd60oqoh0orYPrdUoa3ql5d8R+X7uK1hu
	FGzS4VRX+/H8PWHfwj3t6x+eNaWPI1teHJmbNXtWPtg==
X-Gm-Gg: AR+sD11k3CH8HWdJ+sgMrpao3rFrJTEOb8s2xoNPaA0iJ3FVdpHE5p5nRndlpL78syD
	oaMb4/+5pMCqglZPVhMgrYJKJgC9S6s1uygwHGXwk9ZoF3cqF9N3pvb/MeOUXS2sJ2Kowm2DCp3
	8/jI9VGC9aJF5zKxOHY3iPWhFxQS+gOrvbPYhX3bFzaQxLHpNZUY7KDfCsjxn8X7EmBYrZeMnNW
	0X5JY0ydc6qFion0pWWH8NzZI17+7UKo9NrT1u+FHIwvONNKAawh0RstzZRFsTjhgCwAG3oFCDM
	KIfUNA7VygQIxDVYoVugFrua0OzbVwg8mY0Z4BgDLli4h0EpP0qWMpKKpYm1gagGTykAN0vzO2H
	CgWc11Ocd/mKlB5EKMiTd9wNbBci+wtvxUkQl+xCp20OJIPV1anvqoMPGMVD5Tkg=
X-Received: by 2002:a05:6000:707:b0:47f:90df:4ec6 with SMTP id
 ffacd0b85a97d-47fb1e5ffa9mr7439787f8f.6.1785330615148; Wed, 29 Jul 2026
 06:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-8-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-8-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:40:03 +0530
X-Gm-Features: AUfX_mzDcWuxE6PkzrbfuK4rtESRLEYMRMklaBIZb-MTh6f9nimxeIEC2cIHilw
Message-ID: <CAAhSdy2P3Fgfv3t9n=wNTfBL-63k+3qaDvsG1QWxtkWTFfvWvg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] RISC-V: KVM: Add support for control-flow
 integrity FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_061017_250123_17BD5FC1 
X-CRM114-Status: GOOD (  23.68  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozNOKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ29udHJvbC1mbG93IGludGVncml0eSBpcyBjb250cm9s
bGVkIHRocm91Z2ggYSBXQVJMIGZpZWxkIGluIGhlbnZjZmcuCj4gRXhwb3NlIHRoZSBmZWF0dXJl
IG9ubHkgaWYgdGhlIFppY2ZpbHAvWmljZmlzcyBpcyBzdXBwb3J0ZWQgZm9yIFZTLW1vZGUuCj4g
QWxsb3cgdGhlIFZNTSB0byBibG9jayBhY2Nlc3MgdG8gdGhlIGZlYXR1cmUgYnkgZGlzYWJsaW5n
IHRoZSBJU0EKPiBleHRlbnNpb24gaW4gdGhlIGd1ZXN0Lgo+Cj4gQXNzaXN0ZWQtYnk6IFl1YW5T
aGVuZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1YW4gWmhvdSA8emhvdXF1
YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nh
cy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgfCAxMDcgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTA5IGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBpbmRleCBmZDRjODE2OTc2
MTcuLjIwZDk5NTljYTQ0ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAt
MjQ4LDYgKzI0OCw4IEBAIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnQgewo+ICAgICAgICAgc3Ry
dWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIG1pc2FsaWduZWRfZGVsZWc7Cj4gICAgICAg
ICBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0X2ZlYXR1cmUgcG9pbnRlcl9tYXNraW5nOwo+ICAg
ICAgICAgc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdF9mZWF0dXJlIHB0ZV9hZF9od191cGRhdGlu
ZzsKPiArICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBsYW5kaW5nX3Bh
ZDsKPiArICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBzaGFkb3dfc3Rh
Y2s7Cj4gIH07Cj4KPiAgLyogSWYgeW91IG5lZWQgdG8gaW50ZXJwcmV0IHRoZSBpbmRleCB2YWx1
ZXMsIGhlcmUgaXMgdGhlIGtleTogKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggNGQ0
NzRhNDM5YjI5Li4wMzE1M2ZkOGQxNWYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmlfZndmdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAg
LTE3Niw2ICsxNzYsOTUgQEAgc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVk
X2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgcmV0dXJuIFNCSV9T
VUNDRVNTOwo+ICB9Cj4KPiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9jZmkoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcgdmFsdWUsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0IGZsYWcpCj4gK3sKPiArICAgICAgIHN0cnVj
dCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPiArCj4gKyAgICAgICBp
ZiAodmFsdWUgPT0gMCkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZW52Y2ZnICY9IH5mbGFnOwo+
ICsgICAgICAgZWxzZSBpZiAodmFsdWUgPT0gMSkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZW52
Y2ZnIHw9IGZsYWc7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklf
RVJSX0lOVkFMSURfUEFSQU07Cj4gKwo+ICsgICAgICAgaWYgKGNmZy0+aGVudmNmZyAmIChFTlZD
RkdfTFBFIHwgRU5WQ0ZHX1NTRSkpCj4gKyAgICAgICAgICAgICAgIGNmZy0+aGVkZWxlZyB8PSBC
SVQoRVhDX1NPRlRXQVJFX0NIRUNLKTsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAg
Y2ZnLT5oZWRlbGVnICY9IH5CSVQoRVhDX1NPRlRXQVJFX0NIRUNLKTsKPiArCj4gKyAgICAgICBp
ZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVE
RUxFRywgY2ZnLT5oZWRlbGVnKTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAg
ICAgICogQm90aCBCaXQgTFBFIGFuZCBTU0UgYXJlIGluIHRoZSBsb3dlciBwYXJ0LCBzbyBpdCBp
cyBzYWZlCj4gKyAgICAgICAgICAgICAgICAqIHRvIG9ubHkgd3JpdGUgdGhlIGhlbnZjZmcKPiAr
ICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNG
RywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0
dXJuIFNCSV9TVUNDRVNTOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3ZnRfbGFu
ZGluZ19wYWRfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAg
cmV0dXJuIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBaSUNG
SUxQKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0X3Jlc2V0X2xhbmRpbmdf
cGFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92Y3B1
X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+ICsKPiArICAgICAgIGt2bV9zYmlfZndm
dF9lbnZfZmxhZ19yZXNldF9oZWxwZXIodmNwdSwgRU5WQ0ZHX0xQRSk7Cj4gKyAgICAgICBpZiAo
KGNmZy0+aGVudmNmZyAmIChFTlZDRkdfTFBFIHwgRU5WQ0ZHX1NTRSkpID09IDApCj4gKyAgICAg
ICAgICAgICAgIGNmZy0+aGVkZWxlZyAmPSB+QklUKEVYQ19TT0ZUV0FSRV9DSEVDSyk7Cj4gK30K
PiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbGFuZGluZ19wYWQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZh
bHVlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X3NldF9jZmkodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsIHZhbHVlLCBFTlZDRkdfTFBFKTsKPiArfQo+ICsKPiArc3RhdGlj
IGxvbmcga3ZtX3NiaV9md2Z0X2dldF9sYW5kaW5nX3BhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3Ni
aV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX2dldF9oZWxwZXIodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19MUEUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgYm9vbCBr
dm1fc2JpX2Z3ZnRfc2hhZG93X3N0YWNrX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gK3sKPiArICAgICAgIHJldHVybiByaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSh2Y3B1
LT5hcmNoLmlzYSwgWklDRklTUyk7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGt2bV9zYmlfZndm
dF9yZXNldF9zaGFkb3dfc3RhY2soc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+YXJjaC5jZmc7Cj4gKwo+ICsg
ICAgICAga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcih2Y3B1LCBFTlZDRkdfU1NF
KTsKPiArICAgICAgIGlmICgoY2ZnLT5oZW52Y2ZnICYgKEVOVkNGR19MUEUgfCBFTlZDRkdfU1NF
KSkgPT0gMCkKPiArICAgICAgICAgICAgICAgY2ZnLT5oZWRlbGVnICY9IH5CSVQoRVhDX1NPRlRX
QVJFX0NIRUNLKTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X3NldF9zaGFk
b3dfc3RhY2soc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25lX3JlZ19hY2Nl
c3MsIHVuc2lnbmVkIGxvbmcgdmFsdWUpCj4gK3sKPiArICAgICAgIHJldHVybiBrdm1fc2JpX2Z3
ZnRfc2V0X2NmaSh2Y3B1LCBjb25mLCBvbmVfcmVnX2FjY2VzcywgdmFsdWUsIEVOVkNGR19TU0Up
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZ2V0X3NoYWRvd19zdGFjayhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2FjY2VzcywgdW5zaWdu
ZWQgbG9uZyAqdmFsdWUpCj4gK3sKPiArICAgICAgIHJldHVybiBrdm1fc2JpX2Z3ZnRfZW52X2Zs
YWdfZ2V0X2hlbHBlcih2Y3B1LCBjb25mLCBvbmVfcmVnX2FjY2VzcywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZSwgRU5WQ0ZHX1NTRSk7Cj4g
K30KPiArCj4gIHN0YXRpYyBib29sIGt2bV9zYmlfZndmdF9wdGVfYWRfaHdfdXBkYXRpbmdfc3Vw
cG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgewo+ICAgICAgICAgcmV0dXJuIHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFEVSkgJiYKPiBAQCAt
MzEzLDYgKzQwMiwyNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9mZWF0dXJl
IGZlYXR1cmVzW10gPSB7Cj4gICAgICAgICAgICAgICAgIC5zZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0
X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKPiAgICAgICAgICAgICAgICAgLmdldCA9IGt2bV9zYmlf
ZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICAgICAgICAgfSwKPiArICAgICAgIHsK
PiArICAgICAgICAgICAgICAgLmlkID0gU0JJX0ZXRlRfTEFORElOR19QQUQsCj4gKyAgICAgICAg
ICAgICAgIC5maXJzdF9yZWdfbnVtID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndm
dCwgbGFuZGluZ19wYWQuZW5hYmxlKSAvCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+ICsgICAgICAgICAgICAgICAuc3VwcG9ydGVkID0g
a3ZtX3NiaV9md2Z0X2xhbmRpbmdfcGFkX3N1cHBvcnRlZCwKPiArICAgICAgICAgICAgICAgLnJl
c2V0ID0ga3ZtX3NiaV9md2Z0X3Jlc2V0X2xhbmRpbmdfcGFkLAo+ICsgICAgICAgICAgICAgICAu
c2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9sYW5kaW5nX3BhZCwKPiArICAgICAgICAgICAgICAgLmdl
dCA9IGt2bV9zYmlfZndmdF9nZXRfbGFuZGluZ19wYWQsCj4gKyAgICAgICB9LAo+ICsgICAgICAg
ewo+ICsgICAgICAgICAgICAgICAuaWQgPSBTQklfRldGVF9TSEFET1dfU1RBQ0ssCj4gKyAgICAg
ICAgICAgICAgIC5maXJzdF9yZWdfbnVtID0gb2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlf
ZndmdCwgc2hhZG93X3N0YWNrLmVuYWJsZSkgLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPiArICAgICAgICAgICAgICAgLnN1cHBvcnRl
ZCA9IGt2bV9zYmlfZndmdF9zaGFkb3dfc3RhY2tfc3VwcG9ydGVkLAo+ICsgICAgICAgICAgICAg
ICAucmVzZXQgPSBrdm1fc2JpX2Z3ZnRfcmVzZXRfc2hhZG93X3N0YWNrLAo+ICsgICAgICAgICAg
ICAgICAuc2V0ID0ga3ZtX3NiaV9md2Z0X3NldF9zaGFkb3dfc3RhY2ssCj4gKyAgICAgICAgICAg
ICAgIC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X3NoYWRvd19zdGFjaywKPiArICAgICAgIH0sCj4g
ICAgICAgICB7Cj4gICAgICAgICAgICAgICAgIC5pZCA9IFNCSV9GV0ZUX1BURV9BRF9IV19VUERB
VElORywKPiAgICAgICAgICAgICAgICAgLmZpcnN0X3JlZ19udW0gPSBvZmZzZXRvZihzdHJ1Y3Qg
a3ZtX3Jpc2N2X3NiaV9md2Z0LCBwdGVfYWRfaHdfdXBkYXRpbmcuZW5hYmxlKSAvCj4gLS0KPiAy
LjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
