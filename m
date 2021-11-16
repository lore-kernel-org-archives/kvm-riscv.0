From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Tue, 16 Nov 2021 17:34:40 +0100
Subject: [PATCH v2 3/6] KVM: PPC: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <20211116163443.88707-1-vkuznets@redhat.com>
References: <20211116163443.88707-1-vkuznets@redhat.com>
Message-ID: <20211116163443.88707-4-vkuznets@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It doesn't make sense to return the recommended maximum number of
vCPUs which exceeds the maximum possible number of vCPUs.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 8ab90ce8738f..ccac8d5686ff 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -641,9 +641,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		 * implementations just count online CPUs.
 		 */
 		if (hv_enabled)
-			r = num_present_cpus();
+			r = min_t(unsigned int, num_present_cpus(), KVM_MAX_VCPUS);
 		else
-			r = num_online_cpus();
+			r = min_t(unsigned int, num_online_cpus(), KVM_MAX_VCPUS);
 		break;
 	case KVM_CAP_MAX_VCPUS:
 		r = KVM_MAX_VCPUS;
-- 
2.33.1


