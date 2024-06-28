From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Fri, 28 Jun 2024 10:29:37 -0400
Subject: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
In-Reply-To: <20240626-pedigree-retype-dd7f1e54ac2b@spud>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud>
 <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
 <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
 <20240626-pedigree-retype-dd7f1e54ac2b@spud>
Message-ID: <20240628-quantum-sophisticated-ferret-5eaec4@lemur>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 26, 2024 at 11:11:54PM GMT, Conor Dooley wrote:
> > Strange. I modified and sent the patch using b4 as well. It's missing
> > my sign off too.
> 
> `b4 shazam` should pick up trailers provided on the list, signoffs
> included. `b4 shazam -s` will add yours. TBH, I am not sure why that is
> not the default behaviour.

Some projects don't use the DCO model, so they don't require Signed-off-by
trailers.

-K

