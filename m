Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D43EDF155
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sa0C72Vk2D1l55BPLwsFsxFKsL6YwKZNBj3ABZQUeF8=; b=m3dzltsZnb5NCj
	T2xiS8DAKAZsIEkxibNxxbQU/vD4qP8Zuebgwl0tUSAa7a2hS4c6MwVutd2QDX/HCtAAHrNgkgVAS
	EDAFobKLlHV85CQiy/l5SJVtiBqeqXe0JX0aHaMZivRKOMVcAxwvb4blgV1i8+IDSQ/zgoShkmPH3
	D+1rA0O0kDrhzXlSLXo8FAYzWnEEV67XScnOVzFl2byjeq5QVENaTedM5dyfsfVmrfN5WcXRINfW7
	OQdrvkhvfiwHLeyvYppT74m8cSlZlH92NisKMIny9d+BAv1B6w0ewL0tsycQJtq96rViTr1naPLoN
	1eltvU1FHQNR3iykb/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqXg-00000003KKw-0xKw;
	Fri, 13 Feb 2026 10:36:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqXY-00000003KDh-32Wb;
	Fri, 13 Feb 2026 10:36:52 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAC3RgqO_o5pQN4uCA--.25463S4;
	Fri, 13 Feb 2026 18:36:01 +0800 (CST)
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
Subject: [PATCH v7 2/3] KVM: selftests: Refactor UAPI tests into dedicated function
Date: Fri, 13 Feb 2026 10:35:56 +0000
Message-Id: <20260213103557.3207335-3-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAC3RgqO_o5pQN4uCA--.25463S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtr4kXr17Gr18Jr17urWUtwb_yoW7XFWkpF
	97CrZIqrW8tr4fKw1xWrWv9F15Gw4vkrn7Zry7Zw4rAr4kKrZrJF1xCryjvF98KFZ5X3Wf
	Za4SvF47uF4qkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vY
	z4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbyCJJUUUUU==
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwoRCWmOijX6igAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_023649_140140_4F40180B 
X-CRM114-Status: GOOD (  11.65  )
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

Move steal time UAPI tests from steal_time_init() into a separate
check_steal_time_uapi() function for better code organization and
maintainability.

Previously, x86 and ARM64 architectures performed UAPI validation
tests within steal_time_init(), mixing initialization logic with
uapi tests.

Changes by architecture:
x86_64:
  - Extract MSR reserved bits test from steal_time_init()
  - Move to check_steal_time_uapi() which tests that setting
    MSR_KVM_STEAL_TIME with KVM_STEAL_RESERVED_MASK fails
ARM64:
  - Extract three UAPI tests from steal_time_init():
    	Device attribute support check
    	Misaligned IPA rejection (EINVAL)
    	Duplicate IPA setting rejection (EEXIST)
  - Move all tests to check_steal_time_uapi()
RISC-V:
  - Add empty check_steal_time_uapi() stub for future use
  - No changes to steal_time_init() (had no tests to extract)

The new check_steal_time_uapi() function:
  - Is called once before the per-VCPU test loop

No functional change intended.

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 tools/testing/selftests/kvm/steal_time.c | 63 ++++++++++++++++++------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 8edc1fca345ba..a814f6f3f8b41 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -69,16 +69,10 @@ static bool is_steal_time_supported(struct kvm_vcpu *vcpu)
 
 static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
 {
-	int ret;
-
 	/* ST_GPA_BASE is identity mapped */
 	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
 	sync_global_to_guest(vcpu->vm, st_gva[i]);
 
-	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
-			    (ulong)st_gva[i] | KVM_STEAL_RESERVED_MASK);
-	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
-
 	vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME, (ulong)st_gva[i] | KVM_MSR_ENABLED);
 }
 
@@ -99,6 +93,18 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 			st->pad[8], st->pad[9], st->pad[10]);
 }
 
+static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
+{
+	int ret;
+
+	st_gva[0] = (void *)(ST_GPA_BASE);
+	sync_global_to_guest(vcpu->vm, st_gva[0]);
+
+	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
+			    (ulong)st_gva[0] | KVM_STEAL_RESERVED_MASK);
+	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
+}
+
 #elif defined(__aarch64__)
 
 /* PV_TIME_ST must have 64-byte alignment */
@@ -170,7 +176,6 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
 {
 	struct kvm_vm *vm = vcpu->vm;
 	uint64_t st_ipa;
-	int ret;
 
 	struct kvm_device_attr dev = {
 		.group = KVM_ARM_VCPU_PVTIME_CTRL,
@@ -178,21 +183,12 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
 		.addr = (uint64_t)&st_ipa,
 	};
 
-	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
-
 	/* ST_GPA_BASE is identity mapped */
 	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
 	sync_global_to_guest(vm, st_gva[i]);
 
-	st_ipa = (ulong)st_gva[i] | 1;
-	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
-	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
-
 	st_ipa = (ulong)st_gva[i];
 	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
-
-	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
-	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
 }
 
 static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
@@ -205,6 +201,34 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 	ksft_print_msg("    st_time: %ld\n", st->st_time);
 }
 
+static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vm *vm = vcpu->vm;
+	uint64_t st_ipa;
+	int ret;
+
+	struct kvm_device_attr dev = {
+		.group = KVM_ARM_VCPU_PVTIME_CTRL,
+		.attr = KVM_ARM_VCPU_PVTIME_IPA,
+		.addr = (uint64_t)&st_ipa,
+	};
+
+	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
+
+	st_gva[0] = (void *)(ST_GPA_BASE);
+	sync_global_to_guest(vm, st_gva[0]);
+
+	st_ipa = (ulong)st_gva[0] | 1;
+	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
+	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
+
+	st_ipa = (ulong)st_gva[0];
+	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
+
+	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
+	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
+}
+
 #elif defined(__riscv)
 
 /* SBI STA shmem must have 64-byte alignment */
@@ -301,6 +325,11 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
 	pr_info("\n");
 }
 
+static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
+{
+	/* RISC-V UAPI tests will be added in a subsequent patch */
+}
+
 #endif
 
 static void *do_steal_time(void *arg)
@@ -369,6 +398,8 @@ int main(int ac, char **av)
 	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
 	ksft_set_plan(NR_VCPUS);
 
+	check_steal_time_uapi(vcpus[0]);
+
 	/* Run test on each VCPU */
 	for (i = 0; i < NR_VCPUS; ++i) {
 		steal_time_init(vcpus[i], i);
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
