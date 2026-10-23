Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CDC606A31F
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yp4rsJdH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=XtawzNbg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pC2Cgn2ZYdAd6/KcNAnzZds93kfF08QwIEFoqpnozr8=; b=yp4rsJdHix+5oqeLgDR3M5UUXD
	/hrWhEVODQFNAQ0uGebnvlsEDLZGXxFhML9IliaY2SojRaXDUFIYGLGLJEBVLwxAE2hyO0q9eVCzd
	VigaksU3/ME7pdHSghjIShWiVvKmaHZ4OwWduHsIyhhRObjkQTMrKem/+G0FNQbJGTiSumKwD8VkL
	5y7suc4QaYItkXdPOSH5shAScABdt8N4g8F8FRJobR3CzWEHFjOSdVs4X2IWec7WPr93E9Dygp2za
	0hjxrl0NXErFbyLVds8+aL6j7vlDIOAHuNn1HHgtVZhjcoXYEYNT2sI5PbFxJck6jF5K446wHOVXp
	XFusUj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJDD-0000000GjY5-2GFh;
	Fri, 23 Oct 2026 17:37:51 +0000
Received: from fuchsia.ash.relay.mailchannels.net ([23.83.222.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJDA-0000000GjXO-2sfs;
	Fri, 23 Oct 2026 17:37:50 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 60D3A1630A2;
	Fri, 23 Oct 2026 17:37:45 +0000 (UTC)
Received: from pdx1-sub0-mail-a232.dreamhost.com (100-96-12-132.trex-nlb.outbound.svc.cluster.local [100.96.12.132])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id EC84B161CD2;
	Fri, 23 Oct 2026 17:37:44 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MC-Copy: exfiltrated-credentials
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Interest-Imminent: 43fb86512a2518fa_1792777065176_1353792396
X-MC-Loop-Signature: 1792777065176:1036152718
X-MC-Ingress-Time: 1792777065176
Received: from pdx1-sub0-mail-a232.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.12.132 (trex/8.0.2);
	Fri, 23 Oct 2026 17:37:45 +0000
Received: from offworld.tailf5af7a.ts.net (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a232.dreamhost.com (Postfix) with ESMTPSA id 4jB9G02K8rz103Z;
	Fri, 23 Oct 2026 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792777064;
	bh=WWhQhlM3IQtdPrW0/AS+5TqlFvRCPcs0v/Cr9eCgtU8=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=XtawzNbgwixKokru1jJvCoTcbtCWvMDFwzlsCk3JPrR0DVR4dil8QVygZOnIVJkRA
	 r/FTxBPjQ4yvjPvrg3JX8clBeDabKd79nZZizAouo9eNdexWan1vH9A5oDuDocX6Sz
	 bNwmLgbi+BQgrsynZqaP79xOwYWFb71rX0DJLKCBPBGgtyXA60yWBP1W0c6+colv/1
	 8MS6Y0SKtRa768LO63FuuZe1tBjxp1WTEz7hw0JOr18xriWJUDINdXdHXUOufLxnw8
	 8aM9hfxr0lO6agMbj5ZTzboqEZdnbAEiG8b1H4y9xz7/Pj5RoedSjPmeZFuLuAx2lA
	 D6zuhR0HSd1Dw==
From: Davidlohr Bueso <dave@stgolabs.net>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	samuel.holland@sifive.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	dave@stgolabs.net
Subject: [PATCH v2] RISC-V: KVM: Do not touch the envcfg CSRs on the SiFive P550
Date: Fri, 23 Oct 2026 10:37:31 -0700
Message-Id: <20261023173731.3559650-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_103748_926891_D114796C 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: -1.4 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SiFive P550 (ESWIN EIC7700X) implements the hypervisor extension
on a privileged spec 1.11 base, so it has neither henvcfg nor senvcfg.
KVM swaps senvcfg on every guest entry and writes henvcfg on vCPU load
regardless, and the host dies on the first guest entry:

  Oops - illegal instruction [#1]
  Modules linked in: kvm
  CPU: 2 UID: 0 PID: 127 Comm: qemu-system-ris Not tainted 7.2.0+ #4 PREEMPTLAZY
  Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01 01/01/2024
  epc : kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
   ra : kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
  status: 0000000200000100 badaddr: 0000000010a797f3 cause: 0000000000000002
  [<ffffffff01df432e>] kvm_riscv_vcpu_enter_exit+0x26/0xcf8 [kvm]
  [<ffffffff01deb3b0>] kvm_arch_vcpu_ioctl_run+0x4ce/0x5a6 [kvm]
  [<ffffffff01dd7914>] kvm_vcpu_ioctl+0x180/0x5e4 [kvm]
  [<ffffffff8025702e>] __riscv_sys_ioctl+0x84/0x9a
  [<ffffffff80dfdc72>] do_trap_ecall_u+0x1d8/0x38a
  [<ffffffff80e08644>] handle_exception+0x168/0x174
  Code: 84aa 892e b703 8887 1773 1067 3023 16e5 b783 8907 (97f3) 10a7

Introduce a hardware quirk for this core, similar to the Andes AX66 TLB one,
and skip both CSRs when it is set. The FWFT features that KVM implements
with henvcfg bits then disabled.

Fixes: db3c01c7a308 ("RISCV: KVM: Add senvcfg context save/restore")
Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
changes from v1: disable FWFT features accordingly (Anup)

 arch/riscv/include/asm/kvm_host.h |  1 +
 arch/riscv/kvm/main.c             |  9 +++++++++
 arch/riscv/kvm/vcpu.c             |  6 ++++--
 arch/riscv/kvm/vcpu_config.c      | 16 ++++++++++------
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 20 +++++++++++++++-----
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index a30600579231..51b6d1f76626 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -331,5 +331,6 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
 /* Flags representing implementation specific details */
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_no_xenvcfg);
 
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 89568ccce01d..0725c8e03c6a 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -15,11 +15,13 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/vendorid_list.h>
 #include <asm/kvm_vcpu_vector.h>
 
 static DEFINE_PER_CPU(bool, kvm_riscv_virtualization_enabled);
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_no_xenvcfg);
 
 static void kvm_riscv_setup_vendor_features(void)
 {
@@ -29,6 +31,13 @@ static void kvm_riscv_setup_vendor_features(void)
 		static_branch_enable(&kvm_riscv_vsstage_tlb_no_gpa);
 		kvm_info("VS-stage TLB does not cache guest physical address and VMID\n");
 	}
+
+	/* SiFive P550 (ESWIN EIC7700X): H on a 1.11 base, no henvcfg/senvcfg */
+	if (riscv_cached_mvendorid(0) == SIFIVE_VENDOR_ID &&
+	    riscv_cached_marchid(0) == 0x8000000000000008ULL) {
+		static_branch_enable(&kvm_riscv_no_xenvcfg);
+		kvm_info("henvcfg and senvcfg CSRs not implemented\n");
+	}
 }
 
 long kvm_arch_dev_ioctl(struct file *filp,
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7f1636c44d41..e5f877284026 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -772,7 +772,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_guest_state(struct kvm_vcpu *
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	vcpu->arch.host_scounteren = csr_swap(CSR_SCOUNTEREN, csr->scounteren);
-	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
+	if (!static_branch_unlikely(&kvm_riscv_no_xenvcfg))
+		vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		vcpu->arch.host_sstateen0 = csr_swap(CSR_SSTATEEN0, smcsr->sstateen0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
@@ -786,7 +787,8 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	csr->scounteren = csr_swap(CSR_SCOUNTEREN, vcpu->arch.host_scounteren);
-	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
+	if (!static_branch_unlikely(&kvm_riscv_no_xenvcfg))
+		csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN))
 		smcsr->sstateen0 = csr_swap(CSR_SSTATEEN0, vcpu->arch.host_sstateen0);
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS))
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index b68aa830aaf5..9b8e4f1f12f4 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -82,9 +82,11 @@ void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
 		nsh = nacl_shmem();
 		nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);
 		nacl_csr_write(nsh, CSR_HIDELEG, cfg->hideleg);
