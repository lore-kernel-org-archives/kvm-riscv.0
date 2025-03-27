Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A33DC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSZ6QDPuVGQ5XVDQEMTzMQymNZQq0O4U7GmOYAfVb6w=; b=plZUq+4CYDTmoA
	aFnlbHW6UnKzOEOw4GKlwEefu3+5YtLGJaZDAeAPIxEUE9XYMB4rSgePsLvebrOy/JJgaBPK1ZtnC
	HV1ZGfqPt9+LZWh3XHCirU+HuGIj3VYWioAh6llWlC1FxCOi8nhns9PqSuc0EmB67RhFeVpasCL01
	LbjOUDum32EAregLT6VpIo/kIrkZcLZJ8Hjyw71pfY1se62FnNanZVoRm6A5dLL/4i40uW2yPL6E2
	bDVl7IDJBcHw6TFT2jLebmdKFj0ZUZWHhKFT+PdWWB9gsPVOFay95eejd8xd1n2bbLuhVbBw+Ld50
	BqGq5Lr6tIQAGgxw3vbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqld-0000000Bcwh-1N9n;
	Thu, 27 Mar 2025 17:11:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqla-0000000Bcw5-3s1s
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 17:11:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 923F61063;
	Thu, 27 Mar 2025 10:11:47 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AB1B3F63F;
	Thu, 27 Mar 2025 10:11:41 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:11:38 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: andrew.jones@linux.dev, eric.auger@redhat.com, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 2/5] configure: arm/arm64: Display the
 correct default processor
Message-ID: <Z-WGygaYIs4RLoJk@raptor>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
 <20250325160031.2390504-5-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325160031.2390504-5-jean-philippe@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_101143_003047_2D605E4C 
X-CRM114-Status: GOOD (  18.85  )
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

Hi Jean-Philippe,

On Tue, Mar 25, 2025 at 04:00:30PM +0000, Jean-Philippe Brucker wrote:
> From: Alexandru Elisei <alexandru.elisei@arm.com>
> 
> The help text for the --processor option displays the architecture name as
> the default processor type. But the default for arm is cortex-a15, and for
> arm64 is cortex-a57. Teach configure to display the correct default
> processor type for these two architectures.

Looks good to me:

Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>

Thanks,
Alex

> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  configure | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/configure b/configure
> index 010c68ff..b4875ef3 100755
> --- a/configure
> +++ b/configure
> @@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
>      exit 1
>  fi
>  
> +# Return the default CPU type to compile for
> +function get_default_processor()
> +{
> +    local arch="$1"
> +
> +    case "$arch" in
> +    "arm")
> +        echo "cortex-a15"
> +        ;;
> +    "arm64")
> +        echo "cortex-a57"
> +        ;;
> +    *)
> +        echo "$arch"
> +        ;;
> +    esac
> +}
> +
>  srcdir=$(cd "$(dirname "$0")"; pwd)
>  prefix=/usr/local
>  cc=gcc
> @@ -44,13 +62,14 @@ fi
>  
>  usage() {
>      [ "$arch" = "aarch64" ] && arch="arm64"
> +    [ -z "$processor" ] && processor=$(get_default_processor $arch)
>      cat <<-EOF
>  	Usage: $0 [options]
>  
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
>  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> -	    --processor=PROCESSOR  processor to compile for ($arch)
> +	    --processor=PROCESSOR  processor to compile for ($processor)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
>  	    --cross-prefix=PREFIX  cross compiler prefix
> @@ -326,13 +345,8 @@ if [ "$earlycon" ]; then
>      fi
>  fi
>  
> -[ -z "$processor" ] && processor="$arch"
> -
> -if [ "$processor" = "arm64" ]; then
> -    processor="cortex-a57"
> -elif [ "$processor" = "arm" ]; then
> -    processor="cortex-a15"
> -fi
> +# $arch will have changed when cross-compiling.
> +[ -z "$processor" ] && processor=$(get_default_processor $arch)
>  
>  if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>      testdir=x86
> -- 
> 2.49.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
