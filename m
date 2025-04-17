Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F38C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5QnPc2VSr3miFawcO36LQh7OZiL0gEbqJ4Fe22wtrc=; b=skz1ZtVbl1mUtq
	Ufct9rHABKx43dLfy6+PGPaoki0zqm92BOm4XwNKEJp6n0bejVG3UNQzV+hZf9W9AiJPgN2bmVk42
	r7qzH+lMuhF/+oilFrPn3woRE7YDpGIMHnQRDGdGAr8SoTnE+TVCIqXaa9/OJOHwD87wF5+z6DW7Q
	X1QWBlzGpttdx88hRvRGOeYxvg9tQJ9VowXnYGxfOBqwxLL+AYwtvVOuJo7dOCTHW1FRTOSx9aQ2B
	/AreKAiHG9aEXz2fOazEsUUjif2VgydYa/JZUvsZ1S/uASGnmzrDSZ0Cco8lT+F6bx/ggNsoG5G4h
	j0gf0ltH8hwqGOE0AT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTU-0000000Cz8D-0YUO;
	Thu, 17 Apr 2025 12:36:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIX-0000000CvcW-02zM
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223fb0f619dso7937385ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892692; x=1745497492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzbGeZkhDryHTbPMrJ1IX4plytmQ+QFf0x8BSly6zWo=;
        b=zBX0wF3tDzTiVf14aObUlhp1Tf19+TosgNNdJf2RRIBAdIdePk58q/LUor8rXforWM
         29dnCKSiu+18S8t0pjvmWDhTA6EH5S1CSLXn9drUgEGzZIZJoDmdbAWUcKMjngSVPbvu
         2tt4PjZYwpm+36pHNW0RznCzliA5+SCIfY5/jBp16guTR7RIPEpBhrvHIbPOPruk3c6q
         ghWZofWrOJWdDhNUqCkgkXRp+T8pBzvS0UK0esPiVWuOX8mqBrd7Rw3UvAr/eIWN1871
         cSLz8fiETR+j2rvXASkcI79DlLeh7MtIMqOKxvxzhGlH9Wx7eA70mGXQFjmEHLfWDGPm
         trBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892692; x=1745497492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzbGeZkhDryHTbPMrJ1IX4plytmQ+QFf0x8BSly6zWo=;
        b=d8+lQtA5f1f7K10UbsqQ7gAKuuAyU2C1M7CNXqaHr6/79wH/cjfv2B0CpkiXf/qZ+m
         p05b+D/ATwuSrz/Td+yZMJ+1UG2ygPydUhCeRMHN3fvcQSNzlViOfsfqmH1wbu1SQ6io
         DnCz1qDmFhzfgXVP3RRbnxoZkSCq1Uz1vb0zM8q+nCUeKzxszty5p8TMNQs5dQhxtlId
         93Y41KRnWub7rqCtEW/LZOAN8owjKVhjvcfqwe+uye0xpDL8sCXGmtI8U6bwAY4lxUVM
         JmwC0DXVOmcqsE8y278nNdXa2lQFQbSTvQdfsXozd9R7gSuXNQ6TzBM7546/gCnPmPwd
         MKIw==
X-Forwarded-Encrypted: i=1; AJvYcCVsSy4bBIPAs9eQyuYCGD/GW+MEXK8pjAVp47B7NOznBx+R93AEzjwJFI93OcwumjOVUJ9CBKQNZzY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRbkEGyvNFarS4hImuK5gIDOIUDd9BsjPyvuDGqwvTRKIvidTI
	CtbWAdVnlGwakLGAqhpFWdyv77AA1frM8BUeehAhQt+exX05mk3MS1vKzzffGG0=
X-Gm-Gg: ASbGncs2tm2WwdxuKVmK8ikCVBQljANbxMs5eMCM1kX8YBsFD5cnpkjg2/p9A3DuslS
	Ql6MsvGiFvNRKHb0/fulLsgNyMuXB7J1anGlxxEDTwSGuYEHIy76tzPex5g/riT8+0Rw3d1fjj7
	MlGY98vEzERmJ8JHjRXofk88LUZNZOnSg6CPnhnx2AyBzS1S2HqFzjp11RbgQXUjBc/jhgq76Y6
	KedbFdB981c1O5eIZKLGwhR95JkQvTyzBH19tYx1Vzu8esYOfWKjKuX2uRaAz4MLZ4S94WNt6vP
	CB51dS9A6CAU45O/7QT2s08C01lBtOBYsdWDBclnuA==
X-Google-Smtp-Source: AGHT+IG6jlQ44pwh9wX1WCDRI6TvuxV3hUxEozeeET2dKmcHLpN+5Bivs6u3n/jRgCZSuvYV8jlCbA==
X-Received: by 2002:a17:902:f642:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22c359a248emr91338345ad.48.1744892692486;
        Thu, 17 Apr 2025 05:24:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:51 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 06/13] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 17 Apr 2025 14:19:53 +0200
Message-ID: <20250417122337.547969-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052453_049378_C254EBA1 
X-CRM114-Status: GOOD (  11.55  )
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
eCAwNThhNjljMzAxODEuLmZiYWMwY2YxZmQzMCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtNjEwLDYgKzYxMCwxMCBAQCBib29sIF9faW5pdCBjaGVja192ZWN0b3JfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCWludCBjcHU7CiAKKwkv
KgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVsZV9vbl9l
YWNoX2NwdSgpIGlzIHVzZWQgc2luY2UKKwkgKiBrZXJuZWxfdmVjdG9yX2JlZ2luKCkgZXhwZWN0
cyBpcnFzIHRvIGJlIGVuYWJsZWQgb3IgaXQgd2lsbCBwYW5pYygpCisJICovCiAJc2NoZWR1bGVf
b25fZWFjaF9jcHUoY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQpOwogCiAJ
Zm9yX2VhY2hfb25saW5lX2NwdShjcHUpCkBAIC02MzAsNyArNjM0LDcgQEAgYm9vbCBfX2luaXQg
Y2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAog
c3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi1zdGF0aWMgdm9pZCBj
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yayBf
X2Fsd2F5c191bnVzZWQpCitzdGF0aWMgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkKHZvaWQgKmFyZyBfX2Fsd2F5c191bnVzZWQpCiB7CiAJaW50IGNwdSA9IHNtcF9wcm9jZXNz
b3JfaWQoKTsKIAlsb25nICptYXNfcHRyID0gcGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNz
X3NwZWVkLCBjcHUpOwpAQCAtNjcxLDcgKzY3NSw3IEBAIGJvb2wgX19pbml0IGNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRl
ZCBzaW5jZSB0YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAq
IENQVS4KIAkgKi8KLQlzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNz
X2VtdWxhdGVkKTsKKwlvbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVk
LCBOVUxMLCAxKTsKIAogCWZvcl9lYWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdSht
aXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KQotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
