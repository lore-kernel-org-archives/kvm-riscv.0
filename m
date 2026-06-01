Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D7CD6E60
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 10:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLN1LDlT2G/QQU4exI/+7sjYpjeUAaDbgLqPfd7Mpd4=; b=b7BSmhDkF8Vgvd
	5DOOXgUg2E1it9ofMsF3pk5E6Fp+7Mq7/2pqc9SkERcY2Egn7m1hwroyKZEUPbQMEFEOxVrgdt30e
	0B8iX0IPVO9s79+RQbw8PTyh4fE+YsP7j+x+bKwqlx5OJh0Xf2HZOndfpZXi6obnePVU7t3ypQSrC
	kL+vWp7kReh+Fm93DCqLXOciMnQpsC36BqHTzQpChNSoJNs7qiZzTEs9m/wbJlQ4BVEevux1OsiGT
	8G7bv4dTOepEE0kxIjBpGtvOp8+gqKPc5IBF8XslfLeqTaO9AX4pNttpVp63oDyndjVV3pgtKXgRJ
	WvskDbPg6TesBMggeewA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzr6-0000000AcBJ-0aPB;
	Mon, 01 Jun 2026 10:26:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzr2-0000000Ac7V-3uPK
	for kvm-riscv@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZpUjEIn4ZuMPGVsNdGCP5Htku1Dpr8xmIsStUVmQFFI=; b=aSpZM4eDVCUZsUiFElXTkfMNGy
	hSNVGtJM4SUK14rMuIeOszGHshzdE6BtcXdMfr09BLkyS2tREdXgAXcU0McXdWxVWWU2Eb475Ntqk
	9O5RSEoAPlYuauKHPJyR0Rn23xNl/Me28laSGFELxafjMNZX5gBa90JpyWVaOtE4ATzgouTidTir1
	IHri1ZeRjfQUsSvv4J4RbctA+FuXy1tmK+6Re6xCKe2Rsmy+M5UJShRwNTEQO3FMnUbQCPlcxEGze
	Y/senqcjIljViaB7nCOw5XFPR4CAp/m/JnPt5e5liLfxa1jEk3JjFCYiexER+VLoF0aOL2fl9EdEO
	I2PfL0yQ==;
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzqz-00000006Nog-3Yes
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 10:26:43 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-307263ad0cbso464190eec.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780309600; x=1780914400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpUjEIn4ZuMPGVsNdGCP5Htku1Dpr8xmIsStUVmQFFI=;
        b=Z3sqlaa9K23ydv0GDxW9zpxWJJqJ/SNlqypOTY+mHiChiaxP4Fz5ADPtDt1a9pFRW3
         J1LkcOrGfmAdamj29yj7ZFiqciIbneAknxUbzmvgaDGJUQzf4awIyK7MUnKMlGIS0yz2
         VH8AWG8Up4HJlP+uzGHufHOw4xy5xv0temx8nvvG2+1PvN3Il+0TfYJAFb3UjOtIkplm
         nbDZS1jBoP+gJ4I3e3UQamuquS6VOMQn5teY/MWmT2paD9H1Oe6TIRw9NaM5afLInWK3
         dck5Ew8AKLqSNfNB2H1JHpYzCiFivBtWugBOmDmo2wGySR2lLfywg7KHqmLtktqaKlls
         A6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780309600; x=1780914400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZpUjEIn4ZuMPGVsNdGCP5Htku1Dpr8xmIsStUVmQFFI=;
        b=kfhgJdpu4kDxopSFKq1T2RvI/0Eh3D+K0xxOB3CFJmvDD7PAH6sIUztmvSIdKk+TUk
         6cVVILTIrUzyXnzLO7mxyKZ78696M6J9loSTzRwQPzSv9dSvjz+X01KiIIfqKsrxaGRa
         GH1OyxFqefi2w5dCm4LjUkEobCM2XXVqn84B+qEWX27hEz2gNx1XFFRBGjCeYX3lzFrL
         AJ6Ejr4VTID68P+xpY9SEbpRUoqPAezjUTB5NrF1q2VfMklz0upkfQs71Ss7+Mjlg2Q2
         0B74y2kN7DZQ/dH/ZZ4qDHbGKDoGItZzcaun8XSmVopNn5UGhH9jlLUCZ69mnGwXtE89
         Pp5w==
X-Forwarded-Encrypted: i=1; AFNElJ+0IPQhmRpGEfy5Sqz2EfCRv/3QwA1VVAYxs3RbvQlBgWkRjFsr4PJXuNj2FOeJuIAoZ3DLX18QQU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuGr1wYfVzrAOPgvC/MOd0IWNUaWH8SAK3SR1q6KDRSqv5nPW
	plJbZpmVfxfe/fQchozffDj3qy2PjhH0MYz1fJrslAvhqN+eqYxYBSHtHi17+srFYcg=
X-Gm-Gg: Acq92OEKHO52J21blKHgk0+VuH3yHrzmWVZE1PzSVUZvKFWHYvatmb26Ums7uy1AQja
	SuYI/jxv99haR5Qiaj8E6+59LsE0aE/WDKluUqnEzOzhq0kXvnJ6k0S8SkbRW8nMxg4h1m063er
	E2scstanvip75thk/IX/kyRLzgV870If4KQQ+MuT++cu5pavrBh/R3VPzkrUOuUn/DTzMqNxtdr
	lqytGeXpHHBgYQ4HOEVgz9Yg208Nq3MRimjmIBjzbTC5eQocnfEOdicMDLQdUgWNcj727LjlY7r
	IqxTNEHgFVopxFwG1w1F2sUQs1O3NCFoKhEWmu4HONNBUq0wREKBEOcEoSAQRdZVvKE7MYiFb1C
	BpyzO/cqXgdbfm18D2j11gq9FaVU7QEAYMCzjOYBUWAiILzS2SawdErT/ZkDLiLGvF+69erKqAg
	tCXU/lRRHzsb7wc8FmLTju4kf1Vv9YzMoHoxfNzfkW4uZXwLAaFW6sBg==
