From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:16 -0700
Subject: [RFC 48/48] drivers/hvc: sbi: Disable HVC console for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-49-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If two same type of console is used in command line, kernel
picks up the first registered one instead of the preferred one.
The fix was proposed and NACK'ed due to a possible regression
for other users.

https://lore.kernel.org/all/Y+tziG0Uo5ey+Ocy at alley/

HVC sbi console makes it impossible to use virtio console
which is preferred anyways. We could have disabled HVC console
for TVMs but same kernel image must work on both host and the
the guest. There are genuine reasons for requiring the hvc sbi
cosnole for the host.

Do not initialize the hvc console for the TVMs so that virtio
console can be used.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 83cfe00..dee96c5 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -11,6 +11,7 @@
 #include <linux/moduleparam.h>
 #include <linux/types.h>
 
+#include <asm/cove.h>
 #include <asm/sbi.h>
 
 #include "hvc_console.h"
@@ -103,6 +104,10 @@ static int __init hvc_sbi_init(void)
 {
 	int err;
 
+	/* Prefer virtio console as hvc console for guests */
+	if (is_cove_guest())
+		return 0;
+
 	if ((sbi_spec_version >= sbi_mk_version(1, 0)) &&
 	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
 		err = PTR_ERR_OR_ZERO(hvc_alloc(0, 0, &hvc_sbi_dbcn_ops, 16));
-- 
2.25.1


