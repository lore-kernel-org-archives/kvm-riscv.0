Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C149CD98CF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbDIYY3XStsTcnJiLoIctXilIod2+P4tGUsI5yVQB/U=; b=Jb9DV0YhCYYv5u
	Ll/MYcW+Pb1TldHEHP9CFesh8WKXHPbNInCVVeR1GfGq22jlHpg3UXWl7aink6VeOqSqMdOlcRmFz
	BCDU+goeXQYJLlyKBOWK+4wMHzsOu9YuuYlLlyqJ1NjPcyDnRM3gR4lCeBouh3iv8qkm4QAcRDTYm
	xJdc+USe9PFgpq2TkpngQNcw2FiByvoQRljvNrpjyIpoefDOHryksuyDXOLY+8GXWhzhhhrJnaox0
	O0kOHJAvzPMK724JpWCZVOdv+RRM3hTx3XeigxY9mXqEH7nYh38BHvkXFWjJSHnCGtnLv4IXKWDJ5
	x+E7bPj2mQRbsNq7myyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCN-00000003q7c-3xHh;
	Mon, 08 Jun 2026 14:43:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCF-00000003pmo-09ja
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QLQl4mcTCJJkecYSh/tVe4nXOxB6DsGl6T6pB2ut37k=; b=U54q58Uxhqj322qvj1RrAEMxvf
	6La7qfukh1YxHE10RM25v4h22ZNqSB6EnyP8OgvdULpZgt9+yfWsoyGm0xlzVrjSloD6Wpjtjo945
	x2Q4AiCFoPdCCdfxGa/Embd+kCi81HT6oj9rVkydd33tNKr/3kJZbBSsW4UgDbRdSQbWTzafuWrOx
	FXUlMmNuQXZCJgqO2m+TyZoalNzubBtKATGVAzWTW0fDxlLwgLbKULY8+V8yPxLsWbCfTBG2guOCT
	1cgXkv/MKXRr0ccXWWI8f7vit1UJN/H0n0A8cSpt2y5Kls3fCcATsstsxEXFOtv5oZErfjFMd6HJJ
	AQjN80QA==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCB-00000001991-39rB
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:21 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2E2042028D2;
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
Subject: [PATCH 47/60] kvm: x86: Select a plane to run
Date: Mon,  8 Jun 2026 16:42:39 +0200
Message-ID: <20260608144252.351443-48-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154320_021411_F07CF856 
X-CRM114-Status: GOOD (  11.78  )
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

In the KVM_RUN path, select a runnable VCPU plane and use it to enter
the guest. Also handle KVM_REQ_PLANE_RESCHED events to switch planes
without exiting to user-space.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/x86.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7e94a378b3d2..b9828cd31136 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11398,6 +11398,12 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				goto out;
 			}
 		}
+
+		if (kvm_check_request(KVM_REQ_PLANE_RESCHED, vcpu)) {
+			vcpu->common->plane_switch = true;
+			r = 0;
+			goto out;
+		}
 	}
 
 	if (kvm_check_request(KVM_REQ_EVENT, vcpu) || req_int_win ||
@@ -12076,7 +12082,7 @@ static int kvm_x86_vcpu_pre_run(struct kvm_vcpu *vcpu)
 	return kvm_x86_call(vcpu_pre_run)(vcpu);
 }
 
-int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
+static int __kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
 	struct kvm_queued_exception *ex = &vcpu->arch.exception;
 	struct kvm_run *kvm_run = vcpu->run;
@@ -12196,6 +12202,27 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	return r;
 }
 
+int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu_plane0)
+{
+	struct kvm_vcpu_common *common = vcpu_plane0->common;
+	int ret;
+
+	do {
+		struct kvm_vcpu *vcpu = kvm_vcpu_select_plane(vcpu_plane0);
+
+		if (vcpu == NULL)
+			return -EINVAL;
+
+		common->plane_switch = false;
+
+		ret = __kvm_arch_vcpu_ioctl_run(vcpu);
+		if (ret)
+		       break;
+	} while (vcpu_plane0->common->plane_switch);
+
+	return ret;
+}
+
 static void __get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
 {
 	if (vcpu->arch.emulate_regs_need_sync_to_vcpu) {
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
