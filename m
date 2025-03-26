Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8B9C36012
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 06:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GEIGtHaLzghAU9LfF6ldGry2fpklTw94UgLFN1WS/K0=; b=b+E0fqgo+1MlTm
	2XM9NVSurYB92BCvkwuvAB97hV6ui80OtDjAx9EzWAySOJOH9ujwWzBUPoQWwJmJX127X3OMRgT14
	hXCQ3xkUrmFz/yva7ub6wNfU+96TJpRH4tHs6kQeK4grUGzfigbxx2b8WhfEVg3lUuLasbQs7V8Oe
	OuNmP8hYhxesk99Ox65aqCQbha+cZtYvpRPIBfs7oyGfU/dPzHZgzbu1G7BJ+EfV1KYGq3Mp45I4y
	Ujp18NhVSszQAXQmx0sGihX3BESwOT3auwcI6oEqcTcX5VAoEikrk2uSYMm7fTd5dYyZA1X+Cmht5
	hWq0LjbI3+ekiSY3PY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKia-00000007iOm-3PDy;
	Wed, 26 Mar 2025 06:58:28 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKhK-00000007i1q-2cjR
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 06:57:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2243803b776so12757415ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742972230; x=1743577030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JMdKo0ukTUZVJpakOidJHpNdO3nq4lSPuscKE86G7E=;
        b=YQqxZM/e6ZTXgecFqQ2dIWoMagwy8cwOQT6Jpwch3742tL5jfzriEwx9OkK82euXvA
         G6gO8mbPwYcovxGPcvh2nuTyjTQdaFFeAk+HWSAilt+5gFxpC6oAFdKIikTU4lTMaQ20
         UqYj6PsLVO9lrddC+E7p3gZGuLDw5TmXpPMfkiarq2bOpnMee/hzv5v5hgrVN/13lvcl
         nY4w3AARy0kD3zzXRSa/eBzb+COKia/RJxhyyidiwhF2buh7ZVyIiKz+nnzlXShaxq7E
         a3Cxg9s+vKxV+0UOObZJYd2wAAmyg1G40FfgA/FLceOLXX+XLIHJAENHoiuepDBDpKph
         SvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742972230; x=1743577030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JMdKo0ukTUZVJpakOidJHpNdO3nq4lSPuscKE86G7E=;
        b=dAquHCN4Th5seWRgpUoZtcjNXiXAYZhjX6fvuHBchUnOmyiTFLSQDY0ed69GPFcnN8
         QCHW0lg4djgnMObytBne12ThUKzYjCW/4jiSY2j+94Wo3un4FesI5pWLakOf1AXTIg4t
         5rREmQs3RBA8/JwA2W5EsKnaRUP/phQ9BekRr5Za7lgLkE7sVowdynnt4jMrPmCn8oPj
         kJ5CtdaHO32LKlgwepDT3dYmEjr8SbswC5MXGsHmDjTPc+/YQgvYQmv40j5fwCB68TM5
         fAsNvdgfWra6AZTF/R5IHVQ3j1lVuvHWre6HM6/v5UhmyhY8TQywEcPQHziD1lN+0mqY
         iVZg==
X-Forwarded-Encrypted: i=1; AJvYcCUltLs8A56YDPrsJ1C6AJ2syAv2BCNMSaoSXHz3v6viAbAuZWAm0EMG4v33Go7SYgQLp6WipZzeLwI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8M8zp8LiO6/DSK8sCE7kbLP5YZUbbxN+SfVhSLGP8Uccl+bP6
	lNuEge2N0pAzXkYtb/tREr++bH9bQXKThmvaprtbGUDCw0MCCBXppUgYpYTkyWY=
X-Gm-Gg: ASbGncvoaWn7IMZPLV/53OM1XKY/zh6Z6wt1aya/yVGOjJxnEs71QKADu01/5JBg30d
	G+XW8LkZRbGoxgYBm+qGMmVkTRBdYhJTgIMoqieMLjB+6pw+xcnAR2tf/zg9TfTbvgkzxz0y552
	98e/SuTYUCtb/fjcdlb6DT73IdW6bOGDTerLy/fECERe6nE9mql7KRkQCdcvoPl8gThTo2pkI4H
	eAjYjJc+Jv2kT/JF+0ZBuxGBwvwGQQ4N09BZQdMUHKH7WiS3mdgAHJLcuwpC99CmYfASmEJDhcZ
	CFRD6MO7ucimIbjaqYRdUAFQwi4pa0yQ3qotAHxbQ3uPfdGT6btrq7pf91yCo22Q1skIusKRpk3
	IzKhtLg==
X-Google-Smtp-Source: AGHT+IFa2pCVIIu2o6x+sV4R8hNo3rsH35W5vMtmxz4iiJ7DdjwThxn86EFdSC/Y1OeyjpBFDC40HQ==
X-Received: by 2002:a05:6a00:22d0:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-73905a2ae3fmr29731979b3a.19.1742972229622;
        Tue, 25 Mar 2025 23:57:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c8d1sm11788817b3a.105.2025.03.25.23.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 23:57:09 -0700 (PDT)
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
Subject: [kvmtool PATCH 04/10] riscv: Add Ziccrse extension support
Date: Wed, 26 Mar 2025 12:26:38 +0530
Message-ID: <20250326065644.73765-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326065644.73765-1-apatel@ventanamicro.com>
References: <20250326065644.73765-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_235710_660817_0CDC9A65 
X-CRM114-Status: UNSURE (   9.48  )
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

When the Ziccrse extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index ddd0b28..3ee20a9 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -48,6 +48,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
+	{"ziccrse", KVM_RISCV_ISA_EXT_ZICCRSE},
 	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
 	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
 	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index d86158d..5badb74 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -121,6 +121,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicboz",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOZ],	\
 		    "Disable Zicboz Extension"),			\
+	OPT_BOOLEAN('\0', "disable-ziccrse",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICCRSE],	\
+		    "Disable Ziccrse Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zicntr",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICNTR],	\
 		    "Disable Zicntr Extension"),			\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
