Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AEDC3ABB6
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo2A9UAEg85liKzZNo6zOEnirOK5XdQE4Nln9gsFmLk=; b=IPzBUM3ES+fixG
	OWmmBga1frX7YVkPmBcywWJoS2asyV6kn0E6KGtu3ZQV7VsNHWgHHnkJmGYZ3X+Mr5guZjR6rZh4A
	4DI3pAWps6Rp8IbOh2oha895FgrgLr1jCDkEsgORZoMqZXE7q2NPGcvh9zXRcEINA+H94W2rb9jZ2
	LJPEUaFzn8qjKC2pTRgxFzbAhVRPBo9jjin+VcnAh7qwAZW9I0eayUcWyqjS0jmWtqDebSPrMVshp
	zf/I1AEi97kuPzQGHbJibmI4pQ1pwOcusOe2bClWRxmE5RBzUo4fCrW56p69/6gTZxGnyekElKgJT
	XPABF9KoilSOkB6sngfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yy-00000008dqb-21U4;
	Mon, 05 May 2025 21:41:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XH-00000008dKn-3TO4
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2243803b776so366675ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481179; x=1747085979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBkYMTmSl4PimBL1H4hWSadeldBIQV0hA1hHqFFVE6E=;
        b=EG1Qu636WabrGkoz9mQnVDzWVwc/qkdxFu1jcIbVDdZWAzTF/zXUW0ZITe1GcHmehw
         3elARiz54X73cnHXOrz7dsVep79j9Lf2ZNVntib3xbssihNeSlY5IZKXxqnQAAwc7SkQ
         PrgVMf8nrk1os8Ahs4VdSd5W0VhEByhNw49o1G3LhAISIcZv+Q/zu9yCibullX+OnVs+
         G7UV2zS2xcRfwK4bh7ImmQibiJTE1czeR6/wXkNVDkL//j1CxnGUVxiGuk8vdIXK8SOt
         vKHCCqkpj/JYjrx9uhyoUwuArmW7XUM6M/8g6XI/rJXEVmdRUfHDvkaIcvlg3G936I0u
         Ur8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481179; x=1747085979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBkYMTmSl4PimBL1H4hWSadeldBIQV0hA1hHqFFVE6E=;
        b=aE4PVmAcF/VQXd9uyYsekB+QjbYXQIyjbDi+lxQI9yOxomTpE0XyJFfZARvkzUoLz2
         9F8tAIzweiSYMH7Bx+f1HBqI4YEJvMRQaE6OQLTldmVd95P3LSrPt9rlKT3ygyK0RKo4
         VBdFG4Ty0Qp8V0pjFN3I0937+M7ZaMSYzHuvF/YFPp7vf+Y+S9yEAdoJ3bAcMyDnumYe
         BwH9Nn51vSxqmw4KKjZrkrH2YoUqtIo2lxkfFV88kEnwWFSKXe3RR8pkLHHtHfvvYQih
         JX5rXq5gmsB/JQ4cW8DqEMTSz6nCRA/tP0B3a+6bsqWDFSA1AbtB87Wg0cLTry4daOJG
         MfIg==
X-Forwarded-Encrypted: i=1; AJvYcCXzNtAS/L2e0xX8F72LQDbetmsOqKPDCni9nVCQuZJ7Xyrzt7JAJ7GsIysL3aLlwoOZwYyxxkfE6VQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9zRByDPW+wHlceRWiGVXb1t6vwwr4ARPcFN6gU6UTwEOS7D/
	91xPSyEqY663SShwFA2ebYsLagAkPlL8qdhq57Hlqx1aDY0UvBIyA1HkazHgfwA=
X-Gm-Gg: ASbGncvLAbHBj25P+ZlipxB7DqaEgA0W67Ck/3qDicEyzKwQ7XlyV4pyMa020oaZo1h
	H0p/cx8cbEI6fsiUlYJ3jZamx8Uzf3uxNOr3URlaDD+EiEyK0a7fcFUc2dWq8Goz3bR26JXMu40
	dBUjF4gzWG3nAqjusMTSPdp6v+nvHDyVH5jMHcxmPKX1b/oNqWjZbTRaZ1hWpILhUi9gdTWeEGh
	mhY5B2EfX4Epje6f6dXFgEvp1+Wx2+e1zOdpgWTKpWul4SAkqbEaQ2S9OlipbumTz08Vt3qtlZp
	r+lpBuirlsxgt4P+eepMbdp4HmLElilpBFXXByoaNjtlUSDi7PYvvA==
X-Google-Smtp-Source: AGHT+IFSjl7ZZTm9sRdhzbga0ISTzjUyoYmypOpH2UHF3JUrUhm15fO1yXOvC7GyT9L7318UQ6VTkw==
X-Received: by 2002:a17:902:ecc1:b0:224:c76:5e57 with SMTP id d9443c01a7336-22e3637e732mr7765845ad.39.1746481178982;
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:38 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:28 -0700
Subject: [PATCH 3/5] RISC-V: KVM: Support lazy enabling of siselect and aia
 bits
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-3-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143939_858838_DC94ACE6 
X-CRM114-Status: GOOD (  11.30  )
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
index 3bc39572b79d..c46907bfe42f 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -260,6 +260,9 @@ static const struct csr_func csr_funcs[] = {
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
