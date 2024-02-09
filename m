From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Feb 2024 21:38:15 +0530
Subject: [kvmtool PATCH 00/10] SBI debug console and few ISA extensions
In-Reply-To: <170749352335.2620327.13138913157188078368.b4-ty@kernel.org>
References: <20231128145628.413414-1-apatel@ventanamicro.com> <170749352335.2620327.13138913157188078368.b4-ty@kernel.org>
Message-ID: <CAAhSdy3uVw6jh44s76UeJHMyMNr3Tqf5sZGi0pDJ7wjgX-jayQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 9, 2024 at 9:26?PM Will Deacon <will@kernel.org> wrote:
>
> On Tue, 28 Nov 2023 20:26:18 +0530, Anup Patel wrote:
> > This series adds support for:
> > 1) ISA extensions: Zba, Zbs, Zicntr, Zihpm, Zicsr, Zifencei, Zicond,
> >    and Smstateen
> > 2) SBI debug console (DBCN) extension
> >
> > These patches can also be found in the riscv_zbx_zicntr_smstateen_condops_v1
> > branch at: https://github.com/avpatel/kvmtool.git
> >
> > [...]
>
> Applied to kvmtool (master), thanks!
>
> (I updated the headers to 6.7 separately)

Thanks Will.

>
> [02/10] riscv: Improve warning in generate_cpu_nodes()
>         https://git.kernel.org/will/kvmtool/c/fcb076756ab2
> [03/10] riscv: Make CPU_ISA_MAX_LEN depend upon isa_info_arr array size
>         https://git.kernel.org/will/kvmtool/c/7887b3989ac2
> [04/10] riscv: Add Zba and Zbs extension support
>         https://git.kernel.org/will/kvmtool/c/6331850d6bc0
> [05/10] riscv: Add Zicntr and Zihpm extension support
>         https://git.kernel.org/will/kvmtool/c/667685691c5d
> [06/10] riscv: Add Zicsr and Zifencei extension support
>         https://git.kernel.org/will/kvmtool/c/3436684940bc
> [07/10] riscv: Add Smstateen extension support
>         https://git.kernel.org/will/kvmtool/c/8d02d5a895c3
> [08/10] riscv: Add Zicond extension support
>         https://git.kernel.org/will/kvmtool/c/8cd71ca57fb0
> [09/10] riscv: Set mmu-type DT property based on satp_mode ONE_REG interface
>         https://git.kernel.org/will/kvmtool/c/ef89838e3760
> [10/10] riscv: Handle SBI DBCN calls from Guest/VM
>         https://git.kernel.org/will/kvmtool/c/4ddaa4249e0c
>
> Cheers,
> --
> Will
>
> https://fixes.arm64.dev
> https://next.arm64.dev
> https://will.arm64.dev

Regards,
Anup

