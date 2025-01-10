Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E723DE7719C
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BOSDSvajtfIpNyanVHiM2TS9hzi4FgDHoR5xN5eoSE8=; b=yxeg+TXuaEs6x9
	tK6BeSUOEHnekkqciczVyTzvxD4bKI68xrp/THZIDNYZs+9TGKqpliQdY4FEB1QrNO/Q6s56TE483
	UWAmyGoN/C3O7ZbkwaimXCX6ufyMSyuMX5Rc2ZrEAj5+K9rba264ZaLvlLGVBrBD3jKKVwMl9u7TT
	yaJaOLk3vqx9AjcqB6mGm3dYFvQRTPSykjX/PztDtm9hbaYMagFFEB2XafwEz4EuHkbU+Z5OJ0DHN
	Mr4thqcx+XQda2mcR2RK0+YrInaT/5O5io6MqMLY1JOtNzZSldCq5F9ZyZFyGyVpW53xqgeXPFQJr
	64V8teixSqNlf1UDWwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwq-0000000F4XS-1uHT;
	Fri, 10 Jan 2025 11:13:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCwn-0000000F4Vy-3RDM
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 11:13:03 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso14512375e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 03:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736507580; x=1737112380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cvtjhmhnFALzHo5ylM2nYcQXcJNhmIYsbqZ49LuOAJM=;
        b=FrrNVDYlUxcCgz7C5EQsJEyFhKOzp3lZfc2RCKAdOrUjdr6X5CdKMrwBNwSzduJuTR
         Xp0CCFzVPaGufSnb3/JkAJzZHVETxxPSHjnONWVcmJ4saDctKEpu+w4vRIQmWZga2Fvi
         eroYdtJH14u5Fzz6xbcjo+gJiy6FSIsnhAnwl1PfJjzeRGX+j4HRPaeyfHtwMYYAzGkx
         N9lanFLcoPkU10lIucrt6eWy756G6IW0rc5V9eTWZA+S5fIF8TVfBv6rTtBBcKuzPgJo
         FQHYW3V/4hWZ4c3WYfYi3mHylmP8/1w9FEe0Lo9rXXPLrmSCi81QMnIl6HX9xRxyHWEK
         HKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736507580; x=1737112380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cvtjhmhnFALzHo5ylM2nYcQXcJNhmIYsbqZ49LuOAJM=;
        b=EDCzgRvcuxKlH1xJ6/azbJLkP+2R4pLCc9KfrvJaQ8hts6GwhiJAYxDhGLtT2wdZTI
         HwGLbcq63xE3mFsd8KXQROw54wrzAzUdQFkzYZ9r6GeDGqPiZcr29Xd3+A3cPz+mGtsK
         p4nS9dMarMY7PlFVD5uQPrVBM+r2pvTbesUs/UpRbddP309BErUtc52Z61gEtd59cD3u
         3PavlBbCmwJrgZQj+uL5mtDA0e8WZGMjFB3eVautLNJ5rIcxhFiYFaSDtdgADVWUy87c
         g09l3zjmy7i+LLKglzs8qIwk+KG5nX4g9ARPWOYIPVeNUrnizevQAchqVmlZUR6HhABs
         /ZVw==
X-Forwarded-Encrypted: i=1; AJvYcCWRhnVdoXFM2tvqgIZR1TBXO+SV2FidF/LlCAXAxxJxJSDCDvdPtihMf5tVEKd9SbsAUzr8gDUIZDQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNMYsjRScgnSUa1OcPpFA3om+TjGFlTWGWUBGRiouj74+EWXP
	72u0W2MGXVEcgsBNIkLvfzHRhAx+Myn7Wzyvd76E7Kuvf3PjaKm99vbTqzDaWdc=
X-Gm-Gg: ASbGncva6xRBC8tDVogvisvZ+Ewt7+GBKBkFHaWEycbVXXSGyev9kLyiQ7+NPFDCrYv
	yVAGK7akSujJJ6RR1pQwwoojRV98Z43r4GJRIYwej4CvCDOE0o9boUQ2VUGo7BDMymYf7jve0Ww
	teEAzrJ6bbDmOgcmM1CEtYsPPg5qfz2FTYZQiDVHxTw4TBUmFB2QUWgLOWNeVusUT1DUrFFRS6Z
	3UCYTMUovko+LwWux/8O3vokXlgMIjFODjux+D+n+2OeUWzmngT+tUelw==
X-Google-Smtp-Source: AGHT+IFxrA4TF3MNStiKx6CJDnq7rdlWFFux+wCJ2jGt4Y3FYGe8jIz1FVZj/htS+4CyB+m8FRfm2Q==
X-Received: by 2002:a05:600c:19ce:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-436e26f857fmr101269725e9.31.1736507580056;
        Fri, 10 Jan 2025 03:13:00 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c1d6sm4344459f8f.50.2025.01.10.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 03:12:59 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v6 0/5] riscv: add SBI SSE extension tests
Date: Fri, 10 Jan 2025 12:12:39 +0100
Message-ID: <20250110111247.2963146-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031302_116466_B44E395B 
X-CRM114-Status: GOOD (  13.33  )
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

