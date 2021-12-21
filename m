From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Dec 2021 14:48:01 +0530
Subject: [PATCH v2 3/4] KVM: selftests: Add EXTRA_CFLAGS in top-level
 Makefile
In-Reply-To: <YcDdPUn9bAVnxb/2@google.com>
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-4-anup.patel@wdc.com>
 <YcDdPUn9bAVnxb/2@google.com>
Message-ID: <CAAhSdy3qFZoK16gh=F5jk7QC3q_xMOJbCmigCsQ1d7WYoSR9nA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 21, 2021 at 1:15 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Nov 29, 2021, Anup Patel wrote:
> > We add EXTRA_CFLAGS to the common CFLAGS of top-level Makefile
>
> Nit, wrap closer to 75 chars.

Okay, I will update.

>
> > which will allow users to pass additional compile-time flags such
> > as "-static".
>
> In case there's any hesitation in applying this (Paolo asked if this was just for
> debugging in v1), being able to pass "-static" is helpful for our environment as
> our test systems have a funky and minimal configuration (no gcc, and the interpreter
> is in a weird location).  Running selftests either requires building them with
> -static or creating a symbolic link for /lib64/ld-linux-x86-64.so.2.  It's generally
> easier to just tell people to compile with -static.
>
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
>
> Reviewed-and-tested-by: Sean Christopherson <seanjc@google.com>

Thanks, I am planning to queue this for 5.17. Currently, I am waiting for
some reviews on the PATCH4 (last patch).

Regards,
Anup

