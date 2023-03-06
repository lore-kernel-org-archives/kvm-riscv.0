From: David Matlack <dmatlack@google.com>
Date: Mon,  6 Mar 2023 11:01:55 -0800
Subject: [PATCH v2 3/4] KVM: Allow custom names for KVM_STAT()
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <20230306190156.434452-4-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow custom names to be specified for stats built on KVM_STAT() via a
new inner macro __KVM_STAT(). e.g.

  KVM_STAT(VM, CUMULATIVE, NONE, foo),
  __KVM_STAT(VM, CUMULATIVE, NONE, bar, "custom_name"),
  ...

Custom name support enables decoupling the userspace-visible stat names
from their internal representation in C. This can allow future commits
to refactor the various stats structs without impacting userspace tools
that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. For example, the union
for pages_{4k,2m,1g} is no longer necessary. At Google, we have several
other out-of-tree stats that would benefit from this support.

No functional change intended.

Link: https://lore.kernel.org/all/20211019000459.3163029-1-jingzhangos at google.com/
Suggested-by: Jing Zhang <jingzhangos@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6673ae757c4e..fa026e8997b2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1761,40 +1761,43 @@ struct _kvm_stats_desc {
 	.name = _name,							       \
 }
 
-#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
-			      _bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+#define VM_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,    \
+			      _size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, _name, _type,       \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
-				_bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+#define VCPU_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,  \
+				_size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, _name, _type,     \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VM_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,     \
 		      _bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, _name, _type, _unit,	       \
 			_base, _exponent, _size, _bucket_size)
 
-#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VCPU_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,   \
 			_bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, _name, _type, _unit,      \
 			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
-#define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-	SCOPE##_STATS_DESC(stat, type, unit, base, exp, sz, bsz)
+#define STATS_DESC(SCOPE, stat, name, type, unit, base, exp, sz, bsz)	       \
+	SCOPE##_STATS_DESC(stat, name, type, unit, base, exp, sz, bsz)
 
-#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_##TYPE,			       \
+#define __KVM_STAT(SCOPE, TYPE, UNIT, _stat, _name)			       \
+	STATS_DESC(SCOPE, _stat, _name, KVM_STATS_TYPE_##TYPE,		       \
 		   KVM_STATS_UNIT_##UNIT, KVM_STATS_BASE_POW10, 0, 1, 0)
 
+#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
+	__KVM_STAT(SCOPE, TYPE, UNIT, _stat, #_stat)
+
 #define KVM_STAT_NSEC(SCOPE, _stat)					       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_CUMULATIVE,		       \
+	STATS_DESC(SCOPE, _stat, #_stat, KVM_STATS_TYPE_CUMULATIVE,	       \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9, 1, 0)
 
 #define KVM_HIST_NSEC(SCOPE, TYPE, _stat, _size, _bucket_size)		       \
-	STATS_DESC(VCPU_GENERIC, _stat, KVM_STATS_TYPE_##TYPE##_HIST,	       \
+	STATS_DESC(VCPU_GENERIC, _stat, #_stat, KVM_STATS_TYPE_##TYPE##_HIST,  \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9,	       \
 		   _size, _bucket_size)
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


