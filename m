From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jun 2023 09:28:47 +0530
Subject: [PATCH v3 0/3] RISC-V: KVM: Ensure SBI extension is enabled
In-Reply-To: <20230530175024.354527-1-ajones@ventanamicro.com>
References: <20230530175024.354527-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2wPbRzRv2uUuq-Gtpxbx472EysRh-hvayBsuJGcxbXRg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 30, 2023 at 11:20?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Ensure guests can't attempt to invoke SBI extension functions when the
> SBI extension's probe function has stated that the extension is not
> available.
>
> v3:
>  - used lowercase for enum
>
> v2:
>  - Reworked it to use an enum array instead of two boolean arrays
>
> Andrew Jones (3):
>   RISC-V: KVM: Rename dis_idx to ext_idx
>   RISC-V: KVM: Convert extension_disabled[] to ext_status[]
>   RISC-V: KVM: Probe for SBI extension status

Queued this series for 6.5

Thanks,
Anup

>
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  8 ++-
>  arch/riscv/kvm/vcpu_sbi.c             | 76 +++++++++++++++++++--------
>  2 files changed, 60 insertions(+), 24 deletions(-)
>
> --
> 2.40.1
>

