From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:38:07 +0200
Subject: [kvm-unit-tests RFC PATCH 13/17] shellcheck: Fix SC2294
In-Reply-To: <20240405090052.375599-14-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-14-npiggin@gmail.com>
Message-ID: <20240405-469e12c137e05d64ecf337bb@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:45PM +1000, Nicholas Piggin wrote:
>   SC2294 (warning): eval negates the benefit of arrays. Drop eval to
>   preserve whitespace/symbols (or eval as string).
> 
> No bug identified.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/arch-run.bash | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 89a496014..ed440b4aa 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -179,7 +179,7 @@ run_migration ()
>  	exec {src_infifo_fd}<>${src_infifo}
>  	exec {dst_infifo_fd}<>${dst_infifo}
>  
> -	eval "${migcmdline[@]}" \
> +	"${migcmdline[@]}" \
>  		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
>  		-mon chardev=mon,mode=control \
>  		< ${src_infifo} > ${src_outfifo} &
> @@ -219,7 +219,7 @@ run_migration ()
>  
>  do_migration ()
>  {
> -	eval "${migcmdline[@]}" \
> +	"${migcmdline[@]}" \
>  		-chardev socket,id=mon,path=${dst_qmp},server=on,wait=off \
>  		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
>  		< ${dst_infifo} > ${dst_outfifo} &
> @@ -357,7 +357,7 @@ run_panic ()
>  	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
>  
>  	# start VM stopped so we don't miss any events
> -	eval "$@" -chardev socket,id=mon,path=${qmp},server=on,wait=off \
> +	"$@" -chardev socket,id=mon,path=${qmp},server=on,wait=off \
>  		-mon chardev=mon,mode=control -S &
>  
>  	panic_event_count=$(qmp_events ${qmp} | jq -c 'select(.event == "GUEST_PANICKED")' | wc -l)
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

