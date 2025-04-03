Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3C4C369A1
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qowd6fv9OIlwilheC5VWcTkHGwg2OUsRuu3UI3bz2cI=; b=Hy5iO45xukuYuE
	KOUJvr9hLH+T59PlpCvICXROC9j0S/TwdD4doCBgVqZJ+1bHCHWzKareKpd+H3tyAw+WChMXGRq9x
	Uevyhi2Gv3jeYd6ns5uJecsXiCo1C507VCJiCuyNUOo/s38SMuBjgdLElt+ZxyvhQr6Zym8ii20O/
	GlaC8nLLnfI/OdGsUFBfGehkK0oEbXdU81zNo0rBS0E6OzWwOV/bv6zPCaP77LFF+ngie6tXP0/V3
	i458ln5HU7y7yDXQdXzSUODcgVedpkBVDUN8SiN9MXB5NoZMIU8GIAK/ros34Ocq61ix+5eE47oJ2
	PAr07tVJshuBdXBDeGog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ItG-00000008jVt-1evH;
	Thu, 03 Apr 2025 11:37:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Iny-00000008iVX-25ed
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 11:32:19 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so328465e9.3
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679937; x=1744284737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=cs70dOfEIqOscK6oD9cLjRmygZMNOq6ywiGh0Lyl3BPsbhCvjFb+HOgdRnimRT34HL
         9AFyJ8GqovjW2StxAE2yV8Vv5hoUAcB2w3F2qGvSDfdozF28zEPOig5XYoZVQmiAapT/
         jxD2eQccorQSlbT9AVVcU/xRdwt78+Aw4PGY3fVgZBbENOHSU3JOAEmpW5BDeo5gEARd
         eBbQYdUoqfTCkGojDP8phR/aDv/HJcJVXzG560TP4SbSPXg7/k2u3t3LWFenb3eKXPyN
         4pd2SNiF5SluNIAMi5A1ASDOX1ybHVBlEwIaVMlffYXtB2EhndmNFOQ6RMrVMOZiUnCO
         y7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679937; x=1744284737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=oR7pLo4kShtYp/HOoopcMxZtR6pxUMKW6vdJUHyuy5Yb3Q96gdYP1baWiK4vX/n0JW
         80Kt1/OGEpguyF+Gudjhfd4gYkC9EpAJIvmpxMOpZFOYtQ5H7r5NHMOl5h/8w7ZDGFql
         OOdwx5NsjJhgKOaUFYPjLfOnwiACUKcNhflhvzfyY4YqNoN9Qz38o28tzFlyIzpallLM
         kOm9pc8LE+DOTRoj0i1FvjsvdtQU58y9rSi7KkSvwxbzcMd0FcLnOphND7KE02xtsqdL
         BaF83wbxQovzlWFFr6JHfRRRhFvKzIafMgiQZ7w6aM72hULfX/LYzr7RQu22aXGH9zq+
         JJrg==
X-Gm-Message-State: AOJu0YxA/9tL/9Q7OOUjCJ0KhqCq94kreE6wumrv+khUBEKrjLlca5EL
	6HzrYyX7ayQ/LuF+vDhiI9WzeIwt0ZmBbe8uRYjNfmdVQAirlWoDq4KuP5Lqm4j3CzuqYSinOVW
	H
X-Gm-Gg: ASbGnctnqK+/Vt5jwHvcLZCpHhrWZgSR6Vd+iNdIYqV8hvy46CHx6WNXWCiEDprb4QK
	D/oGSoaTonnpaoE2ooLMDwJXdAAs5GX+6zQGnBWEZ6NTl9nZj6OAyVImz+M54fzMDOPFh5usmBu
	AzRDvuWnz77kzUQJ2yxZOBXm0oJAtlqwdV68M18E2549ao6U8Q00Mp8Okod4Pvrej1ALJ3wEJ9h
	Jdp1OoatpK5njBzOdrZGH53Escg2VsF9gFeLuLi3F7mX4NjtsyY3zcUI+lcCNBvy7E7Nuo3eLZS
	LVFcDhdRdoM1OsjaonKSLjCaLOy5PjOYV+M3Nh70UeLW+otzxnAjuRbOmsyLPUlSwtZkM81+55K
	WCg==
X-Google-Smtp-Source: AGHT+IFLuPHIJtkY001V8NzGfGDvy4KWQWKKGAIqS8lFxrZ1d/GjyGP4Yf4pmkBcRsFqmKnj2gYoIw==
X-Received: by 2002:a05:600c:1d12:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43db62bc0femr69162255e9.4.1743679936757;
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b4e4sm19424775e9.20.2025.04.03.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
Date: Thu,  3 Apr 2025 13:25:24 +0200
Message-ID: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_043218_552042_4EE69B61 
X-CRM114-Status: UNSURE (   8.82  )
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

Tm90IHJlc2V0dGluZyBzbXN0YXRlZW4gaXMgYSBwb3RlbnRpYWwgc2VjdXJpdHkgaG9sZSwgYmVj
YXVzZSBWVSBtaWdodApiZSBhYmxlIHRvIGFjY2VzcyBzdGF0ZSB0aGF0IFZTIGRvZXMgbm90IHBy
b3Blcmx5IGNvbnRleHQtc3dpdGNoLgoKRml4ZXM6IDgxZjBmMzE0ZmVjOSAoIlJJU0NWOiBLVk06
IEFkZCBzc3RhdGVlbjAgY29udGV4dCBzYXZlL3Jlc3RvcmUiKQpTaWduZWQtb2ZmLWJ5OiBSYWRp
bSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2
bS92Y3B1LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCA0
NTc4ODYzYTM5ZTMuLmFjMGZhNTBiYzQ4OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtNjUsNiArNjUsNyBAQCBzdGF0aWMg
dm9pZCBrdm1fcmlzY3ZfdmNwdV9jb250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IAogCW1lbXNldChjbnR4LCAwLCBzaXplb2YoKmNudHgpKTsKIAltZW1zZXQoY3NyLCAwLCBzaXpl
b2YoKmNzcikpOworCW1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAwLCBzaXplb2Yo
dmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7CiAKIAkvKiBSZXN0b3JlIGRhdGFwIGFzIGl0J3Mg
bm90IGEgcGFydCBvZiB0aGUgZ3Vlc3QgY29udGV4dC4gKi8KIAljbnR4LT52ZWN0b3IuZGF0YXAg
PSB2ZWN0b3JfZGF0YXA7Ci0tIAoyLjQ4LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
