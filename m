Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E68ECA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vg5jytglq1sRDmkA2WaHjIxgVxxnWH7u9QSTl8r5v6g=; b=Ywhpy4WJo7bxXw
	BEhqa5O70KCZLMHgwCQF7iwruqPPJTumxTIfO+jBclzg80DnK/1xBUDf/YeLjsL8qb9FG4sk6pHTg
	lcyWqtBgFCEDn0V6K8cJzYStOea40m3G+1AoGP3rvPXU0aQcEH8c1LAuCqcJd6ea25lS8FuUbSAtz
	1FFumwh+k4/qBpargU/vxEp80fW31/zVZR+4gSwEtxs5ibM8+FUXgAuJz/jQgcxeGD9T+dgpFV1dN
	Zf5k9zDVG8epfL9iTiwzuh+iiKxHtPl/Ky9cTQcadu28MK2iC/oPB2IuWaXgaHT8U0p5VnQz+taK3
	zJEGCabbvKoRpowrJReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca5-00000005ew9-3Cjr;
	Sun, 17 Aug 2025 12:33:49 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unca2-00000005etu-23hA
	for kvm-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:33:48 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so2583719a91.3
        for <kvm-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434026; x=1756038826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WdtyVjgEpxnmEVvN9KL7OGdIrEXqBJ3Mt9H1T0gTjFI=;
        b=m+eFc5U7toOPYoQTvJZ7sfG+9rj4dtbYKlnee/CN89gTHUZ582qxPoY+DDEUvLPpfc
         QE3l9/9acVGH4kWmXBXzS7bWZRB++2GCOHA61KtiQonU/iFYBZ0d5eMFukc1j9iAm/iS
         0vtqHHi1w47pGvMpEM1tjRENJI6ObuUSlYWUUVmv7FNV8AcHIguku3YcAg0WdlizV58R
         l5zeqaM5tbXf1QRzlflznitDMJejCL+I9aGgLpAIQE/LHp/9KkdCPo7XOORxhLHwOnzg
         Dhmrsa66ZxDHDe7qPN7X0mzuWv5TvRC0RT4R96rAjp86faFE7jqnLBflHbgw93HDDT/5
         2aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434026; x=1756038826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdtyVjgEpxnmEVvN9KL7OGdIrEXqBJ3Mt9H1T0gTjFI=;
        b=bcZ/JSUFDH42yrfrZXlamwbqBo6ynPxLngwHpClfHcp/OU7EWUGfHd2EdkI3Gg6d5V
         kp8hmybRvZtZ3v1g2pbATR0WElnIXz0yTZt/92x9ap8s2BYSEY3M49AHy8g87ZZhm67d
         c3JNeqU1BjljJHT+ZXt8bCMIVolEZEhPXBBO/2lrgXXmPeHylRWDfRPP4+AdPs7H+xux
         UVduusLJYdI0D2wzuTzHV89JU9qat3v4rlMuTajdRnaLM27apKNyrgUi4bY/0YtopLfD
         YIoVUyESN/xTRS0MUcO2b4Xwd5LOGsql7WvP9O6DoSKe+eS4wTsid1I+hgvMJT5agscB
         rk/w==
X-Forwarded-Encrypted: i=1; AJvYcCWIaj9kR6xGrpMfsFEyemk6gC7D6Jgk1D67QEjSORtEO7jXcQBp1Xr0dUs4+3hhQsnMo12mB4qzyJA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwmFQaiJKEJNmm0nIFGfgbVPaT7e0Uw3JqSDAV17TCl3LN5mMPv
	1769CuktylytmKd64EmSJ5VykxoVe5AMOVQX2DhvlKA9/Y5KHZRvQ/g8N0ZwywWUmL4=
X-Gm-Gg: ASbGncvD/fZ8T7IJ8UyllPpqVn3En0UGRpZ2SnjQfAKzFFhlRx+c57PpSsS402YFbgN
	+PYEbf7bxY55EA7GiK/rFQp2ovgREvulxCbd5FkqZSIZq7BU//uiA6kvFWzPfsbI1zZdwkfiamL
	6p3DIWMzhOjzYe4+5UUnNACAJTAX/ZxiajxcMQMPhGHt+Sua/ZFkCEj77StxQqCh6fLtKo/g1Jl
	PjC/IyeAcY8i8Fwor+YCTOP2PTNFcRr/YUKDHopWo0ZqQ1yOtXybKZYjaVuqG2a5iwvIwXeMOTn
	njUeLBYxKkJjH0MrrptiWEPe/QcFJa1/W7E7txiu1SmZWgsFw6smjUkIaUi4/kKx35CbPvJVptj
	iABk4tz+m8ZHwxLSGuVZYOCW5VK+RyaNcdH/6kfnYY4Nld9so8KyAE1Y=
X-Google-Smtp-Source: AGHT+IEDEZ+sKN9pizGMbZuUmdosnGUt8+j6ILexLeYj3eWsbGW9HTYMbtimVNOhIKuNFlbVtoY1Dw==
X-Received: by 2002:a17:90b:2d43:b0:31e:c62b:477b with SMTP id 98e67ed59e1d1-32341ec4ed7mr12210812a91.11.1755434025641;
        Sun, 17 Aug 2025 05:33:45 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:33:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/6] RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
Date: Sun, 17 Aug 2025 18:03:19 +0530
Message-ID: <20250817123324.239423-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053346_527414_D0708BF5 
X-CRM114-Status: UNSURE (   9.85  )
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

The hedeleg may be updated by ONE_REG interface before the VCPU
is run at least once hence set the initial value of hedeleg in
kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..86025f68c374 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+
+	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
 	}
 
-	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
