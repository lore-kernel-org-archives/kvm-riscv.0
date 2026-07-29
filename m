Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85621C53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tqg7OWGoM2hapTpG3oS1yV+7sUW42Jc9HCmhUkSxI1s=; b=p6s1RQuWb8FmpFQdhllZC34J9x
	c/UjcTEblFQ77XYPsvOoljMAhz2bQ8HybuRiE3e5FBR1uxgXbxys6nK7qwaZlbNb+29mpNCLtZ0wE
	VCobFFYDPYvvUbPS/Ud2XT1IMgwhGRLbdXYIbLqko7YQAscD1bT1bJ/oGDafcRQUvuNXbJ+F9WZ5e
	PqT+eFyN9VinD6lYNtp8QdKlxSAPyyCy1a+ldJ6aV6lrT4aIZDS2X4mr3zpkEg4RxU9uG3bNgNz82
	aRVnzqeXsuFeJvtXgiMzudUQ7CKcREggt8pChVkDSEsuIaEjXeOuRNvJf4dZqY16jCeYw1fYKrl4+
	68pQqz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9f2-00000008rea-10lW;
	Wed, 29 Jul 2026 19:09:48 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9f0-00000008rdo-0Yfi
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:09:47 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-84a67b16217so2215709b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785352184; x=1785956984; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XMot+n6JciyNBBWBYdqJ5JavyhMGOvDIbDy5VtGrOA=;
        b=rKHm3K2ZckzWG5E3Cc12fUvdm+J4q0/JGtrRSARabJSc4+sc4ruYR/AC1fmc0u/INu
         3ZkgwSrcPBj1aP2rjnaXavEWFW0WGPfuDh8jlcESxhWi7nPlCTynr7gxLgUnUy9l82sc
         Vqsz/cIB8Y39AUcHVCbZPHGnFe/PknoCnJ0Ysar/I9/i6LWmURy+UmBLhHc3dTjID93e
         Cteozo/g8zwEjZxOqVfuNocIV1iMMLDZ4THUGC+N5nQYRsp01hI4U9ZUZt1LRTH7IrOi
         rYF50NFMrXpG0gwN043KqA2W8CUZ4nSXT2L28f2OM7IGXBnuJQqc/Tya2rPb8zQ+lTN4
         5vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785352184; x=1785956984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XMot+n6JciyNBBWBYdqJ5JavyhMGOvDIbDy5VtGrOA=;
        b=deMX7yYcr+7bbfMpqAC6tsHWv1qUmNWq/4fPqaCLb2dEiZnCdGZXud93iNnFzi/2fA
         7ipqhtlkD08cGdLkiaIxjvmpzzsX7Tqic37LSUC3fluY/51iotyvWybHxsJ+Wqy3ZP4m
         CvPoO2T7iNOAXsCRgHGBjAIZHL5cXaJq4Q/pTHJGfElaQI539yPStG98Kheb17RBiSQp
         hNyQbGpPQkg6UFcZdqVyIUwP+FBl1nlxvmYkj6qPZVFQwLhcU4+wftn2LofWWl2ib7NT
         eh0u8yo68wEl33S11mHyARGduRN70K5wUatOLV9KAsP9Tv9VMjlTJHInozz7sok/VzqU
         Xd8g==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Gp5vQAex5I6BxRD/sXh7Tz9ug3+BDoyseGURt+clJ2sAOh+WDB5tmIZetNaNyl1g/1GeB9Maliw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE5fsUVgJlmHDalyP2ugVV2C1s4sBSlLR/1dcpFDwWDcEnoCiz
	kfg07f3qEl5GmMK/GRStUuQ2qloMcKUt++F9pxz9HfzI5spKoeBeZ7zsWgDgEKNINgjBdaIhyIt
	axm8yCA==
