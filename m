From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Aug 2023 14:41:21 +0530
Subject: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
Message-ID: <CAAhSdy0PoG=AwvcavJxuS1Y6nbFE8pcX5vXDuzFr6+vjhpAMkQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 3, 2023 at 10:03?PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This version includes a diff that Andrew mentioned in v2 [1] that I
> missed. They were squashed into patch 1.
>
> No other changes made. Patches rebased on top of riscv_kvm_queue.
>
> Changes from v3:
> - patch 1:
>   - added missing EINVAL - ENOENT conversions
> - v3 link: https://lore.kernel.org/kvm/20230803140022.399333-1-dbarboza at ventanamicro.com/
>
> [1] https://lore.kernel.org/kvm/20230801222629.210929-1-dbarboza at ventanamicro.com/
>
>
> Andrew Jones (1):
>   RISC-V: KVM: Improve vector save/restore errors
>
> Daniel Henrique Barboza (9):
>   RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
>   RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
>   RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
>   RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
>   RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
>   RISC-V: KVM: avoid EBUSY when writing same ISA val
>   RISC-V: KVM: avoid EBUSY when writing the same machine ID val
>   RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
>   docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

I have queued all patches except PATCH9 for Linux-6.6.

Drew, please send v5 of PATCH.

Thanks,
Anup

>
>  Documentation/virt/kvm/api.rst |  2 +
>  arch/riscv/kvm/aia.c           |  4 +-
>  arch/riscv/kvm/vcpu_fp.c       | 12 +++---
>  arch/riscv/kvm/vcpu_onereg.c   | 74 ++++++++++++++++++++++------------
>  arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
>  arch/riscv/kvm/vcpu_timer.c    | 11 ++---
>  arch/riscv/kvm/vcpu_vector.c   | 60 ++++++++++++++-------------
>  7 files changed, 107 insertions(+), 72 deletions(-)
>
> --
> 2.41.0
>

