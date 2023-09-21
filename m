From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 21 Sep 2023 10:52:29 +0530
Subject: [PATCH v2 0/4] KVM RISC-V fixes for ONE_REG interface
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
Message-ID: <CAK9=C2WXtRLTFA5JeWbkyKt+1qyTat0nw7v3-b6oQ-YO_37tdA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 9:16?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series includes few assorted fixes for KVM RISC-V ONE_REG interface
> and KVM_GET_REG_LIST API.
>
> These patches can also be found in riscv_kvm_onereg_fixes_v2 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v1:
>  - Addressed Drew's comments in PATCH4
>
> Anup Patel (4):
>   RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
>   RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing
>     extensions
>   KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
>   KVM: riscv: selftests: Selectively filter-out AIA registers

Queued this series for 6.6-rcX fixes

Thanks,
Anup

>
>  arch/riscv/kvm/vcpu_onereg.c                  |  7 ++-
>  .../selftests/kvm/riscv/get-reg-list.c        | 58 ++++++++++++++-----
>  2 files changed, 47 insertions(+), 18 deletions(-)
>
> --
> 2.34.1
>

