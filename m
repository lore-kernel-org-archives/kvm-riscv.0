From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 3 Sep 2024 15:36:28 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: Introduce local_timer_init
In-Reply-To: <20240828162200.1384696-6-andrew.jones@linux.dev>
References: <20240828162200.1384696-5-andrew.jones@linux.dev>
 <20240828162200.1384696-6-andrew.jones@linux.dev>
Message-ID: <20240903-2958c0abcdc35b2e8f14be7a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 28, 2024 at 06:22:02PM GMT, Andrew Jones wrote:
> When Sstc is available make sure that even if we enable timer
> interrupts nothing will happen. This is necessary for cases where
> the unit tests actually intend to use the SBI TIME extension and
> aren't thinking about Sstc at all, like the SBI TIME test in
> riscv/sbi where we can now remove the initialization.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/riscv/asm/timer.h |  1 +
>  lib/riscv/setup.c     |  2 ++
>  lib/riscv/smp.c       |  2 ++
>  lib/riscv/timer.c     | 13 +++++++++++++
>  riscv/sbi.c           |  5 -----
>  5 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/riscv/asm/timer.h b/lib/riscv/asm/timer.h
> index b3514d3f6a78..fd12251a3a6b 100644
> --- a/lib/riscv/asm/timer.h
> +++ b/lib/riscv/asm/timer.h
> @@ -5,6 +5,7 @@
>  #include <asm/csr.h>
>  
>  extern void timer_get_frequency(void);
> +extern void local_timer_init(void);
>  

I've renamed the new function to local_hart_init and put it in processor.c
instead of timer.c. This is because going forward there will be other
non-timer-related CSRs that need to be set at init time and we can just
lump them all together.

Thanks,
drew

