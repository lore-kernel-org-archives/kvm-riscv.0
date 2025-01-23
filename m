Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AEFC0218B
	for <kvm-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v944dYMmaWEkkbOWEyK4cB/ArV2bqVnUFyonhrObZNo=; b=Jlw2wGE89liM5S
	tBy+Rd6u7ub7zOgy0ktwvZQTC4TJHriF68KmSi/iSPSATdbBTD2fTq8dO/tECzLQ0rpVhjMIrk36y
	ogSD4RwMSwi4GwvDWCtWJir6WQKzRQJtyGxtebXXkHEjwDNMAZC2BIj887JyqN/mhruMQRBWj3wV0
	Ha0V9qBH0J/+WD5glleYz5a5TXETp5xy19sDIa6Du+vA+xA/zgI0EDnANm19L1D2QI+tfpT5deWDs
	JiyXv1RRCeqK9IOdPTezLVz+/TDTiDoVn9JA0KDRsCaDMj45ubeu/YxKuUpIZejlxeb6pyG8h/WFg
	Dqv6DVKF4FuqOYL1t7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxtI-0000000CZqp-1g30;
	Thu, 23 Jan 2025 14:09:04 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxrm-0000000CZa3-3plJ
	for kvm-riscv@lists.infradead.org;
	Thu, 23 Jan 2025 14:07:32 +0000
Date: Thu, 23 Jan 2025 15:07:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737641243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiYAC4Ucxcm7KuFAC5tUIQUTt4eAoBsu+z1SGcrkjzs=;
	b=r41LZca+Sg/9Rc14gHPNbCgZPgDw6X/CzWbgkYZYXTZWfG9IYDtoDglUvjOpuR+psOcRFP
	bVQkbsAuJLGvQhJcpWMAvbb5zRT6xkvAW9FFr+yMuz1EEAIFRpfQDHRFsRH80+9mTCqLQo
	Qh+GFBQVRggjkwqI0l6xn+R27U6C8Ro=
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
Subject: Re: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default
 arguments for kvmtool
Message-ID: <20250121-16510b161f5b92ce9c5ae4e1@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-13-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-13-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_060731_359496_489D17FE 
X-CRM114-Status: GOOD (  28.64  )
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

On Mon, Jan 20, 2025 at 04:43:10PM +0000, Alexandru Elisei wrote:
> kvmtool, unless told otherwise, will do its best to make sure that a kernel
> successfully boots in a virtual machine. Among things like automatically
> creating a rootfs, it also adds extra parameters to the kernel command
> line. This is actively harmful to kvm-unit-tests, because some tests parse
> the kernel command line and they will fail if they encounter the options
> added by kvmtool.
> 
> Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> line argument") addded the --nodefaults kvmtool parameter which disables

added

> all the implicit virtual machine configuration that cannot be disabled by
> using other parameters, like modifying the kernel command line. Always use
> --nodefaults to allow a test to run.
> 
> kvmtool can be too verbose when running a virtual machine, and this is
> controlled with parameters. Add those to the default kvmtool command line
> to reduce this verbosity to a minimum.
> 
> Before:
> 
> $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
>   Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> Unknown subtest
> 
> EXIT: STATUS=127
>   Warning: KVM compatibility warning.
> 	virtio-9p device was not detected.
> 	While you have requested a virtio-9p device, the guest kernel did not initialize it.
> 	Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
>   Warning: KVM compatibility warning.
> 	virtio-net device was not detected.
> 	While you have requested a virtio-net device, the guest kernel did not initialize it.
> 	Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
>   Info: KVM session ended normally.
> 
> After:
> 
> $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"

On riscv I've noticed that with --nodefaults if I don't add parameters
with --params then kvmtool segfaults. I have to add --params "" to
avoid it. Does that also happen on arm? Anyway, that's something we
should fix in kvmtool rather than workaround it here.

> PASS: selftest: setup: smp: number of CPUs matches expectation
> INFO: selftest: setup: smp: found 2 CPUs
> PASS: selftest: setup: mem: memory size matches expectation
> INFO: selftest: setup: mem: found 256 MB
> SUMMARY: 2 tests
> 
> EXIT: STATUS=1
> 
> Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
> variable with the same name, but it's not documented in the help string for
> run_tests.sh. This has been done on purpose, since overwritting
> KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
> purposes.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  scripts/runtime.bash | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 55d58eef9c7c..abfd1e67b2ef 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -2,6 +2,17 @@
>  : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
>  : "${TIMEOUT:=90s}"
>  
> +# The following parameters are enabled by default when running a test with
> +# kvmtool:
> +# --nodefaults: suppress VM configuration that cannot be disabled otherwise
> +#               (like modifying the supplied kernel command line). Tests that
> +#               use the command line will fail without this parameter.
> +# --network mode=none: do not create a network device. kvmtool tries to help the
> +#                user by automatically create one, and then prints a warning
> +#                when the VM terminates if the device hasn't been initialized.
> +# --loglevel=warning: reduce verbosity
> +: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
> +
>  PASS() { echo -ne "\e[32mPASS\e[0m"; }
>  SKIP() { echo -ne "\e[33mSKIP\e[0m"; }
>  FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
> @@ -103,7 +114,7 @@ function run()
>          opts="-smp $smp $qemu_opts"
>          ;;
>      kvmtool)
> -        opts="--cpus $smp $kvmtool_opts"
> +        opts="$KVMTOOL_DEFAULT_OPTS --cpus $smp $kvmtool_opts"
>          ;;
>      esac
>  
> -- 
> 2.47.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
