From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Nov 2024 22:14:05 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.13, part #2
In-Reply-To: <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com>
Message-ID: <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024 at 10:08?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Thu, Nov 21, 2024 at 1:55?PM Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Paolo,
> >
> > As mentioned in the last PR, here are the remaining KVM RISC-V
> > changes for 6.13 which mainly consists of Svade/Svadu extension
> > support for Host and Guest/VM.
> >
> > Please note that Palmer has not yet sent the RISC-V PR for 6.13
> > so these patches will conflict with the RISC-V tree.
>
> The RISC-V PR has not been merged yet (has it been sent?) and I am not
> sure what's happening here. If these are merged first, presumably
> Linus will bump the arch/riscv/include/asm/hwcap.h constants --
> leaving SVADE/SVADU at 87 and 88 and adjusting the others. Should I do
> that or is it delayed to 6.14 at this point?

Yes, Palmer send-out RISC-V PR one hour ago.
(subject "[GIT PULL] RISC-V Paches for the 6.13 Merge Window, Part 1")
(git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
tags/riscv-for-linus-6.13-mw1)

We have already skipped Svade & Svadu support in the 6.12 merge
window. If possible please take it in this merge window.

Regards,
Anup

>
> Paolo
>
> > Please pull.
> >
> > Regards,
> > Anup
> >
> > The following changes since commit 332fa4a802b16ccb727199da685294f85f9880cb:
> >
> >   riscv: kvm: Fix out-of-bounds array access (2024-11-05 13:27:32 +0530)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.13-2
> >
> > for you to fetch changes up to c74bfe4ffe8c1ca94e3d60ec7af06cf679e23583:
> >
> >   KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list
> > test (2024-11-21 17:40:16 +0530)
> >
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.13 part #2
> >
> > - Svade and Svadu extension support for Host and Guest/VM
> >
> > ----------------------------------------------------------------
> > Yong-Xuan Wang (4):
> >       RISC-V: Add Svade and Svadu Extensions Support
> >       dt-bindings: riscv: Add Svade and Svadu Entries
> >       RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
> >       KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
> >
> >  .../devicetree/bindings/riscv/extensions.yaml      | 28 ++++++++++++++++++++++
> >  arch/riscv/Kconfig                                 |  1 +
> >  arch/riscv/include/asm/csr.h                       |  1 +
> >  arch/riscv/include/asm/hwcap.h                     |  2 ++
> >  arch/riscv/include/asm/pgtable.h                   | 13 +++++++++-
> >  arch/riscv/include/uapi/asm/kvm.h                  |  2 ++
> >  arch/riscv/kernel/cpufeature.c                     | 12 ++++++++++
> >  arch/riscv/kvm/vcpu.c                              |  4 ++++
> >  arch/riscv/kvm/vcpu_onereg.c                       | 15 ++++++++++++
> >  tools/testing/selftests/kvm/riscv/get-reg-list.c   |  8 +++++++
> >  10 files changed, 85 insertions(+), 1 deletion(-)
> >
>