X-Received: by 2002:a05:7300:a44c:b0:2da:2ec2:64e5 with SMTP id 5a478bee46e88-304fa5e320cmr3916930eec.18.1780309600522;
        Mon, 01 Jun 2026 03:26:40 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8176001eec.27.2026.06.01.03.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 03:26:39 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 03:26:26 -0700
Subject: [PATCH v5 5/5] KVM: riscv: selftests: Split SBI FWFT into separate
 feature-specific sublists
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v5-5-415d08a2813b@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, inochiama@gmail.com, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780309592; l=6157;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=dvopGRgDaRky18g/xnQDE1UFxOqmLWbk1vHTjPzPMBI=;
 b=Olw29Tmd5roLVBLWWP49d+h5thdSBlPI0OZxQt2vjWmCkx7EuWs1TdMjVMOQKpouSKkjMyimr
 wTecLpqPhRoCpumKzUBuxJhFUA60FQQDmUile8JquKjB1uNad5HoPnR
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_112642_260799_E5EE2BC9 
X-CRM114-Status: GOOD (  16.15  )
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

Divide the monolithic SBI FWFT (Firmware Features) register list into
separate sublists, each testing a specific FWFT feature independently
with proper dependency checking.

Previously, all FWFT features were tested together in a single sublist.
This caused issues because:
1. Not all FWFT features are available on all platforms
2. Some features depend on specific ISA extensions (e.g., pointer_masking
requires Smnpm)
3. Tests would fail if any single feature was unavailable

Add the feature-specific SBI FWFT sublists with the following
improvements:
- Add check_fwft_feature() helper to verify FWFT feature availability
  at runtime
- Update filter_reg() to handle per-feature FWFT register filtering

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 60 ++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 5033c09201ef..cb86cb6b3635 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -27,6 +27,7 @@ enum {
 };
 
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
+static bool sbi_ext_enabled[KVM_RISCV_SBI_EXT_MAX];
 
 bool filter_reg(__u64 reg)
 {
@@ -149,6 +150,14 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h):
 	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h):
 		return isa_ext_cant_disable[KVM_RISCV_ISA_EXT_SSAIA];
+	/*
+	 * FWFT misaligned delegation registers are always visible when the SBI FWFT
+	 * extension is enable and the host supports the misaligned delegation.
+	 */
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags):
+	case KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value):
+		return sbi_ext_enabled[KVM_RISCV_SBI_EXT_FWFT];
 	default:
 		break;
 	}
@@ -193,6 +202,27 @@ static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_subli
 	return 0;
 }
 
+void check_fwft_feature(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s, u64 feature)
+{
+	unsigned long value;
+	int rc;
+
+	/* Enable SBI FWFT extension so that we can check the supported register */
+	rc = __vcpu_set_reg(vcpu, feature, 1);
+	if (rc)
+		return;
+
+	for (int i = 0; i < s->regs_n; i++) {
+		if ((s->regs[i] & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_SBI_STATE) {
+			rc = __vcpu_get_reg(vcpu, s->regs[i], &value);
+			__TEST_REQUIRE(!rc, "%s not available, skipping tests", s->name);
+		}
+	}
+
+	/* We should assert if disabling failed here while enabling succeeded before */
+	vcpu_set_reg(vcpu, feature, 0);
+}
+
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
@@ -235,6 +265,9 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 			break;
 		case VCPU_FEATURE_SBI_EXT:
 			feature = RISCV_SBI_EXT_REG(s->feature);
+			if (s->feature == KVM_RISCV_SBI_EXT_FWFT)
+				check_fwft_feature(vcpu, s, feature);
+			sbi_ext_enabled[s->feature] = true;
 			break;
 		default:
 			TEST_FAIL("Unknown feature type");
@@ -897,11 +930,15 @@ static __u64 sbi_sta_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_STA | KVM_REG_RISCV_SBI_STA_REG(shmem_hi),
 };
 
-static __u64 sbi_fwft_regs[] = {
+static __u64 sbi_fwft_misaligned_deleg_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(misaligned_deleg.value),
+};
+
+static __u64 sbi_fwft_pointer_masking_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
@@ -1129,7 +1166,6 @@ KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
-KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, SSAIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, F);
@@ -1206,6 +1242,23 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zvksed, ZVKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvksh, ZVKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvkt, ZVKT);
 
+static struct vcpu_reg_list config_sbi_fwft_misaligned_deleg = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_SBI(fwft_misaligned_deleg, FWFT),
+		{0},
+	},
+};
+
+static struct vcpu_reg_list config_sbi_fwft_pointer_masking = {
+	.sublists = {
+		SUBLIST_BASE,
+		SUBLIST_ISA(smnpm, SMNPM),
+		SUBLIST_SBI(fwft_pointer_masking, FWFT),
+		{0},
+	},
+};
+
 struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_base,
 	&config_sbi_sta,
@@ -1213,7 +1266,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_dbcn,
 	&config_sbi_susp,
 	&config_sbi_mpxy,
-	&config_sbi_fwft,
+	&config_sbi_fwft_misaligned_deleg,
+	&config_sbi_fwft_pointer_masking,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
