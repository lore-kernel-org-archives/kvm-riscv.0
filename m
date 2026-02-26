Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A73FC5910
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPjYF5OO7PW0wFZEdINexzozbM/M4I7SJqjaOqfWDag=; b=rJG3GAPuuIjeYi
	4hm+5w1t+LjlEreVAsQ+/Aagid2emXOcDHy7RBeEu4KmJpe0+bTepzW6JTAzTVbFKQMWy9RKhGqE7
	pOJBHh/PWaEasfBJ43afqSRDv52r5Lq3u8fRKbacBO+L8YqTBCFFbAVm4jlp8A87OZKOsh949G6lT
	muu34dYTECWeVli3kVoLx61tGHHIqqbwQrIcICzeG5cOHXztzboxhXo/Xcm0Qj/Q22OLS5bVIinCT
	DZmyFpeVpj0Ji+IRNXFsmgU7MkeRzU972vqxILvFWnarE4cK7kcu8zvXiiEb2R29WeXTg2qN/ZbyQ
	+kG7m1fp6A9QbaiYcVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWnr-00000005esl-2rEi;
	Thu, 26 Feb 2026 08:32:59 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWnl-00000005eoo-1laR;
	Thu, 26 Feb 2026 08:32:57 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowAB3HWkjBaBpUDDFCA--.13513S5;
	Thu, 26 Feb 2026 16:32:39 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v8 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests
Date: Thu, 26 Feb 2026 08:32:34 +0000
Message-Id: <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3HWkjBaBpUDDFCA--.13513S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCr1fKw17Cryfur4fuFWfKrg_yoW5Zr4rpF
	ykCFnYgr18Kw4fA3yxKr4kXFWfWw4vyr4vv3y3Zw40yF4xAF4xAry7KF4DZas8ursYqF1S
	vFyIgF4UuF4DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	ACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeHUDUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwsKCWmf1qeqwAAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_003253_835761_BF956221 
X-CRM114-Status: GOOD (  10.76  )
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
V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
          Removed comments in RISC-V check_steal_time_uapi().
          Corrected reg.id assignment for SBI STA.
V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
           KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
          Refined assertion messages per review feedback.
          Split into two patches per Andrew Jones' suggestion:
           Refactored UAPI tests from steal_time_init() into dedicated
            check_steal_time_uapi() function and added empty stub for
            RISC-V.
           Filled in RISC-V stub with STA alignment tests. (this patch)
---
 .../selftests/kvm/include/kvm_util_types.h    |  4 +++
 tools/testing/selftests/kvm/steal_time.c      | 25 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
index ec787b97cf184..90567f8243fe9 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_types.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
@@ -17,4 +17,8 @@
 typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
 typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
 
+#if defined(__riscv)
+#define INVALID_GPA (~(uint64_t)0)
+#endif
+
 #endif /* SELFTEST_KVM_UTIL_TYPES_H */
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 6f77df4deaad3..e90aad9561ff7 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -324,6 +324,31 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 
 static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
 {
+	struct kvm_one_reg reg;
+	uint64_t shmem;
+	int ret;
+
+	reg.id = KVM_REG_RISCV |
+			 KVM_REG_SIZE_ULONG |
+			 KVM_REG_RISCV_SBI_STATE |
+			 KVM_REG_RISCV_SBI_STA |
+			 KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
+	reg.addr = (uint64_t)&shmem;
+
+	shmem = ST_GPA_BASE + 1;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	TEST_ASSERT(ret == -1 && errno == EINVAL,
+		    "misaligned STA shmem returns -EINVAL");
+
+	shmem = ST_GPA_BASE;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	TEST_ASSERT(ret == 0,
+		    "aligned STA shmem succeeds");
+
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
