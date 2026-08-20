Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D7C5DF87
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 23:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzZp2gWr5C7ScaZ5S7KW/8zvTWa3V+9QG7aL3PtHhcg=; b=j+3E7DNwAFeYfb
	dORY1fe4wOiUjZnQbMLYJuId3b1Q6O6BoT72Ad4uCQaDbnGuGD2GtgKT3JR0+9hQ4SJjfgmm/V9mN
	ZBtxqTpYdYfLmWW8dqY3a6lxv8QZKAlOFIrR8YN5QL3kuGxYZsdYXP31HZPwT4lxBUxqE3kxulNfs
	dnh4EDvcpo6uK3EJOF0gLTIRTWlS8HsxNIFrbVmeqgt/H0Oof6K2VUKYP71TZACzA+bx4Ixl+vvLT
	9cIOSDtTz/da37gacvZocJmKaU7JX7597sodocJTp/UNbAGbJJHcsy4d2Q2JxVZmHwU8kBCK0xPPP
	5WQw8ekDfxhIkqlPLnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCHh-0000000CM6q-18wQ;
	Thu, 20 Aug 2026 23:34:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCHe-0000000CM6S-0toz
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 23:34:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cede6375caso40735ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Aug 2026 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268893; x=1787873693; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfLGikGnd4S9+6yfPqbmN/NLYjJGhV8nPuxpkvVhdQ0=;
        b=h+w4nb+WMwZpzkn13pFSguuT9XBuMr9tiJ29xtXAlYKy57fBIhJ/Z1OlTGnOFGhKpE
         rUdb6BHub67vS3KYOHblCIJS9aDF2c7F7ccm+4uJ+gk1uQ50nH8Im4VJTj3+XXjTtGlx
         bIxMeZvLF6anlltTapaquO+Gt0djfIH3qZH78ZkhsV8ppqQ9unH97u222T/7MWn6PPLJ
         cfjgKo3EUsQVX76WllIne9bpXSAEU0STJZx65KNCSYSsOL+h16tLOV2wTRszs5SY7dpE
         +HmbXX6gH05O79lKHq82DEa3USgE9f7fuTpxHlRzdSklaoAzo+gtheTxwG8GbMZ1CXvV
         51oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268893; x=1787873693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfLGikGnd4S9+6yfPqbmN/NLYjJGhV8nPuxpkvVhdQ0=;
        b=gl5u7GUHRC+61ey52CL+aydO2Mhb7FgbneQLylG9iBlXXc2PTYjyw80KUmXY8GY+jT
         NEgyvCwOGIoGKJEshVb2EyvR7W0J/g0WEGVLlYS/EmsczwOogQ/ZzYhMxUx4d5g2mG6Z
         Lt10D2v2oNh/z6QpZF4S99lwqnjqvFF1Mrr3EKhbuQ99fR8pJ0qDNVy8WyQipCaM5WA5
         iDOd0iXNEVmGstagFHG++LMhUmQ6Mjg75dQgNrDEXbZaDXhxxllpFrhNvdawAN+mL1kz
         qiyaoc/GHuW4aSwNihuq/wuK411Im2lZYaEX6Y2q/h6tPmeeapOMiEeMX8AexoeF5Tna
         CePQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJG/uBCMSMWs12ZGUKgOfIsIGj823DaOwN+BsM/IveN/UdTAW3N2+d4fTThHv0KUdc1Le5eT621uI=@lists.infradead.org
X-Gm-Message-State: AFuF++kdpjX4PJB0UDdbyP/TFtJa+Ki0SyQ89v/NzgUBKkHL/Yz/w8xF
	cgfBNca9kGcgVhVl4/iQxKZB6ZyeNaB/srmYrXCpoEfT3wPv3SXO/Ae2yy5nTLswvQ==
X-Gm-Gg: AR+sD12dkneZcYjUQfx5oNVX6Bz9FYpvxdD6Iac1drn+wX812RfrQPNI/qhAqY4Y/lS
	D2RdtIe4T6fXiEuoENfkgWxhKLiQXbYSRwDNByNQhEHoiomtvK15H8jeSRELYGW620S9WlcWk12
	hnJ7kyJWVMrSyTrV8VHdpkf7hr4fhbCdYUEC+waIGs6LrjogAF9PFQRdNAO4c8FTYx5SY4RBPGw
	RdTUsKWiQXOIi+EqDuTCP6GE43tihWNWbdr42vPiUSgOCpeTQSSxLrL8k0tudALpSKfajSxwJBA
	0Ep77B38kuDSC6TYYdVKsKI7CSsRPhgXK1NzvQD77p6QKNJV6EPv/EZQPWU5ccOC2EXsxWm/Uup
	sL8CiHRAUmaH0H4j86xNYhl18tBBVvUjw+1GjDgEk+eksechybbASx/7fYYEwFQPYWXuBUuETB4
	p1dpKXzIFHDQQovtxqZyyu9qmRojSu/Z953SX/WEUedEOt+kYW69Cm/dc4qOoxW6cCyhHvLn4Za
	ranm+xD2rcUEmilF20hgEsv0EX1HUfen5uH
X-Received: by 2002:a17:903:26c5:b0:2d5:db3d:1a45 with SMTP id d9443c01a7336-2d64b497c99mr3853495ad.18.1787268892710;
        Thu, 20 Aug 2026 16:34:52 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4b82e5csm644924a91.16.2026.08.20.16.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 16:34:51 -0700 (PDT)
Date: Thu, 20 Aug 2026 16:34:47 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: t@google.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
Subject: Re: [PATCH v4 3/9] KVM: selftests: Add timeout option in selftests
 runner
