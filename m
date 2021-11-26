From: Anup Patel <anup.patel@wdc.com>
Date: Fri, 26 Nov 2021 21:10:19 +0530
Subject: [PATCH 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level Makefile
In-Reply-To: <20211126154020.342924-1-anup.patel@wdc.com>
References: <20211126154020.342924-1-anup.patel@wdc.com>
Message-ID: <20211126154020.342924-4-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
which will allow users to pass additional compile-time flags such
as "-static".

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 tools/testing/selftests/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index c4e34717826a..ee6740e9ecdb 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -131,7 +131,7 @@ endif
 CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
 	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-	-I$(<D) -Iinclude/$(UNAME_M) -I..
+	-I$(<D) -Iinclude/$(UNAME_M) -I.. $(EXTRA_CFLAGS)
 
 no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
         $(CC) -Werror -no-pie -x c - -o "$$TMP", -no-pie)
-- 
2.25.1


