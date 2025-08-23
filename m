Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77193CA0EED
	for <kvm-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9TR9dgi9lNqpqiUsnQiiTMy7rzIY/M1AmDKlWH2x/g=; b=l1bB8U+qVnChcq
	EdqG6PFNOtfmjYyXES4P1za/WqYvl1kMR2Oue9X1amCfrGPHps6n4L5HmhW3rbJlEW3xPSSLgESbe
	yYEzkuJVBPB/TS3h5njo/EKfsmR0hq3HifL5sWLf69LjF4+yv48wSDLgkRcejmfb8wKg5mJMGr6dR
	dVZtnZ8BAzRjYnBSwMDpNSl8Xnc6SnJvYQgtwc0Q+vG6ZjJVhcpw8NxXDjHpZTxcadIxoMA55AAR+
	rwZHfddBPowCtEcR1tC76BeTAHPdnHX6i/6RL+tYyRFo1YmvMBNwvTRA73XB2ALUPhS1zi2ht6653
	4IN9X9S2flLtS4f8XHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uprFd-000000052wm-128j;
	Sat, 23 Aug 2025 16:37:57 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upqfE-00000004xUg-2Dgw
	for kvm-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 16:00:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24626e06f04so16965555ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 23 Aug 2025 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755964820; x=1756569620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PRrbFKlAPo0iY7cqmxQ4BlWrfq3AMnKEWra5f0Zz/M=;
        b=i6p3VJSzQ6/seIsb0XLvxfqh1K2Gz2xRbo6apyEL+T7I9sVGSnn0RY2UfqaQlheq7Q
         OYCm/s2CnmdTjgkSMLyN0WuUlytiKsf2Q9jm2G3dGRbyOigFNtxS4TGpS8WDrbBR713R
         2qnYWtnxL/C4KdgkEKc3D87+P/ZeWOct2YMIG7PoQGC2r9Ff1tkH6nq5Kkc0wpkrKbbt
         iX/IRgLgp+ZrhhYJgVkfb+wfhj31KRjYMXB1bq5TJSPT3rFG1bsgu5j8+WhOeZREmlTl
         UiAN/eWlapK+Y7IHt8Qb1tZLIhtHnh5ipxzW3L6QtaFOgXuXXCn1Zc5OyLTaK/s/KWKt
         0lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755964820; x=1756569620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PRrbFKlAPo0iY7cqmxQ4BlWrfq3AMnKEWra5f0Zz/M=;
        b=RLHS3VyCl2Span370tTjSvofkA24ngQYFVkVlDd9AmH2nbVozE8GFAG3qEwP2iFN7j
         NdZLqVoXiY/Yph80hNggcA9icT8AbPr717LTG8jz5H9jZkuHv2GVdfFFp9NB+dlMtw35
         avbZ76IwaooiHjedWnu/MgbtaM6/wsASEYC6uIGvV8hmuYsAu1Dl5cLafhTEkxida3Hd
         W5dKpsWcKis9Z2vcAlIqDhSyy7phuIo63aNDZ9UvYBzF5RpTRtlUPCr9HTHCc/d+a9Mj
         FeGoRIpufWUzVUsmlRZoeQHLTWeDoRJzRUDXcyzWXym5BRt2Z+M9Q9KtIQLjwyO8ABWH
         i4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOplDLl2yeCtUstVs/voaAyEiIgfYba5P6Kxykly4xH1wyphvY8+9e1Z6SZOpdq7IZUi9oTmjEp34=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMWk2CJMwLFcj2QZZfExleZpaumvnU6kE6ZnEyjpCdg20BiaR2
	F6rLTITNxdB1WrKgN23rZ6r+xAJpOLvNnfjm/IJo+Vuk41u+lMGhEPyM/eUwNJb/C+0=
