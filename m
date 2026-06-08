Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA22CD98D1
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkDU3PUcdo+byA89Z6mT2JfeHx1FBOZcaMDJbYqr338=; b=BLx4WVkf/HUOl9
	sWseJ+x1KVbeaWY52umTS9tjkXC3sFW/COSK9PBRx71YoqiVd2ESTWIKJhdAg1BcOesvwsAkvm5j5
	LQeAW9Idl85RsnirpiJyyIMFuqdza/HXTCo4UIEE8KPvGzZmW4tGoXfvhN0KXwfQCpky7ZwS+N7J9
	otB25jE1hRmNsLcsKG8QezDEgFRXWNLq8kqJrswwiNSOVVwc3M808phwv2itGXVRbyyMG7annsI3U
	KpKcyEh6awRLzElYruxoSX3hI852G4P6ksQsMbAcIT3+wStq8+B0MhGWjKsVpcNlBgaErh8WG5XLV
	+9Zh3u856C4ndXN+8F8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCQ-00000003qD9-106B;
	Mon, 08 Jun 2026 14:43:34 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003pTt-3NPE
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 94CCC2028D4;
	Mon,  8 Jun 2026 16:43:15 +0200 (CEST)
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
Subject: [PATCH 49/60] kvm: x86: Allow hardware backend to overwrite struct kvm_plane allocation
Date: Mon,  8 Jun 2026 16:42:41 +0200
Message-ID: <20260608144252.351443-50-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074321_045378_91F64905 
X-CRM114-Status: GOOD (  11.15  )
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

Allow the hardware backend implementations to allocate the struct
kvm_plane instances so that they can carry hardware specific
information along them.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  2 ++
 arch/x86/include/asm/kvm_host.h    |  3 +++
 arch/x86/kvm/svm/svm.c             |  3 +++
 arch/x86/kvm/vmx/main.c            |  5 ++++-
 arch/x86/kvm/x86.c                 | 16 ++++++++++++++--
 arch/x86/kvm/x86.h                 |  4 ++++
 6 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index c8bff1e9325e..207d56d12459 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -150,6 +150,8 @@ KVM_X86_OP_OPTIONAL(alloc_apic_backing_page)
 KVM_X86_OP_OPTIONAL_RET0(gmem_prepare)
 KVM_X86_OP_OPTIONAL_RET0(gmem_max_mapping_level)
 KVM_X86_OP_OPTIONAL(gmem_invalidate)
+KVM_X86_OP(alloc_plane)
+KVM_X86_OP(free_plane)
 #endif
 
 #undef KVM_X86_OP
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index c2651774d785..0955097aca9c 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2011,6 +2011,9 @@ struct kvm_x86_ops {
 	int (*gmem_prepare)(struct kvm *kvm, kvm_pfn_t pfn, gfn_t gfn, int max_order);
 	void (*gmem_invalidate)(kvm_pfn_t start, kvm_pfn_t end);
 	int (*gmem_max_mapping_level)(struct kvm *kvm, kvm_pfn_t pfn, bool is_private);
+
+	struct kvm_plane *(*alloc_plane)(void);
+	void (*free_plane)(struct kvm_plane *);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0b57dde29e40..2a92d8d18d7c 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5445,6 +5445,9 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 	.gmem_prepare = sev_gmem_prepare,
 	.gmem_invalidate = sev_gmem_invalidate,
 	.gmem_max_mapping_level = sev_gmem_max_mapping_level,
+
+	.alloc_plane = x86_alloc_plane,
+	.free_plane = x86_free_plane,
 };
 
 /*
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index f9c4703dda54..a2fc4eeeca1d 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1030,7 +1030,10 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.vcpu_mem_enc_ioctl = vt_op_tdx_only(vcpu_mem_enc_ioctl),
 	.vcpu_mem_enc_unlocked_ioctl = vt_op_tdx_only(vcpu_mem_enc_unlocked_ioctl),
 
-	.gmem_max_mapping_level = vt_op_tdx_only(gmem_max_mapping_level)
+	.gmem_max_mapping_level = vt_op_tdx_only(gmem_max_mapping_level),
+
+	.alloc_plane = x86_alloc_plane,
+	.free_plane = x86_free_plane,
 };
 
 struct kvm_x86_init_ops vt_init_ops __initdata = {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b9828cd31136..5f48392d4738 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -487,18 +487,30 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
-struct kvm_plane *kvm_alloc_plane(void)
+struct kvm_plane *x86_alloc_plane(void)
 {
 	/* For better type checking, do not return kzalloc() value directly */
 	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
 
 	return plane;
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(x86_alloc_plane);
 
-void kvm_free_plane(struct kvm_plane *plane)
+void x86_free_plane(struct kvm_plane *plane)
 {
 	kfree(plane);
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(x86_free_plane);
+
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	return kvm_x86_call(alloc_plane)();
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kvm_x86_call(free_plane)(plane);
+}
 
 /*
  * All feature MSRs except uCode revID, which tracks the currently loaded uCode
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 38a905fa86de..812bd6004a4c 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -797,4 +797,8 @@ static inline bool kvm_is_valid_u_s_cet(struct kvm_vcpu *vcpu, u64 data)
 
 	return true;
 }
+
+struct kvm_plane *x86_alloc_plane(void);
+void x86_free_plane(struct kvm_plane *plane);
+
 #endif
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
