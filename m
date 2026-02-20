Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FDCC531EA
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 00:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W/U6BNGXDugapf2vszqOuys8uxI0RPVm4B+SBrbkTiE=; b=nWtM53O+VFrNEcYyDDlDhEH9pu
	hbm85NoKfJzmTOA7cfFUFQZzz7oMQo508dk9h8C9Hw3Lq2K0OjAKk2AfykX03s1LUayXDBppR8Gsg
	k8m5igROxeTb94bqb9kVTmrGum4efhVuUUj4M5kM4Lh/u21Ceaie1n1dSJJbGWyJ4vKvZNxkAFu+V
	kYg1UDp676uH79mwJOqJ/5b7xigMULlRkrB7KX/OdtqzOyz8UvP87P310KUjL3mgMiXZffeHSebwQ
	wSE4UbUp4kXcKWs6U1HBHnOlaOQEgB8aA8DjDoQVDnnkM+OARcLqUgu6sORPBUntQH5USrXSIpXuN
	P+olOesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbW-0000000Clwh-3fof;
	Fri, 20 Feb 2026 00:42:46 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbQ-0000000ClqF-3BgQ
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2a7d7b87977so16329515ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Feb 2026 16:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548159; x=1772152959; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQBtHoV4k6KEICmmP/ngOD0EM850XDOZaHNBuV2LJiQ=;
        b=CzMd6QqNHTKJceIOgQV8NrWXAteF2h3LCpt9JiEpXYmn7tJ0sJrREsCR1DW9G9vZnl
         zQnYBEjusTeQ2ofBIfXCoOI9d+u4r7phFWt1vZG5yeMo0ZIicMFe01dGT2taIJpRWhEu
         Honn9xOe/kjg/eei4YKH/AlnkBDsyK9/TWevrgktZL7x7CKWPnZE3MATG/+NgMvtmN8H
         MlV3MgDAydXTugN9zTg4fRzy9mlFc/crWg1WqT8MDXavfssRJB1fDYrLaaNu1UqGGvjn
         1Nmt0PzlCz+hvq9iPQeexpblryEUUIVViZVQDQiXEECnvADavV3Jrf9ah3pSruHkLQPU
         0LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548159; x=1772152959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQBtHoV4k6KEICmmP/ngOD0EM850XDOZaHNBuV2LJiQ=;
        b=sViblIRMF5PTWBoPH14Q+6LHwnv585UG9qmX4ygi+T3xpJ6R11sCwp5LmoNxqgU2ae
         Dei+A+beKzMw25Iavk1YxT04ACC9odk0miJ2ycx0xNOC0bhr4Rp48qHflHh9zuOxEscj
         BEcJK5XIzGjVnRUi5Tb5AZmTRHT+gsI0Ik5OlpunB0liUjnRHjhD2qohNEXMIR6jqSm4
         yJsYIFS/WF1zuXKOCGrNDFcPhQz+3/pVRcjoHM4YuNAg+3nlao1zlxpiq4ETVr5N6Esn
         9hUDertR2DY+52ypAC+qKk8SGDBcSHmdU4MjiM3G52UmTbhGpKk0PNqSD2ozPmI9bcUJ
         BQfw==
X-Forwarded-Encrypted: i=1; AJvYcCVoZPdClxRcglBw+EvN2DZSymGiINOnvTEUFioBBMGo5kzGouB6XnHmHgLSZrXU+4ztlULyW8QPM6g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvOqbLS8Af8yIiWTQhumRNIGST77X85HXhlMMakHByp/ZRM0Ci
	Rpqg9xzQG9DwOt7icfDm0ybFYZC0yW3xQNfRnhQSwUxSd7g+evAKdqrC/Dtyp9r0aAr8P4DntG8
	49DMwSWCm/Mvg3w==
X-Received: from pllk12.prod.google.com ([2002:a17:902:760c:b0:2a9:8200:4985])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:41c7:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2ad50ecdb29mr69263015ad.25.1771548159168;
 Thu, 19 Feb 2026 16:42:39 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:16 +0000
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-4-dmatlack@google.com>
Subject: [PATCH v2 03/10] KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164240_828307_A5D8C2DC 
X-CRM114-Status: GOOD (  12.37  )
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

Fix various Hyper-V selftests to use gpa_t for variables that contain
guest physical addresses, rather than gva_t.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/x86/hyperv_evmcs.c    | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_features.c | 2 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c      | 6 +++---
 tools/testing/selftests/kvm/x86/hyperv_svm_test.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
index 58f27dcc3d5f..9fa91b0f168a 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_evmcs.c
@@ -76,7 +76,7 @@ void l2_guest_code(void)
 }
 
 void guest_code(struct vmx_pages *vmx_pages, struct hyperv_test_pages *hv_pages,
-		gva_t hv_hcall_page_gpa)
+		gpa_t hv_hcall_page_gpa)
 {
 #define L2_GUEST_STACK_SIZE 64
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
diff --git a/tools/testing/selftests/kvm/x86/hyperv_features.c b/tools/testing/selftests/kvm/x86/hyperv_features.c
index 3fe5f52e404b..fde6682c49eb 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_features.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_features.c
@@ -82,7 +82,7 @@ static void guest_msr(struct msr_data *msr)
 	GUEST_DONE();
 }
 
-static void guest_hcall(gva_t pgs_gpa, struct hcall_data *hcall)
+static void guest_hcall(gpa_t pgs_gpa, struct hcall_data *hcall)
 {
 	u64 res, input, output;
 	uint8_t vector;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_ipi.c b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
index f6385346dd10..f239923e232d 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_ipi.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_ipi.c
@@ -45,13 +45,13 @@ struct hv_send_ipi_ex {
 	struct hv_vpset vp_set;
 };
 
-static inline void hv_init(gva_t pgs_gpa)
+static inline void hv_init(gpa_t pgs_gpa)
 {
 	wrmsr(HV_X64_MSR_GUEST_OS_ID, HYPERV_LINUX_OS_ID);
 	wrmsr(HV_X64_MSR_HYPERCALL, pgs_gpa);
 }
 
-static void receiver_code(void *hcall_page, gva_t pgs_gpa)
+static void receiver_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	u32 vcpu_id;
 
@@ -85,7 +85,7 @@ static inline void nop_loop(void)
 		asm volatile("nop");
 }
 
-static void sender_guest_code(void *hcall_page, gva_t pgs_gpa)
+static void sender_guest_code(void *hcall_page, gpa_t pgs_gpa)
 {
 	struct hv_send_ipi *ipi = (struct hv_send_ipi *)hcall_page;
 	struct hv_send_ipi_ex *ipi_ex = (struct hv_send_ipi_ex *)hcall_page;
diff --git a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
index 436c16460fe0..b7f35424c838 100644
--- a/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
+++ b/tools/testing/selftests/kvm/x86/hyperv_svm_test.c
@@ -67,7 +67,7 @@ void l2_guest_code(void)
 
 static void __attribute__((__flatten__)) guest_code(struct svm_test_data *svm,
 						    struct hyperv_test_pages *hv_pages,
-						    gva_t pgs_gpa)
+						    gpa_t pgs_gpa)
 {
 	unsigned long l2_guest_stack[L2_GUEST_STACK_SIZE];
 	struct vmcb *vmcb = svm->vmcb;
-- 
2.53.0.414.gf7e9f6c205-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
