From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 27 Aug 2024 18:55:31 +0200
Subject: [kvm-unit-tests PATCH v2 1/4] lib/report: Add helper methods to
 clear multiple prefixes
In-Reply-To: <20240825170824.107467-2-jamestiotio@gmail.com>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
 <20240825170824.107467-2-jamestiotio@gmail.com>
Message-ID: <20240827-217d5e2cd0238a40f88fa6af@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Also, let's separate this patch into its own series where we also apply
it with a second patch to the current riscv/sbi.c in order to remove a
bunch of pops.

Thanks,
drew

On Mon, Aug 26, 2024 at 01:08:21AM GMT, James Raphael Tiovalen wrote:
> Add a method to pop a specified number of prefixes and another method to
> clear all prefixes.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
> ---
>  lib/libcflat.h |  2 ++
>  lib/report.c   | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index 16a83880..0286ddec 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -96,6 +96,8 @@ void report_prefix_pushf(const char *prefix_fmt, ...)
>  					__attribute__((format(printf, 1, 2)));
>  extern void report_prefix_push(const char *prefix);
>  extern void report_prefix_pop(void);
> +extern void report_prefix_popn(int n);
> +extern void report_prefix_clear(void);
>  extern void report(bool pass, const char *msg_fmt, ...)
>  		__attribute__((format(printf, 2, 3), nonnull(2)));
>  extern void report_xfail(bool xfail, bool pass, const char *msg_fmt, ...)
> diff --git a/lib/report.c b/lib/report.c
> index 7f3c4f05..d45afedc 100644
> --- a/lib/report.c
> +++ b/lib/report.c
> @@ -80,6 +80,19 @@ void report_prefix_pop(void)
>  	spin_unlock(&lock);
>  }
>  
> +void report_prefix_popn(int n)
> +{
> +	while (n--)
> +		report_prefix_pop();
> +}
> +
> +void report_prefix_clear(void)
> +{
> +	spin_lock(&lock);
> +	prefixes[0] = '\0';
> +	spin_unlock(&lock);
> +}
> +
>  static void va_report(const char *msg_fmt,
>  		bool pass, bool xfail, bool kfail, bool skip, va_list va)
>  {
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

