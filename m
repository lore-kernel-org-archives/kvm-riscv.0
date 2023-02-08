From: Thomas Huth <thuth@redhat.com>
Date: Wed,  8 Feb 2023 15:01:01 +0100
Subject: [PATCH v2 2/6] KVM: s390: Use "int" as return type for kvm_s390_get/set_skeys()
In-Reply-To: <20230208140105.655814-1-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
Message-ID: <20230208140105.655814-3-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These two functions only return normal integers, so it does not
make sense to declare the return type as "long" here.

Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/s390/kvm/kvm-s390.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index e4890e04b210..8ad1972b8a73 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -1992,7 +1992,7 @@ static int kvm_s390_vm_has_attr(struct kvm *kvm, struct kvm_device_attr *attr)
 	return ret;
 }
 
-static long kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
+static int kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 {
 	uint8_t *keys;
 	uint64_t hva;
@@ -2040,7 +2040,7 @@ static long kvm_s390_get_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 	return r;
 }
 
-static long kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
+static int kvm_s390_set_skeys(struct kvm *kvm, struct kvm_s390_skeys *args)
 {
 	uint8_t *keys;
 	uint64_t hva;
-- 
2.31.1


