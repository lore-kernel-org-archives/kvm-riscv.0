From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 14 Feb 2023 23:36:55 +0800
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <87sff8ags6.fsf@all.your.base.are.belong.to.us>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us> <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
 <87sff8ags6.fsf@all.your.base.are.belong.to.us>
Message-ID: <CABgGipXSsqgtTx9bCy-gt7CTBkXN--t1wHgLfCxA3=vs6y+qUw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Bj?rn,

On Tue, Feb 14, 2023 at 2:43 PM Bj?rn T?pel <bjorn@kernel.org> wrote:
> So, two changes:
>
> 1. Disallow V-enablement if the existing altstack does not fit a V-sized
>    frame.
This could potentially break old programs (non-V) that load new system
libraries (with V), If the program sets a small alt stack and takes
the fault in some libraries that use V. However, existing
implementation will also kill the process when the signal arrives,
finding insufficient stack frame in such cases. I'd choose the second
one if we only have these two options, because there is a chance that
the signal handler may not even run.
> 2. Sanitize altstack changes when V is enabled.
Yes, I'd like to have this. But it may be tricky when it comes to
deciding whether V is enabled, due to the first-use trap. If V is
commonly used in system libraries then it is likely that V will be
enabled before an user set an altstack. Sanitizing this case would be
easy and straightforward. But what if the user sets an altstack before
enabling V in the first-use trap? This could happen on a statically
program that has hand-written V routines. This takes us to the 1st
question above, should we fail the user program immediately if the
altstack is set too small?
>
> Other than the altstack handling, I think the series is a good state! It
> would great if we could see a v14 land in -next...
Thanks. I am reforming the v14 patch and hoping the same to happen soon too!

Cheers,
Andy

