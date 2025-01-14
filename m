Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F1E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsIQy99iAFs2bTT6bHDEgixGCwoqwelUHVXZt/uso+s=; b=naCmOW0l70ase9
	XiWARw6i/eVeMbRZvPd/sujaV+W+MaKNe0XPwTCvo3QXkYqmv8wPJ6p8iT6n0be7w469QgXCTKW73
	CcCBhkiuuJbJ5urEyqEM4g1C1DXEDJXFQ07ZW9NJaw105EpG/qx814N6LPn3TvjC/9Q52y1yoFW32
	ypqSldqho5AxRht4KP0j3FF/Uq/BPA5I1V1S7wMjEaSi7IUbtjNgriZYpFUZy0c9pe5kb0zdBM66h
	0WjAC/Lk6I0K3ZT1MFjifPLLW8sW/eiwvecIaRX9SR/Jl+IiBClpD9pCI0tscoK5/SAsMLWeMF5Tt
	SSuh7nTB4QLDOreFisbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkaV-00000009Am3-1Ak4;
	Tue, 14 Jan 2025 17:20:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkaT-00000009AlV-0Ngm
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:20:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5EA12FC;
	Tue, 14 Jan 2025 09:20:48 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6240D3F673;
	Tue, 14 Jan 2025 09:20:17 -0800 (PST)
Date: Tue, 14 Jan 2025 17:20:13 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for
 --processor=max
Message-ID: <Z4aczXTAVxxkuOhA@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-5-alexandru.elisei@arm.com>
 <20250113-8711bc93ade1e8c83dfe3582@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113-8711bc93ade1e8c83dfe3582@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_092021_221459_3CD979BE 
X-CRM114-Status: GOOD (  35.01  )
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

On Mon, Jan 13, 2025 at 04:21:45PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:47PM +0000, Alexandru Elisei wrote:
> > For arm64, newer architecture features are supported only on newer CPUs.
> > Instead of expecting the user to know which CPU model supports which
> > feature when using the TCG accelerator for qemu, let's make it easier and
> > add support for the --processor 'max' value.
> > 
> > The --processor value is passed to the compiler's -mcpu argument and to
> > qemu's -cpu argument. 'max' is a special value that only qemu understands -
> > it means that all CPU features that qemu implements are supported by the
> > guest CPU, and passing it to the compiler causes a build error. So omit the
> > -mcpu argument when $PROCESSOR=max.
> > 
> > This affects only the TCG accelerator; when using KVM or HVF,
> > kvm-unit-tests sets the cpu model to 'host'.
> > 
> > Note that using --processor=max with a 32 bit compiler will cause a build
> > error: the CPU model that the compiler defaults to when the -mcpu argument
> > is missing lacks support for some of the instructions that kvm-unit-tests
> > uses. The solution in the case is to specify a CPU model for the compiler
> > using --cflags:
> > 
> >   ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>
> > 
> > This patch doesn't introduce a regression for arm when --processor=max is
> > used, it's only the error that changes: from an unknown processor type to
> > using instructions that are not available on the processor.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  arm/Makefile.common | 2 ++
> >  configure           | 5 ++++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arm/Makefile.common b/arm/Makefile.common
> > index a5d97bcf477a..b757250dc9ae 100644
> > --- a/arm/Makefile.common
> > +++ b/arm/Makefile.common
> > @@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
> >  # stack.o relies on frame pointers.
> >  KEEP_FRAME_POINTER := y
> >  
> > +ifneq ($(PROCESSOR),max)
> >  CFLAGS += -mcpu=$(PROCESSOR)
> > +endif
> >  CFLAGS += -std=gnu99
> >  CFLAGS += -ffreestanding
> >  CFLAGS += -O2
> > diff --git a/configure b/configure
> > index 138840c3f76d..46964d36a7d8 100755
> > --- a/configure
> > +++ b/configure
> > @@ -67,7 +67,10 @@ usage() {
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > -	    --processor=PROCESSOR  processor to compile for ($default_processor)
> > +	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
> > +	                           value 'max' is special and it will be passed directly to
> > +	                           qemu, bypassing the compiler. In this case, --cflags can be
> > +	                           used to compile for a specific processor.
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > -- 
> > 2.47.1
> >
> 
> I don't think we want to overload processor this way. While mcpu and QEMU
> could both understand the same cpu names, then it was mostly fine
> (although it probably shouldn't have been overloaded before either). Now
> that we want one name for compiling and another for running, then I think
> we need another configure parameter, something like --qemu-cpu.

I agree, that's a better approach than overloading --processor. I'll try that
for the next iteration.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
