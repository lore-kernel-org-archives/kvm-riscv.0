From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat, 06 Apr 2024 16:41:12 +1000
Subject: [kvm-unit-tests RFC PATCH 07/17] shellcheck: Fix SC2235
In-Reply-To: <20240405-a578a48a6cad5c42abe5943c@orel>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-8-npiggin@gmail.com>
 <20240405-a578a48a6cad5c42abe5943c@orel>
Message-ID: <D0CU26801BXH.1ZO7Z28QAJ0V1@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat Apr 6, 2024 at 12:24 AM AEST, Andrew Jones wrote:
> On Fri, Apr 05, 2024 at 07:00:39PM +1000, Nicholas Piggin wrote:
> >   SC2235 (style): Use { ..; } instead of (..) to avoid subshell
> >   overhead.
> > 
> > No bug identified. Overhead is pretty irrelevant.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  scripts/arch-run.bash | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index ae4b06679..d1edd1d69 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -580,15 +580,15 @@ kvm_available ()
> >  		return 1
> >  
> >  	[ "$HOST" = "$ARCH_NAME" ] ||
> > -		( [ "$HOST" = aarch64 ] && [ "$ARCH" = arm ] ) ||
> > -		( [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] )
> > +		{ [ "$HOST" = aarch64 ] && [ "$ARCH" = arm ] ; } ||
> > +		{ [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] ; }
> >  }
> >  
> >  hvf_available ()
> >  {
> >  	[ "$(sysctl -n kern.hv_support 2>/dev/null)" = "1" ] || return 1
> >  	[ "$HOST" = "$ARCH_NAME" ] ||
> > -		( [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] )
> > +		{ [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] ; }
> >  }
>
> This one is a bit ugly. Most developers are used to seeing expressions
> like
>
>   a || (b && c)
>
> not 
>
>  a || { b && c ; }
>
> I'm inclined to add SC2235 to the ignore list...

I'm sure it's a good warning for bash scripts that do a lot of
computation and have these in hot loops. But I _think_ none of
our scripts are like that so I would be okay with disabling
the warning. I'll do that unless someone disagrees.

Thanks,
Nick

