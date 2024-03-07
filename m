From: Sean Christopherson <seanjc@google.com>
Date: Thu, 7 Mar 2024 10:42:41 -0800
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
Message-ID: <ZeoKoUJlCZMiwPXB@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 07, 2024, Sean Christopherson wrote:
> On Thu, Mar 07, 2024, Anup Patel wrote:
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.9
> > 
> > - Exception and interrupt handling for selftests
> > - Sstc (aka arch_timer) selftest
> > - Forward seed CSR access to KVM userspace
> > - Ztso extension support for Guest/VM
> > - Zacas extension support for Guest/VM
> > 
> > ----------------------------------------------------------------
> > Anup Patel (5):
> >       RISC-V: KVM: Forward SEED CSR access to user space
> >       RISC-V: KVM: Allow Ztso extension for Guest/VM
> >       KVM: riscv: selftests: Add Ztso extension to get-reg-list test
> >       RISC-V: KVM: Allow Zacas extension for Guest/VM
> >       KVM: riscv: selftests: Add Zacas extension to get-reg-list test
> > 
> > Haibo Xu (11):
> >       KVM: arm64: selftests: Data type cleanup for arch_timer test
> >       KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
> >       KVM: arm64: selftests: Split arch_timer test code
> >       KVM: selftests: Add CONFIG_64BIT definition for the build
> >       tools: riscv: Add header file csr.h
> >       tools: riscv: Add header file vdso/processor.h
> >       KVM: riscv: selftests: Switch to use macro from csr.h
> >       KVM: riscv: selftests: Add exception handling support
> >       KVM: riscv: selftests: Add guest helper to get vcpu id
> 
> Uh, what's going on with this series?  Many of these were committed *yesterday*,
> but you sent a mail on February 12th[1] saying these were queued.  That's quite
> the lag.

...

> And again, this showing up _so_ late means it's unnecessarily difficult to clean
> things up.  Which is kinda the whole point of getting thing into linux-next, so
> that folks that weren't involved in the original patch/series can react if there
> is a hiccup/problem/oddity.

Case in point (I pinky-swear I didn't see the patch before sending the first mail):

https://lore.kernel.org/all/20240307081951.1954830-1-colin.i.king at gmail.com

