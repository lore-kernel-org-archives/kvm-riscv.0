Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46BEC88E49
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DOIeNo2ERba6o0PAn4aCPWRc014yVQFowHd6NM/dJXY=; b=0xPFpiL0bDYKKy
	RmqQF0yM5aZnI3uekycJu3oi9pued9lT17JKKBYKwSVeiTP2peAukoH3jxhRoBpAZT0T4yCcTQsOJ
	c5EqBrtzatDfqU2ursd3caDQyqmUWx8emuKvmMhuiLYmIeqo5i6GGPTkv4SrUm588L4+JTluk+kqX
	K2D82eSodf+kPVj+fV62quXOxiqzfiqa9kxi/tUkZuMV54OXX35o9HFnlEZ9zV5FJa+xmVcQnLFxp
	Em3ffBVNwmmkVO7NXjfwfJb53UGA7mKDE5Q/7Kf7nbEhpHEL3COmyO4EduGMyPQZMJsk6yeqFaYNY
	lythgYcuo6y/6OE3gHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE7D-0000000Bsgd-0uWl;
	Mon, 26 Jan 2026 04:22:15 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE79-0000000Bse9-34pA
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:22:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-29f2676bb21so42114285ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 20:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769401331; x=1770006131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXMmWr4x1kiDa10LjI5HvINcv2KnVZhp4gqQTuAdZ/M=;
        b=Tc6yYugo1FPpwlnYHwHj+VS9Y3+7GFcIm5pB9wjUPsAImIheWcBpUcUSYLuwfC3ZMM
         oIUXriEqYFdeBnrhPTDFKhMfUotmUemOHUXk03mlXeoXBe2Yu6c2H0bRzVeBcm61GV8F
         O/5mlEpCWTh2LDwrdx6ga2UV2xOCm5it2eiXE0jDqnKplRVMZojtyefKNLwOfG9ZwRKB
         M1h4/k/ZMWyDuH6GU0hzVHCuI3Dvl3E39s0akekBkUzUvfnGmknyL3cDKNLh/6pzKQHi
         0xOaBpi3D44+t9ZamctXLcQ6+8r3uWx6NUYJFrxdMKtuci97DZj3MPVVFTQOxYUhL3v3
         qgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769401331; x=1770006131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXMmWr4x1kiDa10LjI5HvINcv2KnVZhp4gqQTuAdZ/M=;
        b=Wk99DyHw/iZESNmpz0+ZzPcfU9+6IK4fuCj6alw8zz2hVWoPBsRmxZtGSsd9MQWAvt
         5VkSFwLBHsxLjmLG2qCOmVOJYekIMjTZTel0ptJFEcHBLsLKHOUmo+XRTPTmXlCqJbIC
         Lgh6tC4k9eRINP8Zs/Eu+y98p1FzXVy9jQqGUE8Qyg26aipX9FHOHt3LDup0EH+VF5zm
         Y2BI6c25j4pG88kYgfEccvoF688oSc4NiuCbEezGx51Z5ocmcU5ei8Mryl8ga0dJKZgO
         5PQYf7HoROhIHFk6TGtBoCpliihaUo0xB4Lw09ach/DO7XEZyKNu8P61Z2tHiOCRIvyu
         Ldlw==
X-Forwarded-Encrypted: i=1; AJvYcCX1JmuKv+Uk8vOt7WJYIQUBzS1lg2QjMm2ACTgwEA3kWaguhXSehsTuFoUeIXu0vmd8+GtfVZb6CsA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxgFyCFzBvLKYPSERXT/IDWPO7z8K5o/HtoY0m1tLwsHSAXEXA4
	vF9mY6XyGVfhEB/i49dnBPezIVWVavmxfZq/LN7UMCcqBt7m5r0kg+sR
