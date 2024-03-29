From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:21 +0800
Subject: [PATCH RFC 05/11] riscv: cpufeature: Add Sdtrig optional CSRs
 checks
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sdtrig extension introduce two optional CSRs [hcontext/scontext],
that will be storing PID/Guest OS ID for the debug feature.

The availability of these two CSRs will be determined by
DTS and Smstateen extension [h/s]stateen0 CSR bit 57.

If all CPUs hcontext/scontext checks are satisfied, it will enable the
use_hcontext/use_scontext static branch.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h |   6 ++
 arch/riscv/kernel/cpufeature.c     | 161 +++++++++++++++++++++++++++++++++++++
 2 files changed, 167 insertions(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 7efdb0584d47..07432550ed54 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -69,6 +69,12 @@ static __always_inline bool has_fpu(void) { return false; }
 #define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
+DECLARE_STATIC_KEY_FALSE(use_scontext);
+static __always_inline bool has_scontext(void)
+{
+	return static_branch_likely(&use_scontext);
+}
+
 extern struct task_struct *__switch_to(struct task_struct *,
 				       struct task_struct *);
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 080c06b76f53..44ff84b920af 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -35,6 +35,19 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
+atomic_t hcontext_disable;
+atomic_t scontext_disable;
+
+DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
+EXPORT_SYMBOL(use_hcontext);
+
+DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
+EXPORT_SYMBOL(use_scontext);
+
+/* Record the maximum number that the hcontext CSR allowed to hold */
+atomic_long_t hcontext_id_share;
+EXPORT_SYMBOL(hcontext_id_share);
+
 /**
  * riscv_isa_extension_base() - Get base extension word
  *
@@ -719,6 +732,154 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+static void __init sdtrig_percpu_csrs_check(void *data)
+{
+	struct device_node *node;
+	struct device_node *debug_node;
+	struct device_node *trigger_module;
+
+	unsigned int cpu = smp_processor_id();
+
+	/*
+	 * Expect every cpu node has the [h/s]context-present property
+	 * otherwise, jump to sdtrig_csrs_disable_all to disable all access to
+	 * [h/s]context CSRs
+	 */
+	node = of_cpu_device_node_get(cpu);
+	if (!node)
+		goto sdtrig_csrs_disable_all;
+
+	debug_node = of_get_compatible_child(node, "riscv,debug-v1.0.0");
+	of_node_put(node);
+
+	if (!debug_node)
+		goto sdtrig_csrs_disable_all;
+
+	trigger_module = of_get_child_by_name(debug_node, "trigger-module");
+	of_node_put(debug_node);
+
+	if (!trigger_module)
+		goto sdtrig_csrs_disable_all;
+
+	if (!(IS_ENABLED(CONFIG_KVM) &&
+	      of_property_read_bool(trigger_module, "hcontext-present")))
+		atomic_inc(&hcontext_disable);
+
+	if (!of_property_read_bool(trigger_module, "scontext-present"))
+		atomic_inc(&scontext_disable);
+
+	of_node_put(trigger_module);
+
+	/*
+	 * Before access to hcontext/scontext CSRs, if the smstateen
+	 * extension is present, the accessibility will be controlled
+	 * by the hstateen0[H]/sstateen0 CSRs.
+	 */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SMSTATEEN)) {
+		u64 hstateen_bit, sstateen_bit;
+
+		if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_h)) {
+#if __riscv_xlen > 32
+			csr_set(CSR_HSTATEEN0, SMSTATEEN0_HSCONTEXT);
+			hstateen_bit = csr_read(CSR_HSTATEEN0);
+#else
+			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_HSCONTEXT >> 32);
+			hstateen_bit = csr_read(CSR_HSTATEEN0H) << 32;
+#endif
+			if (!(hstateen_bit & SMSTATEEN0_HSCONTEXT))
+				goto sdtrig_csrs_disable_all;
+
+		} else {
+			if (IS_ENABLED(CONFIG_KVM))
+				atomic_inc(&hcontext_disable);
+
+			/*
+			 * In RV32, the smstateen extension doesn't provide
+			 * high 32 bits of sstateen0 CSR which represent
+			 * accessibility for scontext CSR;
+			 * The decision is left on whether the dts has the
+			 * property to access the scontext CSR.
+			 */
+#if __riscv_xlen > 32
+			csr_set(CSR_SSTATEEN0, SMSTATEEN0_HSCONTEXT);
+			sstateen_bit = csr_read(CSR_SSTATEEN0);
+
+			if (!(sstateen_bit & SMSTATEEN0_HSCONTEXT))
+				atomic_inc(&scontext_disable);
+#endif
+		}
+	}
+
+	/*
+	 * The code can only access hcontext/scontext CSRs if:
+	 * The cpu dts node have [h/s]context-present;
+	 * If Smstateen extension is presented, then the accessibility bit
+	 * toward hcontext/scontext CSRs is enabled; Or the Smstateen extension
+	 * isn't available, thus the access won't be blocked by it.
+	 *
+	 * With writing 1 to the every bit of these CSRs, we retrieve the
+	 * maximum bits that is available on the CSRs. and decide
+	 * whether it's suit for its context recording operation.
+	 */
+	if (IS_ENABLED(CONFIG_KVM) &&
+	    !atomic_read(&hcontext_disable)) {
+		unsigned long hcontext_available_bits = 0;
+
+		csr_write(CSR_HCONTEXT, -1UL);
+		hcontext_available_bits = csr_swap(CSR_HCONTEXT, hcontext_available_bits);
+
+		/* hcontext CSR is required by at least 1 bit */
+		if (hcontext_available_bits)
+			atomic_long_and(hcontext_available_bits, &hcontext_id_share);
+		else
+			atomic_inc(&hcontext_disable);
+	}
+
+	if (!atomic_read(&scontext_disable)) {
+		unsigned long scontext_available_bits = 0;
+
+		csr_write(CSR_SCONTEXT, -1UL);
+		scontext_available_bits = csr_swap(CSR_SCONTEXT, scontext_available_bits);
+
+		/* scontext CSR is required by at least the sizeof pid_t */
+		if (scontext_available_bits < ((1UL << (sizeof(pid_t) << 3)) - 1))
+			atomic_inc(&scontext_disable);
+	}
+
+	return;
+
+sdtrig_csrs_disable_all:
+	if (IS_ENABLED(CONFIG_KVM))
+		atomic_inc(&hcontext_disable);
+
+	atomic_inc(&scontext_disable);
+}
+
+static int __init sdtrig_enable_csrs_fill(void)
+{
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SDTRIG)) {
+		atomic_long_set(&hcontext_id_share, -1UL);
+
+		/* check every CPUs sdtrig extension optional CSRs */
+		sdtrig_percpu_csrs_check(NULL);
+		smp_call_function(sdtrig_percpu_csrs_check, NULL, 1);
+
+		if (IS_ENABLED(CONFIG_KVM) &&
+		    !atomic_read(&hcontext_disable)) {
+			pr_info("riscv-sdtrig: Writing 'GuestOS ID' to hcontext CSR is enabled\n");
+			static_branch_enable(&use_hcontext);
+		}
+
+		if (!atomic_read(&scontext_disable)) {
+			pr_info("riscv-sdtrig: Writing 'PID' to scontext CSR is enabled\n");
+			static_branch_enable(&use_scontext);
+		}
+	}
+	return 0;
+}
+
+arch_initcall(sdtrig_enable_csrs_fill);
+
 void riscv_user_isa_enable(void)
 {
 	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))

-- 
2.43.2


