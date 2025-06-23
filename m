Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F7AC7115B
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDUyZa8/Otq0/bTbRVdKYyFjKw/nRF6bPwiDqEXxeEE=; b=Db9eOo/cdMX1Vb
	t1MIjC/3QuelGsrWMWXRikuszL781sobvI62uJ/a4/qMFPemVV7pU8QXE0SJFubSpvvQtHvorEChV
	sEqJa911cvxNtOr4HVRBEP4mqd032ERnzqcNP3rRC84mphXscCSiZFs5Q6RbJNAFHS+91eY1vJx8E
	PU2nA7NJhcHZDvXCu/eSZ8ko8+vAXJENcXGEXf77ZS3e4cErOpeNbu6ip5csgvvJaImggssE3+9g8
	JYhOf3sKiiVYJYzIkVOTwWC/fMWCNy8SPHivpHhljYNfwzrX0RbdUt5blkbz8RF7+toKzsgsuvgS4
	EUyFu8hZXD4ZOfN3PXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk4R-00000003QwB-0OhQ;
	Mon, 23 Jun 2025 16:30:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgxi-00000002pi2-3zQW
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 13:11:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235d6de331fso58866665ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 23 Jun 2025 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750684310; x=1751289110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=294f0NWEzhgQ1KvYHlyCdSwVPknM4JTUNd93oDWBhbk=;
        b=09uJpZ9a5f4hxzGoii23SUL+ketnq+76nTAZ5j7Yt58BKlnDBLls4TTplSUBIBqndV
         SyvKL2Hfg39ocXaWZ2znd8A/r8WWK/cUVlvVREfxJa9G+qv3jS/qBX9TCQ88hTq+yFD4
         r4lypt7QLe5mx7roXzg2O1+wnREkEQbGKKXzwWZMLNVAniXED/23TxgySwAexBk+NjHG
         /52/j+Se8kHYeQUTe/oDukxcTbT+Not2cqmzdPpgrWUTf7nMb2GA6VWiKmEDP1k2UUlX
         ww+5G1l8OpsV/WUQpRHrusSmn/rm3wFok5ql+AZcvjtDV8iuhnoNSyT8VZdKYmm940mG
         bZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750684310; x=1751289110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=294f0NWEzhgQ1KvYHlyCdSwVPknM4JTUNd93oDWBhbk=;
        b=hnUWvxTif9G9Tyka8F6T5cLf6hHqKvIKrsWAnrJWxwE5xUhwq7s4wDK0jXnusua3am
         pVjGDoUwA+/FcGPtAKG2gu6PqY2x62ErN9B5yG6wWt4T4jN3mizXtTtK+7F/UOOiaxAM
         jltJSlKjOXxUWcG9JynwWruGUlYdeXO8DlkOKUZt+2n+Q0NJ0NCupr0U0+TOlFq9N9rE
         ja3GEHonYJVbfCLjDtP8KWGLTK0npmH86ef1tp/1jw+/n6V8k+swaXHPsAku93NWwTZT
         egNwHOx3D/zdUWTp7UgzmbhcJHA66qLCz6pzsXyM2QSIA3fInZzhkoXJpzThf5cZyzy3
         GYuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+HDvAVY7W6prERUXuIZPZ6yHsv4ezPmkyoSM0mSRIMZ7OO2Sfoc03Fa99WtAJHYWJ66V0e3EA9IE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw776+5AaV3daEIFC/tVVnuzg7EH8aSD4QNRhnwqaGzhmcLUg4P
	3hFl/KgXRhmAb1MT4AUJZC0L10toxWKHcEJ2D77xMzAfw4CfAC7PXqxtWONLw/JA8ig=
