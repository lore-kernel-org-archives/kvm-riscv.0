From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Dec 2020 12:09:38 +0530
Subject: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
Message-ID: <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 3, 2020 at 5:51 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> This series implements guest time scaling based on RDTIME instruction
> emulation so that we can allow migrating Guest/VM across Hosts with
> different time frequency.
>
> Why not through para-virt. From arm's experience[1], para-virt implementation
> doesn't really solve the problem for the following two main reasons:
> - RDTIME not only be used in linux, but also in firmware and userspace.
> - It is difficult to be compatible with nested virtualization.

I think this approach is rather incomplete. Also, I don't see how para-virt
time scaling will be difficult for nested virtualization.

If trap-n-emulate TIME CSR for Guest Linux then it will have significant
performance impact of systems where TIME CSR is implemented in HW.

Best approach will be to have VDSO-style para-virt time-scale SBI calls
(similar to what KVM x86 does). If the Guest software (Linux/Bootloader)
does not enable para-virt time-scaling then we trap-n-emulate TIME CSR
(this series).

Please propose VDSO-style para-virt time-scale SBI call and expand this
this series to provide both:
1. VDSO-style para-virt time-scaling
2. Trap-n-emulation of TIME CSR when #1 is disabled

Regards,
Anup

>
> [1] https://lore.kernel.org/patchwork/cover/1288153/
>
> Yifei Jiang (3):
>   RISC-V: KVM: Change the method of calculating cycles to nanoseconds
>   RISC-V: KVM: Support dynamic time frequency from userspace
>   RISC-V: KVM: Implement guest time scaling
>
>  arch/riscv/include/asm/csr.h            |  3 ++
>  arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
>  arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
>  arch/riscv/kvm/vcpu_timer.c             | 51 ++++++++++++++++++++++---
>  4 files changed, 93 insertions(+), 9 deletions(-)
>
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

