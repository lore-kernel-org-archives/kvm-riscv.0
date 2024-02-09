From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 08:29:04 +0100
Subject: [kvm-unit-tests PATCH v3 1/8] arch-run: Fix TRAP handler
 recursion to remove temporary files properly
In-Reply-To: <20240209070141.421569-2-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-2-npiggin@gmail.com>
Message-ID: <4203f6dc-ad8c-4bcd-a366-f50f866c55ec@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Migration files were not being removed when the QEMU process is
> interrupted (e.g., with ^C). This is becaus the SIGINT propagates to the
> bash TRAP handler, which recursively TRAPs due to the 'kill 0' in the
> handler. This eventually crashes bash.
> 
> This can be observed by interrupting a long-running test program that is
> run with MIGRATION=yes, /tmp/mig-helper-* files remain afterwards.
> 
> Removing TRAP recursion solves this problem and allows the EXIT handler
> to run and clean up the files.
> 
> This also moves the trap handler before temp file creation, and expands
> the name variables at trap-time rather than install-time, which closes
> the small race between creation trap handler install.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index d0864360..11d47a85 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -129,6 +129,9 @@ run_migration ()
>   		return 77
>   	fi
>   
> +	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
> +	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> +
>   	migsock=$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
>   	migout1=$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
>   	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
> @@ -137,9 +140,6 @@ run_migration ()
>   	qmpout1=/dev/null
>   	qmpout2=/dev/null
>   
> -	trap 'kill 0; exit 2' INT TERM
> -	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> -
>   	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
>   		-mon chardev=mon1,mode=control | tee ${migout1} &
>   	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
> @@ -209,11 +209,11 @@ run_panic ()
>   		return 77
>   	fi
>   
> -	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
> -
> -	trap 'kill 0; exit 2' INT TERM
> +	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
>   	trap 'rm -f ${qmp}' RETURN EXIT
>   
> +	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
> +
>   	# start VM stopped so we don't miss any events
>   	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
>   		-mon chardev=mon1,mode=control -S &

Reviewed-by: Thomas Huth <thuth@redhat.com>


