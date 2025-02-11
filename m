Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A8FC0219E
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juCzfLSW3VmiR/RQOPNNweWXO3qisIq+FE7GJbzw4Dk=; b=dsY7LhbKIgV6OowcoX6ttDbbAv
	Wcqw55uIf02qZ9FweZ3kNLQlHg6R/7sTCSvJ4hi8hX58M9ukF8oikyeAFyHOSs1j9TV62+QjADNbT
	vWAuM42QyO4zquV8OWMot5ra29JUBIWf8cqAksC7qjLt7Uj6+HARBElmpne3Q60E2vrPc2rZBMY3w
	KnQu2nxGvAOa4hO/bAJcLqOZdXcWaoZtyZByAw+thmask7LWm6qr5cmZqnyk2LskUC8ZHmAFZBv1A
	LMzVa21oa429/xclKucWhM359vKOl7RjgfTl+/crT9xIKn0D3M0ERhDiGvIlTlOPgqBe/z369bN91
	UAAvNoeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjGf-00000002dbU-2ITh;
	Tue, 11 Feb 2025 05:57:09 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjGc-00000002dad-19xa
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:57:07 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2f441791e40so7098792a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739253425; x=1739858225; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HJZy2jyvTOLzFCUYeWaduV9MqEWJwar6HvmOT6bl6Aw=;
        b=Ixqvnug7KSUB93uoA000f4LDlfBu9P5U9JvlWqyozl3tJT8l23AN1J1FiJfh5+fTr0
         TtSPDGGwUP0+g5+aQ5CtChO6jWx88J5XuiZIbtCOKajAiDUS62SESdHu8Pc07IXOO6G+
         RgJ+VL8yO7iBQQ+RXXJ4TrEdRLPC7Bc+ImssOOxMEo6pPoV/mTb/Zs5aSFF1G93MUHa2
         8Tszpu/TzGEo1RfXtShXbTp7pXqA6nBx1ooR22B5O0CvUy39N2awTKy3K261n/ZsK1uW
         fRT3r/gPthKndX9L4c+e2UyBZIRE21tKeK2Od/2b0xMqjACfOi9PmT5qLljeAKOz1Eeh
         4/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739253425; x=1739858225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HJZy2jyvTOLzFCUYeWaduV9MqEWJwar6HvmOT6bl6Aw=;
        b=NhzbzS6ihKHk7kZB0X8Itfazz+OE5NB7hMTme5j+oqg6JzsgX4E/xJJJJp7RqLVnkm
         uelBpcjr/jkUvRTPkoZjEXkrpIJ2aQI5ca9M40XwL1hkD07BQY625KaJacfKbE6NnAmO
         Ya3AoiwW+7pPl0iuKdRj3wmqW0/1u0Vm+W72ZEodeYDw0WYuhuO8FwPcVg5E5Aj0n2yh
         5vUiw+ySLfxUv4Gljs/WS5i2BcTVcmBhTJD0eTDQ3tF9//nTiOaSvvZ5yu2X8P04tMkn
         hExFXVifuR/YchMI8HKMljFgQBoRxLXqNU4h0vFsEMD1n/3Myi2NKbFMfOo9IEj5D/kS
         IGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTuLLUuHVc2rwtlySvUf7HEvSfYLUshZnjKpHF3S0sTy4npqB0x99NnTcghGj9J3ryjpNskwtXywQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeUpbP7PDlOGDL8ydJrqxdk+V6LscEiLtbjyL7gpeL9POqgQJl
	YsaBZYjIFk40QR/BYsASKtZLnMY6eNezq9dewFxdodTDfs2NkD6CjbjDFoXjc1s=
X-Gm-Gg: ASbGncuF2xXQonnl7CfS8QzqdXo8R26C/B7GUblY6rXCBhy+NXOWlxHhPEyG9H1E9QN
	hPT8pTkl/OkapnXy31dtRkL3bLVq8pjx10kt76UhFZYjkhCSFTRwRAL4+bp1CmMZ2G7BQxCdZm7
	2DkHHpFr3lOBvQAdui+feGctKdQrhq7+aafnI+CMuUwksEm6Dy5M8Dy8XL9nbu7ntyMbpdwPi7m
	qpamDjDa75OW/YBE2bP1PguIBwhUVC1ACEWh5SBzrNJ+wKSeK84O4JHxqmGdqz6tjewChGZxhTn
	TddgjD07dkYMIsx1mLRBEwL2dA==
