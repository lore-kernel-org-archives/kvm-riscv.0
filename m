Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072FEEA794F
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 01:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DODfb8cT7maWeEA+jLNrOfy4nEZ9M+AfmzKooZv3UYs=; b=SJeJ46nJPKpj5L
	YOmx84pNDkC9QZJp/me/YA2PIsKvqI9KWKH1e6FPlrM+TF7wV2z4sOLZUebFYEUP4jMq9WHGieek+
	Lmqchn89HwElupeAebPWFjyWyZPD9LZvQl1izF5XtR/35n4Ouy/66xYUwGkdTflkyR2ajDlCIDpii
	9GTUr4KQaWMVkVCnFHtgjH+NZc6sWVifU2uheFanvA+ACyRY2PXQ7b7idFwF4+uti6DLH92D4E4Yu
	LqXnHmHh21CuGUGo6MPrvd3vlLQZph7WM9icbF3pwJ7pQI64SzA8m2u+G1E6aIKarE8YeptehUy21
	yIOqHrbmdJcEFvEoy8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnnoA-00000009F3V-0arp;
	Thu, 05 Feb 2026 01:05:22 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnno6-00000009F2N-0TX5;
	Thu, 05 Feb 2026 01:05:20 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowACXt97A7INpzKW1Bw--.43975S3;
	Thu, 05 Feb 2026 09:05:05 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v6 1/2] RISC-V: KVM: Validate SBI STA shmem alignment in  kvm_sbi_ext_sta_set_reg()
Date: Thu,  5 Feb 2026 01:05:01 +0000
Message-Id: <20260205010502.2554381-2-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACXt97A7INpzKW1Bw--.43975S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXF4xXFyfKw4fZrW5Cry7trb_yoW5Kw13pF
	42kw15Zr48tFZ2k39rZw4vgr15u3ykKr1jqFy3W348ZF4ktFyYyrna93y7ZF98JryvvFWI
	yF10vF1DCa15AaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUdEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWln4kS14v26r1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxV
	AIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU8m9aPUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRAJCWmD6m0JbQABsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_170518_515972_9468B351 
X-CRM114-Status: GOOD (  15.87  )
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
memory physical address to be 64-byte aligned, or set to all-ones to
explicitly disable steal-time accounting.

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

Fix this by validating the computed shared memory GPA at the
KVM_SET_ONE_REG boundary. A temporary GPA is constructed and checked
before committing it to vcpu->arch.sta.shmem. The validation allows
either a 64-byte aligned GPA or INVALID_GPA (all-ones), which disables
STA as defined by the SBI specification.

This prevents invalid userspace state from reaching runtime code paths
that assume SBI STA invariants and avoids unexpected WARN_ON behavior.

Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V5 -> V6: Initialized new_shmem to INVALID_GPA as suggested.
V4 -> V5: Added parentheses to function name in subject.
V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
          Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
          Added blank lines per review feedback.
V2 -> V3: Added parentheses to function name in subject.
V1 -> V2: Added Fixes tag.
---
 arch/riscv/kvm/vcpu_sbi_sta.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index afa0545c3bcfc..3b834709b429f 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -181,6 +181,7 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 				   unsigned long reg_size, const void *reg_val)
 {
 	unsigned long value;
+	gpa_t new_shmem = INVALID_GPA;
 
 	if (reg_size != sizeof(unsigned long))
 		return -EINVAL;
@@ -191,18 +192,18 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
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
@@ -211,6 +212,11 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 		return -ENOENT;
 	}
 
+	if (new_shmem != INVALID_GPA && !IS_ALIGNED(new_shmem, 64))
+		return -EINVAL;
+
+	vcpu->arch.sta.shmem = new_shmem;
+
 	return 0;
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
