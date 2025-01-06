Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89493E77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iDVNToMNVkb4nGjB/lKLYPuIBxNENvRjbb4NW3WAz2w=; b=Zpk+e4Yc8A9gco
	vD+zT1D1b0+0YkD4Gc1Zg+HXNxxEg9ZoFcd/Mu+L9KVsnAY4mPGeSCJo9zjqesDQkrI2rNSPUBX+c
	IUD4VfjTep8sA5vq2oT7NzLM4mo1lV7pmLwXN12qZWZL2xkf6bsnNG+LQSuWZJHz2cHonX2vt60AV
	8LuAZUAskCUdQtXj6SSi6ehwukw4xHQo4YSEl5dq8ltFd5rsYeI+NZMoLDbaNeEd2Uqw4nTysCxHw
	eMExqjnZhFTAgQ/ydaYTiWcTCp7a2XtIcAN1zdU1789jsCvtyHa8EQ+s3plXjxomgmstSuaGQjo6t
	t/lqSOjTRzlvtze8FmAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpQD-00000001rPi-1Jh0;
	Mon, 06 Jan 2025 15:53:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpQB-00000001rPM-1man
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 15:53:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216426b0865so205130115ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736178818; x=1736783618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Uh7Y4VyLnr5ahLh9pQ24pYzPC1g2Asrk4+KWI2rULw=;
        b=XC9nYndeYakOF9CmZk67y/CfgR95HsYFPHc92Q72+mk0z1RAxu1ytds0hAyLcu1aiz
         lfsP+DtD4l/MqGo3gLyZT80Uf19BUqK+3uB6AZ1g3HTXAOtvkudRJL1N16EZyjdKjqDY
         yblCF7p3gafUMetPTH5i+ca42UbyMLnbKnjShz8fT6WlKPw9NOKaUR/LxMIbYU65noBQ
         HrXg+MdAnsBC1ZhrjTqZVF4kgpdwdR3saudkjihAY2cc1LNxgQCdvckTpzlJ8II48Sf1
         cocjEMfLroOrlUqqazJwikoTlweEFyQy9K7XvnPLfHajCx+bsZNEbP1FpI7scXWLucuh
         3AnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736178818; x=1736783618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Uh7Y4VyLnr5ahLh9pQ24pYzPC1g2Asrk4+KWI2rULw=;
        b=w49H5lQuNJN6X2l0GIKyvfZOR4lhOfUTl+BqJoaQioer42oRi+mpxJ6XWrZjy+QxKS
         toUUJWV1BnBvCQpvrGfkq+UuvQkrdilXHKWqSAVUYRDfH4ar9IoRfyoQKyIUm4oOQszW
         4zRZ7iZdobUmPMLn89i+jJTJ+jf/dJGNhPiMQ8wJSOtEk81u/AY1t35lpZOieIAcxEog
         3y6UXB/bj6p+UC8Plc84RV5ubGSuPMAtq4lanTXjGwmhVTIq540Ox/+zHHYrq7xVtxbG
         zlZnDPENjCYI1lY2MkM2Qi6348AvFpqme/XwmMzsV2VErGr0flnyA5e4LEYRqB/qAljw
         elQg==
X-Forwarded-Encrypted: i=1; AJvYcCW8cPldrFY5A2wBO7QDEzfVbkJRbkOFiYtvoab689Bjbz1OKi2pjlSkTkp1Z97wheXlCgOsuNlzizs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvEtdSakxlJlgo1B2/Bbnd1EYgrOgsEhDLwDPwxMyjBnYTvYaT
	47s0WGoJpU3oUVRqx3ZA29c6SqSnLWdeERsPHL5MOzBP5+IOnRqtvOtYp/bagVw=
X-Gm-Gg: ASbGncsOpfcAshY0xLTgOVZfxGHD2bbHsxqP/TEuXQy+pe21ceXkSiBhwtmYqTphWcP
	FqPv5uq/jcNJWvrZgTe49irp5KlTrZov6kr//HKeqxP3Xuir+iev3qsB7SAr9TIoTK0zoHOapOm
	GPUsJnfM/3JdgUy7kXFxdmI+TqbYoxmszHyEkV2EOBYMD2YdRZdWpIfVZ2zNBx4GtDvqN26pKWM
	hd01S025X7T7pmO/zMVphn7Oqv0scAASMOupgd5ftPzYKDbXxxXM2UW9Q==
X-Google-Smtp-Source: AGHT+IE5yT8zpB30bHVTWusvGHsV94xvgRHgoYIxCBzgPXZm5tP1CmaA72t8RvSXRpdwnFZnvPhDJA==
X-Received: by 2002:a05:6a20:e68e:b0:1e1:becc:1c81 with SMTP id adf61e73a8af0-1e5e0801191mr100407325637.32.1736178818261;
        Mon, 06 Jan 2025 07:53:38 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e867ccsm28950200a12.47.2025.01.06.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:53:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 0/2] Add support for SBI FWFT extension testing
Date: Mon,  6 Jan 2025 16:53:18 +0100
Message-ID: <20250106155321.1109586-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_075339_465348_248CAF8E 
X-CRM114-Status: UNSURE (   8.88  )
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

VGhpcyBzZXJpZXMgYWRkcyBhIG1pbmltYWwgc2V0IG9mIHRlc3RzIGZvciB0aGUgRldGVCBleHRl
bnNpb24uIFJlc2VydmVkCnJhbmdlIGFzIHdlbGwgYXMgbWlzYWxpZ25lZCBleGNlcHRpb24gZGVs
ZWdhdGlvbi4gQSBjb21taXQgY29taW5nIGZyb20KdGhlIFNTRSB0ZXN0cyBzZXJpZXMgaXMgYWxz
byBpbmNsdWRlZCBpbiB0aGlzIHNlcmllcyB0byBhZGQgLWRlcHMKbWFrZWZpbGUgbm90YXRpb24u
CgpDbMOpbWVudCBMw6lnZXIgKDIpOgogIHJpc2N2OiBBZGQgIi1kZXBzIiBoYW5kbGluZyBmb3Ig
dGVzdHMKICByaXNjdjogQWRkIHRlc3RzIGZvciBTQkkgRldGVCBleHRlbnNpb24KCiByaXNjdi9N
YWtlZmlsZSAgICAgIHwgICA4ICsrLQogbGliL3Jpc2N2L2FzbS9zYmkuaCB8ICAzMSArKysrKysr
KysKIHJpc2N2L3NiaS1md2Z0LmMgICAgfCAxNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKIHJpc2N2L3NiaS5jICAgICAgICAgfCAgIDMgKwogNCBmaWxlcyBj
aGFuZ2VkLCAxOTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCByaXNjdi9zYmktZndmdC5jCgotLSAKMi40Ny4xCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
