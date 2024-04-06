From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat, 06 Apr 2024 20:56:04 +1000
Subject: [kvm-unit-tests RFC PATCH 17/17] shellcheck: Suppress various
 messages
In-Reply-To: <20240405-7c0ad5d3ce76e1ad9ad2f5a9@orel>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-18-npiggin@gmail.com>
 <20240405-7c0ad5d3ce76e1ad9ad2f5a9@orel>
Message-ID: <D0CZHAYST4M9.193BR8RVK0KJK@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat Apr 6, 2024 at 12:55 AM AEST, Andrew Jones wrote:
> On Fri, Apr 05, 2024 at 07:00:49PM +1000, Nicholas Piggin wrote:
> > Various info and warnings are suppressed here, where circumstances
> > (commented) warrant.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  run_tests.sh            | 3 +++
> >  scripts/arch-run.bash   | 9 +++++++++
> >  scripts/mkstandalone.sh | 2 ++
> >  scripts/runtime.bash    | 2 ++
> >  4 files changed, 16 insertions(+)
> > 
> > diff --git a/run_tests.sh b/run_tests.sh
> > index 938bb8edf..152323ffc 100755
> > --- a/run_tests.sh
> > +++ b/run_tests.sh
> > @@ -45,6 +45,9 @@ fi
> >  only_tests=""
> >  list_tests=""
> >  args=$(getopt -u -o ag:htj:vl -l all,group:,help,tap13,parallel:,verbose,list,probe-maxsmp -- "$@")
> > +# Shellcheck likes to test commands directly rather than with $? but sometimes they
> > +# are too long to put in the same test.
> > +# shellcheck disable=SC2181
> >  [ $? -ne 0 ] && exit 2;
> >  set -- $args;
> >  while [ $# -gt 0 ]; do
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index ed440b4aa..fe8785cfd 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -44,6 +44,8 @@ run_qemu ()
> >  	if [ "$errors" ]; then
> >  		sig=$(grep 'terminating on signal' <<<"$errors")
> >  		if [ "$sig" ]; then
> > +			# This is too complex for ${var/search/replace}
> > +			# shellcheck disable=SC2001
> >  			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
> >  		fi
> >  	fi
> > @@ -174,9 +176,12 @@ run_migration ()
> >  
> >  	# Holding both ends of the input fifo open prevents opens from
> >  	# blocking and readers getting EOF when a writer closes it.
> > +	# These fds appear to be unused to shellcheck so quieten the warning.
> >  	mkfifo ${src_infifo}
> >  	mkfifo ${dst_infifo}
> > +	# shellcheck disable=SC2034
> >  	exec {src_infifo_fd}<>${src_infifo}
> > +	# shellcheck disable=SC2034
> >  	exec {dst_infifo_fd}<>${dst_infifo}
> >  
> >  	"${migcmdline[@]}" \
> > @@ -184,6 +189,8 @@ run_migration ()
> >  		-mon chardev=mon,mode=control \
> >  		< ${src_infifo} > ${src_outfifo} &
> >  	live_pid=$!
> > +	# SC complains about useless cat but I prefer it over redirect here.
>
> Let's spell out 'shellcheck' when referring to it rather than call it
> 'SC'. And instead of "but I prefer..." let's write

Okay I got reminded why I did this, because starting # shellcheck blah
makes shellcheck try to parse it and fails. We could use # * shellcheck
for comments?

Thanks,
Nick

