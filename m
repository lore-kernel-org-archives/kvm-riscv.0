Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CFFCD98C4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rCajin2MwLLXvs0OFewcULGGK9aWSoo+dGIu8e51IY=; b=sswZ4hCHGAMfoz
	woZZO1eqBe/pDJksJpHbKsW3e2B2UdAXZuZa9T+AT0cWP3loiLhZeiP+Lcv0wwNYgJgbKr2J/kOgB
	muuuTkPbSLfbcVK1FK0/TM1W1cnS9n6dLmGCTMKQeAKo7GhswuZdYX+ZgZkbaVvzwm0y8acBGrwsf
	ceGuAi1gh/wRpoyBxgWhWIEawuX5tHa5Rz/ggj182jTi5sS6Hz+MR0JWyqA12ub95HBUnmQg9uRk1
	TacXtCTYmacMjmWi9S8xh6rwlEvfQsLwSkxCXjCqzFeaTLnMYqYMfDCMYoCOWyDdC6FtOQ+a27CeU
	RpBaLutYtBTrsgs1xSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCS-00000003qGn-14zQ;
	Mon, 08 Jun 2026 14:43:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003ppx-2LGR
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e80JkIrfZWZ3YMBPZ5oKlNwxXaXsf4lP6bQEY3OIgEg=; b=O/UU4YhlT3/vc27aD1eL6PLTze
	CHBW49OgBESwUl6JShKUIirYfp+8QyFc6zyeDgV7vZ5ZvPK5AelUcWITzQaQODPeFNAlFy9jJU68O
	hRN2mRAxbDwXEb5io69PMUzBuZCWBCGTOYHkugsEEn889O72eEdpB2GcooPaQKrt335AEJGPpqTrN
	dxnFJu+yGfxTcnJQYZ5BOGdf1mirInsdXqxOjiGhyDB07bSX67jAH1+ZR9nDDDntf96MTkWqSidqE
	/t2ZH4uQ4U3MqqFGJxDCgM56QDOsCfDW7ElHMCIlg/zzgv4b0ERvN7QvB/6FyUtfsua9KfzZIYGZ6
	YFzGIzow==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCD-000000019BB-0Lua
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 6FCF12028D8;
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
Subject: [PATCH 53/60] kvm: x86: Introduce max_planes x86-op
Date: Mon,  8 Jun 2026 16:42:45 +0200
Message-ID: <20260608144252.351443-54-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154321_269850_BFB5AC96 
X-CRM114-Status: GOOD (  10.19  )
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

Allow x86 hardware backends to overwrite the number of supported
planes per VM type.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm-x86-ops.h | 1 +
 arch/x86/include/asm/kvm_host.h    | 2 ++
 arch/x86/kvm/svm/svm.c             | 1 +
 arch/x86/kvm/vmx/main.c            | 1 +
 arch/x86/kvm/x86.c                 | 8 +++++++-
 arch/x86/kvm/x86.h                 | 1 +
 6 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 207d56d12459..4f96090c04c9 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -152,6 +152,7 @@ KVM_X86_OP_OPTIONAL_RET0(gmem_max_mapping_level)
 KVM_X86_OP_OPTIONAL(gmem_invalidate)
 KVM_X86_OP(alloc_plane)
 KVM_X86_OP(free_plane)
+KVM_X86_OP(max_planes)
 #endif
 
 #undef KVM_X86_OP
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1b7aa48c961e..bfa0188d372f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2016,6 +2016,8 @@ struct kvm_x86_ops {
 
 	struct kvm_plane *(*alloc_plane)(void);
 	void (*free_plane)(struct kvm_plane *);
+
+	unsigned (*max_planes)(struct kvm *);
 };
 
 struct kvm_x86_nested_ops {
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 2a92d8d18d7c..99357de14034 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5448,6 +5448,7 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.alloc_plane = x86_alloc_plane,
 	.free_plane = x86_free_plane,
+	.max_planes = kvm_x86_default_max_planes,
 };
 
 /*
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index a2fc4eeeca1d..572921bdfb32 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1034,6 +1034,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 
 	.alloc_plane = x86_alloc_plane,
 	.free_plane = x86_free_plane,
+	.max_planes = kvm_x86_default_max_planes,
 };
 
 struct kvm_x86_init_ops vt_init_ops __initdata = {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 60b34bd4da9d..c6910356b061 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -482,10 +482,16 @@ static u32 msr_based_features[ARRAY_SIZE(msr_based_features_all_except_vmx) +
 			      (KVM_LAST_EMULATED_VMX_MSR - KVM_FIRST_EMULATED_VMX_MSR + 1)];
 static unsigned int num_msr_based_features;
 
-unsigned kvm_arch_max_planes(struct kvm *kvm)
+unsigned kvm_x86_default_max_planes(struct kvm *kvm)
 {
 	return 1;
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_x86_default_max_planes);
+
+unsigned kvm_arch_max_planes(struct kvm *kvm)
+{
+	return kvm_x86_call(max_planes)(kvm);
+}
 
 struct kvm_plane *x86_alloc_plane(void)
 {
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 812bd6004a4c..ff57ba568031 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -800,5 +800,6 @@ static inline bool kvm_is_valid_u_s_cet(struct kvm_vcpu *vcpu, u64 data)
 
 struct kvm_plane *x86_alloc_plane(void);
 void x86_free_plane(struct kvm_plane *plane);
+unsigned kvm_x86_default_max_planes(struct kvm *kvm);
 
 #endif
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
