Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CC0C3ABAC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 05:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGqpq53JvXsuSfSVlh+gSIA4gOvc4OrYMwKMdEKyzOI=; b=odm+uNI8DLuux+
	BBAxgrV8SSEcmPIQJ+4LowIkPDBXGpc4E6O2l6mbK/DMNWxtUuwA8KVcgndpEVtgkr96cZNkV3Yr1
	h1RFUfwFa6hTYr6dJuoChZU1H1nyPuRYG6PR0vuso2LomklyedOgs5vlBls0YqiK4eMVNcXLeVVMP
	qcyYayT5lNPPglyk5ia0jhuiMB1C1P+mreOaWuIPU+rVG8BImxKlVyR2uLIUO7wxO15HKGz+9gJjC
	tgagPSTm8b/bWeTLaiA3u2ktbM3D8I9UBk7nVzsRdlrPWst6//bQ5NP00qJLalmuXnCgsg4Gicpby
	Fvv7LZIzckJpToO2QFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zo0-0000000Bj5y-17WU;
	Wed, 30 Apr 2025 05:16:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vAL-0000000BHz9-0ah7
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=a8YO5iKhPcWfVDqBOx8UCOEpbW1W4oCDkW5wQpoY+ec=; b=N1q9aeDifb6ZsKLORrwFzX7IZx
	HnmpwxbRvcio72Z6psX3UmlRb87xQ3mlnRX1hNTCnkZIRL/KSaGUbI/dcdltVPD0svM28bbLw2/TJ
	3ZpxE23Yk49FeOc53whSaMl7RkbwmmdgRww6PJjlV5iIoo580yD+CORD9fT+nTmkNV4SGY/qfkutH
	kzcS7yGbqqth4qmOkvPLPzYkNjuLWcrp15N5FNWfUYTmmohOEKZxQE5ZZWIlfFiSIFE6sFYEHCsvQ
	5qfZ8s+TzI2qbu1YSMbpVfbg06G6KD0SR9S3Nvy95m0wsbnKXt3psDe7QvsKYlblY/q88d86jeoWx
	UJg9O3fw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vAA-0000000DYLH-30FR
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:19:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736e52948ebso7201567b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972336; x=1746577136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8YO5iKhPcWfVDqBOx8UCOEpbW1W4oCDkW5wQpoY+ec=;
        b=XkkWSzigjXETBiopf1VwAaVS2dYPH3AiN9/XSrB0xlZvZl9972nDbVPJNetC3iwWhU
         9eMtwil1JccDV/gVIzFCIIO7rcEd4kccJMm53vz54LrNw2ODSOyRHmyr/9BHuEBL/dwm
         jZDw4UdIPbGKRZXd4lS64Yyr0vKg8SzhA9Fb4/gAHNvxUWezgee5V66Akbug/kHgxpjQ
         ZC+HCQhqfnuV6R98xH6lstasHqJe6uYhkBE4JbIkxclNrWzEgA+GWWzUa+oiBSRsgFnq
         mSXOnydYxdBBWy6S9L9Y5ojrX0y9zsE0GD/jNHBS9GQc4HtB+lZ5R5CrQmC1ysvGu7gi
         Ar6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972336; x=1746577136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8YO5iKhPcWfVDqBOx8UCOEpbW1W4oCDkW5wQpoY+ec=;
        b=IOGRxBJBrPqlW9kaJr9cokG3c0dtQijUlQjJWCYgT9Ky5EcMSfjP60HcJhHfORevKH
         mrMFe4VZQJK+Ed3CUD5LOx0b0uDs0hYNpn7K7ghMTJg9OIoJ0ba5b10Qrk7MdPCBbTNq
         Xp4jz/zreZWSwbe6S0VBjjvBYmPFziHa4CjwqSRRZ/jlHtp5KS3If8rVsB0Mg3yjn1EK
         8qWa3YZfKlGeI3hkPYPrH0kQmNWh6vOjCF5HDIbzVLWyXGJqtat0IiAxmTS1CmIxHaxq
         +e0qrw5UpD66yrmpSiWEHcfmx1Z7KXEOZyGrwpIPFUhbZ/GtKhqPntXE9o5w1huB49xJ
         Jp1g==
