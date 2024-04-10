From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 10 Apr 2024 14:34:33 -0700
Subject: [PATCH 00/10] Add support for a few Zc* extensions as well as Zcmop
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
Message-ID: <CAKC1njRJRnxj8XjwJ-Yx6Guu=9kSEdaFnxF1e+gXq9ij_j=atA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For the series:

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

On Wed, Apr 10, 2024 at 2:13?AM Cl?ment L?ger <cleger@rivosinc.com> wrote:
>
> Add support for (yet again) more RVA23U64 missing extensions. Add
> support for Zcmop, Zca, Zcf, Zcd and Zcb extensions isa string parsing,
> hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have been left
> out since they target microcontrollers/embedded CPUs and are not needed
> by RVA23U64
>
> This series is based on the Zimop one [1].
>
> Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger at rivosinc.com/ [1]
>
> Cl?ment L?ger (10):
>   dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
>     description
>   riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
>   riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
>   RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
>   KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
>   dt-bindings: riscv: add Zcmop ISA extension description
>   riscv: add ISA extension parsing for Zcmop
>   riscv: hwprobe: export Zcmop ISA extension
>   RISC-V: KVM: Allow Zcmop extension for Guest/VM
>   KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
>
>  Documentation/arch/riscv/hwprobe.rst          | 24 ++++++++++++
>  .../devicetree/bindings/riscv/extensions.yaml | 37 +++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                |  5 +++
>  arch/riscv/include/uapi/asm/hwprobe.h         |  5 +++
>  arch/riscv/include/uapi/asm/kvm.h             |  5 +++
>  arch/riscv/kernel/cpufeature.c                |  5 +++
>  arch/riscv/kernel/sys_hwprobe.c               |  5 +++
>  arch/riscv/kvm/vcpu_onereg.c                  | 10 +++++
>  .../selftests/kvm/riscv/get-reg-list.c        | 20 ++++++++++
>  9 files changed, 116 insertions(+)
>
> --
> 2.43.0
>
>

