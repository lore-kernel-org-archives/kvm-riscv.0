Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7480CD98CA
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hppatrTAjIGPN1OufNXvXZ/eFg6N1Zaqh8Y3/kOTmbo=; b=uCOUqDBVhbGd4I
	u41ZXvH/N9GdHXxxBwdd2IjziFTPFNn1A4nCoDX9m92tXjy38H+RMYlR+y2YpQbS7UHAMsOxqtf3B
	4ojoKLw6CSbU4cIGa/W0XxvnOXONxFEjhUxW1ZZ7kl7W5NWd4vC43S0aou2X7nG8Tw47WRE5heMBz
	iLsXO1GJ485RYRfj+Oi8esYucOptAkv72HZ9rnc5/TCOykybpZaHRM8oKh+5a7TI2I9X/yHytqBv4
	10NqPiDEQ0AExJxeG+RUNi2jmADS7n3DcxVQHmivd+dEy0IMnQ8u8eXJIgq4pwjaK0b3aujPiXRb8
	jCu9PoGgU0vKki/h1Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q3R-1AWN;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCB-00000003pVb-1VjZ
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:22 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id A6BAD2028CB;
	Mon,  8 Jun 2026 16:43:13 +0200 (CEST)
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
Subject: [PATCH 40/60] kvm: x86: Handle IOAPIC EOIs per plane
Date: Mon,  8 Jun 2026 16:42:32 +0200
Message-ID: <20260608144252.351443-41-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074319_615351_29863E4F 
X-CRM114-Status: GOOD (  10.56  )
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

Make sure the handling of IOAPIC EOIs is aware of planes.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/irq.c              |  3 ++-
 arch/x86/kvm/x86.c              | 10 ++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1393566741a0..134bc02962fd 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -109,7 +109,7 @@
 #define KVM_REQ_APIC_PAGE_RELOAD \
 	KVM_ARCH_REQ_FLAGS(17, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HV_CRASH		KVM_ARCH_REQ(18)
-#define KVM_REQ_IOAPIC_EOI_EXIT		KVM_ARCH_REQ(19)
+#define KVM_REQ_IOAPIC_EOI_EXIT		KVM_ARCH_PLANE_REQ(19)
 #define KVM_REQ_HV_RESET		KVM_ARCH_REQ(20)
 #define KVM_REQ_HV_EXIT			KVM_ARCH_REQ(21)
 #define KVM_REQ_HV_STIMER		KVM_ARCH_REQ(22)
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 90e2d2db2123..bc748a4b7cbd 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -400,7 +400,8 @@ void kvm_scan_ioapic_routes(struct kvm_vcpu *vcpu,
 		hlist_for_each_entry(entry, &table->map[i], link) {
 			struct kvm_lapic_irq irq;
 
-			if (entry->type != KVM_IRQ_ROUTING_MSI)
+			if (entry->type != KVM_IRQ_ROUTING_MSI ||
+			    entry->msi.plane_level != vcpu->plane_level)
 				continue;
 
 			kvm_msi_to_lapic_irq(vcpu->kvm, entry, &irq);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 623838885753..a158740a6fc1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11336,8 +11336,14 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 				goto out;
 			}
 		}
-		if (kvm_check_request(KVM_REQ_SCAN_IOAPIC, vcpu))
-			vcpu_scan_ioapic(vcpu);
+		if (kvm_check_request(KVM_REQ_SCAN_IOAPIC, vcpu)) {
+			struct kvm_vcpu *v;
+			unsigned i;
+
+			vcpu_for_each_plane(vcpu->common, i, v) {
+				vcpu_scan_ioapic(v);
+			}
+		}
 		if (kvm_check_request(KVM_REQ_LOAD_EOI_EXITMAP, vcpu))
 			vcpu_load_eoi_exitmap(vcpu);
 		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
