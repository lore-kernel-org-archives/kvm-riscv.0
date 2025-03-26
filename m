Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3569CC36013
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4/zTpEh5H7tgQYMzsmLliN6lcx6mNCcdAp8V3vX0Mg=; b=gzPyb/xBkoOggH
	fBMHG5cl6AVADHowO2x1Vhuqa86HauE+2viqK57W7BBh9sCpCvflUwqZwM7FCzsBwjXeYwiCW/aCT
	ahuKJvrWlSZ9HS16adLeNBJVBSbq6mV4VHB5uSVfghAvZLX89AWGsqajefodiRO6Aq1b4AFaKbjoM
	3ZmFJCFNeNM5r29Lj/Y3KNV1yKN/zjU4BRuScei4oT99kXZRq0N7i1x2EocrS57IOuOtWxWhlK+LK
	G461i/XrvQ/Myt/NMjtFieYF4DszkHwp6dWcSsM/xzbl5Pexyws3uWTotI9IAO3OnPzIlt7k2UKmu
	3AD/iEk2QYCiInMQunoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKib-00000007iQQ-3h2c;
	Wed, 26 Mar 2025 06:58:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhV-00000007i5S-2F0c
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-227aaa82fafso77180905ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972240; x=1743577040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=kYxcFyQ04cfqmg/67OBTwmpsx+zMzQTtLfT2sg/D+Yn1gd70+Xs4dBQ84lbP5wrd3U
         puWgpbHuqg+umfqUsAHRIIQL/FrXJuWxL/cwhltaAjuzi+c69eha8zV8xJMyorSFVAZT
         mGl2LlvQ4O7XqbCcaH1OwGcLy2Gzf8bCm5ulVQGzK8QWutS5HV7VUFtq+b26xr8sXqAl
         a3kLrIyomeSonR3TuzxfbI6APkZ0fW9FIg/k7wMJILGEvjhA0cwcWZMzIJm3eG8AUzWI
         wRfiKEsspQcGu84mZW0m2iqsU/9XRJdwSRUVonQ4DCDCTjAk0vtcjcmlhWheN9qOgV3r
         q7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972240; x=1743577040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9/1qWtDS6xTLdJMtcRPhkRNGwQw4N6MsnqnwpODYYU=;
        b=UCqrgECZcaxGC/eOMePcnIGldMZOoCScIvecttAbpKp+yO/WwevCY6ItqmIQ79v7Fn
         PhHQSAfSXIZt/QhduoIYcBI5ht1B9piV/xbLZFjMPvv3A3krWF6clA6PLzBri6IgVhrL
         av1Ddr57thiw9VPC7kmwIGQ0TnnxI7wB3Ge8YLejc3E/YvAx69bAjc+/GBSrWP1EXO0w
         CQYupuzEkjKPkQKjVIj1W7XvDADLfF+VUli4w4XZ3jgDXuVoF8s7EghxI9idGUL8rT40
         4Z/Wup6ccJrpuh4hb6mC2lkqGH5OlbHwNyEXxMSBB6R1fJgvSCqgBHNpwl/PO6W1vZF7
         qYvA==
X-Forwarded-Encrypted: i=1; AJvYcCVhVkWoK3GE840jfiZFuPr1iM+Lq2HNb1Up6G4UnBqiiyPO0tmCvqHG2D2A9pdGxvmtiJA7KUmnrgE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFAh+7GrPtCmx+FKkvqVvqoo2YWuNm/y7XcZpmAtGl+mzskppB
	0BTwTt+AmG1PcaYEXzGduAC0bHYTQCkX0oX17h7tbAnrTA4SZ3sgh8xpfEavb+g=
X-Gm-Gg: ASbGnctMMr9ypO0bZkCMAmwl+KUxOmyBkIJmh2cqsdTDNRyoxsi5wo+6v74oztoS56Y
	eBVI7dSrVwGDOtNtzAQ1g//QiS6RjIyxtX8JZDmuG6SIOppE4L5puZQcmW8h/36PPFnlLZlGqJK
	SnlSbHHTI7d0A7jZf9rsg+0nc3K3lpu2VP8a8c1RPUyfZvI2bUrmdYA+RKc0w43bHU845zFGZsj
	0m8nr2ZTTLxzLcsZJGIvRUMvA5oQ7w6MU4pTAJYr+N+px9YLloNJ+YwLhJ91bxMXNSFyeh0qkCC
	FFgSaJ8AKkAyNXqN1IanFsTL1kvvnzBvC2Dx/9qaET40uEIZYTvE8aDCSiC6aoIVNRh5SCg6D47
	k/rswqA==
X-Google-Smtp-Source: AGHT+IHEXzBJ/0I/f9e4El2GDj7ALJ2n2VvSCV/ikyKtPUEZ5gKEr/YYTNu7LdVL4MHwzaSwVIphCA==
X-Received: by 2002:a05:6a20:3d89:b0:1f5:535c:82dc with SMTP id adf61e73a8af0-1fe4330dcf3mr33348397637.42.1742972240520;
        Tue, 25 Mar 2025 23:57:20 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:20 -0700 (PDT)
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
Subject: [kvmtool PATCH 07/10] riscv: Fix no params with nodefault segfault
Date: Wed, 26 Mar 2025 12:26:41 +0530
Message-ID: <20250326065644.73765-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235721_575291_CB3A6BE8 
X-CRM114-Status: UNSURE (   9.22  )
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
