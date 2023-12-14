From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 Dec 2023 10:49:15 +0530
Subject: [PATCH v2 0/6] RISC-V: KVM: Make SBI uapi consistent with ISA uapi
In-Reply-To: <20231213170951.93453-8-ajones@ventanamicro.com>
References: <20231213170951.93453-8-ajones@ventanamicro.com>
Message-ID: <CAAhSdy1N2BaExXsTJnxn=UJ4G5cLQv0WY8mK41miZA9WNFO26w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 13, 2023 at 10:39?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> SBI extension UAPI is currently almost the same as the ISA extension
> UAPI. This series closes the remaining gap by ensuring when an SBI
> extension is not available that its register returns ENOENT when
> accessed by userspace. We also drop the SBI multi registers from
> get-reg-list (ISA multi registers aren't there either) and make
> several improvements to the get-reg-list kselftest.
>
> This series is based on Anup's riscv_kvm_more_exts_v1 branch.
>
> Based on kvm-riscv/riscv_kvm_queue
>
> v2:
>  - Rebased on kvm-riscv/riscv_kvm_queue which is based on v6.7-rc5
>
> Thanks,
> drew
>
>
> Andrew Jones (6):
>   RISC-V: KVM: Don't add SBI multi regs in get-reg-list
>   KVM: riscv: selftests: Drop SBI multi registers
>   RISC-V: KVM: Make SBI uapi consistent with ISA uapi
>   KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
>   KVM: riscv: selftests: Use register subtypes
>   RISC-V: KVM: selftests: Treat SBI ext regs like ISA ext regs

Queued this series for Linux-6.8

Thanks,
Anup

>
>  arch/riscv/include/asm/kvm_vcpu_sbi.h         |  10 +-
>  arch/riscv/kvm/vcpu_onereg.c                  |  53 ++---
>  arch/riscv/kvm/vcpu_sbi.c                     |  75 +++---
>  arch/riscv/kvm/vcpu_sbi_replace.c             |   2 +-
>  .../selftests/kvm/include/kvm_util_base.h     |   1 +
>  .../selftests/kvm/include/riscv/processor.h   |  40 ++--
>  .../selftests/kvm/lib/riscv/processor.c       |   4 +-
>  .../selftests/kvm/riscv/get-reg-list.c        | 220 +++++++++++++-----
>  8 files changed, 254 insertions(+), 151 deletions(-)
>
> --
> 2.43.0
>

