From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Wed, 5 Jul 2023 09:33:26 -0300
Subject: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
In-Reply-To: <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
Message-ID: <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 7/5/23 09:18, Alexandre Ghiti wrote:
> 
> On 05/07/2023 11:15, Daniel Henrique Barboza wrote:
>> KVM userspaces need to be aware of the host SATP to allow them to
>> advertise it back to the guest OS.
>>
>> Since this information is used to build the guest FDT we can't wait for
> 
> 
> The thing is the "mmu-type" property in the FDT is never used: the kernel will probe the hardware and choose the largest available mode, or use "no4lvl"/"no5lvl" from the command line to restrict this mode. And FYI the current mode is exposed through cpuinfo. @Conor Can we deprecate this node or something similar?
> 
> Just a remark, not sure that helps :)

It does, thanks. I am aware that the current mode is exposed through cpuinfo.
mvendorid/marchid/mimpid is also exposed there. As far as I understand we should
rely on KVM to provide all CPU related info to configure a vcpu though.

A little background of where I'm coming from. One of the QEMU KVM cpu types (host)
doesn't have an assigned satp_mode. The FDT creation of the 'virt' board relies on
that info being present, and the result is that the board will segfault. I sent a
fix for it that I hope will be queued shortly:

https://lore.kernel.org/qemu-devel/20230630100811.287315-3-dbarboza at ventanamicro.com/

Thus, if it's decided that the satp_mode FDT is deprecated, we can ignore this
patch altogether. Thanks,


Daniel


> 
> 
>> the SATP reg to be readable. We just need to read the SATP mode, thus
>> we can use the existing 'satp_mode' global that represents the SATP reg
>> with MODE set and both ASID and PPN cleared. E.g. for a 32 bit host
>> running with sv32 satp_mode is 0x80000000, for a 64 bit host running
>> sv57 satp_mode is 0xa000000000000000, and so on.
>>
>> Add a new userspace virtual config register 'satp_mode' to allow
>> userspace to read the current SATP mode the host is using with
>> GET_ONE_REG API before spinning the vcpu.
>>
>> 'satp_mode' can't be changed via KVM, so SET_ONE_REG is allowed as long
>> as userspace writes the existing 'satp_mode'.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>> ? arch/riscv/include/asm/csr.h????? | 2 ++
>> ? arch/riscv/include/uapi/asm/kvm.h | 1 +
>> ? arch/riscv/kvm/vcpu.c???????????? | 7 +++++++
>> ? 3 files changed, 10 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index b6acb7ed115f..be6e5c305e5b 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -46,6 +46,7 @@
>> ? #ifndef CONFIG_64BIT
>> ? #define SATP_PPN??? _AC(0x003FFFFF, UL)
>> ? #define SATP_MODE_32??? _AC(0x80000000, UL)
>> +#define SATP_MODE_SHIFT??? 31
>> ? #define SATP_ASID_BITS??? 9
>> ? #define SATP_ASID_SHIFT??? 22
>> ? #define SATP_ASID_MASK??? _AC(0x1FF, UL)
>> @@ -54,6 +55,7 @@
>> ? #define SATP_MODE_39??? _AC(0x8000000000000000, UL)
>> ? #define SATP_MODE_48??? _AC(0x9000000000000000, UL)
>> ? #define SATP_MODE_57??? _AC(0xa000000000000000, UL)
>> +#define SATP_MODE_SHIFT??? 60
>> ? #define SATP_ASID_BITS??? 16
>> ? #define SATP_ASID_SHIFT??? 44
>> ? #define SATP_ASID_MASK??? _AC(0xFFFF, UL)
>> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
>> index f92790c9481a..0493c078e64e 100644
>> --- a/arch/riscv/include/uapi/asm/kvm.h
>> +++ b/arch/riscv/include/uapi/asm/kvm.h
>> @@ -54,6 +54,7 @@ struct kvm_riscv_config {
>> ????? unsigned long marchid;
>> ????? unsigned long mimpid;
>> ????? unsigned long zicboz_block_size;
>> +??? unsigned long satp_mode;
>> ? };
>> ? /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>> index 8bd9f2a8a0b9..b31acf923802 100644
>> --- a/arch/riscv/kvm/vcpu.c
>> +++ b/arch/riscv/kvm/vcpu.c
>> @@ -313,6 +313,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>> ????? case KVM_REG_RISCV_CONFIG_REG(mimpid):
>> ????????? reg_val = vcpu->arch.mimpid;
>> ????????? break;
>> +??? case KVM_REG_RISCV_CONFIG_REG(satp_mode):
>> +??????? reg_val = satp_mode >> SATP_MODE_SHIFT;
>> +??????? break;
>> ????? default:
>> ????????? return -EINVAL;
>> ????? }
>> @@ -395,6 +398,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>> ????????? else
>> ????????????? return -EBUSY;
>> ????????? break;
>> +??? case KVM_REG_RISCV_CONFIG_REG(satp_mode):
>> +??????? if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
>> +??????????? return -EINVAL;
>> +??????? break;
>> ????? default:
>> ????????? return -EINVAL;
>> ????? }

