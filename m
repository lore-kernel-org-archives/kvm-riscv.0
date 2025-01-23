Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200DCC02182
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 16:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BIOutn2dbVS33wSby8EwUnA72FGxlpmvl5tqv1KSjik=; b=PsAzEPPgGWZ4tP
	WHaLn6Jnin1dgpN/PdGo/bUG7zj+lrmg1oYYjWifVUC1RO9H7i7Ef0oFE5HnwhLDdgcj+u9VTZ4Dz
	y/gNJaN4yLIaydBAgIYRvxDdaa3Q4VN7zCjP8FZswwxaFjJEN/HzhSQQBt7TS9bDk+ffTaO7dRqDu
	2M7ZahAFXe3pMfh/K6J9lBzHnxZ46WjddymvqhAlz2Sx3FsARHd2oXBmjHVNO3HbrPymC1yKcORrH
	lNKMDRFdsX66lMishMFRjnujBSGaKe+GNNdN+8Clt5F0Z+3MYPMcaTFkRbP/RCR6h7jluap4n8TB6
	Q+MGOSfXgIixy9l1zHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0T9-0000000CrZc-34J2;
	Thu, 23 Jan 2025 16:54:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0T7-0000000CrZ5-2xi4
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 16:54:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385d7f19f20so573288f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737651252; x=1738256052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JXuUoPlSKwj4vRfcS596K9iAUYTTPfvaMQ+EuE7oBlI=;
        b=aYiXHKyHGHQz2RfaGw5lxHSUztBaw8dbW0XBt0v6Ix/BoEm07AmAEFUXwabzsfAej8
         KZ/oYeWc2clE2MtsQapSJzUEk6+cHUWXelQmacxTpTSukx2gM5fNwppvrIFgRWREjjFN
         2D7IWOlc4u67/GH+pAs75UV0aVjm4XAggwCoHpkgsv9FYfs+GIU2k0tChpuTRylR7XrL
         rqGRrkru0nx/zSIbw/I1FXx7u+H8NFdiJN5PdASWxAF7Az7FVo3LF6CjpE+QprDT8Wp5
         zQkE1zLtP7ILdTyce7hCauciNgYzWozMdfxT7Z2uId0kmuUnJNTOJCEHz2TN1jHLVXeQ
         AU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737651252; x=1738256052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXuUoPlSKwj4vRfcS596K9iAUYTTPfvaMQ+EuE7oBlI=;
        b=Cv0hPxfao612OlGWDXX0qZfMtp3FVsEcqNDQsi4m4QztApx0bg7ecq9vsZ3/hj5Gaf
         qaoWZO7EC2bnGIN9Fl8y5GYT2j4XGaXlRUcgqcGF1+m7ZCj1XrUDpnVi4aQswOzDaYYS
         wopAP+pOobpWmWZk8nwkyrPH+4BVaajh9WwPTX4vxMEf8Rg1QIC0f76BaftsQTQ5uL2h
         2o2+mXqHCJI5LB3KGNVGTx6zlpRzG/GWX+9Eaoa6UnkmcPs96lPX6JY4/dFVaDeZ6dyP
         PK3M1H7S0DzF2fMwPImcfcdoxeWeNJuOHw/wkkECMbtwUmaKSKwC/XoHWTE3/3MlL8cW
         uLiA==
X-Forwarded-Encrypted: i=1; AJvYcCXTsfKB8aDdRavU6ZRI407X3Bgw5lmYUuNKs8dF0qoaC+TNbr0KCOLiKIdGy9orT685VEQOj3dCDAE=@lists.infradead.org
X-Gm-Message-State: AOJu0YywzWlbQTFwroy4ZBJRvAGgvKyxisH+mfkTd3aSjdh+MKq7SGsk
	kcntquZpvxOYyOepVqu1+5U+54zKUy2nkiZJEeE13LR7N6Xp0AAydXksjrNRJEw=
