From: Vipin Sharma <vipinsh@google.com>
Date: Fri,  2 Jun 2023 09:09:07 -0700
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker actions
 based on the callback's return value
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
References: <20230602160914.4011728-1-vipinsh@google.com>
Message-ID: <20230602160914.4011728-10-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Document what the page table walker do when walker callback function returns
a value.

Current documentation is not correct as negative error of -EAGAIN on a
non-shared page table walker doesn't terminate the walker and continues
to the next step.

There might be a better place to keep this information, for now this
documentation will work as a reference guide until a better way is
found.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8ef7e8f3f054..957bc20dab00 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -711,8 +711,19 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * after invoking the walker callback, allowing the walker to descend into
  * a newly installed table.
  *
- * Returning a negative error code from the walker callback function will
- * terminate the walk immediately with the same error code.
+ * Depending on the return value from the walker callback function, the page
+ * table walk will continue or exit the walk. This is also dependent on the
+ * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
+ * walker.
+ *
+ * Walker Type  | Callback         | Walker action
+ * -------------|------------------|--------------
+ * Non-Shared   | 0                | Continue
+ * Non-Shared   | -EAGAIN          | Continue
+ * Non-Shared   | Any other        | Exit
+ * -------------|------------------|--------------
+ * Shared       | 0                | Continue
+ * Shared       | Any other        | Exit
  *
  * Return: 0 on success, negative error code on failure.
  */
-- 
2.41.0.rc0.172.g3f132b7071-goog


