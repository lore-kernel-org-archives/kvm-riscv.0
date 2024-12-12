Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CDDE7717F
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 20:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsgJ3MfpcsDu+wXtOGTvHVLJ2/Pa5S/I87FuHTaBo/Q=; b=4yXPo66AEmDbxp
	YZaKJn3EL2WzT69BSWTp1y3ssAluQh0/DEuy5vCIPyJDrl1uDM0+hc1S5jepjZ3/r/D0mcRJTIXxv
	LqgG7eR9fLr90sy9RpA8mDFUp8UojO4AyuicelVymbgBf8kuLtAt5I7C4mOPzLYLXebDHJK4qHPNi
	mGCSquFsLJhjXXvrHEg17jnIsynrHahlQcHinQxnadYVnQMztNdtwGJ7H3fkB85V2c/ADgCz73Wak
	ektRyBoAJZYli8/Upuh5UjuKpuwuSLjCMrrnQ1GVmzDX4WYaeQnn6UUpBSTwAHvy1eaoZvdxgT5+X
	e72mjcvwHOmhz6QZriiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF8-00000001rxs-1VWn;
	Thu, 12 Dec 2024 20:57:06 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLqF3-00000001ruG-2E7a
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 20:57:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2162c0f6a39so21158685ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Dec 2024 12:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734037021; x=1734641821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avDzzP0/VkNzm+n9LZOGcxgwhkTK2s0/hK10f7P3aeQ=;
        b=JIGt1Azs7bkA/oAbMRDMcQZfGAhpTXuNSsFuFIG/LeBRmxWA0K3JwAySdh6flySoDH
         vB+OhCpQbt9ylX6fx9W7ceITnhsgUp8hWLxV0S+LZ0dqfl8la3/KGKheRIs0HYpCFw1A
         97jcLT70N2csJs1EY77/Uy1KgzZ/l7fXBwwsmfu/FxSrCMaIhlJVZQJMPK9oeObtZeSN
         F5mxasO53RmCMieKc5q71kJOjMInwUJkqSgEjre+BGFJHqWXkHT8XomQrsBYOSFQ0eYi
         B2crLgklJha+CwggvCtH78r02RyaOUx9p3TdKb6fgotIUjZQnjwTx14smkSlX1T9sanu
         +dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734037021; x=1734641821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avDzzP0/VkNzm+n9LZOGcxgwhkTK2s0/hK10f7P3aeQ=;
        b=YvTXMhTTcvO5XmJGBU1BbX3R88R4pf0GX5b6hbPcsBOJTuTqf+skw8smAdbzFyZ8SN
         Xa+QMjHLqsstBGi9ubcaKZZwqtVjHpkDXAWqljohzSiG/DH1okyDKaLlvPMKmWsOvbEZ
         PpmXUJgqISAbXX/GdgFNVvGiOfbWdmb7KdykQ1KvhC6e+QGz4w41LBhwN2Dqd8k8US5n
         4TrhPm3+se6trqsVKxXPq8DopjEZpRmXKchAT3XYXckIwqZheF1CwNdv1wKwmJNc1/p6
         vdZjiXhApSQdUW5b3rMRM286m9byUDyfG4OYLwb/1z8M5qitHEYPw4VM8/yPX+ajBFOC
         ruyA==
X-Forwarded-Encrypted: i=1; AJvYcCXIrHxNK+HPbO531CtUy7G8LWQ8TOpXLvCk94YLktKOpz2dNYQB0+6fz2+1SEhuvm6KfyoJb9sm3Nw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQpZwRiXamtAPhpUbw2LBDfVpnuNrUkuP4V+/GxdnMUjo4zEb0
	D7Lry9hzUPnYDHbs4ENxSFUaOobpzyVh0EqOvvwT44NX7pTLg6RnW9d63ueElOg=
