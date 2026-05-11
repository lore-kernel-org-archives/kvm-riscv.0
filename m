Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1EDCD37AC
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 03:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yj5ZyVGiFMGGAtnmFNPTYHgRJafoTCjVfXrjjuMjZEk=; b=gYu9zI4yjx4k2J
	EFxrrMRw9KXP1Hn5qvIGVMHzEODExJMA1k7acWmVJFurmvRLCH4zvcvxwT0TrgJ1QY1pxWKM58bF6
	52LiswZT9pXwu37WvyWpSgoENLksC/I6SxX7uhagwpynLgBIiglXEz5AZy5ZipDv+4trA4GQiiZyL
	/6pE7vPBPsqiLAwn8cvT+WFALA4b1cL9E4EbOU2ivSrRRSTOAfiI3tR8UOzJwWGRiVdenDaDLtf6c
	m8aDFXXqQsbAAoPYy+zAMzCJuOvbqSyCHnN5Me3oOMd3YNGK2Ic9WXRq5z/qb3aPJ03j8RoXaTXKR
	JXeX9ZISKnBvukPpZNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHDa-0000000CA4S-0phA;
	Mon, 11 May 2026 03:22:06 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHDX-0000000CA3v-1YPc
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 03:22:04 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bcd730e090so1572545ad.2
        for <kvm-riscv@lists.infradead.org>; Sun, 10 May 2026 20:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469722; x=1779074522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LE/4+F+CsUsIVKFjtrPVESM23HnQEEdghZta/8JF8Ek=;
        b=dmhG2OI3Pg6KzxeS9k+zgrMAm8MaGSbXfmPTjpjviBOyQDL8CJCaxOI3ewjBREUQED
         IBQX3xecZDUOucANH6txebkJmTxi2QNuEvjzj6J4DipPjnQn8fJfZDB50H4Ohle880Bw
         EygJW2I2/XKVolTiNblqMKD5cP1FzeGFEzJQ0qx9HZD7gy99yXnCc+7Gd/G31OOSqn9c
         kO1hqKnddjXecqbJWxjCayM6Tf8J+8/2Mem9JX6Tjx3sbKSnZr4BsBWKsOwNQFXzAC/e
         Ks5OX8n+HvHZeqV5ax03do95J3m7GtgZynrmUEYUr0fNgfQ1RkAsYykVHvZUo3Sk3t9o
         PAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469722; x=1779074522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE/4+F+CsUsIVKFjtrPVESM23HnQEEdghZta/8JF8Ek=;
        b=LGX/53g1B2nFv+sRT22qsyXCYbH4R4K8v0AQQ50MTWOFinfqdD086syrdpe2nrl0E/
         0qP8OwVZoAEAW4acG6L7go+nXCgnqDaOeCZtNdwo9py96bMyT70JqbpS7f0TGlDUw6nP
         fYRh2JbH3mxdx3MErnlfcOrmZJUcLYkgjYaTwE5dyKZBU58wEfvhF1zIPOC4IEprGku9
         jsZQr952yzLSqcHO2ICTDLDqGK8RwVZDw9ggoIqTeLag2mrs0XPuvBnHva544UguTqb8
         6G0vCwrqbsK770ZByO4kEG/1pJmAc8OUC5LdjtPCcJFaa+I5BbaL+9beQ5+f7vxbebzA
         iWfw==
X-Forwarded-Encrypted: i=1; AFNElJ/vMmlBV3qrX1M6fKqCNa/dgymywZBeUb2cQNt21YaX0vg3QF2B71KInM90Ez5OemfKGLA17A3cly8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuxXWGxdMLpeW5+W+rF5zpvNe9mhkGPpbPipW+w8OaVVrak+SP
	ULirOmavG4+dCT1dY90wwU2Eon3KfvzKy13eYGIWrAWVKbOckn90mf0w
