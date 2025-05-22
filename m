Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8132AC54E65
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8Ss4gnIg8jzx9zaRsB8Roiujtl/NLsNkOFVzCiCNEE=; b=YbfWxfPKc94vLR
	cLvP6pTQhhywMgArH3iTbvrkY5mSNk7N2c/a7CcH/O2xp0OddMaJMokdEMweooyhrrD5cFcZRbjqq
	P1Cmco/jm5l5JuimWf3eX2N3PQaV+qUlY47suJSD+x7B7sn+Ny1BVxmdPHtD9qe5GP8Fy2zaEcz33
	wNDUOIcGT0Ybtw542vQ1LEqtDLdnUqpUcrVRNkLxYNtWCzhQbpaKdEwNPVEszB16KPYtJRMlg5S2k
	WdjBgzp6lgCdl4YeQ5SVgp1rXRvhfctnqNmmdwycP9x0fcXRbUFOrCPYI96qQOCo3CgChmoPSX24h
	TD9puV9MNpUyy9vMqW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdl-000000028A1-170X;
	Thu, 22 May 2025 20:35:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdh-0000000285w-0oYy
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so6324812a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946140; x=1748550940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6M4N3dwNsXzDfzq+X21m8iWPwOjiKI12kvM05IYIXOY=;
        b=LWj+W/PHdfClwPk/na5f02JA6Z9zpRrLhGLdWag//UWMsS3qRf77DjctQ+RmYfbkbB
         TzjB+E0/KKiFRoZs//qDGtZwvN51EaUFSBWC+uZjMnIq3IRf0B1jNQ6eSiWZtHexrBzM
         nITRB9Be3+jp/9qrl6Nup4OFhcqL7l+Lad8r6TW0P8hDQhaXOCPaa+h9+dddKQgO5O66
         KpY78SM/H++pA8VuQnjQTA1+Zhl6DW7/RiqQCri0A+tqB95ZsaELa8vb7fGIMGp1owJ5
         Pzqh8FztZafxvHjySmrJJSq5Uwu7KJIlY+VexT7OYku7jlXaPjywmMI6udl0w50iltMN
         t90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946140; x=1748550940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6M4N3dwNsXzDfzq+X21m8iWPwOjiKI12kvM05IYIXOY=;
        b=tLPztJMgsoAcbwTeC1Ds3xlYX43eaFJW0q0f0SNkYzmWvbkp8+T1ZrZkAgwQ9c11gZ
         9sP8CGjrXIJFdmWPnWa1dR7n/oJFoT3056PNuumXTkXzHDl5//kIXwuhbeySZ/VCMocQ
         9b9bgFO1N4kFKiWlCqVT2asLWp7/wOba+3SJ4nkuZP2Ym5J330ndhrEkw+QJ1ZUZnz34
         KCOpJ9/ENhT1vwq3xeG/rhoxon5zokcvyFQzwEcXwOecnXLho1rdjUKnLUO3XqWAW6gq
         ouBuBjKxg89WJa0OFcFX3dFtq74LoWIAnajw8Dtm3zqPa8uPiqflR06NSOANZr/NtWUj
         TGcg==
X-Forwarded-Encrypted: i=1; AJvYcCXsBVJrhx+/M9BF9yKDSgReTHqZv6PWuliIxG+95uCIde7A4kqgizwlHPby26NZu8UjW25HhQjsDrU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXutsmg7P+sz1PtaAWoNatCckU5prOXaxIY8UVolzv4VagNUZS
	TrWR+rfyrYO+uQSFqcI/WKsKAIvTWGuKLzvqbBz3BRk3gaq3b1s5l+qVNz+6K+USiQ0=
X-Gm-Gg: ASbGncsBmOMcDsXscF+M0mhzMfnNnKXjabCl7QNziozbjYgnUCpRszhi6nWMR2I6/uM
	dsuhuuQymJ0tXtNwgEG/OSR3N20B9+q5MdYIZtA91Ev2dfi+vT/+Pu0cgfTxKyWZ8lOtN/Mbbgc
	MbzaPZsFJiOZg9W0fBLWfhUL3213yueIwhf7h0t51Qmf1fh1DMHY3/ltRGBJ00ivmNCtmFvgSgr
	UYnYUPGRAglbSrAYrO95oEGc2xvIlpDDELXaMz2VkpcSOTRfGmP9hvI5eddi6WpkS90BoQer7xe
	mgftHCuxdUNsMM+zUTq7nvLyXaiAHC8U3nAlutc+kaw3o7UcidDUSvnzcyMrsmr/
X-Google-Smtp-Source: AGHT+IEPv0Jsk9/CNfphfSQDZY9W54shdTdCOSDBaPAfZ6W//0FD3oLt9iY0h2MagdZeDpunR5yq+Q==
X-Received: by 2002:a17:902:e54e:b0:22e:4b74:5f67 with SMTP id d9443c01a7336-231de376f05mr364633155ad.31.1747946140619;
        Thu, 22 May 2025 13:35:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:28 -0700
Subject: [PATCH v2 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-4-b7a84991f1c4@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_133541_248892_67C701AE 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
instead of bootime.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index ef4fcb641f1c..6f2bba7533cf 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -265,9 +265,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
 	return KVM_INSN_CONTINUE_SAME_SEPC;
 }
 
+static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HSENVCFG);
+}
+
+static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
+						  unsigned int csr_num,
+						  unsigned long *val,
+						  unsigned long new_val,
+						  unsigned long wr_mask)
+{
+	const unsigned long *isa = vcpu->arch.isa;
+
+	if (riscv_isa_extension_available(isa, SMSTATEEN))
+		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_SSTATEEN0);
+	else
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+}
+
+#define KVM_RISCV_VCPU_STATEEN_CSR_FUNCS \
+{ .base = CSR_SENVCFG,    .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_senvcfg }, \
+{ .base = CSR_SSTATEEN0,  .count = 1, .func = kvm_riscv_vcpu_hstateen_enable_stateen },\
+
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+	KVM_RISCV_VCPU_STATEEN_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 #ifdef CONFIG_32BIT
 	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
