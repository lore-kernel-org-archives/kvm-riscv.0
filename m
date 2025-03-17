Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBE2C35FFC
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GIFQ0Y+P5MSHh/xsq5DshBAnqkTumWuC0BJ2Bu47os=; b=AkwD1wwnIEedOa
	F/NV1gUVCDIak2ejTeHsdEfAdfUjO7gvD1bB8zdh+G/BV6EYoAHvcIfra5IShhC5TqN9l8HJAwvVL
	Ovb2V6lzifO7GYxgiczu1saSpyWND87I59LtDI4C29VNr5TVOkmN+dYr6ux85UU4jN7VjSVah8v1h
	gfqAbxDgsHDh6ygE5KVImTL1VKQWc7Q09RHfuC1ANnRvl8N1XtR+wvOWjf+tpZRmmDapwCV81a8vC
	Msx9LocszXk0PXUOL9l8/aXNIQKEmdBecxnCQ0h+AfpDJtQ1J0yxvnnSSmEvFnva22wN6924dAmwX
	UbtmA/9A1Dxpdz9zR5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1f-00000003VMV-0Vzh;
	Mon, 17 Mar 2025 17:13:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDws-00000003TXk-47hB
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3913fdd0120so2469503f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231301; x=1742836101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=dJbyaJ0StGWPHArbgDm2H2SY9xQOJGwEMjU9rhZ29UiEJzCxmhDsyxcrPAIKcO7SRO
         xRhl2OtPo19D1Iopm+pQgIfrVFsf8zVEP48y2ttZ1bNp778DzOP9ijbEKC0CH862k/7e
         IzuolLpODyFeLnWqQLt/85yBkk6wgUVv6Ahd4rTDGdYsbXSTMmE6F1CWLWIf1dNKIbf5
         gp3zyfUhhdvdW+NaofFScPC8YIAJuvsGPc1TV6K86qZm6le7rKUWX6oThQ3LMYWmPJPP
         lI1crCbIjDB+5hImHhwNKU4pwwcbJ1q1c0ZH4Mtpz0Y7lmKPxaMYqGgceL+cu0VeMlzF
         LSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231301; x=1742836101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=wh8aUwkNVeEqOvTjkkL1Q0XDRaI4akBg3SsSaxgor1ritL9okcf53F7yl0t4PfSo6L
         6HbzqoejLJyFTx027njmDhed7Q7Qau3Ogcv1ogaKvfC1zn1rXs0buR7kestj1tWZJc2z
         R9vjuXdguldoXqv/PgZ+1+aFicpiGefW7XFSaKkSGY+62OrTNUUiKRI77J41bN4MZP3R
         PCM9E3jbR+a9OD6RUY/IJieXpKFLfZNpY42a1NSzXpbRo/qI0bwerUfUxXyaE+qO+ZWL
         mc3uxUIYE4rNwsuwMdhoGb7Kuy8IRUKqjg5xAFxtRmfp13juVwbVB3nzElvGTX/tpApi
         Wh4g==
X-Forwarded-Encrypted: i=1; AJvYcCXCuS2o6yFSergeVcIQjYqNxUTs5OWvd2jBsG4u5NwKmLaQfNBw+SjmvPFNsSSQLEvZ/yKbb79rYok=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmK1BbaBmeetHBALQQLwSZF/vLvFnNqsCiOghTRZ4xb/HwYzvK
	yjmgO0chdrkvrFSFTaDK58SH9ILjLWk28b3HfBMp2EyHxydqW6VRY9C/FNa0srU=
X-Gm-Gg: ASbGncswDmTchIx5BRc8uDZocuDxQKJjOIir8YjXk5/V6fX/yd9S/Ss2Q8VCmMXJwdN
	6bpkDw+nutP3qG1VvmaUkgj4REs28HWadxn+uXv9Yy9/7bfCHGYblgUD4xAnKXvh2akYheSQU1f
	h3iF9AFtl9d/cntQEBQISs49XqicDK9XQSKCDMriLHIlrcGMmaMl2yTCXYuJkDn3dU3oJVZfaIp
	/u2HWpn0mv2eH+L7EeAzXgRNJJeG/+cOQ4tjasu6cqeW2VoKjFoccjyAi549JKrmpHhKR7H1NSI
	mKdj/GIkXfUtlcerAwUcpBDOeNZNQ5+KeScxR3IQQEDkMw==
X-Google-Smtp-Source: AGHT+IE6X4Zl2SvCnLBWCWxVkBGrawQ8DSM4qV1sZG6LsJ3FF5B07Zi+O2FlbpqV8a0E2j6PRS6VBQ==
X-Received: by 2002:adf:b183:0:b0:390:f88c:a6a2 with SMTP id ffacd0b85a97d-3971f12cd8emr13396928f8f.39.1742231301480;
        Mon, 17 Mar 2025 10:08:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
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
Subject: [PATCH v4 13/18] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 17 Mar 2025 18:06:19 +0100
Message-ID: <20250317170625.1142870-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100823_016478_0FAFA639 
X-CRM114-Status: UNSURE (   9.37  )
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

cmlzY3Ygc3VwcG9ydHMgdGhlICJ1bmFsaWduZWQtdHJhcCIgc3lzY3RsIHZhcmlhYmxlLCBhZGQg
aXQgdG8gdGhlIGxpc3QKb2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBkZDQ5YTg5YTYyZDMuLmEzOGU5MWM0ZDkyYyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTk1
LDggKzE1OTUsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
YWxpZ25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMg
c3VwcG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRs
eSwKLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0
aGVyIHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2Yg
ZmFpbGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2
YGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11
bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGln
bmVkIGFjY2Vzc2VzLgotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
