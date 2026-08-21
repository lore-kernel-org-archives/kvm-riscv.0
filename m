Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B6EC5DF7D
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 05:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HRzN39fT5Tpp9Rmc2oc4cIMfkf3gGamiz/o2ZK5AUU=; b=sW3VrJGe9QJReG
	ksPfkFmRNir7sthrjA5Gwh2dPIsR3uCFZAYH8PCxLeeRqcgZ7qP1VHrn164RMCFtd3eryXum682Ho
	szAFdeOSR+rqINTiByHpn20POFjIfmjpEYKh/zD33qJxbunoC8rdEuA20eZUc+0rVpEs363bnV1MM
	rZmpvIWf4Kwa1+HogBGDR84BzrEnHYvwxbvJmwS1y5raibEFfSjHNcDVngB3woGClKQaa2JPLGzYD
	2L07g5MLFc5nqpHrBH/MoTnCsJK7LNT1bYVTYmxGCZVQq4dh9qNdw8yWZEBOjwcAPwL08dppOw8Pb
	VaxG/tx/JBjAQsfUBbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHdU-0000000CYZ1-0bCS;
	Fri, 21 Aug 2026 05:17:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxHdQ-0000000CYXr-0neW
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 05:17:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso13916825e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Aug 2026 22:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787289462; cv=none;
        d=google.com; s=arc-20260327;
        b=gVYua4ZkhR4+KNlpH64FSLGVvVYMqtvsDdnbvvjD8LleqZtq3PNGijydUgd1CK7sJD
         JsSHtp6w3HZMeT9gX6Kedjc2CU79FaHutU6t/CHbGdJYDoA7PQmEpOdBh8ZObe2jpRDS
         NZ3VRv+tIq6y9PtxcurTky9st7dV3n8KcFXjwZfSfx4zWSk2b3XCEaO9u9fo4jFPKg1J
         ThQfYRCVJ4LYDUfU28/124iVA/DlMtMZJ7zTHFMUTvit4MS0xCDfB6XHX2TswbLeyfAV
         KNDHIQ9F0d/AsEoKToa7n4Lg0YpseZih7cU4yW7U7SzF0mQl2fWmonGa0uJTo3e8piMG
         HHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        fh=YmonYquJ+HyxaZx1k6oLtLX2thUhS7m2nlQhfdudsgg=;
        b=Rxbu8IcuQsUrpR8+bPa/TLceRSL9ug/oNqfQXaVi+S9XxSVV2QM73uPi7e1WdbjzWf
         D8ryA3PHKPk/2aEwpfPDTPkjSeJEjdCnSwh/rsy4ELHnjo/eeB0wro5e9yYptarl9H0d
         1yJabYK4iLMfufMlXdN4phkx3dSg9t3TNidBDcwR1FHYyABx12xlH6N30Zp4K+MFbq49
         alUyvljrTWsomaZXkZ0uFCoQWYUPaT5EtBacPMP+LAbdntO4bxavWw2esUzLOb9z1img
         DQ26fEu6Ynz5b6fjV/1ySZL7n9acYnQud3QKYwOArV983jV7hzZ3cZesuQDEXNHPeLmW
         VfcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787289462; x=1787894262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        b=mLpyN4LV0wZa+v8dIOQdxh9luYZgEMAxUuaZY00qugtaWvXJa3/UVdk6oxpNnn7X8M
         q9MG4aFhXbHYiYlq42kyBuyx4+3iaIKN4UioFaUuZwfCmzwPxVVP6Z9LvtSofqAQz4Pv
         A4DZSD4mZhq67a+sC6WFNllA0aJx7IVpOi+t8pEOautvLAdBlrk8AN5foMBfO3osdqC8
         odCNCBLito9p2PxN6kbE2kgpl+VIiYQL7GRK8s4xTLRles4rqGVrFrJYXMzwvEysI9XV
         om0KsQwIQ3U3zOJvBSoBwX71A/joi0bPVXXEjD3cITV3aH/BNdzRDp7TEeWo8W2RGA94
         Clrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787289462; x=1787894262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13mpJllH/Zvzc6cEE176TorQISQiQzdps6jTNyvGa88=;
        b=CLsAn4K6190TECSfg7czAbcalusYxJRVX8f5IQU1kNQiE62JW9eulilaRDaXFr0gtr
         bWMS4gBWKiDDba9H7+qeSsl3KL9ayhIXi+gMTbGROsWnAWpGM+EgacA6sc4x7W7jm8Tx
         8i4OYsGxCgiGclzr9/AXP07l9QlmqL0OYLaQ1nfm39h1td8hJ7XGMbAH179HzLmQySdR
         dJD4ID3OsDRQW7W6h8Xq2EZWly8rl048J3sMcY72qb7UGu5Pd9hc20s7UOYw5WloxXKH
         dEyHhTDJznkLLO+fo9XqyJb1H1TcR44ZR6hwsMcvoTjOrY6INLgPru7Zm1GqHCVWef7W
         qF0g==
