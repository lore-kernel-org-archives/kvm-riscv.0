From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 08:32:45 +0100
Subject: [kvm-unit-tests PATCH v3 2/8] arch-run: Clean up initrd cleanup
In-Reply-To: <20240209070141.421569-3-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-3-npiggin@gmail.com>
Message-ID: <9fb2f113-db36-41a6-a6f2-0499f28ace0a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Rather than put a big script into the trap handler, have it call
> a function.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   scripts/arch-run.bash | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 11d47a85..1e903e83 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -269,10 +269,21 @@ search_qemu_binary ()
>   	export PATH=$save_path
>   }
>   
> +initrd_cleanup ()
> +{
> +	rm -f $KVM_UNIT_TESTS_ENV
> +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> +		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
> +	else
> +		unset KVM_UNIT_TESTS_ENV
> +		unset KVM_UNIT_TESTS_ENV_OLD
> +	fi
> +}

Looking at the original code below, shouldn't this rather unset 
KVM_UNIT_TESTS_ENV_OLD after the "fi" statement?

  Thomas


>   initrd_create ()
>   {
>   	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
> -		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OLD" ] && export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
> +		trap_exit_push 'initrd_cleanup'
>   		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
>   		export KVM_UNIT_TESTS_ENV=$(mktemp)
>   		env_params


