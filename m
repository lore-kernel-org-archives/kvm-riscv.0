From: Sean Christopherson <seanjc@google.com>
Date: Mon, 22 Nov 2021 18:34:12 +0000
Subject: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko]
 undefined!
In-Reply-To: <YZvP3AuTdEdje/IY@angband.pl>
References: <YZvP3AuTdEdje/IY@angband.pl>
Message-ID: <YZvipLmkQQZ3va8F@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 22, 2021, Adam Borowski wrote:
> Hi!
> With CONFIG_KVM=m and CONFIG_SMP=n, the build fails with:
> ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko] undefined!
> 
> An obvious fix would be to change riscv_cpuid_to_hartid_mask() from a
> static inline function to a real exported symbol

Amusingly, the !SMP version is buggy as it assumes the boot/only CPU is in the
target mask, which will not always be true, e.g. if a VM has more vCPUs than there
are pCPUs in the system, kvm_riscv_vcpu_sbi_ecall() can send in a mask without any
CPUs set.  Even if that's somewhat of a bogus use case, arguably a common helper
shouldn't have different semantics for SMP vs !SMP.

> but I wonder: is there a point in allowing such combinations that no one will
> test?

Eh, even if there is currently no known use case, unless the fix is really nasty,
there's no reason to actively prevent a potentially legitimate use case.  But it's
somewhat of a moot point as the easy fix is to use the SMP version for both cases.  

I think this would be an appropriate fix?


From f6510acd68feb90aa3ec393031cbcde725c52420 Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Mon, 22 Nov 2021 10:01:15 -0800
Subject: [PATCH] RISC-V: Use common riscv_cpuid_to_hartid_mask() for both
 SMP=y and SMP=n

Use what is currently the SMP=y version of riscv_cpuid_to_hartid_mask()
for both SMP=y and SMP=n to fix a build failure with KVM=m and SMP=n due
to boot_cpu_hartid not being exported.  This also fixes a second bug
where the SMP=n version assumes the sole CPU in the system is in the
incoming mask, which may not hold true in kvm_riscv_vcpu_sbi_ecall() if
the KVM guest VM has multiple vCPUs (on a SMP=n system).

Reported-by: Adam Borowski <kilobyte@angband.pl>
Fixes: 1ef46c231df4 ("RISC-V: Implement new SBI v0.2 extensions")
Cc: stable at vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/smp.h | 10 ++--------
 arch/riscv/kernel/setup.c    | 10 ++++++++++
 arch/riscv/kernel/smp.c      | 10 ----------
 3 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index a7d2811f3536..62d0e6e61da8 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -43,7 +43,6 @@ void arch_send_call_function_ipi_mask(struct cpumask *mask);
 void arch_send_call_function_single_ipi(int cpu);

 int riscv_hartid_to_cpuid(int hartid);
-void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);

 /* Set custom IPI operations */
 void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
@@ -85,13 +84,6 @@ static inline unsigned long cpuid_to_hartid_map(int cpu)
 	return boot_cpu_hartid;
 }

-static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
-					      struct cpumask *out)
-{
-	cpumask_clear(out);
-	cpumask_set_cpu(boot_cpu_hartid, out);
-}
-
 static inline void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
 {
 }
@@ -102,6 +94,8 @@ static inline void riscv_clear_ipi(void)

 #endif /* CONFIG_SMP */

+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
+
 #if defined(CONFIG_HOTPLUG_CPU) && (CONFIG_SMP)
 bool cpu_has_hotplug(unsigned int cpu);
 #else
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b9620e5f00ba..6c5caf5eb906 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -59,6 +59,16 @@ atomic_t hart_lottery __section(".sdata")
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);

+void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
+{
+	int cpu;
+
+	cpumask_clear(out);
+	for_each_cpu(cpu, in)
+		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
+}
+EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
+
 /*
  * Place kernel memory regions on the resource tree so that
  * kexec-tools can retrieve them from /proc/iomem. While there
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 921d9d7df400..d0147294691d 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -59,16 +59,6 @@ int riscv_hartid_to_cpuid(int hartid)
 	return -ENOENT;
 }

-void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
-{
-	int cpu;
-
-	cpumask_clear(out);
-	for_each_cpu(cpu, in)
-		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
-}
-EXPORT_SYMBOL_GPL(riscv_cpuid_to_hartid_mask);
-
 bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 {
 	return phys_id == cpuid_to_hartid_map(cpu);
--

