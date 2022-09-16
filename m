From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Sep 2022 10:28:56 +0530
Subject: [PATCH 0/3] Svinval support for KVM RISC-V
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1iDXMhE_MVdj9JDu8XHXiV_Ci=aLVqQG7r-m6d28aAdw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 2, 2022 at 10:31 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds Svinval extension support for both Host hypervisor
> and Guest.
>
> These patches can also be found in riscv_kvm_svinval_v1 branch at:
> https://github.com/avpatel/linux.git
>
> The corresponding KVMTOOL patches are available in riscv_svinval_v1
> branch at: https://github.com/avpatel/kvmtool.git
>
> Anup Patel (2):
>   RISC-V: KVM: Use Svinval for local TLB maintenance when available
>   RISC-V: KVM: Allow Guest use Svinval extension
>
> Mayuresh Chitale (1):
>   RISC-V: Probe Svinval extension form ISA string

I have queued this series for 6.1

Thanks,
Anup

>
>  arch/riscv/include/asm/hwcap.h    |  4 +++
>  arch/riscv/include/asm/insn-def.h | 20 +++++++++++
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kernel/cpu.c           |  1 +
>  arch/riscv/kernel/cpufeature.c    |  1 +
>  arch/riscv/kvm/tlb.c              | 60 ++++++++++++++++++++++++-------
>  arch/riscv/kvm/vcpu.c             |  2 ++
>  7 files changed, 77 insertions(+), 12 deletions(-)
>
> --
> 2.34.1
>

