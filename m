Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6355C0219B
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FteGVfcoEuEKeIpWdN5yMJiEDlsxORjsAOMMrQ/A9ks=; b=hTwWE7Asu/CgTy
	Kb5OzW1ZwgyXWrzD4rJdg8dgVDpas9yZa5WF9TMAccgFVhKQVkKCmH2WwbR7sXkj/d0R3MmxQQR+S
	DLagct6AyazREqSpizZmyVReZx+JHAvFGDnmkSqlXQS6M512kAvrdQFJncbCHTNW7cApVezQBLUmd
	eIlrNnmZb/x3kTXmTYHNGbITgaTj4Gcnw3MHYUUS3KJFJvCVGSiEMITFi/+C3cnZipnRcDrdP1ymN
	GqDYv+6RuZoQIvgPqTj3ZrAuU7Lf8+/ZRuUUsDtWBuJq0ZS0fcUXFQ0xsrE/5VmJmFuQqnPLAN8+d
	fnVpQt+CkkwQ7Fz0meCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrnF-00000004Dcn-1IX2;
	Tue, 11 Feb 2025 15:03:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrnC-00000004Dbm-19PV
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 15:03:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49B2213D5;
	Tue, 11 Feb 2025 07:03:36 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC4863F5A1;
	Tue, 11 Feb 2025 07:03:11 -0800 (PST)
Date: Tue, 11 Feb 2025 15:03:09 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <Z6tmrX8/+wzeFL1P@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250123-bbd289cfd7abfd93e9b67eef@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_070318_404755_7EE39E4B 
X-CRM114-Status: GOOD (  30.72  )
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

On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running a virtual machine is different than qemu's. To run tests using the
> > automated test infrastructure, add a new test parameter, kvmtool_params.
> > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > kvmtool's syntax.
> 
> The need for qemu_params and kvmtool_params makes more sense to me now
> that I see the use in unittests.cfg (I wonder if we can't rearrange this
> series to help understand these things up front?). There's a lot of

Certainly, I'll move it closer to the beginning of the series.

> duplication, though, with having two sets of params since the test-
> specific inputs always have to be duplicated. To avoid the duplication
> I think we can use extra_params for '-append' and '--params' by
> parametrizing the option name for "params" (-append / --params) and then
> create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> and irqchip.

How about something like this (I am using selftest-setup as an example, all the
other test definitions would be similarly modified):

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 2bdad67d5693..3009305ba2d3 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -15,7 +15,9 @@
 [selftest-setup]
 file = selftest.flat
 smp = 2
-extra_params = -m 256 -append 'setup smp=2 mem=256'
+test_args = setup smp=2 mem=256
+qemu_params = -m 256
+kvmtool_params = --mem 256
 groups = selftest

I was thinking about using 'test_args' instead of 'extra_params' to avoid any
confusion between the two, and to match how they are passed to a test
- they are in the argv main's argument.

Also, should I change the test definitions for all the other architectures?
It's not going to be possible for me to test all the changes.

Thanks,
Alex

