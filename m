Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6057CCF2C1
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/8+1zbIRqmBnTjSRQGsRMF3FOVz7g/P0BB3q7KYeYg=; b=wvBK/YFr1riyat
	CFsFOt/dYdqtwwnu2BuUzx8fK73+tIebKg3yVNZCK91cYSoOzvsgjx48MaPi+hchV/gMDlspBftqF
	7F7+8QFjW+trV2j4eI7S5muUrjBJ4eBDxFh9QFx/kyd4q8tXFbrjS3U4BwbLyhXEh+R3cVT0bt2AJ
	u6XoMgI5G2dFAJfAbXUlVGNhul8c0Pmxgv375NnfpKcdiDRsFbPK1ZBhHYx45E8AXzAfo0GlL2xpq
	XhZDSUQcsn5eePPMrJw6MS7rJ4/m1J7z7smw0E0GfKj/bvBMTs5wPAh8JCeexwDXMkCEOOsPeUe4E
	iIOJjK2J3ruxmo5kGpIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2Bc-00000004h6P-1rJQ;
	Sat, 17 Oct 2026 11:02:48 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2BV-00000004h3u-3bh8
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:02:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e95bd1c14cso5450235ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234961; x=1792839761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Khy5mpRZBeQDtqVcHeSI4CoZNFAypt9Icm1BgzV+FWo=;
        b=QYEcXdHsU+phoVZ7NuSWqwRqbuQ6jaRP/RidPPrd5ptEOFmQv/XY4Y+DvWH9OSHOMo
         cXhERYKqexp6b+EW6OXtkvb3FccsaDXH5bbTHjNb+qF1IYC6/RyUrBbsMor8UbOuH88Q
         SBb64Kr+0jdVkqwoRHY/L6HdMDOZTyoY0RlQcXEEGRTTbn8YFrU5d7jFxbMBKt3pyyjr
         BqpI8E1dfyYcQTkPq7WRrVjHsbMEqjCft4ccQxFQdPFm1dc5OXN3MXuqkHIO6Rx62bBv
         B0Se+GVCMYbpnCdMOQoB0vnu17JCvFpCA+wiGPL3VeXokqraH+FOG7CBB9gRGD0McAsX
         Z6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234961; x=1792839761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Khy5mpRZBeQDtqVcHeSI4CoZNFAypt9Icm1BgzV+FWo=;
        b=EYXUtf+ZEB4/yEQvy9w5fI9q6MFrP9sMQzG0+Lm3a1Xy4TDmZHxn9Js9P/okn1ST5l
         I6wDovoz+bgrDo88PrKfJZIUVKf62oqdZhJ84tXyr1LGXpgg9eVbAvAnL2zMfJLHYaFy
         68eV/G0/DSQIXWWsllMfff6k7bNbxK+KtFeolygfkVrSEZBw6g/U+dBRDzXP/6vUURj0
         Q24sD0XpaUQGaXiZi5TZvJy0NTGNnK3qcHNtbh342M+hdjyO6tOJIKg/L5szEnjXixeK
         gYnS0U7ugEV0ukFmuX4D1zB1Fu8rMA58T7cJex/EwnbDKFqqQMw7L6ogr9ZNQDpwCxck
         SHJA==
X-Forwarded-Encrypted: i=1; AKwUvByyEQkbsDh1qE3G6qWSVZSagNX4XEFTG1IymeqlPCMHtMOS93Ukr90nJkPGBL1g3xU+BtkCJWQR4uM=@lists.infradead.org
X-Gm-Message-State: AFq9FYIV9u9uTcYXbPlqRYGpuoqB2zIMmfwyYaxmhwxs6ZciIryFE2Ku
	/9wFOF6zxnxT6WFJam7LwctRg4/OCiqSzutB+3w2g+1RBLSZd/JhGNla
X-Gm-Gg: AYBFou1BDjLEkuu3Uxo8MEzgVqDQmfV6xWDCvfAv3qqg1/+5KtlwCzs7RExUWMlC3Z+
	Kz0WXvuH9aqLm+3BU/rEuiTtdo8vacfjScoJxByeY99ZVj13iS5UgKa/vcnujRvnlaqt+aCP6nh
	BY76Nr1dGP+2neLqNNScAAhCI2vHVy/wn9BKmXmFynQbi/8SGNCslMqmWCDUgJO8fNXHXxRMyUq
	L7p2jzC7Fipd4wbnDSvPhLkfla36EEVhFi+hutFUa6r24aVef7YaC9KkUZCUzFL52XK9G48SL/h
	ki++jUGVznNqx2Jy7wPMCDUylxYzH68LVXCWFQvV0xDImiatn4n8khU1n5Kmo4FsRHroRGOXsvn
	BKBgbh1tzfm61VzZayXzIvaufCysa+C/xT/Ew9ByezuGAKjgytQAtQGaLq0GyEf/ObdSnYTlczG
	n6wcU7F36WwCKjO5FnddJb9VtF/Y8i+UcTn4UCw7FHVNoNEKdbccgbfumZ++3oVvm4/H2/m60Ry
	V+pT948PthMNrWtejJXykx+TPZ9XZtX
