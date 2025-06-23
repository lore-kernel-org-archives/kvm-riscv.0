Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E3CC7EE2A
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNkHGtFw4NnoIdCRQ54QUIoE9cCfPknf92DfPCGgE9g=; b=kybNojRcIJCZUi
	NDGlQwRiE1mn3Ro7QWhsWNSbjspDk4Mi1Y0AYtNbmL8p3rFj6bbZovm3YfYLBjDwLUiyjf+LvP9dB
	ZC05Eu3rkRGR2RUg2QuPoqcD2tE3wcvbcmPsMieYkQS3rwIq78rYio3E7G1c9Lzh0IQtmBRCGHoKz
	3Go61s/1PVOd5VAlOyEHRrKAosU9awMDhgk3Tt+svjVR3jCJyzt5f1PLX5IJJy5lQNXBE9HSLY9+l
	RYgY5DNtjDJjXbAZxDoqp6INXTLFg3EV90XjW8fwXcArWYbS7mFo/3jQYCLPKp3lcmnVZZXLUhdUu
	VvBe8JcwExnUZpzjinXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk4R-00000003Qwo-1smL;
	Mon, 23 Jun 2025 16:30:59 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgxn-00000002pic-2D34
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:11:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4354920a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750684315; x=1751289115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzRh29yHMbwbaz0+15/VXfFDPZCf6HyTmGmqDTmtI4M=;
        b=DjixR/xDxxlAqJJgfMfi9sYK1y3FVYaXxxo6NM4495+sUqlKZHBA2znFGwao26An4X
         htdEleyE+3ycLLeXOZGZNKUChpxwbJBzvqrhY4w8Lo6ec5UqoxTO5CXyDuoa4PR8ckYd
         dQ59pj8DtOg8OgmQ07xqzaKmYN4qYRQoAB96QDmnb71snbPvYXK2fjCtz3f6FgYGLvqv
         vidhVsPsbIjqUHEXXyqICGMXGQ3b+BdWtmSFhgm96V51uoYQHIJGuLHQ4Odo4D4BZkFj
         mKeOt7S43PmMR1DZkKYQVwMd6Z26aRL7ftEjKmCBxz2ARQppzxQV5F+ODhVeNt8dZHdu
         /IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684315; x=1751289115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzRh29yHMbwbaz0+15/VXfFDPZCf6HyTmGmqDTmtI4M=;
        b=Zaqo4vST87jVm2j9eSaI7hFLpINQK+15ZNMn9H+D37Qk0oySYe8ewZZNq9x5/c0vH8
         FkRJ5GeHoIumUjPxBOLO6lNRvUlaGOk9eimvcz930qPtad4GX/Y3dq9v7GMb/Rwi9ofo
         Da5jGXzBZKFOd0bC96q6KuHPCWOekZfyKtXd/bG/mloyBd/uea7l8/mriSBsrhwO3qa4
         g03JRXv2hsvOLBjDIanZ8lZ4nOthFoAT9QyZWlSzscAGGqg10nq9ky5BBzRHku5MtbI0
         +deaqDeHAHhRAoWR2HE5rCvhTQaVeX9JdncHeYJeBr8+12R5nC2HdPTEc/TUCctOdAQZ
         Jz5w==
X-Forwarded-Encrypted: i=1; AJvYcCV6+7y06WWem58V4gTSpD4g2UzckSW0T88/p4Z+TNY/7hMJXKVio+W6asbvLxNOjO172ydgWWEfFC0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXSPgetop/GiEjjuBywvXwBi82dgBSOwdHzCJmUIcXJbN3PUa
	obdMrhXoOwFQllZgEI9KSkpL58TO0qPV9nPl81mPAVslAha7iDIMQHDCQ16U41erOS0=
