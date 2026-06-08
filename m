Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4C4CD98C8
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlJD9WRtSQ0YURDQ/HtZ2GaHuHKKnK9fcpTZ8Si9bhU=; b=DtexsZCQd/6zSa
	KJPasryTqxuuwOidzcmNFj92chID0dfK0Ajkyq9OkV2tMb99la604EbFz8yFBnhZCKJy2lXwA45eT
	SPVW4sU2ZmBf6ikUw9Bz42gpg0C4cCi1v2jbKU1VqFrVxvQuQZyJMG5NimQ43RvOWMh2uaCWWzrc/
	Iyk4Y8VJh288dfU9ZFUWlOJrPu+2+Jeeil2FPP3B46I7F3+PtCxBsdfGzjAbnPLZfeDQhAoTZQldC
	Aq/o5HbMLf6tNhpPVxAV/U4GLFkXYwEg3VZbfBPAaSEAoFpbQaiuoa6f+zzhm3/XB27SJdjU8NMid
	jw3JB1DqqC9BbwAwy/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q5L-3kwU;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCA-00000003pTL-21sd
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3F1722028C9;
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
Subject: [PATCH 38/60] kvm: Make KVM_SIGNAL_MSI per plane
Date: Mon,  8 Jun 2026 16:42:30 +0200
Message-ID: <20260608144252.351443-39-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074318_801538_3636A3A4 
X-CRM114-Status: GOOD (  10.90  )
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

Allow the KVM_SIGNAL_MSI ioctl for every plane instead of per VM.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h |  2 +-
 virt/kvm/irqchip.c       |  4 ++--
 virt/kvm/kvm_main.c      | 25 ++++++++++++++-----------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cfb6911d6771..05a10836d92d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2370,7 +2370,7 @@ static inline int kvm_init_irq_routing(struct kvm *kvm)
 
 #endif
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi);
+int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi, unsigned plane_level);
 
 void kvm_eventfd_init(struct kvm *kvm);
 int kvm_ioeventfd(struct kvm *kvm, struct kvm_ioeventfd *args);
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index 14480d1df4f9..a4fea7d8dde6 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -45,7 +45,7 @@ int kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
 	return irq_rt->chip[irqchip][pin];
 }
 
-int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
+int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi, unsigned plane_level)
 {
 	struct kvm_kernel_irq_routing_entry route;
 
@@ -57,7 +57,7 @@ int kvm_send_userspace_msi(struct kvm *kvm, struct kvm_msi *msi)
 	route.msi.data = msi->data;
 	route.msi.flags = msi->flags;
 	route.msi.devid = msi->devid;
-	route.msi.plane_level = 0;
+	route.msi.plane_level = plane_level;
 
 	return kvm_set_msi(&route, kvm, KVM_USERSPACE_IRQ_SOURCE_ID, 1, false);
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a30123b77112..dc59f2f9d405 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4907,6 +4907,17 @@ static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsig
 	case KVM_CREATE_VCPU:
 		r = kvm_plane_ioctl_create_vcpu(plane, arg);
 		break;
+#ifdef CONFIG_HAVE_KVM_MSI
+	case KVM_SIGNAL_MSI: {
+		void __user *argp = (void __user *)arg;
+		struct kvm_msi msi;
+
+		if (copy_from_user(&msi, argp, sizeof(msi)))
+			return -EFAULT;
+		r = kvm_send_userspace_msi(plane->kvm, &msi, plane->level);
+		break;
+	}
+#endif
 	default:
 		r = -ENOTTY;
 	}
@@ -5493,6 +5504,9 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_create_plane(kvm, arg);
 		break;
 	case KVM_CREATE_VCPU:
+#ifdef CONFIG_HAVE_KVM_MSI
+	case KVM_SIGNAL_MSI:
+#endif
 		r = __kvm_plane_ioctl(kvm->planes[0], ioctl, arg);
 		break;
 	case KVM_ENABLE_CAP: {
@@ -5597,17 +5611,6 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_ioeventfd(kvm, &data);
 		break;
 	}
-#ifdef CONFIG_HAVE_KVM_MSI
-	case KVM_SIGNAL_MSI: {
-		struct kvm_msi msi;
-
-		r = -EFAULT;
-		if (copy_from_user(&msi, argp, sizeof(msi)))
-			goto out;
-		r = kvm_send_userspace_msi(kvm, &msi);
-		break;
-	}
-#endif
 #ifdef __KVM_HAVE_IRQ_LINE
 	case KVM_IRQ_LINE_STATUS:
 	case KVM_IRQ_LINE: {
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
