From: Sean Christopherson <seanjc@google.com>
Date: Fri,  2 Feb 2024 16:09:09 -0800
Subject: [PATCH v8 03/10] KVM: selftests: Add a macro to iterate over a
 sparsebit range
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com>
Message-ID: <20240203000917.376631-4-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ackerley Tng <ackerleytng@google.com>

Add sparsebit_for_each_set_range() to allow iterator over a range of set
bits in a range.  This will be used by x86 SEV guests to process protected
physical pages (each such page needs to be encrypted _after_ being "added"
to the VM).

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: split to separate patch]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/sparsebit.h | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/sparsebit.h b/tools/testing/selftests/kvm/include/sparsebit.h
index fb5170d57fcb..bc760761e1a3 100644
--- a/tools/testing/selftests/kvm/include/sparsebit.h
+++ b/tools/testing/selftests/kvm/include/sparsebit.h
@@ -66,6 +66,26 @@ void sparsebit_dump(FILE *stream, const struct sparsebit *sbit,
 		    unsigned int indent);
 void sparsebit_validate_internal(const struct sparsebit *sbit);
 
+/*
+ * Iterate over an inclusive ranges within sparsebit @s. In each iteration,
+ * @range_begin and @range_end will take the beginning and end of the set
+ * range, which are of type sparsebit_idx_t.
+ *
+ * For example, if the range [3, 7] (inclusive) is set, within the
+ * iteration, at range_begin will take the value 3 and @range_end will take
+ * the value 7.
+ *
+ * Ensure that there is at least one bit set before using this macro with
+ * sparsebit_any_set(), because sparsebit_first_set() will abort if none
+ * are set.
+ */
+#define sparsebit_for_each_set_range(s, range_begin, range_end)         \
+	for (range_begin = sparsebit_first_set(s),                      \
+	     range_end = sparsebit_next_clear(s, range_begin) - 1;	\
+	     range_begin && range_end;                                  \
+	     range_begin = sparsebit_next_set(s, range_end),            \
+	     range_end = sparsebit_next_clear(s, range_begin) - 1)
+
 #ifdef __cplusplus
 }
 #endif
-- 
2.43.0.594.gd9cf4e227d-goog


