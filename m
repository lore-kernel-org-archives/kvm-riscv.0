Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F1CC0219B
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 18:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3gLhzRWQ4R/h7QtoESKham3HdfjP4hm70iOiQIzn4c=; b=uIA+uNULE9GMzs
	bqL1vquJrsctr9XjJZbykkGAdOK9BbUXuq0ggtH1gsYEjkJyvatGa8xmFNFy6PoubtSUa8lDKR0U1
	f1J0vn4Dji9PigkjEREHCtw1EpojOKuloIaWpzeMp5R+VIGjtBiLbN/0j1nWn4RGYKG/elStyX4En
	/TkWA0rHOL4qq5gHphP+Ci/Ng0k+qDlOPuTPYOkFFTERn9CW1sjHsrzTKUFrGVkl1Wh52ITs1irWh
	7hf7biFO+uJHhzARnIGz0ULjWdTR5os1GVM1UvQozJVI+oBt2ntsJvUQoqk4f5DIsW4aXgTk1Y0KG
	gsRaVVz8m2ANxwkn8TGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thY9B-00000000qWE-3pzn;
	Mon, 10 Feb 2025 18:04:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thY99-00000000qV9-0v7s
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 18:04:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D671B1477;
	Mon, 10 Feb 2025 10:04:58 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58DAB3F58B;
	Mon, 10 Feb 2025 10:04:32 -0800 (PST)
Date: Mon, 10 Feb 2025 18:04:29 +0000
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
Message-ID: <Z6o/rbweZttGReir@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z6nX8YC8ZX9jFiLb@arm.com>
 <20250210-640ff37c16a0dbccb69f08ea@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250210-640ff37c16a0dbccb69f08ea@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_100439_345117_A53E61A9 
X-CRM114-Status: GOOD (  30.14  )
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

On Mon, Feb 10, 2025 at 02:56:25PM +0100, Andrew Jones wrote:
> On Mon, Feb 10, 2025 at 10:41:53AM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> > <snip>
> > > > ---
> > > >  arm/efi/run             | 8 ++++++++
> > > >  arm/run                 | 9 +++++++++
> > > >  run_tests.sh            | 8 ++++++++
> > > >  scripts/mkstandalone.sh | 8 ++++++++
> > > >  4 files changed, 33 insertions(+)
> > <snip>
> > > > +case "$TARGET" in
> > > > +qemu)
> > > > +    ;;
> > > > +*)
> > > > +    echo "'$TARGET' not supported for standlone tests"
> > > > +    exit 2
> > > > +esac
> > > 
> > > I think we could put the check in a function in scripts/arch-run.bash and
> > > just use the same error message for all cases.
> > 
> > Coming back to the series.
> > 
> > arm/efi/run and arm/run source scripts/arch-run.bash; run_tests.sh and
> > scripts/mkstandalone.sh don't source scripts/arch-run.bash. There doesn't
> > seem to be a common file that is sourced by all of them.
> 
> scripts/mkstandalone.sh uses arch-run.bash, see generate_test().

Are you referring to this bit:

generate_test ()
{
	<snip>
        (echo "#!/usr/bin/env bash"
         cat scripts/arch-run.bash "$TEST_DIR/run")

I think scripts/arch-run.bash would need to be sourced for any functions defined
there to be usable in mkstandalone.sh.

What I was thinking is something like this:

if ! vmm_supported $TARGET; then
	echo "$0 does not support '$TARGET'"
	exit 2
fi

Were you thinking of something else?

I think mkstandalone should error at the top level (when you do make
standalone), and not rely on the individual scripts to error if the VMM is
not supported. That's because I think creating the test files, booting a
machine and copying the files only to find out that kvm-unit-tests was
misconfigured is a pretty suboptimal experience.

> run_tests.sh doesn't, but I'm not sure it needs to validate TARGET
> since it can leave that to the lower-level scripts.

I put the check in arm/run, and removed it from run_tests.sh, and this is
what I got:

$ ./run_tests.sh selftest-setup
SKIP selftest-setup (./arm/run does not supported 'kvmtool')

which looks good to me.

> 
> > 
> > How about creating a new file in scripts (vmm.bash?) with only this
> > function?
> 
> If we need a new file, then we can add one, but I'd try using
> arch-run.bash or common.bash first.

common.bash seems to work (and the name fits), so I'll give that a go.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
