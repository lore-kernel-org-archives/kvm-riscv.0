Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4C1CCF2C7
	for <kvm-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXk/azUS8RiNx2o8ruiYuy4Vp6Brc45Nv4HHjdlM1n4=; b=F+eaTt4D7zQeaV
	b6pBZc+NFXfxz4QAuy2ktwhM9STyLazIATM1975KaV0rruqPmACk5ckVd7WMY9RYjabDb7qNfs4oT
	z1Vh250DBCX8M3kyUlPBMZGefO7r4qePpWkkh3ntMunmwF8BdMZbllGF9cI5v24vBz5m4/QiPAJJ+
	3Zc3R9DFI7pGu1h14m1Ocs2lwf5Q9t/e2FQ6x95sI/1sM6EDlglZTRy6y3kMMbyDOhTVGOUVxbWdG
	sUVyOk7T1263EzyxGheroExlSk3EUPHQE7hk3F2QxEUFyuCiUbcjRTpUtLkcGjYeZ1gp/kEJbHQQD
	aOR5mOEq21UBxRK4ZWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CR-00000004hcs-1cd4;
	Sat, 17 Oct 2026 11:03:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI2CK-00000004hX2-3HKL
	for kvm-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 11:03:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2e5378b281aso2896965ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 17 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792235012; x=1792839812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=jK+0Sjrqpju1AkuXLTRUyuKjIDC4qhrN2fR7xsnfuHWijU3ZNlY36894EawAU5OTj0
         6+j51KmhE3lIuQsJyaFKLIvU9Sgg/PFuhKkgyULxWgHutsWBl5X0aPoGGS+2VbZnnptJ
         C+hQy0iBPDTtQurKwDtuVF82yII92RBa9au9NBv252Q91MiZoE6D0Au37O70tcSzWbNI
         qg8PbapbkCOqY7Et9E0Xm8NM8k5WP8a3E6/FkyPcJzZZV9GFkCMxm+5EBWCdQOGfKFAw
         LMP1hfJhE5snrLPvqbUULK9YbIAXdrWCxPktZlqCwO+9e7sfZwrJ/JVrZB/KUN8nZQUI
         KNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792235012; x=1792839812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tf4fy3DAykjNBLlmTR7a2o12P+Rb24NlY7yvH7wOMkE=;
        b=sYOqhp+xx+MpYJLtnAffPlUKVNU2EObbX2zbJ3krp/OmC3p3iCTAZ7t6gTcwcC1Chb
         yLTkeJze0tr9bPeiCCy24PyGfFRjw3DwLJysw4nDz3SzKQhknwJzSGLELLksgp9rjYWz
         PO6usuqPnIDAfx0c4LX+58Rkt8xAYSclzuL0Aq2tolDG8sVcHPMW1lsxroXOghChwdK8
         ld1rUQNHwy8PammbDvs6/DAdaZeLQgN0eMgGulUd+Ln59+n2SYL2hhLOH+w6O3gwX9eh
         0W6BMdI3SWSjGnE4FvRIKSnM6KLLoWyiicTNdmqJz/aPumJ9ia4/mp/4muMVTOWJr/qx
         1TsA==
X-Forwarded-Encrypted: i=1; AKwUvBxw0CW3G+kZj7d9JwGorBV51GCU8eiaFOGG5OB4QuyqlFJ4E1jpphSMeVVJ3UrHQigSt6FXbK+PQ7g=@lists.infradead.org
X-Gm-Message-State: AFq9FYJhiDw/6lpJPdA23HY5yn/vJ3ynPpAL8P2eIZoJZByMaMM+bp9p
	XwcqkpsD1ZB5CXK+VxMSXg6S2Q2QKAxmEYhTxpNE1UlwXo4r3vR8OPEE
