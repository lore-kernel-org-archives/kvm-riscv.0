Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74415C83F1D
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V07hHGGd3ab8w3DHWhQOMl5/xGAwymUcM+Bv9DMbGbY=; b=PRZUVPWqkUkrw0
	wohyeETO8rX2xIVO1ozkuZnshERkfjmUfAKV+LKjaLF/3CpuANMmTODr+RA//sCfYrc8hZJ9ltKdL
	LtuwbsXgfxWp3YOOo0rCoGb1denjaZkL3toVTrgntpEh4rNCnkRJH0LbJ3oMohz/nMU/1vQLN/H9E
	iDk80o9BGbGbVmj8AsIxl42JcDcSyCbyvAysbwY3+m4UmpoWZHGOjz8sVDEeb+Z/syut4MoygH06+
	jJzoc5J8YAtSY87tnkXdxi8IhmRFeIIKwF6O3R4goaUvoTcIeDLJQrn+eBpDn6xhEnKO3SkWNXK7y
	QSIfKcSgzXhdhKw6gmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZscD-0000000CB18-09FJ;
	Thu, 10 Jul 2025 14:51:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrMM-0000000Bw4K-1veN
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 13:30:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74b54cead6cso706978b3a.1
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Jul 2025 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752154242; x=1752759042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSBRru92EdCdQV6HwNa+ZCQ/jNa0Vw05HCx0FcTUBpY=;
        b=YGmMEp219KpAPPCxr3ZpeeBSjuZqkG3LggovSQx9jVvP/ZAJg7Hqy68kp841NGvVKU
         OCsu8NUEzKnXCNY1pvEWuIBYVpKEu4/zSw9bk1/FwgfGUOjfSH3JYFy7l1GvbOrfveaC
         zljx1RVhMzpvI9EDc2YmkYtd6DKvZC2rjb3crfl23S3rKACSbDXIzKmDIGBEkYZlEeGI
         H+AJ3xtB8dsj7fvXHPSi8tz3NgB4LCyb19zTZ1Hmb9yg1fvFzBKZlUAyTm8ZhWkOYLlU
         maPtopFKav60M9NY8PFfmIYmFIuo1r7qoXy14hq9AH+J75yhkDozp4oAGutbYaQnNztJ
         InNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154242; x=1752759042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSBRru92EdCdQV6HwNa+ZCQ/jNa0Vw05HCx0FcTUBpY=;
        b=WE1+8Snyne9WA/2feA3qEkr1D7alFg2LwfgXWvWITya524d8NlxjWvUzvAHJabp3E+
         MzBbUj1YHUGVt0Nz4RAZ8mBEnh7iPJgMkZqJuihGTVziWTaizplg1tJk34JSKK5MFCF6
         kCNe/qq4abU1XzvQcKf5nA1VqW8cR0mqGPP5fF41/NaS3B3BZHi54CeFECYvSVPv4lUj
         wFyKYsNR7Rrgl0Ak/S2jmQvtOYttGWHnf1mcaVthbuhzQzgmavHmmQaSudyxDdaVUd2V
         cC2B3BZ4zu3jbpze+piFv/8kNMBVmE/aJvIqp51yes6KGOTV5N0ctSokCTQJNtDCcHyd
         RpXA==
X-Forwarded-Encrypted: i=1; AJvYcCXQzdGIJFYSQRJ/WanndSC3M36ss+9DBUoFQIJXpVp7XCT2RbikYDcSsH7pWQ0SRQLFgHvB0bQGdis=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDA5FugwVPIfmtXm1m0Ybbfx+xkkSfGT7dXgDEhCmDLL15YWcz
	K66VjYV/X8Y+nIz28f6W87jGLGexOclTJsTZIaBSXnXl0iEQ8vejtBrVzDEbpUFXL80=
X-Gm-Gg: ASbGncvwj1ErkBn88n7x5PkMxc6voNuuYPOI8dGkVvzeiNQxvEG3d+tp4Sfzv5+0TBS
	IyGVnLbi8egd5EbtaDeEiIncNV2KEiqmBmD1Le+ShmZq2AWGiXlbar279+KUIHv79MKtka82x6A
	pIo+gfybPDeDVej6lKAxOOHOFaIxnxwB3v8ADxV/YWyU+JRB8RIRfhFO0zTTgRF7KCFFVOntUMd
	4RZH6X9n2j58ANXBIqDZJvhik3yWkZGD1RSycEo6beczvR5XDe7hkesa2ZmV5DfqvNxG7BMFctP
	fSTWpna4MBY7kHopPEMKW/FD+1wVsgGFolJTY9Hz8Nmsvp5+sAfTKUTDBHiqiKgXuSl0pFvJYPE
	Ge7nly+06RJzbR2E25M/1UxwNTvEcuUuWg4lvh1iVzgxif/Bqmg==
X-Google-Smtp-Source: AGHT+IHzdljx762BgYLfxVy1uhiO6LuhOaahxzDQYVaWG7z0trKJ290Cb4AzI3z+szgHVgerISzuBA==
X-Received: by 2002:a05:6a00:4f8e:b0:749:b9c:1ea7 with SMTP id d2e1a72fcca58-74eb55f4f43mr4292361b3a.17.1752154242363;
        Thu, 10 Jul 2025 06:30:42 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4c9c4sm2334373b3a.126.2025.07.10.06.30.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Jul 2025 06:30:41 -0700 (PDT)
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
Subject: [PATCH v2] RISC-V: KVM: Delegate kvm unhandled faults to VS mode
Date: Thu, 10 Jul 2025 21:30:30 +0800
Message-Id: <20250710133030.88940-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_063046_640411_812B4347 
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

Delegate faults which are not handled by kvm to VS mode to avoid
unnecessary traps to HS mode. These faults include illegal instruction
fault, instruction access fault, load access fault and store access
fault.

The delegation of illegal instruction fault is particularly important
to guest applications that use vector instructions frequently. In such
cases, an illegal instruction fault will be raised when guest user thread
uses vector instruction the first time and then guest kernel will enable
user thread to execute following vector instructions.

The fw pmu event counters remain undeleted so that guest can still get
these events via sbi call. Guest will only see zero count on these
events and know 'firmware' has delegated these faults.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h |  4 ++++
 arch/riscv/kvm/vcpu_exit.c        | 18 ------------------
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..e04851cf0115c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -44,7 +44,11 @@
 #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
+					 BIT(EXC_INST_ACCESS)     | \
+					 BIT(EXC_INST_ILLEGAL)    | \
 					 BIT(EXC_BREAKPOINT)      | \
+					 BIT(EXC_LOAD_ACCESS)     | \
+					 BIT(EXC_STORE_ACCESS)    | \
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
 					 BIT(EXC_LOAD_PAGE_FAULT) | \
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c184127956..6e2302c65e193 100644
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
@@ -208,19 +203,6 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		vcpu->stat.store_misaligned_exits++;
 		ret = vcpu_redirect(vcpu, trap);
 		break;
-	case EXC_LOAD_ACCESS:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_LOAD);
-		vcpu->stat.load_access_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
-	case EXC_STORE_ACCESS:
-		kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_ACCESS_STORE);
-		vcpu->stat.store_access_exits++;
-		ret = vcpu_redirect(vcpu, trap);
-		break;
-	case EXC_INST_ACCESS:
-		ret = vcpu_redirect(vcpu, trap);
-		break;
 	case EXC_VIRTUAL_INST_FAULT:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
