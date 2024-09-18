From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Wed, 18 Sep 2024 15:06:28 +0200
Subject: [PATCH 1/1] target/riscv: enable floating point unit
In-Reply-To: <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
Message-ID: <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 18.09.24 13:10, Peter Maydell wrote:
> On Wed, 18 Sept 2024 at 07:06, Andrew Jones <ajones@ventanamicro.com> wrote:
>>
>> On Tue, Sep 17, 2024 at 06:45:21PM GMT, Heinrich Schuchardt wrote:
>> ...
>>> When thinking about the migration of virtual machines shouldn't QEMU be in
>>> control of the initial state of vcpus instead of KVM?
>>>
>>
>> Thinking about this more, I'm inclined to agree. Initial state and reset
>> state should be traits of the VMM (potentially influenced by the user)
>> rather than KVM.
> 
> Mmm. IIRC the way this works on Arm at least is that at some point
> post-reset and before running the VM we do a QEMU->kernel state
> sync, which means that whatever the kernel does with the CPU state
> doesn't matter, only what QEMU's idea of reset is. Looking at the
> source I think the way this happens is that kvm_cpu_synchronize_post_reset()
> arranges to do a kvm_arch_put_registers(). (For Arm we have to do
> some fiddling around to make sure our CPU state is in the right
> place for that put_registers to DTRT, which is what kvm_arm_reset_vcpu()
> is doing, but that's a consequence of the way we chose to handle
> migration and in particular migration of system registers rather than
> something necessarily every architecture wants to be doing.)
> 
> This also works for reset of the vCPU on a guest-reboot. We don't
> tell KVM to reset the vCPU, we just set up the vCPU state on the
> QEMU side and then do a QEMU->kernel state sync of it.
> 
> -- PMM

Thanks Peter for looking into this.

QEMU's cpu_synchronize_all_post_init() and 
do_kvm_cpu_synchronize_post_reset() both end up in 
kvm_arch_put_registers() and that is long after Linux 
kvm_arch_vcpu_create() has been setting some FPU state. See the output 
below.

kvm_arch_put_registers() copies the CSRs by calling 
kvm_riscv_put_regs_csr(). Here we can find:

     KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);

This call enables or disables the FPU according to the value of 
env->mstatus.

So we need to set the desired state of the floating point unit in QEMU. 
And this is what the current patch does both for TCG and KVM.

Best regards

Heinrich


$ qemu-system-riscv64 -M virt -accel kvm -nographic -kernel payload.bin
QEMU qemu_init: Entry
QEMU qmp_x_exit_preconfig: Entry
[ 3503.369249] kvm_arch_vcpu_create: Entry
[ 3503.369669] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.369966] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.370256] kvm_arch_vcpu_create: Exit
[ 3503.378620] kvm_arch_vcpu_create: Entry
[ 3503.379123] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.379610] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.380111] kvm_arch_vcpu_create: Exit
[ 3503.394837] kvm_arch_vcpu_create: Entry
[ 3503.395238] kvm_riscv_vcpu_fp_reset: At entry FS=0
[ 3503.395585] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[ 3503.395947] kvm_arch_vcpu_create: Exit
[ 3503.397023] kvm_riscv_vcpu_set_reg_config:
[ 3503.398066] kvm_riscv_vcpu_set_reg_config:
[ 3503.398430] kvm_riscv_vcpu_set_reg_config:
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU qemu_machine_creation_done: Entry
QEMU qdev_machine_creation_done: Entry
QEMU cpu_synchronize_all_post_init: Entry
QEMU cpu_synchronize_post_init: Entry
QEMU kvm_cpu_synchronize_post_init: Entry
QEMU do_kvm_cpu_synchronize_post_init: Entry
QEMU kvm_arch_put_registers: Entry
QEMU kvm_riscv_put_regs_csr: Entry
QEMU kvm_riscv_put_regs_csr: Exit
QEMU kvm_arch_put_registers: Exit
QEMU do_kvm_cpu_synchronize_post_init: Exit
QEMU kvm_cpu_synchronize_post_init: Exit
QEMU cpu_synchronize_post_init: Exit
QEMU cpu_synchronize_all_post_init: Exit
QEMU qemu_system_reset: Entry
QEMU kvm_arch_get_registers: Entry
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU cpu_synchronize_all_post_reset: Entry
QEMU cpu_synchronize_post_reset: Entry
QEMU do_kvm_cpu_synchronize_post_reset: Entry
QEMU kvm_arch_put_registers: Entry
QEMU kvm_riscv_put_regs_csr: Entry
QEMU kvm_riscv_put_regs_csr: Exit
QEMU kvm_riscv_sync_mpstate_to_kvm: Entry
QEMU kvm_riscv_sync_mpstate_to_kvm: Exit
QEMU kvm_arch_put_registers: Exit
QEMU do_kvm_cpu_synchronize_post_reset: Exit
QEMU cpu_synchronize_post_reset: Exit
QEMU cpu_synchronize_all_post_reset: Exit
QEMU qemu_system_reset: Exit
QEMU qdev_machine_creation_done: Exit
QEMU qmp_x_exit_preconfig: Exit
QEMU qemu_init: Exit
QEMU kvm_cpu_exec: Entry
[ 3503.566493] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
QEMU kvm_cpu_exec: Exit
QEMU kvm_cpu_exec: Entry
[ 3503.568338] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[ 3503.568740] kvm_riscv_check_vcpu_requests: Entry
[ 3503.569534] kvm_riscv_check_vcpu_requests: Entry

Test payload
============


