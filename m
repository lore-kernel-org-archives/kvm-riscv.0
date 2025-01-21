Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63783C02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgxKufTHta7da+XI3ZErSbym9AQfW2TqhTHxUDJTC7A=; b=46pIJCKdT1oUpy
	g6cJ0EoP6XCBWdyXemm8N41MWuUvGBjMHB2VdndjhJuvUX/vSbURZ2K/2fPgmvFn9obLCIxsbXVfF
	CWYdzcUTMeGoXFtAlTdLdzZmTXWvzPnNO5ip94H/XxATWQFmRIrjc8NSLD2tkd+n6mCvOX0475eC4
	GaDiFeKdy4Lo2WRJxmV133vwpO2In8edxK5eFTb3KkVDFZxy9UiCMIKN3VJAtxsQ5CNqctEKAgx5/
	3AVfsUwE7R0IHWr9bgbaTBqznJmbHH8XNiV/lA/YrtDyod7M5OSgrsZyAXnidQafD0yNZyQbCOn1u
	b50DbVU2FqMWclFWjniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGzv-00000008LYY-0dw2;
	Tue, 21 Jan 2025 16:21:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGzs-00000008LY1-06cl
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A531106F;
	Tue, 21 Jan 2025 08:21:27 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFD103F738;
	Tue, 21 Jan 2025 08:20:55 -0800 (PST)
Date: Tue, 21 Jan 2025 16:20:53 +0000
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
Message-ID: <Z4_JZUYtQciBnnzd@raptor>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z4_DKTMeDQqsqV_6@raptor>
 <20250121-c7f5ba2a25ccbfe793da07f6@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250121-c7f5ba2a25ccbfe793da07f6@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_082100_159000_B0CD1E84 
X-CRM114-Status: GOOD (  38.41  )
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

On Tue, Jan 21, 2025 at 05:17:22PM +0100, Andrew Jones wrote:
> On Tue, Jan 21, 2025 at 03:54:17PM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> > > > Arm and arm64 support running the tests under kvmtool. Unsurprisingly,
> > > > kvmtool and qemu have a different command line syntax for configuring and
> > > > running a virtual machine.
> > > > 
> > > > On top of that, when kvm-unit-tests has been configured to run under
> > > > kvmtool (via ./configure --target=kvmtool), the early UART address changes,
> > > > and if then the tests are run with qemu, this warning is displayed:
> > > > 
> > > > WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> > > > 
> > > > At the moment, the only way to run a test under kvmtool is manually, as no
> > > > script has any knowledge of how to invoke kvmtool. Also, unless one looks
> > > > at the logs, it's not obvious that the test runner is using qemu to run the
> > > > tests, and not kvmtool.
> > > > 
> > > > To avoid any confusion for unsuspecting users, refuse to run a test via the
> > > > testing scripts when kvm-unit-tests has been configured for kvmtool.
> > > > 
> > > > There are four different ways to run a test using the test infrastructure:
> > > > with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> > > > parameters (only the arm directory is mentioned here because the tests can
> > > > be configured for kvmtool only on arm and arm64), and by creating
> > > > standalone tests. Add a check in each of these locations for the supported
> > > > virtual machine manager.
> > > > 
> > > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > > ---
> > > >  arm/efi/run             | 8 ++++++++
> > > >  arm/run                 | 9 +++++++++
> > > >  run_tests.sh            | 8 ++++++++
> > > >  scripts/mkstandalone.sh | 8 ++++++++
> > > >  4 files changed, 33 insertions(+)
> > > > 
> > > > diff --git a/arm/efi/run b/arm/efi/run
> > > > index 8f41fc02df31..916f4c4deef6 100755
> > > > --- a/arm/efi/run
> > > > +++ b/arm/efi/run
> > > > @@ -12,6 +12,14 @@ fi
> > > >  source config.mak
> > > >  source scripts/arch-run.bash
> > > >  
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +    echo "$0 does not support '$TARGET'"
> > > > +    exit 2
> > > > +esac
> > > > +
> > > >  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
> > > >  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> > > >  elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> > > > diff --git a/arm/run b/arm/run
> > > > index efdd44ce86a7..6db32cf09c88 100755
> > > > --- a/arm/run
> > > > +++ b/arm/run
> > > > @@ -8,6 +8,15 @@ if [ -z "$KUT_STANDALONE" ]; then
> > > >  	source config.mak
> > > >  	source scripts/arch-run.bash
> > > >  fi
> > > > +
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +   echo "'$TARGET' not supported"
> > > > +   exit 3
> > > 
> > > I think we want exit code 2 here.
> > 
> > Exit code 2 is already in use in arm/run. Now that I'm looking more closely
> > at it, exit code 2 is already in use in run_tests.sh, same for
> > mkstandalone.sh and arm/efi/run.
> > 
> > How about using 3 everywhere as the exit code?
> >
> 
> In kvm-unit-tests, exit code 2 is what we use for "most likely a run
> script failed" (see the comment above run_qemu() in
> scripts/arch-run.bash). We don't try to create a new error code for each
> type of error, but we do have the error message as well. So if there's a
> higher level runner, which runs this runner, it only needs to learn that
> 2 is likely a script failure and that an error message will hopefully
> point the way to the problem.
> 

I see, I missed the comment. Will change so it returns 2 everywhere.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
