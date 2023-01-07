From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 Jan 2023 15:28:06 +0530
Subject: [PATCH rcu 05/27] arch/riscv/kvm: Remove "select SRCU"
In-Reply-To: <20230105003813.1770367-5-paulmck@kernel.org>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1> <20230105003813.1770367-5-paulmck@kernel.org>
Message-ID: <CAAhSdy1VsT48WPQHZ5Pj5WNZRPUQvciFPF2LySawVv27tehD+g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 5, 2023 at 6:08 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Now that the SRCU Kconfig option is unconditionally selected, there is
> no longer any point in selecting it.  Therefore, remove the "select SRCU"
> Kconfig statements.
>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: <kvm@vger.kernel.org>
> Cc: <kvm-riscv@lists.infradead.org>
> Cc: <linux-riscv@lists.infradead.org>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index f36a737d5f96d..6bc9b290c1283 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -27,7 +27,6 @@ config KVM
>         select KVM_XFER_TO_GUEST_WORK
>         select HAVE_KVM_VCPU_ASYNC_IOCTL
>         select HAVE_KVM_EVENTFD
> -       select SRCU
>         help
>           Support hosting virtualized guest machines.
>
> --
> 2.31.1.189.g2e36527f23
>

