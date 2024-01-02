From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 2 Jan 2024 19:24:26 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #1
In-Reply-To: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
Message-ID: <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 31, 2023 at 6:33?AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.8:
> 1) KVM_GET_REG_LIST improvement for vector registers
> 2) Generate ISA extension reg_list using macros in get-reg-list selftest
> 3) Steal time account support along with selftest

Just one small thing I noticed on (3), do you really need cpu_to_le64
and le64_to_cpu on RISC-V? It seems that it was copied from aarch64.
No need to resend the PR anyway, of course.

> Please pull.
>
> Please note that I will be sending another PR for 6.8 which will
> include two more changes:
> 1) KVM RISC-V report more ISA extensions through ONE_REG
> 2) RISC-V SBI v2.0 PMU improvements and Perf sampling in KVM guest
>
> Two separate PRs are because #1 (above) depends on a series
> merged by Palmer for 6.8 and #2 (above) requires little more testing.
> I hope you are okay with two separate PRs for 6.8.

Yes, sure. The more the merrier. :)  If you want to send only #1, that
may be better?

Paolo


