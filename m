From: Atish Patra <atish.patra@wdc.com>
Date: Mon,  3 Aug 2020 10:58:41 -0700
Subject: [PATCH 1/6] RISC-V: Add a non-void return for sbi v02 functions
In-Reply-To: <20200803175846.26272-1-atish.patra@wdc.com>
References: <20200803175846.26272-1-atish.patra@wdc.com>
Message-ID: <20200803175846.26272-2-atish.patra@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI v0.2 functions can return an error code from SBI implementation.
We are already processing the SBI error code and coverts it to the Linux
error code.

Propagate to the error code to the caller as well. As of now, kvm is the
only user of these error codes.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h |  8 ++++----
 arch/riscv/kernel/sbi.c      | 32 ++++++++++++++++----------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 653edb25d495..2355515785eb 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -100,13 +100,13 @@ int sbi_console_getchar(void);
 void sbi_set_timer(uint64_t stime_value);
 void sbi_shutdown(void);
 void sbi_clear_ipi(void);
-void sbi_send_ipi(const unsigned long *hart_mask);
-void sbi_remote_fence_i(const unsigned long *hart_mask);
-void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+int sbi_send_ipi(const unsigned long *hart_mask);
+int sbi_remote_fence_i(const unsigned long *hart_mask);
+int sbi_remote_sfence_vma(const unsigned long *hart_mask,
 			   unsigned long start,
 			   unsigned long size);
 
-void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 				unsigned long start,
 				unsigned long size,
 				unsigned long asid);
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index f383ef5672b2..53c44c831eb8 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -351,7 +351,7 @@ static int __sbi_rfence_v02(int fid, const unsigned long *hart_mask,
  * sbi_set_timer() - Program the timer for next timer event.
  * @stime_value: The value after which next timer event should fire.
  *
- * Return: None
+ * Return: None.
  */
 void sbi_set_timer(uint64_t stime_value)
 {
@@ -362,11 +362,11 @@ void sbi_set_timer(uint64_t stime_value)
  * sbi_send_ipi() - Send an IPI to any hart.
  * @hart_mask: A cpu mask containing all the target harts.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_send_ipi(const unsigned long *hart_mask)
+int sbi_send_ipi(const unsigned long *hart_mask)
 {
-	__sbi_send_ipi(hart_mask);
+	return __sbi_send_ipi(hart_mask);
 }
 EXPORT_SYMBOL(sbi_send_ipi);
 
@@ -374,12 +374,12 @@ EXPORT_SYMBOL(sbi_send_ipi);
  * sbi_remote_fence_i() - Execute FENCE.I instruction on given remote harts.
  * @hart_mask: A cpu mask containing all the target harts.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_fence_i(const unsigned long *hart_mask)
+int sbi_remote_fence_i(const unsigned long *hart_mask)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
-		     hart_mask, 0, 0, 0, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
+			    hart_mask, 0, 0, 0, 0);
 }
 EXPORT_SYMBOL(sbi_remote_fence_i);
 
@@ -390,14 +390,14 @@ EXPORT_SYMBOL(sbi_remote_fence_i);
  * @start: Start of the virtual address
  * @size: Total size of the virtual address range.
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_sfence_vma(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma(const unsigned long *hart_mask,
 			   unsigned long start,
 			   unsigned long size)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
-		     hart_mask, start, size, 0, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+			    hart_mask, start, size, 0, 0);
 }
 EXPORT_SYMBOL(sbi_remote_sfence_vma);
 
@@ -410,15 +410,15 @@ EXPORT_SYMBOL(sbi_remote_sfence_vma);
  * @size: Total size of the virtual address range.
  * @asid: The value of address space identifier (ASID).
  *
- * Return: None
+ * Return: 0 on success, appropriate linux error code otherwise.
  */
-void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
+int sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 				unsigned long start,
 				unsigned long size,
 				unsigned long asid)
 {
-	__sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
-		     hart_mask, start, size, asid, 0);
+	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+			    hart_mask, start, size, asid, 0);
 }
 EXPORT_SYMBOL(sbi_remote_sfence_vma_asid);
 
-- 
2.24.0


