From: Anup Patel <anup@brainfault.org>
Date: Wed, 8 Mar 2023 15:34:29 +0530
Subject: [PATCH] RISC-V: KVM: Fix sometimes VCPU not woken up when Sstc enabled
In-Reply-To: <20230308084306.1908706-1-junyan.lin@spacemit.com>
References: <20230308084306.1908706-1-junyan.lin@spacemit.com>
Message-ID: <CAAhSdy2X+=QMhFjP5qReZBqSQckmbWvcjCdQ+9tF28pYqtq_MQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 8, 2023 at 2:14?PM Junyan Lin <junyan.lin@spacemit.com> wrote:
>
> When Sstc is enabled, kvm_riscv_vcpu_timer_blocking() starts a hrtimer
> to kick the sleeping VCPU when its next_cycles arrives. The hrtimer
> would be started only if delta_ns is not 0. But sometimes when code runs
> here, current_cycles has already become greater than the VCPU
> next_cycles, and delta_ns is set to 0. At this time, the hrtimer won't
> be started and the sleeping VCPU will never be woken up (unless kicked
> elsewhere).
>
> To fix this issue, we can start the hrtimer as usual when delta_ns is 0.
> It seems no harm is done if a hrtimer is started with relative expiry 0,
> and it can trigger kvm_riscv_vcpu_vstimer_expired() ASAP to kick the
> VCPU.
>
> Signed-off-by: Junyan Lin

Similar patch is already queued for Linux-6.3 RC fixes.

Refer,
https://patchwork.ozlabs.org/project/kvm-riscv/patch/20230210142711.1177212-1-rkanwal at rivosinc.com/

Regards,
Anup

