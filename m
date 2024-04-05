From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:35:54 +0200
Subject: [kvm-unit-tests RFC PATCH 11/17] shellcheck: Fix SC2145
In-Reply-To: <20240405090052.375599-12-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-12-npiggin@gmail.com>
Message-ID: <20240405-a35419152685e6aca33ccc04@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:43PM +1000, Nicholas Piggin wrote:
>   SC2145 (error): Argument mixes string and array. Use * or separate
>   argument.
> 
> Could be a bug?

I don't think so, since the preceding string ends with a space and there
aren't any succeeding strings. Anyway, it's good to switch to *

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/efi/run             | 2 +-
>  riscv/efi/run           | 2 +-
>  scripts/mkstandalone.sh | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index f07a6e55c..cf6d34b0b 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -87,7 +87,7 @@ uefi_shell_run()
>  if [ "$EFI_DIRECT" = "y" ]; then
>  	$TEST_DIR/run \
>  		$KERNEL_NAME \
> -		-append "$(basename $KERNEL_NAME) ${cmd_args[@]}" \
> +		-append "$(basename $KERNEL_NAME) ${cmd_args[*]}" \
>  		-bios "$EFI_UEFI" \
>  		"${qemu_args[@]}"
>  else
> diff --git a/riscv/efi/run b/riscv/efi/run
> index 982b8b9c4..cce068694 100755
> --- a/riscv/efi/run
> +++ b/riscv/efi/run
> @@ -97,7 +97,7 @@ if [ "$EFI_DIRECT" = "y" ]; then
>  	fi
>  	$TEST_DIR/run \
>  		$KERNEL_NAME \
> -		-append "$(basename $KERNEL_NAME) ${cmd_args[@]}" \
> +		-append "$(basename $KERNEL_NAME) ${cmd_args[*]}" \
>  		-machine pflash0=pflash0 \
>  		-blockdev node-name=pflash0,driver=file,read-only=on,filename="$EFI_UEFI" \
>  		"${qemu_args[@]}"
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 86c7e5498..756647f29 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -76,7 +76,7 @@ generate_test ()
>  
>  	cat scripts/runtime.bash
>  
> -	echo "run ${args[@]}"
> +	echo "run ${args[*]}"
>  }
>  
>  function mkstandalone()
> -- 
> 2.43.0
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

