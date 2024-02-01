From: Eric Auger <eric.auger@redhat.com>
Date: Thu, 1 Feb 2024 10:34:24 +0100
Subject: [kvm-unit-tests PATCH v2 12/24] arm/arm64: Remove spinlocks from
 on_cpu_async
In-Reply-To: <20240126142324.66674-38-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
 <20240126142324.66674-38-andrew.jones@linux.dev>
Message-ID: <f2c558f7-4ba6-4ea5-966a-7b820ee3a2b8@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/26/24 15:23, Andrew Jones wrote:
> Remove spinlocks from on_cpu_async() by pulling some of their
> use into a new function and also by narrowing the locking to a
> single on_cpu_info structure by introducing yet another cpumask.
>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  lib/arm/asm/smp.h |  4 +++-
>  lib/arm/smp.c     | 37 ++++++++++++++++++++++++++++---------
>  2 files changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/lib/arm/asm/smp.h b/lib/arm/asm/smp.h
> index 9f6d839ab568..f0c0f97a19f8 100644
> --- a/lib/arm/asm/smp.h
> +++ b/lib/arm/asm/smp.h
> @@ -27,9 +27,11 @@ extern bool cpu0_calls_idle;
>  extern void halt(void);
>  extern void do_idle(void);
>  
> -extern void smp_boot_secondary(int cpu, secondary_entry_fn entry);
>  extern void on_cpu_async(int cpu, void (*func)(void *data), void *data);
>  extern void on_cpu(int cpu, void (*func)(void *data), void *data);
>  extern void on_cpus(void (*func)(void *data), void *data);
>  
> +extern void smp_boot_secondary(int cpu, secondary_entry_fn entry);
> +extern void smp_boot_secondary_nofail(int cpu, secondary_entry_fn entry);
> +
>  #endif /* _ASMARM_SMP_H_ */
> diff --git a/lib/arm/smp.c b/lib/arm/smp.c
> index c00fda2efb03..e0872a1a72c2 100644
> --- a/lib/arm/smp.c
> +++ b/lib/arm/smp.c
> @@ -76,12 +76,32 @@ void smp_boot_secondary(int cpu, secondary_entry_fn entry)
>  	spin_unlock(&lock);
>  }
>  
> +void smp_boot_secondary_nofail(int cpu, secondary_entry_fn entry)
> +{
> +	spin_lock(&lock);
> +	if (!cpu_online(cpu))
> +		__smp_boot_secondary(cpu, entry);
> +	spin_unlock(&lock);
> +}
> +
>  struct on_cpu_info {
>  	void (*func)(void *data);
>  	void *data;
>  	cpumask_t waiters;
>  };
>  static struct on_cpu_info on_cpu_info[NR_CPUS];
> +static cpumask_t on_cpu_info_lock;
> +
> +static bool get_on_cpu_info(int cpu)
> +{
> +	return !cpumask_test_and_set_cpu(cpu, &on_cpu_info_lock);
> +}
> +
> +static void put_on_cpu_info(int cpu)
> +{
> +	int ret = cpumask_test_and_clear_cpu(cpu, &on_cpu_info_lock);
> +	assert(ret);
> +}
>  
>  static void __deadlock_check(int cpu, const cpumask_t *waiters, bool *found)
>  {
> @@ -158,22 +178,21 @@ void on_cpu_async(int cpu, void (*func)(void *data), void *data)
>  	assert_msg(cpu != 0 || cpu0_calls_idle, "Waiting on CPU0, which is unlikely to idle. "
>  						"If this is intended set cpu0_calls_idle=1");
>  
> -	spin_lock(&lock);
> -	if (!cpu_online(cpu))
> -		__smp_boot_secondary(cpu, do_idle);
> -	spin_unlock(&lock);
> +	smp_boot_secondary_nofail(cpu, do_idle);
>  
>  	for (;;) {
>  		cpu_wait(cpu);
> -		spin_lock(&lock);
> -		if ((volatile void *)on_cpu_info[cpu].func == NULL)
> -			break;
> -		spin_unlock(&lock);
> +		if (get_on_cpu_info(cpu)) {
> +			if ((volatile void *)on_cpu_info[cpu].func == NULL)
> +				break;
> +			put_on_cpu_info(cpu);
> +		}
>  	}
> +
>  	on_cpu_info[cpu].func = func;
>  	on_cpu_info[cpu].data = data;
> -	spin_unlock(&lock);
>  	set_cpu_idle(cpu, false);
> +	put_on_cpu_info(cpu);
>  	smp_send_event();
>  }
>  


