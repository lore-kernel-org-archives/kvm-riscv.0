Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765EFC3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHvFvL5wGho2bTGuXYp2FkcTjlNzxycUgC0oIZ9t1+w=; b=SPVGAW648HUIWI
	TaIUqXPK6JERmkWpT0Bx63CaBpJY0eQu6mgL9SXJYp0bZkH/K+aaUX5pABsTmTuJEqkEd+YtaGFJ0
	tzmoRzx1WaTJfdhdUEj+2W1b6KakDyhoJ+rkcBkloaIQmvQKgPVu+ej+VpDdx/AnYM1OQgNO0BPbO
	VYxzqhFy8BgCyOdl0yc21xIdNdrgbe4JJIXxvWY0KnXvgNZ8wPzYK56+I2zGJism+GGDiNmKupm2+
	e2yeh/MzqinqXztWhK0g+yo/WjcvdHWaTm/ToXtEhRDCVuXbQotB9EeBUFnTN4ppsGh37px+cNqox
	vkTQqbzvdRLc5X2TYBWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWr-0000000GINI-18zM;
	Wed, 07 May 2025 17:25:57 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChAZ-0000000G4EX-0ftb
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:58:52 +0000
Date: Wed, 7 May 2025 17:58:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746633526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ekBedcL1Lp3vekEN23FbKEi/Hlbj3mFx+ToO6OvQpxE=;
	b=YqX9hj+38OgRaOntcA9ClHnRF+VTU38CY8ZCoMRLgScpfivUKP9WCJ4xsKAseKQga5btxN
	Tb2wAbshPyrW/hSI9N1ZLIMfMRx5Y/iFtyG9WWcerzHCSD6BqjiZBSwZSWZcWv/stA71rB
	NXJTOMGyrWuIEx7Qo5bthakJ/oyO3MQ=
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
Subject: Re: [kvm-unit-tests PATCH v3 02/16] scripts: Add 'test_args' test
 definition parameter
Message-ID: <20250507-d69f4d5ffe44cedee80dad11@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-3-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-3-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_085851_406492_7DC54419 
X-CRM114-Status: GOOD (  11.00  )
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

On Wed, May 07, 2025 at 04:12:42PM +0100, Alexandru Elisei wrote:
...
>  # FPU/SIMD test
> @@ -276,17 +291,20 @@ arch = arm64
>  [mte-sync]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'sync'
> +test_args=sync

add spaces around =

> +qemu_params = -machine mte=on
>  arch = arm64
>  
>  [mte-async]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'async'
> +test_args=async

spaces

> +qemu_params = -machine mte=on
>  arch = arm64
>  
>  [mte-asymm]
>  file = mte.flat
>  groups = mte
> -qemu_params = -machine mte=on -append 'asymm'
> +test_args=asymm

spaces

...
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 400e8a082528..06cc58e79b69 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -80,12 +80,18 @@ function run()
>      local groups="$2"
>      local smp="$3"
>      local kernel="$4"
> -    local opts="$5"
> -    local arch="$6"
> -    local machine="$7"
> -    local check="${CHECK:-$8}"
> -    local accel="$9"
> -    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
> +    local test_args="$5"
> +    local opts="$6"
> +    local arch="$7"
> +    local machine="$8"
> +    local check="${CHECK:-$9}"
> +    local accel="${10}"
> +    local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
> +
> +    # If $test_args is empty, qemu will interpret the first option after -append
> +    # as a kernel parameter instead of a qemu option, so make sure the -append
> +    # option is used only if $test_args is not empy.

                                                  ^ empty

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
