From: David Matlack <dmatlack@google.com>
Date: Mon,  6 Mar 2023 11:01:54 -0800
Subject: [PATCH v2 2/4] KVM: Refactor designated initializer macros for struct _kvm_stats_desc
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <20230306190156.434452-3-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor the macros that generate struct _kvm_stats_desc designated
initializers to cut down on duplication.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 75 +++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 40 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 02b1151c2753..6673ae757c4e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1744,47 +1744,42 @@ struct _kvm_stats_desc {
 	char name[KVM_STATS_NAME_SIZE];
 };
 
-#define STATS_DESC_COMMON(type, unit, base, exp, sz, bsz)		       \
-	.flags = type | unit | base |					       \
-		 BUILD_BUG_ON_ZERO(type & ~KVM_STATS_TYPE_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(unit & ~KVM_STATS_UNIT_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(base & ~KVM_STATS_BASE_MASK),	       \
-	.exponent = exp,						       \
-	.size = sz,							       \
-	.bucket_size = bsz
-
-#define VM_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
+/* Generates a designated initializer list for a struct _kvm_stats_desc. */
+#define _KVM_STATS_DESC(_struct, _field, _name, _type, _unit, _base,	       \
+			_exponent, _size, _bucket_size)			       \
+{									       \
 	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, generic.stat)   \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, generic.stat) \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VM_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
+		.flags = _type | _unit | _base |			       \
+			 BUILD_BUG_ON_ZERO(_type & ~KVM_STATS_TYPE_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_unit & ~KVM_STATS_UNIT_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_base & ~KVM_STATS_BASE_MASK),      \
+		.exponent = _exponent,					       \
+		.size = _size,						       \
+		.bucket_size = _bucket_size,				       \
+		.offset = offsetof(_struct, _field),			       \
+	},								       \
+	.name = _name,							       \
+}
+
+#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
+			      _bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
+				_bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+		      _bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+			_base, _exponent, _size, _bucket_size)
+
+#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+			_bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
 #define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


