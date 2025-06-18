Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7AC7115A
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCQa7DTfT5103hq0QJlqB/CaXFhxxdc+sxVAoFkX3Zw=; b=MaYDAD2Hy5ta5J
	+FaEmX8rQ1AcJeR1+JnVTPfovK091P4bNnrTpuvi1ycQXqzGMTuH5ne51T4Fp5zumlb4yolH3KAIH
	uf6XPh3XOEJTT1xnsCDms+XuJ7y5ACiuaUfoOXYPIFZMek6lbL402U9eUPITDNfFV9vTO/mg0IDHE
	U5uzk9DUqOu62vUMdW12MrhszHaKMhzdqS62pgeHS3ZqU0tj+P11SskQyVGLSCHNpKkCKZlJBZIfi
	/L6Fpc0VITT9K8jcTIbzaLuCXfhcmU+r/rj9sq+TEBwX0RYAyI+mJ1bjf+7k52jH0MV3TlrWUA5yS
	C2PL/muKEy9oLu9q9daQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWl-0000000AEb8-2X1Q;
	Wed, 18 Jun 2025 13:08:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5E-00000009xfM-2RxJ
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:02 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2350fc2591dso5606545ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246560; x=1750851360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=kMhCbrwz2/W6LZUkWiS1WdU+d/1U3Mzbh1Lhf8uk1ePUlef6B0pHhucV+4dn/0bfNy
         UlfOheb6GfNa5oNx0wb4k8QdmE4U7na0WoakFvm5Lf1YVdQlJigL4RDVjT2Tx7TjtVLj
         ZdS+vgRkdIYiINpTekFYOMxjwFWoVCrWxLr1HyJ5uiH0KtQg0SxjKD5Jqcm9cz/mIlPK
         gzAf7QYlqEHAYr3GMjwffVI94WbC/ZFA64LyMIZjFM4a1Pq2+EagjrJee+OdE0+vZ8/V
         +vmttWy1FHVq/t7SbUc9U2g+0ppETSGIj9AsaI5OLG83n8ayMvFF09p6u3OhrMJ/asNG
         6nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246560; x=1750851360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W7Bv8eoCvTNzkNO4nvyVAxgoupNAJKpC3g9nF1nD78=;
        b=WTq55L1uJY4ZgIdHizfmwHv4ECD+hcLMnVOIVUttu1srL5M+Zix2PPQosIOueFg6c6
         h5kB9Fi4xacC8l6ovmxOf9x7Hpw95mt0TsErUMA7SnmIgP0p/KOJTIwFEOkvkoFUuTl/
         nvDnbH7qEGXTBh+07H/LsNZR/CIUGY0q72b8D7fbgHkgZj4Kdo1YAt4HW9H38L8U86eJ
         WtUAXz1MTh5/qqdjQu2m7piRFaYBI308GyOckD2TA0zKpwgLrTzoipFu0arp861C+zNr
         awSMFe42cOIgZhpzjJ53UIEUfsA8f6b3Bzvwumi78Lb4r1Xf+hF57wEONy7sveWwwWgr
         PCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsJbr4bhkk3tLXTuTm3i9wFNcyd51WxGe+IvYEM1V39mF2SHkzJzyChPQsIFnsDcFg7z7CImuQpKY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7/2hAf8jWqFd5nGo/P4HUDUkLMt30uT95R42It3jKmh5oYCbP
	Fe8+8NVkxbeCt+fOiYzTk2zMbLemC9mUeKDeCEYjiuyVOIAbxZQ97ND6VcgRe2YgY3A=
X-Gm-Gg: ASbGncsrKMdHBGaN2F3Y/rjVw9SXaz0Li5mcKPBqh8xy+uCuY/Sgke9FifJqJxAaEne
	Ax/A28m6VLLgi3Y9p+SqXLkBr0E7FnmpuHJfCgV4jyVg7DRc85FeKfpUT/yU0kZ99X3Dk0VXzqn
	6ZoVCYxV/nhNbDe8/mnD1H9aXsixTqhBUWRz3taDndiuioe1vqqRcPmHJlqZlkm7KH6f1zJlq31
	hcgAN6MwcFlmJp/PrCiaXS6n6eWS+9qmmtgPDZjHlQoJBgiY0NbwvCInMIbLGHV7xBem9n5RAcg
	fb72jMcE/dM6NJDdygpshJlJNtAfgGP1vQSf7EmXQa7yj8gCeVNBkjY8718PavDZ8r4aWF3rdLa
	d0Akl5wu+RatuKCV1Iw==
X-Google-Smtp-Source: AGHT+IG6YfMEu9lcXrd2qiAepReJXbM/lA1ChWg4x51TipxipgSLPLblK8ZINKPH1NwWxJ/vO5o07w==
X-Received: by 2002:a17:902:c94e:b0:231:9817:6ec1 with SMTP id d9443c01a7336-237c20e022cmr32723525ad.17.1750246559668;
        Wed, 18 Jun 2025 04:35:59 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:59 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 03/12] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Wed, 18 Jun 2025 17:05:23 +0530
Message-ID: <20250618113532.471448-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043600_622186_19D35ED4 
X-CRM114-Status: GOOD (  12.84  )
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 +--
 arch/riscv/kvm/tlb.c              | 23 -----------------------
 arch/riscv/kvm/vcpu.c             |  4 ++--
 arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
 4 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 9a617bf5363d..8aa705ac75a5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -331,8 +331,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
-void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
-
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
@@ -380,6 +378,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
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
index f9fb3dbbe0c3..a2dd4161e5a4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -962,12 +962,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
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
