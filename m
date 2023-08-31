From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 31 Aug 2023 19:28:41 +0200
Subject: [GIT PULL] KVM/riscv changes for 6.6
In-Reply-To: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
References: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
Message-ID: <CABgObfbHSkoavDYqKhhotn0cOFr+x2QRYD4NN9v_55tK4nxQoQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 23, 2023 at 7:25?PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.6:
> 1) Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
> 2) Added ONE_REG interface for SATP mode
> 3) Added ONE_REG interface to enable/disable multiple ISA extensions
> 4) Improved error codes returned by ONE_REG interfaces
> 5) Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
> 6) Added get-reg-list selftest for KVM RISC-V
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit 52a93d39b17dc7eb98b6aa3edb93943248e03b2f:
>
>   Linux 6.5-rc5 (2023-08-06 15:07:51 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.6-1
>
> for you to fetch changes up to 477069398ed6e0498ee243e799cb6c68baf6ccb8:
>
>   KVM: riscv: selftests: Add get-reg-list test (2023-08-09 12:15:27 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.6
>
> - Zba, Zbs, Zicntr, Zicsr, Zifencei, and Zihpm support for Guest/VM
> - Added ONE_REG interface for SATP mode
> - Added ONE_REG interface to enable/disable multiple ISA extensions
> - Improved error codes returned by ONE_REG interfaces
> - Added KVM_GET_REG_LIST ioctl() implementation for KVM RISC-V
> - Added get-reg-list selftest for KVM RISC-V
>
> ----------------------------------------------------------------
> Andrew Jones (9):
>       RISC-V: KVM: Improve vector save/restore errors
>       RISC-V: KVM: Improve vector save/restore functions
>       KVM: arm64: selftests: Replace str_with_index with strdup_printf
>       KVM: arm64: selftests: Drop SVE cap check in print_reg
>       KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
>       KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
>       KVM: arm64: selftests: Delete core_reg_fixup
>       KVM: arm64: selftests: Split get-reg-list test code
>       KVM: arm64: selftests: Finish generalizing get-reg-list

Pulled, thanks, but I'll give a closer look to these patches after
kicking the long-running tests. It would have been nicer to get an
Acked-by from either me or Marc or Oliver, but no huge deal.

Paolo


