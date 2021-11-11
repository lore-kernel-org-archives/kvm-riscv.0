From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Thu, 11 Nov 2021 17:27:46 +0100
Subject: [PATCH 5/5] KVM: x86: Drop arbitraty KVM_SOFT_MAX_VCPUS
In-Reply-To: <20211111162746.100598-1-vkuznets@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
Message-ID: <20211111162746.100598-6-vkuznets@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM_CAP_NR_VCPUS is used to get the "recommended" maximum number of
VCPUs and arm64/mips/riscv report num_online_cpus(). Powerpc reports
either num_online_cpus() or num_present_cpus(), s390 has multiple
constants depending on hardware features. On x86, KVM reports an
arbitrary value of '710' which is supposed to be the maximum tested
value but it's possible to test all KVM_MAX_VCPUS even when there are
less physical CPUs available.

Drop the arbitrary '710' value and return num_online_cpus() on x86 as
well. The recommendation will match other architectures and will mean
'no CPU overcommit'.

For reference, QEMU only queries KVM_CAP_NR_VCPUS to print a warning
when the requested vCPU number exceeds it. The static limit of '710'
is quite weird as smaller systems with just a few physical CPUs should
certainly "recommend" less.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 1 -
 arch/x86/kvm/x86.c              | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 88fce6ab4bbd..0232a00598f2 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -38,7 +38,6 @@
 #define __KVM_HAVE_ARCH_VCPU_DEBUGFS
 
 #define KVM_MAX_VCPUS 1024
-#define KVM_SOFT_MAX_VCPUS 710
 
 /*
  * In x86, the VCPU ID corresponds to the APIC ID, and APIC IDs
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ac83d873d65b..18a00a7c23bc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4137,7 +4137,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = !static_call(kvm_x86_cpu_has_accelerated_tpr)();
 		break;
 	case KVM_CAP_NR_VCPUS:
-		r = KVM_SOFT_MAX_VCPUS;
+		r = min_t(unsigned int, num_online_cpus(), KVM_MAX_VCPUS);
 		break;
 	case KVM_CAP_MAX_VCPUS:
 		r = KVM_MAX_VCPUS;
-- 
2.33.1


