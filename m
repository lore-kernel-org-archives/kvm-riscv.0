From: Sean Christopherson <seanjc@google.com>
Date: Thu, 7 Mar 2024 09:43:04 -0800
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
Message-ID: <Zen8qGzVpaOB_vKa@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 07, 2024, Anup Patel wrote:
> ----------------------------------------------------------------
> KVM/riscv changes for 6.9
> 
> - Exception and interrupt handling for selftests
> - Sstc (aka arch_timer) selftest
> - Forward seed CSR access to KVM userspace
> - Ztso extension support for Guest/VM
> - Zacas extension support for Guest/VM
> 
> ----------------------------------------------------------------
> Anup Patel (5):
>       RISC-V: KVM: Forward SEED CSR access to user space
>       RISC-V: KVM: Allow Ztso extension for Guest/VM
>       KVM: riscv: selftests: Add Ztso extension to get-reg-list test
>       RISC-V: KVM: Allow Zacas extension for Guest/VM
>       KVM: riscv: selftests: Add Zacas extension to get-reg-list test
> 
> Haibo Xu (11):
>       KVM: arm64: selftests: Data type cleanup for arch_timer test
>       KVM: arm64: selftests: Enable tuning of error margin in arch_timer test
>       KVM: arm64: selftests: Split arch_timer test code
>       KVM: selftests: Add CONFIG_64BIT definition for the build
>       tools: riscv: Add header file csr.h
>       tools: riscv: Add header file vdso/processor.h
>       KVM: riscv: selftests: Switch to use macro from csr.h
>       KVM: riscv: selftests: Add exception handling support
>       KVM: riscv: selftests: Add guest helper to get vcpu id

Uh, what's going on with this series?  Many of these were committed *yesterday*,
but you sent a mail on February 12th[1] saying these were queued.  That's quite
the lag.

I don't intend to police the RISC-V tree, but this commit caused a conflict with
kvm-x86/selftests[2].  It's a non-issue in this case because it's such a trivial
conflict, and we're all quite lax with selftests, but sending a pull request ~12
hours after pushing commits that clearly aren't fixes is a bit ridiciulous.  E.g.
if this were to happen with a less trivial conflict, the other sub-maintainer would
be left doing a late scramble to figure things out just before sending their own
pull requests.

  tag kvm-riscv-6.9-1
  Tagger:     Anup Patel <anup@brainfault.org>
  TaggerDate: Thu Mar 7 11:54:34 2024 +0530

...

  commit d8c0831348e78fdaf67aa95070bae2ef8e819b05
  Author:     Anup Patel <apatel@ventanamicro.com>
  AuthorDate: Tue Feb 13 13:39:17 2024 +0530
  Commit:     Anup Patel <anup@brainfault.org>
  CommitDate: Wed Mar 6 20:53:44 2024 +0530

The other reason this caught my eye is that the conflict happened in common code,
but the added helper is RISC-V specific and used only from RISC-V code.  ARM does
have an identical helper, but AFAICT ARM's helper is only used from ARM code.

But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
deal, but it's rather undesirable because there's no indication that its
implementation is arch-specific, and trying to use it in code built for s390 or
x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
code common where possible, but going halfway and leaving a trap for other
architectures makes for a poor experience for developers.

And again, this showing up _so_ late means it's unnecessarily difficult to clean
things up.  Which is kinda the whole point of getting thing into linux-next, so
that folks that weren't involved in the original patch/series can react if there
is a hiccup/problem/oddity.

[1] https://lore.kernel.org/all/CAAhSdy2wFzk0h5MiM5y9Fij0HyWake=7vNuV1MExUxkEtMWShw at mail.gmail.com
[2] https://lore.kernel.org/all/20240307145946.7e014225 at canb.auug.org.au

>       KVM: riscv: selftests: Change vcpu_has_ext to a common function
>       KVM: riscv: selftests: Add sstc timer test

