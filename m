From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Sep 2023 17:30:57 -0700
Subject: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO, don't
 do circular lookup
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
Message-ID: <20230916003118.2540661-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
KVM and VFIO do symbol lookups increases the overall complexity and places
an unnecessary dependency on KVM (from VFIO) without adding any value.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio.h      |  2 ++
 drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
 include/linux/vfio.h     |  4 ++-
 virt/kvm/vfio.c          |  9 +++--
 4 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index a1f741365075..eec51c7ee822 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -19,6 +19,8 @@ struct vfio_container;
 
 struct vfio_kvm_reference {
 	struct kvm			*kvm;
+	bool				(*get_kvm)(struct kvm *kvm);
+	void				(*put_kvm)(struct kvm *kvm);
 	spinlock_t			lock;
 };
 
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index e77e8c6aae2f..1f58ab6dbcd2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -16,7 +16,6 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
-#include <linux/kvm_host.h>
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -1306,38 +1305,22 @@ EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 void vfio_device_get_kvm_safe(struct vfio_device *device,
 			      struct vfio_kvm_reference *ref)
 {
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
 	lockdep_assert_held(&device->dev_set->lock);
 
+	/*
+	 * Note!  The "kvm" and "put_kvm" pointers *must* be transferred to the
+	 * device so that the device can put its reference to KVM.  KVM can
+	 * invoke vfio_device_set_kvm() to detach from VFIO, i.e. nullify all
+	 * pointers in @ref, even if a device holds a reference to KVM!  That
+	 * also means that detaching KVM from VFIO only prevents "new" devices
+	 * from using KVM, it doesn't invalidate KVM references in existing
+	 * devices.
+	 */
 	spin_lock(&ref->lock);
-
-	if (!ref->kvm)
-		goto out;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		goto out;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		goto out;
+	if (ref->kvm && ref->get_kvm(ref->kvm)) {
+		device->kvm = ref->kvm;
+		device->put_kvm = ref->put_kvm;
 	}
-
-	ret = fn(ref->kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		goto out;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = ref->kvm;
-
-out:
 	spin_unlock(&ref->lock);
 }
 
@@ -1353,28 +1336,37 @@ void vfio_device_put_kvm(struct vfio_device *device)
 
 	device->put_kvm(device->kvm);
 	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
 clear:
 	device->kvm = NULL;
 }
 
 static void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
-				struct kvm *kvm)
+				struct kvm *kvm,
+				bool (*get_kvm)(struct kvm *kvm),
+				void (*put_kvm)(struct kvm *kvm))
 {
+	if (WARN_ON_ONCE(kvm && (!get_kvm || !put_kvm)))
+		return;
+
 	spin_lock(&ref->lock);
 	ref->kvm = kvm;
+	ref->get_kvm = get_kvm;
+	ref->put_kvm = put_kvm;
 	spin_unlock(&ref->lock);
 }
 
-static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm)
+static void vfio_group_set_kvm(struct vfio_group *group, struct kvm *kvm,
+			       bool (*get_kvm)(struct kvm *kvm),
+			       void (*put_kvm)(struct kvm *kvm))
 {
 #if IS_ENABLED(CONFIG_VFIO_GROUP)
-	vfio_device_set_kvm(&group->kvm_ref, kvm);
+	vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
 #endif
 }
 
-static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
+static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm,
+				     bool (*get_kvm)(struct kvm *kvm),
+				     void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_device_file *df = file->private_data;
 
@@ -1383,27 +1375,31 @@ static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 	 * be propagated to vfio_device::kvm when the file is bound to
 	 * iommufd successfully in the vfio device cdev path.
 	 */
-	vfio_device_set_kvm(&df->kvm_ref, kvm);
+	vfio_device_set_kvm(&df->kvm_ref, kvm, get_kvm, put_kvm);
 }
 
 /**
  * vfio_file_set_kvm - Link a kvm with VFIO drivers
  * @file: VFIO group file or VFIO device file
  * @kvm: KVM to link
+ * @get_kvm: Callback to get a reference to @kvm
+ * @put_kvm: Callback to put a reference to @kvm
  *
  * When a VFIO device is first opened the KVM will be available in
  * device->kvm if one was associated with the file.
  */
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm))
 {
 	struct vfio_group *group;
 
 	group = vfio_group_from_file(file);
 	if (group)
-		vfio_group_set_kvm(group, kvm);
+		vfio_group_set_kvm(group, kvm, get_kvm, put_kvm);
 
 	if (vfio_device_from_file(file))
-		vfio_device_file_set_kvm(file, kvm);
+		vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
 #endif
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e80955de266c..35e970e3d3fb 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -312,7 +312,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
 #if IS_ENABLED(CONFIG_KVM)
-void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
+		       bool (*get_kvm)(struct kvm *kvm),
+		       void (*put_kvm)(struct kvm *kvm));
 #endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
diff --git a/virt/kvm/vfio.c b/virt/kvm/vfio.c
index ca24ce120906..f14fcbb34bc6 100644
--- a/virt/kvm/vfio.c
+++ b/virt/kvm/vfio.c
@@ -37,13 +37,18 @@ struct kvm_vfio {
 
 static void kvm_vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 {
-	void (*fn)(struct file *file, struct kvm *kvm);
+	void (*fn)(struct file *file, struct kvm *kvm,
+		   bool (*get_kvm)(struct kvm *kvm),
+		   void (*put_kvm)(struct kvm *kvm));
 
 	fn = symbol_get(vfio_file_set_kvm);
 	if (!fn)
 		return;
 
-	fn(file, kvm);
+	if (kvm)
+		fn(file, kvm, kvm_get_kvm_safe, kvm_put_kvm);
+	else
+		fn(file, kvm, NULL, NULL);
 
 	symbol_put(vfio_file_set_kvm);
 }
-- 
2.42.0.459.ge4e396fd5e-goog


