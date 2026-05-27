Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53014CD6E44
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMHo5mlndCk2xf3WJh/5WrZY7/FXHBo6mNQqJn8z5Bw=; b=oX2ZEtPxxXwPem
	69FXDg/lFB/+dkZ83fup6woA6TI4NkTMenpsRo5u5UhwIwSKdNLROm+5pzDcOBi6ZACrXtfoHfX+R
	ZEq1Ht9x0YM1UqMVSvlGzIxzTAh2ti64Bx4x7Cw/fr84V/UOJes9ayGvahUJ1zK8ymeNMo7EMs7/q
	JpYf4jHSrpw8Dm/6l9+JIAAhGVddCU386oudyGdOuOjTX8I+rLL/iOVwLA/cWifFDtfA5VaHsvDJV
	J5PhLwyukidCWnzn23PV9IU2WjFE+89fQjanzNLZCVsXuozDN+i3fmUFUTCk/yL3KSC1RVBhLCELl
	l3to81ZivoG1A3Wd2mRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CW-00000003Mmg-3tSL;
	Wed, 27 May 2026 05:53:08 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CS-00000003Mjm-1SD9
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 05:53:05 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3025d725a05so25836752eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 26 May 2026 22:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861183; x=1780465983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXN4gEKCKsU7orTDwjAmupylz86Cq+DRK2X72vksDBs=;
        b=jFQzpOCnPKkQFv2XCvJFE2DoBr8rgbwvwaGME6WoWhS/qE9CYyEga/xWrHiqcILD6U
         sGYfATaqYKNW2pVb1W08gZjN7aF961gUve4SGVkszPMbEURt/8EQnI6yiaATHy5kBtCg
         Q34BxtIyqfDh9MFrnsfrz0ymnGgTg+hpKQpORW+G5WWB4XayuZ6OkCVFyVuVX772VX2S
         7jKziUPdh7NwbVICHlSEtVUlND8W/fKn1ETlbO6OM4UiJbxncFK9o1OnZPE/U5+oGXS1
         VvTCRWJNV7I7IaA+IG8qGvus9LvJ1kbS3TMeAD+kzM2UP4zLulohRSlHgDo+knA5g2Ew
         RE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861183; x=1780465983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xXN4gEKCKsU7orTDwjAmupylz86Cq+DRK2X72vksDBs=;
        b=QsF3hZxvqP9+ao9+tUGmwp8ubgTpbOozE5A/F5V5WAJ/AfkeXuLsYc2vO/wvj5BepF
         Cddi6HdPnY0U9SBtijha4HPjbP/9u9rqjPcAJu8vvrVsCKQy48mwGvKanbgn8ji7Npz3
         Cqu+3iPxFND7l4Db3/tEdgxpbX7TOXoHvCLIsCDsgbrfih2+q7MF6aOu6dtc+acgYOnp
         dV9q+GIDzir69y+K4ZdTBRo19pKNcgSUOMRuvGM46+1N+aIIDtcGIdZSW1QnyioEEJqF
         cFLBQ+obsESl4iAdoMeqe5usIrQOt+3jXSL0+NVZ8lLCRdLp0+wZbfqNCIB4JdVJ5CaB
         wbfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TjB2VR2I1kuqWIwkWzeRo7blK+V1f+RjFSomDM5GGcTNr1qfKHVjJwjoSbAseeabKeCVq7cMvvdw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk73lvl7g7ELK0ITcM5sa9qbxBK5cd3w4gbrftVwmmbxTtc/4l
	AKxS2MND3EdYXKvnP0FY7tGGB2dKnlADcvQoRS2KJut97xKIScVUbX/eNwIPUmApGRk=
