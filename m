Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46501EDF148
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHDlGD5IDa7b9rt3+CDbbrOpFnFdUG/+zKOiwK+sUKk=; b=AkCBuvEJQbZOXO
	K1Svyiy0JSm2PTP+0+bDXAEXj7E6brqWMEmCwomITMvLr4W8ZxTm6tvlUevz9f0OI51xFMcBqGE3Z
	RbIBxd8qw1LH8tHPYsrjgPo1Wp3M3mLnpCfrhhybhacpZBpgI0Xv/ZowPMFcGb++6/wfDkC4tYZeY
	+TC/U4hpXD6zEN74BLpVohXHvQW6ZxxD3AivQliUkPm8aL4SuqVReGYOTZ0NCbdz3fPHqOHwo4dpp
	LqR7XmtjQG4n0+VAiMj/ubYM90Jc93veU+5FXMWMyBjxkqSP5DiqsyqPrPazMmKouz65YNNrJJPAi
	eynSSp8/M2jurn0F6f8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqXd-00000003KIn-2Qnl;
	Fri, 13 Feb 2026 10:36:53 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqXY-00000003KDy-2zIg;
	Fri, 13 Feb 2026 10:36:51 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAC3RgqO_o5pQN4uCA--.25463S5;
	Fri, 13 Feb 2026 18:36:02 +0800 (CST)
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
Subject: [PATCH v7 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests
Date: Fri, 13 Feb 2026 10:35:57 +0000
Message-Id: <20260213103557.3207335-4-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3RgqO_o5pQN4uCA--.25463S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1fKw17CrWDCF4rurWrGrg_yoW5Xr4fpr
	Z7Gr90qrW8trs3t34xKr1vqF4FgrWvkr4vvry7Zw4rAF4xtF1xJryUKFyDZ343WrZ5XF1S
	vFySqF45uF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
	z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmiifUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRARCWmOigf8bQACs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_023649_122446_66DB1E20 
X-CRM114-Status: GOOD (  11.08  )
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

Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
shared memory alignment requirements.

The SBI specification requires the STA shared memory GPA to be 64-byte
aligned, or set to all-ones to explicitly disable steal-time accounting.
This test verifies that KVM enforces the expected behavior when
configuring the SBI STA shared memory via KVM_SET_ONE_REG.

Specifically, the test checks that:
- misaligned GPAs are rejected with -EINVAL
- 64-byte aligned GPAs are accepted
- all-ones GPA is accepted

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V6 -> V7: 
- Removed RISCV_SBI_STA_REG() macro addition and used existing 
KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
- Refined assertion messages per review feedback.
- Split into two patches per Andrew Jones' suggestion:
    Refactored UAPI tests from steal_time_init() into dedicated 
    check_steal_time_uapi() function and added empty stub for 
    RISC-V.
    Filled in RISC-V stub with STA alignment tests. (this patch)
---
 tools/testing/selftests/kvm/steal_time.c | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index a814f6f3f8b41..2af7fd7513d55 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -233,6 +233,7 @@ static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
 
 /* SBI STA shmem must have 64-byte alignment */
 #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
+#define INVALID_GPA (~(u64)0)
 
 static vm_paddr_t st_gpa[NR_VCPUS];
 
@@ -327,7 +328,30 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 
 static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
 {
-	/* RISC-V UAPI tests will be added in a subsequent patch */
+	struct kvm_one_reg reg;
+	uint64_t shmem;
+	int ret;
+
+	reg.id = KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
+	reg.addr = (uint64_t)&shmem;
+
+	/* Case 1: misaligned GPA */
+	shmem = ST_GPA_BASE + 1;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	TEST_ASSERT(ret == -1 && errno == EINVAL,
+		    "misaligned STA shmem returns -EINVAL");
+
+	/* Case 2: 64-byte aligned GPA */
+	shmem = ST_GPA_BASE;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	TEST_ASSERT(ret == 0,
+		    "aligned STA shmem succeeds");
+
+	/* Case 3: INVALID_GPA disables STA */
+	shmem = INVALID_GPA;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	TEST_ASSERT(ret == 0,
+		    "all-ones for STA shmem succeeds");
 }
 
 #endif
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
