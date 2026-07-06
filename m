Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117A7C43458
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khuAKV2xSCklCj31I4JzDsi0kFtcpkxyqf1dTvTwLyk=; b=NrD7YhFPetwj3z
	6Rc9wEA8RpraM77kl1eSirw0M0Y3AZn6GvZXhGqOcugw9OUcH9T4XE2+cRXsBJwmwX7H14u9DOo+8
	lbB2QoM5bIIuZ/1oNTtfMfldSQn4PCFII19T9JRKRhLrof0DSYrZOS6wUOClIETYbxN3PrnwrOBVC
	+8TWW+lSCNY6CAt0zZtLk/0bvFlPsO1KeW6p0lgtbzAcAt8ALykF3MdFrJsVB0YAQgrZsZSAjaxKD
	BZBToiYUkXfGXDWL3aGwmd2u3g/vP0dWXt+ebrG6wywUy/2WSb/OdTkJM2zkMNyCgOs6AXCfYudM/
	DnVEy7+lrdjIh3jPhv1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxt-0000000BNW5-3927;
	Mon, 06 Jul 2026 02:21:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxq-0000000BNSo-3dQ3
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2428597b3a.2
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304502; x=1783909302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9y30ERfh8jZXt371ovIH8Ihu+zosp/a2nmR6ZkJ+0tQ=;
        b=eGOrFOtDal+U5ECsmnIbon82hDWeea/V2/64Wz08hF+L1SPJDLEPq75R+lq3HaxQ1X
         tmclTg1zHQEk2Wqb9gLpT8UztIEs+EoiX9oET3Ko4xGYsqKX1W642fk+k8FPCfdE0poN
         PDLDI0IIgAH2kFP5BcjhAaDM5MRDlTzP8DNvkLZF85Py6bwNl4LsLUCo9xs2egnq5kHK
         e+ObAsV+OTI00naXQYo+KN67kcLtPMRq1lNDH1A+PD5UdROwweIcUlhQR489muSK4LTH
         UtNVCjMAZE3iIIlph58NRfeDiXviV7OktvwbKdiWVyeQv70nQMeEBLpeA9maYQ9ETmyK
         yuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304502; x=1783909302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9y30ERfh8jZXt371ovIH8Ihu+zosp/a2nmR6ZkJ+0tQ=;
        b=MJwOOfAvGD5fXVkgN2L9yljkKD3TMUs+4cTpKDscPtOryxdThzj94LrRT/f7+jR9N1
         BiLPfzNORuSyyp2wf6/oooNSuIiba2ZbpzJOZCJpdCIZcLhEqyqGaSjAw8wgfqTu37xM
         g94ecycM5IBLwj7SGKtuB6qajRFF8RPwcfSxo5z1dNIo7KLUuTLQWlWvWrzGInIMADRy
         lUkk7Oi2yyL+v1YqwO3Df2GxraQ2DG1Hbw50+kxiLtmAsnAkIBi2w258F8qkRhmYG+7d
         YtDITFyvEWBH/rQBX81v4BsrF/Fi9tgzmWhP3NJQ7p0+BpnXRfZm0ggXsPt5HZHUxw1L
         s+uA==
X-Forwarded-Encrypted: i=1; AHgh+RoHjpxqihcragh3CvBYWwPOb42yJcEF8UltGPoDb2cCyL/88s6mT1v4noubLq5ekdu8B9i5zLIy9Dk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmCXAsTkqelVaKyqXwkoblxpKfPPT3phl3kyhpv+GdaB3GE6dE
	ZHqK8UfXbzcRWRu2yfHTeBzXKtqz6pSBTLkYRZNRmJjvFMUbLGBkaFpL
X-Gm-Gg: AfdE7cmO2R+PDVVyA8Tb/pQvWYEqh+f9nV7155d4uZj+5mNpYspB7PBsu0upHh/szI5
	Vl04N6SesRS8VeSi03PbZjaGP2TSkP2CyPqxuBaQDVicY2lTM5q2tC4Cd8IeO9fheQuX3zubQNE
	5asffzEsN6/6dc7d7fK8i3S9g4WpHNc9n0iyYTXXJiY+MUMSml3kQmzsVk4TbNT84LU9rnlZDT5
	cCLFkFTNjtAwH0ynAhjeAg0G+58/jd/2thz7veehgUeXAWBIeCGh7pEf85Mse7oA3oZNVwrS23N
	CO3baEbFm6EcKdwnAPxwaFmQW+X/anZBIDnzBhFXNiyt617BVTC7fnOnHqSot9hromZIY2uzU4B
	prJiOTLo1dopX4IXeR9+z6EnE2MX/5XcWMb8uvzrej8YbYilrBg3yQuusoGwyKmL2dObKdZPE9R
	g=
