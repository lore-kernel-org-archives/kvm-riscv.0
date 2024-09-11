From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 10:19:19 +0200
Subject: [kvm-unit-tests PATCH v2 1/4] riscv: Drop mstrict-align
In-Reply-To: <D430NH4TXH15.KR19KPMT2APE@gmail.com>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-7-andrew.jones@linux.dev>
 <D430NH4TXH15.KR19KPMT2APE@gmail.com>
Message-ID: <20240911-b5b62a907e90fabe4c701930@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 10:08:23AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > The spec says unaligned accesses are supported, so this isn't required
> > and clang doesn't support it. A platform might have slow unaligned
> > accesses, but kvm-unit-tests isn't about speed anyway.
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/riscv/Makefile b/riscv/Makefile
> > index 179a373dbacf..2ee7c5bb5ad8 100644
> > --- a/riscv/Makefile
> > +++ b/riscv/Makefile
> > @@ -76,7 +76,7 @@ LDFLAGS += -melf32lriscv
> >  endif
> >  CFLAGS += -DCONFIG_RELOC
> >  CFLAGS += -mcmodel=medany
> > -CFLAGS += -mstrict-align
> > +#CFLAGS += -mstrict-align
> 
> Just remove the line?
> 
> Or put a comment there instead to explain.

I'll add a comment.

Thanks,
drew