X-Forwarded-Encrypted: i=1; AHgh+RqfP0TfYFbWxo5oUQvUgXOnduPUfKNNGYDywYdKhuqFhEWEbJEsvL71rt/oPfEWJXuGbrf+TTwZs7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrlhShXfUsZBolCvGPLhkcshUmy0Sv3Zph8Is9ErbNsSrpOQnD
	1tuOtPD9QSNd8zx7kTk5LI8teThCrMAXaadGQODA73/0vA3S+xZbu3r4kZda78E9kNykgdhWfrp
	6aVEliE9yLRuSKqEEMNyU0+H/ioZDDsiTserXOTafUg==
X-Gm-Gg: AR+sD11OsSOxZTEa7FX8IdezyZoWj4yiHdJWNt+mzrao/ZPXamyrGgTQc3UUp1aHUnJ
	B0AsQFHjdyV84Ka5Sve6rSmvzIMhOoGQ7top1RYz3GLwwNKtPm5Lvik8NNqMZdv8I1kQSIEK35Y
	DqezGg65VoY+QPt+3rQXPFP6BaGpaUJzRXdI+hH0S+/xJJwI7HsEGy6ol0zWmCKfSUIFjy4j0ge
	JzA/6FW94Fwbay7fkY4s1/x8BJ36sOY0eCdckULA0nemtpa8aKxUaCmA2yT39qUSbp4Zx4euVp8
	PO13AuA/aB2mUSES1UUDhhcSWizMCGNAjMnzS45my9vlhz/3UYZTYfChxqCpmkEj3pWzK0b2xxC
	AV0KR6qgNKinLZlwUdCJwY/PvtN7JGk29JRPBbqrC6SsEUktQfcDI6n04tiV4Q2M=
X-Received: by 2002:a05:600c:8b63:b0:499:7f37:cb74 with SMTP id
 5b1f17b1804b1-499b06a36demr94909825e9.1.1787289462039; Thu, 20 Aug 2026
 22:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260721073612.137259-1-xb@ultrarisc.com> <CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
 <178728288861.534500.12009100192281293732@ultrarisc.com>
In-Reply-To: <178728288861.534500.12009100192281293732@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Aug 2026 10:47:28 +0530
X-Gm-Features: AcwNN1VyOTE5mxX9-Emhx7eOr0LfPk9cSJYrSJElhptVzuqH563CP-bjvH7fuKc
Message-ID: <CAAhSdy1shnw8-4yNVtsO8tJdebGYdX9n2mJyhoMQ9KpuitsMoA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_221744_245962_04DC5F23 
X-CRM114-Status: UNSURE (   7.76  )
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

T24gRnJpLCBBdWcgMjEsIDIwMjYgYXQgODo1OOKAr0FNIFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNv
bT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gVGhlIGlzc3VlIHJlcG9ydGVkIGJ5IFNhc2hpa28g
aGFzIGJlZW4gYWRkcmVzc2VkIGluIHYyIGJ5IHVzaW5nCj4gbXV0ZXhfbG9ja19raWxsYWJsZSgp
IGFuZCByZXR1cm5pbmcgLUVJTlRSIHdoZW4gdGhlIGxvY2sgYWNxdWlzaXRpb24gaXMKPiBpbnRl
cnJ1cHRlZC4KPgo+IHYyOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA4MTAtaW1z
aWMtYXR0ci1yYWNlLXYyLTEtMDBlZDk1YWQzMjFlQHVsdHJhcmlzYy5jb20KPgoKU3VyZSwgSSB3
aWxsIGNvbnNpZGVyIHRoaXMgYXMgZml4IGZvciA3LjMKClJlZ2FyZHMsCkFudXAKCi0tIAprdm0t
cmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
