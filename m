Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3C9C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MNJXsslxyUvl2kRwR3qr18+7a0vZ2q89LqM/+JIehaM=; b=YsSndU7Ie1etXY
	W5TdKFOU5oYQVYDQ4YIk1dWWzFgHQeEXNLEQ7XXMsNk2KxjmlH5x/L8xD4RNNuPNBmZcgR4IJ2mkM
	ub+Q4idH2Dih+xb0hRffdquXXKmaLa/LjghhNAy5+ZvBrHWDxO1v7ObN2VqwR8BsR+O/I1GbQE9vT
	Ivytx/+L1AKXp1Hr3RMR1sKIc88dOfV2PDUO3u++mFfAl3fVd9itqmi1i424ORjg13OJPqtzCZqPe
	o5iIBZmE2UDl88kCj4w6mDaioL46M3OaD7NGyVWZPAVAtWOcY+Oyt6OP92LTk/TzDh62xbDw6WLZq
	e4QbXX9OKg502zYJvmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdC2-0000000FGND-3fmM;
	Wed, 07 May 2025 11:44:06 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdBz-0000000FGLx-3x8J
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 11:44:05 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3d81cba18e1so48748405ab.3
        for <kvm-riscv@lists.infradead.org>; Wed, 07 May 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746618243; x=1747223043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=xFR+kqwyyROyXHmEGXLHIGMiKSDbOlgvYYMwUrLKDAueIiX33qPZGhTaGBB/XgyL5E
         3o4P78HT5WsnOWU95Vp8YaGVbPjm6B37qhRgkgpjGnJJBmgkdSbYUA1Rps4BR7bQdjCn
         DIZ03qMARN0KmREGVwVBJ74zYsecIl+yyCc/FJQorPfEqEqCB5hCZXAdNRNzytlVdoqA
         3kPCVnEVdQPOpYLsL59RL71uyhv+Te/xr5gF7sNc9YxHGymc9uWFI5HwRErEo4QSK+TX
         aZeoOWcI2wnT6TtpPnRGOYmrzlQPdVut2LcEDdl32scQ0lOtcpO1PCuoetkcW4YwoS4+
         n1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746618243; x=1747223043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVz2E+K/uMAryK5WXZfBalhzFkygNbdnQ6nqZ/JT97Y=;
        b=EXy4GRXxdFkPfRl7zAongayA/FWCak9qxGnJfGv2NGSQTgRqP6CPc/xynUaK99AX9Z
         h4zqugmsQfMk658RwM0p8zYp4VVEVWIJ3WvnVnnaXeVeZn5hFXgIHhsjIgD6uokihYcO
         +iC07kggcsokrLaAuzZu+rec6CbdDbip2lhkucj0DsLUZuCf7FpxlEfw4zyU7di3qyLc
         8v/0I/9cxF23pW1Z2vnW5ezlLWTb/qoKqCv5CfcCGyFYzJXMq0k394gvpWQqJ4kCzHed
         GXZQbNgxQ/SM8WzryPP1rNoQbgLYwa9XjERAJOfDQR7ItIvCbN6upjejn4gGbgFCcXz4
         V2zA==
X-Gm-Message-State: AOJu0YyTE1Hxi63RD1RNe6Ssvz2zrRloXBf1HreElwZpgh2dboHdz6Zq
	XJfhqFlXseVm09pBD/NxVAFEp1wY9HZxO+SsLar/jXXbGwSr9mHxx/CnqqWpzPODAj4KT8EJX5f
	65W/+IPIhw0e9jENuDfgPaid6jQf/annUseoVZg==
X-Gm-Gg: ASbGncvHNMW9mMVwfNtNCxI74aEKXHUYCcuoe3dvENSGQVQ2szGOuEwq+XWFmXZhrea
	Rk4C9Je84QMw9HYnob1dtV7RUhCIYnddd4pyr0pFw+jxhC0ziMCMs4qFdH/5DyR3ukI/C/iL3hD
	MuwdTzvyktKaP+rYcM56KbebIkmhitvbJjQw==
X-Google-Smtp-Source: AGHT+IEqTEU3gW24Jmigd2cIa8Pl0Ves+lUOw1f5tu/7B6fJK/PzbflFbxkax13tPvkDxDTPwZvRy4srBUyjnSLHpH0=
X-Received: by 2002:a05:6e02:1529:b0:3d8:21ae:d9c with SMTP id
 e9e14a558f8ab-3da738e9934mr32539925ab.5.1746618242847; Wed, 07 May 2025
 04:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 May 2025 17:13:51 +0530
