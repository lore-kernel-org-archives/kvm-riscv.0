Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E7C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yED/VceyL2YjyYjD6WYmVQYHI7zF2AYz0NdbiRh/huo=; b=0wY0hvZLpAu6Ku
	sE/Eea4JVJXGBT9JNlQZ0YqDUUIc5KZ6xwDrIB2SZtj9Dm36+1YOdpQsCFPo9voRJIGHBpxp1UJN5
	RBcK6Ep6WYObst2Sgs47b95dlkCVugJUUOUq+EJp7bNLjsbo+LnTNpLyPvm/djJIu17Ewngij10Pd
	vzov0tXKaAFLgYyyuwGTJqUsDMJhY8Kuf/Qr/rvMeJagjSC2SI+t+z+cr+OlUNebUTeGUgvrj/utX
	OQUToxERZel7nOpCCA9HUjNi+CKdn8yj0i2PQif3wrMywiheIyMOMlAN4Ml7lhf4JwhwHeaW6F4tT
	7fGifAw9TaNp6Lt7KBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTR-0000000Cz5I-3dwk;
	Thu, 17 Apr 2025 12:36:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIG-0000000CvV2-0D0W
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-227c7e57da2so6327245ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892675; x=1745497475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=fBqL45jNz58LsTjvCt0EVqHylmVcV6NOlFR6FHkxLKIAh90goAhPA1kFWw5lP9vcBC
         zIo8e+XwIglIoo/iIA5B0n0gMbcI1JyNy2ndaxU7ucXJIZFZTW4+sHG3gpYID+HvHFZ4
         GC4AFk3FRExfvQiv13/i3wI6oOPfoMYnzEBSrWzDg4YL9NdrLNVDaOjlrHdB/MTbiCs5
         SVBoDQRjltijE1Aty2JZODcuKtG6Tvc314TBMAYR4n7HNC6ZPHRO9NSR4XbM2lOIaE9/
         zXTegC4xg8lb3yUg6JQIQACkpGjKRdNzlvagZ8UVo5D/YnxNqJy8TFR3rp8ugmOpUb3G
         xnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892675; x=1745497475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=QsLBBiZ6x+2lfxk3GsfwlsLhokLyaPfqjNcJSmUUQpUwhO4jQpO39vjDfepkWuKnum
         xVs4ug1eZadStue+sNcClSFUOvkmJuqdPpVfnztWg64ZO4wEoN9cR6nXHfT0zIDPRlWI
         xXm614WMXC186ElKtgf6xz0hwAxyfBqem0Ngr9lYW2v9JxuoQ0PKCaUgtzCqI21pX0JU
         E63ZwUpoq0VXORCRm0Eug4ImKiRi8Q+Wc92XHuzvaaDCsdW9Y3tfFuy6GqQoZxwJge4U
         yoxCbxKr5Jdjvg/S986kwu3rKE21H8zM8pz1XCQQCXT4H3hOLJ+2nqXg8OHUFWcyZBdU
         PpiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT5lRiQZYRDs4NS/Glui5nNRbqVRGmUmJo9rKtmzT4Z6J1Suw/qwj4DCYB9VD7wHb8KUJnLxNmx5c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk0xAQbniUAzEpKNqCey7Zp+XZ4gOH0QDys5wjmBHZXc9s7BRi
	LglJTksvxuwbrtrGUQ4R+c05KVt24Lz19lL65Uq0YO0kyFv8kWYIC3lQwFu7ELs=
X-Gm-Gg: ASbGnctO6z2+P/uujRNmtui23w2OEGG3R2KHf92j5+Kn/pB4l4OkCzVfED3vgn1V393
	ShJZ5uEt+SqSsv9yML49DePDTG/SAlAOuUWbvleOPqhO4z4CmtfsFro9B0UkQASi+RkxrAS3j6R
	o3bsdzO1E4++hIM7Quryc++oR2rEwhagm+glXE95YUcGMEJ275H3lR+DhqmwFH+QG8VoLY75vWl
	Ih+qVh9ZZzhpk9IKDXJYJgDz4JIsz56EbcD5Z86J/5tDmL+Xyi+kSHAN1jMlXVFAnZ1RdxrPg7f
	q08Yigy5vTUQ6kc/AIEaup5FH7jEUSqazeN3Qote1g==
X-Google-Smtp-Source: AGHT+IFwoPNkZRHRLCRUuOqGDF2uiHAGyCvd3q8quDmBUyk1f/F/4WvIpLrbGYXfNhaC6uEF0f4feg==
X-Received: by 2002:a17:903:2447:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c35916f13mr99932925ad.25.1744892675059;
        Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:34 -0700 (PDT)
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
Subject: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 17 Apr 2025 14:19:51 +0200
Message-ID: <20250417122337.547969-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052436_091102_B4E2EE4B 
X-CRM114-Status: GOOD (  13.11  )
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
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKaW5kZXggMzc5OTgxYzJiYjIxLi43YjA2MjE4OWIxODQgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
CkBAIC0yOTksNiArMjk5LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQs
IGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGlj
IGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOworCiAvKioKICAqIHNiaV9md2Z0X3NldCgpIC0gU2V0
IGEgZmVhdHVyZSBvbiB0aGUgbG9jYWwgaGFydAogICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElE
IHRvIGJlIHNldApAQCAtMzA5LDcgKzMxMSwxNSBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92
MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogICovCiBpbnQgc2Jp
X2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25n
IGZsYWdzKQogewotCXJldHVybiAtRU9QTk9UU1VQUDsKKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKKwor
CWlmICghc2JpX2Z3ZnRfc3VwcG9ydGVkKQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7CisKKwlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAorCQkJZmVhdHVyZSwg
dmFsdWUsIGZsYWdzLCAwLCAwLCAwKTsKKworCXJldHVybiBzYmlfZXJyX21hcF9saW51eF9lcnJu
byhyZXQuZXJyb3IpOwogfQogCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKQEAgLTM0OCw2ICszNTgs
OSBAQCBpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNr
LCB1MzIgZmVhdHVyZSwKIAkJLmVycm9yID0gQVRPTUlDX0lOSVQoMCksCiAJfTsKIAorCWlmICgh
c2JpX2Z3ZnRfc3VwcG9ydGVkKQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7CisKIAlpZiAoZmVhdHVy
ZSAmIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAg
LTY3OSw2ICs2OTIsMTEgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKIAkJCXByX2luZm8o
IlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9h
dmFpbGFibGUgPSB0cnVlOwogCQl9CisJCWlmICgoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtf
dmVyc2lvbigzLCAwKSkgJiYKKwkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfRldG
VCkgPiAwKSkgeworCQkJcHJfaW5mbygiU0JJIEZXRlQgZXh0ZW5zaW9uIGRldGVjdGVkXG4iKTsK
KwkJCXNiaV9md2Z0X3N1cHBvcnRlZCA9IHRydWU7CisJCX0KIAl9IGVsc2UgewogCQlfX3NiaV9z
ZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwogCQlfX3NiaV9zZW5kX2lwaQk9IF9fc2Jp
X3NlbmRfaXBpX3YwMTsKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