X-Forwarded-Encrypted: i=1; AJvYcCVUBK5q6tsPkbWvIhpnOtK9UNjLcV/XDmqWQ+FayuIt/Pom2Ea888LOPUn40vyhA/xMmzXX6WQlSVI=@lists.infradead.org
X-Gm-Message-State: AOJu0YypzjlGRoeLjaaUrAoln16jKqsm2Bg/hu+hYcScrQkNSUsxgEua
	ZyfNpBgEK1Rk2uScYYXuZJQtdzsXtOWs3ULqixYbtkob3hCPoOyrsrbCO4z0iKo=
X-Gm-Gg: ASbGncu5BviAUx72gXvuDpN3yoW/F3msbl2UXBLG0a3yW/UP+/Ym9gxpv0vvElnKmwj
	Orcja22j5wFkLMjT3t/Tc/3kRAbk+v5j2yz+Q4eWid65COvjQZ3YE2Iw9rYKq0VsSWzt8oq7EtQ
	zzfuOOrq1ncmE2mhQNyEwzB42Ci1JUX17GvP223cZZIAqPwrktdP+MfMpLqsDYz8I9uEPVVrztK
	/Ov2LnkEjPv7UpcRw6s81xU9EVG+D8HuxEaFqXcZeW9en7kfGpMzAajE9BoTnfe1DFfPwbjDuSx
	b0soKVoiJXIT8oDQWtwNVjF/RvPBABCjwp+CzrnBGVGnPiaXbt/EIat9PudZJfg4
X-Google-Smtp-Source: AGHT+IFUQqkif7tyNajsLjY+g5KMuuCrLYrLd3gjDVZ022YnGAyiTdCKbHlRtIL/fogtzKbEqXLS2Q==
X-Received: by 2002:a05:6a21:9104:b0:1f5:7d57:830f with SMTP id adf61e73a8af0-20a8931b12dmr1346023637.33.1745972335680;
        Tue, 29 Apr 2025 17:18:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f68988ca4sm1907790a12.74.2025.04.29.17.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:18:55 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 29 Apr 2025 17:18:47 -0700
Subject: [PATCH v2 3/3] KVM: riscv: selftests: Add vector extension tests
MIME-Version: 1.0
Message-Id: <20250429-kvm_selftest_improve-v2-3-51713f91e04a@rivosinc.com>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
In-Reply-To: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011858_965052_EA50C44A 
X-CRM114-Status: GOOD (  17.19  )
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

Add vector related tests with the ISA extension standard template.
However, the vector registers are bit tricky as the register length is
variable based on vlenb value of the system. That's why the macros are
defined with a default and overidden with actual value at runtime.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 133 +++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 569f2d67c9b8..814dd981ce0b 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -17,6 +17,15 @@ enum {
 	VCPU_FEATURE_SBI_EXT,
 };
 
+enum {
+	KVM_RISC_V_REG_OFFSET_VSTART = 0,
+	KVM_RISC_V_REG_OFFSET_VL,
+	KVM_RISC_V_REG_OFFSET_VTYPE,
+	KVM_RISC_V_REG_OFFSET_VCSR,
+	KVM_RISC_V_REG_OFFSET_VLENB,
+	KVM_RISC_V_REG_OFFSET_MAX,
+};
+
 static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
 
 bool filter_reg(__u64 reg)
@@ -143,6 +152,39 @@ bool check_reject_set(int err)
 	return err == EINVAL;
 }
 
+static int override_vector_reg_size(struct kvm_vcpu *vcpu, struct vcpu_reg_sublist *s,
+				    uint64_t feature)
+{
+	unsigned long vlenb_reg = 0;
+	int rc;
+	u64 reg, size;
+
+	/* Enable V extension so that we can get the vlenb register */
+	rc = __vcpu_set_reg(vcpu, feature, 1);
+	if (rc)
+		return rc;
+
+	__vcpu_get_reg(vcpu, s->regs[KVM_RISC_V_REG_OFFSET_VLENB], &vlenb_reg);
+
+	if (!vlenb_reg) {
+		TEST_FAIL("Can't compute vector register size from zero vlenb\n");
+		return -EPERM;
+	}
+
+	size = __builtin_ctzl(vlenb_reg);
+	size <<= KVM_REG_SIZE_SHIFT;
+
+	for (int i = 0; i < 32; i++) {
+		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size | KVM_REG_RISCV_VECTOR_REG(i);
+		s->regs[KVM_RISC_V_REG_OFFSET_MAX + i] = reg;
+	}
+
+	/* We should assert if disabling failed here while enabling succeeded before */
+	vcpu_set_reg(vcpu, feature, 0);
+
+	return 0;
+}
+
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 {
 	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
@@ -172,6 +214,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		if (!s->feature)
 			continue;
 
+		if (s->feature == KVM_RISCV_ISA_EXT_V) {
+			feature = RISCV_ISA_EXT_REG(s->feature);
+			rc = override_vector_reg_size(vcpu, s, feature);
+			if (rc)
+				goto skip;
+		}
+
 		switch (s->feature_type) {
 		case VCPU_FEATURE_ISA_EXT:
 			feature = RISCV_ISA_EXT_REG(s->feature);
@@ -186,6 +235,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		/* Try to enable the desired extension */
 		__vcpu_set_reg(vcpu, feature, 1);
 
+skip:
 		/* Double check whether the desired extension was enabled */
 		__TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
 			       "%s not available, skipping tests", s->name);
@@ -410,6 +460,35 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
 	return strdup_printf("%lld /* UNKNOWN */", reg_off);
 }
 
