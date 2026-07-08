Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD22C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzQ7PhEPmXlAr292k2oEnLnpFBpEjvRFmUctXIyKmeA=; b=diOKCepVJL3ii4
	6dVMXnbOR16quYH6XJVmFFgsv9CAlLomd6fehDSuKUE0xi3KMMsWN5+zbZ2jJOjDOi777HxgbfZcG
	Srvb5hniGtetNEDE1/wL7PCRURq4aittauG+r3xWN7lsURemk1SdhTVf0NXojGqjikH7el0eER3bk
	CtAnlrzLTpzRAQp3DCv4O823Y8N7NrAxfGLY50JiVSqVgDYM0jsQE8SB1ii6cYll39IB4/qSDltDJ
	6BxdUPzr6HykiUObi/Biu+44nlOqmXZNjtJvfk7/i7Uwd4b8tkBwGcMEZCW3kGrmc5N7849HAsQvC
	4qJTKLVizs+YixBGpdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ63-0000000GGVJ-3HcD;
	Wed, 08 Jul 2026 03:37:15 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5W-0000000GFq5-0UIa
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:49 +0000
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so250628a91.3
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481801; x=1784086601; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=MNi+wcgHy4W3t3jVJuqyyDpLOyYGJFWeyR1BWeFz1JvsY+SkNZemThrXPdtfrUoLWR
         b9IsvaM2jz6OrnIaHJhPm4mM8k31RA96RdnUvIGdAEpUJthI3SJ4ASpQ+rwABgAxzISA
         8j3wCh9v4fsk/NcIA57uk0/E0ShSdp5Nn3LqaV1Y5IpfuawC6xD5pCdEl5pVYvZrg8YM
         7n7I3xGrszfKz6Cp5XN1pybjTPTFuL36o7HcL8a/b2fYGHxryxhIX983ZhCmc3aoug6n
         5ovNrJgradL2qajUx/dxJj3MstWakG2ahN5hLbscgOMuDJJWOcMiUILQI46zUXHzM8HK
         bIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481801; x=1784086601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bdv2Ctkz/FW0hn4mHAySYNVwcrKaEen484H6Mm8b//s=;
        b=Ug2Mjos12qs/D4v1wgkODTmW4xyO4EYbCKDJNvUr+Q2Tm5mNtRpCupZ+EuPbHAvM3j
         Fyk/MRactFxiQ6dVhXrJCd8xJUk0iXgYIlbCNGfPqe+uFZgE4NKie62+9gUw4JamIfTS
         5PijW7BzCP6G0C7XmrcV4eDDuHT/ix0qDtSw1B0rnEDgrEE1ETG3CGKepj7S8/eLqIuc
         JfJWltQ9i6zcTcESs0+RDUjqXzJOQjd8gqK2VtVLrl+7NacfllANI30Kjm+KVmlmE57q
         71DnSlun9+bzBl5f0j+NpBGeZ5OEe23zhdAnvH/q/3++FJ7D4LwqsjLwPx/tHFqrfG4W
         5EFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVnbIZrlWSiaiNnsNtLGCr+r3nV+knLCBkbVZCi0xUEZgmEXgg3ibljFTfLsh9EEQpAzGDsNMKx/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQHEdHK+SJE4q7gD3VMiNMHJEZdaaCPnXudyUm5tkdXymrRvrt
	tLlIjVUt9O4Vo9iXxuaO6mn9PWQ7y2S6WNscNka2EHNc8JGXZeBcParA
X-Gm-Gg: AfdE7cmzQSQRLz9MrbNlPbr8owQnnadP5y21CLal9cC134g+Wk6QGI+L73fy8cULM20
	V3eqVda4B0/CiwuIEnHf1Tcw4hh/mIEejnAD5W2tbUmPb7RqeEMcZMEMEVD2Cr4mX9WBVcMdCrM
	12jIryQEyYBpkME2/pfScAmm8k4uVaB7pYV4ELhE8Jq5Ns8ENjsuKppdLIxt4RA+PgjY21IppXZ
	IsRCNH7C3QJxwj/99m/IkYEh2myqbMOR/GQ+yb2CxICSnzIuk5OrTQ/MhDb/WxQb3wAbEuESe1Y
	TZdA0EQ1hFHdHNLF8zgo4aiMwtnA06Ib100kLg5aBJrdfwAFeWjtB0M6g4IkzK0hh0ED59YtGSs
	h8OiZGs1wRDB5UD6yz54N+MRuskz4FfTDmjnR3F1soWR8dEFV+p23FSoKIXWl6pxXbZxeYZlUMt
	Eq0sm+3SeOs7zuPA9hO/wt2uiEScDm0vmY49uVytY=
X-Received: by 2002:a17:90b:5290:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-3894395516amr711810a91.40.1783481801232;
        Tue, 07 Jul 2026 20:36:41 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:40 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:36 -0700
