From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 9 Oct 2023 01:23:26 +0900
Subject: [PATCH -next v21 14/27] riscv: signal: Add sigcontext
 save/restore for vector
In-Reply-To: <ZSJ0K5JFrglyJY8o@aurel32.net>
References: <20230605110724.21391-1-andy.chiu@sifive.com> <20230605110724.21391-15-andy.chiu@sifive.com>
 <ZSJ0K5JFrglyJY8o@aurel32.net>
Message-ID: <CABgGipVQ3j+Njw1CDkD9cuDwTwR2-WqF7Y_yZt3NPipAedK_2Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 8, 2023 at 6:19?PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2023-06-05 11:07, Andy Chiu wrote:
> > From: Greentime Hu <greentime.hu@sifive.com>
> >
> > This patch facilitates the existing fp-reserved words for placement of
> > the first extension's context header on the user's sigframe. A context
> > header consists of a distinct magic word and the size, including the
> > header itself, of an extension on the stack. Then, the frame is followed
> > by the context of that extension, and then a header + context body for
> > another extension if exists. If there is no more extension to come, then
> > the frame must be ended with a null context header. A special case is
> > rv64gc, where the kernel support no extensions requiring to expose
> > additional regfile to the user. In such case the kernel would place the
> > null context header right after the first reserved word of
> > __riscv_q_ext_state when saving sigframe. And the kernel would check if
> > all reserved words are zeros when a signal handler returns.
> >
> > __riscv_q_ext_state---->|     |<-__riscv_extra_ext_header
> >                       ~       ~
> >       .reserved[0]--->|0      |<-     .reserved
> >               <-------|magic  |<-     .hdr
> >               |       |size   |_______ end of sc_fpregs
> >               |       |ext-bdy|
> >               |       ~       ~
> >       +)size  ------->|magic  |<- another context header
> >                       |size   |
> >                       |ext-bdy|
> >                       ~       ~
> >                       |magic:0|<- null context header
> >                       |size:0 |
> >
> > The vector registers will be saved in datap pointer. The datap pointer
> > will be allocated dynamically when the task needs in kernel space. On
> > the other hand, datap pointer on the sigframe will be set right after
> > the __riscv_v_ext_state data structure.
>
> It appears that this patch somehow breaks userland, at least the rust
> compiler. This can be observed for instance by building the rust-lsd
> package in Debian, but many other rust packages are also affected:

Sorry for the time spent on pinpointing the issue. Yes, this is a bug
and we had a fix [1]. This fix was accidently not getting into the
-fixes branch, but it will. And it should be going into linux stable
as well, though I am not certain about the timing. Otherwise, this bug
may potentially break any processes which allocate a sigaltstack at an
address higher than their stack.

>
> * Failed build with kernel 6.5.3:
>   https://buildd.debian.org/status/fetch.php?pkg=rust-lsd&arch=riscv64&ver=0.23.1-7%2Bb1&stamp=1696475386&raw=0
>
> * Successful build with kernel 6.4.13:
>   https://buildd.debian.org/status/fetch.php?pkg=rust-lsd&arch=riscv64&ver=0.23.1-7%2Bb1&stamp=1696491025&raw=0
>
> It happens on hardware which does not have the V extension (in the above
> case on a Hifive Unmatched board). This can also be reproduced in a QEMU
> VM. Unfortunately disabling CONFIG_RISCV_ISA_V does not workaround the
> issue.
>
> It is not clear to me if it is a kernel issue or a wrong assumption on
> the rust side. Any hint on how to continue investigating?
>
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien at aurel32.net                     http://aurel32.net

[1]: https://yhbt.net/lore/all/mhng-7799d3a1-c12a-48e9-bb5f-e0a596892d78 at palmer-ri-x1c9/