X-Gm-Gg: ASbGncuol0M+cxzbpwWldVril4cC8kpTc4/NuvT5wTyDH8ahXIkuOayIokXR+qX4gin
	yE8NiG0mQaetO3grNw1tExhRuCe6vhq1Q4ijD4YlPi5M+RxQX4CnBIQ2cmSX6kZ0GxX2ULt9D5o
	aLSvxjMV26K9cZq407iqbM3tlZN7GpK8GQtGVG9KrFybdifBBSeDp1Xj2jekMcwTPulz9H6P+tV
	N5LTPKbBuob4lV+va24FwRWthUby64pxbXIhUyJijzPnbHrIHlPJKDWwP57fFbrHk5Bs5Xay2gp
	lUil9VHvlhLYbNahRn0HYr0yH1xEYhbizhv1SQS2sPimAx0kD9yUdNDL0x5Z3jbjLZMSM+GCHPk
	XFTXYdKX72xs1H0bXONC8XjnPgtNyAD0dWe55UnAgOmq58kLxM6cE6X8QCZqlaQ==
X-Google-Smtp-Source: AGHT+IEz4ib3v6xj9/9qK/OO/ow5kk9gKoERQ302DF3ti/lE2LTdNFMCaskrQTDrkadVI8PFAruV+Q==
X-Received: by 2002:a17:903:1107:b0:242:a1ee:6c3f with SMTP id d9443c01a7336-2462ee246bfmr92516195ad.4.1755964819449;
        Sat, 23 Aug 2025 09:00:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77040214b81sm2804464b3a.93.2025.08.23.09.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:00:18 -0700 (PDT)
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
Subject: [PATCH v3 3/6] RISC-V: KVM: Introduce optional ONE_REG callbacks for SBI extensions
Date: Sat, 23 Aug 2025 21:29:44 +0530
Message-ID: <20250823155947.1354229-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_090020_585827_09FC3BE0 
X-CRM114-Status: GOOD (  18.41  )
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

SBI extensions can have per-VCPU state which needs to be saved/restored
through ONE_REG interface for Guest/VM migration. Introduce optional
ONE_REG callbacks for SBI extensions so that ONE_REG implementation
for an SBI extenion is part of the extension sources.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  20 ++--
 arch/riscv/kvm/vcpu_onereg.c          |  31 +-----
 arch/riscv/kvm/vcpu_sbi.c             | 145 ++++++++++++++++++++++----
 arch/riscv/kvm/vcpu_sbi_sta.c         |  63 +++++++----
 4 files changed, 176 insertions(+), 83 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 766031e80960..8970cc7530c4 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -59,6 +59,14 @@ struct kvm_vcpu_sbi_extension {
 	void (*deinit)(struct kvm_vcpu *vcpu);
 
 	void (*reset)(struct kvm_vcpu *vcpu);
+
+	unsigned long state_reg_subtype;
+	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
+	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
+	int (*get_state_reg)(struct kvm_vcpu *vcpu, unsigned long reg_num,
+			     unsigned long reg_size, void *reg_val);
+	int (*set_state_reg)(struct kvm_vcpu *vcpu, unsigned long reg_num,
+			     unsigned long reg_size, const void *reg_val);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
@@ -73,10 +81,9 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
 int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 				   const struct kvm_one_reg *reg);
-int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
-			       const struct kvm_one_reg *reg);
-int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
-			       const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_reg_indices_sbi(struct kvm_vcpu *vcpu, u64 __user *uindices);
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 				struct kvm_vcpu *vcpu, unsigned long extid);
 bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
@@ -85,11 +92,6 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
 
-int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
-				   unsigned long *reg_val);
-int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
-				   unsigned long reg_val);
-
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
 #endif
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 9f8b196e7697..0f4e444e5e10 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -1112,36 +1112,9 @@ static unsigned long num_sbi_ext_regs(struct kvm_vcpu *vcpu)
 	return copy_sbi_ext_reg_indices(vcpu, NULL);
 }
 
