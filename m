Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAEFC43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8hEoiERNei6gbj2/6pGXF1vCRntVS+DjVsqnqs1hU0=; b=3GM6OLXfN3/Csl
	JRElDuOGj5LrZlKSVeC9rrv2Gym8u15MRMPDzE1aARO7BeUC7+ov1JijZ5zVGS7liirhcoDSlkR8T
	pYEp1IXhg80sh9H0Yq5/yKKP+k2eyZvbj8Ol6rPG+z02knruPw5b9TIVJP41jsn02bdDpNB/E8a1J
	pDi9x6YOlX7+vKqIdPGv/sAYd9iHTr2vGjc88m1DrHEurHydp09WbijFL310yihHHcrvv6taoR3Oa
	fYIyBGfHCoAWE9D98kV+sExfVeL1H0z7v/BO79cB8GZgnX05k4Pox1vc3NDOx7JxrSdK3835SvW5D
	i5ABvCBuDSkAPf9rbheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNX-00000000V6T-1HgX;
	Wed, 01 Jul 2026 02:08:43 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNR-00000000Uy5-1OYx
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ca70925c25so1440965ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871716; x=1783476516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhdCAK8Ch1XqCGyBcma9cRiJ3Otd0/96sNi9GFez2w0=;
        b=JBXas4Cm4lsTLt7ZYsY0ouS+NLPUIxnE9Zc6LYoHL1zZaFcftdkIV1zUjBrkkJSvBk
         050rBo/mQMYjCPBKDvymvv3+Z8ZhPmBzl8H2Huhtz7NyPx/N1urcHfiKASZYchQVfgoF
         VdJv9m3oPzIPoNxMMMl+HQO6FX13W+rVDQMlaAOpVBsE0VdySascWBfB+I2S41au443P
         UsXyLAHimPEnVTUHAz+OvjYthen4MKrOpvucSrCr0NhmnjGxRyt+AwH5e7tg90AV31he
         Wvrxbs1ko7CWbXnXVly+CvIEtllUA8MKykOBoqRyC3dycFyqF2nnXdlDmeYdrr0z0kgW
         ZYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871716; x=1783476516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhdCAK8Ch1XqCGyBcma9cRiJ3Otd0/96sNi9GFez2w0=;
        b=sd9gsAk8sdGnbVNgafkFlOmnpSXxZUnwSCV6LHrUApFw/eFXRfUjnOUR6MK8IiIxLT
         b0KayiES680iT6RcdjYtbp3M4AQ3UOso3qbUat1L4VKcI9YZGnGHjTBHulNIEmPb8Xpq
         hz9fEURtJaEPL6YlH7ySFVg8FaRWFXR21n6OTsEpNCMrSNCTEuMeorXr4dNHI5uF73M2
         edg2VPiCYtCSUKyYG0NIXGZGK7ieUtZpOsR42t0Xp8asKtcmisC5kgC9qvHH6h7fLKH6
         PgNae5OplxnhcdWzj4ezYta7/JmyWyz3CbX1DbnClJlLW7Zq7MIzNS+7bGb+bnQR5d7D
         jwUg==
X-Forwarded-Encrypted: i=1; AHgh+RrZBpGegsBsGo0Q6DmQZlkyYcDg4+u1DlZuIQhRGYkOFdWTfJ0nel5BNwdbkojqRReuKVjkhXeYXj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgKvgkdSQdpmuQPUHS3BtJlk/1iZEokA7cAee2ZBFE//HOwgp
	HUBRW3X9MbwhaAstoOVrcpQaFQ458UOEd4Bi/PN5s8kkTLl0gfZbB0Q1
X-Gm-Gg: AfdE7cmRaF8Sh9W4J210519fFSKg4HfvUxGOtumkJJBonBLlSaA0QzXUm4F8Eh8T1Y+
	BMV89t+JyF9Wak4yVQ+TIe4VSR2PNy/gNnzbyfAw5DNb6oeUbCdi7AdJuHw//8ziwPiXz/wU3UX
	ooaOfsy7/eV2LMmvuWx9iOXC7m4EDuXGmFg+eMpKgNGIAlbaUpdylSV1t/WchAa4ZlESOqnaub7
	YX39i1HTjgZWTJPAUuSXdHAp/uUYSwxjSZ3kC8YaaWCXAofzJQv0Qp+/COzdEJKa5dLnHRXDuut
	Y27+oZBdNfP60gY0WzpTpURf67WTSwhxjCTQC7auF+huwqsAfOlqlXehimbldWNcF/2we8ZwzHI
	GLO0B6uZ7xIl6QuJeOmr2r/tKJSYU1zDtAMp2gpx8mGqxwp/5x1FPjou1lxtsS1gl33VMYnraTh
	2DJ3QubBKiOn0=
