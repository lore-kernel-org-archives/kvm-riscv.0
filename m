Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA59C0218B
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eWUEK43ZmYV73+DFfEVKmfZMYVH+mOvFqyj0rjJvta8=; b=ryjrtXKdMWV5MJ
	f/ib1D7/I0QBagUAnVW/Clqi4PeRumsddSJtgBOQoS2h7ABEnovk5knYVybhZn9ux4DqP7Fb1wWUB
	VNp+iCJMVuUnIRzPfjKHJ11GskJuoFvPHTeJQnb3j1TsJ23SJjf/Z6Xoye4/r6egf1Tih3Svn+L3+
	pEuMug99MGPUShhz2AVTdT+wkXyxiLuGfANIxNTcfiJTefUnNFTcJ1/XrYl+cwfNeRyz293DuTj1g
	Fx7BY7NjtHkDOjQm3E6NHLIiYNBq2djJYNuSvAMz0wszwsH5wR57vGHA3KQ93N0B41nxIFXtm1zCz
	0sxFm9BqIB7au2cJvS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tayui-0000000CgcY-2Oti;
	Thu, 23 Jan 2025 15:14:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taytr-0000000CgXD-1fn2
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 15:13:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab2bb0822a4so207396566b.3
        for <kvm-riscv@lists.infradead.org>; Thu, 23 Jan 2025 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737645221; x=1738250021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHqvyeIGaMhd+4sCu2HyPNjzGSFDyOvanlIwsvPW3QM=;
        b=eY0hIu/u1sJ5m7RcnXjIj/1URoTpjg6s6PSxE4rUCIwEy8y/OLQi3jTYBRjryjbGM3
         5zBJostyCVdngEsemAU4bwC1zLBDODn64QqlF6JBpJtLmzQCmih7iiYFBRK6KHQOBRZ2
         06VNwlSaT01OgmOjSU5BpXEW2MF9jUOrnHzmop25o2aZNyBaDusrkQ9wXOVp3GW0tOWp
         Uww05pFVjXGSaN/wvlJCf84uiFxHZJpKfiR0AYP3gC/lMivuLAJq5PL21XE7Zde5TdM/
         TWH+xegKxdZo9v64f2Sj/BgRMtgMdtkh0+wVpmrSOWyajntLByMtb+hKYUpfhJwkTgfT
         mHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645221; x=1738250021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHqvyeIGaMhd+4sCu2HyPNjzGSFDyOvanlIwsvPW3QM=;
        b=G4xj/OjWqH0lSu8Iy8gGKavWMhrYJgCU7fSraCELT0J3woVrLzV2prphELC5mMCKVF
         RCxEsOlkDwxJy9X+6Tx74rHivzuYkKRbtFoz20ipvkV5vis5xWSEiCSjJ/l51gs58RhH
         VnnFm0813x3E1MtBDpa8lGiRGMeDplhqTZnKqqs6dmjvwiAm8j+kMbANsWxk/ydoXbSs
         0tz9zt9menyTQKCJIX4ct59IYaL6NxBd1MVPlucwSq1r2MzS6X9EZXFz80puWxdZT0bL
         aSEXryKQ5w/RKwSQDxOSN4C6YSpJKTwxjXyRsuyI9wTZ+zcto4iTNx8tCkmzb+pkVJcw
         pKcA==
X-Forwarded-Encrypted: i=1; AJvYcCX/hbDCKxPoqTAloz6lANwwW1wdQh8pdDKQ6cj074yQPCjja8BhJ4gBqVQbses+O5wU5cDbypR588E=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3SwmXzrxF2jGR7m/vFyU/IyCt7zn6zjozri6Zw/4COWeRL3Ho
	iY6ms9lyHfxX3jfyyZz7dJLFL7lg9WNB/+yhrF4Xe0cElQhWjhjl1HT7+w1NqQU=
X-Gm-Gg: ASbGnctXbL95M+Q8h5XRfTwELkq+J8YBkyG4y3D1HqSO8AVhWeJv5T3ilSyQweM/VHD
	lxs7bymC2qLusTlzk5cbq855ewapPaA1Ux+YXtqQzyHsciCpD+tRFWKcdP6HUok0HuXTHGnKx++
	XYSPTZcughTujoPiNgSPa3zXzrk0vDSVLIjOdB7CqhzKlpYG5iju95ggzGTxQTJh/G19kI1tbII
	CduXflTdKDpJlTO976x/1gWzpuT0MhFt6Taaq62DeEt22onfKwDQtRJCsEs0UzBlVbuvC3ehsF+
	KElrak/yUvYhg2oN0YGWw/0ZrCD5A0PyTmoqnwlToULFbIcJ6GDvs/+b/pHp7K0ZCw==
X-Google-Smtp-Source: AGHT+IGigEydQrf4TxjmuIGB2jriHQEKQZUmk5+pAXO3TSAfnfeNk4Y+8Kj06SGLsmiqSBNcvQbBWw==
X-Received: by 2002:a17:907:989:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-ab38b380857mr2393509566b.39.1737645221265;
        Thu, 23 Jan 2025 07:13:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab60d690232sm504698066b.37.2025.01.23.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:13:40 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [kvmtool PATCH] riscv: Fix no params with nodefault segfault
Date: Thu, 23 Jan 2025 16:13:40 +0100
Message-ID: <20250123151339.185908-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_071343_437552_3F10D370 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Fix segfault received when using --nodefault without --params.

Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 85c8f95604f6..f6a702533258 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -256,9 +256,10 @@ static int setup_fdt(struct kvm *kvm)
 		if (kvm->cfg.kernel_cmdline)
 			_FDT(fdt_property_string(fdt, "bootargs",
 						 kvm->cfg.kernel_cmdline));
-	} else
+	} else if (kvm->cfg.real_cmdline) {
 		_FDT(fdt_property_string(fdt, "bootargs",
 					 kvm->cfg.real_cmdline));
+	}
 
 	_FDT(fdt_property_string(fdt, "stdout-path", "serial0"));
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
