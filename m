Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE950C83F19
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/ujoNzG+Qk8INswjW4soGJP9DED0YQolDPVV1Popk1c=; b=YhK+4pk0UvPQgziuvMNK4L6HEw
	ye3O5H1nNr6N5mQyM/OD0eMCnYkHGODks6WJ6nswdWAx6MnWzform730veAfgMAe+m48AP4pYuJUR
	MvLPiUTZn2mNLg5tmaeYHqvuEPCVUb1G35QZZ2/kC/oUcre6Nle3e9QY7Vz9Xs0MfrGp1sAbxW/MM
	ORyboL1GbAvVZorag0XEgfS9yJLwt4O1mmJ7SRCTdpzir3urYWRFqe7zHqXVuLb+5ujORkuj32ail
	XJZ7nC/kZOcMPzIrpCw9hSqZXq5wVoKx7tUN6i3GVPCBbKzKOLP1viCMcZa4LVvmZQbjAFhCkPo1p
	M05zfU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjW-0000000AAp6-2WI9;
	Wed, 09 Jul 2025 22:57:46 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcr4-0000000A060-2bqj
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 22:01:31 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so633982a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752098489; x=1752703289; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPkxg71a8xKMOk7gRt6YiWOPIe8HfaUrT3StylJgAHI=;
        b=e6z03tjRxnQMX2yUz0PrmS+TQz/2yCeWcCktMEzSXdgzN3hIZRByJl69Bfm/3qM2bw
         NIDb1pJ3wxYUMQ5VM4A69DhL0DwLHFpxuxUMThQXbZ4UBZj2F/1oyCcbtZMLi1qPwsvC
         C/n4Ex2619rNkV2wtkPd+NsZo9BJbYnhJSTJmSXpvgf8G4+01ErtiEN74ih9B0ksevxf
         6BsW/LpbVc0MuUY5uaSPa4whlX7nxcE5zgrOEjxyhkTZWg0ZBCKk6OPmW5JdNKjk9Lb5
         DSyshwINKvJK513+Q3gAY8xn+DN7mCS5SD/1ywj7xR8gN9mNgM5u6Gbl48EhUYIvEqm/
         bMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098489; x=1752703289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPkxg71a8xKMOk7gRt6YiWOPIe8HfaUrT3StylJgAHI=;
        b=GFGeRXaXpO7037PahjQcZw3Zily1QU6b6G5MeTwRZdpcogzSl4ZaIxdGi6RLnHq++/
         85CPH7RirhAQfmV1jgJ8DOGsnXXWVbLrLuqk6KkTmGFOW95K7B5GdMu38X2HIrGhVFCn
         ys9UeWCnS0Syoxx+7ZIeIXLFvNWg6nlHDJ88LryqKB1lQckYF3+8fZ/6JD+PDV5irpow
         h7DDQLp0BOXSHfL+5R5B8+O6xftS8MwMyWMl7uw3ymRZVgmTdPdemUJZRBn992Il1+/h
         TwB4QNv+UsQJ+GMrKu5MUjbUKNimz6534xLLjI8nm8pw3W7z+5QDrfKOp80eV6a/oALd
         9ySg==
X-Forwarded-Encrypted: i=1; AJvYcCW3QQ6/wTJni5MECs9A15ppdFS0Oq830NIU5Pr28+1aQBdBb46KXx3RhbxKtKiD+tJFo+Tj5l3AULc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzlY1UWy1cf96N2sa4jOk5QUC+6Cpww3TFvd+m9nUcPA7CXgAA8
	WfrYCfNoynHFunFFoOiO7GSml6XoHuRtxWYreZoe0p2Te5a7mPC4x4qLaJb4RvBHzjYq73kinAQ
	tbHguww==
X-Google-Smtp-Source: AGHT+IGv5Auh5afur7rrmDtcmRu/ac16McioXeHVJV7IWM1fJ+YSaOB7uGrq5SXWMiQzxRu0kWJqhfgibQ4=
X-Received: from pjblw1.prod.google.com ([2002:a17:90b:1801:b0:31c:2fe4:33b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2b43:b0:312:e279:9ccf
 with SMTP id 98e67ed59e1d1-31c3ef100acmr359390a91.5.1752098489536; Wed, 09
 Jul 2025 15:01:29 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:01:28 -0700
In-Reply-To: <20250606235619.1841595-8-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-8-vipinsh@google.com>
Message-ID: <aG7muHNldvv8fRyH@google.com>
Subject: Re: [PATCH v2 07/15] KVM: selftests: Add various print flags to KVM
 Selftest Runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_150130_663904_2E965531 
X-CRM114-Status: GOOD (  14.90  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> Add various print flags to selectively print outputs on terminal based
> on test execution status (passed, failed, timed out, skipped, no run).
> 
> Provide further options to print only particular execution status, like
> print only status of failed tests.
> 
> Example: To print status, stdout and stderr for failed tests and only
> print status of passed test:
> 
>    python3 runner --test-dirs tests  --print-failed \
>    --print-passed-status
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  .../testing/selftests/kvm/runner/__main__.py  | 114 ++++++++++++++++++
>  .../selftests/kvm/runner/test_runner.py       |  10 +-
>  2 files changed, 123 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index 3f11a20e76a9..4406d8e4847a 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -64,9 +64,115 @@ def cli():
>                          default=False,
>                          help="Print only test's status and avoid printing stdout and stderr of the tests")
>  
> +    parser.add_argument("--print-passed",
> +                        action="store_true",
> +                        default=False,
> +                        help="Print passed test's stdout, stderr and status."
> +                        )
> +
> +    parser.add_argument("--print-passed-status",
> +                        action="store_true",
> +                        default=False,
> +                        help="Print only passed test's status."
> +                        )

Waaay too many booleans :-)

And they don't provide the right granularity.  E.g. I don't want stdout for FAILED,
I just want stderr for the assert.

After some fiddling, I came up with this:

    parser.add_argument("--print-passed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="blah"
                        )

    parser.add_argument("--print-failed", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Full = print each test's stdout, stderr and status; status = only status."
                        )

    parser.add_argument("--print-skipped", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print skipped test's stdout, stderr and status."
                        )

    parser.add_argument("--print-timed-out", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print timed out test's stdout, stderr and status."
                        )

    parser.add_argument("--print-no-run", default="full", const="full", nargs='?', choices=["off", "full", "stderr", "stdout", "status"],
                        help="Print stdout, stderr and status for tests which didn't run."
                        )

The const+nargs magic makes a bare option equivalent to "full", e.g. --print-timed-out
and --print-timed-out=full are the same.  That gives the user complete control
over the output, with _less_ code in the runner.  E.g. to print stdout and/or stderr:

        print_level = self.print_stds.get(test_result.status);
        if (print_level == "full" or print_level == "stdout"):
            logger.info("*** stdout ***\n" + test_result.stdout)

        if (print_level == "full" or print_level == "stderr"):
            logger.info("*** stderr ***\n" + test_result.stderr)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
