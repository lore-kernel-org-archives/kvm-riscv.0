Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532ACC282DE
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EphbibLLwD3HYCn3QST3MMuZOZIOeLIqbfQ9d2oTQ1E=; b=NZ5v+TgnykNupJ
	u31aX6d7XDyE/I795r6K2oxuTDqJQRwCMwXhJWu0Le10APe1As0qUGz5Ww37Ovg/Le+duRKqHLXSF
	+zvb25xbJ9n8ze5tBj4fe8GQJZ03QWLt3aI5K5o8Fyoye772yypPqZ7V8NDEdtpid6+5ap3KPZ1Gs
	jmCo0AXZcwQRtoKI3hEdoYq8WhxD279gW/8VeCzcR3tFT1UnDgMOn84+FzDLWoadTdgCer7pnsS0a
	V8DqQ6SW5/rH7B85Xi/il6S7E8lcuG9bBwSYmHAGO7i92xx3q2PajLE2LTHoQA5V8whq8lDkmld8b
	TixzmVEKsq+LxrIZ9eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfM3-00000003GBr-4AvH;
	Mon, 10 Mar 2025 15:47:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepo-0000000380I-24yK
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-223959039f4so86595815ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619668; x=1742224468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=yC+ybaopEaJqXDGp/9K6/1Mujg0DWFIiAQRmv3Y4FGAJQFr+ji9kCBEqqI1aokSWGe
         l0wp0o87CTWppPKLzvVmqn+faoUshksSKAdCt2bNQPbs/LEdYT0i3tHAIfcuK+8qc15u
         fhVmJ6vOaDsJhg5xNp7RBTdKF5amdjYgxbRlHer85dJ424SMETiKwzPYLYxHbyYqJSGI
         JM6nipwTTj/YciGt3lw/XaX/kkRHFxMX9r3GewOGmkL2XJjGVzEb5I6rXcXZyHhVnUK4
         u/gPsIAccW77BZ/B9CqYqku4rotiXQVonoL6aig6sVGRexbGII/jYJC1Q3ebeG6BvFUv
         jhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619668; x=1742224468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZ6ZtCFLM2HDQCXfIF+4ZGwXAoERFl4mcxOr8+ok9D4=;
        b=g42THfOb1S21ywEJ0ccXCUNVFG126eBp3INuOpyJhqdquv+L/4JRD3yEl50DZ1aS0A
         hK6n+WqYJh7iEIM2thXAvVb9FLV7NOVp0pKt6RzK6EsZn9pWtWWz6mNpVLTYAwRxzMQL
         IW5znMqJR4x2r6201NOW99K40Mgk5efT5DxPJHbEw5/sOokneFTqyKiNcz6e4wYyWpxU
         siY+7nPBqvzEoLW9nw3sR5oXpKasM5lfru/LeOK56diHtagucY31MsWO5texBVB8mBcy
         kIUS0Am2dbrRz72SdsJQwz4bLYNf1wIY8APGun6DoIO19s61KOvGhZeCD2gc8ajy5xkC
         OHbA==
X-Forwarded-Encrypted: i=1; AJvYcCWM59wO6h78dQx4f0hyRVYXIqaF5J1AwZm9TsorpGGFB6faPY6I+9USerUb/N85YRvrfxTadQjm9Fc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOypTEoWuzpyc0LyY/kPkYXZHpYmxzdG4iMSNbJlMLiVRrGCDR
	0GbQONEovhU1/g8g6pE/gCqoSW86i6p+DhAr8tI51UJTCW/iTEWNR4aRLLrX99M=
X-Gm-Gg: ASbGncukgo9Xuc11L3jSvInflBxotFxDX0QKoOPwscwmasdbVobgeJZkOaSVwtrhBKM
	1YjXaaXOsAw7rvK/W7IlAY7TwD4SKVFZhLnyH/TnNcs3FxMUSQebJHHJYicSYRi+wjiBqLEMZ/T
	pdnJlglGAdYtd/4Z7KVQPJpdyR2vPIkr2N/802ltXyJ3FgEHFR7vQAc94LF0iWfXPkKEf5Bn6hh
	teQEtqePd/X/fwSSg0KJZYsQAsvr1kQXoFLstVabQZOH5Bcy/iDABwPU+DFuRTjGOBPJdniEwvR
	IU7oe65ubIx6xFvimHB0v/rMgWO1nupfTbzKMjngAGQ9Dg==
X-Google-Smtp-Source: AGHT+IFtA7ejSY4XIE1Y8FAoh6UcQJS/Qm4jl+kbYc+4FdTVNJHdwGd9aRrsWNeD8S620FnvoI8t0w==
X-Received: by 2002:a17:902:eb81:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22428bd592amr282068535ad.40.1741619667997;
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:27 -0700 (PDT)
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
Subject: [PATCH v3 12/17] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 10 Mar 2025 16:12:19 +0100
Message-ID: <20250310151229.2365992-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081428_534674_2DB435CB 
X-CRM114-Status: GOOD (  10.04  )
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
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBhNDNiNzhiNGI2NDYuLmNlM2YwZGQzNjY2ZSAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTg0
LDggKzE1ODQsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
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
