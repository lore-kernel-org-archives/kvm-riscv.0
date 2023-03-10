From: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Mar 2023 14:14:14 -0800
Subject: [PATCH 2/2] KVM: Don't enable hardware after a restart/shutdown is initiated
In-Reply-To: <20230310221414.811690-1-seanjc@google.com>
References: <20230310221414.811690-1-seanjc@google.com>
Message-ID: <20230310221414.811690-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reject hardware enabling, i.e. VM creation, if a restart/shutdown has
been initiated to avoid re-enabling hardware between kvm_reboot() and
machine_{halt,power_off,restart}().  The restart case is especially
problematic (for x86) as enabling VMX (or clearing GIF in KVM_RUN on
SVM) blocks INIT, which results in the restart/reboot hanging as BIOS
is unable to wake and rendezvous with APs.

Note, this bug, and the original issue that motivated the addition of
kvm_reboot(), is effectively limited to a forced reboot, e.g. `reboot -f`.
In a "normal" reboot, userspace will gracefully teardown userspace before
triggering the kernel reboot (modulo bugs, errors, etc), i.e. any process
that might do ioctl(KVM_CREATE_VM) is long gone.

Fixes: 8e1c18157d87 ("KVM: VMX: Disable VMX when system shutdown")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6cdfbb2c641b..b2bf4c105181 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5182,7 +5182,20 @@ static void hardware_disable_all(void)
 static int hardware_enable_all(void)
 {
 	atomic_t failed = ATOMIC_INIT(0);
-	int r = 0;
+	int r;
+
+	/*
+	 * Do not enable hardware virtualization if the system is going down.
+	 * If userspace initiated a forced reboot, e.g. reboot -f, then it's
+	 * possible for an in-flight KVM_CREATE_VM to trigger hardware enabling
+	 * after kvm_reboot() is called.  Note, this relies on system_state
+	 * being set _before_ kvm_reboot(), which is why KVM uses a syscore ops
+	 * hook instead of registering a dedicated reboot notifier (the latter
+	 * runs before system_state is updated).
+	 */
+	if (system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF ||
+	    system_state == SYSTEM_RESTART)
+		return -EBUSY;
 
 	/*
 	 * When onlining a CPU, cpu_online_mask is set before kvm_online_cpu()
@@ -5195,6 +5208,8 @@ static int hardware_enable_all(void)
 	cpus_read_lock();
 	mutex_lock(&kvm_lock);
 
+	r = 0;
+
 	kvm_usage_count++;
 	if (kvm_usage_count == 1) {
 		on_each_cpu(hardware_enable_nolock, &failed, 1);
-- 
2.40.0.rc1.284.g88254d51c5-goog


