Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0F4CD8CAA
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWT36Rd2pFwY/Itd4pUjljzZ4IJ9GFUiEFrt6+Nb0mc=; b=ouQ3fEUm2HT64A
	o8z/koZBPAuqFANG7n7Hu6CISDz/DjdvpHF+0FbqWa9ExiWZiClOtUqFrqVmYK2EGZ/zxaHpaYIjC
	/l4SsALRWuLs45MCEVS7jnHEtFsUviAnGoutVjWhClbrx+/N3D7LaH6/GRQ1NdwcWiGUBfLErLHZu
	E8VDlMcV7vAByamKB0hKHaQ8Nf56vam/lLub1aQp3N7HX2UAQ4DuxOyhsw6jv7QNhSd0nRcQLUS0J
	rbKxaiL2pvPn9Wwi/Por0pAj/MDaANW+8kdozvu8ouCIbNkFgmcBTLy1NF43iaxe+EVGontjT+Gyu
	5MNxCs2gDLebaymD9cLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCQ-00000003qDc-2Gip;
	Mon, 08 Jun 2026 14:43:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003ppw-2Orc
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jDGfPEEE+GfImF6BMhy60GIEtP+1f8zKD1+ZKs6XQMg=; b=PmACFSk5gkVLvtMb8UJimgTGeE
	BvNNKHwnTrLiWddDqXDiQm1YbtzjhCYbbcnDrqsCM1d1gR8ZOP58lqMxcAkcEt24ELQULEFXu3ZHJ
	BKj4PZGpD0ys5Q3gPfWg/6918l49Jm6+MLLWKQLjOjnZFmb6ccvbSeW1jpPSBTquIq+O6H8UQUupw
	dTgn7HRdmX2MvfEM9Fry+Tr3xGueLR8XYHP44phC2GiaT/VO/kA0T8FN82bBjI3SD/2MLcaZzBBQN
	MFsHziUSgsm9Epf7Z40C43M1AIARyUKPt27EJxTch1RhSRMc7Jm1gtSNQaKxAliAGwhUxYtJ+xfsV
	/vEENXhw==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCC-000000019AQ-3XoL
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3B9172028D7;
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
Subject: [PATCH 52/60] kvm: x86: Switch to plane0 if it has events
Date: Mon,  8 Jun 2026 16:42:44 +0200
Message-ID: <20260608144252.351443-53-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154321_098397_0BCAC625 
X-CRM114-Status: GOOD (  11.05  )
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

When there are IRQs or events pending for plane0, make sure it can
handle it.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/x86.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 08fe65b8d57d..60b34bd4da9d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10962,6 +10962,20 @@ static int kvm_check_and_inject_events(struct kvm_vcpu *vcpu,
 	return r;
 }
 
+static inline bool kvm_check_plane0_events(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu *vcpu_plane0;
+
+	if (vcpu->plane_level == 0)
+		return false;
+
+	vcpu_plane0 = vcpu->common->vcpus[0];
+
+	return kvm_cpu_has_injectable_intr(vcpu_plane0) ||
+		vcpu_plane0->arch.nmi_pending ||
+		vcpu_plane0->arch.smi_pending;
+}
+
 static void process_nmi(struct kvm_vcpu *vcpu)
 {
 	unsigned int limit;
@@ -11410,12 +11424,19 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				goto out;
 			}
 		}
+	}
 
-		if (kvm_check_request(KVM_REQ_PLANE_RESCHED, vcpu)) {
-			vcpu->common->plane_switch = true;
-			r = 0;
-			goto out;
-		}
+	if (kvm_check_plane0_events(vcpu)) {
+		kvm_vcpu_set_plane_runnable(vcpu->common->vcpus[0]);
+
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+		kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+	}
+
+	if (kvm_check_request(KVM_REQ_PLANE_RESCHED, vcpu)) {
+		vcpu->common->plane_switch = true;
+		r = 0;
+		goto out;
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
@@ -11737,6 +11758,9 @@ bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (kvm_test_request(KVM_REQ_UPDATE_PROTECTED_GUEST_STATE, vcpu))
 		return true;
 
+	if (kvm_test_request(KVM_REQ_PLANE_RESCHED, vcpu))
+		return true;
+
 	if (kvm_arch_interrupt_allowed(vcpu) && kvm_cpu_has_interrupt(vcpu))
 		return true;
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
