Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3EEC35FF9
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTnaF6DDv0qBQEz5dkN6IDZw/Y+7NBRjmj4jkvjv6h4=; b=pw3jBUX8KL6gog
	eZuEgN7ivpn43+aKJzy1RhYyKuzQt9HhF6GAV0vQgKksOcp9ulx74TOqYl0EL52iOkx7amgMXInlO
	BIsnyl1fArqmwxcO9MHa6EJt6eJ5xW76YTlJ/Y1l434XqQ6uM2Uy9psYiTG2GGMQ+Y0EaVLxEwlm/
	bxzH4UXy625zddl0HlrVq5uBTKPdcPXvI2olxT8t5bjlFAZmYuHt1teEyJHQlxyzWdLn8QbIh8qsp
	ErEKQiyDUSBFlrxvJFqMPho/p3zRWgJcdPWH6urrnNWdwGoAVwCiTixmjATE13nqlRiitc29w3bDN
	iCmgzfQ47hKlwh07lsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1O-00000003UvJ-3sCf;
	Mon, 17 Mar 2025 17:13:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwi-00000003TOZ-39uh
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so13877965e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231291; x=1742836091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnEzy7kWLGCaTTq9cfZB5uZycg5cp6OZgHd6PiXZO0Y=;
        b=ZN0ANShPDFbUMs1yoZL0JOh0AEykczSmWPJ9zckLFmuHoMRrFO1KcYdBfWY7lLWsob
         s4vI8YvKPYk4ZvN90i6DdrEAB9UHv2x9TQ5dRQwYHkDgz7fYk0heT86muDT0yETDzShm
         GdqcUnX+WoCiLCrUZ3CYvCNVtVwIQNXt5TjQYnVZ9noa4/EOgNVJoBZJyw2Kyh+Rx8wm
         WqCuV3DUuToiDTJA72YVSHkzY2KZffq/65OayL6nRNDVR3Z7XNV7roLlQXXL/S6Q89vT
         2K5Tfiy5k2UcpeUUjvcqNIjb5FArLImNDxS8XGFeXk3GbFgrDFaA4ejMQ3PEqGy6blj8
         d0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231291; x=1742836091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnEzy7kWLGCaTTq9cfZB5uZycg5cp6OZgHd6PiXZO0Y=;
        b=IbOCoZUqkE0Gi5QJiyX1jqLakqcOzKiUOHRI5YW98Lo8Ul6N0r+2OSC9zYUtAebiXq
         33YOAe9UmQdWYLykxTX1gOon6oxsj5VvX3zSLWsTsDQ58w7iL7AZKVkoL82k9BeJ20Kz
         LUZxBBm4c/y6WadPVJEM77+JsbYU+2lMAqGFwFDRAMYx7+q7jSKqr67w1/pKEe8mcTF8
         i6CY1GUBvXHqHKbunV4ogHlo96yqWn8+taXA9MFYtyzzOipaXsibZzWMiiE88Djmo5Qn
         lxffKR3D+IY7jHASs8Q/ijArK2x+fxmhV+L+zSjL92xkwvb4vLbYFdEOiafOzxwB8CIC
         QwDA==
X-Forwarded-Encrypted: i=1; AJvYcCXwM+kZ7v/BBZz+c/GUWluxU79EM2VQACkPMcVczgRxQmHoM0XDlHTMLVHi9W4Mn+ufqHTE9EYUDxU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWVmlfHqV5Ck6ehp28/IDjAHH0EVc8WHW7MrVqoZZlwo2WZV3n
	D97aKPrUwqJDu5k91VjgEXiFqywnYadAIlFLYBeDNu/BYbIQgesV+PWUR8d/q94=
X-Gm-Gg: ASbGncuVcvZBBy1mkmvSPBgQNuJMzJlB1vtjas9IgIEyamIIgcdqTbFOTjP+r7O4EL6
	I/AfKEJnJM8cOCBoW3ppPt1+DSC8LTJHRbrfPT/DD8aB6JjJAEGDcaR5oPs1s+2tb7s7FTpo3aa
	cyMptYslEgv8CUt5SHWvET+r2KiwVi3wT/ucAcVzmrZVtGES5v76gp2pmL3FzROq9HIcEZBMHZ2
	tGC4qyO6rO5ncTnoJpPXvOS3OKpMAKdoHPllinMLO1g/xoVmgv4db2zNvZuMDxwHdlSCmlNtjCa
	IlbY70M6q5dBuR8WNiNcLCazQFXFvA7Gw2ovjoUN+wZ+iQ==
X-Google-Smtp-Source: AGHT+IEhk9ILCkt1d4miwCrhVE7Pp8SXCLMrmpN073cNBxqpViWwe1YnhF1uSTy7oETuXKPGMPnacQ==
X-Received: by 2002:a05:600c:a53:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43d390976e7mr2112565e9.14.1742231291216;
        Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
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
Subject: [PATCH v4 04/18] riscv: sbi: add SBI FWFT extension calls
Date: Mon, 17 Mar 2025 18:06:10 +0100
Message-ID: <20250317170625.1142870-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100812_793042_65817514 
X-CRM114-Status: GOOD (  13.50  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCBkNDFhNTY0MmJlMjQuLjU0ZDljZWI3Yjcy
MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMKQEAgLTI5OSw2ICsyOTksOCBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92
MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwog
fQogCitzdGF0aWMgYm9vbCBzYmlfZndmdF9zdXBwb3J0ZWQ7CisKIC8qKgogICogc2JpX2Z3ZnRf
Z2V0KCkgLSBHZXQgYSBmZWF0dXJlIGZvciB0aGUgbG9jYWwgaGFydAogICogQGZlYXR1cmU6IFRo
ZSBmZWF0dXJlIElEIHRvIGJlIHNldApAQCAtMzA4LDcgKzMxMCwxNSBAQCBzdGF0aWMgaW50IF9f
c2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAog
ICovCiBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkK
IHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNi
aV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2Vj
YWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX0dFVCwKKwkJCWZlYXR1cmUsIDAsIDAsIDAs
IDAsIDApOworCisJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7CiB9
CiAKIC8qKgpAQCAtMzIxLDcgKzMzMSwxNSBAQCBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJl
LCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVy
ZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4g
LUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBv
cnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRf
RldGVCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwg
MCk7CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAog
c3RydWN0IGZ3ZnRfc2V0X3JlcSB7CkBAIC0zNjAsNiArMzc4LDkgQEAgaW50IHNiaV9md2Z0X2xv
Y2FsX3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5l
cnJvciA9IEFUT01JQ19JTklUKDApLAogCX07CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkK
KwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxf
RkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02OTEsNiArNzEyLDExIEBAIHZv
aWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJCQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24g
ZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVnX2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJ
fQorCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMywgMCkpICYmCisJ
CSAgICAoc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpID4gMCkpIHsKKwkJCXByX2lu
Zm8oIlNCSSBGV0ZUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CisJCQlzYmlfZndmdF9zdXBwb3J0
ZWQgPSB0cnVlOworCQl9CiAJfSBlbHNlIHsKIAkJX19zYmlfc2V0X3RpbWVyID0gX19zYmlfc2V0
X3RpbWVyX3YwMTsKIAkJX19zYmlfc2VuZF9pcGkJPSBfX3NiaV9zZW5kX2lwaV92MDE7Ci0tIAoy
LjQ3LjIKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1y
aXNjdgo=
