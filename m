Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D47CD98C5
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBLxv17ozGzj2g3xN6EFwUHK+DQO9TaiM7M3HPKPUnQ=; b=AbXb0gDvRRekS1
	4zvBXmrwtZz4mYtnT/W7auOKjetu5znxDkRETc9ai9RG8gOmP3mX2LGEUGtgrb4wVdRHUtyvq/J1n
	ZusiybnE4ywcAZhpIbpb5uP+qExZNBfsC81OajRRSf1AoxyBQJl0Ro4J3VIRNCOd2+89svRxt9LAd
	wqOaauqlR9fa3q5jf3yi0LepBtLbM7g0bCdHYvQ2efO9Q1dJ3cL7OeL0D7Ls/RTr3N5hRGQv41y+Q
	6OTXy8ZM9IQbb7160Un5+WhJPBGIUTicGeKGnhRbJRxvXmSM5q9n+4fesJJTP14qZz0SdryYvTgXA
	fIAHE5qlu3y6PoYTubYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCI-00000003pwd-2vlG;
	Mon, 08 Jun 2026 14:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003piF-2bOp
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OA+8JHuLaM5UvW2gO/S/amZB7s61iYVyWjXtASLST60=; b=dIjEn5ruM+Cb1DZ0TSCmGt+7lh
	WIwdigOfJzVBwoHOpPW5wEOxzs2Fgt5XC1PNgWh2HI9TMNrhAcz6MgQZgcXg7vPdUMdGO23T16SR+
	siePS8Mo69XAfpeFZZw5VAtZDShTzX7bud6DpQ+wZmwlhtsyztIhqaFLIq9RjnWCrF+zh7rPG74lk
	4raUO9cfSqcfi8i/MDHWuBEZEyJUGzKW6CfF7rehmr+eSDsSgFWFy52beD3S2neZPRn0BPUJOVhda
	KrxpgoKwauksVJK5lQNci9Sjcycg9bntnCUU+qhtnDBC12YxxXp9HvkkDivzoOqTGTpZWALTOTWob
	7LfuKiiQ==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC7-0000000199H-3omB
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:18 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D09802028BE;
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
Subject: [PATCH 27/60] kvm: Introduce arch-specific part of struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:19 +0200
Message-ID: <20260608144252.351443-28-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154316_530279_4D9312E5 
X-CRM114-Status: GOOD (  12.34  )
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

Give architectures a place to store their VCPU state which is shared
across all planes.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h     | 5 +++++
 arch/loongarch/include/asm/kvm_host.h | 5 +++++
 arch/mips/include/asm/kvm_host.h      | 5 +++++
 arch/powerpc/include/asm/kvm_host.h   | 5 +++++
 arch/riscv/include/asm/kvm_host.h     | 5 +++++
 arch/s390/include/asm/kvm_host.h      | 5 +++++
 arch/x86/include/asm/kvm_host.h       | 5 +++++
 include/linux/kvm_host.h              | 2 ++
 include/linux/kvm_types.h             | 1 +
 virt/kvm/kvm_main.c                   | 8 ++++++++
 10 files changed, 46 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index e9cca2adb371..de9ca00ce4f4 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -869,6 +869,11 @@ struct vcpu_reset_state {
 
 struct vncr_tlb;
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	struct kvm_cpu_context ctxt;
 
diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
index 225aa87ebbdd..7317dceda6b4 100644
--- a/arch/loongarch/include/asm/kvm_host.h
+++ b/arch/loongarch/include/asm/kvm_host.h
@@ -150,6 +150,11 @@ struct kvm_arch {
 	struct loongarch_pch_pic *pch_pic;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define CSR_MAX_NUMS		0x800
 
 struct loongarch_csrs {
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index b01911eb9064..c48bca79207b 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -194,6 +194,11 @@ struct kvm_arch {
 #endif
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define N_MIPS_COPROC_REGS	32
 #define N_MIPS_COPROC_SEL	8
 
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index c5b9fbaf34f3..47d9900c4f85 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -349,6 +349,11 @@ struct kvm_arch {
 #endif
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 #define VCORE_ENTRY_MAP(vc)	((vc)->entry_exit_map & 0xff)
 #define VCORE_EXIT_MAP(vc)	((vc)->entry_exit_map >> 8)
 #define VCORE_IS_EXITING(vc)	(VCORE_EXIT_MAP(vc) != 0)
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index bcbf487d4cb7..397491587f5b 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -107,6 +107,11 @@ struct kvm_arch {
 	bool mp_state_reset;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_cpu_trap {
 	unsigned long sepc;
 	unsigned long scause;
diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index bb3bfbfd35d8..90fd8c0f1a2b 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -413,6 +413,11 @@ struct kvm_s390_pv_vcpu {
 	unsigned long stor_base;
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	struct kvm_s390_sie_block *sie_block;
 	/* if vsie is active, currently executed shadow sie control block */
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index dd95c70bfdba..1393566741a0 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -794,6 +794,11 @@ enum kvm_only_cpuid_leafs {
 	NKVMCAPINTS = NR_KVM_CPU_CAPS - NCAPINTS,
 };
 
+struct kvm_vcpu_arch_common {};
+
+static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
+static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+
 struct kvm_vcpu_arch {
 	/*
 	 * rip and regs accesses must go through
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4a0eaa1de479..291bccce9b74 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -375,6 +375,8 @@ struct kvm_vcpu_common {
 	bool scheduled_out;
 
 	struct kvm_dirty_ring dirty_ring;
+
+	struct kvm_vcpu_arch_common arch;
 };
 
 struct kvm_vcpu {
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 07e82928c948..06799efe6a12 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -46,6 +46,7 @@ struct kvm_plane;
 struct kvm_run;
 struct kvm_userspace_memory_region;
 struct kvm_vcpu;
+struct kvm_vcpu_common;
 struct kvm_vcpu_init;
 struct kvm_memslots;
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 91fb9abf9b31..7a0b632e3ac0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -490,6 +490,10 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 			goto out_drop_counter;
 	}
 
+	r = kvm_arch_vcpu_common_init(common);
+	if (r)
+		goto out_free_dirty_ring;
+
 	vcpu->common = no_free_ptr(common);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
@@ -497,6 +501,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	return 0;
 
+out_free_dirty_ring:
+	kvm_dirty_ring_free(&common->dirty_ring);
 out_drop_counter:
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
@@ -548,6 +554,8 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	kvm->created_vcpus--;
 	mutex_unlock(&common->kvm->lock);
 
+	kvm_arch_vcpu_common_destroy(common);
+
 	/*
 	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
 	 * the common->pid pointer, and at destruction time all file descriptors
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