X-Gm-Gg: AYBFou36IftIPLTi70WQIuRvtAWcZK3dnjUmrbCJFFgrJJfOaH2nXUWCGo3I/89PE9O
	Z2AeatuA/7uYUoLicePO2+lbTJfQSKJJto86EDcNXYEOTSM1Ml2pTSBAiGCpXiTJ1qCWsvwHMQL
	IYT8Df1iZLqqYhbiYpAfuldnDoG37Wheb+8nwDw0zHJ1OFBB4Mo841iUdxvNI8eHLwQBchHBL8P
	kP91PekhmTAviFO0bvXmskKIfejZaZ6iIsLI1eKTbYppc5oUeuwRxfW9J1DjDc1Oj6FW59fTRiu
	fl6PLUCSEQXRIpIY4vMAKJkhmjW3ygVga/Ht3+pbH8eh0IfsXW4qmGi9Ac95N8vERJyTJOu7XjI
	2G78iH/hmw65gv133+PgB0AwUi1yssMPSt4RYlzuizGPrVKXCGPwQg4sGECE3peI9D97HZJhw/8
	JDeSnCvHR4iytPBvjfNVhP7ITk3tJ0IpShzH3S/PPP+yo70tuEq7vyNrbeIJWA7sdJ5sBETbmAB
	XYQiI/SqfB5OYEUo8rRDw==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr22504755ad.30.1792235011936;
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:31 -0700 (PDT)
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
Subject: [PATCH 5/5] KVM: selftests: Test protection of the ucall MMIO region
Date: Sat, 17 Oct 2026 18:02:13 +0700
Message-ID: <20261017110213.46199-6-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_040334_087761_C52536C2 
X-CRM114-Status: GOOD (  12.83  )
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

Verify that creating a memslot overlapping the ucall MMIO region
fails with EEXIST and that ucalls work before and after the
attempt. Skip when MMIO ucalls or read-only memory are unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/reserved_slot_test.c        | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/reserved_slot_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 1f4bc2a1322d..ff4a5e9733e9 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -68,6 +68,7 @@ TEST_GEN_PROGS_COMMON += set_memory_region_test
 TEST_GEN_PROGS_COMMON += memslot_modification_stress_test
 TEST_GEN_PROGS_COMMON += memslot_perf_test
 TEST_GEN_PROGS_COMMON += vm_types_test
+TEST_GEN_PROGS_COMMON += reserved_slot_test
 
 # Compiled test targets
 TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
diff --git a/tools/testing/selftests/kvm/reserved_slot_test.c b/tools/testing/selftests/kvm/reserved_slot_test.c
new file mode 100644
index 000000000000..4a908017ca73
--- /dev/null
+++ b/tools/testing/selftests/kvm/reserved_slot_test.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define CLOBBERED_SLOT		TEST_MEM_SLOT_BASE
+
+static void guest_code(void)
+{
+	GUEST_SYNC(1);
+	GUEST_SYNC(2);
+}
+
+static void test_slot1_protected(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_run *run;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	u32 nr_pages;
+	size_t slot_size;
+	void *slot_mem;
+	int ret;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+	nr_pages = vm_adjust_num_guest_pages(vm->mode, 1);
+	slot_size = (size_t)nr_pages * vm->page_size;
+
+	run = vcpu->run;
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 1,
+		    "Expected the first sync before clobbering the ucall GPA");
+
+	slot_mem = kvm_mmap(slot_size, PROT_READ | PROT_WRITE,
+			    MAP_PRIVATE | MAP_ANONYMOUS, -1);
+	ret = __vm_set_user_memory_region2(vm, CLOBBERED_SLOT, 0,
+					   vm->ucall_mmio_addr, slot_size, slot_mem, 0, 0);
+	TEST_ASSERT(ret == -1 && errno == EEXIST,
+		    "Expected the ucall GPA overlap to be rejected: ret=%d errno=%d",
+		    ret, errno);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(run->exit_reason == KVM_EXIT_MMIO,
+		    "Unexpected exit reason = %u", run->exit_reason);
+	TEST_ASSERT(get_ucall(vcpu, &uc) == UCALL_SYNC && uc.args[1] == 2,
+		    "Expected the second sync after attempting to clobber the ucall GPA");
+
+	kvm_vm_free(vm);
+	TEST_ASSERT(!munmap(slot_mem, slot_size), "munmap() failed, errno=%d", errno);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(UCALL_EXIT_REASON == KVM_EXIT_MMIO);
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_READONLY_MEM));
+
+	test_slot1_protected();
+	return 0;
+}
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
