Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8073CD8C9D
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98CuSmy9i7jyMz83+Nicu7eW6ltu4vA1H2UuRHJx7m0=; b=nLCz+3q91sonGd
	5zP0g2cfMwMhtRz64Jz1Fn/hJKnax1Wjwta3gqg83rtEJUZL7SIyiRleeh1EwVuhryMkz9c4Fs1oW
	9JhYbdAHD1oZGWBlwFmlDZjraI/6h4hAyR4KByJlA1jycWyT4ReVT+JCCQ82J63do4dFqzXpoR6ap
	QilZCaIqXDO6eza8RPJrB18hwBZxV0v40YUUTsJpTWnNbYm3XTdCZ0TlSmABhSW0h0/bSuhL7E715
	lH5AmdTgQH0ge4dVuLLuAjnRl7bt6Zqgj6/Qnjzv2FyqnIzoqsPUFvRbwI1UhW8eEk3YM1uQ58xtn
	W4QFHkbcnehBAse7bjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCL-00000003q27-2CcY;
	Mon, 08 Jun 2026 14:43:29 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC7-00000003pST-10KB
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:21 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 67A2E2028BC;
	Mon,  8 Jun 2026 16:43:10 +0200 (CEST)
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
Subject: [PATCH 25/60] kvm: Move kvm_vcpu->dirty_ring to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:17 +0200
Message-ID: <20260608144252.351443-26-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074315_484029_E20D2F33 
X-CRM114-Status: GOOD (  13.46  )
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

From: Joerg Roedel <joerg.roedel@amd.com>

The dirty tracking should happen across all planes of a given VCPU, so
move the dirty_ring to struct kvm_vcpu_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  3 ++-
 virt/kvm/dirty_ring.c    |  4 ++--
 virt/kvm/kvm_main.c      | 22 ++++++++++------------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f6e8a0b653b3..7d06459a06f3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -373,6 +373,8 @@ struct kvm_vcpu_common {
 	bool preempted;
 	bool ready;
 	bool scheduled_out;
+
+	struct kvm_dirty_ring dirty_ring;
 };
 
 struct kvm_vcpu {
@@ -413,7 +415,6 @@ struct kvm_vcpu {
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
-	struct kvm_dirty_ring dirty_ring;
 
 	/*
 	 * The most recently used memslot by this vCPU and the slots generation
diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 572b854edf74..c6f46b93bddb 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -218,7 +218,7 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 
 void kvm_dirty_ring_push(struct kvm_vcpu *vcpu, u32 slot, u64 offset)
 {
-	struct kvm_dirty_ring *ring = &vcpu->dirty_ring;
+	struct kvm_dirty_ring *ring = &vcpu->common->dirty_ring;
 	struct kvm_dirty_gfn *entry;
 
 	/* It should never get full */
@@ -250,7 +250,7 @@ bool kvm_dirty_ring_check_request(struct kvm_vcpu *vcpu)
 	 * the dirty ring is reset by userspace.
 	 */
 	if (kvm_check_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu) &&
-	    kvm_dirty_ring_soft_full(&vcpu->dirty_ring)) {
+	    kvm_dirty_ring_soft_full(&vcpu->common->dirty_ring)) {
 		kvm_make_request(KVM_REQ_DIRTY_RING_SOFT_FULL, vcpu);
 		vcpu->run->exit_reason = KVM_EXIT_DIRTY_RING_FULL;
 		trace_kvm_dirty_ring_exit(vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 24ff8748a317..f85ddb0fc781 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -483,6 +483,13 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 	common->ready = false;
 	preempt_notifier_init(&common->preempt_notifier, &kvm_preempt_ops);
 
+	if (kvm->dirty_ring_size) {
+		r = kvm_dirty_ring_alloc(kvm, &common->dirty_ring,
+					 id, kvm->dirty_ring_size);
+		if (r)
+			goto out_drop_counter;
+	}
+
 	vcpu->common = no_free_ptr(common);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
@@ -547,6 +554,7 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	 * are already gone.
 	 */
 	put_pid(common->pid);
+	kvm_dirty_ring_free(&common->dirty_ring);
 	kfree(common);
 }
 
@@ -555,7 +563,6 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_arch_vcpu_destroy(vcpu);
 
 	kvm_vcpu_common_destroy(vcpu);
-	kvm_dirty_ring_free(&vcpu->dirty_ring);
 
 	free_page((unsigned long)vcpu->run);
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
@@ -4209,7 +4216,7 @@ static vm_fault_t kvm_vcpu_fault(struct vm_fault *vmf)
 #endif
 	else if (kvm_page_in_dirty_ring(vcpu->kvm, vmf->pgoff))
 		page = kvm_dirty_ring_get_page(
-		    &vcpu->dirty_ring,
+		    &vcpu->common->dirty_ring,
 		    vmf->pgoff - KVM_DIRTY_LOG_PAGE_OFFSET);
 	else
 		return kvm_arch_vcpu_fault(vcpu, vmf);
@@ -4338,13 +4345,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (r)
 		goto vcpu_free_run_page;
 
-	if (kvm->dirty_ring_size) {
-		r = kvm_dirty_ring_alloc(kvm, &vcpu->dirty_ring,
-					 id, kvm->dirty_ring_size);
-		if (r)
-			goto arch_vcpu_destroy;
-	}
-
 	mutex_lock(&kvm->lock);
 
 	if (kvm_get_vcpu_by_id(kvm, id)) {
@@ -4385,8 +4385,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	xa_erase(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
-	kvm_dirty_ring_free(&vcpu->dirty_ring);
-arch_vcpu_destroy:
 	kvm_arch_vcpu_destroy(vcpu);
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
@@ -5120,7 +5118,7 @@ static int kvm_vm_ioctl_reset_dirty_pages(struct kvm *kvm)
 	mutex_lock(&kvm->slots_lock);
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
-		r = kvm_dirty_ring_reset(vcpu->kvm, &vcpu->dirty_ring, &cleared);
+		r = kvm_dirty_ring_reset(vcpu->kvm, &vcpu->common->dirty_ring, &cleared);
 		if (r)
 			break;
 	}
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