VGhpcyBzZXJpZXMgYWRkcyBhbiBpbmRpdmlkdWFsIHRlc3QgZm9yIFNCSSBTU0UgZXh0ZW5zaW9u
IGFzIHdlbGwgYXMKbmVlZGVkIGluZnJhc3RydWN0dXJlIGZvciBTU0Ugc3VwcG9ydC4gSXQgYWxz
byBhZGRzIHRlc3Qgc3BlY2lmaWMKYXNtLW9mZnNldHMgZ2VuZXJhdGlvbiB0byB1c2UgY3VzdG9t
IE9GRlNFVCBhbmQgREVGSU5FIGZyb20gdGhlIHRlc3QKZGlyZWN0b3J5LgoKLS0tCgpWNjoKIC0g
QWRkIG1pc3NpbmcgJChnZW5lcmF0ZWQtZmlsZSkgZGVwZW5kZW5jaWVzIGZvciAiLWRlcHMiIG9i
amVjdHMKIC0gU3BsaXQgU1NFIGVudHJ5IGZyb20gc2JpLWFzbS5TIHRvIHNzZS1hc20uUyBhbmQg
YWxsIFNTRSBjb3JlIGZ1bmN0aW9ucwogICBzaW5jZSBpdCB3aWxsIGJlIHVzZWZ1bCBmb3Igb3Ro
ZXIgdGVzdHMgYXMgd2VsbCAoZGJsdHJwKS4KClY1OgogLSBVcGRhdGUgZXZlbnQgcmFuZ2VzIGJh
c2VkIG9uIGxhdGVzdCBzcGVjCiAtIFJlbmFtZSBhc20tb2Zmc2V0LXRlc3QuYyB0byBzYmktYXNt
LW9mZnNldC5jCgpWNDoKIC0gRml4IHR5cG8gc2JpX2V4dF9zc19maWQgLT4gc2JpX2V4dF9zc2Vf
ZmlkCiAtIEFkZCBwcm9wZXIgYXNtLW9mZnNldCBnZW5lcmF0aW9uIGZvciB0ZXN0cwogLSBNb3Zl
IFNTRSBzcGVjaWZpYyBmaWxlIGZyb20gbGliL3Jpc2N2IHRvIHJpc2N2LwoKVjM6CiAtIEFkZCAt
ZGVwcyB2YXJpYWJsZSBmb3IgdGVzdCBzcGVjaWZpYyBkZXBlbmRlbmNpZXMKIC0gRml4IGZvcm1h
dHRpbmcgZXJyb3JzL3R5cG8gaW4gc2JpLmgKIC0gQWRkIG1pc3NpbmcgZG91YmxlIHRyYXAgZXZl
bnQKIC0gQWxwaGFiZXRpemUgc2JpLXNzZS5jIGluY2x1ZGVzCiAtIEZpeCBhNiBjb250ZW50IGFm
dGVyIHVubWFza2luZyBldmVudAogLSBBZGQgU1NFIEhBUlRfTUFTSy9VTk1BU0sgdGVzdAogLSBV
c2UgbXYgaW5zdGVhZCBvZiBtb3ZlCiAtIG1vdmUgc2JpX2NoZWNrX3NzZSgpIGRlZmluaXRpb24g
aW4gc2JpLmMKIC0gUmVtb3ZlIHNiaV9zc2UgdGVzdCBmcm9tIHVuaXRlc3RzLmNmZwoKVjI6CiAt
IFJlYmFzZWQgb24gb3JpZ2luL21hc3RlciBhbmQgaW50ZWdyYXRlIGl0IGludG8gc2JpLmMgdGVz
dHMKCkNsw6ltZW50IEzDqWdlciAoNSk6CiAga2J1aWxkOiBhbGxvdyBtdWx0aXBsZSBhc20tb2Zm
c2V0cyBmaWxlIHRvIGJlIGdlbmVyYXRlZAogIHJpc2N2OiB1c2UgYXNtLW9mZnNldHMgdG8gZ2Vu
ZXJhdGUgU0JJX0VYVF9IU00gdmFsdWVzCiAgcmlzY3Y6IEFkZCAiLWRlcHMiIGhhbmRsaW5nIGZv
ciB0ZXN0cwogIHJpc2N2OiBsaWI6IEFkZCBTQkkgU1NFIGV4dGVuc2lvbiBkZWZpbml0aW9ucwog
IHJpc2N2OiBzYmk6IEFkZCBTU0UgZXh0ZW5zaW9uIHRlc3RzCgogc2NyaXB0cy9hc20tb2Zmc2V0
cy5tYWsgfCAgMjIgKy0KIHJpc2N2L01ha2VmaWxlICAgICAgICAgIHwgIDEyICstCiBsaWIvcmlz
Y3YvYXNtL2Nzci5oICAgICB8ICAgMiArCiBsaWIvcmlzY3YvYXNtL3NiaS5oICAgICB8ICA4OSAr
KysrCiByaXNjdi9zc2UuaCAgICAgICAgICAgICB8ICA0MSArKwogcmlzY3Yvc2JpLWFzbS5TICAg
ICAgICAgfCAgIDYgKy0KIHJpc2N2L3NzZS1hc20uUyAgICAgICAgIHwgMTA0ICsrKysrCiByaXNj
di9zYmktYXNtLW9mZnNldHMuYyB8ICAyMCArCiByaXNjdi9zYmktc3NlLmMgICAgICAgICB8IDkz
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiByaXNjdi9zYmkuYyAg
ICAgICAgICAgICB8ICAgMyArCiByaXNjdi9zc2UuYyAgICAgICAgICAgICB8IDEzMiArKysrKysK
IHJpc2N2Ly5naXRpZ25vcmUgICAgICAgIHwgICAxICsKIDEyIGZpbGVzIGNoYW5nZWQsIDEzNTUg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yv
c3NlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zc2UtYXNtLlMKIGNyZWF0ZSBtb2RlIDEw
MDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3Ni
aS1zc2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L3NzZS5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcmlzY3YvLmdpdGlnbm9yZQoKLS0gCjIuNDcuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
