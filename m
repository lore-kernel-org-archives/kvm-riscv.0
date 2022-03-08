From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Mar 2022 11:27:30 +0530
Subject: [PATCH 0/6] KVM RISC-V SBI v0.3 support
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3JwLyOoNOubAS2VusNdj6O-CJJNSs+mM8+NvKErtAdmw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 1, 2022 at 1:53 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series adds initial support for SBI v0.3 which includes:
> 1) SBI SRST support for Guest
> 2) SBI HSM suspend for Guest
>
> The SBI PMU support is intentionally left out and will be added as
> a separate patch series.
>
> These patches can also be found in riscv_kvm_sbi_v03_v1 branch at:
> https://github.com/avpatel/linux.git

Queued this series for Linux-5.18

Thanks,
Anup

>
> Anup Patel (6):
>   RISC-V: KVM: Upgrade SBI spec version to v0.3
>   RISC-V: KVM: Add common kvm_riscv_vcpu_sbi_system_reset() function
>   RISC-V: KVM: Implement SBI v0.3 SRST extension
>   RISC-V: Add SBI HSM suspend related defines
>   RISC-V: KVM: Add common kvm_riscv_vcpu_wfi() function
>   RISC-V: KVM: Implement SBI HSM suspend call
>
>  arch/riscv/include/asm/kvm_host.h     |  1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  5 ++-
>  arch/riscv/include/asm/sbi.h          | 27 +++++++++++++---
>  arch/riscv/kernel/cpu_ops_sbi.c       |  2 +-
>  arch/riscv/kvm/vcpu_exit.c            | 22 ++++++++++----
>  arch/riscv/kvm/vcpu_sbi.c             | 19 ++++++++++++
>  arch/riscv/kvm/vcpu_sbi_hsm.c         | 18 +++++++++--
>  arch/riscv/kvm/vcpu_sbi_replace.c     | 44 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu_sbi_v01.c         | 18 ++---------
>  9 files changed, 125 insertions(+), 31 deletions(-)
>
> --
> 2.25.1
>

