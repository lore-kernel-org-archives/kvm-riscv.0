Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B123C369B2
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdlO+oYR/TVfEOOHB9Zu+l1lz8fee+nikkRk88mOcB8=; b=eiRmKfIMhcs2ox
	V7pfXY/nkBDWHelTXMnFdNJJVEtVvVERmYfEkR7CL6lhPmfHWMvA/dvWyOpCLjUmR1TfWDRJJWbhY
	Qadz6Gh/c+H3iyptqn6Eiprciq3T54voIDyNL8CTY42HnorzuuuDbEFw3cIjDU22Cw5vZqqdkXWbu
	XwrEMx2sUQHv+tvhB9LcZXx3E+mdRWJ9MxH05JSkIE/ENKt3y+KYCkCsb0S8rsZKK6trcaF5/5Vle
	ZtmG6Vml7xCfSKouby/4dMAqpD5msH2rctNcWT3oxV4a6Og8vYTyVysu7ow1W/oQTHFFumSrUHtyx
	E8tXi6IF3aa9Ra2gnaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTQ-0000000Cz3v-3KOp;
	Thu, 17 Apr 2025 12:36:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OI7-0000000CvQH-0je8
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22435603572so7284715ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892666; x=1745497466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNrGkE8UCKSxhi8ZHI6AhhtBeoQ1iixkNI02GQVKF+0=;
        b=DLxF/+cPV1Hqap6vAUQwEZwhOWgUUsq3uO46KUPb79g5I4KwR5xel7lAfZFS6q15EX
         uLqihRD3Z7bm3g85IegGOKcDqpFafegkZm5XPCygF5dZ+qmGYA3O60G9fTH50oVaDgWo
         0MzYEgPwz7yO71o3KikgctuyoKOdWhV8dVxDTFNtMofOejVV+KCZgWxONYrNugKIYktD
         e7mi3xi0Uk11cBpowaKuc9RgVqBZ04dR0GfhJkb+IDoYXesbYd6L8/F6vG0jEVsSBmO9
         LKY7V0sYTplD0wuH9dSqnucl2BF4zGFDwrlSylgs4SLST/D+o+MunuAZRCQQ9QOf5zD5
         TsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892666; x=1745497466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNrGkE8UCKSxhi8ZHI6AhhtBeoQ1iixkNI02GQVKF+0=;
        b=RvTXtcNsmy0nWzD7ureXbHkyeRstAskvDfH8ArYMU/JJjZ8xNcZ33gEjZYkLmFyQEz
         BPsIt8/RPg28Z65slVBSz54fz76a2BbdCDDn0scZnkFrajn+pdOZQ9hux4IzLUEIfYwP
         oc6Pl2noN71sqF0b6WQrUMptPgUMUsdfYYdQ9hNuMbgmwQaxgImdNjr6Ufchb5C8cbSf
         HmfvI6WwRnAW97VqI5u40+LnF5lH/4Vr5Aoi6wOn3qZ78aEPQVYQ5WRfaIB8fWaplVEQ
         bC+p1xaVIv5Z1k0u0kiEFjn1mXFVUcYUckUhqVOsPEfD8BfmSIO8NrUUYWrcleOXXo5r
         DY9w==
X-Forwarded-Encrypted: i=1; AJvYcCVQnVXCzw6j4F9nPfyB0txFOLTaDsSZPrXE+PRiP5HTTpul5IWBW399npMKiZYNqRrd5YYyWTd/xt0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxqRnm02+qz97wRcLAkiViPEmVSmtCT0gk/3Ou3Bj3pyzLRL5O
	F/P0lbDx/Y5ndwQxXWMye0j09HIRXF8SJMukQ9BHkGDo15Waa+nCFs5KAOQtIXM=
X-Gm-Gg: ASbGncv1k5ALWZ6JUfLlOYYIasWdQm4Cb8+1V/b++rb+btt8V3A1m4HNiP4Y2hmv+IC
	etAMPUtAhw2JjZ39fJcqXQVkDYjRUBiz71iDPhlK1B0eJt7QUGdevVTfZmUelxANTzpJzktkPGT
	bKzeFYuxWIwZ+YtkCyJNwEQybqkS5b0onINYO6WXAB76h2HEWJb5p8x4oOPIr3tJW4SWqTaZRzU
	q80gk4uglkxHEk5TXlIfjwJW3g2ZcZeKyduKqDrEuhMNJbmiSen5Oz6D2ohXpn8oLafCafLpD/y
	kxpO+ktWzNIXXvRlLn4t4u9Jy5b10ve4CwH9uCQmUw==
