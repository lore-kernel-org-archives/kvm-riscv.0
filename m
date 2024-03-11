From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 11 Mar 2024 15:19:24 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
Message-ID: <f58fd876-3aa7-4c0c-80ef-586862ee9363@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 3/7/24 18:43, Sean Christopherson wrote:
> E.g.
> if this were to happen with a less trivial conflict, the other sub-maintainer would
> be left doing a late scramble to figure things out just before sending their own
> pull requests.

Nah, either I would fix it, or I would look at an older tree from 
linux-next and ask whether it's okay to use that one.

>    tag kvm-riscv-6.9-1
>    Tagger:     Anup Patel<anup@brainfault.org>
>    TaggerDate: Thu Mar 7 11:54:34 2024 +0530
> 
> ...
> 
>    commit d8c0831348e78fdaf67aa95070bae2ef8e819b05
>    Author:     Anup Patel<apatel@ventanamicro.com>
>    AuthorDate: Tue Feb 13 13:39:17 2024 +0530
>    Commit:     Anup Patel<anup@brainfault.org>
>    CommitDate: Wed Mar 6 20:53:44 2024 +0530
> 
> The other reason this caught my eye is that the conflict happened in common code,
> but the added helper is RISC-V specific and used only from RISC-V code.  ARM does
> have an identical helper, but AFAICT ARM's helper is only used from ARM code.
> 
> But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
> deal, but it's rather undesirable because there's no indication that its
> implementation is arch-specific, and trying to use it in code built for s390 or
> x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
> code common where possible, but going halfway and leaving a trap for other
> architectures makes for a poor experience for developers.

I think it's okay if the _concept_ is reasonably arch-independent.  In 
that case, the first who uses it from arch-independent tests has to 
implement it for s390 and x86, but having a function in common code 
makes it possible to use it from the partly-arch-dependent tests such as 
arch_timer.c or get-reg-list.c.

(Now - that is _not_ the case here, because the function is only used in 
the aarch64 and RISC-V specific parts of the tests, but still to me it 
makes sense to have the prototype there).

Paolo


