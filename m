From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:30:54 -0700
Subject: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it with
 other KVM related code
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
down in vfio_main.c to colocate them with other KVM-specific functions,
e.g. to allow wrapping them all with a single CONFIG_KVM check.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 80e39f7a6d8f..6368eed7b7b2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -381,58 +381,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
-#if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
-{
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!kvm)
-		return;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		return;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	ret = fn(kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = kvm;
-}
-
-void vfio_device_put_kvm(struct vfio_device *device)
-{
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!device->kvm)
-		return;
-
-	if (WARN_ON(!device->put_kvm))
-		goto clear;
-
-	device->put_kvm(device->kvm);
-	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
-clear:
-	device->kvm = NULL;
-}
-#endif
-
 /* true if the vfio_device has open_device() called but not close_device() */
 static bool vfio_assert_device_open(struct vfio_device *device)
 {
@@ -1354,6 +1302,58 @@ bool vfio_file_enforced_coherent(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
+#if IS_ENABLED(CONFIG_KVM)
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+{
+	void (*pfn)(struct kvm *kvm);
+	bool (*fn)(struct kvm *kvm);
+	bool ret;
+
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!kvm)
+		return;
+
+	pfn = symbol_get(kvm_put_kvm);
+	if (WARN_ON(!pfn))
+		return;
+
+	fn = symbol_get(kvm_get_kvm_safe);
+	if (WARN_ON(!fn)) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	ret = fn(kvm);
+	symbol_put(kvm_get_kvm_safe);
+	if (!ret) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	device->put_kvm = pfn;
+	device->kvm = kvm;
+}
+
+void vfio_device_put_kvm(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!device->kvm)
+		return;
+
+	if (WARN_ON(!device->put_kvm))
+		goto clear;
+
+	device->put_kvm(device->kvm);
+	device->put_kvm = NULL;
+	symbol_put(kvm_put_kvm);
+
+clear:
+	device->kvm = NULL;
+}
+#endif
+
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
 	struct vfio_device_file *df = file->private_data;
-- 
2.42.0.459.ge4e396fd5e-goog