X-Gm-Gg: Acq92OFBLynn6ddhLtdvXsfdtTYE5Xn6enxp4vs0EU6cZ3oAOr6cy9IoRmXtex9vaC8
	gc/whqd/HaL/Ef3tQRt2j/WL+W2j+SHI8VBKxzOeKgNiKF9lzXQVpj6OCivdzM1bklvgTsqJZzG
	QfSvjZ5R0S2XA74aZbn4lT+oq+Wy2xuzSyYjefhP9nsEkZGt8/9XlvLFv10aYeKViWqlBVmp+6Y
	ZGFxV4rsaUE/M4jVozXc/0PR/wkZaCP7kv/QK7HYLnJEcYhiY9jvF1hcl3MEd8pxtBAH0PVkQpy
	gwp2v60a3H8NKPhu/e+y/96igioCwJry6PaUDDo/mX2gtAcyEQBd5tFEuLM4rmkg47iu46AT413
	+fyEvAFGR95iOK5WbmZ+s8HOmC6kupLGJ8kBGMsAz3y18JSyuxjxtxPuvhHOdQnGmO4ON8Fizf8
	0vp73Ii2oUknJkY3wS8MzDYRAr6+xzemDgmImclqBg6utjiwhA4I6Nz8lzcVEmNneMSgaJXNaqK
	NmWK1N3j9WomPt06IYE8axGemeIBXIVCG9G/qKN0F/4qQ==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr246513525ad.33.1778469722390;
        Sun, 10 May 2026 20:22:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d269fcsm89856955ad.15.2026.05.10.20.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:22:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)),
	kvm-riscv@lists.infradead.org (open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] RISC-V: KVM: Use flexible array for APLIC IRQ state
Date: Sun, 10 May 2026 20:21:44 -0700
Message-ID: <20260511032144.361520-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_202203_411747_63CFAE4F 
X-CRM114-Status: GOOD (  12.69  )
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

Store the per-source APLIC IRQ state in the APLIC allocation instead
of allocating it separately.

This ties the IRQ state lifetime directly to the APLIC state, removes a
separate allocation failure path, and lets __counted_by() describe the
array bounds.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/riscv/kvm/aia_aplic.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index 3464f3351df7..748107c347d9 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -35,7 +35,7 @@ struct aplic {
 
 	u32 nr_irqs;
 	u32 nr_words;
-	struct aplic_irq *irqs;
+	struct aplic_irq irqs[] __counted_by(nr_irqs);
 };
 
 static u32 aplic_read_sourcecfg(struct aplic *aplic, u32 irq)
@@ -581,7 +581,7 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 		return 0;
 
 	/* Allocate APLIC global state */
-	aplic = kzalloc_obj(*aplic);
+	aplic = kzalloc_flex(*aplic, irqs, kvm->arch.aia.nr_sources + 1);
 	if (!aplic)
 		return -ENOMEM;
 	kvm->arch.aia.aplic_state = aplic;
@@ -589,11 +589,6 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 	/* Setup APLIC IRQs */
 	aplic->nr_irqs = kvm->arch.aia.nr_sources + 1;
 	aplic->nr_words = DIV_ROUND_UP(aplic->nr_irqs, 32);
-	aplic->irqs = kzalloc_objs(*aplic->irqs, aplic->nr_irqs);
-	if (!aplic->irqs) {
-		ret = -ENOMEM;
-		goto fail_free_aplic;
-	}
 	for (i = 0; i < aplic->nr_irqs; i++)
 		raw_spin_lock_init(&aplic->irqs[i].lock);
 
@@ -606,7 +601,7 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 				      &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
 	if (ret)
-		goto fail_free_aplic_irqs;
+		goto fail_free_aplic;
 
 	/* Setup default IRQ routing */
 	ret = kvm_riscv_setup_default_irq_routing(kvm, aplic->nr_irqs);
@@ -619,8 +614,6 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 	mutex_lock(&kvm->slots_lock);
 	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
-fail_free_aplic_irqs:
-	kfree(aplic->irqs);
 fail_free_aplic:
 	kvm->arch.aia.aplic_state = NULL;
 	kfree(aplic);
@@ -638,8 +631,6 @@ void kvm_riscv_aia_aplic_cleanup(struct kvm *kvm)
 	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
 
-	kfree(aplic->irqs);
-
 	kvm->arch.aia.aplic_state = NULL;
 	kfree(aplic);
 }
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
