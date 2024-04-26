From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 26 Apr 2024 16:44:51 -0700
Subject: [RFC PATCH 1/7] riscv: kvm: add support for FWFT SBI extension
In-Reply-To: <20240418142701.1493091-2-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-2-cleger@rivosinc.com>
Message-ID: <Ziw8c0X0K3mXjJWK@debug.ba.rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 18, 2024 at 04:26:40PM +0200, Cl?ment L?ger wrote:
>Add support for FWFT extension in KVM
>
>Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
>---
> arch/riscv/include/asm/kvm_host.h          |   5 +
> arch/riscv/include/asm/kvm_vcpu_sbi.h      |   1 +
> arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  37 ++++++
> arch/riscv/include/uapi/asm/kvm.h          |   1 +
> arch/riscv/kvm/Makefile                    |   1 +
> arch/riscv/kvm/vcpu.c                      |   5 +
> arch/riscv/kvm/vcpu_sbi.c                  |   4 +
> arch/riscv/kvm/vcpu_sbi_fwft.c             | 136 +++++++++++++++++++++
> 8 files changed, 190 insertions(+)
> create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
>
>diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
>index 484d04a92fa6..be60aaa07f57 100644
>--- a/arch/riscv/include/asm/kvm_host.h
>+++ b/arch/riscv/include/asm/kvm_host.h
>@@ -19,6 +19,7 @@
> #include <asm/kvm_vcpu_fp.h>
> #include <asm/kvm_vcpu_insn.h>
> #include <asm/kvm_vcpu_sbi.h>
>+#include <asm/kvm_vcpu_sbi_fwft.h>
> #include <asm/kvm_vcpu_timer.h>
> #include <asm/kvm_vcpu_pmu.h>
>
>@@ -169,6 +170,7 @@ struct kvm_vcpu_csr {
> struct kvm_vcpu_config {
> 	u64 henvcfg;
> 	u64 hstateen0;
>+	u64 hedeleg;
> };
>
> struct kvm_vcpu_smstateen_csr {
>@@ -261,6 +263,9 @@ struct kvm_vcpu_arch {
> 	/* Performance monitoring context */
> 	struct kvm_pmu pmu_context;
>
>+	/* Firmware feature SBI extension context */
>+	struct kvm_sbi_fwft fwft_context;
>+
> 	/* 'static' configurations which are set only once */
> 	struct kvm_vcpu_config cfg;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>index b96705258cf9..3a33bbacc233 100644
>--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>@@ -86,6 +86,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
>+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>
>diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>new file mode 100644
>index 000000000000..7dc1b80c7e6c
>--- /dev/null
>+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
>@@ -0,0 +1,37 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * Copyright (c) 2023 Rivos Inc
>+ *
>+ * Authors:
>+ *     Atish Patra <atishp@rivosinc.com>

nit: probably need to fix Copyright year and Authors here :-)
Same in all new files being introduced.

>+ */
>+
>+#ifndef __KVM_VCPU_RISCV_FWFT_H
>+#define __KVM_VCPU_RISCV_FWFT_H
>+
>+#include <asm/sbi.h>
>+
>+#define KVM_SBI_FWFT_FEATURE_COUNT	1
>+
>+static int kvm_sbi_fwft_set(struct kvm_vcpu *vcpu,
>+			    enum sbi_fwft_feature_t feature,
>+			    unsigned long value, unsigned long flags)
>+{
>+	struct kvm_sbi_fwft_config *conf = kvm_sbi_fwft_get_config(vcpu,
>+								   feature);
>+	if (!conf)
>+		return SBI_ERR_DENIED;

Curious,
Why denied and not something like NOT_SUPPORTED NOT_AVAILABLE here?

>+
>+	if ((flags & ~SBI_FWFT_SET_FLAG_LOCK) != 0)
>+		return SBI_ERR_INVALID_PARAM;
>+
>+	if (conf->flags & SBI_FWFT_SET_FLAG_LOCK)
>+		return SBI_ERR_DENIED;
>+
>+	conf->flags = flags;
>+
>+	return conf->feature->set(vcpu, conf, value);
>+}
>+