X-Gm-Gg: ASbGnctsNI4kqkgbQEXA8+nGSi5MbT6p19sl5Zsp99Mzn48Q3ooEiMu/xSJEv5+duag
	35O4c5TmfYijyFL2xaPwIJPIvRuiWnR2PrdRRzzLcnXd+5dHPbXnoz1Hqxh0Gmrjove926gkRFJ
	neQcSK/cPWiYnzIgjUO0q0YpRKVmcEe6LsR9HfXMQxx/kYKl+YghRxnad/aWrjsSGKwQDbxBW/p
	x+KaiHIUiEHjrKlcPsPKp2BRyTjvNobKi9c+eWBtg8rn0tv7TZ1DJmY8CybdmW+qKh8nJMmA24a
	j5VlPAARdPPKufffDRJo+FKo8NAPeb58L2GRuuPFOttqzdnYP3mZGJe4FzbirehNJpc=
X-Google-Smtp-Source: AGHT+IHbA49BPoVB5DhkDb7g3yBY6ntesarXpYb3Bz0xdGIJAdRpjLCElGdQeRGD69gdl7vWZGwNLg==
X-Received: by 2002:a17:903:4410:b0:234:f182:a754 with SMTP id d9443c01a7336-237d9bb3cadmr166890735ad.47.1750684310146;
        Mon, 23 Jun 2025 06:11:50 -0700 (PDT)
Received: from carbon-x1.home ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8673d1asm84314385ad.172.2025.06.23.06.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:11:49 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [kvm-unit-tests PATCH 1/3] riscv: sbi: sse: Fix wrong sse stack initialization
Date: Mon, 23 Jun 2025 15:11:23 +0200
Message-ID: <20250623131127.531783-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623131127.531783-1-cleger@rivosinc.com>
References: <20250623131127.531783-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_061150_993386_B9586082 
X-CRM114-Status: GOOD (  11.17  )
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

VGhlIHNzZSBzdGFjayB0ZW1wb3Jhcnkgc3RvcmFnZSB3YXNuJ3QgY29ycmVjdGx5IGluaXRpYWxp
emUgdG8gMC4gU2luY2UKdGhpcyBpcyB1c2VkIHRvIGtub3cgaWYgc3RhY2sgbmVlZHMgdG8gYmUg
ZGVhbGxvY2F0ZWQgYXQgdGhlIGVuZCAoaW4KdGhlIGVycm9yIGhhbmRsaW5nIHBhdGgpLCBzc2Vf
c3RhY2tfZnJlZSgpIHdvdWxkIGNyYXNoIGlmIGFuIGVycm9yCmhhcHBlbmVkIHdoaWxlIHJlZ2lz
dGVyaW5nIHRoZSBzc2UgZXZlbnQgZm9yIGluc3RhbmNlLiBGaXggdGhpcyBieQpjb3JyZWN0bHkg
aW5pdGlhbGl6aW5nIGFsbCB0aGUgc3RhY2tzIGVudHJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogcmlzY3Yvc2JpLXNzZS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvcmlzY3Yvc2JpLXNzZS5jIGIvcmlzY3Yvc2JpLXNzZS5jCmluZGV4IGJjNmFmYWY1
Li4yYmFjNWZmZiAxMDA2NDQKLS0tIGEvcmlzY3Yvc2JpLXNzZS5jCisrKyBiL3Jpc2N2L3NiaS1z
c2UuYwpAQCAtOTU3LDggKzk1Nyw4IEBAIHN0YXRpYyB2b2lkIHNzZV90ZXN0X2luamVjdGlvbl9w
cmlvcml0eV9hcmcoc3RydWN0IHByaW9yaXR5X3Rlc3RfYXJnICppbl9hcmdzLAogCQkJY29udGlu
dWU7CiAKIAkJYXJnc1thcmdzX3NpemVdID0gYXJnOworCQlldmVudF9hcmdzW2FyZ3Nfc2l6ZV0u
c3RhY2sgPSAwOwogCQlhcmdzX3NpemUrKzsKLQkJZXZlbnRfYXJncy0+c3RhY2sgPSAwOwogCX0K
IAogCWlmICghYXJnc19zaXplKSB7Ci0tIAoyLjUwLjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcg
bGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
