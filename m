Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1400C36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Vtek6rNWpyCOrYzxbrla486xRWs1wCZ2yyIXq+NY7I=; b=w87QqI317QVR1G
	P7Ual6Frq5FmBwjJcsgex7pzJY3WxKkEK2SxVIlzJUOBUSNxixKkPZGNHUkN42+ll816r6L7j/dGT
	vEfIYmBmvaDqd9DulP+NILp+R2syrvs1ONFg+2algK5tS2eryzKdl2fMyjEE4qnM+8hSuAxRwJH6c
	ME4zIlasu8ouIINYmL1IcAkX/nlTLqv8lN2+L31cSKr8lNkgDIXfQOnr7Aq7sjM0a7RB48JmECtea
	qdoHLYEY92+sw3TuLzRLrpeV8YD8vT8dFMDODE+7TIbKEGHHqYihy9hSjF9c0/4+3fKJ9EbQMJxAG
	FjkuLoWZOs1J3kviCQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhea-00000003DW3-1rXK;
	Mon, 24 Mar 2025 13:15:44 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhcE-00000003DDr-3h3V
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 13:13:21 +0000
Date: Mon, 24 Mar 2025 14:13:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742821996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W+lo7ZJTmaQcIg4xRXI3NSrRPyI/Hr06T/3WGXyDV+w=;
	b=KmVRmpHVdghjXdxP6nw9wJnCjjJist9dS8Mtziz78U1YauSna9vS2diH/pXsb0nMtVSouo
	aNBLSRtOh1q8v/oWPFaaZa38BjYVADDytc5LKHYceYXnS7JxzhDr0yhm+INt/05rFtV1m0
	yS3otZzwOlpo5gpYVrtgEPNon62Q3gM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <20250324-37628351a72ca339819b528d@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <20250322-91a8125ad8651b24246e5799@orel>
 <Z9_tg6WhKvIJtBai@raptor>
 <20250324-5d22d8ad79a9db37b1cf6961@orel>
 <Z-E2v1sKiPG_pt9x@raptor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z-E2v1sKiPG_pt9x@raptor>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_061319_563495_4884EAAE 
X-CRM114-Status: GOOD (  25.74  )
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

On Mon, Mar 24, 2025 at 10:41:03AM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Mon, Mar 24, 2025 at 09:19:27AM +0100, Andrew Jones wrote:
> > On Sun, Mar 23, 2025 at 11:16:19AM +0000, Alexandru Elisei wrote:
> > ...
> > > > > +if [ -z "$qemu_cpu" ]; then
> > > > > +	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
> > > > > +	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
> > > > > +		qemu_cpu="host"
> > > > >  		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> > > > > -			processor+=",aarch64=off"
> > > > > +			qemu_cpu+=",aarch64=off"
> > > > >  		fi
> > > > > +	elif [ "$ARCH" = "arm64" ]; then
> > > > > +		qemu_cpu="cortex-a57"
> > > > > +	else
> > > > > +		qemu_cpu="cortex-a15"
> > > > 
> > > > configure could set this in config.mak as DEFAULT_PROCESSOR, avoiding the
> > > > need to duplicate it here.
> > > 
> > > That was my first instinct too, having the default value in config.mak seemed
> > > like the correct solution.
> > > 
> > > But the problem with this is that the default -cpu type depends on -accel (set
> > > via unittests.cfg or as an environment variable), host and test architecture
> > > combination. All of these variables are known only at runtime.
> > > 
> > > Let's say we have DEFAULT_QEMU_CPU=cortex-a57 in config.mak. If we keep the
> > > above heuristic, arm/run will override it with host,aarch64=off. IMO, having it
> > > in config.mak, but arm/run using it only under certain conditions is worse than
> > > not having it at all. arm/run choosing the default value **all the time** is at
> > > least consistent.
> > 
> > I think having 'DEFAULT' in the name implies that it will only be used if
> > there's nothing better, and we don't require everything in config.mak to
> > be used (there's even some s390x-specific stuff in there for all
> > architectures...)
> 
> I'm still leaning towards having the default value and the heuristics for
> when to pick it in one place ($ARCH/run) as being more convenient, but I
> can certainly see your point of view.

I wouldn't mind it only being in $ARCH/run, but this series adds the same
logic to $ARCH/run and to ./configure. I think an additional, potentially
unused, variable in config.mak is better than code duplication.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
