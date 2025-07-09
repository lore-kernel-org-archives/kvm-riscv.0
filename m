Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B209BC83F10
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=anfprIW9N/zuETR0k9pwuYI63AqSCJl7jxNzdCRqkgI=; b=Mwj/H9Vj5pKwJFPG5OnMExiShn
	D1Z56ZdbXhprX7znEqqn3QSdGucGoFsbc+87Yzwr3WLtDREmSlT7FaggoW+EpstQfbh4tj/VSlOUh
	ibSs1qkKngfDYES8hQoPLUbifXyYR74lsA+E3wyPmfCewPqR6zhYpdqk0laRpaGavKPaV6vO6swfL
	N0fWFiDqGozdZH0LqpIeaVHgKwb2VMqO1mA9P33pJ4d7ZQR3O8CrNN0OvJE1w3xUoAtKXGkeyfewb
	KaoVyUreSGRd4sww7SGEKEvcWqRbuZNUFcniw6sR2HTdLh1sXMk9c3rYu2J/lL1h4e6gpNJ9G41Mh
	d5ahEX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjK-0000000AAP2-3Yil;
	Wed, 09 Jul 2025 22:57:34 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZclE-00000009x73-0r49
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 21:55:29 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2356ce66d7cso4944765ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752098127; x=1752702927; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbl942qlboFFMIegFraxpdF+FM9j3v0rANtDQn4ybbE=;
        b=Td5odBpaIwcjEg37wPXEDlpTpTYJbTfmatwMydZnby7Vcp6VRUdJ/k5psv8jyKf4u8
         rlGb0ApD8rAPe1U4Rdxvxx0FCaq4Q64BFWmMwAT0YfCvLhiNA/JAh8fdYAlBx/luUslX
         sqCXxB3AR8ZtQtgZEF+HVrRtvXtOKhlrD5laWDjNdAK4tbdropX0JODvwwI15ha/d9Dg
         8XT6JftGrB/FGG4INcR2PaocqF2C8J0U4rEqAIdQyOcB2wptcXW01TFl4mID/ooGWoRp
         EnvLNXg9BLPNoUtk69pCuQMn9WhjtWmd8BBHB5Xn9W/mgca9+OZl+ZdRJI1wP5QKD5P5
         hK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752098127; x=1752702927;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbl942qlboFFMIegFraxpdF+FM9j3v0rANtDQn4ybbE=;
        b=v9YSfJGxMfU3ZJnyciwzWZa8Fr9ofaxaZG8ym/7h2KbDfdH3mVaqr2OPFTpM0IVKPo
         mLwF8Kiq/c3ZUa0qtsZoPdPQYq1UklMuiIOOyzXw5m1qB7UIJNJH/+5Sv/CRKLG7v6Q4
         3ymjIWwI5d38gPpXIafEUYyJi34lIEfZuoSyzHY4JYDxkFBcJjtgpHmk5+ID/aQ486ev
         a3JJWLp66XAwyO6NcEUx/qbPtMrHHICdgKzh9+r3sxwNXbBsGalLl1hMGy1aU0acXNN2
         BGe/wetLqUUFa0cDsC1G8t07lx+xNec6bjXp/y2RRmCHpnqXNBXdL7c/xAFGX/K7P4fN
         g/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUZnxqxCsPkrL42wsSpzTgnUNJG/qfVRC1qtBQrYWJh0uj117KZ5dRN2P1GPVSGrhRuY8aiKQGxF1A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9urgGVYhGx7zCzDEpdDJSd1DNXiyr6x5mqc4qjrbJOTHfVv0P
	9JAMz6oi9vOHtBmDW06N3Jj1veXOzto7l7U0WFykfQfhKbveGHOFd3YKQBrnyMELyLG1s8dtp0I
	04izWng==
X-Google-Smtp-Source: AGHT+IF1wEjrFTfY6N7MTYPdwThi568/YkhVSNLJZftbK5IeWVpMVD+nKlM0Ig+cQGCrWJrZozYL3NOkd1E=
X-Received: from pjyd8.prod.google.com ([2002:a17:90a:dfc8:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b0f:b0:235:ea0d:ae10
 with SMTP id d9443c01a7336-23de47f8b60mr1057985ad.12.1752098126914; Wed, 09
 Jul 2025 14:55:26 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:55:25 -0700
In-Reply-To: <20250606235619.1841595-7-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-7-vipinsh@google.com>
Message-ID: <aG7lTY2ItIkfX7dm@google.com>
Subject: Re: [PATCH v2 06/15] KVM: selftests: Add a flag to print only test
 status in KVM Selftests run
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_145528_271475_35DC6303 
X-CRM114-Status: GOOD (  18.86  )
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
> Add a command line argument, --print-status, to limit content printed on
> terminal by default. When this flag is passed only print final status of
> tests i.e. passed, failed, timed out, etc.
> 
> Example:
>   python3 runner --test-dirs tests  --print-status
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/runner/__main__.py    | 5 +++++
>  tools/testing/selftests/kvm/runner/test_runner.py | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index 48d7ce00a097..3f11a20e76a9 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -59,6 +59,11 @@ def cli():
>                          type=int,
>                          help="Maximum number of tests that can be run concurrently. (Default: 1)")
>  
> +    parser.add_argument("--print-status",
> +                        action="store_true",
> +                        default=False,
> +                        help="Print only test's status and avoid printing stdout and stderr of the tests")
> +
>      return parser.parse_args()
>  
>  
> diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
> index 0a6e5e0ca0f5..474408fcab51 100644
> --- a/tools/testing/selftests/kvm/runner/test_runner.py
> +++ b/tools/testing/selftests/kvm/runner/test_runner.py
> @@ -17,6 +17,7 @@ class TestRunner:
>          self.tests = []
>          self.output_dir = args.output
>          self.jobs = args.jobs
> +        self.print_status = args.print_status
>  
>          for test_file in test_files:
>              self.tests.append(Selftest(test_file, args.executable,
> @@ -29,7 +30,7 @@ class TestRunner:
>      def _log_result(self, test_result):
>          logger.log(test_result.status,
>                     f"[{test_result.status}] {test_result.test_path}")
> -        if (self.output_dir is None):
> +        if (self.output_dir is None and self.print_status is False):

This flag confused the hell out of me.  It's not at all obvious that it *reduces*
output, and that it overrides all the other --print-xxx options.  I see no reason
to provide this.  I suspect most users will want curated console information, or
none at all.

If we keep this, the runner should explicitly disallow --print-status with any
other --print-xxx option.

>              logger.info("************** STDOUT BEGIN **************")
>              logger.info(test_result.stdout)
>              logger.info("************** STDOUT END **************")
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
