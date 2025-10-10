Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B886CAC5BB
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MLMYDE96ytYpKM7hCwi9wxbkWpg/iLEruPxLrcUew08=; b=rJUqVAQLuh2Ft6m17mhm1O8eXq
	Avq8+DT6XcfLVZWEkXXZTf3hD8QGFpxYx4soNtuY6+J/aPUJx+xZFKgXiFH6Xd5tpCi4qmS8MEV/2
	H4oVB2ZrhOS/on1MUaXU/+sadXVZUHurTOpnKP/JTb1/E5+2NHYYuRFtfXD/Oxi9xkQ+WOXU0lFPM
	EycaJPCTnzQYXpQ3ZS2bX3QhXBSJwT6t/lAB14zbA6CcyZ5FKanOXY8YGirYZuAOroXwylXSBfufF
	6mb29ou7DSMQtDczdsKXhn0wtvDOPgcNlSV1sNhToMA+ZPutieGS+F7wugt75UOl3tFpVv7RbZmBS
	WhXLkV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79tk-00000008DIh-3FVx;
	Fri, 10 Oct 2025 09:58:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v79th-00000008DI1-2uYO
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 09:58:50 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3d9bf9e1so11133835e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Oct 2025 02:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760090327; x=1760695127; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj/uK/0xnB0ZmAgqvqZKJ167+Wzz4WpLCK/iSob8rPE=;
        b=bLSwHALvE0kufinfSEqHxBfTprNYdUOSyiED/NAl2GTNDgPBlzO3BA+EG531bsR0v1
         CCGBKh79R4xjMt0NsfXvMl3vUN77i9yXshSHW4iflf3RNK+sOPjBg2eSmvFoO3gmUy5w
         3MXGiUuFZCLLuRl+KP6d52IglZqiXwCch+zn8Z9sNcZgd6OOMsw8AZ0q640HUiYeScHE
         B9hniqfUFZE7FJOk0ZPUFMmwFTiaHNgQjVHV7+RVg1KixlfYIboaWAJZmRh2/9AyomEt
         XuwVfjY9DvP2yuOPRsjDy3izWPTvO8xUaYuXgcSy3IbKvu0bZNVBIZsHlv0ooiPE9auO
         WfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760090327; x=1760695127;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj/uK/0xnB0ZmAgqvqZKJ167+Wzz4WpLCK/iSob8rPE=;
        b=FcUYuCH/48ToUU2MUTGCmMYU+CUVRmTkCIkHIHPG3ooCMXbCXCdEw6pXSGeYmO84Ua
         1EtQvZiPsxeLwCEcqitggsdzcBg52v+9nVrM3o2el49S0jqezHnt3t8OMdxqyar25rUv
         ORtJQf3vw+nV7yD+4PhLx6YOQo2fy5ghCExevZqIIw6wibtqZgYINqUwrbG00VRlRjFF
         Li/yWh0BWQVr9MgZ4O20XLIHEC70RRYZVxjUO+D7UU7IJT0IqBWEcqHb1puqjvUMb+AY
         7Y4Rh3RJ9Uj553hllrFcfN4hIAiyLbl8/3LelruRoi7hI1GW63Eq8AJhLqjrylgDrsdb
         whlg==
X-Forwarded-Encrypted: i=1; AJvYcCU7QQG0LFyER9gPum61R65VaRsRF1AFhFbxYY658ns5esTAR3B4q7ykxWiUDX6+2o4OILK7nL8NLgE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP5Fq1uCCQeL2eIj6iQT05qVOwqChBGsnwDsconQaGsBA3JOzo
	0tpa8UWIvyiCqYqbRlg+8eAzdWvqv01qA8zHSGuUJ+HE84f93RvO7bCS2nod+P5YPwDyiEyVJ7B
	EFrFNEeM6U4MdVA==
X-Google-Smtp-Source: AGHT+IE9u+S1m4RvSQpcC4dhxfuWaCPOQKXUOfLx4fze56fNXcannsh6o7Uhc8MhG1M6iartSBP/RZWrRlO7LA==
X-Received: from wmco8.prod.google.com ([2002:a05:600c:a308:b0:45f:28be:a3aa])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c5:b0:46e:4ac4:b7b8 with SMTP id 5b1f17b1804b1-46fa9b05361mr68861915e9.25.1760090327657;
 Fri, 10 Oct 2025 02:58:47 -0700 (PDT)
