From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Oct 2022 18:07:33 +0530
Subject: [PATCH v3 0/3] riscv: kvm: use generic entry for
 TIF_NOTIFY_RESUME and misc
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
References: <20220925162400.1606-1-jszhang@kernel.org>
Message-ID: <CAAhSdy0qtH=N_LQ8KfiYTJFoNLeO_wYzhmQD8-TtSTNE5doLBw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 25, 2022 at 10:03 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> This series is a preparation series to add PREEMPT_RT support to riscv:
> patch1 adds the missing number of signal exits in vCPU stat
> patch2 switches to the generic guest entry infrastructure
> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> RT
>
> After these three patches merged, the left RT patches are similar as
> other arch.
>
> Since v2:
>   - splict the series into two separate ones, one for next another for
>     RT.
>
> Since v1:
>   - send to related maillist, I press ENTER too quickly when sending v1
>   - remove the signal_pending() handling because that's covered by
>     generic guest entry infrastructure
>
> Jisheng Zhang (3):
>   RISC-V: KVM: Record number of signal exits as a vCPU stat
>   RISC-V: KVM: Use generic guest entry infrastructure
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK

I have queued this series for Linux-6.1

Thanks,
Anup

>
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/vcpu.c             | 18 +++++++-----------
>  4 files changed, 10 insertions(+), 11 deletions(-)
>
> --
> 2.34.1
>

