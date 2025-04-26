Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C0BC369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4/zTpEh5H7tgQYMzsmLliN6lcx6mNCcdAp8V3vX0Mg=; b=0INArtBJHpmhCz
	vvII4SW47x9hFKgu7P7cALsD6eJEk9hyhvNqV7nfwQK3TX8wANxDOGkmorValkdoqWKQIQJb0c+hL
	AYWLxqV4UfhjmJH3lfCRGCL92hKEY0Pzif2/PNu0NeIHG333i9qmPZ9INgZTxfMosAlm35Pw0yY9x
	vuCruzreI24xysbe+63M9zgWV4idATfZ9PCIgj3aXN7vpApMANXB75IGxe95BnqTDx76sPi94HAHW
	iuvdjZN6aSnb8jkqV7L/un5rj/pgrsqmPusENWZzfVqjDGpc4VNN0KNfLtX/bUENJT6DL+SyZcklE
	E2tOczZ7/IS+31uNReRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKk-00000001u4P-3ihh;
	Sat, 26 Apr 2025 11:04:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKi-00000001u3m-31i0
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so2366542a12.3
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665472; x=1746270272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=H1YBQhMhg5shjABIpKDRg2EaiaodkNaDsqxPzYOs2biouuCE3BnRQrI83ltWkIcqXz
         +xmf9Md6chRHTD8gpIuyDgxhc7qJWEDISYPSva8IFJNzxzb8kiLKMgdLjwofItFRaikR
         YkEyBMpTDEoZ19NVBOygowm8c2Kv3sXvr0W9wQWk1S8Qkqy3JWHndcP08fhlS9qH89eh
         njrsb2+GiqI7LyiJYe5++Qh8mzhYnIOPBTbLtq2JWNWkwT9lXXVyaYFMTTmfsNbVIbIK
         fFfchCSYxon11nT2PZ5ETNgKkHucl7mjxiucCKUxeNU5nanNvyTmVIgUz6VNlioBTUd+
         jyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665472; x=1746270272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=lLS76LV5u3Puyi+lWa/UYaBEVDAyImoOptZLDt+orIKtq+yfHjEghEtAhIwjWNBw1H
         uc9ly8gWte4HgzHxRThv3R11aJlstXfR7rAvvn2xtYfB0Cv442juFmKW8F5s3bXKB2tQ
         pq3sCImO3dZAd5KryE4a0u/KkjfYY8P4RHf/0VsXpMfR3cKWJXizIE+AQdsgbpjgEIoL
         9HFKipog69FAl2QNnwdJkq29dF/5Qvravtg1JnxHkGxSy+8yoaA1sjAJFL9oHAQGnN5n
         Vnbf1aZerRymdUQYjiSeTcy/TIrWk9rYbT4mWOBBojaUabIKRO2V0XRVI07lEMV+RNw7
         D22A==
X-Forwarded-Encrypted: i=1; AJvYcCX27o7yj+G4aw2DAd9h2XhLqNsxY641WmQSuBZmNs17dnM7OCeBKWpAWmJ7Z6mtHQVpPgh65q1BTaQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YylnHafJtl3SFIclPG5rLPqr708OYsHRbtvCHVobtXMGUrVSANQ
	JZ3OGlCURAD3XUxm+PuU0rwnGX8+nBYL+25A8AWHt2D+/ENhuFyGiBNcdDbN8JI=
X-Gm-Gg: ASbGncvD+St/9Iu0uznH/qCFKybfzZGoyWplh5iFx7JfegRc+ZKe1QcQFEM99dGeAnV
	NoBH9K2gUixmBppQbh7+OhCRaC+bLI0zbKJ1r+IlxHKJBvWfL1lFWWawUPcSd/l8/C3+zJiIDMA
	viA4AJp9vSbOliYHIVvPNbmRvrys8TK+n/ZWaH3DJuH5SILk7fPeQYIfzU5+waSsp0ANtAE9SCA
	s4NXhcoZxiJScqzYPvMWythR2X6vTwIZZ3VlDtHI6tCFkYfvULwTydk+XlZvtaSVD7Uun36JfLe
	SuZSDLVbB9HpjiFFTswdZX6/MulPPHIKlyO4TJC2k6+9/SVAyeuegwmXePwZ7boxQeaiQYlVVrG
	jiiga
X-Google-Smtp-Source: AGHT+IHbv6LChpCH65BPpOe7ZBPebThZDY03o/Ar6cKTcr8f7+X0YX9w6Lyha79eeR/QT8hpjwMUew==
X-Received: by 2002:a17:903:41c9:b0:223:f9a4:3fa8 with SMTP id d9443c01a7336-22dc6a040dcmr37829105ad.19.1745665471721;
        Sat, 26 Apr 2025 04:04:31 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH v3 07/10] riscv: Fix no params with nodefault segfault
Date: Sat, 26 Apr 2025 16:33:44 +0530
Message-ID: <20250426110348.338114-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040432_759208_E4F6D812 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Fix segfault received when using --nodefault without --params.

Fixes: 7c9aac003925 ("riscv: Generate FDT at runtime for Guest/VM")
Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
Link: https://lore.kernel.org/r/20250123151339.185908-2-ajones@ventanamicro.com
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 3ee20a9..251821e 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -263,9 +263,10 @@ static int setup_fdt(struct kvm *kvm)
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