-static int copy_sbi_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
-{
-	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
-	int total = 0;
-
-	if (scontext->ext_status[KVM_RISCV_SBI_EXT_STA] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
-		u64 size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-		int n = sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
-
-		for (int i = 0; i < n; i++) {
-			u64 reg = KVM_REG_RISCV | size |
-				  KVM_REG_RISCV_SBI_STATE |
-				  KVM_REG_RISCV_SBI_STA | i;
-
-			if (uindices) {
-				if (put_user(reg, uindices))
-					return -EFAULT;
-				uindices++;
-			}
-		}
-
-		total += n;
-	}
-
-	return total;
-}
-
 static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
 {
-	return copy_sbi_reg_indices(vcpu, NULL);
+	return kvm_riscv_vcpu_reg_indices_sbi(vcpu, NULL);
 }
 
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
@@ -1269,7 +1242,7 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 		return ret;
 	uindices += ret;
 
-	ret = copy_sbi_reg_indices(vcpu, uindices);
+	ret = kvm_riscv_vcpu_reg_indices_sbi(vcpu, uindices);
 	if (ret < 0)
 		return ret;
 	uindices += ret;
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 01a93f4fdb16..04903e5012d6 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -364,64 +364,163 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
-int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
-			       const struct kvm_one_reg *reg)
+int kvm_riscv_vcpu_reg_indices_sbi(struct kvm_vcpu *vcpu, u64 __user *uindices)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	unsigned long state_reg_count;
+	int i, j, rc, count = 0;
+	u64 reg;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (!ext->get_state_reg_count ||
+		    scontext->ext_status[entry->ext_idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED)
+			continue;
+
+		state_reg_count = ext->get_state_reg_count(vcpu);
+		if (!uindices)
+			goto skip_put_user;
+
+		for (j = 0; j < state_reg_count; j++) {
+			if (ext->get_state_reg_id) {
+				rc = ext->get_state_reg_id(vcpu, j, &reg);
+				if (rc)
+					return rc;
+			} else {
+				reg = KVM_REG_RISCV |
+				      (IS_ENABLED(CONFIG_32BIT) ?
+				       KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64) |
+				      KVM_REG_RISCV_SBI_STATE |
+				      ext->state_reg_subtype | j;
+			}
+
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+
+skip_put_user:
+		count += state_reg_count;
+	}
+
+	return count;
+}
+
+static const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext_withstate(struct kvm_vcpu *vcpu,
+									    unsigned long subtype)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+
+		if (ext->get_state_reg_count &&
+		    ext->state_reg_subtype == subtype &&
+		    scontext->ext_status[entry->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED)
+			return ext;
+	}
+
+	return NULL;
+}
+
+int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_SBI_STATE);
-	unsigned long reg_subtype, reg_val;
-
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+	const struct kvm_vcpu_sbi_extension *ext;
+	unsigned long reg_subtype;
+	void *reg_val;
+	u64 data64;
+	u32 data32;
+	u16 data16;
+	u8 data8;
+
+	switch (KVM_REG_SIZE(reg->id)) {
+	case 1:
+		reg_val = &data8;
+		break;
+	case 2:
+		reg_val = &data16;
+		break;
+	case 4:
+		reg_val = &data32;
+		break;
+	case 8:
+		reg_val = &data64;
+		break;
+	default:
 		return -EINVAL;
+	}
 
-	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
 	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
-	switch (reg_subtype) {
-	case KVM_REG_RISCV_SBI_STA:
-		return kvm_riscv_vcpu_set_reg_sbi_sta(vcpu, reg_num, reg_val);
-	default:
+	ext = kvm_vcpu_sbi_find_ext_withstate(vcpu, reg_subtype);
+	if (!ext || !ext->set_state_reg)
 		return -EINVAL;
-	}
 
-	return 0;
+	return ext->set_state_reg(vcpu, reg_num, KVM_REG_SIZE(reg->id), reg_val);
 }
 
-int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
-			       const struct kvm_one_reg *reg)
+int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 {
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_SBI_STATE);
-	unsigned long reg_subtype, reg_val;
+	const struct kvm_vcpu_sbi_extension *ext;
+	unsigned long reg_subtype;
+	void *reg_val;
+	u64 data64;
+	u32 data32;
+	u16 data16;
+	u8 data8;
 	int ret;
 