X-Received: by 2002:a17:902:d48f:b0:2ca:75b1:e1eb with SMTP id d9443c01a7336-2ca75b1e4f2mr4118735ad.10.1782871716385;
        Tue, 30 Jun 2026 19:08:36 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828c2e8sm22880055ad.43.2026.06.30.19.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:36 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 8/8] KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
Date: Wed,  1 Jul 2026 10:07:45 +0800
Message-ID: <20260701020746.170157-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190837_488577_3CC1B547 
X-CRM114-Status: GOOD (  11.94  )
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

The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
add these extensions to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 94e33b2ee796..5963f62ce730 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -90,6 +90,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
@@ -358,6 +360,8 @@ static const char *core_id_to_str(const char *prefix, __u64 id)
 	"KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_REG(" #csr ")"
 #define RISCV_CSR_SMSTATEEN(csr) \
 	"KVM_REG_RISCV_CSR_SMSTATEEN | KVM_REG_RISCV_CSR_REG(" #csr ")"
+#define RISCV_CSR_ZICFISS(csr) \
+	"KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_REG(" #csr ")"
 
 static const char *general_csr_id_to_str(__u64 reg_off)
 {
@@ -425,6 +429,18 @@ static const char *smstateen_csr_id_to_str(__u64 reg_off)
 	return NULL;
 }
 
+static const char *zicfiss_csr_id_to_str(__u64 reg_off)
+{
+	/* reg_off is the offset into struct kvm_riscv_cfi_csr */
+	switch (reg_off) {
+	case KVM_REG_RISCV_CSR_ZICFISS_REG(ssp):
+		return RISCV_CSR_ZICFISS(ssp);
+	}
+
+	TEST_FAIL("Unknown zicfiss csr reg: 0x%llx", reg_off);
+	return NULL;
+}
+
 static const char *csr_id_to_str(const char *prefix, __u64 id)
 {
 	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CSR);
@@ -441,6 +457,8 @@ static const char *csr_id_to_str(const char *prefix, __u64 id)
 		return aia_csr_id_to_str(reg_off);
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		return smstateen_csr_id_to_str(reg_off);
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		return zicfiss_csr_id_to_str(reg_off);
 	}
 
 	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype, reg_off);
@@ -585,6 +603,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICCRSE),
+		KVM_ISA_EXT_ARR(ZICFILP),
+		KVM_ISA_EXT_ARR(ZICFISS),
 		KVM_ISA_EXT_ARR(ZICNTR),
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
@@ -748,6 +768,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
 	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
 	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
+	case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable)";
+	case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags)";
+	case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value)";
+	case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable)";
+	case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags)";
+	case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -954,6 +980,18 @@ static __u64 sbi_fwft_pte_ad_hw_updating_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
+static __u64 sbi_fwft_landing_pad_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
+};
+
+static __u64 sbi_fwft_shadow_stack_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
+};
+
 static __u64 zicbom_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
@@ -969,6 +1007,11 @@ static __u64 zicboz_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
 };
 
+static __u64 zicfiss_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_ZICFISS | KVM_REG_RISCV_CSR_ZICFISS_REG(ssp),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS,
+};
+
 static __u64 aia_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siselect),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1),
@@ -1220,6 +1263,8 @@ KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicbop, ZICBOP);
 KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
 KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
+KVM_ISA_EXT_SIMPLE_CONFIG(zicfilp, ZICFILP);
+KVM_ISA_EXT_SUBLIST_CONFIG(zicfiss, ZICFISS);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
@@ -1279,6 +1324,24 @@ static struct vcpu_reg_list config_sbi_fwft_pte_ad_hw_updating = {
 	},
 };
 
+static struct vcpu_reg_list config_sbi_fwft_landing_pad = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfilp, ZICFILP),
+		SUBLIST_SBI(fwft_landing_pad, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_shadow_stack = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(zicfiss, ZICFISS),
+		SUBLIST_SBI(fwft_shadow_stack, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1289,6 +1352,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_fwft_misaligned_deleg,
 	&config_sbi_fwft_pointer_masking,
 	&config_sbi_fwft_pte_ad_hw_updating,
+	&config_sbi_fwft_landing_pad,
+	&config_sbi_fwft_shadow_stack,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
@@ -1332,6 +1397,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicbop,
 	&config_zicboz,
 	&config_ziccrse,
+	&config_zicfilp,
+	&config_zicfiss,
 	&config_zicntr,
 	&config_zicond,
 	&config_zicsr,
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
