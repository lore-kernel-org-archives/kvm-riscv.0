From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Oct 2022 09:49:30 +0530
Subject: [PATCH] MAINTAINERS: git://github -> https://github.com for kvm-riscv
In-Reply-To: <20221013214638.30974-1-palmer@rivosinc.com>
References: <20221013214638.30974-1-palmer@rivosinc.com>
Message-ID: <CAAhSdy0sM1ENhTuakHBB7xm5nUVtKzUzPFQ-sVMyeWHDv0FPzQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 14, 2022 at 3:19 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> Github deprecated the git:// links about a year ago, so let's move to
> the https:// URLs instead.
>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://github.blog/2021-09-01-improving-git-protocol-security-github/
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
> I've split these up by github username so folks can take them
> independently, as some of these repos have been renamed at github and
> thus need more than just a sed to fix them.
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a47bd58a330..d103b44fb40c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11156,7 +11156,7 @@ L:      kvm at vger.kernel.org
>  L:     kvm-riscv at lists.infradead.org
>  L:     linux-riscv at lists.infradead.org
>  S:     Maintained
> -T:     git git://github.com/kvm-riscv/linux.git
> +T:     git https://github.com/kvm-riscv/linux.git
>  F:     arch/riscv/include/asm/kvm*
>  F:     arch/riscv/include/uapi/asm/kvm*
>  F:     arch/riscv/kvm/
> --
> 2.38.0
>