-	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
+	switch (KVM_REG_SIZE(reg->id)) {
+	case 1:
+		reg_val = &data8;
+		break;
+	case 2:
+		reg_val = &data16;
+		break;
+	case 4:
+		reg_val = &data32;
+		break;
+	case 8:
+		reg_val = &data64;
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	reg_subtype = reg_num & KVM_REG_RISCV_SUBTYPE_MASK;
 	reg_num &= ~KVM_REG_RISCV_SUBTYPE_MASK;
 
-	switch (reg_subtype) {
-	case KVM_REG_RISCV_SBI_STA:
-		ret = kvm_riscv_vcpu_get_reg_sbi_sta(vcpu, reg_num, &reg_val);
-		break;
-	default:
+	ext = kvm_vcpu_sbi_find_ext_withstate(vcpu, reg_subtype);
+	if (!ext || !ext->get_state_reg)
 		return -EINVAL;
-	}
 
+	ret = ext->get_state_reg(vcpu, reg_num, KVM_REG_SIZE(reg->id), reg_val);
 	if (ret)
 		return ret;
 
-	if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
+	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
 	return 0;
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index cc6cb7c8f0e4..68486f90a61e 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -151,63 +151,82 @@ static unsigned long kvm_sbi_ext_sta_probe(struct kvm_vcpu *vcpu)
 	return !!sched_info_on();
 }
 
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
-	.extid_start = SBI_EXT_STA,
-	.extid_end = SBI_EXT_STA,
-	.handler = kvm_sbi_ext_sta_handler,
-	.probe = kvm_sbi_ext_sta_probe,
-	.reset = kvm_riscv_vcpu_sbi_sta_reset,
-};
+static unsigned long kvm_sbi_ext_sta_get_state_reg_count(struct kvm_vcpu *vcpu)
+{
+	return sizeof(struct kvm_riscv_sbi_sta) / sizeof(unsigned long);
+}
 
-int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu,
-				   unsigned long reg_num,
-				   unsigned long *reg_val)
+static int kvm_sbi_ext_sta_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_size, void *reg_val)
 {
+	unsigned long *value;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = reg_val;
+
 	switch (reg_num) {
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
-		*reg_val = (unsigned long)vcpu->arch.sta.shmem;
+		*value = (unsigned long)vcpu->arch.sta.shmem;
 		break;
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
 		if (IS_ENABLED(CONFIG_32BIT))
-			*reg_val = upper_32_bits(vcpu->arch.sta.shmem);
+			*value = upper_32_bits(vcpu->arch.sta.shmem);
 		else
-			*reg_val = 0;
+			*value = 0;
 		break;
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	return 0;
 }
 
-int kvm_riscv_vcpu_set_reg_sbi_sta(struct kvm_vcpu *vcpu,
-				   unsigned long reg_num,
-				   unsigned long reg_val)
+static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				   unsigned long reg_size, const void *reg_val)
 {
+	unsigned long value;
+
+	if (reg_size != sizeof(unsigned long))
+		return -EINVAL;
+	value = *(const unsigned long *)reg_val;
+
 	switch (reg_num) {
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem = value;
 			vcpu->arch.sta.shmem |= hi << 32;
 		} else {
-			vcpu->arch.sta.shmem = reg_val;
+			vcpu->arch.sta.shmem = value;
 		}
 		break;
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = ((gpa_t)reg_val << 32);
+			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
 			vcpu->arch.sta.shmem |= lo;
-		} else if (reg_val != 0) {
+		} else if (value != 0) {
 			return -EINVAL;
 		}
 		break;
 	default:
-		return -EINVAL;
+		return -ENOENT;
 	}
 
 	return 0;
 }
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta = {
+	.extid_start = SBI_EXT_STA,
+	.extid_end = SBI_EXT_STA,
+	.handler = kvm_sbi_ext_sta_handler,
+	.probe = kvm_sbi_ext_sta_probe,
+	.reset = kvm_riscv_vcpu_sbi_sta_reset,
+	.state_reg_subtype = KVM_REG_RISCV_SBI_STA,
+	.get_state_reg_count = kvm_sbi_ext_sta_get_state_reg_count,
+	.get_state_reg = kvm_sbi_ext_sta_get_reg,
+	.set_state_reg = kvm_sbi_ext_sta_set_reg,
+};
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
