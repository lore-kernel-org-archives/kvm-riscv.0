Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5614CD8CAD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5fBn5gVltRQRKup3gvOiPLVtfKfozdRzhD9Ir2fUrg=; b=gGEvcbW1HJppR7
	/UzGQGLrgSPYhGmbi+wRsMdVD5e3W700iGfl6xsKAf0YRPQuQ3IlBYCsDIMWSlIyOLbZuyj0h4qLJ
	G2eNlREmGjp4oj+7OD96ST8M+ffzQrCwgsmouaxfMvAqRVphu2TZW37wCMFGXHQRMrlAJY0mo1K/y
	A49c3lPsMnIc9Cjtr964t0MMkmhFUlc9VnvmcPkj0jAQNqG035hw7nh4j8swDkAQyKWfFB8AGDfbO
	qV1k7wywLsIhuEXk3cb1LQ7xJ+p9PAkJF4H6wN0IjEosmClOFbQ6FPXezPUqiNwJIB9wVCTLej0E8
	WupnkFhbrxDAo7xqqhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCH-00000003psn-1YWP;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC9-00000003pSS-0Rs2
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5E0962028C5;
	Mon,  8 Jun 2026 16:43:12 +0200 (CEST)
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
Subject: [PATCH 34/60] kvm: Keep track of plane VCPUs in struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:26 +0200
Message-ID: <20260608144252.351443-35-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074317_440760_5675D8B5 
X-CRM114-Status: GOOD (  11.72  )
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

Introduce an array which keeps track of per-plane VCPU instances for a
single VCPU index. This is a short-cut to not always tranverse the
xarrays on plane switches.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 6 ++++++
 virt/kvm/kvm_main.c      | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b8c3f8f11cb4..5c3f9dfa15ea 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -335,6 +335,8 @@ struct kvm_vcpu_common {
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
 
+	struct kvm_vcpu *vcpus[KVM_MAX_PLANES];
+
 	/* Locks */
 	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
 #ifdef CONFIG_PROVE_RCU
@@ -382,6 +384,10 @@ struct kvm_vcpu_common {
 	struct kvm_vcpu_arch_common arch;
 };
 
+#define vcpu_for_each_plane(common, i, v)			\
+	for ((i) = 0; (i) < KVM_MAX_PLANES; ++(i))		\
+		if (((v) = common->vcpus[(i)]) != NULL)
+
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8839f91fd15e..9d30fd85ce5f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -524,6 +524,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 static void kvm_vcpu_finish_common(struct kvm_vcpu *vcpu)
 {
+	WARN_ON(vcpu->common->vcpus[vcpu->plane_level] != NULL);
+	vcpu->common->vcpus[vcpu->plane_level] = vcpu;
 	smp_wmb();
 	if (vcpu->plane_level == 0) {
 		/*
@@ -555,6 +557,7 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 
 	vcpu->common = NULL;
 	vcpu->run = NULL;
+	common->vcpus[vcpu->plane_level] = NULL;
 
 	if (vcpu->plane_level != 0)
 	       return;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
