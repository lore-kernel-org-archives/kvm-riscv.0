From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue, 27 Aug 2024 18:49:56 +0200
Subject: [kvm-unit-tests PATCH v2 1/4] lib/report: Add helper methods to
 clear multiple prefixes
In-Reply-To: <20240825170824.107467-2-jamestiotio@gmail.com>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
 <20240825170824.107467-2-jamestiotio@gmail.com>
Message-ID: <20240827-bd7768e88d0b307a8923cfb6@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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

I think I suggested this implementation, but thinking about it some more
this won't work well with other cpus pushing/popping simultaneously. We
need something like

 static void __report_prefix_pop(void)
 {
        char *p, *q;

        if (!*prefixes)
                return;

        for (p = prefixes, q = strstr(p, PREFIX_DELIMITER) + 2;
                        *q;
                        p = q, q = strstr(p, PREFIX_DELIMITER) + 2)
                ;
        *p = '\0';
 }

 void report_prefix_pop(void)
 {
        spin_lock(&lock);
	__report_prefix_pop();
        spin_unlock(&lock);
 }

 void report_prefix_popn(int n)
 {
        spin_lock(&lock);
        while (n--)
	        __report_prefix_pop();
        spin_unlock(&lock);
 }

> +}
> +
> +void report_prefix_clear(void)
> +{
> +	spin_lock(&lock);
> +	prefixes[0] = '\0';
> +	spin_unlock(&lock);
> +}

I'm also second guessing the utility of this one. We'd probably almost
never want to do this since most tests are designed with a

  main()
  {
     report_prefix_push("mytest");
     subtest1();
     subtest2();
     ...
     report_prefix_pop();
     ...
  }

type pattern and we wouldn't want to lose that "mytest" prefix when some
subtest calls clear. Let's just drop report_prefix_clear() for now.

> +
>  static void va_report(const char *msg_fmt,
>  		bool pass, bool xfail, bool kfail, bool skip, va_list va)
>  {
> -- 
> 2.43.0
>

Thanks,
drew

