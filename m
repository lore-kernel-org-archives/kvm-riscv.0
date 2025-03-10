Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29B5C35FF2
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5urLA4htOvGsPAbwOGI5E46ujwwzSlRlEBMn4p5lkeg=; b=FlZHsDyHo/Nmuq
	QkH85Y3fd/WlXnEkzI3qX49EGyWp+HRipkmq2lA6+pMToMDFEL8HRlMuz1PhaViGU4QAS2vihvxRQ
	hXcLztWgYdhF7NC6Kgjv7yBc0ctMhROPk6OrG0jnNxs3buoa4EoiK5MZhKZwVwxA1xZuVDWo+NFYO
	nabM1vnIr2Zly57vVeOINlSiRTAQPvaEBM8WSKj9HS6UqHjBBmT2Kkz5VK8y0Z1mi5cPQMBxGXCUK
	k0gBTYCnV1wMVyLU7HB/JGJEbEPHKeWLl7dQ7iyNyNZm5NlBxQYawdYSkiewOuFGNBJzJH0t2Z1Q3
	mywLFSnh+jjdE+0mKYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfM2-00000003G9G-28k6;
	Mon, 10 Mar 2025 15:47:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trepg-000000037wv-0SCd
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223fd89d036so85436955ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619659; x=1742224459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ne6qRsQBgMn6Z9TbFB4C5/y3IwlTc1J69dL1IhT4E0=;
        b=NSt01MNwp10AUTotyuJ9t+XlMVEyGZ8sKFcjEW9b3UURIFU3v6157YqvcHXI8pNZjk
         uOnyrMuGgqkH1rHp0lMvHeKf4PxFNNn7od4BZEvXolLdGkCoeT5qAZcvbHSEiii5j0kN
         uUsEyTEEZpEXoEZQv3soZeOGt0Lg5aWlyRtJatu1noGqzflzGkafNNkof3FsN8peDbs3
         WTuhktlI8qGXjEDfkv04lnFXmCo0EcmPn4cLfPkZ+T3m6y6XLrkMBWB3xGZlvDUd3PYo
         NF/Ovb/yTeyzPVbYWH88qapwA1QrgHLlpoD/qWhRaqlyObkXqiD1gOcJhXXZ0WrrmAuD
         J6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619659; x=1742224459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ne6qRsQBgMn6Z9TbFB4C5/y3IwlTc1J69dL1IhT4E0=;
        b=CX5Ufbf5fD7qM2zn3pCEUpnKG/8Q+bcF/uKPYUMuAxqqVl7KyphJIc6Aegsx8X3QSo
         CVTa8ywTrAzAcJODVpxThlDseWyuI3xyy8K5/drZtxjbQbFDbtScELnT27Ili6xKrqSs
         W5clc3qt5pR3FTBiMqtY2BGsQ4i8HlLB/OMfMv73EdFOZhrldtBLGNiORlSQ+lC3IBHI
         P8Hp2gWvTWqdB3CpB9Sx9XowBCKaftDhkFr4nEcb6qpySNjSUQpx4s0I7OEfjsPykUGU
         /LQRy7RV5eNiB77Kyf9hf1aouoTg6wIZRE08/jS3AebiacxYm5OnthMXqojos9otX19M
         8IHA==
X-Forwarded-Encrypted: i=1; AJvYcCWEy4X6t3h6EbTuGnMnc0DMcI8VLTicgjMGtQV+BdJrxNiQe/vFR96cwEjqCzBzPt2FGj1UsUarMYI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx8dcw/PJXkGPE9nrTmTOOf+0Boz+sZiNK8OkI4Y1shlzMVEOC
	4EcOSVVOwxRhniycAEAxNdX9cVPsd/XqKhv0Z+Er1iRhqyMwiU9HeetEaqXiUXY=
X-Gm-Gg: ASbGncuzdbqjjfIrWoYA7P4yB3B9KZ2LGfjP+j6ftaxIrHUPnRZx5iJBmDN3O2H7xcv
	MoXgFSZkoW88jUfqhLkQPre2aoOcHbP3MtgAF8G4J4dRXWauBTjImOpKd10/WA/xuPA4+f7oWRZ
	0B02dzaqalay0fXOiLsbnUuoLYnkhnLZd2nnMcDtTSWt1kqh6+rS5q3hqR/HJGAmmprBnsloyNH
	yTE4tzBiFYgTpWu4UR/LzHASLfL9NHsnECPhxnfqyWCDaTDIMMCqLrqixqJAmps0mbzapG9uQpS
	7awQwwmiClZOKnLCDulgJRC6Ubjr0unkFoNnC9SIGVNCcg==
X-Google-Smtp-Source: AGHT+IHou97UuMHPx2aRC5ipTZybHeRQW/gREfJF/XOKkR7oov9xPoqimKZKRudGRu1JoJNuk3RSLQ==
X-Received: by 2002:a17:903:2405:b0:220:fe51:1aab with SMTP id d9443c01a7336-22428c05613mr273654235ad.38.1741619659507;
        Mon, 10 Mar 2025 08:14:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:18 -0700 (PDT)
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
Subject: [PATCH v3 11/17] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 10 Mar 2025 16:12:18 +0100
Message-ID: <20250310151229.2365992-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081420_144541_A35B83CF 
X-CRM114-Status: GOOD (  12.23  )
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

Tm93IHRoYXQgd2UgY2FuIHNhZmVseSBoYW5kbGUgdXNlciBtZW1vcnkgYWNjZXNzZXMgd2hpbGUg
aW4gdGhlCm1pc2FsaWduZWQgYWNjZXNzIGhhbmRsZXJzLCB1c2UgZ2V0X3VzZXIoKSBpbnN0ZWFk
IG9mIF9fZ2V0X3VzZXIoKSB0bwpoYXZlIHVzZXIgbWVtb3J5IGFjY2VzcyBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCmluZGV4IGE2N2E2ZTcwOWEwNi4uNDRiOTM0OGM4MGQ0IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0yNjksNyArMjY5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgZ2V0X2YzMl9ycyh1bnNpZ25lZCBsb25nIGluc24sIHU4IGZwX3JlZ19vZmZzZXQsCiAJaW50
IF9fcmV0OwkJCQkJXAogCQkJCQkJCVwKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKLQkJ
X19yZXQgPSBfX2dldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCisJ
CV9fcmV0ID0gZ2V0X3VzZXIoaW5zbiwgKHR5cGUgX191c2VyICopIGluc25fYWRkcik7IFwKIAl9
IGVsc2UgewkJCQkJXAogCQlpbnNuID0gKih0eXBlICopaW5zbl9hZGRyOwkJXAogCQlfX3JldCA9
IDA7CQkJCVwKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
