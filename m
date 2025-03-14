Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ED9C35FF6
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/SFn797h28uEQataGubX8rOW6LNUld6Y98CAayfA0c=; b=loA8cQuvWgqnJR
	6aoIDC7sgKM5Vhm2oYHYV9gOzVucEjUFfFCKdYcY5B3hLIbmZagUZvbDzxsYgoSfcdTwbBN5KCP3Z
	FQTv4/YPL3IwkP0IbKEPUlsfRhI8bt/5bf5+MThGgik24RJDeOuUr7sBt8Q2jxj7qd/YqNpbiXOiA
	1SjX4Pym14Yl5o+T5zGPbI19lX7hxtJt2pMzlFSaDY0PdethGJ+ro+dubI/NS2oWq7kw2ZYri4avs
	HVoX6cxVi+GqPsu7l0dG5DqMjvGZGxwqSkrFLBcDqw/VG1WixrKYGCd+YXuG9J+gbafQrkVd0UOhj
	4p5y+iQjFqAzA3LkG84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2xr-0000000DxxJ-3UTf;
	Fri, 14 Mar 2025 11:12:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2w3-0000000DxTV-3StG
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:10:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39727fe912cso216425f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741950638; x=1742555438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=omKtzAbfE0uC8gbvxE52t4BZx39PS9I/mYU8WTclJ+O23P/Bc0JI3YTWgdUQETb2k0
         gyGgYDk3dsmsBdVvmat+SBmN8klgCtcQhogn2cGs1dYaTyc8ayEpFXGYNV7W3GeMrSGq
         Vo65Ku4ADfnafbIPqpYgKdvhEndCdlDqnM0MEGXNCDexO7PW2z3co3Fdtkjj4DITisRN
         ExHdzgAsFUv1p4K84Sb0l5ApOcYPHaO+2Ez/ghIDcC5shQVsiJ4kZmW8SZWBkV6BY+z6
         TAEdsfb4BHZPXPMFznD+2Vs9w39dq31/jLgPwfg7LblPB6OZSor3geMJvWMAiw1KNQgX
         +u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950638; x=1742555438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=MGGlrCA1XYhXiu6jT97ad/orcAruWdjAYLUreJtM6vqSJrVr/RloMtoz2RnYRz0ZAE
         8/kwBMYKQ5JcbIWRjd05T/HEURq429fJMarBGfHaa/0DvATVUfIZAMg10tt/X8r1imNd
         VnQDdcV6Uet64UuWICEVh54/T8/Ne6oRkszcg0KO4Ig1nfzyBIn/EU0tHdyqGGkP5hJb
         H3tdoJ/JE0xUA5c48Hkx/tvDqtltV3fudqHWASrm+lEll+8owUod4VYbRxHfAlI6CeEI
         YPXk6vXKoA72fSeF4ZmZHoNzXkRM1MVQP7uia4FONZW1MSPyZxK1PnhGUevcEWFVoEx0
         ogWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU163FzkNDNPtPa3GgJTZVp1ZeADle63AbnawhbXyHSwwrCwbhS+eeLuV81dYpCx3uGn1C17UNuLb4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/W6GT9fv/2McGS0RiKkZzHbSafAgkUjL37vyarhSxHj0tq7rD
	oED3WfBuMw6N5wveZMmiHalA5UbfSzuPx+rf4U7KgU3sE8oFHl0X+HYALQ3IZck=
X-Gm-Gg: ASbGncvJoFurkrZ89p/ONCNqQmU6GJVOcVioLTO6lJ1zKfvmvg2zNX08p7ohMs8CsHH
	BUNoIYqOiKFrF9+wf5CXIpOdd9evp07LbV2252kZq5LYnag3nxTrx+vfJEWP1kzAr711qloYi0Y
	fEO4bYBqPuBn9R5lIvkcYdL+fWgnGoWvxb1UX6VhG9FiWs7J0nn3q9rwdbqnwpybTsD5gbf0brq
	vtiwlY9jmvUTZpdHFrPwhQmGZQuEO1dIcraJnUGMbdH8A2Mtb/oyZm/ORmZMUFelYrcsizmZUXs
	rcQ4NN/riI8CwcL8KgbYZ04kVoH7XFacSRiDq59Y2Z6/2A==
X-Google-Smtp-Source: AGHT+IEc9bVKQjP8LFKBn9o8XzyPNxvekNKBXKTZ6w8EQ6LJ1oTbhl5A33KtEPlIQggrNtpIXe/5VA==
X-Received: by 2002:a5d:5f85:0:b0:391:306f:57e4 with SMTP id ffacd0b85a97d-3971f9e4947mr2605885f8f.34.1741950638331;
        Fri, 14 Mar 2025 04:10:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb3188e8sm5299203f8f.65.2025.03.14.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:10:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v9 2/6] riscv: Set .aux.o files as .PRECIOUS
Date: Fri, 14 Mar 2025 12:10:25 +0100
Message-ID: <20250314111030.3728671-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314111030.3728671-1-cleger@rivosinc.com>
References: <20250314111030.3728671-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041039_862705_E262233C 
X-CRM114-Status: UNSURE (   7.99  )
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

V2hlbiBjb21waWxpbmcsIHdlIG5lZWQgdG8ga2VlcCAuYXV4Lm8gZmlsZSBvciB0aGV5IHdpbGwg
YmUgcmVtb3ZlZAphZnRlciB0aGUgY29tcGlsYXRpb24gd2hpY2ggbGVhZHMgdG8gZGVwZW5kZW50
IGZpbGVzIHRvIGJlIHJlY29tcGlsZWQuClNldCB0aGVzZSBmaWxlcyBhcyAuUFJFQ0lPVVMgdG8g
a2VlcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2
PgotLS0KIHJpc2N2L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxlCmluZGV4IDUy
NzE4ZjNmLi5hZTljZjAyYSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysrIGIvcmlzY3Yv
TWFrZWZpbGUKQEAgLTkwLDYgKzkwLDcgQEAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9saWIgLUkg
JChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgogYXNtLW9mZnNl
dHMgPSBsaWIvcmlzY3YvYXNtLW9mZnNldHMuaAogaW5jbHVkZSAkKFNSQ0RJUikvc2NyaXB0cy9h
c20tb2Zmc2V0cy5tYWsKIAorLlBSRUNJT1VTOiAlLmF1eC5vCiAlLmF1eC5vOiAkKFNSQ0RJUikv
bGliL2F1eGluZm8uYwogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1EUFJPR05B
TUU9XCIkKG5vdGRpciAkKEA6LmF1eC5vPS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChBVVhGTEFH
UykKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
