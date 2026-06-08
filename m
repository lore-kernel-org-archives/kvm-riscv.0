Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15E7CD6E79
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 17:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Px2UaN/ZaUYnXn9F8RzZDhTZHHM0DZpamLyzwdbNt3c=; b=4EWoocDiZ22W1Z
	TQrozV/FjA7S/TR986FdT7yPN4KF4fWpublZpqSFvHqDfazOsnNK1TWAPe3WvXoiGeb+ttmi4WbC7
	hLv3GtXBHICiGAolI8G4XXOqnZNE7poL4Xn9z0h7Nkq+pWdk2N8PG3i2b2cFgavtes/rtZcFd6/RV
	hUwCfCdojCUw0JwLQqS8Tinv7eX61ZOZp3jjZEWHVOyZ+3dSsJ/34vZI1dvG91CI2YNC3ukN0wTdU
	Cw+TbFY0WtJfGE9gOu4lWXUr5vZmAdR5sr5vuI3aNL7+LCy6fYTy5yxK/4u8vu79xKmCxIYvNyyIh
	yWMFWlX5608BiFfWaUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe90-00000004Dwe-14Wp;
	Mon, 08 Jun 2026 17:52:14 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWe8y-00000004Dw1-1HeR
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 17:52:13 +0000
Received: from 8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 46872202AB5;
	Mon,  8 Jun 2026 19:52:09 +0200 (CEST)
Date: Mon, 8 Jun 2026 19:52:08 +0200
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com, michael.roth@amd.com, nsaenz@amazon.com, 
	anelkz@amazon.de, James.Bottomley@hansenpartnership.com, 
	Melody Wang <huibo.wang@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, x86@kernel.org, 
	coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Message-ID: <aib8n5lO6HKbLC4Y@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
 <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_105212_490864_8C44E381 
X-CRM114-Status: GOOD (  13.73  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Paolo,

On Mon, Jun 08, 2026 at 06:47:54PM +0200, Paolo Bonzini wrote:
> On 6/8/26 16:42, J=F6rg R=F6del wrote:
> > From: Joerg Roedel <joerg.roedel@amd.com>
> > =

> > The algorithm is to always run the lowest runnable plane. Plane
> > switches are done by stopping the current plane and setting another
> > runnable.
> > =

> > Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
> =

> This was left arbitrary in my version because for example Hyper-V VTLs use
> highest-runnable instead.  It also made pure userspace scheduling possibl=
e,
> though that may not be very important in the grand scheme of things.

IIRC what Hyper-V does is always the run the highest-privileged runnable le=
vel,
no?  Maybe in their numbering level 0 has the least privileges?  Anyway, I =
am
happy to make changes here, also based on input from the VSM side.

> Did you drop it because it didn't work, or just for simplicity?

The user-space scheduling worked, my 6.17 planes implementation used it. But
there are some problems with it going forward, because TDX Partitioning (and
likely ARM CCA Planes as well) do not allow arbitrary switches forced by the
hypervisor. All they allow is a forced switch to the highest privileged pla=
ne,
the SVSM on SNP will force the same constraints by making lower-privilege V=
MSAs
not-runnable when it executes.

So exposing an interface for user-space to chose which plane to run does se=
em
to gain some weird, platform dependent semantics going forward. TDX and CCA
also require in-kernel switching as they can switch planes without a VMEXIT=
, so
I decided to have it from the start.


-Joerg

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