Date: Fri, 10 Oct 2025 09:58:46 +0000
In-Reply-To: <20250930163635.4035866-10-vipinsh@google.com>
Mime-Version: 1.0
References: <20250930163635.4035866-1-vipinsh@google.com> <20250930163635.4035866-10-vipinsh@google.com>
X-Mailer: aerc 0.21.0
Message-ID: <DDEJY5ON407O.2O7CMOY9311NV@google.com>
Subject: Re: [PATCH v3 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
From: Brendan Jackman <jackmanb@google.com>
To: Vipin Sharma <vipinsh@google.com>, <kvm@vger.kernel.org>, <kvmarm@lists.linux.dev>, 
	<kvm-riscv@lists.infradead.org>
Cc: <seanjc@google.com>, <pbonzini@redhat.com>, <borntraeger@linux.ibm.com>, 
	<frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <anup@brainfault.org>, 
	<atish.patra@linux.dev>, <zhaotianrui@loongson.cn>, <maobibo@loongson.cn>, 
	<chenhuacai@kernel.org>, <maz@kernel.org>, <oliver.upton@linux.dev>, 
	<ajones@ventanamicro.com>, 
	kvm-riscv <kvm-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_025849_781333_79B40626 
X-CRM114-Status: GOOD (  32.47  )
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

On Tue Sep 30, 2025 at 4:36 PM UTC, Vipin Sharma wrote:
> Add README.rst for KVM selftest runner and explain how to use the
> runner.
>
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  tools/testing/selftests/kvm/.gitignore        |  1 +
>  tools/testing/selftests/kvm/runner/README.rst | 54 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/runner/README.rst
>
> diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> index 548d435bde2f..83aa2fe01bac 100644
> --- a/tools/testing/selftests/kvm/.gitignore
> +++ b/tools/testing/selftests/kvm/.gitignore
> @@ -4,6 +4,7 @@
>  !*.c
>  !*.h
>  !*.py
> +!*.rst
>  !*.S
>  !*.sh
>  !*.test
> diff --git a/tools/testing/selftests/kvm/runner/README.rst b/tools/testing/selftests/kvm/runner/README.rst
> new file mode 100644
> index 000000000000..83b071c0a0e6
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/runner/README.rst
> @@ -0,0 +1,54 @@
> +KVM Selftest Runner
> +===================
> +
> +KVM selftest runner is highly configurable test executor that allows to run
> +tests with different configurations (not just the default), parallely, save
> +output to disk hierarchically, control what gets printed on console, provide
> +execution status.
> +
> +To generate default tests use::
> +
> +  # make tests_install
> +
> +This will create ``testcases_default_gen`` directory which will have testcases
> +in `default.test` files. Each KVM selftest will have a directory in  which
> +`default.test` file will be created with executable path relative to KVM
> +selftest root directory i.e. `/tools/testing/selftests/kvm`. For example, the
> +`dirty_log_perf_test` will have::
> +
> +  # cat testcase_default_gen/dirty_log_perf_test/default.test
> +  dirty_log_perf_test
> +
> +Runner will execute `dirty_log_perf_test`. Testcases files can also provide
> +extra arguments to the test::
> +
> +  # cat tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
> +  dirty_log_perf_test -x 2 -v 5 -i 10
> +
> +In this case runner will execute the `dirty_log_perf_test` with the options.
> +
> +Example
> +=======
> +
> +To see all of the options::
> +
> +  # python3 runner -h
> +
> +To run all of the default tests::
> +
> +  # python3 runner -d testcases_default_gen
> +
> +To run tests parallely::
> +
> +  # python3 runner -d testcases_default_gen -j 40
> +
> +To print only passed test status and failed test stderr::
> +
> +  # python3 runner -d testcases_default_gen --print-passed status \
> +  --print-failed stderr
> +
> +To run tests binary which are in some other directory (out of tree builds)::
> +
> +  # python3 runner -d testcases_default_gen -p /path/to/binaries

I understand that for reasons of velocity it might make sense to do this
as a KVM-specific thing, but IIUC very little of this has anything to do
with KVM in particular, right? Is there an expectation to evolve in a
more KVM-specific direction?

(One thing that might be KVM-specific is the concurrency. I assume there
are a bunch of KVM tests that are pretty isolated from one another and
reasonable to run in parallel. Testing _the_ mm like that just isn't
gonna work most of the time. I still think this is really specific to
individual sets of tests though, in a more mature system there would be
a metadata mechanism for marking tests as parallelisable wrt each other.
I guess this patchset is part of an effort to have a more mature system
that enables that kind of thing.).

To avoid confusing people and potentially leave the door open to a
cleaner integration, please can you add some bits here about how this
relates to the rest of the kselftest infrastructure? Some questions I
think are worth answering:

- As someone who runs KVM selftests, but doesn't work specifically on
  KVM, to what extent do I need to know about this tool? Can I still run
  the selftests "the old fashioned way" and if so what do I lose as
  compared to using the KVM runner?

- Does this system change the "data model" of the selftests at all, and
  if so how? I.e. I think (but honestly I'm not sure) that kselftests
  are a 2-tier hierarchy of $suite:$test without any further
  parameterisation or nesting (where there is more detail, it's hidden
  as implementation details of individual $tests). Do the KVM selftests
  have this structure? If it differs, how does that effect the view from
  run_kselftest.sh?

- I think (again, not very sure) that in kselftest that each $test is a
  command executing a process. And this process communicates its status
  by printing KTAP and returning an exit code. Is that stuff the same
  for this runner?

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
