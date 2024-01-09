From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 Jan 2024 12:34:30 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.8 part #1
In-Reply-To: <CAAhSdy0GO=5N2Fz0O-=xMqJ1ZK3GoqsW76kt8UevxhJRbEYmtw@mail.gmail.com>
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
 <20240102-c07d32a585f11ee80bd7b70b@orel> <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
 <CAAhSdy0GO=5N2Fz0O-=xMqJ1ZK3GoqsW76kt8UevxhJRbEYmtw@mail.gmail.com>
Message-ID: <CABgObfZnTRGYcACubYyjNesaiQD_6rE_utusbFANyvE3F6R7Sw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 9, 2024 at 7:02?AM Anup Patel <anup@brainfault.org> wrote:
> > > On Tue, Jan 02, 2024 at 07:24:26PM +0100, Paolo Bonzini wrote:
> > > > On Sun, Dec 31, 2023 at 6:33?AM Anup Patel <anup@brainfault.org> wrote:
> > > > > We have the following KVM RISC-V changes for 6.8:
> > > > > 1) KVM_GET_REG_LIST improvement for vector registers
> > > > > 2) Generate ISA extension reg_list using macros in get-reg-list selftest
> > > > > 3) Steal time account support along with selftest
> > > >
> > > > Just one small thing I noticed on (3), do you really need cpu_to_le64
> > > > and le64_to_cpu on RISC-V? It seems that it was copied from aarch64.
> > > > No need to resend the PR anyway, of course.
>
> Friendly ping ?

Hi, I had already pulled but I was waiting for the last x86 tests to
finish. Everything is now in kvm.git.

I'll send the PR to Linus once a bunch of conflicting trees have been pulled.

Paolo


