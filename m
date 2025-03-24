Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D4BC36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XaRHwqUSzHIw7oN5Tr+Y0gJ9iF5KI9fT7WDv+82h2M=; b=4Qv+Bc7+k0ECHn
	/LJPgQUlc9BFKOFAR/pkS6k8k9cPcdI7ldHZ8ekuWY5ht4f+/WgJ1PLPqQ2PGNWAjiq9jQtNwehZT
	Z3sIbjk+kc6drvs+lNMj4ZxQaBlkHTHkoWj66NAS5YpC2ITg3xx/BpVUpLvaSx5B364fwz/Ie49Wd
	btivim2T1jhQkXXkyHso1q7U3jLkPSVD3SxZKBsYLIPUJuE1j3WApVm8fIXysSbpEOANBg3chywXu
	DaWnaT1aqmjWTe9z3gXi6yWLC2CJi0FUwQ08d0EN/rvuK6ZIbKaaoa0H2ZJZUumfU+gziWnyAxhgO
	//Zkt36Hz5yT3VK2JvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfTc-00000002tAj-0ey8;
	Mon, 24 Mar 2025 10:56:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfEz-00000002r6e-0Wek
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 10:41:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72C5F1A2D;
	Mon, 24 Mar 2025 03:41:13 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEBAA3F63F;
	Mon, 24 Mar 2025 03:41:05 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:41:03 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <Z-E2v1sKiPG_pt9x@raptor>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <20250322-91a8125ad8651b24246e5799@orel>
 <Z9_tg6WhKvIJtBai@raptor>
 <20250324-5d22d8ad79a9db37b1cf6961@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324-5d22d8ad79a9db37b1cf6961@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_034109_208608_ADB0A52D 
X-CRM114-Status: GOOD (  26.67  )
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

On Mon, Mar 24, 2025 at 09:19:27AM +0100, Andrew Jones wrote:
> On Sun, Mar 23, 2025 at 11:16:19AM +0000, Alexandru Elisei wrote:
> ...
> > > > +if [ -z "$qemu_cpu" ]; then
> > > > +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> > > > +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> > > > +		qemu_cpu="host"
> > > >  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> > > > -			processor+=",aarch64=off"
> > > > +			qemu_cpu+=",aarch64=off"
> > > >  		fi
> > > > +	elif [ "$ARCH" = "arm64" ]; then
> > > > +		qemu_cpu="cortex-a57"
> > > > +	else
> > > > +		qemu_cpu="cortex-a15"
> > > 
> > > configure could set this in config.mak as DEFAULT_PROCESSOR, avoiding the
> > > need to duplicate it here.
> > 
> > That was my first instinct too, having the default value in config.mak seemed
> > like the correct solution.
> > 
> > But the problem with this is that the default -cpu type depends on -accel (set
> > via unittests.cfg or as an environment variable), host and test architecture
> > combination. All of these variables are known only at runtime.
> > 
> > Let's say we have DEFAULT_QEMU_CPU=cortex-a57 in config.mak. If we keep the
> > above heuristic, arm/run will override it with host,aarch64=off. IMO, having it
> > in config.mak, but arm/run using it only under certain conditions is worse than
> > not having it at all. arm/run choosing the default value **all the time** is at
> > least consistent.
> 
> I think having 'DEFAULT' in the name implies that it will only be used if
> there's nothing better, and we don't require everything in config.mak to
> be used (there's even some s390x-specific stuff in there for all
> architectures...)

I'm still leaning towards having the default value and the heuristics for
when to pick it in one place ($ARCH/run) as being more convenient, but I
can certainly see your point of view.

So yeah, up to you :)

> 
> > 
> > We could modify the help text for --qemu-cpu to say something like "If left
> > unset, the $ARCH/run script will choose a best value based on the host system
> > and test configuration."
> 
> This is helpful, so we should add it regardless.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
