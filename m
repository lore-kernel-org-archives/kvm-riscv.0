Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D6ACD8CAE
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbqRtqNfnK6fgDEQbr1fAZLkXTMQzWz9MaDCnFeAwa4=; b=ypnahNim/AA059
	5IKMh2Nzdq8IACLeqWtBkDfriL42ZIZN6aYENqlpHZAXuUuN/TKfsraXBp3lhCpesAnGC8XUPAJ2Q
	PFBl9H5lEeWZJiUZnnXnQNvLKYdUURYxXHKZKxOEo/uMrKzXiRvb834sTn8giyI/QbcQshCfmWqET
	7aLivkNm4DxGcSySTj01pbdWXV2i4TTEXU0QWLc4Qtiipfn0sbhE/20Ds3Yp/cEWvJq55HJ4qTel2
	xI9n6efUJwdzSVTS48wFjGdaB3zoCWttMr9V8SD3EstL2Ou8BmFYVS4erOEd3jjpRnOSkb0AdQ3OR
	n4i2mKSJEcSyr6OaORGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC7-00000003pZ4-247Q;
	Mon, 08 Jun 2026 14:43:15 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC4-00000003pSS-0Abr
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:13 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 7F2382028AA;
	Mon,  8 Jun 2026 16:43:06 +0200 (CEST)
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
Subject: [PATCH 07/60] KVM: SVM: Add support for the SEV-SNP #HV IPI NAE event
Date: Mon,  8 Jun 2026 16:41:59 +0200
Message-ID: <20260608144252.351443-8-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074312_245065_C08DBDB8 
X-CRM114-Status: GOOD (  17.11  )
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

From: Melody Wang <huibo.wang@amd.com>

The #HV IPI NAE event allows the guest to send an IPI to other vCPUs in the
guest when the Restricted Injection feature is enabled. Implement the NAE
event as per GHCB specification.

Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Melody Wang <huibo.wang@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/uapi/asm/svm.h |  1 +
 arch/x86/kvm/lapic.c            | 24 +++++++++++++++++++++++-
 arch/x86/kvm/lapic.h            |  2 ++
 arch/x86/kvm/svm/sev.c          | 28 ++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/uapi/asm/svm.h b/arch/x86/include/uapi/asm/svm.h
index d84a13ac4627..d281dd21c540 100644
--- a/arch/x86/include/uapi/asm/svm.h
+++ b/arch/x86/include/uapi/asm/svm.h
@@ -122,6 +122,7 @@
 #define SVM_VMGEXIT_HVDB_SET			1
 #define SVM_VMGEXIT_HVDB_QUERY			2
 #define SVM_VMGEXIT_HVDB_CLEAR			3
+#define SVM_VMGEXIT_HV_IPI                      0x80000015ull
 #define SVM_VMGEXIT_SNP_RUN_VMPL		0x80000018ull
 #define SVM_VMGEXIT_SAVIC			0x8000001aull
 #define SVM_VMGEXIT_SAVIC_REGISTER_GPA		0
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 4078e624ca66..ab40a2e4ab9d 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2558,7 +2558,7 @@ static int kvm_lapic_reg_write(struct kvm_lapic *apic, u32 reg, u32 val)
 static int apic_mmio_write(struct kvm_vcpu *vcpu, struct kvm_io_device *this,
 			    gpa_t address, int len, const void *data)
 {
-	struct kvm_lapic *apic = to_lapic(this);
+	struct kvm_lapic *apic = this ? to_lapic(this) : vcpu->arch.apic;
 	unsigned int offset = address - apic->base_address;
 	u32 val;
 
@@ -3583,3 +3583,25 @@ void kvm_lapic_exit(void)
 	static_key_deferred_flush(&apic_sw_disabled);
 	WARN_ON(static_branch_unlikely(&apic_sw_disabled.key));
 }
+
+/* Send IPI by writing ICR with MSR write when X2APIC enabled, with mmio write when XAPIC enabled */
+int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data)
+{
+	u32 icr_msr_addr = APIC_BASE_MSR + (APIC_ICR >> 4);
+	struct kvm_lapic *apic = vcpu->arch.apic;
+	gpa_t gpa = apic->base_address + APIC_ICR;
+
+	if (!kvm_lapic_enabled(vcpu))
+		return 1;
+
+	if (vcpu->arch.apic_base & X2APIC_ENABLE) {
+		if (!kvm_x2apic_msr_write(vcpu, icr_msr_addr, data))
+			return 0;
+	} else {
+		if (!apic_mmio_write(vcpu, NULL, gpa, 4, &data))
+			return 0;
+	}
+
+	return 1;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_xapic_x2apic_send_ipi);
diff --git a/arch/x86/kvm/lapic.h b/arch/x86/kvm/lapic.h
index 274885af4ebc..afd440c88981 100644
--- a/arch/x86/kvm/lapic.h
+++ b/arch/x86/kvm/lapic.h
@@ -156,6 +156,8 @@ int kvm_hv_vapic_msr_read(struct kvm_vcpu *vcpu, u32 msr, u64 *data);
 int kvm_lapic_set_pv_eoi(struct kvm_vcpu *vcpu, u64 data, unsigned long len);
 void kvm_lapic_exit(void);
 
+int kvm_xapic_x2apic_send_ipi(struct kvm_vcpu *vcpu, u64 data);
+
 u64 kvm_lapic_readable_reg_mask(struct kvm_lapic *apic);
 
 static inline void kvm_lapic_set_irr(int vec, struct kvm_lapic *apic)
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 369fb1e36f58..d04f71836ef7 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -35,6 +35,7 @@
 #include "svm_ops.h"
 #include "cpuid.h"
 #include "trace.h"
+#include "lapic.h"
 
 #define GHCB_VERSION_MAX	2ULL
 #define GHCB_VERSION_MIN	1ULL
@@ -3538,6 +3539,10 @@ static int sev_es_validate_vmgexit(struct vcpu_svm *svm)
 		if (!is_sev_snp_guest(vcpu))
 			goto vmgexit_err;
 		break;
+	case SVM_VMGEXIT_HV_IPI:
+		if (!sev_snp_guest(vcpu->kvm))
+			goto vmgexit_err;
+		break;
 	default:
 		reason = GHCB_ERR_INVALID_EVENT;
 		goto vmgexit_err;
@@ -4416,6 +4421,22 @@ static int sev_snp_hv_doorbell_page(struct vcpu_svm *svm)
 	return 0;
 }
 
+static int sev_snp_hv_ipi(struct vcpu_svm *svm)
+{
+	struct kvm_vcpu *vcpu = &svm->vcpu;
+	u64 icr_info;
+
+	if (!sev_snp_guest(vcpu->kvm))
+		return -EINVAL;
+
+	icr_info = svm->vmcb->control.exit_info_1;
+
+	if (kvm_xapic_x2apic_send_ipi(vcpu, icr_info))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int sev_handle_vmgexit_msr_protocol(struct vcpu_svm *svm)
 {
 	struct vmcb_control_area *control = &svm->vmcb->control;
@@ -4698,6 +4719,13 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
 			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
 		}
 
+		ret = 1;
+		break;
+	case SVM_VMGEXIT_HV_IPI:
+		if (sev_snp_hv_ipi(svm)) {
+			ghcb_set_sw_exit_info_1(svm->sev_es.ghcb, 2);
+			ghcb_set_sw_exit_info_2(svm->sev_es.ghcb, GHCB_ERR_INVALID_INPUT);
+		}
 		ret = 1;
 		break;
 	case SVM_VMGEXIT_UNSUPPORTED_EVENT:
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
