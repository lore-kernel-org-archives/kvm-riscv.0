From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 3 Oct 2023 12:28:42 +0200
Subject: [PATCH v3 2/9] KVM: selftests: Unify the makefile rule for split
 targets
In-Reply-To: <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <cda6cc71c9bdde87fe87f6c2dec4f03ca249dd62.1694421911.git.haibo1.xu@intel.com>
Message-ID: <20231003-d44206f71d0b22e539833697@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 09:36:56AM +0800, Haibo Xu wrote:
> A separate makefile rule was used for split targets which was added
> in patch(KVM: arm64: selftests: Split get-reg-list test code). This
> could be avoided by minor changes to the recipes of current rule.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a3bb36fb3cfc..7972269e8c5f 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -249,13 +249,10 @@ TEST_DEP_FILES += $(patsubst %.o, %.d, $(SPLIT_TESTS_OBJS))
>  -include $(TEST_DEP_FILES)
>  
>  $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o
> -	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBKVM_OBJS) $(LDLIBS) -o $@
> +	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
>  $(TEST_GEN_OBJ): $(OUTPUT)/%.o: %.c
>  	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
>  
> -$(SPLIT_TESTS_TARGETS): %: %.o $(SPLIT_TESTS_OBJS)
> -	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
> -
>  EXTRA_CLEAN += $(LIBKVM_OBJS) $(TEST_DEP_FILES) $(TEST_GEN_OBJ) $(SPLIT_TESTS_OBJS) cscope.*
>  
>  x := $(shell mkdir -p $(sort $(dir $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ))))
> @@ -274,6 +271,7 @@ $(LIBKVM_STRING_OBJ): $(OUTPUT)/%.o: %.c
>  x := $(shell mkdir -p $(sort $(dir $(TEST_GEN_PROGS))))
>  $(TEST_GEN_PROGS): $(LIBKVM_OBJS)
>  $(TEST_GEN_PROGS_EXTENDED): $(LIBKVM_OBJS)
> +$(SPLIT_TESTS_TARGETS): $(OUTPUT)/%: $(ARCH_DIR)/%.o
>  
>  cscope: include_paths = $(LINUX_TOOL_INCLUDE) $(LINUX_HDR_PATH) include lib ..
>  cscope:
> -- 
> 2.34.1
>

I just noticed that with and without this patch we're building the
arch-specific part in tools/testing/selftests/kvm/riscv even when we have
an $(OUTPUT) directory (e.g. O=build). Those build artifacts should be in
build/kselftest/kvm/riscv instead.

Thanks,
drew

