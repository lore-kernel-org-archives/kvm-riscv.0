From: Chao Du <duchao@eswincomputing.com>
Date: Thu, 4 Jan 2024 18:22:26 +0800 (GMT+08:00)
Subject: [RFC PATCH 0/3] RISC-V: KVM: Guest Debug Support
In-Reply-To: <51c6e871.1f32.18c9ee3ae12.Coremail.duchao@eswincomputing.com>
References: <20231221095002.7404-1-duchao@eswincomputing.com>
 <CAK9=C2Wfv7=fCitUdjBpC9=0icN82Bb+9p1-Gq5ha8o9v13nEg@mail.gmail.com>
 <19434eff.1deb.18c90a3a375.Coremail.duchao@eswincomputing.com>
 <51c6e871.1f32.18c9ee3ae12.Coremail.duchao@eswincomputing.com>
Message-ID: <2be7402e.34b.18cd3fee5ab.Coremail.duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

Gentle ping.

In my point of view, these patches focus on the software breakpoint
of KVM Guest Debug, which are independent of the SBI extensions Anup
mentioned.

Please correct me if I'm wrong.

Thanks,
Chao

On 2023-12-25 10:52, Chao Du <duchao@eswincomputing.com> wrote:
> 
> On 2023-12-22 16:28, Chao Du <duchao@eswincomputing.com> wrote:
> > 
> > On 2023-12-21 21:01, Anup Patel <apatel@ventanamicro.com> wrote:
> > > 
> > > On Thu, Dec 21, 2023 at 3:21?PM Chao Du <duchao@eswincomputing.com> wrote:
> > > >
> > > > This series implements KVM Guest Debug on RISC-V. Currently, we can
> > > > debug RISC-V KVM guest from the host side, with software breakpoints.
> > > >
> > > > A brief test was done on QEMU RISC-V hypervisor emulator.
> > > >
> > > > A TODO list which will be added later:
> > > > 1. HW breakpoints support
> > > > 2. Test cases
> > > 
> > > Himanshu has already done the complete HW breakpoint implementation
> > > in OpenSBI, Linux RISC-V, and KVM RISC-V. This is based on the upcoming
> > > SBI debug trigger extension draft proposal.
> > > (Refer, https://lists.riscv.org/g/tech-debug/message/1261)
> > > 
> > > There are also RISE projects to track these efforts:
> > > https://wiki.riseproject.dev/pages/viewpage.action?pageId=394541
> > > https://wiki.riseproject.dev/pages/viewpage.action?pageId=394545
> > > 
> > > Currently, we are in the process of upstreaming the OpenSBI support
> > > for SBI debug trigger extension. The Linux RISC-V and KVM RISC-V
> > > patches require SBI debug trigger extension and Sdtrig extension to
> > > be frozen which will happen next year 2024.
> > > 
> > > Regards,
> > > Anup
> > > 
> > 
> > Hi Anup,
> > 
> > Thank you for the information and your great work on the SBI
> > Debug Trigger Extension proposal.
> > 
> > So I think that 'HW breakpoints support' in the above TODO list
> > will be taken care of by Himanshu following the extension proposal.
> > 
> > On the other hand, if I understand correctly, the software
> > breakpoint part of KVM Guest Debug has no dependency on the new
> > extension since it does not use the trigger module. Just an
> > ebreak substitution is made.
> > 
> > So may I know your suggestion about this RFC? Both in KVM and QEMU.
> > 
> > Regards,
> > Chao
> > 
> 
> Hi Anup and all,
> 
> I'm still waiting for your comment and suggestion for the next step.
> :)
> 
> Thanks
> 
> > > >
> > > > This series is based on Linux 6.7-rc6 and is also available at:
> > > > https://github.com/Du-Chao/linux/tree/riscv_gd_sw
> > > >
> > > > The matched QEMU is available at:
> > > > https://github.com/Du-Chao/qemu/tree/riscv_gd_sw
> > > >
> > > > Chao Du (3):
> > > >   RISC-V: KVM: Enable the KVM_CAP_SET_GUEST_DEBUG capability
> > > >   RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
> > > >   RISC-V: KVM: Handle breakpoint exits for VCPU
> > > >
> > > >  arch/riscv/include/uapi/asm/kvm.h |  1 +
> > > >  arch/riscv/kvm/vcpu.c             | 15 +++++++++++++--
> > > >  arch/riscv/kvm/vcpu_exit.c        |  4 ++++
> > > >  arch/riscv/kvm/vm.c               |  1 +
> > > >  4 files changed, 19 insertions(+), 2 deletions(-)
> > > >
> > > > --
> > > > 2.17.1
> > > >
> > > >
> > > > --
> > > > kvm-riscv mailing list
> > > > kvm-riscv at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/kvm-riscv
