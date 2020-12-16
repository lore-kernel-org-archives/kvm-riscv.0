From: Jiangyifei <jiangyifei@huawei.com>
Date: Wed, 16 Dec 2020 08:01:37 +0000
Subject: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
In-Reply-To: <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
 <CAAhSdy2zdwfOGFUtakhbeDUJBapz6fWPnQptT7nCdyFMSoLyGg@mail.gmail.com>
Message-ID: <70bdbe9c25214e9483950a0a0efb4305@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Anup Patel [mailto:anup at brainfault.org]
> Sent: Wednesday, December 16, 2020 2:40 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: Anup Patel <anup.patel@wdc.com>; Atish Patra <atish.patra@wdc.com>;
> Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Paolo Bonzini
> <pbonzini@redhat.com>; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> KVM General <kvm@vger.kernel.org>; yinyipeng <yinyipeng1@huawei.com>;
> Zhangxiaofeng (F) <victor.zhangxiaofeng@huawei.com>;
> linux-kernel at vger.kernel.org List <linux-kernel@vger.kernel.org>;
> kvm-riscv at lists.infradead.org; linux-riscv <linux-riscv@lists.infradead.org>;
> Wubin (H) <wu.wubin@huawei.com>; dengkai (A) <dengkai1@huawei.com>
> Subject: Re: [PATCH RFC 0/3] Implement guest time scaling in RISC-V KVM
> 
> On Thu, Dec 3, 2020 at 5:51 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > This series implements guest time scaling based on RDTIME instruction
> > emulation so that we can allow migrating Guest/VM across Hosts with
> > different time frequency.
> >
> > Why not through para-virt. From arm's experience[1], para-virt
> > implementation doesn't really solve the problem for the following two main
> reasons:
> > - RDTIME not only be used in linux, but also in firmware and userspace.
> > - It is difficult to be compatible with nested virtualization.
> 
> I think this approach is rather incomplete. Also, I don't see how para-virt time
> scaling will be difficult for nested virtualization.
> 
> If trap-n-emulate TIME CSR for Guest Linux then it will have significant
> performance impact of systems where TIME CSR is implemented in HW.
> 
> Best approach will be to have VDSO-style para-virt time-scale SBI calls (similar
> to what KVM x86 does). If the Guest software (Linux/Bootloader) does not
> enable para-virt time-scaling then we trap-n-emulate TIME CSR (this series).
> 
> Please propose VDSO-style para-virt time-scale SBI call and expand this this
> series to provide both:
> 1. VDSO-style para-virt time-scaling
> 2. Trap-n-emulation of TIME CSR when #1 is disabled
> 
> Regards,
> Anup
> 

OK, it sounds good. We will look into the para-virt time-scaling for more details.

Yifei

> >
> > [1] https://lore.kernel.org/patchwork/cover/1288153/
> >
> > Yifei Jiang (3):
> >   RISC-V: KVM: Change the method of calculating cycles to nanoseconds
> >   RISC-V: KVM: Support dynamic time frequency from userspace
> >   RISC-V: KVM: Implement guest time scaling
> >
> >  arch/riscv/include/asm/csr.h            |  3 ++
> >  arch/riscv/include/asm/kvm_vcpu_timer.h | 13 +++++--
> >  arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++
> >  arch/riscv/kvm/vcpu_timer.c             | 51
> ++++++++++++++++++++++---
> >  4 files changed, 93 insertions(+), 9 deletions(-)
> >
> > --
> > 2.19.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