-		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
-		if (IS_ENABLED(CONFIG_32BIT))
-			nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (!static_branch_unlikely(&kvm_riscv_no_xenvcfg)) {
+			nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
+			if (IS_ENABLED(CONFIG_32BIT))
+				nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
+		}
 		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 			nacl_csr_write(nsh, CSR_HSTATEEN0, cfg->hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
@@ -93,9 +95,11 @@ void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
 	} else {
 		csr_write(CSR_HEDELEG, cfg->hedeleg);
 		csr_write(CSR_HIDELEG, cfg->hideleg);
-		csr_write(CSR_HENVCFG, cfg->henvcfg);
-		if (IS_ENABLED(CONFIG_32BIT))
-			csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+		if (!static_branch_unlikely(&kvm_riscv_no_xenvcfg)) {
+			csr_write(CSR_HENVCFG, cfg->henvcfg);
+			if (IS_ENABLED(CONFIG_32BIT))
+				csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+		}
 		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 			csr_write(CSR_HSTATEEN0, cfg->hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 7d0aaeff537b..d339f7384497 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -132,6 +132,12 @@ static long kvm_sbi_fwft_envcfg_flag_get(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+/* features implemented by setting bits in henvcfg need the CSR to exist */
+static bool kvm_sbi_fwft_have_henvcfg(void)
+{
+	return !static_branch_unlikely(&kvm_riscv_no_xenvcfg);
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -208,7 +214,8 @@ static long kvm_sbi_fwft_set_cfi(struct kvm_vcpu *vcpu,
 
 static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
 {
-	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+	return kvm_sbi_fwft_have_henvcfg() &&
+	       riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
 }
 
 static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
@@ -236,7 +243,8 @@ static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
 
 static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
 {
-	return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
+	return kvm_sbi_fwft_have_henvcfg() &&
+	       riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
 }
 
 static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
@@ -264,8 +272,9 @@ static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
 
 static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
 {
-	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
-		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
+	return kvm_sbi_fwft_have_henvcfg() &&
+	       riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+	       riscv_isa_extension_available(vcpu->arch.isa, SVADE);
 }
 
 static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
@@ -305,7 +314,8 @@ static bool try_to_set_pmm(unsigned long value)
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 {
-	return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
+	return kvm_sbi_fwft_have_henvcfg() &&
+	       riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
 }
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcpu)
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
