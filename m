From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 28 Jul 2023 11:57:00 +0200
Subject: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
In-Reply-To: <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com>
References: <cover.1690364259.git.haibo1.xu@intel.com>
 <ZMKI8RknjjZBOaxf@google.com>
 <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com>
Message-ID: <20230728-5b0f530eba70ad08e8f4a67d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 28, 2023 at 09:37:36AM +0800, Haibo Xu wrote:
> On Thu, Jul 27, 2023 at 11:14?PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Thu, Jul 27, 2023, Haibo Xu wrote:
> > > The sstc_timer selftest is used to validate Sstc timer functionality
> > > in a guest, which sets up periodic timer interrupts and check the
> > > basic interrupt status upon its receipt.
> > >
> > > This KVM selftest was ported from aarch64 arch_timer and tested
> > > with Linux v6.5-rc3 on a Qemu riscv64 virt machine.
> >
> > Would it be possible to extract the ARM bits from arch_timer and make the bulk of
> > the test common to ARM and RISC-V?  At a glance, there is quite a bit of copy+paste.
> 
> Sure, I will have a try to consolidate the common code for ARM and RISC-V in v2.
>

Yes, afaict, we should be able to make aarch64/arch_timer.c another "split
test", like we did for aarch64/get-reg-list.c, but before we do that, I'd
like to get an ack from the Arm maintainers on the get-reg-list split to
be sure that approach is acceptable.

Thanks,
drew