X-Gm-Features: ATxdqUETEm-yQn1qrwlBDD0f3dy7uLqyAaalj3uycXV7-PAmSrqpx552FKWRajk
Message-ID: <CAAhSdy0XBTW1FUuUwSBanspDwpHMRbBL-8oSiRR1R=5SgF1+hw@mail.gmail.com>
Subject: Re: [PATCH 1/5] KVM: RISC-V: refactor vector state reset
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_044404_176092_09EAB91F 
X-CRM114-Status: GOOD (  19.06  )
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRG8gbm90IGRlcGVuZCBvbiB0aGUgcmVzZXQg
c3RydWN0dXJlcy4KPgo+IHZlY3Rvci5kYXRhcCBpcyBhIGtlcm5lbCBtZW1vcnkgcG9pbnRlciB0
aGF0IG5lZWRzIHRvIGJlIHByZXNlcnZlZCBhcyBpdAo+IGlzIG5vdCBhIHBhcnQgb2YgdGhlIGd1
ZXN0IHZlY3RvciBkYXRhLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3Jj
bWFyQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNgoK
VGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Zl
Y3Rvci5oIHwgIDYgKystLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAg
ICAgICAgfCAgNSArKysrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jICAgICAgICAg
ICAgIHwgMTMgKysrKysrKy0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Zl
Y3Rvci5oCj4gaW5kZXggMjdmNWJjY2RkOGIwLi41N2E3OThhNGNiMGQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV92ZWN0b3IuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfdmVjdG9yLmgKPiBAQCAtMzMsOCArMzMsNyBAQCB2b2lk
IGt2bV9yaXNjdl92Y3B1X2d1ZXN0X3ZlY3Rvcl9yZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRl
eHQgKmNudHgsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICppc2EpOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X2hvc3RfdmVjdG9yX3NhdmUo
c3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCk7Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfaG9z
dF92ZWN0b3JfcmVzdG9yZShzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4KTsKPiAtaW50IGt2
bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9jcHVf
Y29udGV4dCAqY250eCk7Cj4gK2ludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X2ZyZWVfdmVj
dG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKPiAgI2Vsc2UKPgo+IEBAIC02Miw4
ICs2MSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1fcmlzY3ZfdmNwdV9ob3N0X3ZlY3Rvcl9y
ZXN0b3JlKHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNuCj4gIHsKPiAgfQo+Cj4gLXN0YXRpYyBp
bmxpbmUgaW50IGt2bV9yaXNjdl92Y3B1X2FsbG9jX3ZlY3Rvcl9jb250ZXh0KHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qga3ZtX2NwdV9jb250ZXh0ICpjbnR4KQo+ICtzdGF0aWMgaW5saW5l
IGludCBrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0b3JfY29udGV4dChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCj4gIHsKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDYwZDY4NGM3
NmM1OC4uMmZiNzUyODhlY2ZlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC01Nyw2ICs1Nyw3IEBAIHN0YXRpYyB2
b2lkIGt2bV9yaXNjdl9yZXNldF92Y3B1KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAg
IHN0cnVjdCBrdm1fdmNwdV9jc3IgKnJlc2V0X2NzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0
X2NzcjsKPiAgICAgICAgIHN0cnVjdCBrdm1fY3B1X2NvbnRleHQgKmNudHggPSAmdmNwdS0+YXJj
aC5ndWVzdF9jb250ZXh0Owo+ICAgICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAqcmVzZXRf
Y250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQ7Cj4gKyAgICAgICB2b2lkICp2
ZWN0b3JfZGF0YXAgPSBjbnR4LT52ZWN0b3IuZGF0YXA7Cj4gICAgICAgICBib29sIGxvYWRlZDsK
Pgo+ICAgICAgICAgLyoqCj4gQEAgLTc5LDYgKzgwLDggQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2
X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4gICAgICAgICBrdm1fcmlzY3Zf
dmNwdV9mcF9yZXNldCh2Y3B1KTsKPgo+ICsgICAgICAgLyogUmVzdG9yZSBkYXRhcCBhcyBpdCdz
IG5vdCBhIHBhcnQgb2YgdGhlIGd1ZXN0IGNvbnRleHQuICovCj4gKyAgICAgICBjbnR4LT52ZWN0
b3IuZGF0YXAgPSB2ZWN0b3JfZGF0YXA7Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV92ZWN0b3Jf
cmVzZXQodmNwdSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc2V0KHZjcHUp
Owo+IEBAIC0xNDMsNyArMTQ2LDcgQEAgaW50IGt2bV9hcmNoX3ZjcHVfY3JlYXRlKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGNudHgtPmhzdGF0dXMgfD0gSFNUQVRVU19TUFY7Cj4g
ICAgICAgICBzcGluX3VubG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+Cj4gLSAg
ICAgICBpZiAoa3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSwgY250eCkp
Cj4gKyAgICAgICBpZiAoa3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQodmNwdSkp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Cj4gICAgICAgICAvKiBCeSBkZWZh
dWx0LCBtYWtlIENZLCBUTSwgYW5kIElSIGNvdW50ZXJzIGFjY2Vzc2libGUgaW4gVlUgbW9kZSAq
Lwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV92ZWN0b3IuYwo+IGluZGV4IGQ5MmQxMzQ4MDQ1Yy4uYTVmODhjYjcxN2YzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdmVjdG9yLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gQEAgLTIyLDYgKzIyLDkgQEAgdm9pZCBrdm1fcmlzY3Zf
dmNwdV92ZWN0b3JfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0
IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4KPiAg
ICAgICAgIGNudHgtPnNzdGF0dXMgJj0gflNSX1ZTOwo+ICsKPiArICAgICAgIGNudHgtPnZlY3Rv
ci52bGVuYiA9IHJpc2N2X3ZfdnNpemUgLyAzMjsKPiArCj4gICAgICAgICBpZiAocmlzY3ZfaXNh
X2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhLCB2KSkgewo+ICAgICAgICAgICAgICAgICBjbnR4LT5z
c3RhdHVzIHw9IFNSX1ZTX0lOSVRJQUw7Cj4gICAgICAgICAgICAgICAgIFdBUk5fT04oIWNudHgt
PnZlY3Rvci5kYXRhcCk7Cj4gQEAgLTcwLDEzICs3MywxMSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X2hvc3RfdmVjdG9yX3Jlc3RvcmUoc3RydWN0IGt2bV9jcHVfY29udGV4dCAqY250eCkKPiAgICAg
ICAgICAgICAgICAgX19rdm1fcmlzY3ZfdmVjdG9yX3Jlc3RvcmUoY250eCk7Cj4gIH0KPgo+IC1p
bnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3Zt
X2NwdV9jb250ZXh0ICpjbnR4KQo+ICtpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2Nv
bnRleHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBjbnR4LT52ZWN0b3Iu
ZGF0YXAgPSBrbWFsbG9jKHJpc2N2X3ZfdnNpemUsIEdGUF9LRVJORUwpOwo+IC0gICAgICAgaWYg
KCFjbnR4LT52ZWN0b3IuZGF0YXApCj4gKyAgICAgICB2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQu
dmVjdG9yLmRhdGFwID0ga3phbGxvYyhyaXNjdl92X3ZzaXplLCBHRlBfS0VSTkVMKTsKPiArICAg
ICAgIGlmICghdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gLSAgICAgICBjbnR4LT52ZWN0b3IudmxlbmIgPSBy
aXNjdl92X3ZzaXplIC8gMzI7Cj4KPiAgICAgICAgIHZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZl
Y3Rvci5kYXRhcCA9IGt6YWxsb2MocmlzY3Zfdl92c2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gICAgICAg
ICBpZiAoIXZjcHUtPmFyY2guaG9zdF9jb250ZXh0LnZlY3Rvci5kYXRhcCkKPiBAQCAtODcsNyAr
ODgsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWxsb2NfdmVjdG9yX2NvbnRleHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfZnJlZV92ZWN0b3JfY29udGV4
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gIHsKPiAtICAgICAgIGtmcmVlKHZjcHUtPmFyY2gu
Z3Vlc3RfcmVzZXRfY29udGV4dC52ZWN0b3IuZGF0YXApOwo+ICsgICAgICAga2ZyZWUodmNwdS0+
YXJjaC5ndWVzdF9jb250ZXh0LnZlY3Rvci5kYXRhcCk7Cj4gICAgICAgICBrZnJlZSh2Y3B1LT5h
cmNoLmhvc3RfY29udGV4dC52ZWN0b3IuZGF0YXApOwo+ICB9Cj4gICNlbmRpZgo+IC0tCj4gMi40
OC4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJp
c2N2Cg==
