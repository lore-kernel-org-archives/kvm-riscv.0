From: Andrew Jones <ajones@ventanamicro.com>
Date: Sun, 17 Dec 2023 21:40:25 +0100
Subject: [PATCH v3 05/13] RISC-V: KVM: Add steal-update vcpu request
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
Message-ID: <20231217204019.36492-20-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a new vcpu request to inform a vcpu that it should record its
steal-time information. The request is made each time it has been
detected that the vcpu task was not assigned a cpu for some time,
which is easy to do by making the request from vcpu-load. The record
function is just a stub for now and will be filled in with the rest
of the steal-time support functions in following patches.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 3 +++
 arch/riscv/kvm/vcpu.c             | 5 +++++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 0eefd9c991ae..230b82c3118d 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -41,6 +41,7 @@
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+#define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
@@ -372,4 +373,6 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
+
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bf3952d1a621..6995b8b641e4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -541,6 +541,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_vcpu_aia_load(vcpu, cpu);
 
+	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
+
 	vcpu->cpu = cpu;
 }
 
@@ -614,6 +616,9 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_HFENCE, vcpu))
 			kvm_riscv_hfence_process(vcpu);
+
+		if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
+			kvm_riscv_vcpu_record_steal_time(vcpu);
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 839911dcd837..e28351c9488b 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -8,6 +8,10 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/sbi.h>
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
+{
+}
+
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 {
 	return SBI_ERR_FAILURE;
-- 
2.43.0


