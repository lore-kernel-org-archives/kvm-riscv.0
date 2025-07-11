Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DA9C83F1A
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2YQrM1d2gZJeGaWMMYGPAxDFI/JFpVWuISCvVwoRMNk=; b=a4a0pRpezcASCd
	ocvpPK5fJwEAzcVip7uKhwxHsXNweoW01iFgKvhh0DFhVEMu/lcFdDRWpuxkSlEHvwrlE+a4WRCWP
	yJmLAD4+4NuTodShaW/q0LPGUbWXESpJfNh8BPvBHqVW3OZtm5VBd31lqOIz1pPwnDHtYqaLSjT9N
	QXpgT4uKjIHE1/GwexZFfhLZLP6klZw4OvBmL9OkLKnMCCitKGAcNzaHLahixGyXKUQFWmnCULIf3
	Cd4+UVlEvx5Qrlyw1/yTStH4huIAWoDF5uSOOopUuQapDur1Q7Ivrq77dFqy7Cs1NF38KphG9IhUo
	iP/OJ7MEqd/Rd2rFm1xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBpY-0000000EahG-0L49;
	Fri, 11 Jul 2025 11:22:16 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAnE-0000000EShx-1OPG
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 10:15:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1257152b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 11 Jul 2025 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752228947; x=1752833747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EooS1f2JEaJ0MSXv8Pftab8ZGwzW6brdtxNMV0U2ebo=;
        b=UoJKmBFudvci2/PQJkYx1m3JLHGOoV52l+bNMoan5dIo9yQRykuH6KG+HyViJ9Bxhc
         rbTK8Xb0QfmXkE4XloMdLEdzWgEtXJflVQCnOx1LhxbvZPj/bql3HYTT1s2cb2bCf4ji
         w7inhjDAs5c6jcfV7mXLnGlli820ChMIIYRtZElVj1WiQpN5qXxILT0VYhobX3fudIHW
         uHNQHzTq/J2eeOficyKRlliQVdnuXffxUhZ/nnltKfJLaSx2KBxRz/vMnn1/1afDPH92
         pKyGEi7x2r7Yv2g3jdiwci9PoK5x5wGbLXPc6Zee4v3kuV7XKv6ksM8Q/mEfWGxYvu9G
         hSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228947; x=1752833747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EooS1f2JEaJ0MSXv8Pftab8ZGwzW6brdtxNMV0U2ebo=;
        b=eKv9CMM/exbfnUsKFYPJl7TqKHuKxyvxhJdLXagY2plfeIgoJbhQ9455gCufDDF2uX
         SfqhobQoamDdMV5M1BN0ZZerEpiPXCW/d2hKgkKrAwYMlA0lzkt/mJOQsn45tWCvTYCD
         T66e5+DwXchTS7jSyOsug/CGUHdLOzI7vab0g+tf2MP0yg/v7uV77J9W8QocX4o8IWQX
         afzo0LStW84RF8L/ICGplgY7x8bUBki0RUSzw7RNBmaaKnndU6fHBPZJqy1H3M65ClNH
         fCRBqU2GyV167h5chSeaN+6Ym4pefIrfFF1/2xrK0UL0sw5PM0dVByHCCwWtzmVdgBJC
         6qNA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+bHC3eAKRPAOuq027iGsdAAZ2iprd0hY1g2P/EY89FSSUkxCk+efEhlOEAPnE0BFEMwdVxKq6dY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc/w42N0BOC/WsXtHVUC7b6/7nBkWwc6R4jD/ZQB2WKw0MOHWv
	ZSiGAvhhb2FMqP7teaOLpjgeJXX7dVCGBr5d5IhTVtLsGPT5DJbXQ7eBgsO6Gq4kdpw=
X-Gm-Gg: ASbGncvx0LPIwGqKszNajeaBMkzl6MA0APvWDxhVmZj91CmIJvrYhWRAyrpnXPRk1fv
	GZFG/2aXsXjVcuPiJEo9hl78ydArymAGsL2iSpgJ6wYqiDVUJRNvjs1X9Wrhx+2D55w1QPc6Wzu
	FERK5U3cc2IOfFWK8nOtoKQji4gfwQ7jiDyfr9H5nL+xFapkfN8uTsatY5dXAq0N5LvzhWHFIst
	HoivDtqb25uiEIwHWIelCk4mHnd6/4/VeIGmqJ6+BuzQJWomuiSqZjWrUzRd3Qzldy0i6r94LH7
	ghfNzSsILiiPX99vLAnjrA2x0nIMiU0DkTqSJdEMJsrptt0RD9VWlN0CHhk7zCyBOLx/JSIkJDZ
	FfuR51c88eWgkP3wQFIMuzVuuFRfJ0faGupYyGQjpa53Ud1EKNSeys+lyl8+LSBDgSxwUTO5Evb
	uTNrAdZWTOFA==
X-Google-Smtp-Source: AGHT+IGpj33BleFxzAPRm55+ECQhrqvsjdgnGSCUQSi44RJyUsIBajs+sZylsyU6wVkfs3hyvw0WQw==
X-Received: by 2002:a05:6a00:2789:b0:748:ffaf:9b53 with SMTP id d2e1a72fcca58-74ee274ca0emr3090929b3a.16.1752228946640;
        Fri, 11 Jul 2025 03:15:46 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd73d1sm4974855b3a.10.2025.07.11.03.15.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Jul 2025 03:15:46 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: rkrcmar@ventanamicro.com,
	cleger@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3] RISC-V: KVM: Delegate illegal instruction fault to VS mode
Date: Fri, 11 Jul 2025 18:15:37 +0800
Message-Id: <20250711101537.16308-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_031548_678017_506F37B0 
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

Delegate illegal instruction fault to VS mode in default to avoid such
exceptions being trapped to HS and redirected back to VS.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counter remains undeleted so that guest can still query
illegal instruction events via sbi call. Guest will only see zero count
on illegal instruction faults and know 'firmware' has delegated it.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu_exit.c        | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..3f6b9270f366a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,6 +44,7 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ILLEGAL)     | \
 					 BIT(EXC_BREAKPOINT)      | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c184127956..cd8fa68f3642c 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -193,11 +193,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	ret = -EFAULT;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
-	case EXC_INST_ILLEGAL:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ILLEGAL_INSN);
-		vcpu->stat.instr_illegal_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
 	case EXC_LOAD_MISALIGNED:
 		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_MISALIGNED_LOAD);
 		vcpu->stat.load_misaligned_exits++;
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
