From: Jiangyifei <jiangyifei@huawei.com>
Date: Wed, 23 Dec 2020 03:30:43 +0000
Subject: [PATCH v15 12/17] RISC-V: KVM: Add timer functionality
In-Reply-To: <20201109113240.3733496-13-anup.patel@wdc.com>
References: <20201109113240.3733496-1-anup.patel@wdc.com>
 <20201109113240.3733496-13-anup.patel@wdc.com>
Message-ID: <d3f3a7aea01c49afb9cadccd47498854@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup.patel at wdc.com]
> Sent: Monday, November 9, 2020 7:33 PM
> To: Palmer Dabbelt <palmer@dabbelt.com>; Palmer Dabbelt
> <palmerdabbelt@google.com>; Paul Walmsley <paul.walmsley@sifive.com>;
> Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini <pbonzini@redhat.com>
> Cc: Alexander Graf <graf@amazon.com>; Atish Patra <atish.patra@wdc.com>;
> Alistair Francis <Alistair.Francis@wdc.com>; Damien Le Moal
> <damien.lemoal@wdc.com>; Anup Patel <anup@brainfault.org>;
> kvm at vger.kernel.org; kvm-riscv at lists.infradead.org;
> linux-riscv at lists.infradead.org; linux-kernel at vger.kernel.org; Anup Patel
> <anup.patel@wdc.com>; Daniel Lezcano <daniel.lezcano@linaro.org>
> Subject: [PATCH v15 12/17] RISC-V: KVM: Add timer functionality
> 
> From: Atish Patra <atish.patra@wdc.com>
> 
> The RISC-V hypervisor specification doesn't have any virtual timer feature.
> 
> Due to this, the guest VCPU timer will be programmed via SBI calls.
> The host will use a separate hrtimer event for each guest VCPU to provide
> timer functionality. We inject a virtual timer interrupt to the guest VCPU
> whenever the guest VCPU hrtimer event expires.
> 
> This patch adds guest VCPU timer implementation along with ONE_REG
> interface to access VCPU timer state from user space.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/riscv/include/asm/kvm_host.h       |   7 +
>  arch/riscv/include/asm/kvm_vcpu_timer.h |  44 +++++
>  arch/riscv/include/uapi/asm/kvm.h       |  17 ++
>  arch/riscv/kvm/Makefile                 |   2 +-
>  arch/riscv/kvm/vcpu.c                   |  14 ++
>  arch/riscv/kvm/vcpu_timer.c             | 225
> ++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c                     |   2 +-
>  drivers/clocksource/timer-riscv.c       |   8 +
>  include/clocksource/timer-riscv.h       |  16 ++
>  9 files changed, 333 insertions(+), 2 deletions(-)  create mode 100644
> arch/riscv/include/asm/kvm_vcpu_timer.h
>  create mode 100644 arch/riscv/kvm/vcpu_timer.c  create mode 100644
> include/clocksource/timer-riscv.h
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h
> b/arch/riscv/include/asm/kvm_host.h
> index 64311b262ee1..4daffc93f36a 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -12,6 +12,7 @@
>  #include <linux/types.h>
>  #include <linux/kvm.h>
>  #include <linux/kvm_types.h>
> +#include <asm/kvm_vcpu_timer.h>
> 
>  #ifdef CONFIG_64BIT
>  #define KVM_MAX_VCPUS			(1U << 16)
> @@ -66,6 +67,9 @@ struct kvm_arch {
>  	/* stage2 page table */
>  	pgd_t *pgd;
>  	phys_addr_t pgd_phys;
> +
> +	/* Guest Timer */
> +	struct kvm_guest_timer timer;
>  };
> 

...

> diff --git a/arch/riscv/include/uapi/asm/kvm.h
> b/arch/riscv/include/uapi/asm/kvm.h
> index f7e9dc388d54..00196a13d743 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -74,6 +74,18 @@ struct kvm_riscv_csr {
>  	unsigned long scounteren;
>  };
> 
> +/* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> struct
> +kvm_riscv_timer {
> +	u64 frequency;
> +	u64 time;
> +	u64 compare;
> +	u64 state;
> +};
> +

Hi,

There are some building errors when we build kernel by using allmodconfig.
The commands are as follow:
$ make allmodconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
$ make -j64 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

The following error occurs:
[stdout] usr/include/Makefile:108: recipe for target 'usr/include/asm/kvm.hdrtest' failed
[stderr] ./usr/include/asm/kvm.h:79:2: error: unknown type name 'u64'
[stderr]   u64 frequency;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:80:2: error: unknown type name 'u64'
[stderr]   u64 time;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:81:2: error: unknown type name 'u64'
[stderr]   u64 compare;
[stderr]   ^~~
[stderr] ./usr/include/asm/kvm.h:82:2: error: unknown type name 'u64'
[stderr]   u64 state;
[stderr]   ^~~
[stderr] make[2]: *** [usr/include/asm/kvm.hdrtest] Error 1

Is it better to change u64 to __u64?

Regards,
Yifei


