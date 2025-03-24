Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4246FC36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaFJmMH/ttVWoZCImsy44LQrpS2qsqhSCQxPYzkwf40=; b=sSqYFhtf9iJUDl
	JwRbTX1tQmwdDTpBNbijHSGkZMMPAJWRo50P5cnpeay74tJqwCkQM2CDIAj3JssHdgf8+0XfE4C/W
	afzYUWhYckVuf5iXweOkRZoae3mjaLiPZKXBBFSARx/2i5RrV8ogO+uuotU3923rFDcpMtTWSjdAJ
	PNdr2M3DFSOvAnbwc/xVYPU6wSYCwf0mDtzaGRrqz7bd9D1g/u0HBVbz0r0whA5Ck/6euFVQ10DkG
	xU/z5VgpN6FsYfkW+qXM+Y5zymWMsSMaR8zeXle9vwF0Pz2bmMCwBvG4nbZHisntoLzOyCtr65x0k
	9VNR4lVZu0FvAmb3SlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twd25-00000002Ys0-3o7Q;
	Mon, 24 Mar 2025 08:19:41 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twd22-00000002Yqa-37a8
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:19:40 +0000
Date: Mon, 24 Mar 2025 09:19:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742804371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nT01jyxPvL4ghruc69ok3n46Axe+IpSGm70ZkWQJRI=;
	b=ahUaKnIrSBCACk4IdyabSmxr/6vgjA5fyJuHRCIrOS/aVRhrf/Z6vuFiwWaQgPFaaMzNnS
	w0DJsBqj0pJ6a8PjUN5c86WdRA+19FNRqeh7CLwbO623X7su18G8g9fU3jsJbnBCf6JRQg
	/9jvvbsrvd279KUaiZ4OVIbV6r76tbg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <20250324-5d22d8ad79a9db37b1cf6961@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <20250322-91a8125ad8651b24246e5799@orel>
 <Z9_tg6WhKvIJtBai@raptor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9_tg6WhKvIJtBai@raptor>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_011939_301865_D0B9A364 
X-CRM114-Status: GOOD (  19.17  )
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

On Sun, Mar 23, 2025 at 11:16:19AM +0000, Alexandru Elisei wrote:
...
> > > +if [ -z "$qemu_cpu" ]; then
> > > +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> > > +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> > > +		qemu_cpu="host"
> > >  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> > > -			processor+=",aarch64=off"
> > > +			qemu_cpu+=",aarch64=off"
> > >  		fi
> > > +	elif [ "$ARCH" = "arm64" ]; then
> > > +		qemu_cpu="cortex-a57"
> > > +	else
> > > +		qemu_cpu="cortex-a15"
> > 
> > configure could set this in config.mak as DEFAULT_PROCESSOR, avoiding the
> > need to duplicate it here.
> 
> That was my first instinct too, having the default value in config.mak seemed
> like the correct solution.
> 
> But the problem with this is that the default -cpu type depends on -accel (set
> via unittests.cfg or as an environment variable), host and test architecture
> combination. All of these variables are known only at runtime.
> 
> Let's say we have DEFAULT_QEMU_CPU=cortex-a57 in config.mak. If we keep the
> above heuristic, arm/run will override it with host,aarch64=off. IMO, having it
> in config.mak, but arm/run using it only under certain conditions is worse than
> not having it at all. arm/run choosing the default value **all the time** is at
> least consistent.

I think having 'DEFAULT' in the name implies that it will only be used if
there's nothing better, and we don't require everything in config.mak to
be used (there's even some s390x-specific stuff in there for all
architectures...)

> 
> We could modify the help text for --qemu-cpu to say something like "If left
> unset, the $ARCH/run script will choose a best value based on the host system
> and test configuration."

This is helpful, so we should add it regardless.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
