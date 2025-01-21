Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE81CC02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YnErKgbICqidbXITUteAfIeabAGO/J0zTxml4/jd2o=; b=Xulr3B4wvSTw5K
	qwbfTKpvJYW3SFT4De6EE//HrW5o61UIXgTYQn0FfEx6yY72DI//HRcra0vER0bX2FjAgbodvCMCT
	YtUZoKGv4ehXIpjygRPchFkAqwJ32ycGu0KfPJfeCEnBAvHYeqyvoS/giQXDFeLmgYBwal3QhjNHp
	G+8V1+3339gr9RQEAT95qDZ34CLooQOjmmxLrMuNwW1XruT/nZW/9EyqNXCpTRlXTFPXtx5xtMv0G
	szHKU8uL5prhNv5+3zh4OMvjmugQ82XAqyAeH1wZVfDnjhyc7jflvi+GkMdGKKbtqlhSP4FrM2OTt
	GAGEU4wqynYYBzsN/j+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taH7p-00000008MHd-2V5R;
	Tue, 21 Jan 2025 16:29:13 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taH7m-00000008MHE-22yJ
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:29:11 +0000
Date: Tue, 21 Jan 2025 17:29:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JHE1Ks4sha2VPulKTfL3JK8VfRv3tuso1k0l1+BbscY=;
	b=ThyApVdiP12DgYTi+kjvBSrSt+RXWw1HLWvA8u4utOlNQmE4yb5C1jYj6Orkv1Dp2iJeY6
	rXmAwK6G9lbo4TBQOEmzkgkXQ6luL3C4+iz9Dxnj3EwunsaPkUpMGfXE7oNug+SLD5DSrN
	ZWyxbw6bSnfEJir2ggCFGEDT9G1saMQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 08/18] scripts/runtime: Detect kvmtool
 failure in premature_failure()
Message-ID: <20250121-ec03a2683ab979d2313e09ee@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-9-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-9-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_082910_668081_2AB9B0DF 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Jan 20, 2025 at 04:43:06PM +0000, Alexandru Elisei wrote:
> kvm-unit-tests assumes that if the VMM is able to get to where it tries to
> load the kernel, then the VMM and the configuration parameters will also
> work for running the test. All of this is done in premature_failure().
> 
> Teach premature_failure() about the kvmtool's error message when it fails
> to load the dummy kernel.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 451b5585f010..ee8a188b22ce 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -12,18 +12,27 @@ extract_summary()
>      tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
>  }
>  
> -# We assume that QEMU is going to work if it tried to load the kernel
> +# We assume that the VMM is going to work if it tried to load the kernel
>  premature_failure()
>  {
>      local log
>  
>      log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>  
> -    echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> -                -e "error loading" \
> -                -e "failed to load" &&
> -        return 1
> +    case "$TARGET" in
> +    qemu)
> +

extra blank line here

> +        echo "$log" | grep "_NO_FILE_4Uhere_" |
> +            grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> +                    -e "error loading" \
> +                    -e "failed to load" &&
> +            return 1
> +        ;;
> +    kvmtool)
> +        echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
> +            return 1
> +        ;;
> +    esac

This looks good, but could possibly become

 eval echo "$log" | ${vmm_opts[$TARGET,premature_failure]} && return 1

if we got the vmm_opts route.

Thanks,
drew

>  
>      RUNTIME_log_stderr <<< "$log"
>  
> -- 
> 2.47.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
