From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 10 Apr 2024 14:29:40 +1000
Subject: [RFC kvm-unit-tests PATCH v2 08/14] shellcheck: Fix SC2013
In-Reply-To: <20240408-840ece34e7b407365a18227d@orel>
References: <20240406123833.406488-1-npiggin@gmail.com>
 <20240406123833.406488-9-npiggin@gmail.com>
 <20240408-840ece34e7b407365a18227d@orel>
Message-ID: <D0G5RMOPNMCI.3HVFHWC8KQWBC@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon Apr 8, 2024 at 5:34 PM AEST, Andrew Jones wrote:
> On Sat, Apr 06, 2024 at 10:38:17PM +1000, Nicholas Piggin wrote:
> >   SC2013 (info): To read lines rather than words, pipe/redirect to a
> >   'while read' loop.
> > 
> > Not a bug.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  scripts/arch-run.bash | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index cd75405c8..45ec8f57d 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -487,7 +487,7 @@ env_file ()
> >  
> >  	[ ! -f "$KVM_UNIT_TESTS_ENV_OLD" ] && return
> >  
> > -	for line in $(grep -E '^[[:blank:]]*[[:alpha:]_][[:alnum:]_]*=' "$KVM_UNIT_TESTS_ENV_OLD"); do
> > +	grep -E '^[[:blank:]]*[[:alpha:]_][[:alnum:]_]*=' "$KVM_UNIT_TESTS_ENV_OLD" | while IFS= read -r line ; do
> >  		var=${line%%=*}
> >  		if ! grep -q "^$var=" $KVM_UNIT_TESTS_ENV; then
> >  			eval export "$line"
> > -- 
> > 2.43.0
> >
>
> I already gave an r-b on this one. Here it is again,
>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Yeah I realised just after sending. Thank you.

Thanks,
Nick

