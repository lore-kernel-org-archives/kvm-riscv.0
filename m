Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013CAC02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN5A+L55IlRBB1XAmAqwwx3JNoCJFIgkjGOfbGzhORU=; b=ED4l798rFc4hbL
	uTL3jDS2ZRRu/t9EnjIZ18dKqgSu6VJGNsmfpFGJgwKLQthA0XAUPLeN2gBKwhJ/vBtSJlIB/VXpp
	E957p1Msz7zT3plXmhqKOegYupctxdakM7WbbkX3P34/pWs5hcEiVthehq7kfCUojLx9basgOaBEs
	djjiPLwICIxE/GcE3Rz2FLlD/WtkuLKKELdnmFpZiOSyUhN2fxLJJxrz5VbzkhMEmYCljGaZfNf53
	+5tSoGre0T9JW/TnfxMqONb1W+EZUo0iABWrW3puyB20CdtXC/23lYF6tn75SIyI2h2YEAemTeh/l
	iSaGpSF17lOnoASbCkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFS9-000000086X5-2iIK;
	Tue, 21 Jan 2025 14:42:05 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFS6-000000086VB-38u0
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 14:42:04 +0000
Date: Tue, 21 Jan 2025 15:41:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737470515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1pZPMNacqT3FWVN3+5IJh+1Gn4JDnmbN6slSSMAGWNY=;
	b=U1g6GiVVnnNvwjlefCbkSGE9rYkiSotU1DJDhhlacz830AQCJY+x+BSFIgBHEdBEjF7whh
	1iOobHh0VB/5gCqnxexgn5mMeNeHTTP/ErMJNus8Z3laTIH16QEgG4GETVntCJkH13UDVC
	pd8HDOrWvDQOqi0jJZ75AGa0Tmxygpo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, Andrew Jones <drjones@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 02/18] Document environment variables
Message-ID: <20250121-005ff84295df2dd87b8329b3@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-3-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_064202_932715_EF606629 
X-CRM114-Status: GOOD (  17.64  )
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

On Mon, Jan 20, 2025 at 04:43:00PM +0000, Alexandru Elisei wrote:
> Document the environment variables that influence how a test is executed
> by the run_tests.sh test runner.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  docs/unittests.txt |  5 ++++-
>  run_tests.sh       | 12 +++++++++---
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index c4269f6230c8..dbc2c11e3b59 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -88,7 +88,8 @@ timeout
>  -------
>  timeout = <duration>
>  
> -Optional timeout in seconds, after which the test will be killed and fail.
> +Optional timeout in seconds, after which the test will be killed and fail. Can
> +be overwritten with the TIMEOUT=<duration> environment variable.
>  
>  check
>  -----
> @@ -99,3 +100,5 @@ can contain multiple files to check separated by a space, but each check
>  parameter needs to be of the form <path>=<value>
>  
>  The path and value cannot contain space, =, or shell wildcard characters.
> +
> +Can be overwritten with the CHECK environment variable with the same syntax.
> diff --git a/run_tests.sh b/run_tests.sh
> index f30b6dbd131c..23d81b2caaa1 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>      -l, --list          Only output all tests list
>          --probe-maxsmp  Update the maximum number of VCPUs supported by host
>  
> -Set the environment variable QEMU=/path/to/qemu-system-ARCH to
> -specify the appropriate qemu binary for ARCH-run.
> -
> +The following environment variables are used:
> +
> +    QEMU            Path to QEMU binary for ARCH-run
> +    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
> +    ACCEL_PROPS     Extra argument to ACCEL
> +    MACHINE         QEMU machine type
> +    TIMEOUT         Timeout duration for the timeout(1) command
> +    CHECK           Overwrites the 'check' unit test parameter (see
> +                    docs/unittests.txt)
>  EOF
>  }
>  
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