X-Gm-Gg: Acq92OGI+Gu65GHsBoJ36bbzW2ojeJzoZpAVa2jKc8A+nbqV2cGWQ1d6laRSQil4a8O
	KBJ1CEkfbL4wO/4vPljPmmqciVl3gcvcvAsFML0fJb7slc8n7xgme4QujKLSktT74pS2nVxlfeL
	jo/IaUO1coxbdkGYvRhSS/3knW/z2bjTzYe4ahI2gXOhYYQpjoqzI1HZPbBYMNBp2SCBkxlf9jN
	UzakHBl/VvmEI1yQK0pyTGlymGIE5CMsplztKP2HrxcQIPaS70sHZuby32N/0aDb+ywIZi8GFvf
	HVFskPgpmOt73fFX3cRtcLmzhbBH3QfJeRLfp1zAhZ8drCqJJ5NDprYWg4iptWTaw7CkmQUp9tB
	PXlaoFNsT+rhs1f7bU13kEbsjfZgLyUwWm8IOhbGs9rezxplkBieLFL7HG8WDcij+E8dGQf9CM/
	dCAFPhnA//mjjya13xD3Fdu+lISBrrCSQTQ1yaLdN0q2WLScIsstG4vg==
X-Received: by 2002:a05:7300:e805:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304ba84ac6cmr546957eec.33.1779861183142;
        Tue, 26 May 2026 22:53:03 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:53:02 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 May 2026 22:52:39 -0700
Subject: [PATCH v2 2/3] KVM: riscv: selftests: Refactor ISA and SBI
 extension sublist macros
MIME-Version: 1.0
Message-Id: <20260526-kvm-get_reg_list-v2-v2-2-7940a401454a@sifive.com>
References: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
In-Reply-To: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=6156;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=4DPizMp5c9ZYd5J6eYtnzgZrFa5iDZWYGDJjDrKQguI=;
 b=S7fRaOZsRn89YBqQxmsVvW+ybsBc4X5m6GfdOSpXsQoaqsaJjtbEtjGTpoBsIwuapMZzGmgK0
 kWhQZBuxDB7CX0+PG8/0CblcxP79ieiSW4fKv7xcyp6H4A2PQSrsCTB
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225304_398781_F286C578 
X-CRM114-Status: GOOD (  10.65  )
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

Refactor the get-reg-list test to use unified sublist macros for ISA
and SBI extensions, eliminating code duplication and improving
maintainability.

Previously, each extension had its own hand-coded sublist definition
(e.g., SUBLIST_ZICBOM, SUBLIST_AIA, etc.) and the config structures
repeated the same pattern. This made the code verbose and error-prone.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 80 +++++++++---------------
 1 file changed, 29 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6fdb5d38b8..cb16c638ce1a 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -1057,37 +1057,17 @@ static __u64 vector_regs[] = {
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
-#define SUBLIST_SBI_BASE \
-	{"sbi-base", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_V01, \
-	 .regs = sbi_base_regs, .regs_n = ARRAY_SIZE(sbi_base_regs),}
-#define SUBLIST_SBI_STA \
-	{"sbi-sta", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_STA, \
-	 .regs = sbi_sta_regs, .regs_n = ARRAY_SIZE(sbi_sta_regs),}
-#define SUBLIST_SBI_FWFT \
-	{"sbi-fwft", .feature_type = VCPU_FEATURE_SBI_EXT, .feature = KVM_RISCV_SBI_EXT_FWFT, \
-	 .regs = sbi_fwft_regs, .regs_n = ARRAY_SIZE(sbi_fwft_regs),}
-#define SUBLIST_ZICBOM \
-	{"zicbom", .feature = KVM_RISCV_ISA_EXT_ZICBOM, .regs = zicbom_regs, .regs_n = ARRAY_SIZE(zicbom_regs),}
-#define SUBLIST_ZICBOP \
-	{"zicbop", .feature = KVM_RISCV_ISA_EXT_ZICBOP, .regs = zicbop_regs, .regs_n = ARRAY_SIZE(zicbop_regs),}
-#define SUBLIST_ZICBOZ \
-	{"zicboz", .feature = KVM_RISCV_ISA_EXT_ZICBOZ, .regs = zicboz_regs, .regs_n = ARRAY_SIZE(zicboz_regs),}
-#define SUBLIST_AIA \
-	{"aia", .feature = KVM_RISCV_ISA_EXT_SSAIA, .regs = aia_regs, .regs_n = ARRAY_SIZE(aia_regs),}
-#define SUBLIST_SMSTATEEN \
-	{"smstateen", .feature = KVM_RISCV_ISA_EXT_SMSTATEEN, .regs = smstateen_regs, .regs_n = ARRAY_SIZE(smstateen_regs),}
-#define SUBLIST_FP_F \
-	{"fp_f", .feature = KVM_RISCV_ISA_EXT_F, .regs = fp_f_regs, \
-		.regs_n = ARRAY_SIZE(fp_f_regs),}
-#define SUBLIST_FP_D \
-	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
-		.regs_n = ARRAY_SIZE(fp_d_regs),}
-
-#define SUBLIST_V \
-	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
+
+#define SUBLIST_ISA(ext, extu)				\
+	{						\
+		.name = #ext,				\
+		.feature = KVM_RISCV_ISA_EXT_##extu,	\
+		.regs = ext##_regs,			\
+		.regs_n = ARRAY_SIZE(ext##_regs),	\
+	}
 
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
-static __u64 regs_##ext[] = {					\
+static __u64 ext##_regs[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
 	KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |	\
 	KVM_RISCV_ISA_EXT_##extu,				\
@@ -1095,18 +1075,22 @@ static __u64 regs_##ext[] = {					\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		{						\
-			.name = #ext,				\
-			.feature = KVM_RISCV_ISA_EXT_##extu,	\
-			.regs = regs_##ext,			\
-			.regs_n = ARRAY_SIZE(regs_##ext),	\
-		},						\
+		SUBLIST_ISA(ext, extu),				\
 		{0},						\
 	},							\
 }								\
 
