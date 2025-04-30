Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C0DC3ABAD
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gwlzm0AMitY7bNobILG5bvKDZFTdXP0acN5YEK3RVU=; b=xap9zx0137ZfXX
	EuZ8ev8x1Jc4mE8egrP1pseux0Xf8Nf2YuOKwxmHipOgQewBffh0qIOXkLt6CXkCXcLVy5k+6D1n9
	Qs/pg29YXGmQmRayjAgiaywJlWP3aDh4DWOV0WyOhNexQDeRxbojVgDge2sDnL8xTd2uEfjUv+ohj
	Gv+u7ilIxM6bwOT2R+EUYmzTcBbNPAwZlz+cmX7HPQFK3++r0cmZVSnzl7vfNSllOCqfvRwF8hJxy
	L/mnLRFUCC+9tXIK0q7vn8GM0fgHg5CU822m1LAmFWVZHOiNqVNP88LhT3s3Pk9D9K5T+V3L2TsVW
	3G6WMpblncl1BlRltZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2oq-0000000C9U8-28pK;
	Wed, 30 Apr 2025 08:29:28 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2cQ-0000000C7Kn-0I5u
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 08:16:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7399838db7fso784278b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746000997; x=1746605797; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lDEdTGA2Q78UeMoqaqSTZbOw+0Pt/xUh3MJ2TLU8dM=;
        b=xBRxFVlEMhXP5W/QKmhfyiUZhHd9UA1PfvNgpfCLCPFyyFdiXZCTre4czrAEKcV4Hh
         KlsX19oYzLZZ098If1nQe4gxg4kbVrp9YxtraVr6orp/yhueN3yULZ/fgN2cgZWrR0Sg
         pFHu2sA4bls/5Rw6b3XaIM6j38FhRG8UKMoc4gvt+7MLGER5ROrQMfRsKlq0wCFZ996w
         oFWF/TcRy4khtjLA7PLTPZrsLhnjKemUKSRHVyq6DdcsS+3XoaHOl6UU1HHjEaoJu6NO
         ucPWIZ5E1eXPdhpgD41Qo+Vr9ZfxLsFMrf2M6WEOX1qnhDkAJgttnYygQsocVNqZ53/y
         x7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000997; x=1746605797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lDEdTGA2Q78UeMoqaqSTZbOw+0Pt/xUh3MJ2TLU8dM=;
        b=KBWsj8K1Tmq5/OeQIXIXkLB4CKNf4P9IWh+3SUdhKTs8qOjguz7NWomgExxVh3zaJR
         7W9XC8zdi1Bgcv33hZplIxfTISIomSAzST5VTd3zc30o+P0UbMvwgS+jVlPTf0V6SedV
         +vVHpG5nqpDson9rrwsx/fU6FT9YQqCJdDR6AZJ//oae9YqzAGEZKINjZXLcAbTkkqkd
         iewLfWso1Cttt8eZCOodySoTCCSt2S2a8IQubfjNk8a76fyZuCGDBDU/fAE2omwMalAC
         VFKPln+SK/Bt6MWmvLn06USs3R1xNAoghNIYoXvOFCvK1LeNNNXbCOS7MGZuFS9oCtSt
         e7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXy5VoRGBXdA8KKyiibzHMGmt7RLMGP4uma7uRGdjyhgO2vspgwdUhtb7LxVZUszrmB4LL0HP4cXE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzgXADRDPgpuBAuwHhQYrwG8wJji+yzT8DARahzV6grKUTrGJff
	jfyC1meL0EuGXcP2VA/cXBfwRJ1n3WE2Cq5bVPcwnAiJ+39y9EIvIvrdAOWMz3E=
X-Gm-Gg: ASbGncteXvoLlGxKJzCopq5mRBVH+tzGK9d1xNGj4z/dSxabpgHpDZYrplr76rB57B/
	YySotk8FFusQ5AJ5S4YOIds+xCsVTwdcOLmAkeV0md8896ji97Uaj1rDuPtzDVB59HNsGLRrzvA
	BnMC/aTFeBRyLOuA47tPSRBFpmXzoIxNJw8FOdNl24q8pVSBHzsUVnUT72A9kI68xN1LsOyp8NQ
	DRWXZnyPiZ4SFq+9K1pwku5MYSgs9aO+2KICXiN/7y4VeUJJUc++0RXdT+T2Pu2AAYBeCzLou68
	1GWpKQQarSkbWGQzHtZQEuSlG984/dNcvk8r2IaA8aqOKU2yZoxusQ==
X-Google-Smtp-Source: AGHT+IEkdjlV5neYVI9bDJYCdGVzb/65Kw95vZlp55rVec7TfydZ/oH6ud1+HkgcavU0L1iHFVRsZg==
X-Received: by 2002:a05:6a00:641a:b0:736:b923:5323 with SMTP id d2e1a72fcca58-74039bc39bcmr2341553b3a.10.1746000997307;
        Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a309edsm1073084b3a.91.2025.04.30.01.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 30 Apr 2025 01:16:30 -0700
Subject: [PATCH v3 3/3] KVM: riscv: selftests: Add vector extension tests
MIME-Version: 1.0
Message-Id: <20250430-kvm_selftest_improve-v3-3-eea270ff080b@rivosinc.com>
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250430_011638_125294_764734CE 
X-CRM114-Status: GOOD (  16.84  )
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
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 132 +++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 569f2d67c9b8..a0b7dabb5040 100644
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
@@ -143,6 +152,38 @@ bool check_reject_set(int err)
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
+	vlenb_reg = vcpu_get_reg(vcpu, s->regs[KVM_RISC_V_REG_OFFSET_VLENB]);
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
@@ -172,6 +213,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
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
@@ -186,6 +234,7 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
 		/* Try to enable the desired extension */
 		__vcpu_set_reg(vcpu, feature, 1);
 
+skip:
 		/* Double check whether the desired extension was enabled */
 		__TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
 			       "%s not available, skipping tests", s->name);
@@ -410,6 +459,35 @@ static const char *fp_d_id_to_str(const char *prefix, __u64 id)
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
 
@@ -639,6 +717,9 @@ void print_reg(const char *prefix, __u64 id)
 	case KVM_REG_SIZE_U128:
 		reg_size = "KVM_REG_SIZE_U128";
 		break;
+	case KVM_REG_SIZE_U256:
+		reg_size = "KVM_REG_SIZE_U256";
+		break;
 	default:
 		printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
 		       (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
@@ -670,6 +751,10 @@ void print_reg(const char *prefix, __u64 id)
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
@@ -874,6 +959,48 @@ static __u64 fp_d_regs[] = {
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
@@ -898,6 +1025,9 @@ static __u64 fp_d_regs[] = {
 	{"fp_d", .feature = KVM_RISCV_ISA_EXT_D, .regs = fp_d_regs, \
 		.regs_n = ARRAY_SIZE(fp_d_regs),}
 
+#define SUBLIST_V \
+	{"v", .feature = KVM_RISCV_ISA_EXT_V, .regs = vector_regs, .regs_n = ARRAY_SIZE(vector_regs),}
+
 #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
 static __u64 regs_##ext[] = {					\
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
@@ -966,6 +1096,7 @@ KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
+KVM_ISA_EXT_SUBLIST_CONFIG(v, V);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
@@ -1040,6 +1171,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
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