> ---
>
> I used QEMU (v7.2.0, with Sstc support, running on a x86_64 Ubuntu PC)
> to run RISC-V KVM (with the application kvmtool). Sometimes when I
> operate the VM console, the following VM kernel messages occured:
>
> [ 193.615374] rcu: INFO: rcu_sched self-detected stall on CPU
> [ 193.817218] rcu: 0-...!: (1 ticks this GP) idle=1f4c/0/0x1 softirq=391/391 fqs=0
> [ 194.081286] (t=26093 jiffies g=-367 q=1 ncpus=1)
> [ 194.259913] rcu: rcu_sched kthread timer wakeup didn't happen for 26092 jiffies! g-367 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [ 194.469957] rcu: Possible timer handling issue on cpu=0 timer-softirq=531
> [ 194.604240] rcu: rcu_sched kthread starved for 26093 jiffies! g-367 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=0
> [ 194.804629] rcu: Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
> [ 194.990219] rcu: RCU grace-period kthread stack dump:
> [ 195.090119] task:rcu_sched state:I stack:0 pid:14 ppid:2 flags:0x00000000
> [ 195.224749] Call Trace:
> [ 195.262612] [] schedule+0x5a/0xe6
> [ 195.369865] [] schedule_timeout+0x96/0x184
> [ 195.467307] [] rcu_gp_fqs_loop+0x2f8/0x3c6
> [ 195.571945] [] rcu_gp_kthread+0x132/0x15a
> [ 195.713804] [] kthread+0xea/0x100
> [ 195.797756] [] ret_from_exception+0x0/0xc
> [ 195.889635] rcu: Stack dump where RCU GP kthread last ran:
> [ 196.010148] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.1.0 #27
> [ 196.109710] Hardware name: linux,dummy-virt (DT)
> [ 196.220722] epc : arch_cpu_idle+0x22/0x28
> [ 196.301151] ra : default_idle_call+0x3c/0xfc
> [ 196.370436] epc : ffffffff80003ffa ra : ffffffff808e85c8 sp : ffffffff80c4beb0
> [ 196.470957] gp : ffffffff80e252e0 tp : ffffffff80c57e40 t0 : ff6000001f5ea600
> [ 196.591430] t1 : 0000000000000000 t2 : ffffffff809aab10 s0 : ffffffff80c4bec0
> [ 196.754133] s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
> [ 196.893724] a2 : ffffffff809a1368 a3 : ff6000001f5e7368 a4 : 0000000000001f44
> [ 196.999888] a5 : ff6000001f5e7368 a6 : 4000000000000000 a7 : 0000000000000000
> [ 197.096473] s2 : ffffffff80e28248 s3 : ffffffff80e283f8 s4 : ffffffff80e2521c
> [ 197.200699] s5 : 0000000000000000 s6 : ffffffff809a23d8 s7 : ffffffff80e724f0
> [ 197.316841] s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> [ 197.426412] s11: 0000000000000000 t3 : 000000000000005d t4 : 0000000000000000
> [ 197.591666] t5 : 00000000a9a15ab4 t6 : 0000000000000000
> [ 197.689520] status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
> [ 197.830312] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.1.0 #27
> [ 197.940338] Hardware name: linux,dummy-virt (DT)
> [ 198.028434] epc : arch_cpu_idle+0x22/0x28
> [ 198.122230] ra : default_idle_call+0x3c/0xfc
> [ 198.206204] epc : ffffffff80003ffa ra : ffffffff808e85c8 sp : ffffffff80c4beb0
> [ 198.358393] gp : ffffffff80e252e0 tp : ffffffff80c57e40 t0 : ff6000001f5ea600
> [ 198.485282] t1 : 0000000000000000 t2 : ffffffff809aab10 s0 : ffffffff80c4bec0
> [ 198.573230] s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
> [ 198.712281] a2 : ffffffff809a1368 a3 : ff6000001f5e7368 a4 : 0000000000001f44
> [ 198.845871] a5 : ff6000001f5e7368 a6 : 4000000000000000 a7 : 0000000000000000
> [ 198.991388] s2 : ffffffff80e28248 s3 : ffffffff80e283f8 s4 : ffffffff80e2521c
> [ 199.139266] s5 : 0000000000000000 s6 : ffffffff809a23d8 s7 : ffffffff80e724f0
> [ 199.277888] s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> [ 199.414241] s11: 0000000000000000 t3 : 000000000000005d t4 : 0000000000000000
> [ 199.553449] t5 : 00000000a9a15ab4 t6 : 0000000000000000
> [ 199.613065] status: 0000000200000120 badaddr: 0000000000000000 cause: 8000000000000005
>
> It seems that VCPU stalled for a long time. I found it is because
> sometimes the delta_ns in kvm_riscv_vcpu_timer_blocking() is 0, and the
> hrtimer won't be started to wake the VCPU up again later. The VCPU keeps
> sleeping until I operate the VM console, and kvmtool calls ioctl() to
> inject a interrupt and finally calls kvm_vcpu_kick() to wake it up.
>
> If we configure QEMU to have only one physical CPU, this issue is easier
> to reproduce. It looks as expected. The less CPU resources the VCPU
> thread has, the more likely the circumstance 'delta_ns == 0' is to
> happen.
>
> I tried starting the hrtimer as usual when delta_ns is 0, it did solve
> this problem. I looked into the implementation of hrtimer, there seems
> no harm if we start it with relative expiry 0 (but I'm not entirely
> sure).
>
> Some details of my environment:
>
> - QEMU: v7.2.0
> - Linux kernel: v6.2
> - OpenSBI: commit-id 506928a1be9952abc52f05c0c661338aa1d66f6d (higher
> than v1.1)
> - kvmtool: commit-id 717a3ab0a195626360f40e9d3b4d6d8e072e83ba
>
> Running QEMU:
> ```
> qemu-system-riscv64 \
> -cpu rv64 \
> -machine virt \
> -smp 1 \
> -m 1024M \
> -nographic \
> -bios MY_OPENSBI_FIRMWARE \
> -kernel MY_KERNEL.Image \
> -initrd MY_INITRD \
> -append "root=/dev/ram rw console=ttyS0,115200n8 earlycon=sbi"
> ```
>
> Running VM with kvmtool on QEMU:
> ```
> lkvm run \
> --mem 512 \
> --console serial \
> --kernel MY_KERNEL.Image \
> --params "console=ttyS0,115200n8 earlycon=uart8250,mmio,0x3f8"
> ```
>
> arch/riscv/kvm/vcpu_timer.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ad34519c8a13..3ac2ff6a65da 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -147,10 +147,8 @@ static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
> return;
>
> delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
> - if (delta_ns) {
> - hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> - t->next_set = true;
> - }
> + hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
> + t->next_set = true;
> }
>
> static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
> --
> 2.34.1
>
>
> This message and any attachment are confidential and may be privileged or otherwise protected from disclosure. If you are not an intended recipient of this message, please delete it and any attachment from your system and notify the sender immediately by reply e-mail. Unintended recipients should not use, copy, disclose or take any action based on this message or any information contained in this message. Emails cannot be guaranteed to be secure or error free as they can be intercepted, amended, lost or destroyed, and you should take full responsibility for security checking.
> ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????

