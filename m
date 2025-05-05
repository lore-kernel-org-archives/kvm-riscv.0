Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D1FC3ABC0
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03a2xElfPmcybnqAF/9IaBqjXnX0CtOvWAcJkNfWg0A=; b=hm0GwUOcsIzajB
	ts1mKjf3jSvI+EwcV0XDooyI9keQqlrXlqsipQx2jRePjKN8tgmX+46NT0rhjgn3uVs9r7W8apHtY
	pb7hUk3JxMrgzNBUoaYXQNBI8CpXaK0A+p9XJPGpvnl8Zm8gv+LNzh+0kuC0uHMdBTh50QuJBeXKe
	IFSvL0EkrFloPI0ljHmQjW402tNeN7s6LhDa/4+w9kg1dcLJ0jtlpjQv5+kNK0ZnX+aQvj9gCABSw
	PR8SJ3hR29xH5SPJpfXSCrCPDPwyTIxkUU15D2iuvwAxTUhYX7nb+jjZqfKhoYC35C4wEnJvZzcYt
	29eG4i6Pg9nJYEs1mVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yz-00000008dsM-3LAZ;
	Mon, 05 May 2025 21:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XP-00000008dN5-0NdC
	for kvm-riscv@bombadil.infradead.org;
	Mon, 05 May 2025 21:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=; b=lEStJjeRPd4AsLgS/fFoFyRvr7
	RLC7ocO1t35Ex7G2DlpdvZVHJL+yRkwS3CDbNEE/Bk1ZzJGW/2KjuAcq/fNMlkpQR9Iob4j5Y36+A
	gYMt6J/TYsyXLejHyUHTh9CV0yHQ6gK1K5lDMeyHzO0lcR7uB+HW+7nZtHmYtFDl+ZQGEjrHzVwui
	37fxfcVVjccrGCw2ltwj9NTqCMaS0n9GGZFggcQwgy9YRB5czCrUdEtpyYbMFpkMWAOWhZRALqO4e
	qVtDsG3pKHA69FCqg6C9X+fMaljwaptnSaW2zAQT+b/nGe8TOX230RlQErQs0mu741NCFVCfFmWxp
	O4VQ3+Hg==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC3XL-0000000FYCh-1hmh
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736bfa487c3so4481935b3a.1
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=GV3ztlbgIUSI3SBPZ4DUON0dZDNc3lU8iqxRc4WC+nDGxyGlkWq+OGQsk43jl2VJ02
         LeWvSvzP7NwSvKcuGOD8UyoCugjAoiSm1mlqMUnne2vLwvTRttBnzuy7unveTFZCEMJE
         W5urCw7eU7mjg9dMQYRdaY3D0x/s1+FtE4i1N9ZVLN1DG+J6OoO+qu075+RBlIX692Xr
         q2s6bn/WrVJhg6sMS6gogThdMXKAeZO3pZB+UJI8L2tNdBZvmh0fp+Qv05cDwtvQiawn
         yVjEvMHZcjgGRCY5N5zTTtRCm4IBdWcjUqnT0V4HsRleZ7h4C3GhartpPjaFHRF3EqBQ
         r5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfFMvCaGxkt3NeGE85EC76Mka/3yXyXq5JViUm/gzpM=;
        b=se6ohdfgGNOPQwzJo718UGIArD43d6WZpGk9o1x5le+6iNaUIeomDqdXL9qHi5gVRP
         RqQsC7sQhqkQgXSh+RbSgXab2ldQ73C2PRHfeRUObZYd3OFJGIRm612DIIRyc9vHFhtO
         JHBUBL81Kxs6B3wrBEZe14qjmvYKIM6CQ9ayc5TXM7lPG5FUzYjPhmnc4Fc2ix0Qb7e0
         KlKMUXgcLQ6ULwncVOx4bRZTpd/ICwEhNrp1yQ4+Es47jQXYJ33vK3adAFkaBbyHQBG0
         V1vv4GaUA8Xp9MIWMQ8NsPE4CinYzXRsm2i0zU4w4/zG9o7BOme/f/caHAiY4l/f8MXa
         0MPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvIZ1phAimS3cbXHvPNBjKk0pP7JXcfJGGGa72gFfxkzyJ9YJBgzgUMHcCmasBadpyv/mdwszBP20=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZHArDEtDEfwbYmgMPTY1yiO8KOgXGN8O6wwO18BcT2B6A04J
	hxXizdnGNeejFu7D9grDbPHeglvmaEqDr6EXDu8O0gggkpxJHn4VKgUq9hgfO2Y=
X-Gm-Gg: ASbGncvyhqJQTMbBFAxcP0ngmpYu2I8qEr+WdPT5Zg07o9dbmjATcER5n6sI9aMRcO1
	iA9NPZR1Misv59V482zeO7U8d3wZXk0xKtXX+u3mtViLv7+tUN/PR+hJZBeudWz95VU0ZnGgvoG
	pThUlC+v9PBAZtDNKX26WmGFno/qalvFYnc6IVOnCbprWD1RooMsFSP7z3MLtSabV81Cpsc/u3+
	he114+/R8ZSEmOFED2bB82tyur7mRbZWORTWlquF0VI1Umjj+8nC9WmpUwC00Tfx+X1+TgoY170
	+QhChBRV5MNSX7u5Sp8m50tMpiw43B+HxJjMoaK7r7IUFelAixJSBg==
X-Google-Smtp-Source: AGHT+IHaY1/wqoejX+c2irF8o4c25FVRdJ7OcAVhO20N1cFEts/lKwVCx4wh1gNDM2vBI71ScyuV8g==
X-Received: by 2002:a05:6a00:2793:b0:73e:10ea:1196 with SMTP id d2e1a72fcca58-740919bcf33mr1106942b3a.8.1746481179845;
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:29 -0700
Subject: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250505_223943_923329_5C8BF8CB 
X-CRM114-Status: UNSURE (   8.25  )
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
index c46907bfe42f..ed6302b1992b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_vcpu *vcpu, unsigned int csr_
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
