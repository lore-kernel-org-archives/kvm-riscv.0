Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F373CC021BE
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngG/M93pM+JjzPajLNYWLnDqnBUQQvwFRnTYpwVY+uI=; b=HXgY64DMdjf1oJ
	4nT+UGV8lFAJqTauUPR10tkfuz80/z4ysJFqv3jHC6jEjSYFs1LuJo7K5/VUOOF9P1dclFQ5wMxU9
	XnuPYXOohYORwLj8kmL5blWDF83DkSnQZN3+msNZdqE3Ww825Q34F31F82jHuyafjuhYCEUgLTzt1
	+2KnP7qiLiDao/U5B+fCuO1KwwjXLeF1GoG1EvB7omKMjMqosL/pe+6mT91Bb8qPVQuHkwEAErXtg
	Ylctts1g8WL6gjQ+TQiQ5whFz3KNqngpuDE1Rk59XmTk+puh4U9qCenDHC7oWAfC3J4JABGaoNOE8
	J68Xw21RYaN234PaqLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZ4D-00000006fNx-2QG4;
	Thu, 27 Feb 2025 08:16:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZ4A-00000006fMl-2BUn
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:16:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4399d14334aso5917435e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Feb 2025 00:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740644181; x=1741248981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNuCHwKGXQWAf4mt8sNekn31y9wTAPf53BsIAPyDFlg=;
        b=pjzH44y7uDU6RuNg2KtJXspJ/Po+JWzfilS/SgqqyHMBa+k4bD/r8ja/IzHsnN4zSz
         Ghe3q8bVU0EczKRgkhWJziXFJ6+rR+9NwaV7A6CZ2olHshqNntx/HWWehxZasGw9l/oW
         6gsdpUJPVZpCZ2tKDrz1EFws5omwMftsaAjEhuGof2RvSstmwaCFMLAnQRuVYoZlHx/q
         ATHv2Rv3Um3o51eeK6n1UooMY+JqLVqbJymPe1vQoEC996lQGNIW5JjMWDpTlNNzMcqT
         TF0kBJs2YnZFb4gdwoNoH3/6kkpq9YiYHn6vWlS6NfJNB6fPBi8LfWtg2CibzpwW2QDq
         FuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740644181; x=1741248981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNuCHwKGXQWAf4mt8sNekn31y9wTAPf53BsIAPyDFlg=;
        b=Y3/VkCyS4O182Xxy8pqCGn9+27xlsaJ2c87ifyKgaodrW/VmS03Bmp+S4g2Q120dnY
         T2xUS3nfy0ym/xc7CE9y7hsmpjJLBKG2YkOLqilgLBSyVD+EK5OTrTFZvz+g8FO5BuOF
         DFpcf8UCT5BQAu3TUGtt5tmgb4RO425t+O00lHC39anXvv4WtGGr2eSiU8RnG4OOeI66
         V8V2k3xj2C7s/UzKctnetwI+KNuYYqZwWisJ/R2xZaLXhc0sUbdlN4gOa+8OMjNEkph6
         zsNZ0NbUjfwE6KYi049wSGYGhq+BxPalCdHT/frljNmgG2pcVB459/u+7Krh+WDgQEKD
         AaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXvTttlEgumHKggc7B5fBpn5jlicAddiEyPbtBB4M/39sbjDCWPrElIQSbPESUfWTfnm5O12903wQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdVcwc6qfFSvxn0DFOKfNI7axlyIazX+hDrzVB/ONw2dsDAydC
	c0l7bMvxv/Gh3azzIb2Fb0c1/WD2DL39OEpoXE0CyXdye9YYi4hVvspuh7W66Ng=
X-Gm-Gg: ASbGnctSFXAuR/fRdbCyEMLnRFiV5jloZ62xQ5pfjKIJGhorQ3gO6Lhkb9HPzN1VJY8
	UteAJLP6hgVp8BKbmoEibxINV2WD7ISwTWAjaPmLmXCtKgj+mnlnMPg/CMUxw5puqqiGTgoTNuR
	3PYh1Yy7Tems/5HRIhbD7g0pjEYNvsM/jDsCfLO8IfJwAw0J9WdxJOiGEQ2eYBsNR48WeTNkdG5
	9FmAu0Z2l5BBvaXF+i7kiT4UVvKychYW660VP30LX6RqSzOOR1rBihuhAl3s76RuBEAxXvRlJRd
	7HuIcpYJhj7RjQ==
X-Google-Smtp-Source: AGHT+IGtkCGpzCQFwmHGo5aZlDGSlBp1jN55CoUYkN1FZsHypqajvqpmjpcHqYvMPO3dlRrienJsOQ==
X-Received: by 2002:a05:600c:3588:b0:439:6304:e28a with SMTP id 5b1f17b1804b1-43ab8f6fe56mr58126325e9.0.1740644180644;
        Thu, 27 Feb 2025 00:16:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::8cf0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm1260460f8f.12.2025.02.27.00.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 00:16:20 -0800 (PST)
Date: Thu, 27 Feb 2025 09:16:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Allow number of interrupts to
 be configurable
