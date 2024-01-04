From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jan 2024 11:00:25 +0530
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #1
In-Reply-To: <20240102-c07d32a585f11ee80bd7b70b@orel>
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com> <20240102-c07d32a585f11ee80bd7b70b@orel>
Message-ID: <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Paolo,

On Wed, Jan 3, 2024 at 1:55?AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Tue, Jan 02, 2024 at 07:24:26PM +0100, Paolo Bonzini wrote:
> > On Sun, Dec 31, 2023 at 6:33?AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > Hi Paolo,
> > >
> > > We have the following KVM RISC-V changes for 6.8:
> > > 1) KVM_GET_REG_LIST improvement for vector registers
> > > 2) Generate ISA extension reg_list using macros in get-reg-list selftest
> > > 3) Steal time account support along with selftest
> >
> > Just one small thing I noticed on (3), do you really need cpu_to_le64
> > and le64_to_cpu on RISC-V? It seems that it was copied from aarch64.
> > No need to resend the PR anyway, of course.
>
> While Linux/KVM is only LE, the arch doesn't prohibit S-mode being
> configured to use BE memory accesses, so I kept the conversions. They
> at least provide some self-documenting of the code. The biggest
> problem with them, though, is that I didn't use __le64 types and now
> sparse is yelling at me. I patched that this morning, but didn't get
> a chance to post yet. I could instead rip out the conversions to
> quiet sparse, if that would be preferred.

The SBI spec is quite explicit about endianness of data in shared
memory. Also, the RISC-V priv spec allows BE load/store operations
so eventually we might see BE platforms. I suggest keeping the LE
conversion macros and __le32/__le64 data types.

Regarding the sparse errors, Drew can send fix patches which I
will include in the second PR for 6.8.

I hope this is okay.

Regards,
Anup

