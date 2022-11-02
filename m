From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:19:05 +0000
Subject: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-39-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chao Gao <chao.gao@intel.com>

Disable CPU hotplug during hardware_enable_all() to prevent the corner
case where if the following sequence occurs:

  1. A hotplugged CPU marks itself online in cpu_online_mask
  2. The hotplugged CPU enables interrupt before invoking KVM's ONLINE
     callback
  3  hardware_enable_all() is invoked on another CPU right

the hotplugged CPU will be included in on_each_cpu() and thus get sent
through hardware_enable_nolock() before kvm_online_cpu() is called.

        start_secondary { ...
                set_cpu_online(smp_processor_id(), true); <- 1
                ...
                local_irq_enable();  <- 2
                ...
                cpu_startup_entry(CPUHP_AP_ONLINE_IDLE); <- 3
        }

KVM currently fudges around this race by keeping track of which CPUs have
done hardware enabling (see commit 1b6c016818a5 "KVM: Keep track of which
cpus have virtualization enabled"), but that's an inefficient, convoluted,
and hacky solution.

Signed-off-by: Chao Gao <chao.gao@intel.com>
[sean: split to separate patch, write changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c  |  8 +++++++-
 virt/kvm/kvm_main.c | 10 ++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a7b1d916ecb2..a15e54ba0471 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9283,7 +9283,13 @@ static int kvm_x86_check_processor_compatibility(struct kvm_x86_init_ops *ops)
 	int cpu = smp_processor_id();
 	struct cpuinfo_x86 *c = &cpu_data(cpu);
 
-	WARN_ON(!irqs_disabled());
+	/*
+	 * Compatibility checks are done when loading KVM and when enabling
+	 * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
+	 * compatible, i.e. KVM should never perform a compatibility check on
+	 * an offline CPU.
+	 */
+	WARN_ON(!irqs_disabled() && cpu_active(cpu));
 
 	if (__cr4_reserved_bits(cpu_has, c) !=
 	    __cr4_reserved_bits(cpu_has, &boot_cpu_data))
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fd9e39c85549..4e765ef9f4bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5088,6 +5088,15 @@ static int hardware_enable_all(void)
 {
 	int r = 0;
 
+	/*
+	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
+	 * is called, and so on_each_cpu() between them includes the CPU that
+	 * is being onlined.  As a result, hardware_enable_nolock() may get
+	 * invoked before kvm_online_cpu().
+	 *
+	 * Disable CPU hotplug to prevent scenarios where KVM sees
+	 */
+	cpus_read_lock();
 	raw_spin_lock(&kvm_count_lock);
 
 	kvm_usage_count++;
@@ -5102,6 +5111,7 @@ static int hardware_enable_all(void)
 	}
 
 	raw_spin_unlock(&kvm_count_lock);
+	cpus_read_unlock();
 
 	return r;
 }
-- 
2.38.1.431.g37b22c650d-goog