Message-ID: <20250227-f7b303813dab128b5060b0c3@orel>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
 <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226-kvm_pmu_improve-v1-4-74c058c2bf6d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_001622_559586_B5E19E0B 
X-CRM114-Status: GOOD (  27.88  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2025 at 12:25:06PM -0800, Atish Patra wrote:
> It is helpful to vary the number of the LCOFI interrupts generated
> by the overflow test. Allow additional argument for overflow test
> to accommodate that. It can be easily cross-validated with
> /proc/interrupts output in the host.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 36 ++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 533b76d0de82..7c273a1adb17 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -39,8 +39,10 @@ static bool illegal_handler_invoked;
>  #define SBI_PMU_TEST_SNAPSHOT	BIT(2)
>  #define SBI_PMU_TEST_OVERFLOW	BIT(3)
>  
> +#define SBI_PMU_OVERFLOW_IRQNUM_DEFAULT 5
>  struct test_args {
>  	int disabled_tests;
> +	int overflow_irqnum;
>  };
>  
>  static struct test_args targs;
> @@ -478,7 +480,7 @@ static void test_pmu_events_snaphost(void)
>  
>  static void test_pmu_events_overflow(void)
>  {
> -	int num_counters = 0;
> +	int num_counters = 0, i = 0;
>  
>  	/* Verify presence of SBI PMU and minimum requrired SBI version */
>  	verify_sbi_requirement_assert();
> @@ -495,11 +497,15 @@ static void test_pmu_events_overflow(void)
>  	 * Qemu supports overflow for cycle/instruction.
>  	 * This test may fail on any platform that do not support overflow for these two events.
>  	 */
> -	test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
> -	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 1);
> +	for (i = 0; i < targs.overflow_irqnum; i++)
> +		test_pmu_event_overflow(SBI_PMU_HW_CPU_CYCLES);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
> +
> +	vcpu_shared_irq_count = 0;
>  
> -	test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
> -	GUEST_ASSERT_EQ(vcpu_shared_irq_count, 2);
> +	for (i = 0; i < targs.overflow_irqnum; i++)
> +		test_pmu_event_overflow(SBI_PMU_HW_INSTRUCTIONS);
> +	GUEST_ASSERT_EQ(vcpu_shared_irq_count, targs.overflow_irqnum);
>  
>  	GUEST_DONE();
>  }
> @@ -621,8 +627,11 @@ static void test_vm_events_overflow(void *guest_code)
>  
>  static void test_print_help(char *name)
>  {
> -	pr_info("Usage: %s [-h] [-t <test name>]\n", name);
> +	pr_info("Usage: %s [-h] [-t <test name>] [-n <number of LCOFI interrupt for overflow test>]\n",
> +		name);
>  	pr_info("\t-t: Test to run (default all). Available tests are 'basic', 'events', 'snapshot', 'overflow'\n");
> +	pr_info("\t-n: Number of LCOFI interrupt to trigger for each event in overflow test (default: %d)\n",
> +		SBI_PMU_OVERFLOW_IRQNUM_DEFAULT);
>  	pr_info("\t-h: print this help screen\n");
>  }
>  
> @@ -631,6 +640,8 @@ static bool parse_args(int argc, char *argv[])
>  	int opt;
>  	int temp_disabled_tests = SBI_PMU_TEST_BASIC | SBI_PMU_TEST_EVENTS | SBI_PMU_TEST_SNAPSHOT |
>  				  SBI_PMU_TEST_OVERFLOW;
> +	int overflow_interrupts = -1;

Initializing to -1 made me think that '-n 0' would be valid and a way to
disable the overflow test, but...

> +
>  	while ((opt = getopt(argc, argv, "h:t:n:")) != -1) {
>  		switch (opt) {
>  		case 't':
> @@ -646,12 +657,24 @@ static bool parse_args(int argc, char *argv[])
>  				goto done;
>  			targs.disabled_tests = temp_disabled_tests;
>  			break;
> +		case 'n':
> +			overflow_interrupts = atoi_positive("Number of LCOFI", optarg);

...here we use atoi_positive() and...

> +			break;
>  		case 'h':
>  		default:
>  			goto done;
>  		}
>  	}
>  
> +	if (overflow_interrupts > 0) {

...here we only change from the default of 5 for nonzero.

Should we allow '-n 0'? Otherwise overflow_interrupts can be initialized
to zero (not that it matters).

> +		if (targs.disabled_tests & SBI_PMU_TEST_OVERFLOW) {
> +			pr_info("-n option is only available for overflow test\n");
> +			goto done;
> +		} else {
> +			targs.overflow_irqnum = overflow_interrupts;
> +		}
> +	}
> +
>  	return true;
>  done:
>  	test_print_help(argv[0]);
> @@ -661,6 +684,7 @@ static bool parse_args(int argc, char *argv[])
>  int main(int argc, char *argv[])
>  {
>  	targs.disabled_tests = 0;
> +	targs.overflow_irqnum = SBI_PMU_OVERFLOW_IRQNUM_DEFAULT;
>  
>  	if (!parse_args(argc, argv))
>  		exit(KSFT_SKIP);
> 
> -- 
> 2.43.0
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
