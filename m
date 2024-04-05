From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:28:32 +0200
Subject: [kvm-unit-tests RFC PATCH 08/17] shellcheck: Fix SC2119, SC2120
In-Reply-To: <20240405090052.375599-9-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-9-npiggin@gmail.com>
Message-ID: <20240405-6697565960bc4c4177ae865b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:40PM +1000, Nicholas Piggin wrote:
>   SC2119 (info): Use is_pv "$@" if function's $1 should mean script's
>   $1.
> 
>   SC2120 (warning): is_pv references arguments, but none are ever
>   passed.
> 
> Could be a bug?

Looks like it to me.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  s390x/run | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/s390x/run b/s390x/run
> index e58fa4af9..34552c274 100755
> --- a/s390x/run
> +++ b/s390x/run
> @@ -21,12 +21,12 @@ is_pv() {
>  	return 1
>  }
>  
> -if is_pv && [ "$ACCEL" = "tcg" ]; then
> +if is_pv "$@" && [ "$ACCEL" = "tcg" ]; then
>  	echo "Protected Virtualization isn't supported under TCG"
>  	exit 2
>  fi
>  
> -if is_pv && [ "$MIGRATION" = "yes" ]; then
> +if is_pv "$@" && [ "$MIGRATION" = "yes" ]; then
>  	echo "Migration isn't supported under Protected Virtualization"
>  	exit 2
>  fi
> @@ -34,12 +34,12 @@ fi
>  M='-machine s390-ccw-virtio'
>  M+=",accel=$ACCEL$ACCEL_PROPS"
>  
> -if is_pv; then
> +if is_pv "$@"; then
>  	M+=",confidential-guest-support=pv0"
>  fi
>  
>  command="$qemu -nodefaults -nographic $M"
> -if is_pv; then
> +if is_pv "$@"; then
>  	command+=" -object s390-pv-guest,id=pv0"
>  fi
>  command+=" -chardev stdio,id=con0 -device sclpconsole,chardev=con0"
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