X-Gm-Gg: ASbGnct160Y47IYC7T0/LLVCqM1TolW73gQGyy7wy4lCbQBNWOClQjGPGRag6IfYvGK
	+jzW5Ys8/Tju7VHvuR2V9aA6kJQj4u7JFEn+2PSNLp3yb8DBqK9qVkiv2V3JgAqVIU5uCc/gxk5
	vpt+twvmNC/jdWx/rjKRElLGU1K+2TQChndURs8ZhmCt0SEdCWYhl7VAVyGWlGXSKDrQxw9r2qL
	XWnO4FQskdw90luOkp+IenA4XkhCnBuVX+ODYhi+vmL48y9Zre0MnLdgqwMWQ01b1oxfYzwo+Nk
	U2OLIrj9M0E/O7OrcEyRm2fdmdZYboKfi0gS/y6ntytGs4V5U0Ag45lY8oEh1O1bhPU=
X-Google-Smtp-Source: AGHT+IHeptfHKHnYbF7JJ/8CGxqCXp80Tfkpvpum4dw9r887/gspr0Tf/mgthGDjug/fetFEjg/NQQ==
X-Received: by 2002:a17:90b:53c5:b0:315:6f2b:ce5a with SMTP id 98e67ed59e1d1-3159d63da58mr18945464a91.11.1750684314778;
        Mon, 23 Jun 2025 06:11:54 -0700 (PDT)
Received: from carbon-x1.home ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8673d1asm84314385ad.172.2025.06.23.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:11:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [kvm-unit-tests PATCH 2/3] riscv: sbi: sse: Add missing index for handler call check
Date: Mon, 23 Jun 2025 15:11:24 +0200
Message-ID: <20250623131127.531783-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623131127.531783-1-cleger@rivosinc.com>
References: <20250623131127.531783-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_061155_562343_4CD4DF12 
X-CRM114-Status: UNSURE (   9.88  )
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

VGhlIGNoZWNrIGZvciBoYW5kbGVyIHRvIGJlIGZpbmlzaGVkIHdhcyBhY3R1YWxseSBtaXNzaW5n
IHRoZSBpbmRleCwKbGVhZGluZyB0byBhIHNpbmdsZSBoYW5kbGVyIGNhbGwgYmVpbmcgY2hlY2tl
ZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
LS0tCiByaXNjdi9zYmktc3NlLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9yaXNjdi9zYmktc3NlLmMgYi9y
aXNjdi9zYmktc3NlLmMKaW5kZXggMmJhYzVmZmYuLjViZmM3YTA3IDEwMDY0NAotLS0gYS9yaXNj
di9zYmktc3NlLmMKKysrIGIvcmlzY3Yvc2JpLXNzZS5jCkBAIC0xMDE3LDggKzEwMTcsMTAgQEAg
c3RhdGljIHZvaWQgc3NlX3Rlc3RfaW5qZWN0aW9uX3ByaW9yaXR5X2FyZyhzdHJ1Y3QgcHJpb3Jp
dHlfdGVzdF9hcmcgKmluX2FyZ3MsCiAJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfU1VD
Q0VTUywgImluamVjdGlvbiIpOwogCiAJLyogQ2hlY2sgdGhhdCBhbGwgaGFuZGxlcnMgaGF2ZSBi
ZWVuIGNhbGxlZCAqLwotCWZvciAoaSA9IDA7IGkgPCBhcmdzX3NpemU7IGkrKykKLQkJcmVwb3J0
KGFyZy0+Y2FsbGVkLCAiRXZlbnQgJXMgaGFuZGxlciBjYWxsZWQiLCBzc2VfZXZlbnRfbmFtZShh
cmdzW2ldLT5ldmVudF9pZCkpOworCWZvciAoaSA9IDA7IGkgPCBhcmdzX3NpemU7IGkrKykgewor
CQlhcmcgPSBhcmdzW2ldOworCQlyZXBvcnQoYXJnLT5jYWxsZWQsICJFdmVudCAlcyBoYW5kbGVy
IGNhbGxlZCIsIHNzZV9ldmVudF9uYW1lKGFyZy0+ZXZlbnRfaWQpKTsKKwl9CiAKIGVycjoKIAlm
b3IgKGkgPSAwOyBpIDwgYXJnc19zaXplOyBpKyspIHsKLS0gCjIuNTAuMAoKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
