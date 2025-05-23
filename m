Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1C4C54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2oaJTzVE+tHNdgzbOnFF26Ml+XHxzpixE1kG3rKnULY=; b=Rd4znqEXVoHluD
	Uyw8Qvcd21P10cTyOpAM+an91p34WJ3V8j4nKC8SZGBUfbqIQZJrOUxUccHLDQ846hoDXjovJKCl+
	weV8Onwgv44W8x4+0hE1jIusVNN0lfUkciobLBiN014i/oNfqvZ7IhkNj39Pnf3Yu47i/KgyIecO/
	/igWJKlAtUd6y+SIdGOSDCEFiYvQ38msLkWYnRXkcY54TXOXI2oqK/Lf1FrVUWeidHB262Ju9eN1n
	RoXEU4PNVbo6+TebGUGXoueCPJwCEE5Y/bSJYyk2wOf1KRgkl90e42KPpLXpOYscweoIiGgX9N3Si
	AZ6cc1t0M1hU6wUdHzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWX-00000003ZG3-0U6D;
	Fri, 23 May 2025 10:21:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWU-00000003ZEQ-3dgy
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-742c5f3456fso4571898b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995666; x=1748600466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=GNffq6gz8t2hQh8Izsp9vNwwrNaakKom+m+XkhJ8oKIzLuvIv6QAeK7qKzX3zdWTqC
         qaszH4QGIAE97Bhbx0B7t7V8Q1nddvBYMMRIfKItBgiU35NjqZms6uB4FSxaQzYKbrNY
         jhfZPOj45ItBKjTPN0NTZkKwwAdSzRI2v5TI5DS4D/lH3nIc/aQh1rKycaoGaqDh2MbA
         sGhmxT7d5pGFbC1v2MhM1VBayQ9RSigjmwfoKBX3ILOQj2+8bGL7dInBlZ6iaEHP35H0
         xegrE3u3jY30XHv5jenGrthsUfpnBUlS2pB+A9YtJ61Rp/+y/Y+CJvQAccSs9HcqbKPh
         vbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995666; x=1748600466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=ee0VfCp7sq0dH1EEf+FIBfab8cvRy148//livyqbnhEPpauEg8pi5lykfabWcAWCy6
         JBd1SV653aWjzUUjaMg3do3WWWj3bSyVFrlDXxPEculECBIx3TiZoANqeFtnj/1X4Het
         WXW17qbnIBDHSXcl3hcRRcY/1BT6W4yKp2A1eJ9ejz+iRdmQqvzC8gGcKTU1N8kOiOmA
         YPgSqmeek5G37PnZISgjf1zjxDi58yaz11CjZSzCZ1pJQBTCqfMpCf/fm4tkj9CUPSxy
         GZYU9QklsL9nD1U9aC375U9/Y2SzxCkQjP7Uel/1WfXX1DRqMctcFLGsIn4A3MUKPf5P
         Nb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBVBx9vCPQOVFrCH5FothmUtH30sCZqgWZNnur27p4b3f5XMMrBD0oTTZzw9jQM4r3mJyXWoOwjDc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdBa++YGF2VXdrB4lf3DGp1pC7VFiqQQKLLrWRz/Mmjrjx8E6Y
	4gfuA517B5s7hejjdyVLgfl/XdNlYoyGwKaeUPkcGPixFyHwA5K43CFQLJgjaFuIYX12jwSE/XN
	XfNmCEWM=
X-Gm-Gg: ASbGnct2TrO2bI+4o/EOlUhWGV5gtdeS/AXFDsZQ4bl3/BiAqrZeKV57s6rol8VEOCZ
	AgeL4ua1+oIfOwXIUx54uYIW9i4gKGsQHm9sOLoiwr2CNt2OT0us/iL2Mrb/ZMxkJ6AGs4iPR6D
	nDnlpm8UPeD8V3IUV+pTUtsoiGiEpBHizWUgr2/JEzljEbhWiplnGhY/H9CR9ZnjWyJZZrNQrv3
	okC/Wi4CaZ+nICD0utuqFjXAhuay80A87ozHZI7nbwfRtn0SEpVTFB0cchz9/fxl8pC84DWCDLs
	8HkT6+qoYhAau2kzelwZuklyRie4w7vb8Jwfiqr6QEstQRh7cqRT7dv+ixz3VY8=
X-Google-Smtp-Source: AGHT+IFXhCgkcbKavnE2xTp9i4da6iauW69FEMu71goEiqhGLYMQSQQ3w6lKP9OCGbZDB/3Z0XQGgA==
X-Received: by 2002:a05:6a00:130e:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-745ed847e76mr3749012b3a.3.1747995666204;
        Fri, 23 May 2025 03:21:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:05 -0700 (PDT)
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
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 02/14] riscv: sbi: remove useless parenthesis
Date: Fri, 23 May 2025 12:19:19 +0200
Message-ID: <20250523101932.1594077-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032106_907106_4A7F3E5C 
X-CRM114-Status: GOOD (  10.44  )
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

QSBmZXcgcGFyZW50aGVzaXMgaW4gY2hlY2sgZm9yIFNCSSB2ZXJzaW9uL2V4dGVuc2lvbiB3ZXJl
IHVzZWxlc3MsCnJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5Yjhj
YWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2MDksNyBAQCB2b2lkIF9f
aW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlfcmZlbmNlCT0gX19zYmlf
cmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNp
b24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDAs
IDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfU1JTVCkpIHsKIAkJCXBy
X2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlwbV9wb3dlcl9vZmYg
PSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAgdm9pZCBfX2luaXQgc2Jp
X2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0eSA9IDE5MjsKIAkJCXJl
Z2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25iKTsKIAkJfQotCQlpZiAo
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpICYmCi0JCSAgICAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJaWYgKHNiaV9zcGVjX3Zl
cnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNiaV9wcm9iZV9leHRlbnNp
b24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBk
ZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9
Ci0tIAoyLjQ5LjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
