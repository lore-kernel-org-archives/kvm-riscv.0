From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:40:06 +0200
Subject: [kvm-unit-tests RFC PATCH 14/17] shellcheck: Fix SC2178
In-Reply-To: <20240405090052.375599-15-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-15-npiggin@gmail.com>
Message-ID: <20240405-4dc7c31121a4214d2efb9edc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:46PM +1000, Nicholas Piggin wrote:
>   SC2178 (warning): Variable was used as an array but is now assigned a
>   string.
> 
> Not sure if there's a real bug.

Things seem to work, but the change looks better.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arm/efi/run   | 2 +-
>  riscv/efi/run | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index cf6d34b0b..8f41fc02d 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -44,7 +44,7 @@ qemu_args=()
>  cmd_args=()
>  while (( "$#" )); do
>  	if [ "$1" = "-append" ]; then
> -		cmd_args=$2
> +		cmd_args=("$2")
>  		shift 2
>  	else
>  		qemu_args+=("$1")
> diff --git a/riscv/efi/run b/riscv/efi/run
> index cce068694..5a72683a6 100755
> --- a/riscv/efi/run
> +++ b/riscv/efi/run
> @@ -47,7 +47,7 @@ qemu_args=()
>  cmd_args=()
>  while (( "$#" )); do
>  	if [ "$1" = "-append" ]; then
> -		cmd_args=$2
> +		cmd_args=("$2")
>  		shift 2
>  	else
>  		qemu_args+=("$1")
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