X-Gm-Gg: ASbGncv+YSZvAL2dxm0LFTY0cp7P7s0RGsovFMTYdC4rTcTRtiUzRrcV7qZ+jy9S5Gd
	tC3Ud3JE4E9nH13hAkadHvywMstvhOThbGaNPm6tLCsUGha5UcDcZo9BuvGdSkgXxHarKRizKRr
	v69BqZs7cx9XGRqz8IMBaFoLs87hULZQ/DyqlEdffQNt+s5aVaIGLa3jgqB1Zhw1xCxV5ObQ6j5
	V8ga6tfMAgKHtaqF2rY1JQAaNCGhwgBnFHMYmWqfHXcb9Q+HPRdZE5+HOtUNXgUEXaMSQ==
X-Google-Smtp-Source: AGHT+IH/wT2q7FeXEvOXyiLAeM+qgkw89AmTDwfUlGcclhBbzmkDVZQZXv4TvB7hgFblbmwcDG7kHg==
X-Received: by 2002:a17:902:cf10:b0:216:5cc8:44e7 with SMTP id d9443c01a7336-2178c872406mr71955495ad.25.1734037021033;
        Thu, 12 Dec 2024 12:57:01 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162e53798asm94019785ad.60.2024.12.12.12.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 12:57:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 12 Dec 2024 12:56:56 -0800
Subject: [PATCH 3/3] RISC-V: KVM: Add new exit statstics for redirected
 traps
MIME-Version: 1.0
Message-Id: <20241212-kvm_guest_stat-v1-3-d1a6d0c862d5@rivosinc.com>
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_125701_572783_D488B525 
X-CRM114-Status: UNSURE (   9.75  )
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

Currently, kvm doesn't delegate the few traps such as misaligned
load/store, illegal instruction and load/store access faults because it
is not expected to occur in the guest very frequent. Thus, kvm gets a
chance to act upon it or collect statstics about it before redirecting
the traps to the guest.

We can collect both guest and host visible statistics during the traps.
Enable them so that both guest and host can collect the stats about
them if required.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h | 5 +++++
 arch/riscv/kvm/vcpu.c             | 7 ++++++-
 arch/riscv/kvm/vcpu_exit.c        | 5 +++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 35eab6e0f4ae..cc33e35cd628 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -87,6 +87,11 @@ struct kvm_vcpu_stat {
 	u64 csr_exit_kernel;
 	u64 signal_exits;
 	u64 exits;
+	u64 instr_illegal_exits;
+	u64 load_misaligned_exits;
+	u64 store_misaligned_exits;
+	u64 load_access_exits;
+	u64 store_access_exits;
 };
 
 struct kvm_arch_memory_slot {
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e048dcc6e65e..60d684c76c58 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -34,7 +34,12 @@ const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	STATS_DESC_COUNTER(VCPU, csr_exit_user),
 	STATS_DESC_COUNTER(VCPU, csr_exit_kernel),
 	STATS_DESC_COUNTER(VCPU, signal_exits),
-	STATS_DESC_COUNTER(VCPU, exits)
+	STATS_DESC_COUNTER(VCPU, exits),
+	STATS_DESC_COUNTER(VCPU, instr_illegal_exits),
+	STATS_DESC_COUNTER(VCPU, load_misaligned_exits),
+	STATS_DESC_COUNTER(VCPU, store_misaligned_exits),
+	STATS_DESC_COUNTER(VCPU, load_access_exits),
+	STATS_DESC_COUNTER(VCPU, store_access_exits),
 };
 
 const struct kvm_stats_header kvm_vcpu_stats_header = {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index acdcd619797e..6e0c18412795 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -195,22 +195,27 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
+		vcpu->stat.instr_illegal_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_LOAD_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
+		vcpu->stat.load_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_STORE_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_STORE);
+		vcpu->stat.store_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_LOAD_ACCESS:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
+		vcpu->stat.load_access_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_STORE_ACCESS:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
+		vcpu->stat.store_access_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
 	case EXC_INST_ACCESS:

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
