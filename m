From: Haibo Xu <haibo1.xu@intel.com>
Date: Mon, 22 Jan 2024 17:58:31 +0800
Subject: [PATCH v5 01/12] selftests/kvm: Fix issues with $(SPLIT_TESTS)
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
Message-ID: <d59687d00c7d0554cad903b14e8a9805a6384fac.1705916069.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Paolo Bonzini <pbonzini@redhat.com>

The introduction of $(SPLIT_TESTS) also introduced a warning when
building selftests on architectures that include get-reg-lists:

    make: Entering directory '/root/kvm/tools/testing/selftests/kvm'
    Makefile:272: warning: overriding recipe for target '/root/kvm/tools/testing/selftests/kvm/get-reg-list'
    Makefile:267: warning: ignoring old recipe for target '/root/kvm/tools/testing/selftests/kvm/get-reg-list'
    make: Leaving directory '/root/kvm/tools/testing/selftests/kvm'

In addition, the rule for $(SPLIT_TESTS_TARGETS) includes _all_
the $(SPLIT_TESTS_OBJS), which only works because there is just one.
So fix both by adjusting the rules:

- remove $(SPLIT_TESTS_TARGETS) from the $(TEST_GEN_PROGS) rules,
  and rename it to $(SPLIT_TEST_GEN_PROGS)

- fix $(SPLIT_TESTS_OBJS) so that it plays well with $(OUTPUT),
  rename it to $(SPLIT_TEST_GEN_OBJ), and list the object file
  explicitly in the $(SPLIT_TEST_GEN_PROGS) link rule

Fixes: 17da79e009c3 ("KVM: arm64: selftests: Split get-reg-list test code", 2023-08-09)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/Makefile | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 3e0c36b8ddd5..c5e9abb185b6 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -257,32 +257,36 @@ LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
 LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
-SPLIT_TESTS_TARGETS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
-SPLIT_TESTS_OBJS := $(patsubst %, $(ARCH_DIR)/%.o, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
+SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH_DIR)/%.o, $(SPLIT_TESTS))
 
 TEST_GEN_OBJ = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 TEST_GEN_OBJ += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
 TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_OBJ))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBKVM_OBJS))
-TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TESTS_OBJS))
+TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TEST_GEN_OBJ))
 -include $(TEST_DEP_FILES)
 
-$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o
+x := $(shell mkdir -p $(sort $(OUTPUT)/$(ARCH_DIR) $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
+
+$(filter-out $(SPLIT_TEST_GEN_PROGS), $(TEST_GEN_PROGS)) \
+$(TEST_GEN_PROGS_EXTENDED): %: %.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBKVM_OBJS) $(LDLIBS) -o $@
 $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-$(SPLIT_TESTS_TARGETS): %: %.o $(SPLIT_TESTS_OBJS)
+$(SPLIT_TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(OUTPUT)/$(ARCH_DIR)/%.o
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
+$(SPLIT_TEST_GEN_OBJ): $(OUTPUT)/$(ARCH_DIR)/%.o: $(ARCH_DIR)/%.c
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
 EXTRA_CLEAN += $(GEN_HDRS) \
 	       $(LIBKVM_OBJS) \
-	       $(SPLIT_TESTS_OBJS) \
+	       $(SPLIT_TEST_GEN_OBJ) \
 	       $(TEST_DEP_FILES) \
 	       $(TEST_GEN_OBJ) \
 	       cscope.*
 
-x := $(shell mkdir -p $(sort $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
 $(LIBKVM_C_OBJ): $(OUTPUT)/%.o: %.c $(GEN_HDRS)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
@@ -296,7 +300,7 @@ $(LIBKVM_STRING_OBJ): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -ffreestanding $< -o $@
 
 x := $(shell mkdir -p $(sort $(dir $(TEST_GEN_PROGS))))
-$(SPLIT_TESTS_OBJS): $(GEN_HDRS)
+$(SPLIT_TEST_GEN_OBJ): $(GEN_HDRS)
 $(TEST_GEN_PROGS): $(LIBKVM_OBJS)
 $(TEST_GEN_PROGS_EXTENDED): $(LIBKVM_OBJS)
 $(TEST_GEN_OBJ): $(GEN_HDRS)
-- 
2.34.1


