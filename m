Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C1BC54E65
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD2Igs7aTENp5NvB89ycD0VFdL783WwT/k8YWA+/n+0=; b=Sx0P8/C7EU1/nQ
	20T30a8oiXZo37qTetmt2yOzIy7G+U2J5qkj/4xWm2cHEjz7bjyKruYJNH1eKEsZWoXWNNbQco+ys
	zTwMgjGHXaPyRN0av1lEO3JVWBx+nccfy+fHZYg9GBJh8yNqvZMRLqoDaas6RLV4gyBej7wxgF/uN
	WuODWe/6wcWbaYuMMlsCquOSoVwIU56N9QOhesjgOyYsxe7H3yVMdMfkmmvp586T/n98fNP0NYEqL
	SEdthjx+TxXpNTgtQaMRlmWpjlCg1aKAIWvz3g0pnKzoM9t1c/qbjJQHtq9fV85zuHv+pxgzfjWAO
	/fl3ussZiJ69hAKa9tWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBTJ-000000020rl-1BW6;
	Thu, 22 May 2025 19:20:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCt-00000001wVP-0nMf
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-231fd67a9aeso1774695ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940634; x=1748545434; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=G/x/xI96ny/JbhY2PVQ1Waa39l7iDiIPFnIFn0NLPcnfaz2v82/skLijn/LVRsmClF
         y44pJ6VT4Y+GAR9nrGrB1I8M/ZaLF2sVopdRTz8LGVCzvfZ0d8YsLuBlBYa9lnelJtCO
         mGkb4xjxtGRsbXZK5STKly009D5eZlTiGshWEJ12fmFaUE6+DL7YXDiCGRrlQYaTcev2
         wuwbfN7EwHlBvVDNrz02yYAYSZD0Rch+9SwSkUN1OLVkycG0at+zSVaVK9/EuzH7ZB3/
         1aEmZamvBpchzdTjtSpj7U8sVWltRnruE68uJ9G7Lyu0lR0ntpeGyGD3henP12hK3xyE
         KbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940634; x=1748545434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=FZwOGoLf/cuLSxwVQz3pBWvk7Z1CRph84pmeeU+NTWis+loWvqG8lDw0H4+WV0tIvR
         r/IX4KNQlhWKP24CWiTblpQrlLC6Wh8v9er7gN4UKhax+O36xwpc0Lmx0/SgM/26iZXz
         N+kW6ypzqNFARgjdZD2uL3J0hfzHIKeEJ8QWa4rpT8mEKDVrHpw+jEzmn956zhBss+59
         9sBhF6B/+lhQKk/j5MVZgDsqpT7FM1xh5QCionhm1Qk6wPHQun6E8px23DUcizmcx3X7
         QlX3/ObmiUOWHrnNywL3t4IKbX5y3sR1sRNuheiBg+NH6OBzszON43F6MBc/gqGQN1xN
         DrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf3birQlb9b25F54Xbs/vDCn0eTO0114zJWspKMQw2ayD2A6cb5/yS4hiFF6Lhb/TKTWOG8DoL2HU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMZaavs6quxc3juE7ukvV9ctyJwJXihnXrVVYDGt/tx7HAKVLE
	nuNq3K7zJUj2FMTdQbXWyAWWjnTOYs0xaqwoPTSMbCji/eFcs/MFIHL76+JrGNDatZA=
X-Gm-Gg: ASbGncuoKX1Pwcsv0eQSmplLV6lT55bivj0vXkaYhVJUExBW9dug2S5xzdpWlnmUIis
	7e4uF9uOTtS3t3txKOIb5Hnntcw+UzcKs+Em8L5+w30Hrferl4Khy0t2YMAfCSRv5iM46XG1vzZ
	Pz4yLuY/v95eg1KH+dmdw8KjAgEHL47UVpH3I5xYiSsoSCcg555FDmPbbk0Xeg2W7UTShTUsUNt
	SPNYLMxK/gse/jkQfQKA6okYlyHQpgGLVfnxhVC33KptxeapBBGiscyrbp9SHif16rTQ9lHpyyh
	kEZUUBSGVnzISFAiLBE9FWLbxisDZS8KICZLt5ELGMIghfAfvlZSUMj6tgCZCX/u
X-Google-Smtp-Source: AGHT+IE7MkEZajOwtulJ1pSoS+YJGY/C1JUznV8zU99zjbdE3O1pdB4nhaqsx7X0UH6Pko2Lha+e4w==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6091775ad.15.1747940634357;
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:43 -0700
Subject: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120355_235126_AD1E4801 
X-CRM114-Status: UNSURE (   9.71  )
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

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..194299e0ab0e 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
