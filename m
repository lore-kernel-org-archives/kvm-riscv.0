Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B897CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 Aug 2025 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHmC2UQcn9IqycUGyrqPmopfImq7U+/9AmnXeQtQcIw=; b=GZoNVXNx2ZihnN
	sCoyO+0W2feFRFNiILhrM9xudd4dJrYus3WZCcSKgHcStxUINEJ+u3vW5f0tJZNcScGwtDoi7Q7tJ
	m05Mrb/4c5TJOw4hjdiWrn/KsOehHCNdK4ncRpKdzV84BYQvEE7DurJM+9l76Gos//nOHmxE64DnO
	sfniAFH4SFBExdiki6GeXR/NYQoxNw9zG5kB1BwoepkVwLXjWprTBoua+kRVh35EovY1CzL6qriJy
	WuJUQZtdNycny8+EH3VRF5tp5mKZHImNgPF8yd/wQK3DmJqht2JoXWB2GeqqCdkzpmn+URQNgag0j
	hMABo/BoESJhUjcgISRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaV-00000005fKr-3lCc;
	Sun, 17 Aug 2025 12:34:15 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncaS-00000005fFz-065u
	for kvm-riscv@lists.infradead.org;
	Sun, 17 Aug 2025 12:34:13 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b471737b347so2266089a12.1
        for <kvm-riscv@lists.infradead.org>; Sun, 17 Aug 2025 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755434051; x=1756038851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSJAzpJrB/+0Vhq3Jx8mxwwAXiXUMS9lCBbypwhOCgE=;
        b=MhDEcSHmolDiIjZAxKRuIfDQo/WluuAM+e0JPoXx1R0QuPAAzE+i5hbi7K9IiSknkt
         8NfLpQf1xEu5XL4ettZs/Q3MAUuxWpT8gVscaVgTbO3aC1xsHNBG1GmjjIoRVEcA/RwD
         ZpWydwoZrchY6ImQFG8/vcnEvNcX1TUK1iJtr6bnb/o447U5PJ53lub6pkohpgAuKKtw
         NNdACfCy7Qk1LMHJ2OijHHtdHMUIUcfMqr1bULNXtBtjYjFD3k71ayPa8OUWs0m7vyvk
         f9QYOsQ10SdvSuvP3W2z6+Pg20bXKXdxJJu8BMppCB0B90NL1xIOYD+FcqEXtAl8eJZo
         nFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755434051; x=1756038851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSJAzpJrB/+0Vhq3Jx8mxwwAXiXUMS9lCBbypwhOCgE=;
        b=hpsFMkmY/vlGxEnatClPwiyE0VHJh8/QKXDv7OZAzMLDr5RSG2eMVW+kTls1d9pdG0
         RsxWBXnH1owTgGftRQIQDfm2RT1Hk/SrLdnxJpdjdPoqOLQsu7f1u9SCFlTFhSOsY7iv
         Rs/eMQbnc1hYDdbn/8+xu9sCPQyCpxCZ8+7gUGbd61pJ5k8/v6IwmgMK8Hhk7SNxD9Pn
         57iqAQTR2IgLRGKYiVdHAwnsMl83hMAkKZp4qE8IwuOobP4+nbsPR+nV7yoQ6GsPmujF
         Be5dCDjzcU2aA0K+QO0QYG1g3PH1TU8T4G+YEymjXUEzoZX3mQNICV9fimO6Kk0jj6/4
         rjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn0cwBRLdmyVP7bIKfWhrq/2dp5YfkFWpKdZFeOptWwhQlSdxXsJWMrT6SW7+fxvxJHhOe14SU4Rc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF73gnrHLjttbi01gQS7F6/okGDUt7+DOkd9biI1PVNOi3l3cn
	9l69dNojYUEk/8uiirmRGMRv4XD3HJTKNztGExK9EJ46esDzXKwWHkctz/ecMveKZ2Y=
