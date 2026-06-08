Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B4ACD8C9F
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x2Qk68CoD5TfQtddbSUF9Ze+EfvfGgepHVgn761uN6U=; b=B/Ul9eXajWU2hL
	BwdUZorxPkuB6vtEyHr85MzRtk5KB5ZUbBxOzreAUdsIpWg9WDcHJ3qL3rw04VTTJB1I+KVGcK/0w
	e7xXlJVIUf+tUMxXaIqDVomTUDJNSzBCH0q09F8yPUMtUhALoY4gneat9r6+zXcxf4VOqKXLeo8cx
	NZAKvSilzTJgQLb/JxCDp5kh8W3aLA+eJZnwqcwbp8Y5gAW06p/SVKapdLqRPHZ1VT69HJIhhO0GM
	31H/64goMemiyUPj91FUU9Rzl1x5L+JXoYChYU+n8/wCurhfYfyfgalTT0dJUOnegXVbSl+5gyIt+
	SWtUU/PiokWjIAdmkbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC9-00000003pbs-03je;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC4-00000003pTK-3O5T
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:14 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 255222028AD;
	Mon,  8 Jun 2026 16:43:07 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 10/60] kvm: Move vcpu_array to struct kvm_plane
Date: Mon,  8 Jun 2026 16:42:02 +0200
Message-ID: <20260608144252.351443-11-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074313_013365_5B060DB9 
X-CRM114-Status: GOOD (  15.92  )
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

From: Paolo Bonzini <pbonzini@redhat.com>

Each plane will have its own set of VCPUs, so move the vcpu_array to
the plane structure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 30 +++++++++++++++++++++---------
 virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++--------
 2 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5be4c9f118b4..5a72f73a2f31 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -324,12 +324,14 @@ struct kvm_mmio_fragment {
 
 struct kvm_vcpu {
 	struct kvm *kvm;
+	struct kvm_plane *plane;
+
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
 #endif
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
-	int vcpu_idx; /* index into kvm->vcpu_array */
+	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
 	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
 #ifdef CONFIG_PROVE_RCU
 	int srcu_depth;
@@ -770,6 +772,9 @@ struct kvm_memslots {
 struct kvm_plane {
 	struct kvm *kvm;
 	unsigned level;
+
+	/* Per-Plane VCPU array */
+	struct xarray vcpu_array;
 };
 
 struct kvm {
@@ -795,7 +800,6 @@ struct kvm {
 	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
 	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
-	struct xarray vcpu_array;
 	/*
 	 * Protected by slots_lock, but can be read outside if an
 	 * incorrect answer is acceptable.
@@ -996,9 +1000,9 @@ static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 					 lockdep_is_held(&kvm->slots_lock));
 }
 
-static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+static inline struct kvm_vcpu *plane_get_vcpu(struct kvm_plane *plane, int i)
 {
-	int num_vcpus = atomic_read(&kvm->online_vcpus);
+	int num_vcpus = atomic_read(&plane->kvm->online_vcpus);
 
 	/*
 	 * Explicitly verify the target vCPU is online, as the anti-speculation
@@ -1012,13 +1016,21 @@ static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
 
 	/* Pairs with smp_wmb() in kvm_vm_ioctl_create_vcpu.  */
 	smp_rmb();
-	return xa_load(&kvm->vcpu_array, i);
+	return xa_load(&plane->vcpu_array, i);
 }
 
-#define kvm_for_each_vcpu(idx, vcpup, kvm)				\
-	if (atomic_read(&kvm->online_vcpus))				\
-		xa_for_each_range(&kvm->vcpu_array, idx, vcpup, 0,	\
-				  (atomic_read(&kvm->online_vcpus) - 1))
+static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
+{
+	return plane_get_vcpu(kvm->planes[0], i);
+}
+
+#define plane_for_each_vcpu(idx, vcpup, plane)					\
+	if (atomic_read(&plane->kvm->online_vcpus))				\
+		xa_for_each_range(&plane->vcpu_array, idx, vcpup, 0,		\
+				  (atomic_read(&plane->kvm->online_vcpus) - 1))
+
+#define kvm_for_each_vcpu(idx, vcpup, kvm)					\
+	plane_for_each_vcpu(idx, vcpup, kvm->planes[0])
 
 static inline struct kvm_vcpu *kvm_get_vcpu_by_id(struct kvm *kvm, int id)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a68469c6d12e..668645dd3945 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -443,6 +443,7 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	mutex_init(&vcpu->mutex);
 	vcpu->cpu = -1;
 	vcpu->kvm = kvm;
+	vcpu->plane = kvm->planes[0];
 	vcpu->vcpu_id = id;
 	vcpu->pid = NULL;
 	rwlock_init(&vcpu->pid_lock);
@@ -479,14 +480,14 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 }
 
-void kvm_destroy_vcpus(struct kvm *kvm)
+static void plane_destroy_vcpus(struct kvm_plane *plane)
 {
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
 
-	kvm_for_each_vcpu(i, vcpu, kvm) {
+	plane_for_each_vcpu(i, vcpu, plane) {
 		kvm_vcpu_destroy(vcpu);
-		xa_erase(&kvm->vcpu_array, i);
+		xa_erase(&plane->vcpu_array, i);
 
 		/*
 		 * Assert that the vCPU isn't visible in any way, to ensure KVM
@@ -494,7 +495,22 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 		 * in VM-wide request, e.g. to flush remote TLBs when tearing
 		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
 		 */
-		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
+		WARN_ON_ONCE(xa_load(&plane->vcpu_array, i) || plane_get_vcpu(plane, i));
+	}
+
+}
+
+void kvm_destroy_vcpus(struct kvm *kvm)
+{
+	unsigned lvl;
+
+	for (lvl = KVM_MAX_PLANES; lvl > 0; lvl--) {
+		struct kvm_plane *plane = kvm->planes[lvl - 1];
+
+		if (plane == NULL)
+			continue;
+
+		plane_destroy_vcpus(plane);
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
@@ -1105,6 +1121,8 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 	plane->kvm = kvm;
 	plane->level = plane_level;
 
+	xa_init(&plane->vcpu_array);
+
 	kvm->planes[plane_level] = plane;
 
 	return plane;
@@ -1146,7 +1164,6 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	mutex_init(&kvm->slots_arch_lock);
 	spin_lock_init(&kvm->mn_invalidate_lock);
 	rcuwait_init(&kvm->mn_memslots_update_rcuwait);
-	xa_init(&kvm->vcpu_array);
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	xa_init(&kvm->mem_attr_array);
 #endif
@@ -4039,7 +4056,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 		if (idx == me->vcpu_idx)
 			continue;
 
-		vcpu = xa_load(&kvm->vcpu_array, idx);
+		vcpu = xa_load(&kvm->planes[0]->vcpu_array, idx);
 		if (!READ_ONCE(vcpu->ready))
 			continue;
 		if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
@@ -4258,7 +4275,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	}
 
 	vcpu->vcpu_idx = atomic_read(&kvm->online_vcpus);
-	r = xa_insert(&kvm->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
+	r = xa_insert(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx, vcpu, GFP_KERNEL_ACCOUNT);
 	WARN_ON_ONCE(r == -EBUSY);
 	if (r)
 		goto unlock_vcpu_destroy;
@@ -4293,7 +4310,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 kvm_put_xa_erase:
 	mutex_unlock(&vcpu->mutex);
 	kvm_put_kvm_no_destroy(kvm);
-	xa_erase(&kvm->vcpu_array, vcpu->vcpu_idx);
+	xa_erase(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
