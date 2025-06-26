Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB9C7EE30
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqoazZnbbx5eASOZcjdwjOeXvAlgfk1WCf8fSvG6B4c=; b=wFNVVXuUmHFMgo
	UHDMPxGYONiB03J3YbeZyhsWDyF7ZYNjKwxDyQ6TQl+sCbIx62wKh3HJlrE9+5hKI/1V5qirFcexl
	OV+Ns8237kovU1A03K2zXY/1dfLuA8WI8+qGzLezKt9wqEB29rhDs3G8tWnIEMfSV/deeKnTm+Xp+
	yYCMEQt+EluIbtikjvE9I3wHhZJ12+b9sItsfDbY1camz9ToHmgiBpQmCzUnvZMrdw/kH6+V0Xg7Z
	Dox0M+qAofHSgASxbWPEs8brVJvsTdVaF1Jk/LA1+ZUm/ddVnqZ0BZk3ja9YuGiemLWhjuFHxJaCf
	a8ldI1Rfqa+oLJI4VyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqnQ-0000000CPRQ-35fD;
	Thu, 26 Jun 2025 17:54:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpfs-0000000CIYr-0u2A
	for kvm-riscv@bombadil.infradead.org;
	Thu, 26 Jun 2025 16:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GZvWWn55QpukuTVv7Bqo3ivQLuTYYdxjF7fi6NCPLEI=; b=qLIe98fobxwR/7AWqguzo24Ld9
	DzJ4vqOg6eKK4mCsOd/whW7/C1wKzZHMDiQxlIPSroNS67Nb85fYcRD4VBy5wMl/YMp+5/9uJPfeR
	6xaNHwqqx+J1PMNTZpjuXou1gP5tc5Ph4FV406ipsWqw3A2y+iavqR9ciR++v2x4iBrHzQpm0CKG5
	HLRkF43BnEbmhitExWIoSouYDU0lXlfl7Zcxg0qXKW6nDR/3TI0iTploPpDF0mINK8qBgi+3lFzim
	bc07a1RgTXkFvjqoq6sP3rM02HJPnSU+rFLXSr4S8tRHYPE5yYTPN+C3+5sdmnD5JwAr6NGXfZttp
	7khoxatQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpfo-000000069ZG-3O4w
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 16:42:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C4361758;
	Thu, 26 Jun 2025 09:41:44 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90A683F66E;
	Thu, 26 Jun 2025 09:41:57 -0700 (PDT)
Date: Thu, 26 Jun 2025 17:41:54 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	oliver.upton@linux.dev, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
	shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 05/13] scripts: Add 'kvmtool_params' to
 test definition
Message-ID: <aF14UnQYBR9Knv4-@raptor>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
 <20250625154813.27254-6-alexandru.elisei@arm.com>
 <20250626-536c0af00aa655d6e647df44@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250626-536c0af00aa655d6e647df44@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_174205_155474_C054F2B0 
X-CRM114-Status: GOOD (  20.92  )
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

On Thu, Jun 26, 2025 at 05:34:05PM +0200, Andrew Jones wrote:
> On Wed, Jun 25, 2025 at 04:48:05PM +0100, Alexandru Elisei wrote:
> > arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
> > running and configuring a virtual machine is different to qemu. To run
> > tests using the automated test infrastructure, add a new test parameter,
> > 'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
> > but using kvmtool's syntax.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> > 
> > Changes v3->v4:
> > 
> > * Added params_name in scripts/common.bash::for_each_unittest() to avoid
> > checking for $TARGET when deciding to parse kvmtool_params or
> > {qemu,extra}_params.
> > * Dropped factoring out parse_opts() in for_each_unittest().
> > 
> >  arm/unittests.cfg   | 24 ++++++++++++++++++++++++
> >  docs/unittests.txt  |  8 ++++++++
> >  scripts/common.bash | 11 +++++++----
> >  scripts/vmm.bash    | 16 ++++++++++++++++
> >  4 files changed, 55 insertions(+), 4 deletions(-)
[..]
> > +function vmm_unittest_params_name()
> > +{
> > +	# shellcheck disable=SC2155
> > +	local target=$(vmm_get_target)
> > +
> > +	case "$target" in
> > +	qemu)
> > +		echo "extra_params|qemu_params"
> > +		;;
> > +	*)
> > +		echo "$0 does not support '$target'"
> > +		exit 2
> > +		;;
> 
> It seems a bit odd that we've introduced kvmtool_params and applied it to
> arm in this patch, but we still don't support it. Not a huge deal, though.

Originally it was part of a huge patch that added everything in one go, it
was this patch and the next 6 or 7 patches combined. The feedback I got at
the time was to split it into more manageable chunks, which is very
understandable. So this is how I ended up with this patch, to make the
series easier to digest.

> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks for the review!

Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
