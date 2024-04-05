From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 5 Apr 2024 16:55:11 +0200
Subject: [kvm-unit-tests RFC PATCH 17/17] shellcheck: Suppress various
 messages
In-Reply-To: <20240405090052.375599-18-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
 <20240405090052.375599-18-npiggin@gmail.com>
Message-ID: <20240405-7c0ad5d3ce76e1ad9ad2f5a9@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:00:49PM +1000, Nicholas Piggin wrote:
> Various info and warnings are suppressed here, where circumstances
> (commented) warrant.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  run_tests.sh            | 3 +++
>  scripts/arch-run.bash   | 9 +++++++++
>  scripts/mkstandalone.sh | 2 ++
>  scripts/runtime.bash    | 2 ++
>  4 files changed, 16 insertions(+)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 938bb8edf..152323ffc 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -45,6 +45,9 @@ fi
>  only_tests=""
>  list_tests=""
>  args=$(getopt -u -o ag:htj:vl -l all,group:,help,tap13,parallel:,verbose,list,probe-maxsmp -- "$@")
> +# Shellcheck likes to test commands directly rather than with $? but sometimes they
> +# are too long to put in the same test.
> +# shellcheck disable=SC2181
>  [ $? -ne 0 ] && exit 2;
>  set -- $args;
>  while [ $# -gt 0 ]; do
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index ed440b4aa..fe8785cfd 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -44,6 +44,8 @@ run_qemu ()
>  	if [ "$errors" ]; then
>  		sig=$(grep 'terminating on signal' <<<"$errors")
>  		if [ "$sig" ]; then
> +			# This is too complex for ${var/search/replace}
> +			# shellcheck disable=SC2001
>  			sig=$(sed 's/.*terminating on signal \([0-9][0-9]*\).*/\1/' <<<"$sig")
>  		fi
>  	fi
> @@ -174,9 +176,12 @@ run_migration ()
>  
>  	# Holding both ends of the input fifo open prevents opens from
>  	# blocking and readers getting EOF when a writer closes it.
> +	# These fds appear to be unused to shellcheck so quieten the warning.
>  	mkfifo ${src_infifo}
>  	mkfifo ${dst_infifo}
> +	# shellcheck disable=SC2034
>  	exec {src_infifo_fd}<>${src_infifo}
> +	# shellcheck disable=SC2034
>  	exec {dst_infifo_fd}<>${dst_infifo}
>  
>  	"${migcmdline[@]}" \
> @@ -184,6 +189,8 @@ run_migration ()
>  		-mon chardev=mon,mode=control \
>  		< ${src_infifo} > ${src_outfifo} &
>  	live_pid=$!
> +	# SC complains about useless cat but I prefer it over redirect here.

Let's spell out 'shellcheck' when referring to it rather than call it
'SC'. And instead of "but I prefer..." let's write

 # shellcheck complains about a useless cat, but using a redirect here is
 # harder to read

or something like that. Don't tell my cat-loving daughter that I just
wrote "a useless cat"!


> +	# shellcheck disable=SC2002
>  	cat ${src_outfifo} | tee ${src_out} | filter_quiet_msgs &
>  
>  	# Start the first destination QEMU machine in advance of the test
> @@ -224,6 +231,8 @@ do_migration ()
>  		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
>  		< ${dst_infifo} > ${dst_outfifo} &
>  	incoming_pid=$!
> +	# SC complains about useless cat but I prefer it over redirect here.

Same comment as above.

> +	# shellcheck disable=SC2002
>  	cat ${dst_outfifo} | tee ${dst_out} | filter_quiet_msgs &
>  
>  	# The test must prompt the user to migrate, so wait for the
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 756647f29..2318a85f0 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -65,6 +65,8 @@ generate_test ()
>  	fi
>  
>  	temp_file bin "$kernel"
> +	# Don't want to expand $bin but print it as-is.
> +	# shellcheck disable=SC2016
>  	args[3]='$bin'
>  
>  	(echo "#!/usr/bin/env bash"
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 3b76aec9e..c87613b96 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -137,6 +137,8 @@ function run()
>      # the check line can contain multiple files to check separated by a space
>      # but each check parameter needs to be of the form <path>=<value>
>      if [ "$check" ]; then
> +        # There is no globbing allowed in the check parameter.
> +        # shellcheck disable=SC2206
>          check=($check)

Hmm, I'm not sure about this one. $check is an arbitrary path, which means
it can have spaces, then =, and then an arbitrary value, which means it can
contain spaces. If there are multiple check path=value pairs then
separation by space is a bad idea, and any deliminator really is. It seems
like each pair should be quoted, i.e.

 check = "path1=value1" "path2=value2"

and then that should be managed here.

>          for check_param in "${check[@]}"; do
>              path=${check_param%%=*}
> -- 
> 2.43.0
>

Thanks,
drew

