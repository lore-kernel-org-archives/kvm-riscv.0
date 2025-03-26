Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A151C36010
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ygRhxrIj5LJ8VhaihvFF9F2CuqTfSOr/rRa0pFF5ME=; b=blZzCXY6AHDdu/
	A4k3avHtjxRV1hcxkG3fKZY5PR2pA6OxY0qJ3N95epl03ZndRxd33TxvXpe7bqt+UAh7zGPCvzfuN
	lOlyd+dlqCH68GMCe2JKsrZJuPTRVh6+YRwG4Tf23B5O0YGsEgfoq8d+QXCPOyeiJw1lwmp54IK4p
	SXsytOgl9oZVPZsGj7stOtb1a9bWtbZ3kBS3gE3sbD9MQ6wlYPW26v7tAxhzV4fkdGg0TA4vAxYig
	08AiO/5MYChbrABhl50hQWSuqldhw10q2Eer46JKK+njPgRd97My7aedR6fxCVzDUOPMctAUmRrKW
	/pzDNt0jIV8qC9FQpBdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKiZ-00000007iNR-3RbT;
	Wed, 26 Mar 2025 06:58:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhD-00000007hzS-1B9s
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22622ddcc35so11234275ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972223; x=1743577023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UooB8pU0hhucKy0mJr1FYDYzWszgZ0h/AlN421rxqXg=;
        b=hDpxXbANLEzT4BcisBXg28CFLVvDDDVi/O1QXb0rd5JHZUkegODUaZ/GRw3M54a0aM
         zu3YQh/oZQXb8GOzUzdUfoGMl2AehAVKzK2hy0fZX1Ti9qC1gZglxACTOV+gZLfdGLOF
         vGr0VByHLPJKPDvOhlUEHBJXgajKcULaGO6GPAysN6oFS7IqHFo2tQzcLTk1Lr+F6dcB
         Gz+4w2wP/y4/4t0jpcx2VVUKWSPID8BeNXkbUfeH/xLPS+3s2bi+FvNTOKxKwA5c7CUD
         N4CnK7Mq83fvaV0tcA7JlA7lLmGMjQka859U9+9+IEMrlBhXelk9NRWQDae6Pj9M8EAP
         hiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972223; x=1743577023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UooB8pU0hhucKy0mJr1FYDYzWszgZ0h/AlN421rxqXg=;
        b=IX+/sjHMF4uCZhKJC+30tgmEJLik1pPo4xUY1vyOeIghtRwHsrNCCDiPFGNN7kJfcU
         8eX8erT8rjlaHAxoVMVeYsi6FJs3+Yod65EnVX7gBMRa6zICEw99WPhmfzj7dO9r7VL1
         fmjihffypsRwuOYMNNXQhd8MB/qgA+aZbLZVEepboCNm77/t9/qKva5h8z5VMZVaDT/1
         ggm1jmY2Ixov3E5uHMi96pBUDPAjuYRfdSFuYzUk2YuwM+Kme/7bR8LVk3dE7KlUH0e5
         0AKyP0qoc+SBw1tgVQYojPMVKzHBvGGw05/LFkxxmgb35XFslL0s8w3Ug40duyOLnMpP
         ApHw==
X-Forwarded-Encrypted: i=1; AJvYcCXcVqWFec4vedKzuvIZ9FMPp8Fkd3uCLxFn+SEwhRr39iJnlCiFR7ug7G5rkgFa0G9EY7vP430AJQo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJeXA7eTT/bfElS22pPpPahHUp3/lCdvlRKZhIvCaiKam5D5eP
	OHcL4IrlUJ4S1v1lptHlTD2pfLvQnA4BDgIJlHnLcDs9dY7KloU/41yiPg/sp9A=
X-Gm-Gg: ASbGncv4wclGd45K7j/Djl7sHSALXWbVBupwyEnoXcJFvxXPlpsh5FvFgmAKU+VY19L
	cnO+6k+KCqN33kLCcrOkwcWZlYub16BceVhlJCaaUqEK3S+rCOfvP0EyZx26r22wEuvkRTsYsfu
	XEcypkzQIPApmkfi6RM5zgpSRyL5Oj7Kji4Z+LYVnBKwdWrCg0TBZhxJsGiEizhnyZeD8quSJ6b
	YJ5y4Zs6u8pIacQkhaIMcCZsJfAnyxnTPvhBX0PI3UNepsDRpwZ6a/MxDNh7NaUdne2kG+vSpdx
	PkqppM2KBGLL8rb3rcauBEQMBI2MMQZL/mzF//ppceTqgWMRXma5UAY9loDHdSIfsDN4HwE/1vS
	lcgj2CQ==
X-Google-Smtp-Source: AGHT+IHZmBlLXo15HqLzfG6n0+JX79YNp/9EDbe78slX6ySDdiXIBZcPfCN/KQ2Rjg3+CfilLku8JQ==
X-Received: by 2002:a05:6a00:e13:b0:736:fff2:99b with SMTP id d2e1a72fcca58-73905a530b6mr30985680b3a.23.1742972222684;
        Tue, 25 Mar 2025 23:57:02 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:02 -0700 (PDT)
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
Subject: [kvmtool PATCH 02/10] riscv: Add Svvptc extension support
Date: Wed, 26 Mar 2025 12:26:36 +0530
Message-ID: <20250326065644.73765-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235703_316695_5E069282 
X-CRM114-Status: UNSURE (   9.28  )
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

When the Svvptc extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 03113cc..c1e688d 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -27,6 +27,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
+	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
 	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
 	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e56610b..ae01e14 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -58,6 +58,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-svpbmt",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
 		    "Disable Svpbmt Extension"),			\
+	OPT_BOOLEAN('\0', "disable-svvptc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
+		    "Disable Svvptc Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zacas",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
 		    "Disable Zacas Extension"),				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