X-Google-Smtp-Source: AGHT+IET2FSN43B29b1iFIUfRnJqfxIL6IKEzFKmLMBZtkj51fE5xgUwJd+gTUEP7A/af82ElzoqFg==
X-Received: by 2002:a17:903:1cb:b0:224:721:ed9 with SMTP id d9443c01a7336-22c35981e16mr85524135ad.44.1744892666322;
        Thu, 17 Apr 2025 05:24:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:25 -0700 (PDT)
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
Subject: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Date: Thu, 17 Apr 2025 14:19:50 +0200
Message-ID: <20250417122337.547969-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052427_211738_4D2A13D2 
X-CRM114-Status: GOOD (  12.27  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRv
IHNldCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKbWFzayBhcyB3ZWxsIGFzIGZv
ciB0aGUgb25saW5lIGNwdSBtYXNrLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMTcgKysr
KysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCA1NyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDdlYzI0OWZlYTg4MC4uYzhlYWIzMTVjODBlIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKQEAgLTUwMyw2ICs1MDMsMjMgQEAgaW50IHNiaV9yZW1vdGVfaGZlbmNl
X3Z2bWFfYXNpZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJCQkJdW5zaWduZWQg
bG9uZyBhc2lkKTsKIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0KTsKIAoraW50IHNi
aV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9u
ZyBmbGFncyk7CitpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190
ICptYXNrLCB1MzIgZmVhdHVyZSwKKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNp
Z25lZCBsb25nIGZsYWdzKTsKKy8qKgorICogc2JpX2Z3ZnRfbG9jYWxfc2V0KCkgLSBTZXQgYSBm
ZWF0dXJlIG9uIGFsbCBvbmxpbmUgY3B1cworICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIHRvIGJl
IHNldAorICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczog
RldGVCBmZWF0dXJlIHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHBy
b3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworc3RhdGljIGlubGluZSBp
bnQgc2JpX2Z3ZnRfbG9jYWxfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLAor
CQkJCSAgICAgdW5zaWduZWQgbG9uZyBmbGFncykKK3sKKwlyZXR1cm4gc2JpX2Z3ZnRfbG9jYWxf
c2V0X2NwdW1hc2soY3B1X29ubGluZV9tYXNrLCBmZWF0dXJlLCB2YWx1ZSwgZmxhZ3MpOworfQor
CiAvKiBDaGVjayBpZiBjdXJyZW50IFNCSSBzcGVjaWZpY2F0aW9uIHZlcnNpb24gaXMgMC4xIG9y
IG5vdCAqLwogc3RhdGljIGlubGluZSBpbnQgc2JpX3NwZWNfaXNfMF8xKHZvaWQpCiB7CmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
CmluZGV4IDE5ODliOGNhZGUxYi4uMzc5OTgxYzJiYjIxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwpAQCAtMjk5LDYgKzI5
OSw2MyBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0
IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwogfQogCisvKioKKyAqIHNiaV9md2Z0X3Nl
dCgpIC0gU2V0IGEgZmVhdHVyZSBvbiB0aGUgbG9jYWwgaGFydAorICogQGZlYXR1cmU6IFRoZSBm
ZWF0dXJlIElEIHRvIGJlIHNldAorICogQHZhbHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBz
ZXQKKyAqIEBmbGFnczogRldGVCBmZWF0dXJlIHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBv
biBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLwor
aW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWdu
ZWQgbG9uZyBmbGFncykKK3sKKwlyZXR1cm4gLUVPUE5PVFNVUFA7Cit9CisKK3N0cnVjdCBmd2Z0
X3NldF9yZXEgeworCXUzMiBmZWF0dXJlOworCXVuc2lnbmVkIGxvbmcgdmFsdWU7CisJdW5zaWdu
ZWQgbG9uZyBmbGFnczsKKwlhdG9taWNfdCBlcnJvcjsKK307CisKK3N0YXRpYyB2b2lkIGNwdV9z
YmlfZndmdF9zZXQodm9pZCAqYXJnKQoreworCXN0cnVjdCBmd2Z0X3NldF9yZXEgKnJlcSA9IGFy
ZzsKKwlpbnQgcmV0OworCisJcmV0ID0gc2JpX2Z3ZnRfc2V0KHJlcS0+ZmVhdHVyZSwgcmVxLT52
YWx1ZSwgcmVxLT5mbGFncyk7CisJaWYgKHJldCkKKwkJYXRvbWljX3NldCgmcmVxLT5lcnJvciwg
cmV0KTsKK30KKworLyoqCisgKiBzYmlfZndmdF9sb2NhbF9zZXRfY3B1bWFzaygpIC0gU2V0IGEg
ZmVhdHVyZSBmb3IgdGhlIHNwZWNpZmllZCBjcHVtYXNrCisgKiBAbWFzazogQ1BVIG1hc2sgb2Yg
Y3B1cyB0aGF0IG5lZWQgdGhlIGZlYXR1cmUgdG8gYmUgc2V0CisgKiBAZmVhdHVyZTogVGhlIGZl
YXR1cmUgSUQgdG8gYmUgc2V0CisgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNl
dAorICogQGZsYWdzOiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9u
IHN1Y2Nlc3MsIGFwcHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitp
bnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrLCB1MzIg
ZmVhdHVyZSwKKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZs
YWdzKQoreworCXN0cnVjdCBmd2Z0X3NldF9yZXEgcmVxID0geworCQkuZmVhdHVyZSA9IGZlYXR1
cmUsCisJCS52YWx1ZSA9IHZhbHVlLAorCQkuZmxhZ3MgPSBmbGFncywKKwkJLmVycm9yID0gQVRP
TUlDX0lOSVQoMCksCisJfTsKKworCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xPQkFMX0ZFQVRV
UkVfQklUKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCW9uX2VhY2hfY3B1X21hc2sobWFzaywgY3B1
X3NiaV9md2Z0X3NldCwgJnJlcSwgMSk7CisKKwlyZXR1cm4gYXRvbWljX3JlYWQoJnJlcS5lcnJv
cik7Cit9CisKIC8qKgogICogc2JpX3NldF90aW1lcigpIC0gUHJvZ3JhbSB0aGUgdGltZXIgZm9y
IG5leHQgdGltZXIgZXZlbnQuCiAgKiBAc3RpbWVfdmFsdWU6IFRoZSB2YWx1ZSBhZnRlciB3aGlj
aCBuZXh0IHRpbWVyIGV2ZW50IHNob3VsZCBmaXJlLgotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
