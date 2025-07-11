Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C10C83F1B
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9vhX4s5ZSV9eOLhO6I4nH3sAtGgoMk4s2gK3b864f2Y=; b=RZXoiaZ8zPfzrx
	T9iz2HLo1Ntv7sFazOtYX+uvpau6mWC+WPr76rmllBfplPRJORf6agH0kTWwe+4HU47ESrr1g9ntY
	4kLj0dd5NqInY2hLh1c6qKXAJgPNA62t6ppuTvqtsgFo5ZN6FkQ6WeXTXFYWogOxFPhU+gh3GW4nS
	Dk+nWw/sM0iVP+/Th53FSSd9S7leDsQ13rluvrs6lXE5Z5bliry5QsualWldcG/rXPxc9KLJTPnNT
	VjRrMIgJWhFiPPdY9am6jGxUiSVwtaxOung3QXC6DwUkRiOVi+k5nIhQdgHCf+J0FJF+y5/BNOn+C
	cRxn1QPisVviP6lUoGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEsp-0000000F2Z2-1vau;
	Fri, 11 Jul 2025 14:37:51 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEr9-0000000F2NK-2HBL
	for kvm-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 14:36:12 +0000
Date: Fri, 11 Jul 2025 16:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752244561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=grsYows+9sHElnPNNTmSBrFWiRJY83TUzmMJ77We0PI=;
	b=V2Z1W6T57gXqBL7P47kpAxJKjUb9twcwWPHGIJmXcPG5ZoU+rxoKrdN4pkXlQZ3VbFmDqT
	dh18/YI2V2ixNx1Nn1GKxyWiDDf2S4jhhecmukG/j/K3En+iyWOiTYEHMl5YFwGrtgRb/k
	u2yoV9Lr7ZFqZlAGHzN/orAyb9x2K2o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, eric.auger@redhat.com, 
	lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, 
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com, Boqiao Fu <bfu@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments
 for kvmtool
Message-ID: <20250711-357d520bb64154cbe119679b@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-8-alexandru.elisei@arm.com>
 <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce92db8c-6d26-4953-9f74-142d00d2bc2a@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_073609_333479_930630FF 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 11, 2025 at 01:32:33PM +0200, Thomas Huth wrote:
...
> > +function vmm_default_opts()
> > +{
> > +	echo ${vmm_optname[$(vmm_get_target),default_opts]}
> > +}
> 
> 
> This causes now a problem on s390x:
> 
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/jobs/10604334029#L591
> 
> scripts/common.bash: line 56: vmm_defaults_opts: command not found
> 
> ... any ideas how to fix it?

This is fixed by https://lore.kernel.org/all/20250709085938.33254-2-andrew.jones@linux.dev/
which I just pushed.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