+static const char *vector_id_to_str(const char *prefix, __u64 id)
+{
+	/* reg_off is the offset into struct __riscv_v_ext_state */
+	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_VECTOR);
+	int reg_index = 0;
+
+	assert((id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR);
+
+	if (reg_off >= KVM_REG_RISCV_VECTOR_REG(0))
+		reg_index = reg_off -  KVM_REG_RISCV_VECTOR_REG(0);
+	switch (reg_off) {
+	case KVM_REG_RISCV_VECTOR_REG(0) ...
+	     KVM_REG_RISCV_VECTOR_REG(31):
+		return strdup_printf("KVM_REG_RISCV_VECTOR_REG(%d)", reg_index);
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vstart)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vl)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vtype)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vcsr)";
+	case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
+		return "KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)";
+	}
+
+	return strdup_printf("%lld /* UNKNOWN */", reg_off);
+}
+
 #define KVM_ISA_EXT_ARR(ext)		\
 [KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_" #ext
 
@@ -639,6 +718,9 @@ void print_reg(const char *prefix, __u64 id)
 	case KVM_REG_SIZE_U128:
 		reg_size = "KVM_REG_SIZE_U128";
 		break;
+	case KVM_REG_SIZE_U256:
+		reg_size = "KVM_REG_SIZE_U256";
+		break;
 	default:
 		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
 		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
@@ -670,6 +752,10 @@ void print_reg(const char *prefix, __u64 id)
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_FP_D | %s,\n",
 				reg_size, fp_d_id_to_str(prefix, id));
 		break;
+	case KVM_REG_RISCV_VECTOR:
+		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_VECTOR | %s,\n",
+		       reg_size, vector_id_to_str(prefix, id));
+		break;
 	case KVM_REG_RISCV_ISA_EXT:
 		printf("\tKVM_REG_RISCV | %s | KVM_REG_RISCV_ISA_EXT | %s,\n",
 				reg_size, isa_ext_id_to_str(prefix, id));
@@ -874,6 +960,48 @@ static __u64 fp_d_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
 };
 
+/* Define a default vector registers with length. This will be overwritten at runtime */
+static __u64 vector_regs[] = {
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vstart),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vl),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vtype),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vcsr),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_CSR_REG(vlenb),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(0),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(1),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(2),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(3),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(4),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(5),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(6),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(7),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(8),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(9),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(10),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(11),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(12),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(13),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(14),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(15),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(16),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(17),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(18),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(19),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(20),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(21),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(22),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(23),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(24),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(25),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(26),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(27),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(28),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(29),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(30),
+	KVM_REG_RISCV | KVM_REG_SIZE_U128 | KVM_REG_RISCV_VECTOR | KVM_REG_RISCV_VECTOR_REG(31),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V,
+};
+
 #define SUBLIST_BASE \
 	{"base", .regs = base_regs, .regs_n = ARRAY_SIZE(base_regs), \
 	 .skips_set = base_skips_set, .skips_set_n = ARRAY_SIZE(base_skips_set),}
@@ -898,6 +1026,9 @@ static __u64 fp_d_regs[] = {
 	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
 		.regs_n = ARRAY_SIZE(fp_d_regs),}
 
+#define SUBLIST_V \
+	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
+
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
 static __u64 regs_##ext[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
@@ -966,6 +1097,7 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
+KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
@@ -1040,6 +1172,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
+	&config_v,
 	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
