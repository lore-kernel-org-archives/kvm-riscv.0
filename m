Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F72C02198
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCsewGZYgtywqlnrhbB5Vr5CkpWO7kTLI9KEoOFZxbk=; b=HzPGM3h950MkR8
	lfUEYxUz/s6hkIO1/DfGPttM9Llqq4ryQmvUl8MY3ipRQzgTadIBBkrLEykFbUn+ZTdmrE5/sw/M/
	ycRtCl0FFSpAKryt+TrGPOWpKREy3eT/ZxlJY6TseYcNS2jmr58AOjHGkKi8NxNWbz8y15AG0JPyp
	EGow7U0usZRHYj+zOtpnUjqDCOL5wmWfGlEYBn8E1aHsKtSGYJKgiSuF/KTaM27pAekiL/h1p3FNL
	YmCpaZpQeIhoY2ZqC1N2EbxbrYU257nnop/W6V7WvkDKQLCdJxTbV6O9y3bMRqp4viAT1s9gltFXi
	5Xg9w8S+3HZCeajP6QjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thRVK-0000000H7Py-3JZu;
	Mon, 10 Feb 2025 10:59:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thREy-0000000H3os-1QKi
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 10:42:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35AA11BA8;
	Mon, 10 Feb 2025 02:42:27 -0800 (PST)
Received: from arm.com (unknown [10.57.76.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 510A33F58B;
	Mon, 10 Feb 2025 02:41:58 -0800 (PST)
Date: Mon, 10 Feb 2025 10:41:53 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <Z6nX8YC8ZX9jFiLb@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-45faf6a9a9681c7c9ece5f44@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_024212_417355_D84E271F 
X-CRM114-Status: GOOD (  16.73  )
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

On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
<snip>
> > ---
> >  arm/efi/run             | 8 ++++++++
> >  arm/run                 | 9 +++++++++
> >  run_tests.sh            | 8 ++++++++
> >  scripts/mkstandalone.sh | 8 ++++++++
> >  4 files changed, 33 insertions(+)
<snip>
> > +case "$TARGET" in
> > +qemu)
> > +    ;;
> > +*)
> > +    echo "'$TARGET' not supported for standlone tests"
> > +    exit 2
> > +esac
> 
> I think we could put the check in a function in scripts/arch-run.bash and
> just use the same error message for all cases.

Coming back to the series.

arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
seem to be a common file that is sourced by all of them.

How about creating a new file in scripts (vmm.bash?) with only this
function?

Thanks,
Alex

> 
> Thanks,
> drew
> 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
