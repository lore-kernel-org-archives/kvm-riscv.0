From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Apr 2024 09:28:43 +0530
Subject: [PATCH v3 0/3] RISC-V: KVM: Guest Debug Support - Software
 Breakpoint Part
In-Reply-To: <20240327075526.31855-1-duchao@eswincomputing.com>
References: <20240327075526.31855-1-duchao@eswincomputing.com>
Message-ID: <CAAhSdy0vokWZopwdrFbY0XyVwNe98YeuQpCGKBP1Uxj-+v18ZA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 27, 2024 at 1:29?PM Chao Du <duchao@eswincomputing.com> wrote:
>
> This series implements the "KVM Guset Debug" feature on RISC-V. This is
> an existing feature which is already supported by some other arches.
> It allows us to debug a RISC-V KVM guest from GDB in host side.
>
> As the first stage, the software breakpoints (ebreak instruction) is
> implemented. HW breakpoints support will come later after a synthetically
> consideration with the SBI debug trigger extension.
>
> A selftest case was added in this series. Manual test was done on QEMU
> RISC-V hypervisor emulator. (add '-s' to enable the gdbserver in QEMU)
>
> This series is based on Linux 6.9-rc1 and also available at:
> https://github.com/Du-Chao/kvm-riscv/tree/guest_debug_sw_v3_6.9-rc1
>
> The matched QEMU is available at:
> https://github.com/Du-Chao/qemu/tree/riscv_gd_sw
>
>
> Changes from v2->v3:
> - Rebased on Linux 6.9-rc1.
> - Use BIT() in the macro definition.
> - set/clear the bit EXC_BREAKPOINT explicitly.
> - change the testcase name to ebreak_test.
> - test the scenario without GUEST_DEBUG. vm_install_exception_handler() is used
>   thanks to Haibo's patch.
>
> Changes from v1->v2:
> - Rebased on Linux 6.8-rc6.
> - Maintain a hedeleg in "struct kvm_vcpu_config" for each VCPU.
> - Update the HEDELEG csr in kvm_arch_vcpu_load().
>
> Changes from RFC->v1:
> - Rebased on Linux 6.8-rc2.
> - Merge PATCH1 and PATCH2 into one patch.
> - kselftest case added.
>
> v2 link:
> https://lore.kernel.org/kvm/20240301013545.10403-1-duchao at eswincomputing.com
> v1 link:
> https://lore.kernel.org/kvm/20240206074931.22930-1-duchao at eswincomputing.com
> RFC link:
> https://lore.kernel.org/kvm/20231221095002.7404-1-duchao at eswincomputing.com
>
> Chao Du (3):
>   RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
>   RISC-V: KVM: Handle breakpoint exits for VCPU
>   RISC-V: KVM: selftests: Add ebreak test support

Please address Drew's comments on PATCH3 and send v4 so that I
can test this series at my end.

Regards,
Anup

>
>  arch/riscv/include/asm/kvm_host.h             | 12 +++
>  arch/riscv/kvm/main.c                         | 18 +---
>  arch/riscv/kvm/vcpu.c                         | 16 +++-
>  arch/riscv/kvm/vcpu_exit.c                    |  4 +
>  arch/riscv/kvm/vm.c                           |  1 +
>  tools/testing/selftests/kvm/Makefile          |  1 +
>  .../testing/selftests/kvm/riscv/ebreak_test.c | 84 +++++++++++++++++++
>  7 files changed, 118 insertions(+), 18 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/riscv/ebreak_test.c
>
> --
> 2.17.1
>

