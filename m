Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D260CCD98C4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOliFS5tpwJKh5mZ2SL6AQP/2gTmwicBCexrV+2u1Wc=; b=xE8XsPSPbjUcFu
	SNIYPJZzyVL6R0rP2SiX7V+21iN5hcjVK9tNR+RS6a/TZ0iITCA3gXDppqhcnOO26CakAo+jfx062
	TIetNQDZYyaiHdweRv9lbMPdYvldQIUve18v78Zz0nLKqIatU4SBHGeMwnpwjjVaCGTCw8Z02y8bq
	i4IsKr3Gzb+EXJBRq8W7ibC+AS1j2O0PX1S9YfR3FzPkEpgpnISd6SLu0Gm6EGRCfev0Gb7KI+tXp
	eE6j8miHhd7eCHKYVkhnsF/tZtKUKTrAJW2FEjTrldos2z6Nj9xm8DNRZkuj9Zi7pY3/zx4XnRPI7
	5R4ramMQIkGjgm4prfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCI-00000003pvp-22gA;
	Mon, 08 Jun 2026 14:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003piC-2QBV
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=d7cVvrLPT1nDfeX/sab2rzFk0HpH+ccX3/IETQ9g3FU=; b=RIH0VlymJwHhhjzJug/1JA6oEv
	eMrp8R741/ENVlmayvCbcJghNQdrt8XszY8MxYOn1aEg0z+Xi/2O2PraiYb3j+6Z+u/CrFzDaFdxl
	uUVXPQaNLGNWNwAWcuOljga5Zno1qQ8gOc5klSEAP1WuKNnn5qf6uLZ0BjmHHxCUL3SZorLdvWK+B
	Y5MrQyphtJS77Ea7pJwTtWrm7U/1n0bXHqT8+EEYcRKyZ6E7Owoy6eenqm2j6Hq830hgRQiS/uyD8
	RPKconcJ7bWT6kPq/3JlpKj0/G76U98D77ODT9vRkUqgFx8qehcIUBvfySPbfZgy+KRN+yjcNzt9+
	woTGuaZw==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC7-00000001991-2xC1
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:18 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9C7712028BD;
	Mon,  8 Jun 2026 16:43:10 +0200 (CEST)
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
Subject: [PATCH 26/60] kvm: Introduce arch-specific plane state
Date: Mon,  8 Jun 2026 16:42:18 +0200
Message-ID: <20260608144252.351443-27-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154316_193893_6D43B8FC 
X-CRM114-Status: GOOD (  11.87  )
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

Introduce struct kvm_arch_plane which is per architecture and will be
used to store architecture-specific per-plane state.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h     | 12 ++++++++++++
 arch/loongarch/include/asm/kvm_host.h | 12 ++++++++++++
 arch/mips/include/asm/kvm_host.h      | 12 ++++++++++++
 arch/powerpc/include/asm/kvm_host.h   | 12 ++++++++++++
 arch/riscv/include/asm/kvm_host.h     | 12 ++++++++++++
 arch/s390/include/asm/kvm_host.h      | 12 ++++++++++++
 arch/x86/include/asm/kvm_host.h       | 12 ++++++++++++
 include/linux/kvm_host.h              |  2 ++
 include/linux/kvm_types.h             |  1 +
 virt/kvm/kvm_main.c                   |  9 +++++++++
 10 files changed, 96 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 32dc484781f0..e9cca2adb371 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -306,6 +306,18 @@ enum fgt_group_id {
 	__NR_FGT_GROUP_IDS__
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	struct kvm_s2_mmu mmu;
 
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 776bc487a705..225aa87ebbdd 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -116,6 +116,18 @@ struct kvm_phyid_map {
 	struct kvm_phyid_info phys_map[KVM_MAX_PHYID];
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* Guest physical mm */
 	kvm_pte_t *pgd;
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index c14b10821817..b01911eb9064 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -172,6 +172,18 @@ struct loongson_kvm_ipi {
 };
 #endif
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* Guest physical mm */
 	struct mm_struct gpa_mm;
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 2d139c807577..c5b9fbaf34f3 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -269,6 +269,18 @@ struct kvm_hpt_info {
 
 struct kvm_resize_hpt;
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 /* Flag values for kvm_arch.secure_guest */
 #define KVMPPC_SECURE_INIT_START 0x1 /* H_SVM_INIT_START has been called */
 #define KVMPPC_SECURE_INIT_DONE  0x2 /* H_SVM_INIT_DONE completed */
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..bcbf487d4cb7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -76,6 +76,18 @@ struct kvm_vcpu_stat {
 struct kvm_arch_memory_slot {
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index 8a4f4a39f7a2..bb3bfbfd35d8 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -638,6 +638,18 @@ struct kvm_s390_pv {
 
 struct kvm_s390_mmu_cache;
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	struct esca_block *sca;
 	debug_info_t *dbf;
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 43c92f0ada1e..dd95c70bfdba 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1412,6 +1412,18 @@ enum kvm_mmu_type {
 	KVM_NR_MMU_TYPES,
 };
 
+/* Per-plane state of VM */
+struct kvm_arch_plane {};
+
+static inline int kvm_arch_plane_init(struct kvm *kvm,
+				      struct kvm_plane *plane,
+				      unsigned plane_level)
+{
+	return 0;
+}
+
+static inline void kvm_arch_plane_destroy(struct kvm_plane *plane) {}
+
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7d06459a06f3..4a0eaa1de479 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -847,6 +847,8 @@ struct kvm_plane {
 
 	/* Per-Plane VCPU array */
 	struct xarray vcpu_array;
+
+	struct kvm_arch_plane arch;
 };
 
 struct kvm {
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index a568d8e6f4e8..07e82928c948 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -42,6 +42,7 @@ struct kvm_interrupt;
 struct kvm_irq_routing_table;
 struct kvm_memory_slot;
 struct kvm_one_reg;
+struct kvm_plane;
 struct kvm_run;
 struct kvm_userspace_memory_region;
 struct kvm_vcpu;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f85ddb0fc781..91fb9abf9b31 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1211,13 +1211,22 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 
 	xa_init(&plane->vcpu_array);
 
+	if (kvm_arch_plane_init(kvm, plane, plane_level))
+		goto out_free_plane;
+
 	kvm->planes[plane_level] = plane;
 
 	return plane;
+
+out_free_plane:
+	kfree(plane);
+
+	return NULL;
 }
 
 static void kvm_destroy_one_plane(struct kvm_plane *plane)
 {
+	kvm_arch_plane_destroy(plane);
 	kfree(plane);
 }
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
