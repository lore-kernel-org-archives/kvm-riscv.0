From: Marc Zyngier <maz@kernel.org>
Date: Tue, 19 Dec 2023 18:22:44 +0000
Subject: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us in arch timer test
In-Reply-To: <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
	<0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
Message-ID: <8734vy832j.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 09:31:20 +0000,
Haibo Xu <haibo1.xu@intel.com> wrote:
> > @@ -216,6 +221,9 @@ static bool parse_args(int argc, char *argv[])
>  		case 'm':
>  			test_args.migration_freq_ms = atoi_non_negative("Frequency", optarg);
>  			break;
> +		case 'e':
> +			test_args.timer_err_margin_us = atoi_non_negative("Error Margin", optarg);
> +			break;

So your error margin is always unsigned...

>  		case 'o':
>  			test_args.counter_offset = strtol(optarg, NULL, 0);
>  			test_args.reserved = 0;
> diff --git a/tools/testing/selftests/kvm/include/timer_test.h b/tools/testing/selftests/kvm/include/timer_test.h
> index 968257b893a7..b1d405e7157d 100644
> --- a/tools/testing/selftests/kvm/include/timer_test.h
> +++ b/tools/testing/selftests/kvm/include/timer_test.h
> @@ -22,6 +22,7 @@ struct test_args {
>  	int nr_iter;
>  	int timer_period_ms;
>  	int migration_freq_ms;
> +	int timer_err_margin_us;

... except that you are storing it as a signed value. Some consistency
wouldn't hurt, really, and would avoid issues when passing large
values.

	M.

-- 
Without deviation from the norm, progress is not possible.

