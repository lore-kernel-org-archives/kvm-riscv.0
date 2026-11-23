Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23E606A327
	for <kvm-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q0vR9PC/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PwQeMQe9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9sKJ/9ScXdxP5SKgZegexIB6HZT+JMEgafCIIT3kpFs=; b=q0vR9PC/3NuizS5XT2kQ0FUWQ2
	Mgsh71+re+YaugKNduuYFofvIZL+cixzPNpQmUjQ72OEDRK/Zaa4S0hbbinkpnHXUaSW6gpz4JQz2
	sdrZBobPPCNsAypIgNnEcbmsnVFuDPBK77Pxbu6S2mRNC2Ca8WgiidgcXqBC2V2VFdoOZ8yZJZ7Xn
	OtoJU+5/CkUT47TB4BXWZvunltlnKsPR3WYeHSOmU8POGleijdfFiyoCCrLDGuLvLnUV53Fuw0zJ+
	TU6PYhMFHgimAO8tRKaxxhpsucnfpHyBhETAm05JmuIjJJFh+AQMk9x6IFji9/Kdu4KdEolbYxrog
	ZQfpSs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJv-00000003BwI-1xsM;
	Mon, 23 Nov 2026 11:34:51 +0000
Received: from out-131.mta1.migadu.com ([2001:41d0:203:375::83] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSJr-00000003Bte-2UYi
	for kvm-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:34:50 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=EPW/4inQmR/B22tfOmCqn6geEFgZqhCdt8pVKIKyvII=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433685; v=1; x=1796038485;
 b=PwQeMQe9gxd4WD/m5+FKY0dz7NxdI9LvQkg//w77B0N85vjSGnzY7Ts6j1b9oBIaGhSVU4wv
 5qkxpmKENqMdFv0+vdC6fsmBzq+vmmkP6Cx+HAkFudF6jvcN+zL0xEg2hqERoKrVvhIJw9EbqEh
 wPm/IzBvDadeBHf45rKcivTA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7d064e68e568c241;
	Mon, 23 Nov 2026 11:34:44 +0000
X-Mizu-Trace-ID: 7d064e68e568c241
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	kvm-riscv@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 3/3] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a full dirty ring
Date: Mon, 23 Nov 2026 11:34:35 +0000
Message-ID: <20261123113435.1170711-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123113435.1170711-1-fuad.tabba@linux.dev>
References: <20261123113435.1170711-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033448_482820_4ED88962 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pre-fault more populated, dirty-logged pages than the vCPU's dirty ring
holds, and check that each call stops before the ring overflows, that a
retry returns ENOSPC without progress, and that each page is reported
exactly once. A read pre-fault can map a page read-only, or
access-tracked on x86 without EPT A/D bits, so skip the case if
pre-faulting doesn't dirty any page.

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../selftests/kvm/pre_fault_memory_test.c     | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tools/testing/selftests/kvm/pre_fault_memory_test.c b/tools/testing/selftests/kvm/pre_fault_memory_test.c
index 3082fe09b95fa..9588781fc5401 100644
--- a/tools/testing/selftests/kvm/pre_fault_memory_test.c
+++ b/tools/testing/selftests/kvm/pre_fault_memory_test.c
@@ -5,6 +5,9 @@
  * Author:
  * Isaku Yamahata <isaku.yamahata at gmail.com>
  */
+#include <asm/barrier.h>
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/sizes.h>
 
 #include <test_util.h>
@@ -17,6 +20,8 @@
 /* Arbitrarily chosen values */
 #define TEST_BASE_SIZE		SZ_2M
 #define TEST_SLOT		10
