From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Feb 2024 21:27:15 +0530
Subject: [PATCH 0/3] RISC-V: Fix sparse warnings
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3FNoE8Rog_fq4sVqf090GSMMuU3+nxHEK3O02YPY0E0Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 31, 2024 at 5:35?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> After the steal-time series was merged, LKP sent me mail with sparse
> warnings for the lack of using appropriate restricted types and a
> local variable not being static. This series makes the fixups
> necessary to appease sparse for 64-bit compiles. Changes to
> __get_user_8() and __put_user_8() are needed to completely quiet
> sparse for 32-bit compiles. I'll address those 32-bit sparse warnings
> separately, since it's not 100% clear how best to approach a couple of
> them.
>
> Thanks,
> drew
>
>
> Andrew Jones (3):
>   RISC-V: paravirt: steal_time should be static
>   RISC-V: paravirt: Use correct restricted types
>   RISC-V: KVM: Use correct restricted types

Queued this series as fixes for Linux-6.8

Thanks,
Anup

>
>  arch/riscv/kernel/paravirt.c  |  6 +++---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
>  2 files changed, 15 insertions(+), 11 deletions(-)
>
> --
> 2.43.0
>

