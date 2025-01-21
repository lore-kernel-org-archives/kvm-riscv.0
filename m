Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43D7C02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dZDHyIKxV5fxZz14mipF4Ff4LrFzL65tPscz6qmS3c=; b=rykYVaNmgnpD8p
	4tls9rkcc1sRryQb96lMUgnKV4oILubW61pQ3hCQBsjyGn21U4p6JTJlFAIey8Q782QEcm85PMB8l
	vWaxT98ZgJl8WSwuMfGdhtIs8bxSQyIzRDqjdGV3GQOGHvCj/kq4NnzsiewTyH9nFD77OJokl0ac9
	FPvscIYJnZ/jCigOiJD4ymuooLptvnCXldfX5ZrZoHltT8N4STXqgDwG8h8X8E3fRMr/xoeHri1gc
	jcOIsf+nblhn7gwixt1Gm6DmgA222LtP2wPhQTpfvex844Gryxm9uyjyRO7eGlp/msAK+6kAFwoOq
	YnD9jFElSdzMAa7jOxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGsA-00000008KTl-1pXP;
	Tue, 21 Jan 2025 16:13:02 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGs8-00000008KSX-0St3
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:13:01 +0000
Date: Tue, 21 Jan 2025 17:12:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737475977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cyMTmEzB2/U6qcXH179gcIg8qFA+t5ge+uEkmTrIDFY=;
	b=Byr2VvxiU4c4qpp4KsGIfvIfoTPSZ94lhRmH+7449u1XN5es1s1AwV/ecHaLHam3bHowaF
	4hz5gb9XUH9F00XF8neP4/tNH54hlIET6NQYR94xWksNJuvAn8CNEebEkY4KDt+x/21bjR
	tbIQjxaL4tDARm9tN25cSgoF3rfVa+Q=
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
Subject: Re: [kvm-unit-tests PATCH v2 06/18] scripts: Merge the qemu
 parameter -smp into $qemu_opts
Message-ID: <20250121-293c6d322b91d5ff51291ad6@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-7-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-7-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_081300_421346_057E5798 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, Jan 20, 2025 at 04:43:04PM +0000, Alexandru Elisei wrote:
> kvmtool has a different command line parameter to specify the number of
> VCPUs (-c/--cpus). To make it easier to accommodate it, merge the qemu
> specific parameter -smp into $qemu_opts when passing it to the
> $RUNTIME_arch_run script.
> 
> This is safe to do because the $RUNTIME_arch_run script, on all
> architectures, passes the parameters right back to run_qemu() et co, and
> do not treat individual parameters separately.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index e5d661684ceb..a89f2d10ab78 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,8 @@ premature_failure()
>  get_cmdline()
>  {
>      local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
> +
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
>  }
>  
>  skip_nodefault()
> @@ -87,6 +88,8 @@ function run()
>      local accel="$9"
>      local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
>  
> +    qemu_opts="-smp $smp $qemu_opts"
> +
>      if [ "${CONFIG_EFI}" == "y" ]; then
>          kernel=${kernel/%.flat/.efi}
>      fi
> -- 
> 2.47.1
>

This seems fine, but I still think we want qemu_opts to be opts and we can
parameterize the option names. So we could have a table of option names
that we use in places like this

declare -A vmm_opts

vmm_opts[qemu,nr_cpus]='-smp'
vmm_opts[qemu,another_option]='foo'

vmm_opts[kvmtool,nr_cpus]='-c'
vmm_opts[kvmtool,another_option]='bar'

# $vmm gets set to whatever vmm we're using, e.g. vmm=qemu

opts="${vmm_opts[$vmm,nr_cpus]} $smp $opts"

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
