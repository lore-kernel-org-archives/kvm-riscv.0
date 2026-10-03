Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF52CA5FDD
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFY0NiR0aMtz2SiL91ZaHlQ/1/q2MJomyzoSaSm/mo4=; b=xeyJaIRJnxoP0g
	tmpMS0T0/vZ4YEI3PxNZiBp4N/AZaX3mUzhdoGfYadXWVn2eJdBdmRANlcgx4PKgYYv93fewAP7JT
	zq4wj9GZ86Sol35SpstHWHlAGlrIDf2Q42RRpELObwvubE+mBpI9vQmvWAeqUqgiqCZPbAd8rqiSb
	Bnj8DKPNEgowxPr21sqKkR4ikMtH7AKviu5mGFBJtfqt1cufPe3JGUyAPZIvKOkHJ7UF0r5VIgOA4
	5tL+VCOOGuNoMh4jRkExOjZGRiqrVCzweLWCLF20Lw8WZyum78q2EfGIdvQYzvhh1vBUY1QMLnsn1
	6T3dXrdxPkOIVVB6HW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvu6-0000000DFha-12Zp;
	Sat, 03 Oct 2026 09:19:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvu2-0000000DFgQ-2T7d
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 09:19:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso198272f8f.3
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Oct 2026 02:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019173; cv=none;
        d=google.com; s=arc-20260327;
        b=j8u30bwnKa14RrHMQTVChuQuqBTRfeH/0cDjITD45S941Sk/WvBYAXWz3JvOB1yv6H
         Tg6hRzn8RrQpkSfLF837D62oFOuEfJfQRSTHEUn893oFspd5eacxgSK4w0jUGO+ZAipX
         YiG2NCH1Dhw1mMFazIlYiQXCEDSQukL+YEjkhycdLR5ewxdLqYDL1gSL92t3gaRI0Ad6
         WeJIyXXaVPlr8bUFymaGpOg+dJfmK2J+EM6UV1mZA8rPaJ9bD0YfkhKd0XS809g+gzcV
         oKPPyi4xoEsMvVCHBXHf3n9ypb7XQ7K/l0YsHQtzx6pKBOMe1Hq4LIC1zxL4vtPitoT0
         K7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        fh=TXJvFss9qRB++G7JIDWskjEt79kJxQlTz2CKHy4WEZ0=;
        b=FUeL6dGnJsrk1W11sDhZhDigZtwNMw9BJh9xN3/h32jSiKqpRXLMrhd91J+IVo4lYO
         l/U8hbyxGnwctSvdFWE3xPjsiOn7rY0c7up3YNfrsuIBZODg9VAtUAZYSXOKyQwMiH0G
         S9xNKUpxtO313H0ZyHNL9vBS+0u0ckc1DH7REjra2FVx9Xfp6cg4XKghZ7DlyvyN8njK
         aKynWqDmmQp0x3VIQSXGWGd2RzUT2fN087ikhJGkjJiJiDOJmW4p7n7YyfWyjXHfXXMX
         NTEn9IgEuhYDZni5/c2yWSRomIytKUGxOH9fb5he0FxUr6KSyC/JOQjuASVGexv+6U9J
         aAcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791019173; x=1791623973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=t42Bi9VJJX9qzlllwX1wuhwj0HjASm9rqkCuk8GkYabQr9umAFzmwUdpXJAX3NC31l
         ICp4HnrcmpIw3P6Ofe8OxiO7O4eDfDhZGzrdfQPkc2yYd7ItdxDOnEql8LizcFAwwmnz
         pkaJxxkgsCYq6/1IMkb38kAfQKoeui5BPFJce18HJeZlw7V2ET7NNVxqnFnVibpeuoMX
         0eGPDGSVqLC0uGrz3aCDLoyvYumdzETqyLuHcE8ndi6YfWGy3ewbbGM1ZlTDCzk+NjKI
         ux8EMnlVdL3Z/p8itZr7ML9BN7GT4mhJ0gcI91Jg9oO/Tc2WM00sIOGnRrMDbcL4a+0b
         4AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019173; x=1791623973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=FiSI5AkmK4A1OZ/OmsFxrc5JESUYxoIruDQ8ak6KKgRx1SiUE/ebekv6bXRH6cD5bx
         SEn4ZA32yzd4Jx6Ev3KyiOo0QKb66NZGJBDa5MOX+7uHDj+cA7Upp5nEnPrbKH11Qz5T
         nBC8N3KjqUjLpLV1fCSI9VwRNOx6uWfzOF6zz8iWbM+swvEmi+j9WSQ6CSBwvZxB7QhU
         anX0QM9Mnu1GSajutNPo6FFOevpFJrut3et2W0RcuG7HwLoFO9wZ0wrnLrqM9F9eLpkj
         y+pobSCK9CO6/RDteZ2lj8E/wEqkF832DJvFlRQm65MR51ep4MjsnK16ORt+FbkVbG1g
         Hpfg==
X-Forwarded-Encrypted: i=1; AKwUvBzlSRLZKtJBhe7GGxoRjcTu276t52U63JEybX2+2YUzORwsrTIr3uKf4fNwTVEjSULX9DBCyEiCrW8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJTr+Id3eL4iLrmFko0opwqXi7gfEFlBFzf8VKriB3Kc23RNDKw
	+hpNLJnd09X8IQxwho1ZSwKqayTYhxObVYNFhym+8cLz8/qBal2u3Uub8YZYiMc0oq6XaeQaYhC
	2TU7Lps7USn3hU0F9PTW8DK7sCBXtrtMY7/u1ibo01w==
