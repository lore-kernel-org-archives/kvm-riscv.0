From: James Houghton <jthoughton@google.com>
Date: Wed, 11 Sep 2024 17:19:24 -0700
Subject: [PATCH v2 13/13] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
In-Reply-To: <20240911204158.2034295-14-seanjc@google.com>
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-14-seanjc@google.com>
Message-ID: <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 1:42?PM Sean Christopherson <seanjc@google.com> wrote:
>
> Add two phases to mmu_stress_test to verify that KVM correctly handles
> guest memory that was writable, and then made read-only in the primary MMU,
> and then made writable again.
>
> Add bonus coverage for x86 and arm64 to verify that all of guest memory was
> marked read-only.  Making forward progress (without making memory writable)
> requires arch specific code to skip over the faulting instruction, but the
> test can at least verify each vCPU's starting page was made read-only for
> other architectures.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/mmu_stress_test.c | 104 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
> index 50c3a17418c4..c07c15d7cc9a 100644
> --- a/tools/testing/selftests/kvm/mmu_stress_test.c
> +++ b/tools/testing/selftests/kvm/mmu_stress_test.c
> @@ -16,6 +16,8 @@
>  #include "guest_modes.h"
>  #include "processor.h"
>
> +static bool mprotect_ro_done;
> +
>  static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
>  {
>         uint64_t gpa;
> @@ -31,6 +33,42 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
>                 *((volatile uint64_t *)gpa);
>         GUEST_SYNC(2);
>
> +       /*
> +        * Write to the region while mprotect(PROT_READ) is underway.  Keep
> +        * looping until the memory is guaranteed to be read-only, otherwise
> +        * vCPUs may complete their writes and advance to the next stage
> +        * prematurely.
> +        *
> +        * For architectures that support skipping the faulting instruction,
> +        * generate the store via inline assembly to ensure the exact length
> +        * of the instruction is known and stable (vcpu_arch_put_guest() on
> +        * fixed-length architectures should work, but the cost of paranoia
> +        * is low in this case).  For x86, hand-code the exact opcode so that
> +        * there is no room for variability in the generated instruction.
> +        */
> +       do {
> +               for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
> +#ifdef __x86_64__
> +                       asm volatile(".byte 0x48,0x89,0x00" :: "a"(gpa) : "memory"); /* mov %rax, (%rax) */

I'm curious what you think about using labels (in asm, but perhaps
also in C) and *setting* the PC instead of incrementing the PC. Diff
attached (tested on x86). It might even be safe/okay to always use
vcpu_arch_put_guest(), just set the PC to a label immediately
following it.

I don't feel strongly, so feel free to ignore.



> +#elif defined(__aarch64__)
> +                       asm volatile("str %0, [%0]" :: "r" (gpa) : "memory");
> +#else
> +                       vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
> +#endif
> +       } while (!READ_ONCE(mprotect_ro_done));
> +
> +       /*
> +        * Only architectures that write the entire range can explicitly sync,
> +        * as other architectures will be stuck on the write fault.
> +        */
> +#if defined(__x86_64__) || defined(__aarch64__)
> +       GUEST_SYNC(3);
> +#endif
-------------- next part --------------
A non-text attachment was scrubbed...
Name: labels.diff
Type: application/x-patch
Size: 2223 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240911/1a6e620c/attachment-0001.bin>
