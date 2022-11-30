From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:27 +0000
Subject: [PATCH v2 43/50] KVM: Ensure CPU is stable during low level hardware enable/disable
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-44-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the non-raw smp_processor_id() in the low hardware enable/disable
helpers as KVM absolutely relies on the CPU being stable, e.g. KVM would
end up with incorrect state if the task were migrated between accessing
cpus_hardware_enabled and actually enabling/disabling hardware.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d985b24c423b..a46d61e9c053 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5028,7 +5028,7 @@ static struct miscdevice kvm_dev = {
 
 static void hardware_enable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
+	int cpu = smp_processor_id();
 	int r;
 
 	if (cpumask_test_cpu(cpu, cpus_hardware_enabled))
@@ -5070,7 +5070,7 @@ static int kvm_online_cpu(unsigned int cpu)
 
 static void hardware_disable_nolock(void *junk)
 {
-	int cpu = raw_smp_processor_id();
+	int cpu = smp_processor_id();
 
 	if (!cpumask_test_cpu(cpu, cpus_hardware_enabled))
 		return;
-- 
2.38.1.584.g0f3c55d4c2-goog


