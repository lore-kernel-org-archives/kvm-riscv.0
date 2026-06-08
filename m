Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11329CD8CBD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0+Ft5ZVuVSjCWo2mnK4MivcZsiHpewj/Zlhx3WDW+Y=; b=QUF/QQExVSn4XC
	UaxjWhxzhOTrnIOgMORa/K6A9ytSCyaAjWvMkdoldTDTS8rx7vntbOUDKNUAkFb7T6OeDei1hg8Dm
	g+Fn7yYox59mpCgEUyBNL1NRLXCgiRX0ldqXKGWdEzyFZD3JS1g2RJugCbxyHCar+eW1OtVevOxkp
	Il+oH5kGiuvAPIGO//+b1sSovgB2+QFjRPFAgl4fhVZJ5d8fl7mm8SxmxBlMsgUpc/GKPJZcNDrKU
	B5qM2tWbYhtpGCb3swIfg5ODsFS2ee7TVMbcG748H3QJnIKK37okyM5+vY/DQhFjyKsEPMwbITaIG
	V7bXy6FrUFPZ2NX6ukBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCT-00000003qJM-0hIE;
	Mon, 08 Jun 2026 14:43:37 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCD-00000003pSK-0UwF
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 072512028D6;
	Mon,  8 Jun 2026 16:43:16 +0200 (CEST)
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
Subject: [PATCH 51/60] kvm: x86: Share pio_data across planes
Date: Mon,  8 Jun 2026 16:42:43 +0200
Message-ID: <20260608144252.351443-52-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074321_470895_43861712 
X-CRM114-Status: GOOD (  14.65  )
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

The vcpu->arch.pio_data pointer is memory mapped to user-space
alongside the kvm_run page. So it also needs to be common across all
planes for a given VCPU index.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h |  2 ++
 arch/x86/kvm/x86.c              | 20 +++++++++++---------
 virt/kvm/kvm_main.c             |  2 +-
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0327b77e56b7..1b7aa48c961e 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -801,6 +801,8 @@ struct kvm_vcpu_arch_common {
 	bool cpuid_dynamic_bits_dirty;
 	bool is_amd_compatible;
 
+	void *pio_data;
+
 	/*
 	 * cpu_caps holds the effective guest capabilities, i.e. the features
 	 * the vCPU is allowed to use.  Typically, but not always, features can
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5f48392d4738..08fe65b8d57d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8532,7 +8532,7 @@ static int emulator_pio_in_out(struct kvm_vcpu *vcpu, int size,
 }
 
 static int emulator_pio_in(struct kvm_vcpu *vcpu, int size,
-      			   unsigned short port, void *val, unsigned int count)
+			   unsigned short port, void *val, unsigned int count)
 {
 	int r = emulator_pio_in_out(vcpu, size, port, val, count, true);
 	if (r)
@@ -12936,7 +12936,6 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
-	struct page *page;
 	int r;
 
 	vcpu->arch.last_vmentry_cpu = -1;
@@ -12960,10 +12959,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	r = -ENOMEM;
 
-	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!page)
-		goto fail_free_lapic;
-	vcpu->arch.pio_data = page_address(page);
+	vcpu->arch.pio_data = vcpu->common->arch.pio_data;
 
 	vcpu->arch.mce_banks = kcalloc(KVM_MAX_MCE_BANKS * 4, sizeof(u64),
 				       GFP_KERNEL_ACCOUNT);
@@ -13023,8 +13019,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 fail_free_mce_banks:
 	kfree(vcpu->arch.mce_banks);
 	kfree(vcpu->arch.mci_ctl2_banks);
-	free_page((unsigned long)vcpu->arch.pio_data);
-fail_free_lapic:
 	kvm_free_lapic(vcpu);
 fail_mmu_destroy:
 	kvm_mmu_destroy(vcpu);
@@ -13072,16 +13066,24 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	idx = srcu_read_lock(&vcpu->kvm->srcu);
 	kvm_mmu_destroy(vcpu);
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
-	free_page((unsigned long)vcpu->arch.pio_data);
 }
 
 int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common)
 {
+	struct page *page;
+
+	page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	if (!page)
+		return -ENOMEM;
+
+	common->arch.pio_data = page_address(page);
+
 	return 0;
 }
 
 void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common)
 {
+	free_page((unsigned long)common->arch.pio_data);
 	kvfree(common->arch.cpuid_entries);
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a6d7601c3412..8f1a16af519a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4250,7 +4250,7 @@ static vm_fault_t kvm_vcpu_fault(struct vm_fault *vmf)
 		page = virt_to_page(vcpu->run);
 #ifdef CONFIG_X86
 	else if (vmf->pgoff == KVM_PIO_PAGE_OFFSET)
-		page = virt_to_page(vcpu->arch.pio_data);
+		page = virt_to_page(vcpu->common->arch.pio_data);
 #endif
 #ifdef CONFIG_KVM_MMIO
 	else if (vmf->pgoff == KVM_COALESCED_MMIO_PAGE_OFFSET)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