X-Received: from pffz14.prod.google.com ([2002:aa7:990e:0:b0:848:49f6:6f5c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9290:b0:848:88e6:95d3
 with SMTP id d2e1a72fcca58-84eba1ecb98mr1356b3a.72.1785352184010; Wed, 29 Jul
 2026 12:09:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:09:43 -0700
In-Reply-To: <20260331194202.1722082-10-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-10-vipinsh@google.com>
Message-ID: <ampP93AEMawDmv4E@google.com>
Subject: Re: [PATCH v4 9/9] KVM: selftests: Provide README.rst for KVM
 selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_120946_172743_2D20C298 
X-CRM114-Status: GOOD (  13.57  )
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

On Tue, Mar 31, 2026, Vipin Sharma wrote:
> +Generate Default Tests
> +======================
> +
> +Generate the default test case files using the provided make target::
> +
> +  # make tests_install
> +
> +This creates the ``testcases_default_gen`` directory containing ``default.test``
> +files. Each KVM selftest has a directory with a ``default.test`` file. This file
> +contains the executable path relative to the KVM selftest root directory
> +(``/tools/testing/selftests/kvm``). For example, the ``dirty_log_perf_test``
> +entry looks like::
> +
> +  # cat testcases_default_gen/dirty_log_perf_test/default.test
> +  dirty_log_perf_test
> +
> +In above testcase, the runner executes ``dirty_log_perf_test``. Testcase files
> +can provide extra arguments to the test::
> +
> +  # cat tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
> +  dirty_log_perf_test -x 2 -v 5 -i 10

This is obviously not about the default tests.

> +
> +In this case, the runner executes ``dirty_log_perf_test`` with the specified
> +options.
> +
> +Examples
> +========
> +
> +Display all options::
> +
> +  # python3 runner -h
> +
> +Run all default tests::
> +
> +  # python3 runner -d testcases_default_gen

s/testcases_default_gen/$(DEFAULT_TESTCASES), because the user (like me) might
change it.

Something like this, if we go testcases => install route?

Generate Default Tests
======================

Generate the default test case files using the provided make target::

  # make testcases

Create a ``$(INSTALL_PATH)/$(DEFAULT_TESTCASES)`` directory and a sub-directory
for each KVM selftest, and populate each selftest sub-directory with a
``default.test`` file, where ``default.test`` contains the unqualified
executable path.

For example, the ``dirty_log_perf_test`` entry looks like::

  # cat $(DEFAULT_TESTCASES)/dirty_log_perf_test/default.test
  dirty_log_perf_test

Note, the ``testcases`` target is dependent on the ``install`` target, i.e.
installing testcases will also run ``install``.

Testcase Syntax
===============

Testcase files can provide extra arguments to the test::

  # cat tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
  dirty_log_perf_test -x 2 -v 5 -i 10

In this case, the runner executes ``dirty_log_perf_test`` with the specified
options. 

Examples 
========

Display all options::

  # python3 runner -h

Run all default tests::

  # python3 runner -d $(DEFAULT_TESTCASES)

Run tests in parallel::

  # python3 runner -d $(DEFAULT_TESTCASES) -j 40

Print only passed test status and failed test stderr::

  # python3 runner -d $(DEFAULT_TESTCASES) --print-passed status \
  --print-failed stderr

Run test binaries from a different directory (e.g., out-of-tree builds)::

  # python3 runner -d $(DEFAULT_TESTCASES) -p /path/to/binaries

Save all test outputs (stdout, stderr, status) to a directory::

  # python3 runner -d $(DEFAULT_TESTCASES) -o test_outputs

Run specific testcase files::

  # python3 runner -t tests/dirty_log_perf_test/2slot_5vcpu_10iter.test

> +
> +Run tests in parallel::
> +
> +  # python3 runner -d testcases_default_gen -j 40
> +
> +Print only passed test status and failed test stderr::
> +
> +  # python3 runner -d testcases_default_gen --print-passed status \
> +  --print-failed stderr
> +
> +Run test binaries from a different directory (e.g., out-of-tree builds)::
> +
> +  # python3 runner -d testcases_default_gen -p /path/to/binaries
> +
> +Save all test outputs (stdout, stderr, status) to a directory::
> +
> +  # python3 runner -d testcases_default_gen -o test_outputs
> +
> +Run specific testcase files::
> +
> +  # python3 runner -t tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
> -- 
> 2.53.0.1118.gaef5881109-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
