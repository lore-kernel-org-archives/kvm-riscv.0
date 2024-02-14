From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:33 +0530
Subject: [kvmtool PATCH 02/10] kvmtool: Fix absence of __packed definition
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The absence of __packed definition in kvm/compiler.h cause build
failer after syncing kernel headers with Linux-6.8 because the
kernel header uapi/linux/virtio_pci.h uses __packed for structures.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/kvm/compiler.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/kvm/compiler.h b/include/kvm/compiler.h
index 2013a83..dd8a22a 100644
--- a/include/kvm/compiler.h
+++ b/include/kvm/compiler.h
@@ -1,6 +1,8 @@
 #ifndef KVM_COMPILER_H_
 #define KVM_COMPILER_H_
 
+#include <linux/compiler.h>
+
 #ifndef __compiletime_error
 # define __compiletime_error(message)
 #endif
-- 
2.34.1