+#define SUBLIST_SBI(ext, extu)					\
+	{							\
+		.name = "sbi-"#ext,				\
+		.feature_type = VCPU_FEATURE_SBI_EXT,		\
+		.feature = KVM_RISCV_SBI_EXT_##extu,		\
+		.regs = sbi_##ext##_regs,			\
+		.regs_n = ARRAY_SIZE(sbi_##ext##_regs),		\
+	}
+
 #define KVM_SBI_EXT_SIMPLE_CONFIG(ext, extu)			\
-static __u64 regs_sbi_##ext[] = {				\
+static __u64 sbi_##ext##_regs[] = {				\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
 	KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE |	\
 	KVM_RISCV_SBI_EXT_##extu,				\
@@ -1114,13 +1098,7 @@ static __u64 regs_sbi_##ext[] = {				\
 static struct vcpu_reg_list config_sbi_##ext = {		\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		{						\
-			.name = "sbi-"#ext,			\
-			.feature_type = VCPU_FEATURE_SBI_EXT,	\
-			.feature = KVM_RISCV_SBI_EXT_##extu,	\
-			.regs = regs_sbi_##ext,			\
-			.regs_n = ARRAY_SIZE(regs_sbi_##ext),	\
-		},						\
+		SUBLIST_SBI(ext, extu),				\
 		{0},						\
 	},							\
 }								\
@@ -1129,7 +1107,7 @@ static struct vcpu_reg_list config_sbi_##ext = {		\
 static struct vcpu_reg_list config_##ext = {			\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		SUBLIST_##extu,					\
+		SUBLIST_ISA(ext, extu),				\
 		{0},						\
 	},							\
 }								\
@@ -1138,14 +1116,14 @@ static struct vcpu_reg_list config_##ext = {			\
 static struct vcpu_reg_list config_sbi_##ext = {		\
 	.sublists = {						\
 		SUBLIST_BASE,					\
-		SUBLIST_SBI_##extu,				\
+		SUBLIST_SBI(ext, extu),				\
 		{0},						\
 	},							\
 }								\
 
 /* Note: The below list is alphabetically sorted. */
 
-KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
+KVM_SBI_EXT_SUBLIST_CONFIG(base, V01);
 KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
@@ -1153,10 +1131,10 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
 KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
-KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
-KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
-KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
-KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
+KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
+KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, D);
+KVM_ISA_EXT_SUBLIST_CONFIG(vector, V);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
@@ -1240,7 +1218,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
-	&config_v,
+	&config_vector,
 	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