X-Gm-Gg: ASbGncsXt17Wv49hfmkGkKaxdsclTZkbmG7t+5KpgccAiMSesVHSYQMh1DEY25cLfPX
	cUZYdMhctP92Vxblmg50em5e3aTd417W9o3VPL6CEcUK26ubLjvYDDH1Ozy8bpKm6hemRH96xVt
	ohAqHYoYz80Tpr3sZ7Z+tidE8mb6FOzTiCoZ64JErVpjcq4VhAjfOt/1PdeSVkIhJD9wjtwa/Al
	tphmmVN+FZzFJZQ0PBHEoTGaXLhSgkqWEFZsjOS/K5MlHArpYmikkClStSusVoivocf2HyeModz
	Oojw5w==
X-Google-Smtp-Source: AGHT+IHfTK2dRn/lHoUSyZlpKK7dtzi3zFTmTAjS6WsgKZ2Vs9gZrPu3tgke91iDNBBpCfjqf99L0Q==
X-Received: by 2002:a05:6000:1a8b:b0:385:fc00:f5f3 with SMTP id ffacd0b85a97d-38bf565720bmr22236619f8f.4.1737651252025;
        Thu, 23 Jan 2025 08:54:12 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bbc8dsm165695f8f.72.2025.01.23.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 08:54:11 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v2 0/2] Add support for SBI FWFT extension testing
Date: Thu, 23 Jan 2025 17:54:02 +0100
Message-ID: <20250123165405.3524478-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_085413_748182_5C5B17B9 
X-CRM114-Status: GOOD (  10.29  )
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

VGhpcyBzZXJpZXMgYWRkcyBhIG1pbmltYWwgc2V0IG9mIHRlc3RzIGZvciB0aGUgRldGVCBleHRl
bnNpb24uIFJlc2VydmVkCnJhbmdlIGFzIHdlbGwgYXMgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVs
ZWdhdGlvbi4gQSBjb21taXQgY29taW5nIGZyb20KdGhlIFNTRSB0ZXN0cyBzZXJpZXMgaXMgYWxz
byBpbmNsdWRlZCBpbiB0aGlzIHNlcmllcyB0byBhZGQgLWRlcHMKbWFrZWZpbGUgbm90YXRpb24u
CgotLS0KClYyOgogLSBBZGRlZCBmd2Z0X3tnZXQvc2V0fV9yYXcoKSB0byB0ZXN0IGludmFsaWQg
PiAzMiBiaXRzIGlkcwogLSBBZGRlZCB0ZXN0IGZvciBpbnZhbGlkIGZsYWdzL3ZhbHVlID4gMzIg
Yml0cwogLSBBZGRlZCB0ZXN0IGZvciBsb2NrIGZlYXR1cmUKIC0gVXNlIGFuZCBlbnVtIGZvciBG
V0ZUIGZ1bmN0aW9ucwogLSBSZXBsYWNlIGhhcmRjb2RlZCAxIDw8IHdpdGggQklUKCkKIC0gRml4
IGZ3ZnRfZ2V0L3NldCByZXR1cm4gdmFsdWUKIC0gU3BsaXQgc2V0L2dldCB0ZXN0cyBmb3IgcmVz
ZXJ2ZWQgcmFuZ2VzCiAtIEFkZGVkIHB1c2gvcG9wIHRvIGFyY2ggLWMgb3B0aW9uCiAtIFJlbW92
ZSBsZWZ0b3ZlciBvZiBtYW51YWwgcHJvYmluZyBjb2RlCgpDbMOpbWVudCBMw6lnZXIgKDIpOgog
IHJpc2N2OiBBZGQgIi1kZXBzIiBoYW5kbGluZyBmb3IgdGVzdHMKICByaXNjdjogQWRkIHRlc3Rz
IGZvciBTQkkgRldGVCBleHRlbnNpb24KCiByaXNjdi9NYWtlZmlsZSAgICAgIHwgICA4ICstCiBs
aWIvcmlzY3YvYXNtL3NiaS5oIHwgIDM0ICsrKysrKysrCiByaXNjdi9zYmktZndmdC5jICAgIHwg
MTg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiByaXNjdi9z
YmkuYyAgICAgICAgIHwgICAzICsKIDQgZmlsZXMgY2hhbmdlZCwgMjMxIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3Yvc2JpLWZ3ZnQuYwoKLS0g
CjIuNDcuMQoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
