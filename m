Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ECBC5B543
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwC4zDaWFP2UsKtJ0+kqYMTTME6KA/A03c4SVF3pfCY=; b=nWe+TGLsHgteKY
	xL3IilFNtNt/d7g4U/5GeGsradiUM/QJf1auBxca51PJ7l6nvIBKumsQWWkfTgDIHZ3D8ZOh3rqNK
	SBKVDpknYinHLBYfhzNmmYpIDFA8GMIW7vd8g+D7Ma/UFziC4x84h5iMiIGDkOM9LFeOp6eJmAOcT
	dRM2efCaXWQiBnkurY1M9rDSP+XYbHCwJmopd9+L56hXhK9A6aZDV2Sd4oXkj2hXh3QrSqRIW7knr
	rjV6AqZqHScD5uo4v2QDlXE7+8snv8SOqbJpyp20vd4Fxeudxm2buxOnxHGva13vbug57/vBDjdkN
	pl4LdynEWat2uRGevYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t0-0000000Ep4y-0y7H;
	Thu, 05 Jun 2025 06:15:34 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sr-0000000Eovn-2pC0
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso391838a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104125; x=1749708925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9lKrNhC1LriCt2AmMWJPIsLGEeoSE3sCtMNzfw5vMI=;
        b=lbEvLY5r6T6xHbU8gtfgwKRTHBuOh5z01ulER9a0X6YdlzVfHwTYcKwsXWBAsoFneV
         3ff9bNTGAWfTGTTZOwq6g60UXzbLcZFiuug5QtaxIQ31rHCKLPrCLxxBe+98f9z9dLx2
         8AiSyjOXV4q2iqjmiDHM6M8n1cep2x4ABVZYpM0iveCQg+1JBntUXOXn2DcKsYhtcYVz
         UaBFHIo+drsqLlIacb+BYJ0vWRo1XOSj+vGpVzCcsHn37Jpmd/Yf/CPghhUEfeBcOMzA
         pXabMzDrg2KmxWisxGK9Y5LTbRezRq6k1aAfzDuHHgiYR+TJjiYu8rE+3bwBaE1zHzaA
         i5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104125; x=1749708925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9lKrNhC1LriCt2AmMWJPIsLGEeoSE3sCtMNzfw5vMI=;
        b=kPu5QCuYYuLTm31KmAkOc7l4bDdmtermmj0/YecDCY1foL6HdmhjFYiT931vuy5KFF
         Ojd7pS3+hucrxrIlMobC4uHKQ4jtrv1hevakTdBLTMf85IYAV8oI85gjOHtq9lp9R7az
         ay1uy8xGMVBYCONj+ToptiQZSPaHX3iFx9R54ugnc44Bai+4H/OFm8X3QsMrhm9UFnhh
         DoHMaoUXLJXV9Ky3M+biq7/23p8pfJsThFOrkT840uAOHcO8nkY4lPueU9fVtJFgddQI
         mwny+DoQPJY+Q1D3yRTIXhIzlkxJyuJqEDCnhMWkwTK+TcSffZ62vpRJj1BOP1Z/wGol
         tqFw==
X-Forwarded-Encrypted: i=1; AJvYcCWO0nSfNIXwWbL1fP4VBenWkPqRHMZ98JPWNwmunn9D741v9SOyDIrrn08f9FRhxPsfs60dHC5/MQc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOg1wPSYtAOl/rxTa9i+EctoXa4DIX/ohadeDSIqoXkrFjFLk0
	dNG5zFcpClAd4WYWt5A7C9JfqDBR6bdE2/NJWkkUUhjeQTgV9xL9MD0HLB3LVK5H1C0=
X-Gm-Gg: ASbGncsZSqzWi6f8+qxnlmijY6hSguryCAhTFugNSpfEuapc73rm/BmOlFRBeYZVgGV
	83AbqlWEY/2g6YLTtcJ3x+zu/cZp6UsP3umgUfn0xVI2T/w6aps5z+JBS0xVvQMEvcRx3IyXpg5
	sOf9aTdDKEBS8RC4TLue0+mjGZvv0/dTvYNUk3FgG/7TtKQyI3Accy4pxaeW6ld+gtzSCbnHmPD
	Uilys26KSnL+aFkLjQIjY9Vecbw+7ITxMZibNvGDg3mtY4AIalspa+C0nWp9c5nQzvBC6r0msft
	uiroHill40v5uO4MdKWjX6r7qvGtJuT1O52m3pYdEXTRyqTuWNAyySWhCSDlQgPv10wef9vjWXq
	sJi2/rJ5aQqrdbT8R
X-Google-Smtp-Source: AGHT+IE/5a5zgQx+kk8SDVCqYIhLKXbR1w/+yPtxXvmHoTXBZp+TCtx5+O8hPK0X2ObUlWcFQP661w==
X-Received: by 2002:a17:90b:1d84:b0:312:1508:fb4d with SMTP id 98e67ed59e1d1-3130ce9fecfmr9750546a91.33.1749104124548;
        Wed, 04 Jun 2025 23:15:24 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/13] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Thu,  5 Jun 2025 11:44:50 +0530
Message-ID: <20250605061458.196003-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231525_709547_0A7C67C0 
X-CRM114-Status: GOOD (  13.07  )
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

The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
VMID related TLB mappings when a VCPU is moved from one host CPU
to another.

Let's move kvm_riscv_local_tlb_sanitize() to VMID management
sources and rename it to kvm_riscv_gstage_vmid_sanitize().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4c..134adc30af52 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -327,8 +327,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -376,6 +374,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
 void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 2f91ea5f8493..b3461bfd9756 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
-{
-	unsigned long vmid;
-
-	if (!kvm_riscv_gstage_vmid_bits() ||
-	    vcpu->arch.last_exit_cpu == vcpu->cpu)
-		return;
-
-	/*
-	 * On RISC-V platforms with hardware VMID support, we share same
-	 * VMID for all VCPUs of a particular Guest/VM. This means we might
-	 * have stale G-stage TLB entries on the current Host CPU due to
-	 * some other VCPU of the same Guest which ran previously on the
-	 * current Host CPU.
-	 *
-	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
-	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
-	 */
-
-	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
-	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
-}
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f98a1894d55b..cc7d00bcf345 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -961,12 +961,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		}
 
 		/*
-		 * Cleanup stale TLB enteries
+		 * Sanitize VMID mappings cached (TLB) on current CPU
 		 *
 		 * Note: This should be done after G-stage VMID has been
 		 * updated using kvm_riscv_gstage_vmid_ver_changed()
 		 */
-		kvm_riscv_local_tlb_sanitize(vcpu);
+		kvm_riscv_gstage_vmid_sanitize(vcpu);
 
 		trace_kvm_entry(vcpu);
 
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index ddc98714ce8e..92c01255f86f 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
 	kvm_for_each_vcpu(i, v, vcpu->kvm)
 		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
 }
+
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
