From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:29:38 +0200
Subject: [kvm-unit-tests RFC PATCH 09/17] shellcheck: Fix SC2143
In-Reply-To: <20240405090052.375599-10-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-10-npiggin@gmail.com>
Message-ID: <20240405-a6de93cfd2e6f513a78534af@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:41PM +1000, Nicholas Piggin wrote:
>   SC2143 (style): Use ! grep -q instead of comparing output with
>   [ -z .. ].
> 
> Not a bug.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/arch-run.bash | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index d1edd1d69..9dc34a54a 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -61,7 +61,11 @@ run_qemu ()
>  		# Even when ret==1 (unittest success) if we also got stderr
>  		# logs, then we assume a QEMU failure. Otherwise we translate
>  		# status of 1 to 0 (SUCCESS)
> -		if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
> +	        if [ "$errors" ]; then
> +			if ! grep -qvi warning <<<"$errors" ; then
> +				ret=0
> +			fi
> +		else
>  			ret=0
>  		fi
>  	fi
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

