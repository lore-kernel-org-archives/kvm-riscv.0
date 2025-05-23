Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2A8C3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsW6neGS/izhHn2dG9Od5OITks5i20ZfEKK4aJhYeuQ=; b=VCw5o94vDou0BE
	C2+0HajAkDASNufdjKMW1ZdhPpJB27p4pUJrTtf+qPqhPMam6fSj922xrMOaNW291fpt0PqMTu7Co
	WxrIkBnxGXJtw71L4DfbyNy5yeGyK0/ucMVz27DpAmbzPsW0Btr57ghKDow+vY4ZqZ9/8KKNe7bHD
	rH4bzl2Nw4PblMtJCF3XlA0Dx/0DCYobfmxttQqqw6Mya1YW2p24OYuNVsuFsGqdIMa3XLZ+TEntM
	gFD/bsPpE2R4HcothiOVOGYwrDY0x6MzR663NJcxOGVHmHuMQOb8B9szsugA8XTQP3jOLxw75fuT/
	viu6tR04KrqPLcFARmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUt-00000003hRQ-3wxl;
	Fri, 23 May 2025 11:23:31 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXR-00000003Zm3-32zg
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-742c5eb7d1cso7685733b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995725; x=1748600525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+BbSDDHoenIJ3oteuCEH5EGHycpOZc3PIlMBGmoJPY=;
        b=rO4Vsv/IA+dhO5lCIb1J74XAPkL7aIoLxbfdlUF1TMseJSa5slZNVTRIg8w8o1/YLo
         0MsMa2WFY+zWHyteOXFu0xhbGRyxV3zqKDSq12V58+/drTngvf34tsOJJIWqS3LA068o
         grl66Nu9efA0d/nlK6VZqDbbLmzlIPeU9HCw6IFM23h1kQ64rFVYh7VUMu0GwcfgLGGN
         d6W243bVVLDsqkOm8E6NVlhsHEEdrFBjtg9wdVKRVktvHOHwJFGLjyCKwNqsDN7sS+53
         TC5KG1lkKLVWpCwBdPTCEhdHFHdYyOMQwb70Xx0T3j31XBL9GCCeYzr5NX2Cs52bX4k7
         RnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995725; x=1748600525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+BbSDDHoenIJ3oteuCEH5EGHycpOZc3PIlMBGmoJPY=;
        b=pQEWDFcAa8uNxBhtTboaH1nQo9E2CDEReJJ4lEr8sjMAv9bxZdS3/WOYXFkPcyTsmg
         R5Xv6gBojrCJqYI6a/faacI/ipJfwE7yltRCeDHVSMxUOMuJYvVQkkra07iMCmwAg1qQ
         soHMnAY5gS2gwxJiBhFOAenaEGBmjHI9pD4HpFngS/eI1rALCBGMi0XXXT727/W97qOA
         i66M8lq3OokHG/H2NlytyG/0XYMA5PC6vWz7UWAT7guSEr01cyPj9rZ0w7+zd19XKGuE
         PWScO8VXKHDPLg6RXQQ0+BMe2os4DazVLtK7RbDCTi7pN7zlcPBbiTB2HbZ2toLSQgkV
         Sv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0fQUgAhf72dsnVyISkeNgVan6bGmpDmMV2lj9pN2CG2g+RfZabXEiIm3RF7JT95LzP8oqApl66ow=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEbXxXMe+DlhySYUdJamGBYoTzwyAlK8glXnnKBZ+ATrSE55g4
	Nls/dawiQzieRKZPjyy7anKIpJHQwojFytiEV957DvWEcIgSGRY0jZtzuXbof5QrWH4=
