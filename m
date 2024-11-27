From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Nov 2024 17:47:07 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.13, part #2
In-Reply-To: <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
References: <CAAhSdy2mLBzE63wpQrOaHtOV0rwqkaxTUMBA9oMZsk68o0EHMg@mail.gmail.com>
 <CABgObfacuB-8KN1+Czt5DaXQbaiw9=jP5zYGatw6CGooLnz9Sg@mail.gmail.com> <CAAhSdy1eYZc__ynDrF8sQCk8Rj+CRj+LBBbGnV+Hc4qHfYiEOA@mail.gmail.com>
Message-ID: <CABgObfbKYc0Dqcq36dHsV=uopV+TAGu9-SuZF+QP=u6x0uMiHg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 27, 2024 at 5:44?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Nov 27, 2024 at 10:08?PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On Thu, Nov 21, 2024 at 1:55?PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > Hi Paolo,
> > >
> > > As mentioned in the last PR, here are the remaining KVM RISC-V
> > > changes for 6.13 which mainly consists of Svade/Svadu extension
> > > support for Host and Guest/VM.
> > >
> > > Please note that Palmer has not yet sent the RISC-V PR for 6.13
> > > so these patches will conflict with the RISC-V tree.
> >
> > The RISC-V PR has not been merged yet (has it been sent?) and I am not
> > sure what's happening here. If these are merged first, presumably
> > Linus will bump the arch/riscv/include/asm/hwcap.h constants --
> > leaving SVADE/SVADU at 87 and 88 and adjusting the others. Should I do
> > that or is it delayed to 6.14 at this point?
>
> Yes, Palmer send-out RISC-V PR one hour ago.
> (subject "[GIT PULL] RISC-V Paches for the 6.13 Merge Window, Part 1")
> (git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> tags/riscv-for-linus-6.13-mw1)
>
> We have already skipped Svade & Svadu support in the 6.12 merge
> window. If possible please take it in this merge window.

Ok, will do. But I'd like to understand if KVM patches needed the bare
metal support. If not, and the only reason to skip it in 6.12 was the
hwcap.h constants, then there was no reason to delay it. Just send the
hwcap.h update as a pull request to both me and Palmer, and we'll
merge it from the same commit into our trees.

Paolo