X-Gm-Gg: ASbGncsbKlvcDGyWUaCmjWAyAQVu0OZQbkSzA7tBJk1a7QaJaixFfB2HmQ9Kc/W3K8s
	+0imTeVrCV7vlg9TLuQa1N9x27pZzrXkbnTkR5t4xQ3bpsw80g+ZBvZuapxboWcZLV4II9S3vGW
	tNWa5KJgOdThzK/uxsgrJ3OT1kvOSx5h1wDef3z0UzoarnO4sgvkTil9TLlwrXVYMAg5FreLX/n
	stohqm83OW3Y1avY8NNEr1ZldZ3tXmL17sXDfx3T6EZH8PsG96u0/vZSipos/hKpa8DYf2Elfxf
	keq1B4+YqXPNdKzvyTHY0qBeZjE9CW7cc+Ib09gNIpJaK2PSjv2GMiLKeUU79ScUDpyckKj88ek
	d/DwPe5Bgj8IaFgOS93KColeBURj6V+glQ5nu66kelL7wUCHcY9IdUHI=
X-Google-Smtp-Source: AGHT+IG9bQcRpasLdouxJiE//TtQ5x9wN3dfUlCeMpGjavP8R5CIApkBHxCO4i/AmFiEfyzFXEp67A==
X-Received: by 2002:a17:902:d50c:b0:240:763d:e999 with SMTP id d9443c01a7336-24478f7183fmr87414495ad.29.1755434050978;
        Sun, 17 Aug 2025 05:34:10 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232b291449sm4480912a91.0.2025.08.17.05.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:34:10 -0700 (PDT)
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
Subject: [PATCH v2 6/6] KVM: riscv: selftests: Add SBI FWFT to get-reg-list test
Date: Sun, 17 Aug 2025 18:03:24 +0530
Message-ID: <20250817123324.239423-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817123324.239423-1-apatel@ventanamicro.com>
References: <20250817123324.239423-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_053412_061066_94250722 
X-CRM114-Status: GOOD (  10.23  )
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

KVM RISC-V now supports SBI FWFT, so add it to the get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index a0b7dabb5040..1bc84f09b4ee 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -128,6 +128,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
@@ -627,6 +628,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_FWFT),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 	};
@@ -683,6 +685,17 @@ static const char *sbi_sta_id_to_str(__u64 reg_off)
 	return strdup_printf("KVM_REG_RISCV_SBI_STA | %lld /* UNKNOWN */", reg_off);
 }
 
+static const char *sbi_fwft_id_to_str(__u64 reg_off)
+{
+	switch (reg_off) {
+	case 0: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags)";
+	case 1: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value)";
+	case 2: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
+	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	}
+	return strdup_printf("KVM_REG_RISCV_SBI_STA | %lld /* UNKNOWN */", reg_off);
+}
+
 static const char *sbi_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_SBI_STATE);
@@ -695,6 +708,8 @@ static const char *sbi_id_to_str(const char *prefix, __u64 id)
 	switch (reg_subtype) {
 	case KVM_REG_RISCV_SBI_STA:
 		return sbi_sta_id_to_str(reg_off);
+	case KVM_REG_RISCV_SBI_FWFT:
+		return sbi_fwft_id_to_str(reg_off);
 	}
 
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
@@ -859,6 +874,14 @@ static __u64 sbi_sta_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
 };
 
+static __u64 sbi_fwft_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -1010,6 +1033,9 @@ static __u64 vector_regs[] = {
 #define SUBLIST_SBI_STA \
 	{"sbi-sta", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_STA, \
 	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
+#define SUBLIST_SBI_FWFT \
+	{"sbi-fwft", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_FWFT, \
+	 .regs = sbi_fwft_regs, .regs_n = ARRAY_SIZE(sbi_fwft_regs),}
 #define SUBLIST_ZICBOM \
 	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
 #define SUBLIST_ZICBOZ \
@@ -1092,6 +1118,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
+KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
@@ -1167,6 +1194,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
 	&config_sbi_susp,
+	&config_sbi_fwft,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
