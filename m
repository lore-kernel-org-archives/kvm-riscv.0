From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Jul 2023 17:07:54 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.5
In-Reply-To: <CABgObfZ5E58OpEzmRgVQ8axSZdoW-mfsq1wbPp=cfOX304O6uw@mail.gmail.com>
References: <CAAhSdy1iT=SbjSvv_7SDygSo0HhmgLjD-y+DU1_Q+6tnki7w+A@mail.gmail.com>
 <CABgObfZ5E58OpEzmRgVQ8axSZdoW-mfsq1wbPp=cfOX304O6uw@mail.gmail.com>
Message-ID: <CAAhSdy04b6TxLC78yXSUipX5dkYbWnOuuLMm56HDAy1MS2MzfQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 1, 2023 at 4:34?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Thu, Jun 22, 2023 at 4:13?PM Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Paolo,
> >
> > We have the following KVM RISC-V changes for 6.5:
> > 1) Redirect AMO load/store misaligned traps to KVM guest
> > 2) Trap-n-emulate AIA in-kernel irqchip for KVM guest
> > 3) Svnapot support for KVM Guest
> >
> > Please pull.
> >
> > Please note that there is a minor conflict with the RISC-V
> > tree in the arch/riscv/include/uapi/asm/kvm.h header due to
> > KVM vector virtualization going through the RISC-V tree.
>
> Thanks for the heads up. I also appreciate that you have fixed the
> workflow and the author/committer date are now okay!

Yes, the next branch of KVM RISC-V tree is now part of regular
integration testing in linux-next and I am actively pushing accepted
patches to the next branch much before the actual PR.

Thanks to your suggestions and guidance.

Regards,
Anup

>
> Paolo
>
> > Regards,
> > Anup
> >
> > The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:
> >
> >   Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.5-1
> >
> > for you to fetch changes up to 07f225b5842420ae9c18cba17873fc71ed69c28e:
> >
> >   RISC-V: KVM: Remove unneeded semicolon (2023-06-20 10:48:38 +0530)
> >
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.5
> >
> > - Redirect AMO load/store misaligned traps to KVM guest
> > - Trap-n-emulate AIA in-kernel irqchip for KVM guest
> > - Svnapot support for KVM Guest
> >
> > ----------------------------------------------------------------
> > Andrew Jones (3):
> >       RISC-V: KVM: Rename dis_idx to ext_idx
> >       RISC-V: KVM: Convert extension_disabled[] to ext_status[]
> >       RISC-V: KVM: Probe for SBI extension status
> >
> > Anup Patel (11):
> >       RISC-V: KVM: Implement guest external interrupt line management
> >       RISC-V: KVM: Add IMSIC related defines
> >       RISC-V: KVM: Add APLIC related defines
> >       RISC-V: KVM: Set kvm_riscv_aia_nr_hgei to zero
> >       RISC-V: KVM: Skeletal in-kernel AIA irqchip support
> >       RISC-V: KVM: Implement device interface for AIA irqchip
> >       RISC-V: KVM: Add in-kernel emulation of AIA APLIC
> >       RISC-V: KVM: Expose APLIC registers as attributes of AIA irqchip
> >       RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC
> >       RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip
> >       RISC-V: KVM: Allow Svnapot extension for Guest/VM
> >
> > Ben Dooks (1):
> >       riscv: kvm: define vcpu_sbi_ext_pmu in header
> >
> > Yang Li (1):
> >       RISC-V: KVM: Remove unneeded semicolon
> >
> > Ye Xingchen (1):
> >       RISC-V: KVM: use bitmap_zero() API
> >
> > wchen (1):
> >       RISC-V: KVM: Redirect AMO load/store misaligned traps to guest
> >
> >  arch/riscv/include/asm/csr.h           |    2 +
> >  arch/riscv/include/asm/kvm_aia.h       |  107 +++-
> >  arch/riscv/include/asm/kvm_aia_aplic.h |   58 ++
> >  arch/riscv/include/asm/kvm_aia_imsic.h |   38 ++
> >  arch/riscv/include/asm/kvm_host.h      |    4 +
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h  |   11 +-
> >  arch/riscv/include/uapi/asm/kvm.h      |   73 +++
> >  arch/riscv/kvm/Kconfig                 |    4 +
> >  arch/riscv/kvm/Makefile                |    3 +
> >  arch/riscv/kvm/aia.c                   |  274 +++++++-
> >  arch/riscv/kvm/aia_aplic.c             |  619 ++++++++++++++++++
> >  arch/riscv/kvm/aia_device.c            |  673 ++++++++++++++++++++
> >  arch/riscv/kvm/aia_imsic.c             | 1084 ++++++++++++++++++++++++++++++++
> >  arch/riscv/kvm/main.c                  |    3 +-
> >  arch/riscv/kvm/tlb.c                   |    2 +-
> >  arch/riscv/kvm/vcpu.c                  |    4 +
> >  arch/riscv/kvm/vcpu_exit.c             |    2 +
> >  arch/riscv/kvm/vcpu_sbi.c              |   80 ++-
> >  arch/riscv/kvm/vm.c                    |  118 ++++
> >  include/uapi/linux/kvm.h               |    2 +
> >  20 files changed, 3100 insertions(+), 61 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_aia_aplic.h
> >  create mode 100644 arch/riscv/include/asm/kvm_aia_imsic.h
> >  create mode 100644 arch/riscv/kvm/aia_aplic.c
> >  create mode 100644 arch/riscv/kvm/aia_device.c
> >  create mode 100644 arch/riscv/kvm/aia_imsic.c
> >
>