> 
> Thanks,
> drew
> 
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/unittests.cfg   | 27 +++++++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash |  4 ++++
> >  3 files changed, 39 insertions(+)
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index 2bdad67d5693..974a5a9e4113 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -16,18 +16,21 @@
> >  file = selftest.flat
> >  smp = 2
> >  extra_params = -m 256 -append 'setup smp=2 mem=256'
> > +kvmtool_params = --mem 256 --params 'setup smp=2 mem=256'
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (kernel mode).
> >  [selftest-vectors-kernel]
> >  file = selftest.flat
> >  extra_params = -append 'vectors-kernel'
> > +kvmtool_params = --params 'vectors-kernel'
> >  groups = selftest
> >  
> >  # Test vector setup and exception handling (user mode).
> >  [selftest-vectors-user]
> >  file = selftest.flat
> >  extra_params = -append 'vectors-user'
> > +kvmtool_params = --params 'vectors-user'
> >  groups = selftest
> >  
> >  # Test SMP support
> > @@ -35,6 +38,7 @@ groups = selftest
> >  file = selftest.flat
> >  smp = $MAX_SMP
> >  extra_params = -append 'smp'
> > +kvmtool_params = --params 'smp'
> >  groups = selftest
> >  
> >  # Test PCI emulation
> > @@ -47,66 +51,77 @@ groups = pci
> >  file = pmu.flat
> >  groups = pmu
> >  extra_params = -append 'cycle-counter 0'
> > +kvmtool_params = --pmu --params 'cycle-counter 0'
> >  
> >  [pmu-event-introspection]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-event-introspection'
> > +kvmtool_params = --pmu --params 'pmu-event-introspection'
> >  
> >  [pmu-event-counter-config]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-event-counter-config'
> > +kvmtool_params = --pmu --params 'pmu-event-counter-config'
> >  
> >  [pmu-basic-event-count]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-basic-event-count'
> > +kvmtool_params = --pmu --params 'pmu-basic-event-count'
> >  
> >  [pmu-mem-access]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-mem-access'
> > +kvmtool_params = --pmu --params 'pmu-mem-access'
> >  
> >  [pmu-mem-access-reliability]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-mem-access-reliability'
> > +kvmtool_params = --pmu --params 'pmu-mem-access-reliability'
> >  
> >  [pmu-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-sw-incr'
> > +kvmtool_params = --pmu --params 'pmu-sw-incr'
> >  
> >  [pmu-chained-counters]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chained-counters'
> > +kvmtool_params = --pmu --params 'pmu-chained-counters'
> >  
> >  [pmu-chained-sw-incr]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chained-sw-incr'
> > +kvmtool_params = --pmu --params 'pmu-chained-sw-incr'
> >  
> >  [pmu-chain-promotion]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-chain-promotion'
> > +kvmtool_params = --pmu --params 'pmu-chain-promotion'
> >  
> >  [pmu-overflow-interrupt]
> >  file = pmu.flat
> >  groups = pmu
> >  arch = arm64
> >  extra_params = -append 'pmu-overflow-interrupt'
> > +kvmtool_params = --pmu --params 'pmu-overflow-interrupt'
> >  
> >  # Test PMU support (TCG) with -icount IPC=1
> >  #[pmu-tcg-icount-1]
> > @@ -127,48 +142,56 @@ extra_params = -append 'pmu-overflow-interrupt'
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'ipi'
> > +kvmtool_params = --irqchip=gicv2 --params 'ipi'
> >  groups = gic
> >  
> >  [gicv2-mmio]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv2-mmio-up]
> >  file = gic.flat
> >  smp = 1
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv2-mmio-3p]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
> >  extra_params = -machine gic-version=2 -append 'mmio'
> > +kvmtool_params = --irqchip=gicv2 --params 'mmio'
> >  groups = gic
> >  
> >  [gicv3-ipi]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'ipi'
> > +kvmtool_params = --irqchip=gicv3 --params 'ipi'
> >  groups = gic
> >  
> >  [gicv2-active]
> >  file = gic.flat
> >  smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
> >  extra_params = -machine gic-version=2 -append 'active'
> > +kvmtool_params = --irqchip=gicv2 --params 'active'
> >  groups = gic
> >  
> >  [gicv3-active]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'active'
> > +kvmtool_params = --irqchip=gicv3 --params 'active'
> >  groups = gic
> >  
> >  [its-introspection]
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'its-introspection'
> > +kvmtool_params = --irqchip=gicv3-its --params 'its-introspection'
> >  groups = its
> >  arch = arm64
> >  
> > @@ -176,6 +199,7 @@ arch = arm64
> >  file = gic.flat
> >  smp = $MAX_SMP
> >  extra_params = -machine gic-version=3 -append 'its-trigger'
> > +kvmtool_params = --irqchip=gicv3-its --params 'its-trigger'
> >  groups = its
> >  arch = arm64
> >  
> > @@ -232,6 +256,7 @@ groups = cache
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'bp'
> > +kvmtool_params = --params 'bp'
> >  groups = debug
> >  
> >  [debug-bp-migration]
> > @@ -244,6 +269,7 @@ groups = debug migration
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'wp'
> > +kvmtool_params = --params 'wp'
> >  groups = debug
> >  
> >  [debug-wp-migration]
> > @@ -256,6 +282,7 @@ groups = debug migration
> >  file = debug.flat
> >  arch = arm64
> >  extra_params = -append 'ss'
> > +kvmtool_params = --params 'ss'
> >  groups = debug
> >  
> >  [debug-sstep-migration]
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index 3e1a9e563016..ebb6994cab77 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -69,6 +69,14 @@ extra_params
> >  Alias for 'qemu_params', supported for compatibility purposes. Use
> >  'qemu_params' for new tests.
> >  
> > +kvmtool_params
> > +--------------
> > +Extra parameters supplied to the kvmtool process. Works similarly to
> > +qemu_params and extra_params, but uses kvmtool's syntax for command line
> > +arguments. The example for qemu_params, applied to kvmtool, would be:
> > +
> > +kvmtool_params = --mem 256 --params 'smp=2'
> > +
> >  groups
> >  ------
> >  groups = <group_name1> <group_name2> ...
> > diff --git a/scripts/common.bash b/scripts/common.bash
> > index 1b5e0d667841..f54ffbd7a87b 100644
> > --- a/scripts/common.bash
> > +++ b/scripts/common.bash
> > @@ -67,6 +67,10 @@ function for_each_unittest()
> >  			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> >  		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> >  			qemu_opts=${BASH_REMATCH[2]}
> > +		elif [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> > +			kvmtool_opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> > +		elif [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> > +			kvmtool_opts=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
> >  			groups=${BASH_REMATCH[1]}
> >  		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> > -- 
> > 2.47.1
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
