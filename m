From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 2 Oct 2022 11:42:35 +0530
Subject: Status of RISC-V KVM Guest Debug support?
In-Reply-To: <YzNH4RkatSQRUYKp@bullseye>
References: <YzNH4RkatSQRUYKp@bullseye>
Message-ID: <CAK9=C2VuO9DeEBYp96KTwUeY9q7rLaa=p4XBKQy=ZS4N3nPJsg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 29, 2022 at 10:51 PM Bobby Eshleman <bobbyeshleman@gmail.com> wrote:
>
> Hey all,
>
> I may have an interest in using guest debug (KVM_SET_GUEST_DEBUG) on
> kvm-riscv, but wanted to see if there is any ongoing effort with it
> before looking down the path of implementing it.

The guest debug is not available yet but it will be based on RISC-V HW debug
support (i.e. Sdtrig and SBI Debug Trigger extension).

Both Sdtrig and SBI Debug Trigger extensions are in draft state and undergoing
PoC work. Once this is done, we will first get hw_breakpoint support
in arch/riscv
and after that we will have KVM_SET_GUEST_DEBUG supported by KVM RISC-V.

Regards,
Anup

>
> Thanks,
> Bobby
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

