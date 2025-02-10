Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A6CC02198
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7YipELAsfgruIWbIZQgUyMJDpJWHgv6kH0m1eg8/0pk=; b=zLSBEUsxI/U/u6
	66GZPKcM9mXRSxNaczOdfe5eSjh06xdRZ2kkZ6XlVhZnkmaRFVCfmFo/H2QeSDZOXZc96Bh1jHcn0
	ZxDB6bE0Qzcm8+NrxBuX4R+H+6EpArWg5Piny8tkqVBXo5w142TyD7Mg/l/ohHbXuJDTgRg0srKPe
	Cgxmu72Temwrljq8061XAYvtneQLNAMmGxzwE1dKnkXaRiljixCP/Dn+8IbDbfKeouNCthNalxcEe
	3dZazdI9YrWGP9l6rcuDpTvUUIAplyKyFHMU1OriM2gOHWFX2+W03Yxri0M5X3eLKk+KBJK4+QliF
	NalEfGm339vN0W/0BnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbb2-00000001YQS-2YIa;
	Mon, 10 Feb 2025 21:45:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRv-00000001VQ8-3qwV
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so1525795f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223374; x=1739828174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=dbu+XeA9MAYnScbolaP3CtUclJ44e2xkxUSdbinjC8eghPDi+x33nOQXL2LNQc7twz
         +vGh8fE3H+jxLRV0G4K+HhrXeGs2p4WOO+IiochBPUldmKcrJrrtlP9PqFZlDCjcdaZG
         ryaFDprPzu7K1gfamAElAuCMZuP2t4IWqgVepxExxvlgd9aHsQm6fHzI5tDZML82iCty
         IbGzQXbeGwrhArmeMjVyin03Db3y3EeeZM0z+zEV4bH3PTTTQK1hk/y+a9y6y4mBIFWb
         2pMKOQZp5CdA+r92dZX1SwYO4Ad7e7N1WCiP3EBHbGI2IMifDW15LnhDPrt/Z0cI4OiS
         0lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223374; x=1739828174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=cuqoBlDZc593Te7EVy2iTsW0g0iIHFrKiaDs75OHSmo/ZyqoQdYJU3oSjS1hzIiTOG
         1CPLuieQjANEJySIUERfb6FT4VrBt7UBiHT/rlTlPXZTL1oZXIXqrXAq45503CSoPSJb
         UieHaz7561zBscls77Pb9ZPrpRPbrH254hRfXdyv+x8qTakRHD4iATYU6t+PYnGr1tqM
         cacr7dhOfARdD1hU8iiZNXumlkA8eMnegfYb2d5tPgpp6noCAtbc6+SqEKYkM/bRTZg/
         75cT3n9CvI6Rr2vBq4DJihBsPPERhNMM0pnPher3erSIYeLh5GhmVGdjsw4XM0yyYf+e
         DLkw==
X-Forwarded-Encrypted: i=1; AJvYcCUBkwwvElvVBS2OFMw31LSGKGOmOOjvKb6ZQEO4kzrd8OCEcvVLqY2xL/Rdja/LiTnT17DGmgujFvE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0bzVcuwF/DDIyR3WPbLXUupPSlsjL9GOqOWOIokW6SICU87XA
	cUJzevZY21RQCHBn6jIZB4id3gVCjJPX+5d8qo0z4z0OKiigWSBKg3KG9CKnrRhrFCWbrZC6Ne7
	wugs=
X-Gm-Gg: ASbGnctAdT8mJWnAXhSvN0GnvJBmnk5D95e8WOOBO+qttNj3RHgCFuCHt1fwCZEwDZw
	MLHWzKybvNfBnbIFH2RlgOshA4og2Ty8Covuzmqc/Si2/y4a/JOcZKzD6hVsEDKYq5B9+hmmtAj
	GfmfjciWTIOqZcOHmV8gU1euS5SfJ56V8gp3mupcnK7Z+515rlqCcG0LmZJsB8RRDceL7fVjBg+
	qpkP4m/pf8GC+S1u3yC4TQlY8XYmYdXpI8Qp4mbsqRGt4Qq+9hE2aG5tVgLYmUHr6KmciKPwX0Y
	cE913654/+c9a2+L
X-Google-Smtp-Source: AGHT+IFeyF81bBn0bup3UjkgQ031iOdpi9/jVXiALJpdAtVQDgUVud0mvsDq+oa8j9/bPhnXjupeow==
X-Received: by 2002:a5d:5552:0:b0:38d:c2d7:b5a1 with SMTP id ffacd0b85a97d-38dc8dddd9amr9308427f8f.19.1739223374260;
        Mon, 10 Feb 2025 13:36:14 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:13 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 08/15] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 10 Feb 2025 22:35:41 +0100
Message-ID: <20250210213549.1867704-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_133615_957615_3FECA463 
X-CRM114-Status: GOOD (  10.59  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2VlY2MyYWRkYzQxIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHsKIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGly
cWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxlX2lycXMgPSAhcmVnc19pcnFzX2Rpc2Fi
bGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVwdHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQg
aW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJaWYgKGVuYWJsZV9pcnFzKQorCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FEKSB7CiAJCWlm
IChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpAQCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRy
ZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5hYmxlX2lycXMpCisJCWxvY2FsX2lycV9k
aXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKIH0KIAotLSAKMi40Ny4y
CgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
