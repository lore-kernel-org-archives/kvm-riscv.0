Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE83CEE01F6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1dSIV6lVn+PYvXGgQuu0oLfg+Xbu+mnUDgfafRoH1A=; b=Xi4vkv0IAXg9pg
	Q7dElKRvOtg57NaGWPyfaz79CQdBf2UA/NA8yA8DERByfYhJT+X7d/i0c3T+lnKFkyj+YjZptS71l
	L0CMAIlbYXl0Lz2HEOfcv9SnQ5v6Xlh3vx4/GDS+pi/erPYgG2yEd8aY0EvdoBePCtRasSsFBODXY
	zqWgIURqzfGRs59zegYArnBkp4qvYWPHHQY8ip1zIekRc7UPGFvGHcWW/5hSeZPGpVKQIDxJPkDd5
	o4H4QMoQvAge4LY9q3Zu6xpTDveAGpAbQ+p0E6CS+WCXvOVWXsaEc5/ZCm2J/oGoO/i7/Rw3tVsRc
	13mbixkK81xm7/e+SEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaije-00000005NLG-1xiK;
	Tue, 30 Dec 2025 23:02:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij2-00000005Mhn-3KjH
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:13 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so23431306a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135719; x=1767740519; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kFEesFGPsutGHqF0001WthlsbSNNmBrKZgvGONrq/UE=;
        b=RQi/6PKpy34T6Xg5kG22NipluaqLO3iswqWRR91ao+xV4Bf4ptmNY56NsQ5HIsezeg
         MaqEjroXpVjiPw+kgrnDRKodHi7mXD3YI3nOapRiH8VSbVTlPO0525dKZBgw1KDj9pE2
         mytdCkdEfxdV8KF9f/mJAlj4eOQiPMFt3/KiMzB1OXNpvBCfn9xR4DWnSsjkBhr7zoFt
         EejSOmJepp3eu1bLCKu4EY5Y43Dz/TZEVcDA7kbjlER/oarHqLz7mNiBWr6oCuAS3wjR
         l+ywB3luEC4Ubt5POaWBkEawu+WeG2QFtxrHneEAUKn91Io0djf1yVDkkwpXLzmrwxBK
         9nog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135719; x=1767740519;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFEesFGPsutGHqF0001WthlsbSNNmBrKZgvGONrq/UE=;
        b=Q8ZaTuiBxrh0ARlFU4Wk/5gwWMB0P5XOmElB73RlQGWrAMMCWbOGTXknuvAXcoW50L
         lLPBv6gahHMV56rNPIQnpElHEKfYR2EUQAWN7ATkuqsdu+HVJ+NUCNmdbhaq9SGmrcBj
         wX1JlryAtOT/M16F5SBw0o85sQebZtSPBET/Q3g5dn1AjDSrIcKxZHBzR2TxZ5LDojGM
         HzbibOUGuu86qT3D+xclHr3OkaY8ngR8E2gsLXGnjpKEkGqMI9Qr8LEevUGsUOB3RDDP
         Ai4lYQH/zCU+tARmMiNOvXNFsy6RgDxMgvJZuSmRfahX3WM5Rbzq9eqx2PpzJM5f555u
         gVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6HI4DO3tzlLMMEWkAjs+nv9HWl7r+o95Z4fplT6+Rg3ZUSMAWds8B5Ewm/UYyONcOvOLPpNY8uLg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2QyU/zqFPZdu21HmKdCpHGvPXpcgpxqgp9JqiNdsE0JiYN9IQ
	q+DlEijYEL1BcjQ8TyKviAaKWQLUEdHghQ+uG8KiI3fahjoJ3jcmH5XpiQgWsaR+fmtEbsrxV1B
	D4vpUiQ==
