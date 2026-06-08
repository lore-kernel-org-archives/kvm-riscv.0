Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E18CD8C9F
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrI9E8F4jMttS+Cl+dBkauHTW0D+YiDqUWFixPxNXe0=; b=ZK6qb5e/BmNIiW
	LCGnMucuTUGjZrHMWw97iW20twZfRdHtRv4m96yCRljo41wwHdPjAp1Og/nOsZPJyQI/6OAIA0QmY
	OrzYuTF8PazHncDQDkPyCt75BUwXSM/w5qjF42Z4v16wCbkXIKHZ/Hm9ReTksKdjKD9tNMz2c2Zo8
	urS3Lx1QwFBRuEedK9uOyQv+NMB93aq+K8rm0CfRfUcGCnDmhfjZxf/CJp11zDCrqyjWqnGyIVSO5
	SRq9ZAsUgMO849byvFaDH5Wf/7Kl+56oulHFf3w/rm00nAyU3RCwYGW+ocSVEOcAEt8aJ15DZgzt7
	lv69vEFemJMtMd/EzUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q5e-47hK;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCE-00000003plp-1vdX
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OA/Qd+jF0Q1QozMre9m+KdODkx0ma/FNTcWiPF5Ir44=; b=AHkqOD5NDNJ9sj2g1uy0vIU5vM
	KGvtHUv6oZBKgAQzwkBPrqdMyOUWFCf7PIEvaaCkV2HDWdhusKeBc7COFD6im00EUxGkQPxGEtsQS
	Mn0Gy/STARKNmKoXK2QHGdhktde4TtKt677xobeDzow8KwL1RWpBuURLQEYNbZrCllHnve1fzWVHt
	M1e6hVguCzDPKkLmieRgEp6kk+KU/+TNP0ewDpRRF2YslyBP0INQkYbL6jjha7AMkyH3Z8JsI8Ao1
	IKOvX/5CIV2D4gXfbVkgVTT1hgMQUZAdFTJStP0eoTmaOVO5xeoP2F+AEaYeXKt8y5ZZTUq63Rah5
	aJxzG+mg==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCA-0000000198i-3bue
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:21 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7319F2028CA;
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
Subject: [PATCH 39/60] kvm: Make KVM_SET_GSI_ROUTING per plane
Date: Mon,  8 Jun 2026 16:42:31 +0200
Message-ID: <20260608144252.351443-40-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154319_627291_027DF25C 
X-CRM114-Status: GOOD (  15.76  )
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

Allow the KVM_SET_GSI_ROUTING on each plane. There is still only one
GSI routing table maintained per VM by the KVM module, the plane this
IOCTL was last issued at will get all GSI interrupts.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c  |  2 +-
 arch/loongarch/kvm/intc/pch_pic.c |  2 +-
 arch/powerpc/kvm/mpic.c           |  2 +-
 arch/riscv/kvm/vm.c               |  2 +-
 arch/x86/kvm/irq.c                |  2 +-
 include/linux/kvm_host.h          |  3 +-
 virt/kvm/irqchip.c                | 10 +++--
 virt/kvm/kvm_main.c               | 62 +++++++++++++++----------------
 8 files changed, 44 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 53e5fcc591d7..96981dd29a6e 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -153,7 +153,7 @@ int kvm_vgic_setup_default_irq_routing(struct kvm *kvm)
 		entries[i].u.irqchip.irqchip = 0;
 		entries[i].u.irqchip.pin = i;
 	}
-	ret = kvm_set_irq_routing(kvm, entries, nr, 0);
+	ret = kvm_set_irq_routing(kvm, entries, nr, 0, 0);
 	kfree(entries);
 	return ret;
 }
diff --git a/arch/loongarch/kvm/intc/pch_pic.c b/arch/loongarch/kvm/intc/pch_pic.c
index aa0ed59ae8cf..a0d04ffa8a71 100644
--- a/arch/loongarch/kvm/intc/pch_pic.c
+++ b/arch/loongarch/kvm/intc/pch_pic.c
@@ -423,7 +423,7 @@ static int kvm_setup_default_irq_routing(struct kvm *kvm)
 		entries[i].u.irqchip.irqchip = 0;
 		entries[i].u.irqchip.pin = i;
 	}
-	ret = kvm_set_irq_routing(kvm, entries, nr, 0);
+	ret = kvm_set_irq_routing(kvm, entries, nr, 0, 0);
 	kfree(entries);
 
 	return ret;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 6b6eba7fbf75..1e493179ee4f 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1646,7 +1646,7 @@ static int mpic_set_default_irq_routing(struct openpic *opp)
 	if (!routing)
 		return -ENOMEM;
 
-	kvm_set_irq_routing(opp->kvm, routing, 0, 0);
+	kvm_set_irq_routing(opp->kvm, routing, 0, 0, 0);
 
 	kfree(routing);
 	return 0;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 6b3c8a0e74e2..bd9ab3240e4f 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -105,7 +105,7 @@ int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines)
 		ents[i].u.irqchip.irqchip = 0;
 		ents[i].u.irqchip.pin = i;
 	}
