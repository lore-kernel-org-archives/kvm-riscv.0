From: Carlos Bilbao <carlos.bilbao@amd.com>
Date: Wed, 21 Feb 2024 12:23:25 -0600
Subject: [PATCH v8 00/10] KVM: selftests: Add SEV smoke test
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com>
Message-ID: <cc9a1951-e76c-470d-a4d1-8ad67bae5794@amd.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On 2/2/24 18:09, Sean Christopherson wrote:
> Add a basic SEV smoke test.  Unlike the intra-host migration tests, this
> one actually runs a small chunk of code in the guest.
> 
> v8:
>   - Undo the kvm.h uAPI breakage.
>   - Take advantage of "struct vm_shape", introduced by the guest_memfd
>     selftests, to simply tracking the SEV/SEV-ES subtypes.
>   - Rename the test to "sev_smoke_test" instead of "sev_all_boot_test",
>     as the "all" is rather nonsensical, and the test isn't booting anything
>     in the traditional sense of the word.
>   - Drop vm->protected and instead add an arch hook to query if the VM has
>     protected memory.
>   - Assert that the target memory region supports protected memory when
>     allocating protected memory.
>   - Allocate protected_phy_pages for memory regions if and only if the VM
>     supports protected memory.
>   - Rename kvm_host.h to kvm_util_arch.h, and move it to selftests/kvm where
>     it belongs.
>   - Fix up some SoB goofs.
>   - Convert the intrahost SEV/SEV-ES migration tests to use common ioctl()
>     wrappers.
> 
> V7
>   * https://lore.kernel.org/all/20231218161146.3554657-1-pgonda at google.com
>   * See https://github.com/sean-jc/linux/tree/x86/sev_selftests_for_peter.
>   * I kept is_pt_protected because without it the page tables are never
>   readable. Its used for the elf loading in kvm_vm_elf_load().
> 
> V6
>   * Updated SEV VM create function based on Seanjc's feedback and new
>     changes to VM creation functions.
>   * Removed pte_me_mask based on feedback.
>   * Fixed s_bit usage based on TDX
>   * Fixed bugs and took Ackerly's code for enc_region setup code.
> 
> V5
>   * Rebase onto seanjc@'s latest ucall pool series.
>   * More review changes based on seanjc:
>   ** use protected instead of encrypted outside of SEV specific files
>   ** Swap memcrypt struct for kvm_vm_arch arch specific struct
>   ** Make protected page table data agnostic of address bit stealing specifics
>      of SEV
>   ** Further clean up for SEV library to just vm_sev_create_one_vcpu()
>   * Due to large changes moved more authorships from mroth@ to pgonda at . Gave
>     originally-by tags to mroth@ as suggested by Seanjc for this.
> 
> V4
>   * Rebase ontop of seanjc@'s latest Ucall Pool series:
>     https://lore.kernel.org/linux-arm-kernel/20220825232522.3997340-8-seanjc at google.com/
>   * Fix up review comments from seanjc
>   * Switch authorship on 2 patches because of significant changes, added
>   * Michael as suggested-by or originally-by.
> 
> V3
>   * Addressed more of andrew.jones@ in ucall patches.
>   * Fix build in non-x86 archs.
> 
> V2
>   * Dropped RFC tag
>   * Correctly separated Sean's ucall patches into 2 as originally
>     intended.
>   * Addressed andrew.jones@ in ucall patches.
>   * Fixed ucall pool usage to work for other archs
> 
> V1
>   * https://lore.kernel.org/all/20220715192956.1873315-1-pgonda at google.com/
> 
> Ackerley Tng (1):
>    KVM: selftests: Add a macro to iterate over a sparsebit range
> 
> Michael Roth (2):
>    KVM: selftests: Make sparsebit structs const where appropriate
>    KVM: selftests: Add support for protected vm_vaddr_* allocations
> 
> Peter Gonda (5):
>    KVM: selftests: Add support for allocating/managing protected guest
>      memory
>    KVM: selftests: Explicitly ucall pool from shared memory
>    KVM: selftests: Allow tagging protected memory in guest page tables
>    KVM: selftests: Add library for creating and interacting with SEV
>      guests
>    KVM: selftests: Add a basic SEV smoke test
> 
> Sean Christopherson (2):
>    KVM: selftests: Extend VM creation's @shape to allow control of VM
>      subtype
>    KVM: selftests: Use the SEV library APIs in the intra-host migration
>      test
> 
>   tools/testing/selftests/kvm/Makefile          |   2 +
>   .../kvm/include/aarch64/kvm_util_arch.h       |   7 +
>   .../selftests/kvm/include/kvm_util_base.h     |  50 ++++++-
>   .../kvm/include/riscv/kvm_util_arch.h         |   7 +
>   .../kvm/include/s390x/kvm_util_arch.h         |   7 +
>   .../testing/selftests/kvm/include/sparsebit.h |  56 +++++---
>   .../kvm/include/x86_64/kvm_util_arch.h        |  23 ++++
>   .../selftests/kvm/include/x86_64/processor.h  |   8 ++
>   .../selftests/kvm/include/x86_64/sev.h        | 110 +++++++++++++++
>   tools/testing/selftests/kvm/lib/kvm_util.c    |  67 +++++++--
>   tools/testing/selftests/kvm/lib/sparsebit.c   |  48 +++----
>   .../testing/selftests/kvm/lib/ucall_common.c  |   3 +-
>   .../selftests/kvm/lib/x86_64/processor.c      |  32 ++++-
>   tools/testing/selftests/kvm/lib/x86_64/sev.c  | 128 ++++++++++++++++++
>   .../selftests/kvm/x86_64/sev_migrate_tests.c  |  67 +++------
>   .../selftests/kvm/x86_64/sev_smoke_test.c     |  58 ++++++++
>   16 files changed, 570 insertions(+), 103 deletions(-)
>   create mode 100644 tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
>   create mode 100644 tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
>   create mode 100644 tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
>   create mode 100644 tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
>   create mode 100644 tools/testing/selftests/kvm/include/x86_64/sev.h
>   create mode 100644 tools/testing/selftests/kvm/lib/x86_64/sev.c
>   create mode 100644 tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
> 
> 
> base-commit: 60eedcfceda9db46f1b333e5e1aa9359793f04fb

Tested-by: Carlos Bilbao <carlos.bilbao@amd.com>

Tested including TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV)); in main() too.

Thanks,
Carlos

