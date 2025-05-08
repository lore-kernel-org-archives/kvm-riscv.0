Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB81C3ABC0
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQn9fFI08T0TRGqz/YIRAOMyrxMlrgFEDuTFzvK+NzE=; b=iYTj+/gmhOU0s3
	vqUQS1D3C3vXldls58qwd78B84jemFrhT/Wgq1Djj35BD5CbafKSoI5W2fBEQ0TfGj6Ow6nckEU6M
	3ygfXzx1YcZdlVK5Koec93cCPKqQvG3tUUHcWToXe/XsLy1L0N53sGQDGK2lhJVI3VTmVdqV4r129
	bh3/dQso6kmycRlHxkFtT7eZHZDzBd3YMlcnuYktgdHcj86DYhYi67lRC4Y/Y1xEy2pEdhR++krtY
	8YbuReZEpe38lKY1D4wMk8NFrDb8FWSQZM+WSFT6kv77b+UrHM2ZkDopL57hbrhAMxyXPxdFBhL5B
	Ay59UGWQrbuC+dz6Racw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4va-00000001MmG-0dYF;
	Thu, 08 May 2025 17:20:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3aJ-00000001Cf7-27MW
	for kvm-riscv@lists.infradead.org;
	Thu, 08 May 2025 15:54:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB761E2F;
	Thu,  8 May 2025 08:54:42 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 539973F5A1;
	Thu,  8 May 2025 08:54:49 -0700 (PDT)
Date: Thu, 8 May 2025 16:54:46 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 08/16] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <aBzTxv6pO4rWu4CU@raptor>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-9-alexandru.elisei@arm.com>
 <20250507-5b376c9bc878cbdffabdb3c2@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507-5b376c9bc878cbdffabdb3c2@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085455_633911_97E81473 
X-CRM114-Status: GOOD (  25.55  )
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

Hi Drew,