X-Received: by 2002:a05:6a00:218b:b0:842:6004:3fcf with SMTP id d2e1a72fcca58-847f6efef03mr7388312b3a.29.1783304501843;
        Sun, 05 Jul 2026 19:21:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db0eaasm2851550b3a.52.2026.07.05.19.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 4/8] RISC-V: KVM: Add ssp context save/restore
Date: Mon,  6 Jul 2026 10:20:40 +0800
Message-ID: <20260706022046.214956-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192142_914136_9AC09B21 
X-CRM114-Status: GOOD (  19.15  )
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

Add ssp context save/restore for guest VCPUs and also add it to the
ONE_REG interface to allow its access from user space.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 ++++
 arch/riscv/include/uapi/asm/kvm.h |  8 ++++
 arch/riscv/kvm/vcpu.c             |  7 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 68 ++++++++++++++++++++++++++++++-
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 60017ceec9d2..e5ed3b0e5a55 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -163,6 +163,10 @@ struct kvm_vcpu_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+struct kvm_vcpu_zicfiss_csr {
+	unsigned long ssp;
+};
+
 struct kvm_vcpu_reset_state {
 	spinlock_t lock;
 	unsigned long pc;
@@ -203,6 +207,9 @@ struct kvm_vcpu_arch {
 	/* CPU Smstateen CSR context of Guest VCPU */
 	struct kvm_vcpu_smstateen_csr smstateen_csr;
 
+	/* CPU Zicfiss CSR context of Guest VCPU */
+	struct kvm_vcpu_zicfiss_csr zicfiss_csr;
+
 	/* CPU reset state of Guest VCPU */
 	struct kvm_vcpu_reset_state reset_state;
 
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index a27de850fa4c..fd4c81697617 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -102,6 +102,11 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* Zicfiss CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_zicfiss_csr {
+	unsigned long ssp;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -266,12 +271,15 @@ struct kvm_riscv_sbi_fwft {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_ZICFISS	(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_ZICFISS_REG(name)  \
+	(offsetof(struct kvm_riscv_zicfiss_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..acdb12fcdb69 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -63,6 +63,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu,
 	memset(cntx, 0, sizeof(*cntx));
 	memset(csr, 0, sizeof(*csr));
 	memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
+	memset(&vcpu->arch.zicfiss_csr, 0, sizeof(vcpu->arch.zicfiss_csr));
 
 	/* Restore datap as it's not a part of the guest context. */
 	cntx->vector.datap = vector_datap;
@@ -720,6 +721,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 
 static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -727,10 +729,13 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		csr_write(CSR_SSP, zicficsr->ssp);
 }
 
 static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_zicfiss_csr *zicficsr = &vcpu->arch.zicfiss_csr;
 	struct kvm_vcpu_smstateen_csr *smcsr = &vcpu->arch.smstateen_csr;
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
@@ -738,6 +743,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
+		zicficsr->ssp = csr_swap(CSR_SSP, 0);
 }
 
 /*
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c9..dd9519438546 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -355,6 +355,44 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static inline int kvm_riscv_vcpu_zicfiss_set_csr(struct kvm_vcpu *vcpu,
+						 unsigned long reg_num,
+						 unsigned long reg_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	((unsigned long *)csr)[reg_num] = reg_val;
+	return 0;
+}
+
+static int kvm_riscv_vcpu_zicfiss_get_csr(struct kvm_vcpu *vcpu,
+					  unsigned long reg_num,
+					  unsigned long *out_val)
+{
+	struct kvm_vcpu_zicfiss_csr *csr = &vcpu->arch.zicfiss_csr;
+	unsigned long regs_max = sizeof(struct kvm_vcpu_zicfiss_csr) /
+		sizeof(unsigned long);
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		return -ENOENT;
+	if (reg_num >= regs_max)
+		return -ENOENT;
+
+	reg_num = array_index_nospec(reg_num, regs_max);
+
+	*out_val = ((unsigned long *)csr)[reg_num];
+	return 0;
+}
+
 static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 				      const struct kvm_one_reg *reg)
 {
@@ -381,6 +419,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -423,6 +464,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_ZICFISS:
+		rc = kvm_riscv_vcpu_zicfiss_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -680,6 +724,8 @@ static inline unsigned long num_csr_regs(const struct kvm_vcpu *vcpu)
 		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 	if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
 		n += sizeof(struct kvm_riscv_smstateen_csr) / sizeof(unsigned long);
+	if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS))
+		n += sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsigned long);
 
 	return n;
 }
@@ -688,7 +734,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -740,7 +786,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy Zicfiss csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, ZICFISS)) {
+		n4 = sizeof(struct kvm_riscv_zicfiss_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_ZICFISS | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