X-Gm-Gg: ASbGnctYQYq6CkYU7Cve/Zc318jw6ughqpYvzv1XFJYWMmlAN99bft9xv645aB29thQ
	vBCLi/MWOOtuy4EdZ/tAfwfmutEepGSk5OZCQ0yK12sP9WZ6CVVNBXuIHSFXL1SPHoQoQ1ubl85
	CI2fCNajxYQGS7mIStd9S630hJovMoX1mNBfcf4dxTCWDGjkqyl6QeT21lHHeJey8ErhLP6Obib
	KZqgAt4FbqE8g0bAIiu/Lm+1gxv18lcIPsOk6sBRbk58n4t0mUFSSQIJaN1WyCUZtKKX7V2ccVT
	hvA5gbVOL7ytS0ZFZ0Bd6cmzSQOlWEVQnfKl4w/fMc1wM7TuTyDJ
X-Google-Smtp-Source: AGHT+IGKTvrfjxP+cm7Qm4VGpAeva7NGxp+n2OLS1ggJxzcYA6qQkaI/iWC4Vzlh5iYGSGWB+//FSA==
X-Received: by 2002:a05:6a00:4614:b0:736:5822:74b4 with SMTP id d2e1a72fcca58-742a98d4a75mr42390281b3a.21.1747995725139;
        Fri, 23 May 2025 03:22:05 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:04 -0700 (PDT)
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
Subject: [PATCH v8 08/14] riscv: misaligned: declare misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Date: Fri, 23 May 2025 12:19:25 +0200
Message-ID: <20250523101932.1594077-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032205_775787_456B994E 
X-CRM114-Status: GOOD (  11.61  )
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

V2hpbGUgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgd2FzIGRlZmluZWQgaW4gYSBmaWxlIGNvbXBp
bGUgd2l0aApDT05GSUdfUklTQ1ZfTUlTQUxJR05FRCwgaXRzIGRlZmluaXRpb24gd2FzIHVuZGVy
CkNPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRC4gVGhpcyByZXN1bHRlZCBpbiBjb21waWxh
dGlvbiBwcm9ibGVtcwp3aGVuIHVzaW5nIGl0IGluIGEgZmlsZSBjb21waWxlZCB3aXRoIENPTkZJ
R19SSVNDVl9NSVNBTElHTkVELgoKTW92ZSB0aGUgZGVjbGFyYXRpb24gdW5kZXIgQ09ORklHX1JJ
U0NWX01JU0FMSUdORUQgc28gdGhhdCBpdCBjYW4gYmUKdXNlZCB1bmNvbmRpdGlvbm5hbGx5IHdo
ZW4gY29tcGlsZWQgd2l0aCB0aGF0IGNvbmZpZyBhbmQgcmVtb3ZlIHRoZSBjaGVjawpmb3IgdGhh
dCB2YXJpYWJsZSBpbiB0cmFwc19taXNhbGlnbmVkLmMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jcHVmZWF0dXJlLmggIHwgNSArKysrLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBkYmU1OTcwZDRmZTYu
LjJiZmE0ZWYzODNlZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0
dXJlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTcyLDcg
KzcyLDYgQEAgaW50IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGlu
dCBjcHUpOwogI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEKQogdm9p
ZCB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCh2b2lkKTsKIGJvb2wgdW5hbGlnbmVkX2N0bF9h
dmFpbGFibGUodm9pZCk7Ci1ERUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQpOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJs
ZSh2b2lkKQogewpAQCAtODAsNiArNzksMTAgQEAgc3RhdGljIGlubGluZSBib29sIHVuYWxpZ25l
ZF9jdGxfYXZhaWxhYmxlKHZvaWQpCiB9CiAjZW5kaWYKIAorI2lmIGRlZmluZWQoQ09ORklHX1JJ
U0NWX01JU0FMSUdORUQpCitERUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nf
c3BlZWQpOworI2VuZGlmCisKIGJvb2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNj
ZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpOwogI2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX1ZF
Q1RPUl9NSVNBTElHTkVEKQogdm9pZCBjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKTsKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCAzNGI0YTRlOWRmY2EuLmYxYjJhZjUxNTU5MiAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzY5LDkgKzM2OSw3IEBAIHN0
YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiAKIAlwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwg
cmVncywgYWRkcik7CiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VT
UwogCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQ7Ci0jZW5kaWYKIAogCWlmICghdW5hbGlnbmVk
X2VuYWJsZWQpCiAJCXJldHVybiAtMTsKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
