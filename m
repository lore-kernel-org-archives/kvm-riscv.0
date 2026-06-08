Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC85CD8C9D
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXnut7lSBlHMOcNmBIy/DvH3GZLgP1j6kTgUfT7gdEo=; b=vVuJtvOEnol6ro
	q58LTxr6uQvGhfh6MkRXSsvvcx04jkzuRZZokioXe81VcRlrzYoWYulZ5h9tySXCnBxwJeX0Sg/Eu
	TPTY5zcEJxDOrqjgob12aqSCo74VcBsReBBkdw5DynYfRFBL/fBKheRgEnwC+KpjBmhJ8DdnbCZ0E
	K07f3pqpRXmttRjEsbWSaW/x71uVdHRBUzz1vn07k9OPrT1tybvn/epNb2OhN0wfPpsYTQbYFiFal
	RvZjf+lr8Z/aurV1pje1h8Yn4AjtmdrCQzLHh/Vi+HgmC63W9sjzud407HMLRrz/mGvgi7XIm6wxr
	vTlBvhcHt51AYWjcartg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCE-00000003pmv-1AzH;
	Mon, 08 Jun 2026 14:43:22 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC6-00000003pTL-42DF
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id F24592028B9;
	Mon,  8 Jun 2026 16:43:09 +0200 (CEST)
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
Subject: [PATCH 23/60] kvm: Move kvm_vcpu sigset members to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:15 +0200
Message-ID: <20260608144252.351443-24-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074315_210354_9B6F9ADA 
X-CRM114-Status: GOOD (  12.32  )
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

These are the same across all planes for one VCPU, so make then
shared.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  4 ++--
 virt/kvm/kvm_main.c      | 18 ++++++++++++------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 73786712495d..9220c452aa3a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -348,6 +348,8 @@ struct kvm_vcpu_common {
 
 	struct pid *pid;
 	rwlock_t pid_lock;
+	int sigset_active;
+	sigset_t sigset;
 
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
@@ -371,8 +373,6 @@ struct kvm_vcpu {
 
 	struct kvm_run *run;
 
-	int sigset_active;
-	sigset_t sigset;
 	unsigned int halt_poll_ns;
 
 	u64 plane_requests;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index af3c4e0081b8..1858880ee3d3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3694,7 +3694,9 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_mark_page_dirty);
 
 void kvm_sigset_activate(struct kvm_vcpu *vcpu)
 {
-	if (!vcpu->sigset_active)
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	if (!common->sigset_active)
 		return;
 
 	/*
@@ -3703,12 +3705,14 @@ void kvm_sigset_activate(struct kvm_vcpu *vcpu)
 	 * ->real_blocked don't care as long ->real_blocked is always a subset
 	 * of ->blocked.
 	 */
-	sigprocmask(SIG_SETMASK, &vcpu->sigset, &current->real_blocked);
+	sigprocmask(SIG_SETMASK, &common->sigset, &current->real_blocked);
 }
 
 void kvm_sigset_deactivate(struct kvm_vcpu *vcpu)
 {
-	if (!vcpu->sigset_active)
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	if (!common->sigset_active)
 		return;
 
 	sigprocmask(SIG_SETMASK, &current->real_blocked, NULL);
@@ -4391,12 +4395,14 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 
 static int kvm_vcpu_ioctl_set_sigmask(struct kvm_vcpu *vcpu, sigset_t *sigset)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
+
 	if (sigset) {
 		sigdelsetmask(sigset, sigmask(SIGKILL)|sigmask(SIGSTOP));
-		vcpu->sigset_active = 1;
-		vcpu->sigset = *sigset;
+		common->sigset_active = 1;
+		common->sigset = *sigset;
 	} else
-		vcpu->sigset_active = 0;
+		common->sigset_active = 0;
 	return 0;
 }
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
