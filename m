From: Sean Christopherson <seanjc@google.com>
Date: Mon, 30 Sep 2024 15:48:25 -0700
Subject: [PATCH v2 03/13] KVM: selftests: Fudge around an apparent gcc bug
 in arm64's PMU test
In-Reply-To: <ZvseoZLzmaS4MEbc@google.com>
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-4-seanjc@google.com>
 <ZvseoZLzmaS4MEbc@google.com>
Message-ID: <Zvsquaq-Lo4umoTI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 30, 2024, Sean Christopherson wrote:
> On Wed, Sep 11, 2024, Sean Christopherson wrote:
> > Use u64_replace_bits() instead of u64p_replace_bits() to set PMCR.N in
> > arm64's vPMU counter access test to fudge around what appears to be a gcc
> > bug.  With the recent change to have vcpu_get_reg() return a value in lieu
> > of an out-param, some versions of gcc completely ignore the operation
> > performed by set_pmcr_n(), i.e. ignore the output param.
> 
> Filed a gcc bug: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116912
> 
> I'll report back if anything interesting comes out of that bug.

Well, there goes several hours that I'll never get back.  Selftests are compiled
with -O2, which enables strict-aliasing optimizations, and "unsigned long" and
"unsigned long long" technically don't alias despite being the same size on 64-bit
builds, so the compiler is allowed to optimize away the load.  *sigh*

I'll replace this with a patch to disable strict-aliasing, which the kernel has
done since forever (literally predates git).  Grr.

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 48d32c5aa3eb..a6f92129bb02 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -235,10 +235,10 @@ CFLAGS += -Wall -Wstrict-prototypes -Wuninitialized -O2 -g -std=gnu99 \
        -Wno-gnu-variable-sized-type-not-at-end -MD -MP -DCONFIG_64BIT \
        -fno-builtin-memcmp -fno-builtin-memcpy \
        -fno-builtin-memset -fno-builtin-strnlen \
-       -fno-stack-protector -fno-PIE -I$(LINUX_TOOL_INCLUDE) \
-       -I$(LINUX_TOOL_ARCH_INCLUDE) -I$(LINUX_HDR_PATH) -Iinclude \
-       -I$(<D) -Iinclude/$(ARCH_DIR) -I ../rseq -I.. $(EXTRA_CFLAGS) \
-       $(KHDR_INCLUDES)
+       -fno-stack-protector -fno-PIE -fno-strict-aliasing \
+       -I$(LINUX_TOOL_INCLUDE) -I$(LINUX_TOOL_ARCH_INCLUDE) \
+       -I$(LINUX_HDR_PATH) -Iinclude -I$(<D) -Iinclude/$(ARCH_DIR) \
+       -I ../rseq -I.. $(EXTRA_CFLAGS) $(KHDR_INCLUDES)

