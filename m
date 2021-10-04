From: Guo Ren <guoren@kernel.org>
Date: Tue, 5 Oct 2021 00:14:40 +0800
Subject: [PATCH v20 17/17] RISC-V: KVM: Add MAINTAINERS entry
In-Reply-To: <20210927114016.1089328-18-anup.patel@wdc.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <20210927114016.1089328-18-anup.patel@wdc.com>
Message-ID: <CAJF2gTR8JC+vMQ69t9UJxAf2q1xcYYN3Ecj23GdLEpngVN0YiQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Acked-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 27, 2021 at 7:42 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Add myself as maintainer for KVM RISC-V and Atish as designated reviewer.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Alexander Graf <graf@amazon.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b33791bb8e9..65afc028f4d3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10269,6 +10269,18 @@ F:     arch/powerpc/include/uapi/asm/kvm*
>  F:     arch/powerpc/kernel/kvm*
>  F:     arch/powerpc/kvm/
>
> +KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> +M:     Anup Patel <anup.patel@wdc.com>
> +R:     Atish Patra <atish.patra@wdc.com>
> +L:     kvm at vger.kernel.org
> +L:     kvm-riscv at lists.infradead.org
> +L:     linux-riscv at lists.infradead.org
> +S:     Maintained
> +T:     git git://github.com/kvm-riscv/linux.git
> +F:     arch/riscv/include/asm/kvm*
> +F:     arch/riscv/include/uapi/asm/kvm*
> +F:     arch/riscv/kvm/
> +
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:     Christian Borntraeger <borntraeger@de.ibm.com>
>  M:     Janosch Frank <frankja@linux.ibm.com>
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

