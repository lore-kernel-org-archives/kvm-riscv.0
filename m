From: Thomas Huth <thuth@redhat.com>
Date: Fri, 9 Feb 2024 09:03:53 +0100
Subject: [kvm-unit-tests PATCH v3 6/8] migration: Add quiet migration
 support
In-Reply-To: <20240209070141.421569-7-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-7-npiggin@gmail.com>
Message-ID: <c143430d-482e-43bb-9c94-b6977c6482e5@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 09/02/2024 08.01, Nicholas Piggin wrote:
> Console output required to support migration becomes quite noisy
> when doing lots of migrations. Provide a migrate_quiet() call that
> suppresses console output and doesn't log a message.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   lib/migrate.c         | 12 ++++++++++++
>   lib/migrate.h         |  1 +
>   scripts/arch-run.bash |  4 ++--
>   3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/migrate.c b/lib/migrate.c
> index b7721659..4e0ab516 100644
> --- a/lib/migrate.c
> +++ b/lib/migrate.c
> @@ -18,6 +18,18 @@ void migrate(void)
>   	report_info("Migration complete");
>   }
>   
> +/*
> + * Like migrate() but supporess output and logs, useful for intensive

s/supporess/suppress/

> + * migration stress testing without polluting logs. Test cases should
> + * provide relevant information about migration in failure reports.
> + */
> +void migrate_quiet(void)
> +{
> +	puts("Now migrate the VM (quiet)\n");
> +	(void)getchar();
> +}
> +
> +

Remove one empty line, please!

>   /*
>    * Initiate migration and wait for it to complete.
>    * If this function is called more than once, it is a no-op.
> diff --git a/lib/migrate.h b/lib/migrate.h
> index 2af06a72..95b9102b 100644
> --- a/lib/migrate.h
> +++ b/lib/migrate.h
> @@ -7,4 +7,5 @@
>    */
>   
>   void migrate(void);
> +void migrate_quiet(void);
>   void migrate_once(void);
> diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> index 0b45eb61..29cf9b0c 100644
> --- a/scripts/arch-run.bash
> +++ b/scripts/arch-run.bash
> @@ -152,7 +152,7 @@ run_migration ()
>   		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
>   		-mon chardev=mon,mode=control > ${src_outfifo} &
>   	live_pid=$!
> -	cat ${src_outfifo} | tee ${src_out} &
> +	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
>   
>   	# The test must prompt the user to migrate, so wait for the "migrate"
>   	# keyword
> @@ -200,7 +200,7 @@ do_migration ()
>   		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
>   		< <(cat ${dst_infifo}) > ${dst_outfifo} &
>   	incoming_pid=$!
> -	cat ${dst_outfifo} | tee ${dst_out} &
> +	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
>   
>   	# The test must prompt the user to migrate, so wait for the "migrate" keyword
>   	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do

  Thomas