X-Gm-Gg: AYBFou2f0nKiTy4DGpZICZCkUfMp5BoaXBJBqRiXXXGDu0tkob62jorSPJJ2Mkrx9a0
	MArDr8iohLMp7vG7rzlPRSYsVvUNHPGSAVitbmvgYS69k8loYC3Knj8STzv0CK4leldz4TnZRot
	4zHCZyoMZUwK6Sw+b3MLM6pIeYyGexaTaR4OKUUqT0UHcYsp068gCSM/9S0A0mTx4SB13PW2GXb
	Yr/CSNmWfcgZeoccox9dwNi9wxhvRIQqfC72VxJOqn0ctqLJK7Hje1dQlIdJVHEp8hM135Ic2Ip
	blCFQgtkF07qrC1mMKqR3yHqqGecVubttfiwWu196hbJkxDMZx6cPUZ8LZvDdrdQSnfnAslXJMS
	0wLUcfyCKdrGwKYt2zMS56FkTY24sBvLUEA+XfuhDREhF4ceYOzYh2mXd1mxqJSoe3BPw7TLl02
	k=
X-Received: by 2002:a05:6000:2289:b0:488:8546:d0b2 with SMTP id
 ffacd0b85a97d-48c48023a32mr2361761f8f.51.1791019172398; Sat, 03 Oct 2026
 02:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260814123541.593613-1-jinyu.tang@linux.dev>
In-Reply-To: <20260814123541.593613-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 14:49:19 +0530
X-Gm-Features: AclHuK_Z0ksFSJd3YPpKJCJ3vTWpyr047A-VUpiGpFpHWBI599qCSz9eVjsltbU
Message-ID: <CAAhSdy2TuVK==x2Ewj_yNhG=MkYx+Lrha8aPFA=ROociaG7dGw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Avoid redundant interrupt check for pending timers
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021934_647265_4596C391 
X-CRM114-Status: GOOD (  13.91  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNjowNuKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IGt2bV92Y3B1X2NoZWNrX2Jsb2NrKCkgY2FsbHMga3ZtX2Fy
Y2hfdmNwdV9ydW5uYWJsZSgpIGJlZm9yZQo+IGNoZWNraW5nIHdoZXRoZXIgYSB0aW1lciBpcyBw
ZW5kaW5nLiBPbiBSSVNDLVYsIGt2bV9hcmNoX3ZjcHVfcnVubmFibGUoKQo+IGFscmVhZHkgY2hl
Y2tzIGFsbCBwZW5kaW5nIGd1ZXN0IGludGVycnVwdHMgdGhyb3VnaAo+IGt2bV9yaXNjdl92Y3B1
X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUwpLCBpbmNsdWRpbmcgSVJRX1ZTX1RJTUVSLgo+Cj4g
RHJvcCB0aGUgcmVwZWF0ZWQgSVJRX1ZTX1RJTUVSIHBlbmRpbmctaW50ZXJydXB0IGNoZWNrIGZy
b20KPiBrdm1fcmlzY3ZfdmNwdV90aW1lcl9wZW5kaW5nKCkgYW5kIGtlZXAgdGhlIGhlbHBlciBm
b2N1c2VkIG9uIHRoZSB0aW1lcgo+IGRlYWRsaW5lIHN0YXRlLiBJZiB0aGUgdGltZXIgYmVjb21l
cyBwZW5kaW5nIGFmdGVyIHRoZSBydW5uYWJsZSBjaGVjaywKPiB0aGUgdGltZXIgcGF0aCBzdGls
bCBpbmplY3RzIElSUV9WU19USU1FUiBhbmQga2lja3MgdGhlIHZDUFUgdGhyb3VnaCB0aGUKPiBu
b3JtYWwgd2FrZXVwIHBhdGguCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDxqaW55dS50
YW5nQGxpbnV4LmRldj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyB8IDYgKy0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Rp
bWVyLmMKPiBpbmRleCBhZTUzMTMzYzdhYjAuLjBlMDFiZDc5Mzc3MiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Rp
bWVyLmMKPiBAQCAtMTMyLDExICsxMzIsNyBAQCBib29sIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Bl
bmRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3Rp
bWVyICp0ID0gJnZjcHUtPmFyY2gudGltZXI7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2d1ZXN0X3Rp
bWVyICpndCA9ICZ2Y3B1LT5rdm0tPmFyY2gudGltZXI7Cj4KPiAtICAgICAgIGlmICgha3ZtX3Jp
c2N2X2RlbHRhX2N5Y2xlczJucyh0LT5uZXh0X2N5Y2xlcywgZ3QsIHQpIHx8Cj4gLSAgICAgICAg
ICAga3ZtX3Jpc2N2X3ZjcHVfaGFzX2ludGVycnVwdHModmNwdSwgMVVMIDw8IElSUV9WU19USU1F
UikpCj4gLSAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+IC0gICAgICAgZWxzZQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICByZXR1cm4gIWt2bV9yaXNjdl9kZWx0
YV9jeWNsZXMybnModC0+bmV4dF9jeWNsZXMsIGd0LCB0KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lk
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2Jsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAt
LQo+IDIuNDMuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