X-Google-Smtp-Source: AGHT+IGPV3VBh9FyPjCZf26VkPF75SNsz19I9tg0lKaJmNEHjjQrpfrlMc7NQxLWrWHUBES1C/WSbg==
X-Received: by 2002:a05:6a00:3492:b0:730:87b2:e839 with SMTP id d2e1a72fcca58-73087b2f0a3mr15775608b3a.21.1739253425110;
        Mon, 10 Feb 2025 21:57:05 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730840e842bsm3878466b3a.88.2025.02.10.21.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:57:04 -0800 (PST)
Date: Mon, 10 Feb 2025 21:57:02 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 14/15] RISC-V: KVM: add support for FWFT SBI extension
Message-ID: <Z6rmrqbNtHxmjI0X@debug.ba.rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
 <20250210213549.1867704-15-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210213549.1867704-15-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_215706_331000_F44C3C0F 
X-CRM114-Status: GOOD (  16.35  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 10:35:47PM +0100, Cl=E9ment L=E9ger wrote:
>Add basic infrastructure to support the FWFT extension in KVM.
>
>Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/kvm_host.h          |   4 +
> arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
> arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  37 ++++
> arch/riscv/include/uapi/asm/kvm.h          |   1 +
> arch/riscv/kvm/Makefile                    |   1 +
> arch/riscv/kvm/vcpu_sbi.c                  |   4 +
> arch/riscv/kvm/vcpu_sbi_fwft.c             | 187 +++++++++++++++++++++
> 7 files changed, 235 insertions(+)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
>
>diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kv=
m_host.h
>index bb93d2995ea2..c0db61ba691a 100644
>--- a/arch/riscv/include/asm/kvm_host.h
>+++ b/arch/riscv/include/asm/kvm_host.h
>@@ -19,6 +19,7 @@
> #include <asm/kvm_vcpu_fp.h>
> #include <asm/kvm_vcpu_insn.h>
> #include <asm/kvm_vcpu_sbi.h>
>+#include <asm/kvm_vcpu_sbi_fwft.h>
> #include <asm/kvm_vcpu_timer.h>
> #include <asm/kvm_vcpu_pmu.h>
>
>@@ -281,6 +282,9 @@ struct kvm_vcpu_arch {
> 	/* Performance monitoring context */
> 	struct kvm_pmu pmu_context;
>
>+	/* Firmware feature SBI extension context */
>+	struct kvm_sbi_fwft fwft_context;
>+
> 	/* 'static' configurations which are set only once */
> 	struct kvm_vcpu_config cfg;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/as=
m/kvm_vcpu_sbi.h
>index cb68b3a57c8f..ffd03fed0c06 100644
>--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>@@ -98,6 +98,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_=
hsm;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
>+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/inclu=
de/asm/kvm_vcpu_sbi_fwft.h
>new file mode 100644
>index 000000000000..5782517f6e08
>--- /dev/null
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>@@ -0,0 +1,37 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * Copyright (c) 2025 Rivos Inc.
>+ *
>+ * Authors:
>+ *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
>+ */
>+
>+#ifndef __KVM_VCPU_RISCV_FWFT_H
>+#define __KVM_VCPU_RISCV_FWFT_H
>+
>+#include <asm/sbi.h>
>+
>+struct kvm_sbi_fwft_config;
>+struct kvm_vcpu;
>+


Can we add some comments here for future fwft providers along below lines?

Reason being, patch defaults to `conf->supported =3D true` if `supported` fn
pointer in `kvm_sbi_fwft_feature` was NULL. Although `kvm_sbi_fwft_set/get`
does get/set fn pointers (it would happen even if `supported` fn pointer
was NULL).

>+struct kvm_sbi_fwft_feature {
>+	enum sbi_fwft_feature_t id;
	/* If function not provided, KVM will default assume to be true */
>+	bool (*supported)(struct kvm_vcpu *vcpu);
	/* Must always provide function pointers for get/set */
>+	int (*set)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsi=
gned long value);
>+	int (*get)(struct kvm_vcpu *vcpu, struct kvm_sbi_fwft_config *conf, unsi=
gned long *value);


>+};
>+
>+struct kvm_sbi_fwft_config {
>+	const struct kvm_sbi_fwft_feature *feature;
>+	bool supported;
>+	unsigned long flags;
>+};
>+
>+/* FWFT data structure per vcpu */
>+struct kvm_sbi_fwft {
>+	struct kvm_sbi_fwft_config *configs;
>+};
>+
>+#define vcpu_to_fwft(vcpu) (&(vcpu)->arch.fwft_context)
>+
>+#endif /* !__KVM_VCPU_RISCV_FWFT_H */
>diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/a=
sm/kvm.h
>index f06bc5efcd79..fa6eee1caf41 100644
>--- a/arch/riscv/include/uapi/asm/kvm.h
>+++ b/arch/riscv/include/uapi/asm/kvm.h
>@@ -202,6 +202,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> 	KVM_RISCV_SBI_EXT_DBCN,
> 	KVM_RISCV_SBI_EXT_STA,
> 	KVM_RISCV_SBI_EXT_SUSP,
>+	KVM_RISCV_SBI_EXT_FWFT,
> 	KVM_RISCV_SBI_EXT_MAX,
> };
>
>diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
>index 4e0bba91d284..06e2d52a9b88 100644
>--- a/arch/riscv/kvm/Makefile
>+++ b/arch/riscv/kvm/Makefile
>@@ -26,6 +26,7 @@ kvm-y +=3D vcpu_onereg.o
> kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_pmu.o
> kvm-y +=3D vcpu_sbi.o
> kvm-y +=3D vcpu_sbi_base.o
>+kvm-y +=3D vcpu_sbi_fwft.o
> kvm-y +=3D vcpu_sbi_hsm.o
> kvm-$(CONFIG_RISCV_PMU_SBI) +=3D vcpu_sbi_pmu.o
> kvm-y +=3D vcpu_sbi_replace.o
>diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>index f81f06f82650..3b37deaed4e7 100644
>--- a/arch/riscv/kvm/vcpu_sbi.c
>+++ b/arch/riscv/kvm/vcpu_sbi.c
>@@ -78,6 +78,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_e=
xt[] =3D {
> 		.ext_idx =3D KVM_RISCV_SBI_EXT_STA,
> 		.ext_ptr =3D &vcpu_sbi_ext_sta,
> 	},
>+	{
>+		.ext_idx =3D KVM_RISCV_SBI_EXT_FWFT,
>+		.ext_ptr =3D &vcpu_sbi_ext_fwft,
>+	},
> 	{
> 		.ext_idx =3D KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> 		.ext_ptr =3D &vcpu_sbi_ext_experimental,
>diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft=
.c
>new file mode 100644
>index 000000000000..fe608bf16558
>--- /dev/null
>+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
>@@ -0,0 +1,187 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright (c) 2025 Rivos Inc.
>+ *
>+ * Authors:
>+ *     Cl=E9ment L=E9ger <cleger@rivosinc.com>
>+ */
>+
>+#include <linux/errno.h>
>+#include <linux/err.h>
>+#include <linux/kvm_host.h>
>+#include <asm/cpufeature.h>
>+#include <asm/sbi.h>
>+#include <asm/kvm_vcpu_sbi.h>
>+#include <asm/kvm_vcpu_sbi_fwft.h>
>+
>+static const enum sbi_fwft_feature_t kvm_fwft_defined_features[] =3D {
>+	SBI_FWFT_MISALIGNED_EXC_DELEG,
>+	SBI_FWFT_LANDING_PAD,
>+	SBI_FWFT_SHADOW_STACK,
>+	SBI_FWFT_DOUBLE_TRAP,
>+	SBI_FWFT_PTE_AD_HW_UPDATING,
>+	SBI_FWFT_POINTER_MASKING_PMLEN,
>+};
>+
>+static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>+{
>+	int i;
>+
>+	for (i =3D 0; i < ARRAY_SIZE(kvm_fwft_defined_features); i++) {
>+		if (kvm_fwft_defined_features[i] =3D=3D feature)
>+			return true;
>+	}
>+
>+	return false;
>+}
>+
>+static const struct kvm_sbi_fwft_feature features[] =3D {
>+};
>+
>+static struct kvm_sbi_fwft_config *
>+kvm_sbi_fwft_get_config(struct kvm_vcpu *vcpu, enum sbi_fwft_feature_t fe=
ature)
>+{
>+	int i =3D 0;
>+	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>+
>+	for (i =3D 0; i < ARRAY_SIZE(features); i++) {
>+		if (fwft->configs[i].feature->id =3D=3D feature)
>+			return &fwft->configs[i];
>+	}
>+
>+	return NULL;
>+}
>+
>+static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, unsigned long feat=
ure,
>+				struct kvm_sbi_fwft_config **conf)
>+{
>+	struct kvm_sbi_fwft_config *tconf;
>+
>+	/* Feature are defined as 32 bits identifiers */
>+	if (feature & ~(BIT_ULL(32) - 1))
>+		return SBI_ERR_INVALID_PARAM;
>+
>+	tconf =3D kvm_sbi_fwft_get_config(vcpu, feature);
>+	if (!tconf) {
>+		if (kvm_fwft_is_defined_feature(feature))
>+			return SBI_ERR_NOT_SUPPORTED;
>+
>+		return SBI_ERR_DENIED;
>+	}
>+
>+	if (!tconf->supported)
>+		return SBI_ERR_NOT_SUPPORTED;
>+
>+	*conf =3D tconf;
>+
>+	return SBI_SUCCESS;
>+}
>+
>+static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu, unsigned long feature,
>+			    unsigned long value, unsigned long flags)
>+{
>+	int ret;
>+	struct kvm_sbi_fwft_config *conf;
>+
>+	ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
>+	if (ret)
>+		return ret;
>+
>+	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) !=3D 0)
>+		return SBI_ERR_INVALID_PARAM;
>+
>+	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>+		return SBI_ERR_DENIED_LOCKED;
>+
>+	conf->flags =3D flags;
>+
>+	return conf->feature->set(vcpu, conf, value);
>+}
>+
>+static int kvm_sbi_fwft_get(struct kvm_vcpu *vcpu, unsigned long feature,
>+			    unsigned long *value)
>+{
>+	int ret;
>+	struct kvm_sbi_fwft_config *conf;
>+
>+	ret =3D kvm_fwft_get_feature(vcpu, feature, &conf);
>+	if (ret)
>+		return ret;
>+
>+	return conf->feature->get(vcpu, conf, value);
>+}
>+
>+static int kvm_sbi_ext_fwft_handler(struct kvm_vcpu *vcpu, struct kvm_run=
 *run,
>+				    struct kvm_vcpu_sbi_return *retdata)
>+{
>+	int ret =3D 0;
>+	struct kvm_cpu_context *cp =3D &vcpu->arch.guest_context;
>+	unsigned long funcid =3D cp->a6;
>+
>+	switch (funcid) {
>+	case SBI_EXT_FWFT_SET:
>+		ret =3D kvm_sbi_fwft_set(vcpu, cp->a0, cp->a1, cp->a2);
>+		break;
>+	case SBI_EXT_FWFT_GET:
>+		ret =3D kvm_sbi_fwft_get(vcpu, cp->a0, &retdata->out_val);
>+		break;
>+	default:
>+		ret =3D SBI_ERR_NOT_SUPPORTED;
>+		break;
>+	}
>+
>+	retdata->err_val =3D ret;
>+
>+	return 0;
>+}
>+
>+static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
>+{
>+	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>+	const struct kvm_sbi_fwft_feature *feature;
>+	struct kvm_sbi_fwft_config *conf;
>+	int i;
>+
>+	fwft->configs =3D kcalloc(ARRAY_SIZE(features), sizeof(struct kvm_sbi_fw=
ft_config),
>+				GFP_KERNEL);
>+	if (!fwft->configs)
>+		return -ENOMEM;
>+
>+	for (i =3D 0; i < ARRAY_SIZE(features); i++) {
>+		feature =3D &features[i];
>+		conf =3D &fwft->configs[i];
>+		if (feature->supported)
>+			conf->supported =3D feature->supported(vcpu);
>+		else
>+			conf->supported =3D true;
>+
>+		conf->feature =3D feature;
>+	}
>+
>+	return 0;
>+}
>+
>+static void kvm_sbi_ext_fwft_deinit(struct kvm_vcpu *vcpu)
>+{
>+	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>+
>+	kfree(fwft->configs);
>+}
>+
>+static void kvm_sbi_ext_fwft_reset(struct kvm_vcpu *vcpu)
>+{
>+	int i =3D 0;
>+	struct kvm_sbi_fwft *fwft =3D vcpu_to_fwft(vcpu);
>+
>+	for (i =3D 0; i < ARRAY_SIZE(features); i++)
>+		fwft->configs[i].flags =3D 0;
>+}
>+
>+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft =3D {
>+	.extid_start =3D SBI_EXT_FWFT,
>+	.extid_end =3D SBI_EXT_FWFT,
>+	.handler =3D kvm_sbi_ext_fwft_handler,
>+	.init =3D kvm_sbi_ext_fwft_init,
>+	.deinit =3D kvm_sbi_ext_fwft_deinit,
>+	.reset =3D kvm_sbi_ext_fwft_reset,
>+};
>-- =

>2.47.2
>
>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
