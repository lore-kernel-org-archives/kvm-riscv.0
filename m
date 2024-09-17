From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Tue, 17 Sep 2024 18:45:21 +0200
Subject: [PATCH 1/1] target/riscv: enable floating point unit
In-Reply-To: <20240917-b13c51d41030029c70aab785@orel>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
Message-ID: <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 17.09.24 16:49, Andrew Jones wrote:
> On Tue, Sep 17, 2024 at 03:28:42PM GMT, Heinrich Schuchardt wrote:
>> On 17.09.24 14:13, Andrew Jones wrote:
>>> On Mon, Sep 16, 2024 at 08:16:33PM GMT, Heinrich Schuchardt wrote:
>>>> OpenSBI enables the floating point in mstatus. For consistency QEMU/KVM
>>>> should do the same.
>>>>
>>>> Without this patch EDK II with TLS enabled crashes when hitting the first
>>>> floating point instruction while running QEMU with --accel kvm and runs
>>>> fine with --accel tcg.
>>>>
>>>> Additionally to this patch EDK II should be changed to make no assumptions
>>>> about the state of the floating point unit.
>>>>
>>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>>> ---
>>>>    target/riscv/cpu.c | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>>> index 4bda754b01..c32e2721d4 100644
>>>> --- a/target/riscv/cpu.c
>>>> +++ b/target/riscv/cpu.c
>>>> @@ -923,6 +923,13 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>>>>        if (mcc->parent_phases.hold) {
>>>>            mcc->parent_phases.hold(obj, type);
>>>>        }
>>>> +    if (riscv_has_ext(env, RVF) || riscv_has_ext(env, RVD)) {
>>>> +        env->mstatus = set_field(env->mstatus, MSTATUS_FS, env->misa_mxl);
>>>> +        for (int regnr = 0; regnr < 32; ++regnr) {
>>>> +            env->fpr[regnr] = 0;
>>>> +        }
>>>> +        riscv_csrrw(env, CSR_FCSR, NULL, 0, -1);
>>>> +    }
>>>
>>> If this is only fixing KVM, then I think it belongs in
>>> kvm_riscv_reset_vcpu(). But, I feel like we're working around an issue
>>> with KVM synchronization with this, as well as with the "clear CSR values"
>>> part of commit 8633951530cc ("target/riscv: Clear CSR values at reset and
>>> sync MPSTATE with host"). KVM knows how to reset VCPUs. It does so on
>>> VCPU creation and for any secondaries started with SBI HSM start. KVM's
>>> reset would set sstatus.FS to 1 ("Initial") and zero out all the fp
>>> registers and fcsr. So it seems like we're either synchronizing prior to
>>> KVM resetting the boot VCPU, not synchronizing at all, or KVM isn't doing
>>> the reset of the boot VCPU.
>>>
>>> Thanks,
>>> drew
>>
>> Hello Drew,
>>
>> Thanks for reviewing.
>>
>> Concerning the question whether kvm_riscv_reset_vcpu() would be a better
>> place for the change:
>>
>> Is there any specification prescribing what the state of the FS bits should
>> be when entering M-mode and when entering S-mode?
> 
> I didn't see anything in the spec, so I think 0 (or 1 when all fp
> registers are also reset) is reasonable for an implementation to
> choose.
> 
>>
>> Patch 8633951530cc seems not to touch the status register in QEMU's
>> kvm_riscv_reset_vcpu(). So it is not obvious that this patch could have
>> caused the problem.
> 
> I don't think 8633951530cc caused this problem. It was solving its own
> problem in the same way, which is to add some more reset for the VCPU.
> I think both it and this patch are working around a problem with KVM or
> with a problem synchronizing with KVM. If that's the case, and we fix
> KVM or the synchronization with KVM, then I would revert the reset parts
> of 8633951530cc too.
> 
>>
>> Looking at the call sequences in Linux gives some ideas where to debug:
>>
>> kvm_arch_vcpu_create calls kvm_riscv_reset_vcpu which calls
>> kvm_riscv_vcpu_fp_reset.
>>
>> riscv_vcpu_set_isa_ext_single and kvm_riscv_vcpu_set_reg_config
>> only call kvm_riscv_vcpu_fp_reset if !vcpu->arch.ran_atleast_once.
>>
>> kvm_riscv_vcpu_fp_reset sets FS bits to "initial"
>> if CONFIG_FPU=y and extension F or D is available.
>>
>> It seems that in KVM only the creation of a vcpu will set the FS bits but
>> rebooting will not.
> 
> If KVM never resets the boot VCPU on reboot, then maybe it should or needs
> QEMU to inform it to do so. I'd rather just one of the two (KVM or QEMU)
> decide what needs to be reset and to which values, rather than both having
> their own ideas. For example, with this patch, the boot hart will have its
> sstatus.FS set to 3, but, iiuc, all secondaries will be brought up
> with their sstatus.FS set to 1.
> 
> Thanks,
> drew

Hello Drew,

I added some debug messages.

Without smp: Linux' kvm_riscv_vcpu_fp_reset() is called before QEMU's 
kvm_riscv_reset_vcpu() and is never called on reboot.

