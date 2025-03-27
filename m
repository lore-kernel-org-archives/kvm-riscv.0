Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F9C3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZgt3Oh/K+45wNLbnrUdHN4iC5FBfXewTFdBjCKg0So=; b=4iSw5nJovSO5RI
	PyKlKkPQxfocK+JXK1baAw32nE9es8EIsa+fh2spAKfvE7oPVx6Du+QQpzV+nhTFx6tS+1vE1omy7
	Jq3aEqal3yCNkEEL3mdTCzb2NeyyDLCAJjFSExG7FjVLvXKUKJPJ2ElOt/Vx0DL/gmN8+dxaz4bBy
	22eVn1GoTzJVZ7hhrJibl2dqzRyyvpAvFHQaETr07i+3e1TtyomIXVFS8Nmq+d8sKCmg00fGvhaFh
	EttDLtuq2RMh5woYQOVgGecaBF/S0/8rLa1FDrAMHZDrWVMgklloOx/pFRNYKu0Jk0Clv0ssU768B
	wYKfjQjPvdWtSh4ER7ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqrV-0000000Bdgj-2k5q;
	Thu, 27 Mar 2025 17:17:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txqrT-0000000BdgN-0YD3
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 17:17:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DEF31063;
	Thu, 27 Mar 2025 10:17:51 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D98EB3F63F;
	Thu, 27 Mar 2025 10:17:44 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:17:42 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 0/5] arm64: Change the default QEMU CPU
 type to "max"
Message-ID: <Z-WINviy8d6_xKpE@raptor>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
 <20250326-adedac8bee1bcff68cb0b849@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250326-adedac8bee1bcff68cb0b849@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_101747_213685_9F307546 
X-CRM114-Status: GOOD (  16.03  )
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

On Wed, Mar 26, 2025 at 07:51:35PM +0100, Andrew Jones wrote:
> On Tue, Mar 25, 2025 at 04:00:28PM +0000, Jean-Philippe Brucker wrote:
> > This is v3 of the series that cleans up the configure flags and sets the
> > default CPU type to "max" on arm64, in order to test the latest Arm
> > features.
> > 
> > Since v2 [1] I moved the CPU selection to ./configure, and improved the
> > help text. Unfortunately I couldn't keep most of the Review tags since
> > there were small changes all over.
> > 
> > [1] https://lore.kernel.org/all/20250314154904.3946484-2-jean-philippe@linaro.org/
> > 
> > Alexandru Elisei (3):
> >   configure: arm64: Don't display 'aarch64' as the default architecture
> >   configure: arm/arm64: Display the correct default processor
> >   arm64: Implement the ./configure --processor option
> > 
> > Jean-Philippe Brucker (2):
> >   configure: Add --qemu-cpu option
> >   arm64: Use -cpu max as the default for TCG
> > 
> >  scripts/mkstandalone.sh |  3 ++-
> >  arm/run                 | 15 ++++++-----
> >  riscv/run               |  8 +++---
> >  configure               | 55 +++++++++++++++++++++++++++++++++++------
> >  arm/Makefile.arm        |  1 -
> >  arm/Makefile.common     |  1 +
> >  6 files changed, 63 insertions(+), 20 deletions(-)
> > 
> > -- 
> > 2.49.0
> 
> Thanks Jean-Philippe. I'll let Alex and Eric give it another look, but
> LGTM.

Looks good to me too, just two nitpicks, not sure if it's worth respining just
for them, or if you want to make the changes when you apply the patches (or just
ignore them, that's fine too!).

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
