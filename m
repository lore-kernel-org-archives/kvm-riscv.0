Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C87CD98C9
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VWdZ0pZ/MFzMLZCk2MJyRrzX7NYhYGA3FAUgNZYfSFM=; b=FC2kKGdcBLzrPE
	Ewt0nH5VX/JNF505S6sx80EAQdMO9RRzZ+x4A/XdeOitGU4rBl+KeH3b+xNPj1zqqUcoYgEpVyIwQ
	47RTVafCSgbSCWw79mMmyfs8ymhW3ftipjKh1o4bzLkAzmb9fMC/Sx9WhAPLHii1Ji0ZPiJ1XoRTf
	TgWTeBjKrPCPc3UaqhL4dBPc8Tnu8qxHuiMJUiRcdi4vKANGlM7coWOpUf7pWuCzAFyvYOlYaefje
	Q7LpgmZgHv4gCv7kYyLWRhjXK11zOgCZemUC69mjOz6b4KXHZGK5T06YKrvstpOmOsq8/SOTbXBFU
	t5Hi9Lfic2tDUW4uF/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q2u-04DU;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCD-00000003pkg-3jfi
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a88BMcsT0/Qb7iogK9L3bwkMtRQzl9J5097Gytot2S4=; b=R/9V71w1jkKiGAIVIrXFmBc2Zk
	IiHdnlqU/G+sZsobFXscMOrn4lpAkZnOnMGCHDXAQeLfj25IWFrQj0tc+GNYLBxCFjD3ZbhdABx5p
	ocJ2gpRAXehbIEHbPjFikDzeeUt+qwRDts/a/koOWa0uvb5I3PSyhT8AguqAnh6r4A8izcdJC5np3
	4UscZ0MJZzWHg96rLL1+o8e2Mb6FIAw+86c7YTo2XvIqWNDgrOMrc/b6yTJAqcEykhOshZv2mJA6S
	jYx5gSB9gT2JWABnbrUJwQW39SQC6b3FQZoNy2RH1IfPm0eFkL42c+6aXKCPAQ/MZEtDup2G8Dwxs
	NtH4ICUQ==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC9-000000019B2-0Tr4
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E8B912028C3;
	Mon,  8 Jun 2026 16:43:11 +0200 (CEST)
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
Subject: [PATCH 32/60] kvm: Allocate struct kvm_run only for struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:24 +0200
Message-ID: <20260608144252.351443-33-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154318_567706_B297B8EA 
X-CRM114-Status: GOOD (  13.88  )
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

Share the struct kvm_run across all planes for one VCPU id.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  3 +++
 virt/kvm/kvm_main.c      | 29 ++++++++++++++++-------------
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 55e3e9046975..385e1ee8fd3a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -327,6 +327,9 @@ struct kvm_mmio_fragment {
 struct kvm_vcpu_common {
 	struct kvm *kvm;
 
+	/* kvm_run struct shared across all planes */
+	struct kvm_run *run;
+
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
 
 	/* Currently active VCPU */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4f2c8f46a0d3..2d0d5f4fd356 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -441,6 +441,7 @@ void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
 static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned long id)
 {
 	struct kvm_vcpu_common *common __free(kfree) = kzalloc(sizeof(*common), GFP_KERNEL_ACCOUNT);
+	struct page *page;
 	int r;
 
 	/*
@@ -466,6 +467,14 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	common->vcpu_idx = atomic_read(&kvm->online_vcpus);
 
+	BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
+	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	if (!page) {
+		r = -ENOMEM;
+		goto out_drop_counter;
+	}
+	common->run = page_address(page);
+
 	mutex_init(&common->mutex);
 
 #ifndef __KVM_HAVE_ARCH_WQP
@@ -487,7 +496,7 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 		r = kvm_dirty_ring_alloc(kvm, &common->dirty_ring,
 					 id, kvm->dirty_ring_size);
 		if (r)
-			goto out_drop_counter;
+			goto out_free_run;
 	}
 
 	r = kvm_arch_vcpu_common_init(common);
@@ -503,6 +512,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 out_free_dirty_ring:
 	kvm_dirty_ring_free(&common->dirty_ring);
+out_free_run:
+	free_page((unsigned long)common->run);
 out_drop_counter:
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
@@ -546,6 +557,7 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	struct kvm *kvm = common->kvm;
 
 	vcpu->common = NULL;
+	vcpu->run = NULL;
 
 	if (vcpu->plane_level != 0)
 	       return;
@@ -563,6 +575,7 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	 */
 	put_pid(common->pid);
 	kvm_dirty_ring_free(&common->dirty_ring);
+	free_page((unsigned long)common->run);
 	kfree(common);
 }
 
@@ -4337,7 +4350,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 {
 	int r = -EINVAL;
 	struct kvm_vcpu *vcpu;
-	struct page *page;
 
 	mutex_lock(&kvm->lock);
 	if (kvm->created_vcpus >= kvm->max_vcpus) {
@@ -4359,20 +4371,13 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 		goto vcpu_free;
 
 	vcpu->vcpu_idx = vcpu->common->vcpu_idx;
-
-	BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
-	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!page) {
-		r = -ENOMEM;
-		goto vcpu_free_common;
-	}
-	vcpu->run = page_address(page);
+	vcpu->run = vcpu->common->run;
 
 	kvm_vcpu_init(vcpu, kvm, id);
 
 	r = kvm_arch_vcpu_create(vcpu);
 	if (r)
-		goto vcpu_free_run_page;
+		goto vcpu_free_common;
 
 	mutex_lock(&kvm->lock);
 
@@ -4415,8 +4420,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
 	kvm_arch_vcpu_destroy(vcpu);
-vcpu_free_run_page:
-	free_page((unsigned long)vcpu->run);
 vcpu_free_common:
 	kvm_vcpu_common_destroy(vcpu);
 vcpu_free:
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
