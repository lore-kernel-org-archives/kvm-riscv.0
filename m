Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D022C0218A
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPb+vYzFVOgxf7ryWbmYQcLOm918cuaWM16L4q1LVUc=; b=c7aeeUCFda7wEc
	91+FYyBcRm0Yv37ZEgV3IkrWSZtUYX0zxp6YUXHkg55XlyI/cBXIX2XXiFTiNAb4xIIQjvaFotXzP
	CPgF077Xx+4JC6vD/Vg5lkA/xTeQ2iDyzRiDY53Pzq6qMYnst/2zaWMpDcea70fqX6Ul8njg9qGe7
	bu60ON/VkM74ncPeOIKGhI+Sp1LvewlHbY83/uog8t8wBUUTmgqEB+WrMf874aiE3b5B8bHfeMA3v
	R56wJdqsacCJ/g50UHiaLu8PHAvrp+2INORD+/sKo6MUkkbp+zxkmuYMH49jjjvO4MJq/3qdemZ7z
	juGQT6zNzfmp23eY9kLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP70-00000002Mc2-1aAM;
	Mon, 27 Jan 2025 13:25:10 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6y-00000002MbA-24eJ
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:25:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2163dc5155fso75917275ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984307; x=1738589107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLm0gl8QnGcQ7zFQ0FaNaPt8MyfRUgwPTIjeTPLiH3w=;
        b=T6vf/rJtZepig2KhdKPXTILZ/i1jYL6ZkOuVolUNix/FjTfeM2ln1N2Mp2LnD1KAN4
         wHd54rDjqPYgWXiAeK/RUNKMmvr6g8Y9QQOz2lDiPSpk4z2Soe1x4O/qpmQX2MJqyI6C
         m8QjIZ2XWaFwRTLuCQjK1eVqlwJ0kzYOt0/mZ3iVIN2kuoA2vewAUIkM/odUAPTqnD7B
         ZRHJxFcD4wKJyMn0exh2V8MmMHCG5w0W4Wmk/YnUHdrreDdDy15Dc5c9uHTAzZ8PDxFb
         8/OBTPhVa86APDfLXfh1XMeU0ENe9qZKhfqDj/gx8vskqr3cdwsZBhVKOC734DmCNb1n
         REKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984307; x=1738589107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLm0gl8QnGcQ7zFQ0FaNaPt8MyfRUgwPTIjeTPLiH3w=;
        b=wMjjIJIkuelTSuB2yM+ntxnX9sdG3wLT5qkgbwmJfLAc9SK3JfwDxrV9FXzjx2JWRR
         5SykZZiJpV6lEMdgQL+XeeQyngmHJxnaAB4nhhVj/pIEjop1nv+U9R6Po2tbyxXK8q9b
         sqec3npiIA0DgrREyIrVTXdVq/K/PiqiktaPGTwfeO4t8S7FkfGJ7bqmxKycJaJ2citt
         M5a5d5EihEcwzFoHpLWiYgi1bQY7ooqEJeXmOLHHa4TlRsOUdaiHtBz0xPJEYb3ELqRl
         nZJe75sdQiGjEvGKmqWIfM+x1p+zgTX0ggo/ZPv5z5GX7B2cmzAvPql+9jfr/Sdw5zuL
         t2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBZG+UKLOLiRTxBySSxXZZbSQCTvyN+0DSuWkLDbjO4bIi/2bsUtm9iWHhnf5XMhJ6b4z00+DqimI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCh+HHzzADIRRXBS94c05UEEKpgB1Q2b0BOLnSt5SgFG/5AG0m
	w/N3/CulyB9RSIxKcSTwkpCrjUw5+iQ7hWsnra3Nea8rs+fPWNA3T8GyTTRLh6U=
X-Gm-Gg: ASbGncsqw0ui31Ojt9k1c83xqNuPEYKZy4jljSHz4nm3Var+wxTrRwIJKbWLrjkhX2q
	lTB7vncRDSAxNiQd3mzUYweQjyZdflE6+2c3X7xnflcxvkI94y38YFfuX49Sg4mcW/OMTwuL52U
	mqIYN06BtJZor3Sw7WbfawR+BYm5H1/OGFTump1qvPafuiiVflSdLLpTGJbLiaDTsdKCwO8PCOC
	NXo1phRRkxthqJdlGDRQ7wvhfxr/hXkQezXDSy2YzWGkVi5V6Js3CJF6AMQ+ktdPFrnepr5h8Xt
	ZWgS4ZChjWuvucq3vUv8gEprNUI7GSzJ9JyBs0M2mVjP
X-Google-Smtp-Source: AGHT+IFiGzZakhdLd1LspGV1QVZQ5QdzJe3CiSjx3xREUdTHgpSJnCrOlJjbHDpzw3fA6t8lwz8Trg==
X-Received: by 2002:a05:6a00:4c18:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-72daf99ec6dmr55413407b3a.14.1737984307586;
        Mon, 27 Jan 2025 05:25:07 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:25:07 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH 6/6] riscv: Add Ssnpm extension support
Date: Mon, 27 Jan 2025 18:54:24 +0530
Message-ID: <20250127132424.339957-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052508_531738_5AAF4181 
X-CRM114-Status: UNSURE (   9.21  )
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

When the Ssnpm extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 4c9dbc1..03113cc 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -20,6 +20,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
 	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
 	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
+	{"ssnpm", KVM_RISCV_ISA_EXT_SSNPM},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svade", KVM_RISCV_ISA_EXT_SVADE},
 	{"svadu", KVM_RISCV_ISA_EXT_SVADU},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 5eccdd0..e56610b 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -37,6 +37,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-sscofpmf",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSCOFPMF],	\
 		    "Disable Sscofpmf Extension"),			\
+	OPT_BOOLEAN('\0', "disable-ssnpm",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSNPM],	\
+		    "Disable Ssnpm Extension"),				\
 	OPT_BOOLEAN('\0', "disable-sstc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
 		    "Disable Sstc Extension"),				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