Subject: [PATCH v3 13/17] riscv: kvm: Add emulated test csr
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-13-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=5057;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=oHl0N2vpojWj02TJpZJMDrHhq8G9Cg4fhg6BkSVUMOQ=;
 b=f0/7JmOW73SvUy0ZQ6FNsrrekd4jPc1glCSUOAPV1wBR0CHqyzyAdPHvMn6Kgn7F2HQA/J1RT
 JVOWRlWMUMtAgaNQP6Ht6OpkBNnT+1o0lQcFeJd/mP/Dc/RKXZIqzFo
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203642_998674_9350DD57 
X-CRM114-Status: GOOD (  18.68  )
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

To test the riscv kvm implementation of emulated CSRs, add support to
emulate the vsscratch csr when CONFIG_RISCV_KVM_TEST_CSR is set.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.debug                   |  1 +
 arch/riscv/include/asm/kvm_host.h          | 10 ++++++++++
 arch/riscv/include/asm/kvm_vcpu_test_csr.h | 15 +++++++++++++++
 arch/riscv/kvm/Kconfig.debug               | 16 ++++++++++++++++
 arch/riscv/kvm/Makefile                    |  1 +
 arch/riscv/kvm/vcpu_insn.c                 |  5 +++++
 arch/riscv/kvm/vcpu_test_csr.c             | 21 +++++++++++++++++++++
 7 files changed, 69 insertions(+)

diff --git a/arch/riscv/Kconfig.debug b/arch/riscv/Kconfig.debug
index eafe17ebf710..be202267da6d 100644
--- a/arch/riscv/Kconfig.debug
+++ b/arch/riscv/Kconfig.debug
@@ -1 +1,2 @@
 source "arch/riscv/kernel/tests/Kconfig.debug"
+source "arch/riscv/kvm/Kconfig.debug"
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..4d30d30ebefc 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -167,6 +167,12 @@ struct kvm_vcpu_reset_state {
 	unsigned long a1;
 };
 
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+struct kvm_test_csr {
+	unsigned long val;
+};
+#endif
+
 struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
@@ -265,6 +271,10 @@ struct kvm_vcpu_arch {
 		gpa_t shmem;
 		u64 last_steal;
 	} sta;
+
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	struct kvm_test_csr test_csr;
+#endif
 };
 
 /*
diff --git a/arch/riscv/include/asm/kvm_vcpu_test_csr.h b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
new file mode 100644
index 000000000000..a844fccaafc3
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_test_csr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __KVM_VCPU_RISCV_TEST_CSR_H
+#define __KVM_VCPU_RISCV_TEST_CSR_H
+
+#include <asm/kvm_vcpu_insn.h>
+
+#define KVM_RISCV_VCPU_TEST_CSR_FUNCS \
+	{.base = CSR_VSSCRATCH,	.count = 1,	.func = kvm_riscv_vcpu_test_csr },
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask);
+
+#endif /* !__KVM_VCPU_RISCV_TEST_CSR_H */
diff --git a/arch/riscv/kvm/Kconfig.debug b/arch/riscv/kvm/Kconfig.debug
new file mode 100644
index 000000000000..dc76e02120a3
--- /dev/null
+++ b/arch/riscv/kvm/Kconfig.debug
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "arch/riscv/kvm testing"
+
+config RISCV_KVM_TEST_CSR
+        bool "Test KVM CSR emulation"
+        depends on KVM
+        default n
+        help
+            Enable this option to enable the emulation of a test hypervisor csr.
+            The KVM test csr is the vsscratch register. Once this is enabled,
+            reading/writing to the vsscratch register will trap into the host
+            supervisor and reflect the change.
+
+            If unsure, say N.
+
+endmenu # "arch/riscv/kvm testing"
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 296c2ba05089..5092b86751c4 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -38,6 +38,7 @@ kvm-y += vcpu_sbi_sta.o
 kvm-y += vcpu_sbi_system.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_switch.o
+kvm-$(CONFIG_RISCV_KVM_TEST_CSR) += vcpu_test_csr.o
 kvm-y += vcpu_timer.o
 kvm-y += vcpu_vector.o
 kvm-y += vm.o
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 78adc2830819..c3e4cf2cd44b 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -10,6 +10,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 
+#include <asm/kvm_vcpu_test_csr.h>
+
 struct insn_func {
 	unsigned long mask;
 	unsigned long match;
@@ -112,6 +114,9 @@ static int seed_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_num,
 static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
+#ifdef CONFIG_RISCV_KVM_TEST_CSR
+	KVM_RISCV_VCPU_TEST_CSR_FUNCS
+#endif
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
 };
 
diff --git a/arch/riscv/kvm/vcpu_test_csr.c b/arch/riscv/kvm/vcpu_test_csr.c
new file mode 100644
index 000000000000..b8aa503cdaba
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_test_csr.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_vcpu_insn.h>
+#include <asm/kvm_vcpu_test_csr.h>
+
+#define vcpu_to_test_csr(vcpu) (&(vcpu)->arch.test_csr)
+
+int kvm_riscv_vcpu_test_csr(struct kvm_vcpu *vcpu, unsigned int csr_num,
+			    unsigned long *val, unsigned long new_val,
+			    unsigned long wr_mask)
+{
+	struct kvm_test_csr *test_csr = vcpu_to_test_csr(vcpu);
+
+	*val = test_csr->val;
+
+	if (wr_mask)
+		test_csr->val = (test_csr->val & ~wr_mask) | (new_val & wr_mask);
+
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
