Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81FDC7115C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEF3v2R1/lhe/2tYCHygMM9iSaSluHe3BdhrGNXZtBc=; b=m3jau/KqWlHBR7
	fW+02syvpbJcKNuB2YfMnrVjaVHvJ7I/86e6Gj7MMblE10T1dtXb6hKnSsdyd8BUQeXOtByvSy5aq
	zb6shenVUvKgvXx3D6BZkl58cG+ynobF3ShV7Q9MxbxyQ48L7htDmOpedIwVLJByXDdQFD+B+ATRZ
	5BXfMQQONEi+msCmGpB1PXi3VM6OlWS03r+ju9RnG+z2Cfaw/Jr3STB3Fu14csWGOhBv0E+ZsV8Xg
	XRhEmcQ4QAzXroklDnZj6QhJMlcPQcrKmjPB5bZkWp8qQq812J2SW1QvUeBBI90pU/WmqGA9UNdZm
	TpDzivc6tDi2gL4vlzdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGj-0000000GWYd-1yqK;
	Fri, 20 Jun 2025 20:23:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFc-0000000GWHs-2SeT
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23526264386so25182215ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450936; x=1751055736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+zRP05sT2nYVu63jmc+xv4tV8ecuFPHchJnn/1sRt8=;
        b=ngztewIP+3sbm9D66M4tJsl1ho39FtkCC2w0cLfNv91o8TshvgRAkiZ0b+YloOEpPd
         YHrR1AaQS2FZiKsPg+DQB0WO6EhwhuCzVbp4LBGSJBNzx1Gd9vSj3FjLyjEqCA3yOFOQ
         orRW0ta/2tZXjTC5rIFXkQUq8omb3O5cZIELHr/M8d+DT8JB5z5qyGlRCBXP+Oz1LShY
         wk4Q4gf0na68XCm0UG+XsUsmMcsH5FXBS2LvTDKSomiB6Dl/A1QqVkLC2IG5WLqRNLSj
         Z1bvHIMbKhFevDWYbRe86w2o6C36wPuR/KJ2ssYfpqBr1UqDa6uuqFDjVILnkJTqPQFc
         27yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450936; x=1751055736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+zRP05sT2nYVu63jmc+xv4tV8ecuFPHchJnn/1sRt8=;
        b=nStkSNfoyQRXSeDn7YF8IO/DF9ZCZJU9+rVr4RKWvbT/AKbHMIrZ2Asijs1tunyr65
         rBZTDCXWHiChvcHbLlQMscffMn6u21st1/MOnCcw5y3a9C74yT4WFD1s8YNGB+NsNp5L
         UvWprTZH6gmGqrb5Dwt+eB2glTfgxlCItgmCDLbrjNdeFuknoGl8iCIOInQsMGfHc0O8
         LO1j90lNkiBwrHuSEksEGy0ghuXvHUSE7wNICYz8udCoruUvAmjGP6TZ5/fjuukbS3zU
         jMNf27KwyPpDuUXWHSNmVplC77zxO0rwsGLQQtyXgpPCba7tFLMBjX2pOsuEfsZbP9g+
         UO5g==
X-Forwarded-Encrypted: i=1; AJvYcCW5zAi6ivdnP4JTlwwH/pzPWQW7YgMb7Xa89BfQKsk3isE1lFiW7FXdr6xUK751koEimjrRhVCoC4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbiQNJyPOp68jJRbdBH3tZQZz0oiAfh5R11VvVDdlFMuWL1/Oi
	uJSSD9rqcVmyIiGjzaKfATYR02GaWwzIRIPeYngPyXbgDLJ9Y9WPANBW6i3MQomWhOE=
X-Gm-Gg: ASbGnctvktv8DircDyee4FPz5L+8SR2bchvExtb8+IiuW7GdAHjHDst7HQEO48l6GCO
	FAB5s0H4JKBNPaHre/T7OIiXcwU101YbzQ27PtLIJVPP0Ox/HxKtd0bMxLyuQnAiyLkafkDUtTv
	oVJvxJxeEzksvASNm5hLdgUpVyWselaFq+AOfmSwhB3P2SbeXjQdJGpDP8CRd9otWFdO468cdFF
	Uq+EbX43Es4Iipoi1jSbstL3eMyrsbNze6z0vpu3xm2VVVMNkZIwuxATaPxtEO6CSZ3dgB4Mtrc
	JT9h7IB3Gg9c1iPsnFFYhmsy3YgKBbtPqRU1mp2nQtXN1Stj7SVpTTip4ZXh2oZgM9H05JU3c70
	4aiM65/4S8deFjgm6dkN8jGpQzaPT/HC8kw==
