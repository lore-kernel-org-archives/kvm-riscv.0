From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Dec 2022 18:38:34 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.2
In-Reply-To: <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com>
References: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
 <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com>
Message-ID: <CAAhSdy0c5_oa27axsG_YnZmJqoTVXAeR2XQ=sqvLtBMaB3wB1Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 5:06 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Wed, Dec 7, 2022 at 11:33 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Paolo,
> >
> > We have the following KVM RISC-V changes for 6.2:
> > 1) Allow unloading KVM module
> > 2) Allow KVM user-space to set mvendorid, marchid, and mimpid
> > 3) Several fixes and cleanups
> >
> > Please pull.
> >
> > Regards,
> > Anup
>
> Hmm, I looked at them more closely and I noticed something weird in
> the author date:
>
> git log --format='%an %ad %s' origin/master..6ebbdecff6ae
> Anup Patel Wed Dec 7 09:17:49 2022 +0530 RISC-V: KVM: Add ONE_REG
> interface for mvendorid, marchid, and mimpid
> Anup Patel Wed Dec 7 09:17:43 2022 +0530 RISC-V: KVM: Save mvendorid,
> marchid, and mimpid when creating VCPU
> Anup Patel Wed Dec 7 09:17:38 2022 +0530 RISC-V: Export
> sbi_get_mvendorid() and friends
> Anup Patel Wed Dec 7 09:17:27 2022 +0530 RISC-V: KVM: Move sbi related
> struct and functions to kvm_vcpu_sbi.h
> Anup Patel Wed Dec 7 09:17:19 2022 +0530 RISC-V: KVM: Use switch-case
> in kvm_riscv_vcpu_set/get_reg()
> Anup Patel Wed Dec 7 09:17:12 2022 +0530 RISC-V: KVM: Remove redundant
> includes of asm/csr.h
> Anup Patel Wed Dec 7 09:17:05 2022 +0530 RISC-V: KVM: Remove redundant
> includes of asm/kvm_vcpu_timer.h
> Anup Patel Wed Dec 7 09:16:51 2022 +0530 RISC-V: KVM: Fix reg_val
> check in kvm_riscv_vcpu_set_reg_config()
> Christophe JAILLET Wed Dec 7 09:16:39 2022 +0530 RISC-V: KVM: Simplify
> kvm_arch_prepare_memory_region()
> Anup Patel Wed Dec 7 09:16:21 2022 +0530 RISC-V: KVM: Exit run-loop
> immediately if xfer_to_guest fails
> Bo Liu Wed Dec 7 09:16:11 2022 +0530 RISC-V: KVM: use vma_lookup()
> instead of find_vma_intersection()
> XiakaiPan Wed Dec 7 09:16:02 2022 +0530 RISC-V: KVM: Add exit logic to main.c
>
> Something in your workflow has eaten the actual date when these were
> posted to the mailing list.
>
> For example, https://lore.kernel.org/lkml/CAAhSdy0t1XGTENidgNQkQ5m5emZOes+-2RXTPLEJ0tEZXuX2hA at mail.gmail.com/t/
> shows Bo Liu's patch as being sent on November 1st.
>
> Please keep the author information from the mailing list messages, and
> also please try to update the KVM/RISC-V tree as soon as patches are
> ready and tested, i.e. earlier than the week before the merge window.
> (Seeing '6.1-rc8' as the base for the pull request is often a sign of
> something wrong with the workflow; see
>
> It's a small set of changes, so I'm going to defer this pull request
> to the second week of the merge window.

Should I send another PR ?
OR
Should I re-create the kvm-riscv-6.2-1 tag ?

Regards,
Anup

>
> Paolo
>
> > The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:
> >
> >   Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.2-1
> >
> > for you to fetch changes up to 6ebbdecff6ae00557a52539287b681641f4f0d33:
> >
> >   RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and
> > mimpid (2022-12-07 09:17:49 +0530)
> >
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.2
> >
> > - Allow unloading KVM module
> > - Allow KVM user-space to set mvendorid, marchid, and mimpid
> > - Several fixes and cleanups
> >
> > ----------------------------------------------------------------
> > Anup Patel (9):
> >       RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
> >       RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
> >       RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
> >       RISC-V: KVM: Remove redundant includes of asm/csr.h
> >       RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
> >       RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
> >       RISC-V: Export sbi_get_mvendorid() and friends
> >       RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
> >       RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
> >
> > Bo Liu (1):
> >       RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
> >
> > Christophe JAILLET (1):
> >       RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
> >
> > XiakaiPan (1):
> >       RISC-V: KVM: Add exit logic to main.c
> >
> >  arch/riscv/include/asm/kvm_host.h     | 16 +++----
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 +++
> >  arch/riscv/include/uapi/asm/kvm.h     |  3 ++
> >  arch/riscv/kernel/sbi.c               |  3 ++
> >  arch/riscv/kvm/main.c                 |  6 +++
> >  arch/riscv/kvm/mmu.c                  |  6 +--
> >  arch/riscv/kvm/vcpu.c                 | 85 ++++++++++++++++++++++++++---------
> >  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++---
> >  arch/riscv/kvm/vcpu_sbi_hsm.c         |  1 -
> >  arch/riscv/kvm/vcpu_sbi_replace.c     |  1 -
> >  arch/riscv/kvm/vcpu_sbi_v01.c         |  1 -
> >  11 files changed, 97 insertions(+), 44 deletions(-)
> >
>

