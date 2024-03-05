From: Carlos Maiolino <cem@kernel.org>
Date: Tue, 5 Mar 2024 09:05:31 +0100
Subject: [PATCH 4/6] riscv: Enable gen_report() to print the wrong value
 in case of test failure
In-Reply-To: <20240301-6bcfc030d90fa055b8192386@orel>
References: <20240229124246.309304-1-cem@kernel.org>
 <20240229124246.309304-5-cem@kernel.org>
 <wknHl_qFyCT3szEX-jsszal17_EQegdBjYN7Ea5JbXix6Yz0QPxNm6lBqPCIIeUbWVxnlogmf_Wkf3jevBroiQ==@protonmail.internalid>
 <20240301-6bcfc030d90fa055b8192386@orel>
Message-ID: <iuspdeox3mmp4nzfs3xkqefttylgpfmb6gfm2ck62mxgi2sbov@iz76pufcqyfa>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> 
> We want to keep the output line consistent for both pass and fail
> in order to simplify parsing. But, since the expected value is
> variable, depending on the SBI implementation under test, it's
> probably best not to put the numbers in the pass/fail line, but as
> info. So how about
> 
>  static void gen_report(struct sbiret *ret,
>                         long expected_error, long expected_value)
>  {
>      report_info("expected (error: %ld, value: %ld), received: (error: %ld, value: %ld)",
>                  expected_error, expected_value, ret->error, ret->value);
>      report(ret->error == expected_error, "expected sbi.error");
>      report(ret->value == expected_value, "expected sbi.value");
>  }

Something just came up to my mind while implementing this.

I agree with the use of report_info() here, but I still think this could be
under a conditional to only print it when we have something different from the
expectations. I particularly don't see much value in printing the report_info if
nothing unexpected, but maybe I'm wrong?

Carlos

> 
> I've changed this function to take the error as input because negative
> tests (which we should also have) will be looking for specific errors.
> 
> Thanks,
> drew
> 
> 
> >  }
> >
> >  static void check_base(void)
> > --
> > 2.43.2
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> 
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

