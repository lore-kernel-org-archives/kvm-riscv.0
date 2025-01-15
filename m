Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D513C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfDEtzk+rQlRhHGG8tK4XI/WKy+ZaAMbPR0zj/vrdvo=; b=K08VcX90Y+0Xmi
	SExyFK8lbn6krXIJkO9EtllgBQPFKBB5Ogt1V4yL4swA8kb3pRYDl+rgPPr57cUp4shgXntblKS1J
	pgVhoUSEUlcQETFBW0CsXdOe2jyy2wp2SvbOJlJqQNLjmmOFGirZuSbhDlij35dk0jXTPqXyi8sSt
	q0TIY89m3BikGqIr12w7bB35JFlh+dbfQTgzb1gArvr1F0ZGDxoXvIvnSbuYGDhSRBBcYBym/jA4v
	S3F7rUYwonNfS9XI0II5PSvroeSMQ+94SwD4bdt2UnXf0TE3PBofL/Ua5OmIS8vBtBKvdFAA/uvzU
	E9fRdrfBlx6ogTWC+CTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY08J-0000000BQ8K-0g4l;
	Wed, 15 Jan 2025 09:56:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY08G-0000000BQ7w-3fkH
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:56:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69D6E12FC;
	Wed, 15 Jan 2025 01:56:44 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AAD23F51B;
	Wed, 15 Jan 2025 01:56:12 -0800 (PST)
Date: Wed, 15 Jan 2025 09:56:09 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <Z4eGOfDjz7RS8pBq@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
 <Z4aY2AKSaxKDY5Hq@arm.com>
 <20250114-10fb4c9302167ef202e98713@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114-10fb4c9302167ef202e98713@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_015616_958862_96E531E8 
X-CRM114-Status: GOOD (  10.09  )
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

On Tue, Jan 14, 2025 at 07:39:49PM +0100, Andrew Jones wrote:
> On Tue, Jan 14, 2025 at 05:03:20PM +0000, Alexandru Elisei wrote:
> ...
> > diff --git a/configure b/configure
> > index 86cf1da36467..1362b68dd68b 100755
> > --- a/configure
> > +++ b/configure
> > @@ -15,8 +15,8 @@ objdump=objdump
> >  readelf=readelf
> >  ar=ar
> >  addr2line=addr2line
> > -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> > -host=$arch
> > +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> > +arch=$(echo $host | sed -e 's/aarch64/arm64/')
> 
> Sure, or avoid the second sed and just do
> 
> host=$(...)
> arch=$host
> [ "$arch" = "aarch64" ] && arch="arm64"

Yep, thanks.

Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
