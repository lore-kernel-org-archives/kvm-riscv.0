From: Sean Christopherson <seanjc@google.com>
Date: Wed,  9 Oct 2024 08:49:41 -0700
Subject: [PATCH v3 02/14] KVM: selftests: Disable strict aliasing
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
References: <20241009154953.1073471-1-seanjc@google.com>
Message-ID: <20241009154953.1073471-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Disable strict aliasing, as has been done in the kernel proper for decades
(literally since before git history) to fix issues where gcc will optimize
away loads in code that looks 100% correct, but is _technically_ undefined
behavior, and thus can be thrown away by the compiler.

E.g. arm64's vPMU counter access test casts a uint64_t (unsigned long)
pointer to a u64 (unsigned long long) pointer when setting PMCR.N via
u64p_replace_bits(), which gcc-13 detects and optimizes away, i.e. ignores
the result and uses the original PMCR.

The issue is most easily observed by making set_pmcr_n() noinline and
wrapping the call with printf(), e.g. sans comments, for this code:

  printf("orig = %lx, next = %lx, want = %lu\n", pmcr_orig, pmcr, pmcr_n);
  set_pmcr_n(&pmcr, pmcr_n);
  printf("orig = %lx, next = %lx, want = %lu\n", pmcr_orig, pmcr, pmcr_n);

gcc-13 generates:

 0000000000401c90 <set_pmcr_n>:
  401c90:       f9400002        ldr     x2, [x0]
  401c94:       b3751022        bfi     x2, x1, #11, #5
  401c98:       f9000002        str     x2, [x0]
  401c9c:       d65f03c0        ret

 0000000000402660 <test_create_vpmu_vm_with_pmcr_n>:
  402724:       aa1403e3        mov     x3, x20
  402728:       aa1503e2        mov     x2, x21
  40272c:       aa1603e0        mov     x0, x22
  402730:       aa1503e1        mov     x1, x21
  402734:       940060ff        bl      41ab30 <_IO_printf>
  402738:       aa1403e1        mov     x1, x20
  40273c:       910183e0        add     x0, sp, #0x60
  402740:       97fffd54        bl      401c90 <set_pmcr_n>
  402744:       aa1403e3        mov     x3, x20
  402748:       aa1503e2        mov     x2, x21
  40274c:       aa1503e1        mov     x1, x21
  402750:       aa1603e0        mov     x0, x22
  402754:       940060f7        bl      41ab30 <_IO_printf>

with the value stored in [sp + 0x60] ignored by both printf() above and
in the test proper, resulting in a false failure due to vcpu_set_reg()
simply storing the original value, not the intended value.

  $ ./vpmu_counter_access
  Random seed: 0x6b8b4567
  orig = 3040, next = 3040, want = 0
  orig = 3040, next = 3040, want = 0
  ==== Test Assertion Failure ====
    aarch64/vpmu_counter_access.c:505: pmcr_n == get_pmcr_n(pmcr)
    pid=71578 tid=71578 errno=9 - Bad file descriptor
       1        0x400673: run_access_test at vpmu_counter_access.c:522
       2         (inlined by) main at vpmu_counter_access.c:643
       3        0x4132d7: __libc_start_call_main at libc-start.o:0
       4        0x413653: __libc_start_main at ??:0
       5        0x40106f: _start at ??:0
    Failed to update PMCR.N to 0 (received: 6)

Somewhat bizarrely, gcc-11 also exhibits the same behavior, but only if
set_pmcr_n() is marked noinline, whereas gcc-13 fails even if set_pmcr_n()
is inlined in its sole caller.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 960cf6a77198..6246d69d82d7 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -241,10 +241,10 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
 	-Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
 	-fno-builtin-memcmp -fno-builtin-memcpy \
 	-fno-builtin-memset -fno-builtin-strnlen \
-	-fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
-	-I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-	-I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-	$(KHDR_INCLUDES)
+	-fno-stack-protector -fno-PIE -fno-strict-aliasing \
+	-I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
+	-I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
+	-I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)
 ifeq ($(ARCH),s390)
 	CFLAGS += -march=z10
 endif
-- 
2.47.0.rc0.187.ge670bccf7e-goog