X-Google-Smtp-Source: AGHT+IGxF3Y7GuTw7cF2rLjoHJi9Q+J10U0wcLkyab0NxUAfAKaXxRxyLreJ/M4k337d4xGl2V1n6g==
X-Received: by 2002:a17:903:40ca:b0:235:f4f7:a633 with SMTP id d9443c01a7336-237d9917e38mr65455185ad.28.1750450935857;
        Fri, 20 Jun 2025 13:22:15 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 20:21:57 +0000
Subject: [PATCH v5 1/3] riscv: Fix typo EXRACT -> EXTRACT
MIME-Version: 1.0
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-1-d865dc9ad180@rivosinc.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=A1P6kxgEJNmX9GHIO3H26K7yk2m8/f23Gd0ZQ/RNXe8=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD71PWD2XoWjx0cuV9YUOOycnx6/eWvbgZ/k7Y6ZNB
 YnVb641dJSyMIhxMMiKKbIomCd0tdifrZ/959J7mDmsTCBDGLg4BWAiYtsZ/nBOqzx68FDIy/8S
 7cybFgRz7FzHYt7dzGNquHxz0tw38vMYGa66Znaku/smceTExJS7u2zin8rvVLfAPthwZhZPqLc
 mCwA=
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132216_622951_37883EAE 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

U2ltcGx5IGZpeCBhIHR5cG8uCgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oIHwgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2luc24uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCmluZGV4IDA5
ZmRlOTVhNWU4Zjc1YWM2ZWU3NDFkZWQ3YzZiZWFhNTc2NzdkMTMuLjJhNTg5YTU4YjI5MTdkNjdl
ZmNiMTg3OTJiMDVmNWU2NDBiZGEzN2YgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaW5zbi5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi5oCkBAIC0zNTIsNyAr
MzUyLDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIHJpc2N2X2luc25faXNfY19qYWxy
KHUzMiBjb2RlKQogCSh7dHlwZW9mKHgpIHhfID0gKHgpOyBSVl9YKHhfLCBSVkZEUV9GTF9GU19X
SURUSF9PRkYsIFwKIAkJCQkgICBSVkZEUV9GTF9GU19XSURUSF9NQVNLKTsgfSkKIAotI2RlZmlu
ZSBSVlZfRVhSQUNUX1ZMX1ZTX1dJRFRIKHgpIFJWRkRRX0VYVFJBQ1RfRkxfRlNfV0lEVEgoeCkK
KyNkZWZpbmUgUlZWX0VYVFJBQ1RfVkxfVlNfV0lEVEgoeCkgUlZGRFFfRVhUUkFDVF9GTF9GU19X
SURUSCh4KQogCiAvKgogICogR2V0IHRoZSBpbW1lZGlhdGUgZnJvbSBhIEotdHlwZSBpbnN0cnVj
dGlvbi4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmVjdG9yLmMKaW5kZXggMTg0Zjc4MGM5MzJkNDQzZDgxZWVjYWM3YTZmYjgwNzBl
ZTdhNTgyNC4uOTAxZTY3YWRmNTc2MDgzODVlNjgxNWJlMTUxOGU3MDIxNjIzNmVkYSAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dmVjdG9yLmMKQEAgLTkzLDcgKzkzLDcgQEAgYm9vbCBpbnNuX2lzX3ZlY3Rvcih1MzIgaW5zbl9i
dWYpCiAJCXJldHVybiB0cnVlOwogCWNhc2UgUlZWX09QQ09ERV9WTDoKIAljYXNlIFJWVl9PUENP
REVfVlM6Ci0JCXdpZHRoID0gUlZWX0VYUkFDVF9WTF9WU19XSURUSChpbnNuX2J1Zik7CisJCXdp
ZHRoID0gUlZWX0VYVFJBQ1RfVkxfVlNfV0lEVEgoaW5zbl9idWYpOwogCQlpZiAod2lkdGggPT0g
UlZWX1ZMX1ZTX1dJRFRIXzggfHwgd2lkdGggPT0gUlZWX1ZMX1ZTX1dJRFRIXzE2IHx8CiAJCSAg
ICB3aWR0aCA9PSBSVlZfVkxfVlNfV0lEVEhfMzIgfHwgd2lkdGggPT0gUlZWX1ZMX1ZTX1dJRFRI
XzY0KQogCQkJcmV0dXJuIHRydWU7CgotLSAKMi4zNC4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