X-Received: by 2002:a17:903:283:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e9a6c0de31mr22453835ad.39.1792234960910;
        Sat, 17 Oct 2026 04:02:40 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:02:40 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 1/5] KVM: selftests: Introduce a shared base for test memslots
Date: Sat, 17 Oct 2026 18:02:09 +0700
Message-ID: <20261017110213.46199-2-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040241_913854_DC7DB4F9 
X-CRM114-Status: GOOD (  14.16  )
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

Replace hardcoded slot 1 assignments with TEST_MEM_SLOT_BASE
This prepares tests for reserving slot 1 for library use.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/arm64/hypercalls.c               | 3 ++-
 tools/testing/selftests/kvm/arm64/sea_to_user.c              | 2 +-
 tools/testing/selftests/kvm/arm64/stage2_block_transitions.c | 2 +-
 tools/testing/selftests/kvm/arm64/vgic_its_save.c            | 2 +-
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c          | 2 +-
 tools/testing/selftests/kvm/dirty_log_test.c                 | 2 +-
 tools/testing/selftests/kvm/guest_memfd_test.c               | 2 +-
 tools/testing/selftests/kvm/include/kvm_util.h               | 1 +
 tools/testing/selftests/kvm/kvm_page_table_test.c            | 2 +-
 tools/testing/selftests/kvm/mmu_stress_test.c                | 2 +-
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c             | 3 ++-
 tools/testing/selftests/kvm/steal_time.c                     | 3 ++-
 tools/testing/selftests/kvm/x86/nested_dirty_log_test.c      | 2 +-
 tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c  | 2 +-
 14 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/hypercalls.c b/tools/testing/selftests/kvm/arm64/hypercalls.c
index 391e2ba58b0b..ff7c21738a96 100644
--- a/tools/testing/selftests/kvm/arm64/hypercalls.c
+++ b/tools/testing/selftests/kvm/arm64/hypercalls.c
@@ -191,7 +191,8 @@ static void steal_time_init(struct kvm_vcpu *vcpu)
 	unsigned int gpages;
 
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE);
-	vm_userspace_mem_region_add(vcpu->vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	vm_userspace_mem_region_add(vcpu->vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, gpages, 0);
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PVTIME_CTRL,
 			     KVM_ARM_VCPU_PVTIME_IPA, &st_ipa);
diff --git a/tools/testing/selftests/kvm/arm64/sea_to_user.c b/tools/testing/selftests/kvm/arm64/sea_to_user.c
index d4af6e0eed28..bb552debc61c 100644
--- a/tools/testing/selftests/kvm/arm64/sea_to_user.c
+++ b/tools/testing/selftests/kvm/arm64/sea_to_user.c
@@ -323,7 +323,7 @@ static struct kvm_vm *vm_create_with_sea_handler(struct kvm_vcpu **vcpu)
 		/*vm=*/vm,
 		/*src_type=*/src_type,
 		/*gpa=*/start_gpa,
-		/*slot=*/1,
+		/*slot=*/TEST_MEM_SLOT_BASE,
 		/*npages=*/num_guest_pages,
 		/*flags=*/0);
 
diff --git a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
index 5fd47f4ada1f..0e23d7b55782 100644
--- a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
+++ b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
@@ -41,7 +41,7 @@
 #include "test_util.h"
 #include "ucall.h"
 
-#define DATA_SLOT		1
+#define DATA_SLOT		TEST_MEM_SLOT_BASE
 #define TEST_GVA		0xc0000000UL
 #define BLOCK_SIZE		SZ_2M
 
diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
index 864da01539f3..e858a4aa741d 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
@@ -29,7 +29,7 @@
 #include "ucall.h"
 #include "vgic.h"
 
-#define TEST_MEMSLOT_INDEX	1
+#define TEST_MEMSLOT_INDEX	TEST_MEM_SLOT_BASE
 
 /* All three ITS table entry sizes are 8 bytes in ABI 0. */
 #define ESZ			8
diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9a69c439a0f8..1d5c56481053 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -18,7 +18,7 @@
 #include "ucall.h"
 #include "vgic.h"
 
-#define TEST_MEMSLOT_INDEX	1
+#define TEST_MEMSLOT_INDEX	TEST_MEM_SLOT_BASE
 
 #define GIC_LPI_OFFSET	8192
 
diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index af5eb0334a74..75084fe3bec6 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -26,7 +26,7 @@
 #define PAGE_SHIFT_4K  12
 
 /* The memory slot index to track dirty pages */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 
 /* Default guest test virtual memory offset */
 #define DEFAULT_GUEST_TEST_MEM		0xc0000000
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 2233d871a38f..231bfe238e31 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -510,7 +510,7 @@ static void test_guest_memfd_guest(void)
 	 * the PCI hole and other MMIO regions that need to be avoided.
 	 */
 	const gpa_t gpa = SZ_4G;
-	const int slot = 1;
+	const int slot = TEST_MEM_SLOT_BASE;
 
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 5a7a455b5387..759d604d44ce 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,6 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
+#define TEST_MEM_SLOT_BASE 1
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/kvm_page_table_test.c b/tools/testing/selftests/kvm/kvm_page_table_test.c
index 974813ea8953..f18720109319 100644
--- a/tools/testing/selftests/kvm/kvm_page_table_test.c
+++ b/tools/testing/selftests/kvm/kvm_page_table_test.c
@@ -20,7 +20,7 @@
 #include "guest_modes.h"
 #include "ucall_common.h"
 
-#define TEST_MEM_SLOT_INDEX             1
+#define TEST_MEM_SLOT_INDEX             TEST_MEM_SLOT_BASE
 
 /* Default size(1GB) of the memory for testing */
 #define DEFAULT_TEST_MEM_SIZE		(1 << 30)
diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 741e343962ed..b965a8b9d214 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -273,7 +273,7 @@ int main(int argc, char *argv[])
 	 * 1gb-3gb,but it's simpler to skip straight to 4gb.
 	 */
 	const u64 start_gpa = SZ_4G;
-	const int first_slot = 1;
+	const int first_slot = TEST_MEM_SLOT_BASE;
 
 	struct timespec time_start, time_run1, time_reset, time_run2, time_ro, time_rw;
 	u64 max_gpa, gpa, slot_size, max_mem, i;
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 20388f0b959d..6abd74870e01 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -605,7 +605,8 @@ static void test_vm_events_test(void *guest_code)
 static void test_vm_setup_snapshot_mem(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 {
 	/* PMU Snapshot requires single page only */
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE, 1, 1, 0);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, PMU_SNAPSHOT_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, 1, 0);
 	/* PMU_SNAPSHOT_GPA_BASE is identity mapped */
 	virt_map(vm, PMU_SNAPSHOT_GPA_BASE, PMU_SNAPSHOT_GPA_BASE, 1);
 
diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
index 785d19f9ee8f..e386580ef540 100644
--- a/tools/testing/selftests/kvm/steal_time.c
+++ b/tools/testing/selftests/kvm/steal_time.c
@@ -509,7 +509,8 @@ static struct kvm_vm *vm_create_steal_time(u32 nr_vcpus, void *guest_code,
 	/* Create a VM and an identity mapped memslot for the steal time structure */
 	vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
 	gpages = vm_calc_num_guest_pages(VM_MODE_DEFAULT, STEAL_TIME_SIZE * nr_vcpus);
-	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE, 1, gpages, 0);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
+				    TEST_MEM_SLOT_BASE, gpages, 0);
 	virt_map(vm, ST_GPA_BASE, ST_GPA_BASE, gpages);
 
 	return vm;
diff --git a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
index 26b474bf1353..e86d625b3e89 100644
--- a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
@@ -16,7 +16,7 @@
 #include "vmx.h"
 
 /* The memory slot index to track dirty pages */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 
 /*
  * Allocate four pages total.  Two pages are used to verify that the KVM marks
diff --git a/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c b/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
index a130759f39a1..4bc57e5e40e3 100644
--- a/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_vmsave_vmload_test.c
@@ -17,7 +17,7 @@
  * interpreted as a direct L1 GPA or translated using NPT as an L2 GPA, depends
  * on which VMCB is accessed.
  */
-#define TEST_MEM_SLOT_INDEX		1
+#define TEST_MEM_SLOT_INDEX		TEST_MEM_SLOT_BASE
 #define TEST_MEM_PAGES			2
 #define TEST_MEM_BASE			0xc0000000
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
