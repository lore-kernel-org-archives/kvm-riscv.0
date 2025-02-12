Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DACC021AA
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Feb 2025 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+e28Qz2GF0nKm+bPddWrZukXB9N0I3cU1tt1pBknfZ4=; b=xbpopoMEy59fP4
	ilGJjhYERTNkAK/5XYDKpx3UgL4O88XiU5G0Vt5W2Zofihs8i6TEoPUStS7SRObJCKwuKlGi4Eq3+
	Kr6pMJPw0L1o5eaRFm4qmyuFjd0n4XM+GpZwA2PE2C9GWlevUpwOYw4vChfJiotsHI8oB7m8h3FRH
	3gmD293stJR4GAjI3pO2HChaadiL09qmqQsQsZSjeqa6u916AJw+UIKlOb8gFeMTA/xIgX+pzfrI+
	TAHQD9ydGhiQzwxXuP1RT3KlBpZKkGIKuIuIZAPpwHDt/OR2+qw4vcl9igG7I0R0sJYmUjl5FJE6E
	03XOlTIrNXDD0dsrif7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGGO-00000008EoD-1y0S;
	Wed, 12 Feb 2025 17:11:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFhM-000000086VO-44Kx
	for kvm-riscv@lists.infradead.org;
	Wed, 12 Feb 2025 16:34:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC21912FC;
	Wed, 12 Feb 2025 08:35:10 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.1.26.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C1F3F6A8;
	Wed, 12 Feb 2025 08:34:46 -0800 (PST)
Date: Wed, 12 Feb 2025 16:34:44 +0000
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
Subject: Re: [kvm-unit-tests PATCH v2 15/18] Add kvmtool_params to test
 specification
Message-ID: <Z6zNpF6mi5GgeDFE@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-16-alexandru.elisei@arm.com>
 <20250123-bbd289cfd7abfd93e9b67eef@orel>
 <Z6tmrX8/+wzeFL1P@arm.com>
 <20250212-77a312138f8b5931553ece38@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212-77a312138f8b5931553ece38@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_083453_098311_6E35A3A3 
X-CRM114-Status: GOOD (  35.72  )
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

On Wed, Feb 12, 2025 at 04:56:42PM +0100, Andrew Jones wrote:
> On Tue, Feb 11, 2025 at 03:03:09PM +0000, Alexandru Elisei wrote:
> > Hi Drew,
> > 
> > On Thu, Jan 23, 2025 at 04:53:29PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 20, 2025 at 04:43:13PM +0000, Alexandru Elisei wrote:
> > > > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > > > running a virtual machine is different than qemu's. To run tests using the
> > > > automated test infrastructure, add a new test parameter, kvmtool_params.
> > > > The parameter serves the exact purpose as qemu_params/extra_params, but using
> > > > kvmtool's syntax.
> > > 
> > > The need for qemu_params and kvmtool_params makes more sense to me now
> > > that I see the use in unittests.cfg (I wonder if we can't rearrange this
> > > series to help understand these things up front?). There's a lot of
> > 
> > Certainly, I'll move it closer to the beginning of the series.
> > 
> > > duplication, though, with having two sets of params since the test-
> > > specific inputs always have to be duplicated. To avoid the duplication
> > > I think we can use extra_params for '-append' and '--params' by
> > > parametrizing the option name for "params" (-append / --params) and then
> > > create qemu_opts and kvmtool_opts for extra options like --pmu, --mem,
> > > and irqchip.
> > 
> > How about something like this (I am using selftest-setup as an example, all the
> > other test definitions would be similarly modified):
> > 
> > diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> > index 2bdad67d5693..3009305ba2d3 100644
> > --- a/arm/unittests.cfg
> > +++ b/arm/unittests.cfg
> > @@ -15,7 +15,9 @@
> >  [selftest-setup]
> >  file = selftest.flat
> >  smp = 2
> > -extra_params = -m 256 -append 'setup smp=2 mem=256'
> > +test_args = setup smp=2 mem=256
> > +qemu_params = -m 256
> > +kvmtool_params = --mem 256
> >  groups = selftest
> > 
> > I was thinking about using 'test_args' instead of 'extra_params' to avoid any
> > confusion between the two, and to match how they are passed to a test
> > - they are in the argv main's argument.
> 
> Yes, this looks good and test_args is better than my suggestion in the
> other mail of 'cmdline_options' since "cmdline" would be ambiguous with
> the test's cmdline and the vmm's cmdline.
> 
> > 
> > Also, should I change the test definitions for all the other architectures?
> > It's not going to be possible for me to test all the changes.
> 
> We should be safe with an s/extra_params/qemu_params/ change for all
> architectures and CI is pretty good, so we'd have good confidence
> if it passes, but, I think we should keep extra_params as a qemu_params
> alias anyway since it's possible that people have wrapped kvm-unit-tests
> in test harnesses which generate unittests.cfg files.

Sounds good, split extra_params into test_args and qemu_params in all
unittests.cfg files, and keep extra_params as an alias for qemu_params.

I was thinking that maybe I should send that as a separate patch, to make
sure it gets the visibility it deserves from the other maintainers, instead
of it being buried in a 18 patch series. What do you think?

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
