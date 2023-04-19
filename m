From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:46 -0700
Subject: [RFC kvmtool 06/10] riscv: Change initrd alignment to a page size
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-7-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the initrd image is aligned to 8. This is problematic for
CoVE where the image is expected to be aligned at page granularity level.

Thus, align it to 4k. This can be done only if user requested a TVM.
However, initrd usually much bigger (in MBs at least). Thus, aligning
to a page for everything should not matter much.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index d59e8bc..5f9b0d5 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -113,7 +113,7 @@ void kvm__arch_init(struct kvm *kvm)
 }
 
 #define FDT_ALIGN	SZ_4M
-#define INITRD_ALIGN	8
+#define INITRD_ALIGN	SZ_4K
 bool kvm__arch_load_kernel_image(struct kvm *kvm, int fd_kernel, int fd_initrd,
 				 const char *kernel_cmdline)
 {
-- 
2.25.1


