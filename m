Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A87DC35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 11:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TE7g79yImqpr/zQUHYGObewf1UkZWK+S51fXS4YUfyQ=; b=zcDZNEWy0OTJtn
	M9MnhAyboAwikWZTo/VC0gTFkf7B3yvkOuX1h1r6NPclahJJJvFcMenpoND5yepLuq3cCdheBpWJg
	B5ge28dqyvzt+RJx57lICemD4jB8kq6cR4fSaNKaIzqOg28K9x4omTXUyY2cZ/YwfsOuP+Owrlx5J
	aeq1xV/7lbvfUzKcPXI/X8flgHccBNx1jjr80ZzQCxm8E1TR4rPYu7NMN+kvWyZK6PkaSx8ocHHUt
	jFD33gdWKoS5A8f3R3L6A09TmPA1R/ABmyv5kSbpwAtKA+u7p5CFo8ncCycluCQ1+oauKc8TBRDdc
	o9c9Ee/j8WVpyYVBMelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvweC-0000000HJZV-30V3;
	Sat, 22 Mar 2025 11:04:12 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwe9-0000000HJZ5-3iJZ
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 11:04:11 +0000
Date: Sat, 22 Mar 2025 12:04:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742641444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3AbPthiG4Ipqd9vExyooLnBvqplgAQmSYPkVfdf03+Y=;
	b=e2Core7/Axcims5mOpjjqGxzbcxGhawHug2Eeq1hYamx0mrfv4Yxw8mX59gbSevTtscTeN
	nHmtbx3WdGOrEfSX2WQycGiSgrnb7yoapTLpX8G9AGWVLYVquSh01sFoK55CpHdGhR7R3y
	QILVzcmDLxHtZS8UMr5+lAgERiJ3gtM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 1/5] configure: arm64: Don't display
 'aarch64' as the default architecture
Message-ID: <20250322-4802e87f0e18f0b787adb5fb@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-3-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314154904.3946484-3-jean-philippe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_040410_132920_A7C1E1DA 
X-CRM114-Status: GOOD (  19.57  )
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

On Fri, Mar 14, 2025 at 03:49:01PM +0000, Jean-Philippe Brucker wrote:
> From: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> --arch=aarch64, intentional or not, has been supported since the initial
> arm64 support, commit 39ac3f8494be ("arm64: initial drop"). However,
> "aarch64" does not show up in the list of supported architectures, but
> it's displayed as the default architecture if doing ./configure --help
> on an arm64 machine.
> 
> Keep everything consistent and make sure that the default value for
> $arch is "arm64", but still allow --arch=aarch64, in case they are users
> that use this configuration for kvm-unit-tests.
> 
> The help text for --arch changes from:
> 
>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> to:
> 
>     --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 06532a89..dc3413fc 100755
> --- a/configure
> +++ b/configure
> @@ -15,8 +15,9 @@ objdump=objdump
>  readelf=readelf
>  ar=ar
>  addr2line=addr2line
> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> -host=$arch
> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> +arch=$host
> +[ "$arch" = "aarch64" ] && arch="arm64"

I'd prefer we keep our block of assignments a block of assignments. We can
put this at the bottom of the block, or, since the whole point of this is
to make sure help text looks right, then just put it in usage() at the top.

Thanks,
drew

>  cross_prefix=
>  endian=""
>  pretty_print_stacks=yes
> -- 
> 2.48.1
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
