Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46ACFD376
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1mxrBBiqrJjjJyVCwyZcrOvoZGEU5nyrH2ksI6Hm9I=; b=xwRLtIevG3IDOU
	+hY8l88bHS4oC/mPMZAz+X2RjTd3i9xS5WAPqW7Pgotkupc7+4hbg4h8nOLghx8WoRc6CqEn82Dsl
	pS4ncB/Zd/2O94Y9LmZreXEyiBnFUxQPSWNxYvTcNp++I99B+K6KWX4+BHfRSJl0rfcB0q3L2/H5F
	l9d1jPp83DbC3n9PtAk0x2LK77stM2axN+phvQzU120+cFKAy+i03dm4tFm9i/ePXIisdDOK+bSzM
	/W4ID62etiUAU07FDAQFTH7+3Euvwi/DJzIQN/xUqDmB+baGNectV8sgLBrEML+Qu7vdIRX4Izcq+
	FUgB2WlKJ1XrTp/FI0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProu-00000002hpd-3xu8;
	Mon, 01 Dec 2025 00:31:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProo-00000002hmy-3uAe;
	Mon, 01 Dec 2025 00:31:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6919C4405C;
	Mon,  1 Dec 2025 00:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02E3C16AAE;
	Mon,  1 Dec 2025 00:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764549063;
	bh=qq3bh/4Q+gsaYZv2rX/TRb2x3pUU1Bkzv3I7M+0D4tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOvUOcnbIDpEi99q+vwQaQAbXboGrrAKLol1N/vXUGQ1YkD4lvgX1TBXAeD+pms6M
	 pkWwpPVslYlE1tk5C9gHJx2Po0OgNS74LgqIbtAdZZAMSL3lc14rq9S4CCfd74LS8p
	 ziuqH3w6M1A9353hpiNLACOZOZOLxp/alQfozSvqwOlAYv9v8fIVUrzpjxBH282Ck5
	 S+YQFIjlqyGaJuiprXRU76jHQwz8sMKwoBGV/dMm1idtK9k4UHtYfWwqHoeTq0Oace
	 BEviOrlhUCHc851uTVtuyVkJyCJEIK+FdiJwhWmg3q9jihHQTlOPGtROu5GzsRUZgf
	 X+lA49p9f6DzQ==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	leobras@redhat.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	corbet@lwn.net
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH V3 1/4] RISC-V: paravirt: Add pvqspinlock KVM backend
Date: Sun, 30 Nov 2025 19:30:38 -0500
Message-Id: <20251201003041.695081-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201003041.695081-1-guoren@kernel.org>
References: <20251201003041.695081-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_163107_015968_B454EB93 
X-CRM114-Status: GOOD (  16.15  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Add the files functions needed to support the SBI PVLOCK (paravirt
qspinlock kick_cpu) extension. Implement kvm_sbi_ext_pvlock_kick_-
cpu(), and we only need to call the kvm_vcpu_kick() and bring
target_vcpu from the halt state.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
 arch/riscv/include/asm/sbi.h          |  5 +++
 arch/riscv/include/uapi/asm/kvm.h     |  1 +
 arch/riscv/kvm/Makefile               |  1 +
 arch/riscv/kvm/vcpu_sbi.c             |  4 ++
 arch/riscv/kvm/vcpu_sbi_pvlock.c      | 57 +++++++++++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pvlock.c

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 3497489e04db..d0df83ecd9fd 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -107,6 +107,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock;
 
 #ifdef CONFIG_RISCV_PMU_SBI
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index ccc77a89b1e2..dd0734e1ebb6 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -37,6 +37,7 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
+	SBI_EXT_PVLOCK = 0x50564C4B,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -505,6 +506,10 @@ enum sbi_mpxy_rpmi_attribute_id {
 #define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
 #define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
 
+enum sbi_ext_pvlock_fid {
+	SBI_EXT_PVLOCK_KICK_CPU = 0,
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 759a4852c09a..9d447995de84 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -211,6 +211,7 @@ enum KVM_RISCV_SBI_EXT_ID {
 	KVM_RISCV_SBI_EXT_STA,
 	KVM_RISCV_SBI_EXT_SUSP,
 	KVM_RISCV_SBI_EXT_FWFT,
+	KVM_RISCV_SBI_EXT_PVLOCK,
 	KVM_RISCV_SBI_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 07197395750e..40ddb7c06ffe 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -35,6 +35,7 @@ kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_sbi_system.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-y += vcpu_sbi_pvlock.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 1b13623380e1..dd74f789f44c 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -90,6 +90,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_ext[] = {
 		.ext_idx = KVM_RISCV_SBI_EXT_VENDOR,
 		.ext_ptr = &vcpu_sbi_ext_vendor,
 	},
+	{
+		.ext_idx = KVM_RISCV_SBI_EXT_PVLOCK,
+		.ext_ptr = &vcpu_sbi_ext_pvlock,
+	},
 };
 
 static const struct kvm_riscv_sbi_extension_entry *
diff --git a/arch/riscv/kvm/vcpu_sbi_pvlock.c b/arch/riscv/kvm/vcpu_sbi_pvlock.c
new file mode 100644
index 000000000000..aeb48c3fca50
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pvlock.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c), 2025 Alibaba Damo Academy
+ *
+ * Authors:
+ *     Guo Ren <guoren@kernel.org>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_pvlock_kick_cpu(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu *target;
+
+	target = kvm_get_vcpu_by_id(kvm, cp->a0);
+	if (!target)
+		return SBI_ERR_INVALID_PARAM;
+
+	kvm_vcpu_kick(target);
+
+	if (READ_ONCE(target->ready))
+		kvm_vcpu_yield_to(target);
+
+	return SBI_SUCCESS;
+}
+
+static int kvm_sbi_ext_pvlock_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				      struct kvm_vcpu_sbi_return *retdata)
+{
+	int ret = 0;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+
+	switch (funcid) {
+	case SBI_EXT_PVLOCK_KICK_CPU:
+		ret = kvm_sbi_ext_pvlock_kick_cpu(vcpu);
+		break;
+	default:
+		ret = SBI_ERR_NOT_SUPPORTED;
+	}
+
+	retdata->err_val = ret;
+
+	return 0;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pvlock = {
+	.extid_start = SBI_EXT_PVLOCK,
+	.extid_end = SBI_EXT_PVLOCK,
+	.handler = kvm_sbi_ext_pvlock_handler,
+};
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
