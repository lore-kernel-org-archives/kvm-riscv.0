Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75DC35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 11:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZAEvr+BMNKL0dmaZG5OWrF9rZ8Kc6yYw+8awl8YvpM=; b=wJ5RYe6Gwa8OWg
	btCOvBJi1ovQhjpjzR2qdb2ftzYLr2R5LqaQtvoee+z/o+dLsa92ouCr4RBiRIdAZCP5zldd8Qb+m
	WEjscoZA8iOzmj4QRQHiQbVCIVbvFrNuSdS57OCcamwKSP8xNT4h1dArg/Lo3IckQRDYHU+Id/hoi
	+6bnT0R0IVJePPYiV/33Oyx+AFsa9DLvd2XsD1Uyl8T+g9IUgAynl3zwcVFAQthhrVmAuUZLLYPWM
	LRYWGaM1prb9BmaTyQP3PN52JPx7bSQmZh0vT/IBuMb2Yy6pFUGGLixnREPiQofthVFAQT6P3KatF
	7fZgAPz03/L9C4nj9oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvx1J-0000000HKsq-2zl6;
	Sat, 22 Mar 2025 11:28:05 +0000
Received: from out-178.mta0.migadu.com ([91.218.175.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvx1G-0000000HKsT-0U4T
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 11:28:03 +0000
Date: Sat, 22 Mar 2025 12:27:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742642879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OIOHPwdS2grkXZETZCyBEn9eNoWFlgKvyBxcmW/d7eY=;
	b=TX2eRdgq+l0TsCN5s39NiZc06KTANgjhVcFJedxZSWkLsjpBI7ng69B4RjPhLemSC6oa9l
	OviWqHItjrA9wlDiIuL0YbNkI2mH+Ohrb/VbShzMx3QBsyND9yaZzCaHRglAobvTe6IerF
	nZ/rEzmt49Ge/AV9brs1ZqMIV3xxhto=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 5/5] arm64: Use -cpu max as the default
 for TCG
Message-ID: <20250322-c669034d2100a75ab6e53882@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-7-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314154904.3946484-7-jean-philippe@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_042802_292670_65E054A2 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, Mar 14, 2025 at 03:49:05PM +0000, Jean-Philippe Brucker wrote:
> In order to test all the latest features, default to "max" as the QEMU
> CPU type on arm64.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  arm/run | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arm/run b/arm/run
> index 561bafab..84232e28 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -45,7 +45,7 @@ if [ -z "$qemu_cpu" ]; then
>  			qemu_cpu+=",aarch64=off"
>  		fi
>  	elif [ "$ARCH" = "arm64" ]; then
> -		qemu_cpu="cortex-a57"
> +		qemu_cpu="max"
>  	else
>  		qemu_cpu="cortex-a15"

arm should also be able to default to 'max', right?

Thanks,
drew

>  	fi
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
