From: Haibo Xu <haibo1.xu@intel.com>
Date: Mon, 22 Jan 2024 17:58:35 +0800
Subject: [PATCH v5 05/12] KVM: selftests: Add CONFIG_64BIT definition for the build
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
Message-ID: <af5958c00c0e2c8a5feb22cd908b89e2a6f72c9a.1705916069.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since only 64bit KVM selftests were supported on all architectures,
add the CONFIG_64BIT definition in kvm/Makefile to ensure only 64bit
definitions were available in the corresponding included files.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 87f0f76ea639..a18d18994fe8 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -215,7 +215,7 @@ else
 LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
-	-Wno-gnu-variable-sized-type-not-at-end -MD -MP \
+	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy -fno-builtin-memset \
 	-fno-builtin-strnlen \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
-- 
2.34.1