Message-ID: <20260820233109.GD618052.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com>
 <20260331194202.1722082-4-vipinsh@google.com>
 <ampW2iHhp6EA21I5@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ampW2iHhp6EA21I5@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_163454_270670_624676A0 
X-CRM114-Status: GOOD (  23.79  )
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

On Wed, Jul 29, 2026 at 12:39:06PM -0700, Sean Christopherson wrote:
> On Tue, Mar 31, 2026, Vipin Sharma wrote:
> > Add a command line argument in KVM selftest runner to limit amount of
> > time (seconds) given to a test for execution. Kill the test if it
> > exceeds the given timeout. Define a new SelftestStatus.TIMED_OUT to
> > denote a selftest final result. Add terminal color for status messages
> > of timed out tests.
> > 
> > Set the default value of 120 seconds for all tests.
> > 
> > Signed-off-by: Vipin Sharma <vipinsh@google.com>
> > ---
> >  .../testing/selftests/kvm/runner/__main__.py  |  9 +++++-
> >  .../testing/selftests/kvm/runner/selftest.py  | 29 ++++++++++++-------
> >  .../selftests/kvm/runner/test_runner.py       |  2 +-
> >  3 files changed, 27 insertions(+), 13 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> > index 9b6c78e69c64..82c543d11c34 100644
> > --- a/tools/testing/selftests/kvm/runner/__main__.py
> > +++ b/tools/testing/selftests/kvm/runner/__main__.py
> > @@ -37,6 +37,11 @@ def cli():
> >                          default=".",
> >                          help="Finds the test executables in the given path. Default is the current directory.")
> >  
> > +    parser.add_argument("--timeout",
> > +                        default=120,
> > +                        type=int,
> > +                        help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
> > +
> >      return parser.parse_args()
> >  
> >  
> > @@ -44,6 +49,7 @@ def setup_logging():
> >      class TerminalColorFormatter(logging.Formatter):
> >          reset = "\033[0m"
> >          red_bold = "\033[31;1m"
> > +        red = "\033[31;1m"
> >          green = "\033[32m"
> >          yellow = "\033[33m"
> >          blue = "\033[34m"
> > @@ -52,7 +58,8 @@ def setup_logging():
> >              SelftestStatus.PASSED: green,
> >              SelftestStatus.NO_RUN: blue,
> >              SelftestStatus.SKIPPED: yellow,
> > -            SelftestStatus.FAILED: red_bold
> > +            SelftestStatus.FAILED: red_bold,
> > +            SelftestStatus.TIMED_OUT: red
> 
> Responding here because it's easier to see...
> 
> In my experience, uniquely identifying segfaults can be super helpful, e.g. (with
> the stderr/stdout changes too).

Sounds good to me, patch below looks fine.

> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index 13f4cbea1fa7..93ce46e25caf 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -122,6 +122,7 @@ def setup_logging(args):
>              SelftestStatus.NO_RUN: blue,
>              SelftestStatus.SKIPPED: yellow,
>              SelftestStatus.FAILED: red_bold,
> +            SelftestStatus.SEGFAULT: red_bold,
>              SelftestStatus.TIMED_OUT: red
>          }
>  
> diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
> index 76c3e6d463ee..9ccdeef62a3e 100644
> --- a/tools/testing/selftests/kvm/runner/selftest.py
> +++ b/tools/testing/selftests/kvm/runner/selftest.py
> @@ -18,7 +18,8 @@ class SelftestStatus(enum.IntEnum):
>      NO_RUN = 22
>      SKIPPED = 23
>      FAILED = 24
> -    TIMED_OUT = 25
> +    SEGFAULT = 25
> +    TIMED_OUT = 26
>  
>      def __str__(self):
>          return str.__str__(self.name)
> @@ -63,6 +64,8 @@ class Selftest:
>                  self.status = SelftestStatus.PASSED
>              elif proc.returncode == 4:
>                  self.status = SelftestStatus.SKIPPED
> +            elif proc.returncode == 139:
> +                self.state = SelftestStatus.SEGFAULT
>              else:
>                  self.status = SelftestStatus.FAILED
>          except subprocess.TimeoutExpired as e:
> diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
> index 66a3c3711a8a..f06965c68520 100644
> --- a/tools/testing/selftests/kvm/runner/test_runner.py
> +++ b/tools/testing/selftests/kvm/runner/test_runner.py
> @@ -21,6 +21,7 @@ class TestRunner:
>          self.print_stds = {
>              SelftestStatus.PASSED: args.print_passed,
>              SelftestStatus.FAILED: args.print_failed,
> +            SelftestStatus.SEGFAULT: args.print_failed,
>              SelftestStatus.SKIPPED: args.print_skipped,
>              SelftestStatus.TIMED_OUT: args.print_timed_out,
>              SelftestStatus.NO_RUN: args.print_no_run
> @@ -38,6 +39,7 @@ class TestRunner:
>          print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
>                  f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
>                  f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
> +                f"\033[31;1m Segfaults: {self.status[SelftestStatus.SEGFAULT]}" \
>                  f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
>                  f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
>                  f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m",
> @@ -47,10 +49,14 @@ class TestRunner:
>          print_level = self.print_stds.get(test_result.status, "full")
>  
>          print("\033[2K", end="\r", flush=True)
> -        if (print_level == "full" or print_level == "stdout"):
> +        if (print_level == "full"):
>              logger.info("*** stdout ***\n" + test_result.stdout)
> -        if (print_level == "full" or print_level == "stderr"):
>              logger.info("*** stderr ***\n" + test_result.stderr)
> +        elif (print_level == "stdout"):
> +            logger.info(test_result.stdout)
> +        elif (print_level == "stderr"):
> +            logger.info(test_result.stderr)
> +
>          if (print_level != "off"):
>              logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