+/* Large enough for the entries every architecture reserves. */
+#define TEST_RING_SIZE		SZ_64K
 
 /* Storage of test info to share with guest code */
 struct test_config {
@@ -281,6 +286,102 @@ static void test_pre_fault_memory(unsigned long vm_type, enum vm_mem_backing_src
 	for_each_guest_mode(__test_pre_fault_memory, &p);
 }
 
+/*
+ * Pre-fault more dirty-logged pages than the ring holds: each call has to stop
+ * before the ring overflows, and no entry may be lost.
+ */
+static void test_pre_fault_dirty_ring(void)
+{
+	const u64 entries = TEST_RING_SIZE / sizeof(struct kvm_dirty_gfn);
+	const u64 npages = entries + entries / 4;
+	struct kvm_pre_fault_memory range, left;
+	struct kvm_dirty_gfn *gfns, *cur;
+	u64 harvested = 0, size;
+	struct kvm_vcpu *vcpu;
+	unsigned long *seen;
+	int ret, stops = 0;
+	struct kvm_vm *vm;
+	u32 fetch = 0;
+	gpa_t gpa;
+
+	if (!kvm_has_cap(KVM_CAP_DIRTY_LOG_RING) && !kvm_has_cap(KVM_CAP_DIRTY_LOG_RING_ACQ_REL)) {
+		pr_info("Skipping the dirty ring test: no dirty ring\n");
+		return;
+	}
+
+	vm = vm_create(1);
+	vm_enable_dirty_ring(vm, TEST_RING_SIZE);
+	vcpu = vm_vcpu_add(vm, 0, NULL);
+	gfns = vcpu_map_dirty_ring(vcpu);
+
+	/* A ring entry is a host page. */
+	size = npages * getpagesize();
+	gpa = align_down(vm->max_gfn * vm->page_size - size, SZ_2M);
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa, TEST_SLOT,
+				    vm_calc_num_guest_pages(vm->mode, size),
+				    KVM_MEM_LOG_DIRTY_PAGES);
+
+	/* Populate the pages, so that pre-faulting can map them writable. */
+	memset(addr_gpa2hva(vm, gpa), 1, size);
+
+	seen = bitmap_zalloc(npages);
+	TEST_ASSERT(seen, "Failed to allocate the bitmap of reported pages");
+
+	range = (struct kvm_pre_fault_memory) { .gpa = gpa, .size = size };
+	while (range.size) {
+		u64 n;
+
+		vcpu_ioctl(vcpu, KVM_PRE_FAULT_MEMORY, &range);
+
+		if (range.size) {
+			left = range;
+			ret = __vcpu_ioctl(vcpu, KVM_PRE_FAULT_MEMORY, &range);
+			TEST_ASSERT_VM_VCPU_IOCTL(ret == -1 && errno == ENOSPC,
+						  KVM_PRE_FAULT_MEMORY, ret, vm);
+			TEST_ASSERT(range.gpa == left.gpa && range.size == left.size,
+				    "KVM_PRE_FAULT_MEMORY made progress on a full ring");
+			stops++;
+		}
+
+		for (n = 0; ; n++) {
+			cur = &gfns[fetch % entries];
+			/* Pairs with the smp_wmb() in kvm_dirty_ring_push(). */
+			if (smp_load_acquire(&cur->flags) != KVM_DIRTY_GFN_F_DIRTY)
+				break;
+
+			TEST_ASSERT(cur->slot == TEST_SLOT && cur->offset < npages,
+				    "Ring entry %u: slot %u offset 0x%llx, expected slot %u offset < 0x%lx",
+				    fetch, cur->slot, cur->offset, TEST_SLOT, npages);
+			TEST_ASSERT(!__test_and_set_bit(cur->offset, seen),
+				    "Ring entry %u: offset 0x%llx reported twice",
+				    fetch, cur->offset);
+			/* Pairs with kvm_dirty_gfn_harvested()'s smp_load_acquire(). */
+			smp_store_release(&cur->flags, KVM_DIRTY_GFN_F_RESET);
+			fetch++;
+		}
+
+		/* A read pre-fault can map a page read-only, or access-tracked on x86. */
+		if (!n && !harvested && !range.size) {
+			pr_info("Skipping the dirty ring test: pre-faulting dirtied no pages\n");
+			bitmap_free(seen);
+			kvm_vm_free(vm);
+			return;
+		}
+		TEST_ASSERT(n, "KVM_PRE_FAULT_MEMORY pushed nothing to the ring");
+		TEST_ASSERT(kvm_vm_reset_dirty_ring(vm) == n,
+			    "KVM_RESET_DIRTY_RINGS didn't reset %lu entries", n);
+		harvested += n;
+	}
+
+	TEST_ASSERT(harvested == npages, "%lu ring entries for %lu pages", harvested, npages);
+	TEST_ASSERT(stops, "KVM_PRE_FAULT_MEMORY never stopped for a %lu-entry ring", entries);
+	pr_info("Pre-faulted %lu pages through a %lu-entry ring, stopping %d times\n",
+		npages, entries, stops);
+
+	bitmap_free(seen);
+	kvm_vm_free(vm);
+}
+
 static void help(char *name)
 {
 	puts("");
@@ -320,5 +421,6 @@ int main(int argc, char *argv[])
 	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, backing, false);
 	test_pre_fault_memory(KVM_X86_SW_PROTECTED_VM, backing, true);
 #endif
+	test_pre_fault_dirty_ring();
 	return 0;
 }
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