On Wed, May 07, 2025 at 06:28:04PM +0200, Andrew Jones wrote:
> On Wed, May 07, 2025 at 04:12:48PM +0100, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running and configuring a virtual machine is different to qemu. To run
> > tests using the automated test infrastructure, add a new test parameter,
> > 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> > but using kvmtool's syntax.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/unittests.cfg   | 24 +++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash | 47 +++++++++++++++++++++++++++++----------------
> >  3 files changed, 62 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index a4192ed7e20b..f3c773e56933 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -17,6 +17,7 @@ file = selftest.flat
> >  smp = 2
> >  test_args = 'setup smp=2 mem=256'
> >  qemu_params = -m 256
> > +kvmtool_params = --mem 256
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (kernel mode).
> > @@ -48,66 +49,77 @@ groups = pci
> >  file = pmu.flat
> >  groups = pmu
> >  test_args = "cycle-counter 0"
> > +kvmtool_params = --pmu
> >  
> >  [pmu-event-introspection]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-event-introspection
> > +kvmtool_params = --pmu
> >  
> >  [pmu-event-counter-config]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-event-counter-config
> > +kvmtool_params = --pmu
> >  
> >  [pmu-basic-event-count]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-basic-event-count
> > +kvmtool_params = --pmu
> >  
> >  [pmu-mem-access]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-mem-access
> > +kvmtool_params = --pmu
> >  
> >  [pmu-mem-access-reliability]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-mem-access-reliability
> > +kvmtool_params = --pmu
> >  
> >  [pmu-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-sw-incr
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chained-counters]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chained-counters
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chained-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chained-sw-incr
> > +kvmtool_params = --pmu
> >  
> >  [pmu-chain-promotion]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-chain-promotion
> > +kvmtool_params = --pmu
> >  
> >  [pmu-overflow-interrupt]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  test_args = pmu-overflow-interrupt
> > +kvmtool_params = --pmu
> >  
> >  # Test PMU support (TCG) with -icount IPC=1
> >  #[pmu-tcg-icount-1]
> > @@ -131,6 +143,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = ipi
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio]
> > @@ -138,6 +151,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio-up]
> > @@ -145,6 +159,7 @@ file = gic.flat
> >  smp = 1
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv2-mmio-3p]
> > @@ -152,6 +167,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> >  test_args = mmio
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv3-ipi]
> > @@ -159,6 +175,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = ipi
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = gic
> >  
> >  [gicv2-active]
> > @@ -166,6 +183,7 @@ file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  test_args = active
> >  qemu_params = -machine gic-version=2
> > +kvmtool_params = --irqchip=gicv2
> >  groups = gic
> >  
> >  [gicv3-active]
> > @@ -173,6 +191,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = active
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = gic
> >  
> >  [its-introspection]
> > @@ -180,6 +199,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-introspection
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3-its
> >  groups = its
> >  arch = arm64
> >  
> > @@ -188,6 +208,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-trigger
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3-its
> >  groups = its
> >  arch = arm64
> >  
> > @@ -196,6 +217,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-migration
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > @@ -204,6 +226,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-pending-migration
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > @@ -212,6 +235,7 @@ file = gic.flat
> >  smp = $MAX_SMP
> >  test_args = its-migrate-unmapped-collection
> >  qemu_params = -machine gic-version=3
> > +kvmtool_params = --irqchip=gicv3
> >  groups = its migration
> >  arch = arm64
> >  
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index ea0da959f008..a9164bccc24c 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -78,6 +78,14 @@ extra_params
> >  Alias for 'qemu_params', supported for compatibility purposes. Use
> >  'qemu_params' for new tests.
> >  
> > +kvmtool_params
> > +--------------
> > +Extra parameters supplied to the kvmtool process. Works similarly to
> > +'qemu_params', but uses kvmtool's syntax for command line arguments. The
> > +example for 'qemu_params', applied to kvmtool, would be:
> > +
> > +kvmtool_params = --mem 256
> > +
> >  groups
> >  ------
> >  groups = <group_name1> <group_name2> ...
> > diff --git a/scripts/common.bash b/scripts/common.bash
> > index 649f1c737617..0645235d8baa 100644
> > --- a/scripts/common.bash
> > +++ b/scripts/common.bash
> > @@ -1,6 +1,29 @@
> >  source config.mak
> >  source scripts/vmm.bash
> >  
> > +function parse_opts()
> > +{
> > +	local opts="$1"
> > +	local fd="$2"
> > +
> > +	while read -r -u $fd; do
> > +		#escape backslash newline, but not double backslash
> > +		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> > +			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> > +				opts=${opts%\\$'\n'}
> > +			fi
> > +		fi
> > +		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> > +			opts+=${BASH_REMATCH[1]}
> > +			break
> > +		else
> > +			opts+=$REPLY$'\n'
> > +		fi
> > +	done
> > +
> > +	echo "$opts"
> > +}
> > +
> >  function for_each_unittest()
> >  {
> >  	local unittests="$1"
> > @@ -46,24 +69,14 @@ function for_each_unittest()
> >  			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
> >  		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> >  			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
> > -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> > -			opts=${BASH_REMATCH[2]}$'\n'
> > -			while read -r -u $fd; do
> > -				#escape backslash newline, but not double backslash
> > -				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
> > -					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
> > -						opts=${opts%\\$'\n'}
> > -					fi
> > -				fi
> > -				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
> > -					opts+=${BASH_REMATCH[1]}
> > -					break
> > -				else
> > -					opts+=$REPLY$'\n'
> > -				fi
> > -			done
> > -		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> > +		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> 
> Should use == with [[ ]]

Ack.

> 
> > +			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> > +		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
>                                ^ extra space
> 
> >  			opts=${BASH_REMATCH[2]}
> > +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> > +			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> > +		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> > +			opts=${BASH_REMATCH[1]}
> 
> I think we can do something like
> 
> if [[ $TARGET == "qemu" ]]; then
>    params='(extra_params|qemu_params)'
> elif [[ $TARGET == "kvmtool" ]]; then
>    params='(kvmtool_params)'
> else
>    ...fail...
> fi
> 
> And then use $params in the regular expressions and always use
> BASH_REMATCH[2]. That would allow us to avoid duplicating the if
> statements and then we wouldn't need to factor out parse_opts either.

Sounds good. I can even wrap it with with a vmm function, something like
vmm_get_params_name().

Thanks,
Alex

> 
> Thanks,
> drew
> 
> >  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
> >  			groups=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> > -- 
> > 2.49.0
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
