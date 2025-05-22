Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88358C54F30
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/M+jb0zvDz68QQeANqXp3S/M+b2UA/h1LKUQl8rgDDE=; b=bZfCJo+QUFrU0w
	OYZc9qiPu7wC/0TGWJXaOYo7EUYU/6EHITT1cXzU8A0Pb5sDgDqvR0zo/ccHItV71IT8jYr5hLIY9
	bDqwVpg1DiQps4xFo49JocP7065284E/5Cd207VMLqBpctkaU4xezP91egBmB7xlgU9TkQyjjXrLm
	nXFgchvlcyHcBmsWI7pjEn0zSHHKMKStB0xcvF8NWxWB8Pym5KaaqKVZZbxzCv6scSTPGAzn7X8OA
	P25kX+e+PbZCfzc1YquxvxR3FByKBHtK1Ht6O/4bNl6vwAOKKeu4zkYvt0RdpEHlvVl5zU/wR3bsw
	ESpjspNjQko4QJw3GVfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdk-00000002893-1DQN;
	Thu, 22 May 2025 20:35:44 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdg-0000000285F-2iG1
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:41 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30e7bfef364so6451250a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946140; x=1748550940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlpsjtQ1jfPZ6A9TfjhS6qtbiSt0LuxjR82iYs+98kk=;
        b=0cMkRC5FObMYtkyDjM64YY/KeUCC20tURmb4JZm16YvHL5zJW3f34ylw5GBmmxKYXe
         ROkgL8G+CS0L5i5bq+njAPvhJ4bN1coAv4c/qKv9xTOizdUyg4ASvF+h1mXgf5rPpwcG
         u1bHRxWA8jpNxYL8Pv4u+VwwRuOjScLqnZwm3yUGlkWZ68ehimSTbuNhbfWsbZG3buzK
         0vVt16yTUxG9PAEjc9RgiGhDhyI/8Md39ILeeZUzer2ruLj8rDKu0b2Av1IcZIWer83j
         /xW9OgolDdNXLbHBt7AwgzcOzxgsWVhECO7i4zJDMhA/5SxfxjmKdrpcaDU+M5NvAE+8
         hGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946140; x=1748550940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlpsjtQ1jfPZ6A9TfjhS6qtbiSt0LuxjR82iYs+98kk=;
        b=GTTiukG6TzBqsdX1xfb1t3Y/OrRDI3ySZWhQn0nicNYSVDo2i7qRP/YTyxXYtyFX90
         hBTXZZl5UI72aM9/WJKGbeZAF6NV1c7naS4v3ku6LWIzxae3wcnNZwzrXpqib8a7ctfI
         hjCVa13pNjiLLiefaAnzgfZ6bxssvuexuwM7bvlsO8ajcnKB2LYeLPOA4Cqaqy3IT94f
         jep08bWxPC0jLqU1OIkQ9yqpQ7AjNQ1VzR7Irk+8k9fSQVPdYEW4fhin/aMHlWU3Nl8F
         bS2gE8k5FyOjr0pLlgZ+o+KFy7vN9s4hGbR+vddc7DwKABK6JdKgYcb0fiSxcT03l062
         WrHg==
X-Forwarded-Encrypted: i=1; AJvYcCW9tZC8YGBFjDq6LtDPJGiAGphXRe9CqJCYLQhAepVHqTZS2l7+Mcks20clg7MQ1/pm229jx8HaO48=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj+s+ckfmuwgEteBzn5t0rrebJW4IsDsiL8mACV/Zhf04wAfYR
	YlshPyNva/tvFIZe1ybk/220GjyhP91nOIy75QzhTeufGKwE2A+B6aYI+3paxrH5VjY=
X-Gm-Gg: ASbGncuoIlpLMnx71dNBoBmri1PhoGxJjgVci0YKpUPrek0jlxlFoCd9orAsh2CcmMj
	rJqvN/G3TAVCYxqEdRzdTEw98cOl0SXZ3llu9TfHztqUWJ6xrAdEmyNtn9ubLh8Mx9H9YFZzqW+
	lA12yF/zdkMIQc4T2SiczGa19KErJ5+uUNHFv1M10VZuJ71v1QmMD+ltvAeEFP7LRp+dojrMzKn
	BO1WNaIEFGnJYn6yrc7kMmc42/49FFdkDr+VIUUbZ+dkVIDq3YQylm12LUHofwL+1HnqGZEAOWy
	nRHEewkrKMfAmyTi62DwA4KkJqPszf4WpHcwNr4B3K4XrfZKXh3gYaSvr3Pp+drj
X-Google-Smtp-Source: AGHT+IGCOYKh0vp5GpK/3nS4xafj8YOx8BCMj+SatngsU14XSWFqRaCBH400PBoR5UfD0rXZqAojdA==
X-Received: by 2002:a17:90a:e706:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-30e7d5aca67mr42085164a91.24.1747946139700;
        Thu, 22 May 2025 13:35:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:27 -0700
Subject: [PATCH v2 3/5] RISC-V: KVM: Support lazy enabling of siselect and
 aia bits
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-3-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133540_693415_3AC1767E 
X-CRM114-Status: GOOD (  11.22  )
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

Smstateen extension controls the SISELECT and SIPH/SIEH register
through hstateen.AIA bit (58). Add lazy enabling support for those
bits.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h | 13 ++++++++++++-
 arch/riscv/kvm/aia.c             | 34 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_insn.c       |  3 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 760a1aef09f7..9e39b0e15169 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -142,12 +142,23 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned long *val,
 				 unsigned long new_val,
 				 unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num, unsigned long *val,
+				       unsigned long new_val, unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu, unsigned int csr_num, unsigned long *val,
+				unsigned long new_val, unsigned long wr_mask);
 int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask);
 #define KVM_RISCV_VCPU_AIA_CSR_FUNCS \
 { .base = CSR_SIREG,      .count = 1, .func = kvm_riscv_vcpu_aia_rmw_ireg }, \
-{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei },
+{ .base = CSR_SISELECT,   .count = 1, .func = kvm_riscv_vcpu_aia_rmw_isel }, \
+{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei }, \
+{ .base = CSR_STOPI,      .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+
+#define KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS \
+{ .base = CSR_SIPH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+{ .base = CSR_SIEH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 1e0d2217ade7..3dfabf51a4d2 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -235,6 +235,40 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num,
+				       unsigned long *val,
+				       unsigned long new_val,
+				       unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA);
+}
+
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu,
+				unsigned int csr_num,
+				unsigned long *val,
+				unsigned long new_val,
+				unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA_ISEL);
+}
+
 int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned int csr_num,
 				 unsigned long *val,
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 0a7e229cfd34..ef4fcb641f1c 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -269,6 +269,9 @@ static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
+#ifdef CONFIG_32BIT
+	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS
+#endif
 };
 
 /**

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
