Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2ACBC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viPg7vEowet7Fw3ZRvoA9dM/uUh2cdhsgXe23PycXKE=; b=t+aeaOMMp/1+xb
	bPw/QoGWcOXuPmqDFEi62nY7GnwNek+JDA1isaWxeoDk58imF0aSRklS1Eoo3nyXxkeHqL2xX6SmZ
	7pY4t9uPhFNy3KtWvuX+rbMQtXpsWbtY1DXszETFj69evtGfm7eU8JWkcWWi4Ki9Qmvr/ZowWj2fA
	frlYJdZmPIJs0t8MlKuD7oH2YHQGgKsUSw9PddBuYaPnT6ATXTVMV72bKTUaWmqfILlOCfj/eAtwq
	SoIofubqvroPOjpsllhyEs+mGfSqQnhWUSlGWCpfBss2JTyn90fxBXCxjgAgHVcSpar2FyXELr3wS
	8ghf7f9ZQzDDRisJRrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUt-00000003hQb-2AYd;
	Fri, 23 May 2025 11:23:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXQ-00000003Zkj-3kLh
	for kvm-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=; b=m8BzcAqqmFyXcMpNAiIVeFuvBb
	9wVI1UCjkyUSRKQrSazYWaXga/EZ0F8f3IkDGswii6553v57VXeOpuBsZlBkc1v4mxmboX52V5Jv1
	z0HaG5NIt1oBkm6VOTxdOUCj6gvlKfigPht2Ln7ogxcbIfDNuP/Eu1/3ycXZzahAJvHDdPrH/zj8o
	7dx+64TD46yfYjqHjBD/G30E9vaoJA53BhjJJNYAV/yqN7ptqgSUSkl4aMrqyKq/xZdgSmdjG2vfD
	h0utE09cDeTOLEkhrHOqY9qzfNZoXilt2iOl2R4whYQ+KjMSYgVII+q5SvBKVRdjWvuViHyzhMpvL
	z4/2hmJg==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPXJ-00000001Fze-3yfG
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742c9563fd9so5051375b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995715; x=1748600515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=w90lhIhcTke5NYibE+1yliQD+L/LBEDWOgMF//QcIWis7lNs2qqTvCo9hV3jjETIty
         F/ZYbk9D6fWP0WJ1qXF8Jt3cl6KNVOMRr8REC99J2CShPCTZB4qNxQxIdYBgMe08qP/y
         WiUwRiB/5MT6c69LhqavE8xpJa083QJNmL9Jv5yQA2gMmfrjvMsNkYwjXcersGHABAwi
         8mvV195a5+MLwMQJedhkMw3nBqa0K4WqaTEsKLtyyUVAMGiU3rcx2O2pFUoaahVAeYgX
         md//9rxXF3xgQXAr5SKoH7lr6S96bsMEv1P3M+12GLJAd/iDjzE8MWZ9XXEPaRZV4242
         krtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995715; x=1748600515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=uQITZZRBhGb14rhEpxONyuJMBj0wrZdAIesnocni+vw6rGalg4jKkuSXDeh1tx5zjJ
         7Y23Uwr/+rDPHNoox0zV3TKaxDIqf4x3cuIA5tlZDBENo21YzgFrz8wgRat8VXwZBP2a
         +21Up3EVn7GEat5jSXBY/zVlw2owU3r7q++xsXCWMl+CvdrDO5wWKUS9pkaZPxij+p4s
         VTVbkUbt/WRWOkIvFXainW0P8facHsqtrgTwoG8ND/6JKz5Mqq/ECx1vIY6wV/edfQN/
         c7eRjrH9ny7FIFZX/NGukW8pZ0kHa+vJE3u8rXgqVc2j0AJFOQntgA/eJ+gXnnpF29zm
         6Xaw==
X-Forwarded-Encrypted: i=1; AJvYcCXDEXdVSXqJzgutLvklY0Y3YVo1OtWy7l6ohlNu4DJSLQkRr3c4MhUx3dg8/ELivWxB2SbjkNfClMI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwM0d8+FR7H03XIoIJvBL4WEEM2najUDpJamVLHkT3sl/UxScUU
	84xXIVrtosrEf4djAC8XEzSRqcsKikp8gXi5UXeOtlP9VYcP0nM+4ipLDlIm51Jd/0I=
X-Gm-Gg: ASbGncv/IPjjn5B2S53aUOmjQ8/fG9IyfpYfLjV3P8xJ9jzyHz4Qr1Ccqf8VUGppwp6
	59eSOgWirZOG3U56E9+Lv/0MO93irdC7nNEAZLtwAs1H2pLK1I70QAhzh6uhW7CPuctHYbpYkr7
	oYWD/GSuAtQh3p2xwtakI58Ws4SVpe4fYYwNKHb1iTNTOgEFEuXZ1MLKUGa0hUWaxOpOyzVTlN7
	oKWSxm3ODk3Ww4lsgxjik/Uzs9wEeIgyoagCfv5JN75M8EPJpeznnAYdSXadIQ+0DfM+xW8jvD2
	fhXaouj3Ei89qDaDwfeV1Q1e5/cItZlyEuNmWj+E/m3htAzW4h6or4mybXWF3Uk=
X-Google-Smtp-Source: AGHT+IGnAPommgiaP/CHramKAPhXT2HV8FVP99uDHVdDg9TxfQgHz5LyukuEd2GDLOcnoMCuXHDtSQ==
X-Received: by 2002:a05:6a00:858f:b0:73e:1566:5960 with SMTP id d2e1a72fcca58-742acd507c1mr36450146b3a.19.1747995715587;
        Fri, 23 May 2025 03:21:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Fri, 23 May 2025 12:19:24 +0200
Message-ID: <20250523101932.1594077-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112158_141902_24B424AC 
X-CRM114-Status: GOOD (  12.00  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpv
bmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCA1OTJiMWEyOGU4OTcuLjM0YjRhNGU5ZGZjYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtNjI3LDYgKzYyNywxMCBAQCBib29sIF9faW5pdCBjaGVja192ZWN0b3JfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCWludCBjcHU7CiAKKwkv
KgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVsZV9vbl9l
YWNoX2NwdSgpIGlzIHVzZWQgc2luY2UKKwkgKiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0
cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpCisJICovCiAJc2NoZWR1bGVf
b25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQpOwogCiAJ
Zm9yX2VhY2hfb25saW5lX2NwdShjcHUpCkBAIC02NDcsNyArNjUxLDcgQEAgYm9vbCBfX2luaXQg
Y2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAog
c3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi1zdGF0aWMgdm9pZCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBf
X2Fsd2F5c191bnVzZWQpCitzdGF0aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHZvaWQgKmFyZyBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNz
X3NwZWVkLCBjcHUpOwpAQCAtNjg4LDcgKzY5Miw3IEBAIGJvb2wgX19pbml0IGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRl
ZCBzaW5jZSB0YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAq
IENQVS4KIAkgKi8KLQlzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKTsKKwlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
LCBOVUxMLCAxKTsKIAogCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdSht
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
