Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9638C02198
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONsjjCYMWVGyMx9MFXxvYHdwF7f7nvfduqGg2B8ZIiI=; b=h2SRkR/ufuC2QU
	bkxcCZSlZLbE+9SiVZFVk28E8rfn9HS2lvDRR/PeCkle/6P/tPwRYggMh+iMdb/L5NL2ELg1qRjXy
	wY+7qrDm/eGBf6TRD1hEOE0mbSEuYI9M0j7sBK3Y1sLobb0+WWnX0eUjHEm8Dz3rmnDELU12I4sQl
	pp/v0LWjBLkb04vMWAY87FpBiSDU7BWnpLsOuQENjRJsli7A8OvaapajkJJ3j5QIgmssLnsJ6XNy9
	WmrGDWqANeboJuhhnuydBJYhna+L8BpZF0JPtGOCy51KXxGL9+2P/hChdIvFHs2n3z6lEsDBEsbQb
	nk4G+xV4sfTFe4747eNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUIR-00000000347-1Zed;
	Mon, 10 Feb 2025 13:57:59 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUHB-000000002uB-0yZM
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 13:56:42 +0000
Date: Mon, 10 Feb 2025 14:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739195793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6QxzYCLsT1iF2vEH4te1D9LwJ9LeHeBIIOwbWx7d42w=;
	b=dIuJ8mBPN9XRylpd0pPPFZlnRPzIyaQDOvW0+7vWIUtPOd2ArfJa0ls/kBVEdV/3K7OzxY
	+z4sIcp3tfj6ipAoTidGAq1+R2gNDZyi7Hqj9GfQB/u73/sfLMykVg9BonbVXgeJjsK9Ck
	4n33sBQo2Qlb3R1Ld27i0JM9Q6o2hus=
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
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250210-640ff37c16a0dbccb69f08ea@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z6nX8YC8ZX9jFiLb@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6nX8YC8ZX9jFiLb@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_055641_476243_11F76498 
X-CRM114-Status: GOOD (  20.21  )
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

On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> <snip>
> > > ---
> > >  arm/efi/run             | 8 ++++++++
> > >  arm/run                 | 9 +++++++++
> > >  run_tests.sh            | 8 ++++++++
> > >  scripts/mkstandalone.sh | 8 ++++++++
> > >  4 files changed, 33 insertions(+)
> <snip>
> > > +case "$TARGET" in
> > > +qemu)
> > > +    ;;
> > > +*)
> > > +    echo "'$TARGET' not supported for standlone tests"
> > > +    exit 2
> > > +esac
> > 
> > I think we could put the check in a function in scripts/arch-run.bash and
> > just use the same error message for all cases.
> 
> Coming back to the series.
> 
> arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
> scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
> seem to be a common file that is sourced by all of them.

scripts/mkstandalone.sh uses arch-run.bash, see generate_test().
run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
since it can leave that to the lower-level scripts.

> 
> How about creating a new file in scripts (vmm.bash?) with only this
> function?

If we need a new file, then we can add one, but I'd try using
arch-run.bash or common.bash first.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
