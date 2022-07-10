From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Sun, 10 Jul 2022 21:05:55 +0200
Subject: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by
 kvm_riscv_check_vcpu_requests()
In-Reply-To: <20220710151105.687193-1-apatel@ventanamicro.com>
References: <20220710151105.687193-1-apatel@ventanamicro.com>
Message-ID: <c7093349-1a1e-bbad-d7bc-57056008e63c@canonical.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/10/22 17:11, Anup Patel wrote:
> The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
> and for KVM_REQ_SLEEP request it will block the VCPU without releasing
> SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
> other VCPUs of the same Guest/VM to hang/deadlock if there is any
> synchronize_srcu() or synchronize_srcu_expedited() in the path.
> 
> To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
> read unlock before blocking the VCPU and do SRCU read lock after VCPU
> wakeup.
> 
> Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
> requests handling")
> Reported-by: Bin Meng <bmeng.cn@gmail.com>

Thanks Anup for resolving the problem originally reported in

https://lore.kernel.org/all/5df27902-9009-afb9-68d3-186fdb4e4067 at canonical.com/

Thanks to Bin for his analysis.

> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

With this patch applied to Linux v5.19-rc5 I am able to run U-Boot 
qemu-riscv64_smode_defconfig on QEMU 7.0 with

qemu-system-riscv64 \
-M virt -accel kvm -m 2G -smp 2 \
-nographic \
-kernel u-boot \
-drive file=kinetic-server-cloudimg-riscv64.raw,format=raw,if=virtio \
-device virtio-net-device,netdev=eth0 \
-netdev user,id=eth0,hostfwd=tcp::8022-:22

and load files from the virtio drive.

Without the patch virtio access blocks:

[  +0.102462] INFO: task qemu-system-ris:1254 blocked for more than 120 
seconds.
[  +0.004034]       Not tainted 5.19.0-rc5 #4
[  +0.001145] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  +0.002189] task:qemu-system-ris state:D stack:    0 pid: 1254 ppid: 
1068 flags:0x00000000
[  +0.001546] Call Trace:
[  +0.000389] [<ffffffff806b1340>] schedule+0x42/0xaa
[  +0.008026] [<ffffffff806b6164>] schedule_timeout+0xa0/0xd4
[  +0.000086] [<ffffffff806b1c0a>] __wait_for_common+0x9a/0x19a
[  +0.000057] [<ffffffff806b1d24>] wait_for_completion+0x1a/0x22
[  +0.000053] [<ffffffff80063a88>] __synchronize_srcu.part.0+0x78/0xce
[  +0.000049] [<ffffffff80063b00>] synchronize_srcu_expedited+0x22/0x2c
[  +0.000474] [<ffffffff01417560>] kvm_swap_active_memslots+0x12e/0x170 
[kvm]
[  +0.000864] [<ffffffff01419ad2>] kvm_set_memslot+0x1e8/0x388 [kvm]
[  +0.000267] [<ffffffff01419da6>] __kvm_set_memory_region+0x134/0x2f8 [kvm]
[  +0.000439] [<ffffffff0141d412>] kvm_vm_ioctl+0x1fc/0xba0 [kvm]
[  +0.000232] [<ffffffff80176af0>] sys_ioctl+0x80/0x96
[  +0.000129] [<ffffffff800032d2>] ret_from_syscall+0x0/0x2

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kvm/vcpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b7a433c54d0f..5d271b597613 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>   
>   	if (kvm_request_pending(vcpu)) {
>   		if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
> +			kvm_vcpu_srcu_read_unlock(vcpu);
>   			rcuwait_wait_event(wait,
>   				(!vcpu->arch.power_off) && (!vcpu->arch.pause),
>   				TASK_INTERRUPTIBLE);
> +			kvm_vcpu_srcu_read_lock(vcpu);
>   
>   			if (vcpu->arch.power_off || vcpu->arch.pause) {
>   				/*