X-Gm-Gg: AZuq6aKCQxWdhkK2LSTYaFf3mN/N0MpEijpgSQNYg9b715b1pzMRVlctmXigkfK8+Rr
	nzEajTdbJy9bW3kt7mE/dJ9Qlt/KTzCAWFSiK+bt2SYThTcgArisdfIrXHOrj3UnAp0IjSGo1Dc
	0F4FlDN6OKUGLy7D4ipT1Yoa9t2LA22b99R3b+2K9FFtlKbXbf15edeeABk/aklwYdM5SvMgxyK
	dfMnN4nKa7N+qqhSFjzyHL7iZCRIAyLe0l7eYXVu5skzKAVT5SXjXKzXbGrWCc4I7Efynfb1nfR
	+nG3IfhX4xvined8Esk758YOVQcmB4EC294oSXarRJ90MdtoIEPG1Pn9zMpKHp3DCLpU1OUNyak
	na1BRTeMkqhQCWV72H7SnP3yWfazgBf89cnEgeZ787ipmoUmPwQL7Tq8YXjghOzFSOZkV/o760l
	iBtRZhFR7+cEAHXQ+RkLiDVsdq28bxnml6qIdjRAYb
X-Received: by 2002:a17:902:c949:b0:298:616a:ba93 with SMTP id d9443c01a7336-2a84523fa9fmr27665945ad.9.1769401330672;
        Sun, 25 Jan 2026 20:22:10 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd0c9sm78875965ad.95.2026.01.25.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 20:22:10 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
Date: Mon, 26 Jan 2026 04:22:01 +0000
Message-Id: <20260126042201.2804148-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202211_777373_CF72FFE3 
X-CRM114-Status: GOOD (  17.77  )
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

The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
memory physical address to be 64-byte aligned, and the shared memory size
to be at least 64 bytes.

KVM exposes the SBI STA shared memory configuration to userspace via
KVM_SET_ONE_REG. However, the current implementation of
kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
shared memory address. As a result, userspace can install a misaligned
shared memory address that violates the SBI specification.

Such an invalid configuration may later reach runtime code paths that
assume a valid and properly aligned shared memory region. In particular,
KVM_RUN can trigger the following WARN_ON in
kvm_riscv_vcpu_record_steal_time():

  WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
  kvm_riscv_vcpu_record_steal_time

WARN_ON paths are not expected to be reachable during normal runtime
execution, and may result in a kernel panic when panic_on_warn is enabled.

Fix this by validating the shared memory alignment at the
KVM_SET_ONE_REG boundary and rejecting misaligned configurations with
-EINVAL. The validation is performed on a temporary computed address and
only committed to vcpu->arch.sta.shmem once it is known to be valid, 
similar to the existing logic in kvm_sbi_sta_steal_time_set_shmem() and
kvm_sbi_ext_sta_handler().

With this change, invalid userspace state is rejected early and cannot
reach runtime code paths that rely on the SBI specification invariants.

A reproducer triggering the WARN_ON and the complete kernel log are
available at: https://github.com/j1akai/temp/tree/main/20260124

Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V1 -> V2: Added Fixes tag.

 arch/riscv/kvm/vcpu_sbi_sta.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index afa0545c3bcfc..7dfe671c42eaa 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -186,23 +186,25 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 		return -EINVAL;
 	value = *(const unsigned long *)reg_val;
 
+	gpa_t new_shmem = vcpu->arch.sta.shmem;
+
 	switch (reg_num) {
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = value;
-			vcpu->arch.sta.shmem |= hi << 32;
+			new_shmem = value;
+			new_shmem |= hi << 32;
 		} else {
-			vcpu->arch.sta.shmem = value;
+			new_shmem = value;
 		}
 		break;
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
-			vcpu->arch.sta.shmem |= lo;
+			new_shmem = ((gpa_t)value << 32);
+			new_shmem |= lo;
 		} else if (value != 0) {
 			return -EINVAL;
 		}
@@ -210,7 +212,10 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 	default:
 		return -ENOENT;
 	}
+	if (new_shmem && !IS_ALIGNED(new_shmem, 64))
+		return -EINVAL;
 
+	vcpu->arch.sta.shmem = new_shmem;
 	return 0;
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