-	rc = kvm_set_irq_routing(kvm, ents, lines, 0);
+	rc = kvm_set_irq_routing(kvm, ents, lines, 0, 0);
 	kfree(ents);
 
 	return rc;
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index d2ecfd54d57a..90e2d2db2123 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -576,7 +576,7 @@ static const struct kvm_irq_routing_entry default_routing[] = {
 int kvm_setup_default_ioapic_and_pic_routing(struct kvm *kvm)
 {
 	return kvm_set_irq_routing(kvm, default_routing,
-				   ARRAY_SIZE(default_routing), 0);
+				   ARRAY_SIZE(default_routing), 0, 0);
 }
 
 int kvm_vm_ioctl_get_irqchip(struct kvm *kvm, struct kvm_irqchip *chip)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 05a10836d92d..3b62fb354267 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2351,7 +2351,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm);
 int kvm_set_irq_routing(struct kvm *kvm,
 			const struct kvm_irq_routing_entry *entries,
 			unsigned nr,
-			unsigned flags);
+			unsigned flags,
+			unsigned plane_level);
 int kvm_init_irq_routing(struct kvm *kvm);
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index a4fea7d8dde6..e0793ae0c719 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -128,7 +128,8 @@ void kvm_free_irq_routing(struct kvm *kvm)
 static int setup_routing_entry(struct kvm *kvm,
 			       struct kvm_irq_routing_table *rt,
 			       struct kvm_kernel_irq_routing_entry *e,
-			       const struct kvm_irq_routing_entry *ue)
+			       const struct kvm_irq_routing_entry *ue,
+			       unsigned plane_level)
 {
 	struct kvm_kernel_irq_routing_entry *ei;
 	int r;
@@ -146,7 +147,7 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
-	r = kvm_set_routing_entry(kvm, e, ue, 0);
+	r = kvm_set_routing_entry(kvm, e, ue, plane_level);
 	if (r)
 		return r;
 	if (e->type == KVM_IRQ_ROUTING_IRQCHIP)
@@ -169,7 +170,8 @@ bool __weak kvm_arch_can_set_irq_routing(struct kvm *kvm)
 int kvm_set_irq_routing(struct kvm *kvm,
 			const struct kvm_irq_routing_entry *ue,
 			unsigned nr,
-			unsigned flags)
+			unsigned flags,
+			unsigned plane_level)
 {
 	struct kvm_irq_routing_table *new, *old;
 	struct kvm_kernel_irq_routing_entry *e;
@@ -210,7 +212,7 @@ int kvm_set_irq_routing(struct kvm *kvm,
 				goto free_entry;
 			break;
 		}
-		r = setup_routing_entry(kvm, new, e, ue);
+		r = setup_routing_entry(kvm, new, e, ue, plane_level);
 		if (r)
 			goto free_entry;
 		++ue;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dc59f2f9d405..a6d7601c3412 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4918,6 +4918,34 @@ static long __kvm_plane_ioctl(struct kvm_plane *plane, unsigned int ioctl, unsig
 		break;
 	}
 #endif
+#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
+	case KVM_SET_GSI_ROUTING: {
+		void __user *argp = (void __user *)arg;
+		struct kvm_irq_routing routing;
+		struct kvm_irq_routing __user *urouting;
+		struct kvm_irq_routing_entry *entries = NULL;
+
+		if (copy_from_user(&routing, argp, sizeof(routing)))
+			return -EFAULT;
+		if (!kvm_arch_can_set_irq_routing(plane->kvm) ||
+		    routing.nr > KVM_MAX_IRQ_ROUTES ||
+		    routing.flags)
+			return -EINVAL;
+		if (routing.nr) {
+			urouting = argp;
+			entries = vmemdup_array_user(urouting->entries,
+						     routing.nr, sizeof(*entries));
+			if (IS_ERR(entries)) {
+				r = PTR_ERR(entries);
+				return r;
+			}
+		}
+		r = kvm_set_irq_routing(plane->kvm, entries, routing.nr,
+					routing.flags, plane->level);
+		kvfree(entries);
+		break;
+	}
+#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
 	default:
 		r = -ENOTTY;
 	}
@@ -5506,6 +5534,9 @@ static long kvm_vm_ioctl(struct file *filp,
 	case KVM_CREATE_VCPU:
 #ifdef CONFIG_HAVE_KVM_MSI
 	case KVM_SIGNAL_MSI:
+#endif
+#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
+	case KVM_SET_GSI_ROUTING:
 #endif
 		r = __kvm_plane_ioctl(kvm->planes[0], ioctl, arg);
 		break;
@@ -5635,37 +5666,6 @@ static long kvm_vm_ioctl(struct file *filp,
 		break;
 	}
 #endif
-#ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
-	case KVM_SET_GSI_ROUTING: {
-		struct kvm_irq_routing routing;
-		struct kvm_irq_routing __user *urouting;
-		struct kvm_irq_routing_entry *entries = NULL;
-
-		r = -EFAULT;
-		if (copy_from_user(&routing, argp, sizeof(routing)))
-			goto out;
-		r = -EINVAL;
-		if (!kvm_arch_can_set_irq_routing(kvm))
-			goto out;
-		if (routing.nr > KVM_MAX_IRQ_ROUTES)
-			goto out;
-		if (routing.flags)
-			goto out;
-		if (routing.nr) {
-			urouting = argp;
-			entries = vmemdup_array_user(urouting->entries,
-						     routing.nr, sizeof(*entries));
-			if (IS_ERR(entries)) {
-				r = PTR_ERR(entries);
-				goto out;
-			}
-		}
-		r = kvm_set_irq_routing(kvm, entries, routing.nr,
-					routing.flags);
-		kvfree(entries);
-		break;
-	}
-#endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 	case KVM_SET_MEMORY_ATTRIBUTES: {
 		struct kvm_memory_attributes attrs;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
