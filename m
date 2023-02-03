From: Thomas Huth <thuth@redhat.com>
Date: Fri,  3 Feb 2023 10:42:24 +0100
Subject: [PATCH 1/7] KVM: Standardize on "int" return types instead of "long" in kvm_main.c
In-Reply-To: <20230203094230.266952-1-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
Message-ID: <20230203094230.266952-2-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

KVM functions use "long" return values for functions that are wired up
to "struct file_operations", but otherwise use "int" return values for
functions that can return 0/-errno in order to avoid unintentional
divergences between 32-bit and 64-bit kernels.
Some code still uses "long" in unnecessary spots, though, which can
cause a little bit of confusion and unnecessary size casts. Let's
change these spots to use "int" types, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c60384b5ae0..cd46467252a9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4475,7 +4475,7 @@ static int kvm_ioctl_create_device(struct kvm *kvm,
 	return 0;
 }
 
-static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
+static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 {
 	switch (arg) {
 	case KVM_CAP_USER_MEMORY:
@@ -5053,7 +5053,7 @@ static int kvm_dev_ioctl_create_vm(unsigned long type)
 static long kvm_dev_ioctl(struct file *filp,
 			  unsigned int ioctl, unsigned long arg)
 {
-	long r = -EINVAL;
+	int r = -EINVAL;
 
 	switch (ioctl) {
 	case KVM_GET_API_VERSION:
-- 
2.31.1