qemu-system-riscv64 -M virt -accel kvm -nographic -kernel 
payload_workaround.bin
[  920.805102] kvm_arch_vcpu_create: Entry
[  920.805608] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  920.805961] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  920.806289] kvm_arch_vcpu_create: Exit
[  920.810554] kvm_arch_vcpu_create: Entry
[  920.810959] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  920.811334] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  920.811696] kvm_arch_vcpu_create: Exit
[  920.816772] kvm_arch_vcpu_create: Entry
[  920.817095] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  920.817411] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  920.817975] kvm_arch_vcpu_create: Exit
[  920.818395] kvm_riscv_vcpu_set_reg_config:
[  920.818696] kvm_riscv_vcpu_set_reg_config:
[  920.818975] kvm_riscv_vcpu_set_reg_config:
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
[  920.946333] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  920.947031] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  920.947700] kvm_riscv_check_vcpu_requests: Entry
[  920.948482] kvm_riscv_check_vcpu_requests: Entry

Test payload
============

[  920.950012] kvm_arch_vcpu_ioctl_run: run->ext_reason 35

[  920.950666] kvm_riscv_check_vcpu_requests: Entry
Rebooting

[  920.951478] kvm_arch_vcpu_ioctl_run: run->ext_reason 35
[  920.952051] kvm_riscv_check_vcpu_requests: Entry
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
[  920.962404] kvm_arch_vcpu_ioctl_run: run->ext_reason 24
[  920.962969] kvm_arch_vcpu_ioctl_run: run->ext_reason 24
[  920.963496] kvm_riscv_check_vcpu_requests: Entry

Test payload
============


With -smp 2 this seems to hold true per CPU. So essentially the effect 
of vm_riscv_vcpu_fp_reset() is always ignored both on the primary and 
the secondary harts.

$ qemu-system-riscv64 -M virt -accel kvm -smp 2 -nographic -kernel 
payload_workaround.bin
[  202.573659] kvm_arch_vcpu_create: Entry
[  202.574024] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.574328] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.574626] kvm_arch_vcpu_create: Exit
[  202.580626] kvm_arch_vcpu_create: Entry
[  202.581070] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.581599] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.582040] kvm_arch_vcpu_create: Exit
[  202.587356] kvm_arch_vcpu_create: Entry
[  202.587894] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.588376] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.589188] kvm_arch_vcpu_create: Exit
[  202.589650] kvm_riscv_vcpu_set_reg_config:
[  202.590014] kvm_riscv_vcpu_set_reg_config:
[  202.590340] kvm_riscv_vcpu_set_reg_config:
[  202.595220] kvm_arch_vcpu_create: Entry
[  202.595604] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.595939] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.596278] kvm_arch_vcpu_create: Exit
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
[  202.602093] kvm_arch_vcpu_create: Entry
[  202.602426] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.602777] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.603110] kvm_arch_vcpu_create: Exit
[  202.607898] kvm_arch_vcpu_create: Entry
[  202.608306] kvm_riscv_vcpu_fp_reset: At entry FS=0
[  202.608989] kvm_riscv_vcpu_fp_reset: At exit FS=8192
[  202.609416] kvm_arch_vcpu_create: Exit
[  202.609939] kvm_riscv_vcpu_set_reg_config:
[  202.610312] kvm_riscv_vcpu_set_reg_config:
[  202.610666] kvm_riscv_vcpu_set_reg_config:
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
[  202.749911] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  202.750370] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  202.750799] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  202.750819] kvm_arch_vcpu_ioctl_run: run->ext_reason 0
[  202.751574] kvm_riscv_check_vcpu_requests: Entry
[  202.751617] kvm_riscv_check_vcpu_requests: Entry
[  202.752737] kvm_riscv_check_vcpu_requests: Entry

Test payload
============

[  202.753678] kvm_arch_vcpu_ioctl_run: run->ext_reason 35
fcvt.d.w fa5,a5
[  202.754145] kvm_riscv_check_vcpu_requests: Entry
Rebooting

[  202.754655] kvm_arch_vcpu_ioctl_run: run->ext_reason 35
[  202.755030] kvm_riscv_check_vcpu_requests: Entry
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
QEMU riscv_cpu_reset_hold: Entry
QEMU kvm_riscv_reset_vcpu: Entry
QEMU kvm_riscv_reset_vcpu: Exit
QEMU riscv_cpu_reset_hold: Exit
[  202.770352] kvm_arch_vcpu_ioctl_run: run->ext_reason 24
[  202.770915] kvm_arch_vcpu_ioctl_run: run->ext_reason 10
[  202.770951] kvm_arch_vcpu_ioctl_run: run->ext_reason 24
[  202.771802] kvm_arch_vcpu_ioctl_run: run->ext_reason 10
[  202.772272] kvm_riscv_check_vcpu_requests: Entry
[  202.772888] kvm_riscv_check_vcpu_requests: Entry

Test payload
============


When thinking about the migration of virtual machines shouldn't QEMU be 
in control of the initial state of vcpus instead of KVM?

CCing the RISC-V KVM maintainers.

Best regards

Heinrich

