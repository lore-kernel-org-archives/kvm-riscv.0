From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 8 Mar 2024 08:53:05 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.9
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
Message-ID: <20240308-5d406beb72ee7f30f894c45d@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 07, 2024 at 09:43:04AM -0800, Sean Christopherson wrote:
...
> But the prototype of guest_get_vcpuid() is in common code.  Which isn't a huge
> deal, but it's rather undesirable because there's no indication that its
> implementation is arch-specific, and trying to use it in code built for s390 or
> x86 (or MIPS or PPC, which are on the horizon), would fail.  I'm all for making
> code common where possible, but going halfway and leaving a trap for other
> architectures makes for a poor experience for developers.
>

I've got a few other riscv kvm selftests cleanup patches locally queued.
I'll add another one which moves the prototype to include/riscv/processor.h
and include/aarch64/processor.h. Making guest_get_vcpuid() common (for
which I think I'm to blame) was premature and, as you point out, it should
have at least been named arch_guest_get_vcpuid(). I could do the rename
instead, but since I'm not sure if it'll ever get adopted outside riscv
and aarch64, I'll just move for now.

Thanks,
drew

