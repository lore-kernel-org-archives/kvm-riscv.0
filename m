From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 28 Oct 2021 08:05:06 -0700 (PDT)
Subject: [PATCH 0/3] RISC-V: KVM: Few assorted changes
In-Reply-To: <62fe1c8e-abe0-5de9-5c00-3549faae1dba@redhat.com>
Message-ID: <mhng-e9d8caea-eae9-45dc-8072-cde5e275833f@palmerdabbelt-glaptop>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 28 Oct 2021 07:07:33 PDT (-0700), pbonzini at redhat.com wrote:
> On 26/10/21 19:01, Anup Patel wrote:
>> I had a few assorted KVM RISC-V changes which I wanted to sent after
>> KVM RISC-V was merged hence this series.
>>
>> These patches can also be found in riscv_kvm_assorted_v1 branch at:
>> https://github.com/avpatel/linux.git
>>
>> Anup Patel (3):
>>    RISC-V: Enable KVM in RV64 and RV32 defconfigs as a module
>>    RISC-V: KVM: Factor-out FP virtualization into separate sources
>>    RISC-V: KVM: Fix GPA passed to __kvm_riscv_hfence_gvma_xyz() functions
>>
>>   arch/riscv/configs/defconfig         |  15 ++-
>>   arch/riscv/configs/rv32_defconfig    |   8 +-
>>   arch/riscv/include/asm/kvm_host.h    |  10 +-
>>   arch/riscv/include/asm/kvm_vcpu_fp.h |  59 +++++++++
>>   arch/riscv/kvm/Makefile              |   1 +
>>   arch/riscv/kvm/tlb.S                 |   4 +-
>>   arch/riscv/kvm/vcpu.c                | 172 ---------------------------
>>   arch/riscv/kvm/vcpu_fp.c             | 167 ++++++++++++++++++++++++++
>>   8 files changed, 244 insertions(+), 192 deletions(-)
>>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_fp.h
>>   create mode 100644 arch/riscv/kvm/vcpu_fp.c
>>
>
> Queued 2+3, thanks.

Thanks.  I'll pick up 1, as per the thread.

