From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 25 May 2023 19:20:23 +0200
Subject: [PATCH v2 00/11] RISCV: Add KVM_GET_REG_LIST API
In-Reply-To: <cover.1684999824.git.haibo1.xu@intel.com>
References: <cover.1684999824.git.haibo1.xu@intel.com>
Message-ID: <20230525-6e0855eb07086a96eaa82362@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 25, 2023 at 03:38:24PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST will dump all register IDs that are available to
> KVM_GET/SET_ONE_REG and It's very useful to identify some platform
> regression issue during VM migration.
> 
> Patch 1-7 re-structured the get-reg-list test in aarch64 to make some
> of the code as common test framework that can be shared by riscv.
> 
> Patch 8 enabled the KVM_GET_REG_LIST API in riscv and patch 9-11 added
> the corresponding kselftest for checking possible register regressions.
> 
> The get-reg-list kvm selftest was ported from aarch64 and tested with
> Linux 6.4-rc1 on a Qemu riscv virt machine.
> 
> ---
> Changed since v1:
>   * rebase to Andrew's changes
>   * fix coding style
> 
> Andrew Jones (7):
>   KVM: arm64: selftests: Replace str_with_index with strdup_printf
>   KVM: arm64: selftests: Drop SVE cap check in print_reg
>   KVM: arm64: selftests: Remove print_reg's dependency on vcpu_config
>   KVM: arm64: selftests: Rename vcpu_config and add to kvm_util.h
>   KVM: arm64: selftests: Delete core_reg_fixup
>   KVM: arm64: selftests: Split get-reg-list test code
>   KVM: arm64: selftests: Finish generalizing get-reg-list

All the patches above should also have your s-o-b since your posting them.

Thanks,
drew

