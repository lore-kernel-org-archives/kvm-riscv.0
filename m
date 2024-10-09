From: Sean Christopherson <seanjc@google.com>
Date: Wed,  9 Oct 2024 08:49:39 -0700
Subject: [PATCH v3 00/14] KVM: selftests: Morph max_guest_mem to mmu_stress
Message-ID: <20241009154953.1073471-1-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The main purpose of this series is to convert the max_guest_memory_test
into a more generic mmu_stress_test.  The basic gist of the "conversion"
is to have the test do mprotect() on guest memory while vCPUs are
accessing said memory, e.g. to verify KVM and mmu_notifiers are working
as intended.

Patches 1-4 are a somewhat unexpected side quest.  The original plan was
that patch 3 would be a single patch, but things snowballed.

Patch 3 reworks vcpu_get_reg() to return a value instead of using an
out-param.  This is the entire motivation for including these patches;
having to define a variable just to bump the program counter on arm64
annoyed me.

Patch 4 adds hardening to vcpu_{g,s}et_reg() to detect potential
truncation, as KVM's uAPI allows for registers greater than the 64 bits
that are supported in the "outer" selftests APIs ((vcpu_set_reg() takes a
u64, vcpu_get_reg() now returns a u64).

Patch 1 is a change to KVM's uAPI headers to move the KVM_REG_SIZE
definition to common code so that the selftests side of things doesn't
need #ifdefs to implement the hardening in patch 4.

Patch 2 is the truly unexpected part.  With the vcpu_get_reg() rework,
arm64's vpmu_counter_test fails when compiled with gcc-13, and on gcc-11
with an added "noinline".  Long story short, selftests are being compiled
with strict aliasing enabled, which allows the compiler to optimize away
"u64 *" => "uint64_t *" casts as u64 (unsigned long long) and uint64_t
(unsigned long) are technically not aliases of each other.  *sigh*

v3:
 - Rebased onto v6.12-rc2.
 - Disable strict aliasing to fix the PMCR snafu.
 - Collect reviews. [Drew]
 - Minor changelog fixes. [Drew]
 - Include ucall_common.h to prep for RISC-V. [Drew]

v2:
 - Rebase onto kvm/next.
 - Add the aforementioned vcpu_get_reg() changes/disaster.
 - Actually add arm64 support for the fancy mprotect() testcase (I did this
   before v1, but managed to forget to include the changes when posting).
 - Emit "mov %rax, (%rax)" on x86. [James]
 - Add a comment to explain the fancy mprotect() vs. vCPUs logic.
 - Drop the KVM x86 patches (applied and/or will be handled separately).

v1: https://lore.kernel.org/all/20240809194335.1726916-1-seanjc at google.com

Sean Christopherson (14):
  KVM: Move KVM_REG_SIZE() definition to common uAPI header
  KVM: selftests: Disable strict aliasing
  KVM: selftests: Return a value from vcpu_get_reg() instead of using an
    out-param
  KVM: selftests: Assert that vcpu_{g,s}et_reg() won't truncate
  KVM: selftests: Check for a potential unhandled exception iff KVM_RUN
    succeeded
  KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
  KVM: selftests: Only muck with SREGS on x86 in mmu_stress_test
  KVM: selftests: Compute number of extra pages needed in
    mmu_stress_test
  KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
  KVM: selftests: Enable mmu_stress_test on arm64
  KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
  KVM: selftests: Precisely limit the number of guest loops in
    mmu_stress_test
  KVM: selftests: Add a read-only mprotect() phase to mmu_stress_test
  KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)

 arch/arm64/include/uapi/asm/kvm.h             |   3 -
 arch/riscv/include/uapi/asm/kvm.h             |   3 -
 include/uapi/linux/kvm.h                      |   4 +
 tools/testing/selftests/kvm/Makefile          |  11 +-
 .../selftests/kvm/aarch64/aarch32_id_regs.c   |  10 +-
 .../selftests/kvm/aarch64/debug-exceptions.c  |   4 +-
 .../selftests/kvm/aarch64/hypercalls.c        |   6 +-
 .../selftests/kvm/aarch64/no-vgic-v3.c        |   2 +-
 .../testing/selftests/kvm/aarch64/psci_test.c |   6 +-
 .../selftests/kvm/aarch64/set_id_regs.c       |  18 +-
 .../kvm/aarch64/vpmu_counter_access.c         |  19 +-
 .../testing/selftests/kvm/include/kvm_util.h  |  10 +-
 .../selftests/kvm/lib/aarch64/processor.c     |   8 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |   3 +-
 .../selftests/kvm/lib/riscv/processor.c       |  66 +++----
 ..._guest_memory_test.c => mmu_stress_test.c} | 162 ++++++++++++++++--
 .../testing/selftests/kvm/riscv/arch_timer.c  |   2 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   2 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   2 +-
 tools/testing/selftests/kvm/s390x/resets.c    |   2 +-
 tools/testing/selftests/kvm/steal_time.c      |   3 +-
 21 files changed, 241 insertions(+), 105 deletions(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (60%)


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.47.0.rc0.187.ge670bccf7e-goog


