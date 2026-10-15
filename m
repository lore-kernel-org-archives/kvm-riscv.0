Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E677ECC6B33
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wICsGvIv11y7eNueekefBjJyg6Lo8AztkO7WzgX2sB8=; b=ldcculfBlAE8iKsu064lqfOu06
	rMOsZMZPk5uSrPIddcksCc2Heajb0Q6YHZqL6byg3p5+R+tdBN2LelipsiXU0LnwjWKYd5vStSANt
	TxJC68cdDNwthYn0NfeCgP7RjSWH5X1vqkNLpUn185vDbJcom9IFqKKM/m6o7mF0KOf69o74j65/5
	LPXGQYYPaiXVbTHwbPbKMfKjplrTDnyYck4/4S6D6SqIEH4SCAGRzgZaVV4a55csoe7ypG1bFC65+
	ks+TV/5yZdLSUs8PIVDcNp1vAO1kQGec65tnqgrhcqpz1/QV3ic5prwMihMKTv5uhxaPIOrmSyint
	YrG+bPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPr9-000000015r3-446c;
	Thu, 15 Oct 2026 18:07:07 +0000
Received: from common.ash.relay.mailchannels.net ([23.83.222.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPr7-000000015qS-2VtE;
	Thu, 15 Oct 2026 18:07:06 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 80DA48C281B;
	Thu, 15 Oct 2026 18:07:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a210.dreamhost.com (100-96-9-235.trex-nlb.outbound.svc.cluster.local [100.96.9.235])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 12A3F8C2791;
	Thu, 15 Oct 2026 18:07:00 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Absorbed-Keen: 58b0220204814797_1792087620161_2651772354
X-MC-Loop-Signature: 1792087620161:1735060741
X-MC-Ingress-Time: 1792087620161
Received: from pdx1-sub0-mail-a210.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.9.235 (trex/8.0.2);
	Thu, 15 Oct 2026 18:07:00 +0000
Received: from offworld (unknown [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a210.dreamhost.com (Postfix) with ESMTPSA id 4j5GHR27JSzTC;
	Thu, 15 Oct 2026 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1792087619;
	bh=8tldLKnUT8eWgDZDHewHeV0RDcE5tNlCO2ool4gNf+Q=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=SipN6RKaHcv9Vuk1r0q6iChDRmmEKbNhtWrbDYZESXOc4p21lT9VLyLpuq9G6HhRO
	 9I9ad4hpJVS6tdOO62E1fHENQErd1D0a6hSzJLBCjW7pJPCyAHjbSZwzVza6VnlkTi
	 8VxQYsJ7AYb3dbk3viNunS6N2B1czAUjLkrWEZaVR+MIBaO1QGLd4euLWLk4XmO3yI
	 /C4n42W/cF1LiiFiRp868p2k11Es8y8jo5DhP/qIpgBQGJLjDPiMa7tPczVig1euLH
	 Wex2no/qZEjxxGdBW3Z8q4InXMeW7RNyu9NML+ObXSar2VYajXiY9uvVVb6j5L0uP2
	 YviZA/TM4F7Eg==
Date: Thu, 15 Oct 2026 11:06:56 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Anup Patel <anup@brainfault.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, atish.patra@linux.dev,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
Message-ID: <20261015180656.dt53d3dtyvlssl5a@offworld>
References: <20260827211209.2871124-1-dave@stgolabs.net>
 <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
 <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
 <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
User-Agent: NeoMutt/20220429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_110705_845070_0FE56D63 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 10 Oct 2026, Anup Patel wrote:

>I think having static-key kvm_riscv_no_xenvcfg is much cleaner
>because we already have kvm_riscv_vsstage_tlb_no_gpa which
>is another work-around. The kvm_riscv_no_xenvcfg will be diabled
>by default and will be enabled only for P500 (ESWIN EIC7700X).

Thanks for the suggestion, I agree it looks cleaner.
How about the below (fixes things for me)?

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
index 89568ccce01d..dec338319cb7 100644
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
+	    (riscv_cached_marchid(0) & 0xFFFF) == 0x8) {
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
-- 
2.39.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
