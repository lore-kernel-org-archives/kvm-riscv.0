Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AE9CD8CB9
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbeRh0GPlYFIVsa7943GF/QIHP3curFjS0ZsvFBhn+U=; b=qoZv/FgUSdTqTn
	zow/mIRoyLKTwGlam7QqmEnoyVBJc5qT1O4mG1FmsN/wcI4LJCQvpl4XVdTgIwAPeU2649pN6miDq
	XCFkPgRf9enhjXyySrLtc+gwWVZzJNLzr8gAWVa6PA6Yf549QtSen8oiPMv6WFs2XjZkMDE2LSc7m
	OZEEC2izlIrKoRl7FYZcGwcXMbZvWNxOGuJlMYmu+VJOL9DlGnefUbn8c0pzRtBfmtMoHGkyOxMoG
	iTQIwIFcYXd50ENa4HX7aFbVLgMXsPUd2Jxkf4sQ3jnDbhDGwEaESJp1QLZCn3GNNlOJYOCP+w5I3
	pgOH6b36mgUJt4JNEKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003psM-3qqh;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC8-00000003pTt-0ciO
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 80CE32028C1;
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
Subject: [PATCH 30/60] kvm: Add KVM_EXIT_PLANE_EVENT
Date: Mon,  8 Jun 2026 16:42:22 +0200
Message-ID: <20260608144252.351443-31-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074316_362626_741EC5A0 
X-CRM114-Status: GOOD (  12.08  )
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

Add a new exit-type to KVM for telling user-space that a plane-vcpu is
missing. Create a helper which fills out the kvm_run exit structure.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  2 ++
 include/uapi/linux/kvm.h | 10 ++++++++++
 virt/kvm/kvm_main.c      | 12 ++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3ecd472c7cfa..90b97137840e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1649,6 +1649,8 @@ void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
 
+int kvm_request_create_plane(struct kvm_vcpu *vcpu, unsigned plane, u64 apic_id);
+
 #ifndef CONFIG_S390
 void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait);
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 24e34b8e4819..a88d987c7882 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -146,6 +146,13 @@ struct kvm_exit_snp_req_certs {
 	__u64 ret;
 };
 
+struct kvm_plane_event_exit {
+#define KVM_PLANE_EVENT_CREATE_VCPU	1
+	__u32 cause;
+	__u32 plane;
+	__u64 extra[8];
+};
+
 #define KVM_S390_GET_SKEYS_NONE   1
 #define KVM_S390_SKEYS_MAX        1048576
 
@@ -193,6 +200,7 @@ struct kvm_exit_snp_req_certs {
 #define KVM_EXIT_ARM_SEA          41
 #define KVM_EXIT_ARM_LDST64B      42
 #define KVM_EXIT_SNP_REQ_CERTS    43
+#define KVM_EXIT_PLANE_EVENT      44
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -497,6 +505,8 @@ struct kvm_run {
 		} arm_sea;
 		/* KVM_EXIT_SNP_REQ_CERTS */
 		struct kvm_exit_snp_req_certs snp_req_certs;
+		/* KVM_EXIT_PLANE_EVENT */
+		struct kvm_plane_event_exit plane_event;
 		/* Fix the size of the union. */
 		char padding[256];
 	};
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 03a44ff62f0f..f0f78bb74e51 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3973,6 +3973,18 @@ bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_wake_up);
 
+int kvm_request_create_plane(struct kvm_vcpu *vcpu, unsigned plane, u64 apic_id)
+{
+	vcpu->run->exit_reason = KVM_EXIT_PLANE_EVENT;
+	memset(&vcpu->run->plane_event, 0, sizeof(vcpu->run->plane_event));
+	vcpu->run->plane_event.cause = KVM_PLANE_EVENT_CREATE_VCPU;
+	vcpu->run->plane_event.plane = plane;
+	vcpu->run->plane_event.extra[0] = apic_id;
+
+	return 0;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_request_create_plane);
+
 #ifndef CONFIG_S390
 /*
  * Kick a sleeping VCPU, or a guest VCPU in guest mode, into host kernel mode.
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