X-Google-Smtp-Source: AGHT+IFMvmVZegtbcaH8ygYeOdZA18LUtrqVKCjaPL92fD8viNNyqFkg9jykfPAXGidnl1kcsTEoQKpdcsc=
X-Received: from pjbqe11.prod.google.com ([2002:a17:90b:4f8b:b0:34a:9e02:ffa0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a52:b0:340:99fd:9676
 with SMTP id 98e67ed59e1d1-34e9212aaa9mr28973871a91.10.1767135719406; Tue, 30
 Dec 2025 15:01:59 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:33 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-5-seanjc@google.com>
Subject: [PATCH v4 04/21] KVM: selftests: Kill eptPageTablePointer
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150200_826227_EE153106 
X-CRM114-Status: GOOD (  10.15  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Yosry Ahmed <yosry.ahmed@linux.dev>

Replace the struct overlay with explicit bitmasks, which is clearer and
less error-prone. See commit f18b4aebe107 ("kvm: selftests: do not use
bitfields larger than 32-bits for PTEs") for an example of why bitfields
are not preferable.

Remove the unused PAGE_SHIFT_4K definition while at it.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86/vmx.c | 35 +++++++++++------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 1954ccdfc353..85043bb1ec4d 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -10,10 +10,16 @@
 #include "processor.h"
 #include "vmx.h"
 
-#define PAGE_SHIFT_4K  12
-
 #define KVM_EPT_PAGE_TABLE_MIN_PADDR 0x1c0000
 
+#define EPTP_MT_SHIFT		0 /* EPTP memtype bits 2:0 */
+#define EPTP_PWL_SHIFT		3 /* EPTP page walk length bits 5:3 */
+#define EPTP_AD_ENABLED_SHIFT	6 /* EPTP AD enabled bit 6 */
+
+#define EPTP_WB			(X86_MEMTYPE_WB << EPTP_MT_SHIFT)
+#define EPTP_PWL_4		(3ULL << EPTP_PWL_SHIFT) /* PWL is (levels - 1) */
+#define EPTP_AD_ENABLED		(1ULL << EPTP_AD_ENABLED_SHIFT)
+
 bool enable_evmcs;
 
 struct hv_enlightened_vmcs *current_evmcs;
@@ -34,14 +40,6 @@ struct eptPageTableEntry {
 	uint64_t suppress_ve:1;
 };
 
-struct eptPageTablePointer {
-	uint64_t memory_type:3;
-	uint64_t page_walk_length:3;
-	uint64_t ad_enabled:1;
-	uint64_t reserved_11_07:5;
-	uint64_t address:40;
-	uint64_t reserved_63_52:12;
-};
 int vcpu_enable_evmcs(struct kvm_vcpu *vcpu)
 {
 	uint16_t evmcs_ver;
@@ -196,16 +194,15 @@ static inline void init_vmcs_control_fields(struct vmx_pages *vmx)
 	vmwrite(PIN_BASED_VM_EXEC_CONTROL, rdmsr(MSR_IA32_VMX_TRUE_PINBASED_CTLS));
 
 	if (vmx->eptp_gpa) {
-		uint64_t ept_paddr;
-		struct eptPageTablePointer eptp = {
-			.memory_type = X86_MEMTYPE_WB,
-			.page_walk_length = 3, /* + 1 */
-			.ad_enabled = ept_vpid_cap_supported(VMX_EPT_VPID_CAP_AD_BITS),
-			.address = vmx->eptp_gpa >> PAGE_SHIFT_4K,
-		};
+		uint64_t eptp = vmx->eptp_gpa | EPTP_WB | EPTP_PWL_4;
 
-		memcpy(&ept_paddr, &eptp, sizeof(ept_paddr));
-		vmwrite(EPT_POINTER, ept_paddr);
+		TEST_ASSERT((vmx->eptp_gpa & ~PHYSICAL_PAGE_MASK) == 0,
+			    "Illegal bits set in vmx->eptp_gpa");
+
+		if (ept_vpid_cap_supported(VMX_EPT_VPID_CAP_AD_BITS))
+			eptp |= EPTP_AD_ENABLED;
+
+		vmwrite(EPT_POINTER, eptp);
 		sec_exec_ctl |= SECONDARY_EXEC_ENABLE_EPT;
 	}
 
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
