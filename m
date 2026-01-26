Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF69C88E47
	for <kvm-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lDxtuNM63uZhKg9uKvoHLwGVn+Ubc/lS14jwl4/5T2o=; b=t4ArL71LJkbJpP
	kX5bol/ZcQPISfhedGu9hg0VS+uwsO2+5RQEvM688W9Hllk5vjViyiSaE7+4k6bUdiS4lD1VB0f4A
	5T0CPdChFN5gzO3UTTEoq15ikts0yrlcAOgFoviKDdO1rEK4jBc1NAqi1LYcu+a3waXAbFVyzpZvN
	G3tj3oJvhr4Wnob8VJICXwaJh1QL1/hbNuSox48YUtRhGa59hfwCeFnTf9+kRUtQfjYHhTnTZpLHt
	UysnoZMEndyKeu8WlBsy0TNWBsUF81X24KfxU91O0hORGxTJcaLhGdW98oyAnl8TvPj7cqtLBdalk
	PdoYlKFyevyZPEcZD0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkEDQ-0000000BtZZ-0PdX;
	Mon, 26 Jan 2026 04:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkEDO-0000000BtZN-3eo0
	for kvm-riscv@bombadil.infradead.org;
	Mon, 26 Jan 2026 04:28:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qg7RETk35e6sk9JFD6Qoe6w7+6Mkk77ZA6XdJje9Z98=; b=GNvwTHQrU14yb3fOSVCYt/JqEb
	M8MJH7Dko8uTzaP3NzOrzfgVxPYSbzLEb1YOtWGBPNe3sf/lNrad9XLU16GfAoEX2deoaW6vPexXZ
	pXbdFqZULoO+TtAQst4qLx9qxpEw+DZ1m7GCCkA3Sq8hIm3uzEHrD5IzagkvXPx1MI2o+8s0EYjkK
	2VVq8c6txl91gsEV9oaEtNAegXptys3fy5cfvh7ulC2oobV4+FishfIbtFR9xAh3NCBLGYIlwQ4s+
	VBFkGY2vz8L8UEDgpqOaXZblF5DAsMcSVkHB0QuIjp2b7IqCr/4UU193KQaUmfeCJUn8xnEmH0aQN
	0hGBgvEg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkEDL-00000004cJu-2wqh
	for kvm-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:28:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-352e2c59264so2895629a91.0
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 20:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769401713; x=1770006513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qg7RETk35e6sk9JFD6Qoe6w7+6Mkk77ZA6XdJje9Z98=;
        b=Ugg43iLo3fOn9gXVNF5DKTBoqkETz2ods0VbcMBTSZcYaw8JdhHq59fGt4XlkyHUyE
         8Xfi70/3LEkurId97OdgKYBw1TOzC9TsIPj6J3dVlhpi76wI1XEjF1OZyMlB0mkYl0o5
         1u3uoH6GXOER/DO+3ew47sLJ9aIy/SdG+GF2q8UXc7wkAl5/DJ+G6h+JNNbgPC3/4V3e
         vJQjIBUnNJ6jgjEzEYa4YNKmZgye5Wg/SS2rS8EcIieAHvgnpQWYMjdkxG40+yIuqTMj
         wfIOOFpPLBw8L83tAr6zFxmoDYES4HOoj8AsKVQb1FgtR1s0QElExRT9R/7z313HpiZO
         jbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769401713; x=1770006513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qg7RETk35e6sk9JFD6Qoe6w7+6Mkk77ZA6XdJje9Z98=;
        b=WjoN+hm3Vqc9eGMARPh9ipZMmwvnol1g9FKD1S4xzA/Rc0cIdeajErCxag8LB1WX2a
         30YilVR9/p0QrkvlVKhZnf8EROQHDQzrsoHycM8suvxLvIMOm1LnMwvL1wfU5BIOgKdt
         nmj/Tgxcaebb2uI8dLoqDpqxBivQUdHnBg9sY7bec5un2zOBtAbf42nBTRfVt4NgMEEj
         uPGP25rjFPuZ901Yog/PfQMrJ0v80Ag4u5/DYrRw22ng+hYwL+VOAU9zJ2CYZ5lBrVJn
         tXhbDeE+xHMHf6zzlIqGTtXC/LihL7EUGaqkSbp22f9ZLwmIc6mp/fllIhB33meHnE00
         xPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnwHxs6wjs6hyZIH5nF9U9W5igiGIySgCZJgPrzn1ZC1Sl2iCZviph3/mgMIqfyHug4O5VQrwdaOw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCZ0ueuML3nkB4wIJBAFPi1xsQGXJNz1mJL1IKuQOyRlYK6nGN
	OZznH7CUiH/wmQYZBCollIJTwz3sGteNaz2WJPFKU0exvp7hpFXhPWC/
X-Gm-Gg: AZuq6aIGMZ9wu9kfEHCV4WzRxNHPYqMEtQWk1LrDLHvpu5j2CISmBF0z3Io8FhNHCML
	ue8iL15BKExJvYAzya7G1tLCHR5YcUQNnM4FLyHwOWNZZkbQt9/0QYtyumuywz++cS1LN38ggZN
	3TwH4PUMxPonv7JkD0bPU9q4XwkHUR/E3rNCNZNBMuLShz3b/dOh9FedYXAJ9TnKEUMAZTJD4fR
	oRLO/T9vNoGPLEi5G0qvJi2PL9Ae+l5HY+3Cv3JM+kGUsSG5qY43Y2FFLjfdAZrRsU5e/6ReTTr
	tcz1ycK5RLu5N2fky17XBdxGIVfqqaMqt0vtpw1FQJ8JdUAmjhCmu/Xl5JBwdj77Az6iAWGTxMN
	d16wxjNt0tVM7397UEZNQOuc9Vk/l4pDTYL+wkgT0u9I3dnu0ybDqgHJLpc3NUH4jCGQhhdZhUU
	c739xynmyVfXDFP11E9Z0x1TfGqnHnI4DL5qy6Jw1Y669by4PCfNg=
X-Received: by 2002:a17:90a:d603:b0:352:bd7c:ddbd with SMTP id 98e67ed59e1d1-353c4167e28mr2753120a91.23.1769401712998;
        Sun, 25 Jan 2026 20:28:32 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35335215eb5sm10523533a91.5.2026.01.25.20.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 20:28:32 -0800 (PST)
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
Subject: [PATCH v3] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg()
Date: Mon, 26 Jan 2026 04:28:25 +0000
Message-Id: <20260126042825.2810142-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_042835_925754_8D7BE99A 
X-CRM114-Status: GOOD (  17.61  )
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
V2 -> V3: Added parentheses to function name in subject.
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
