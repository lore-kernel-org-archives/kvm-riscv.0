Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E7BC02183
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsFHrfh/4xB+3BrWLIL1E4oXRwbrHtWRMleKuePi1dA=; b=ukx6pVOPuEnKj6
	ZQR+kjIWwUvKAiafkal7YuPiLKVQE/PSZQ80oUt7x8MMo4ZN+KaJ6CvjyYW+tJZrjdyKfFjjsIBms
	JtLp6YF10Hl9CQv3IZyeJ3ywWan8hkzU4yT9tXu+haNCEv6J/PCjw84klU5OYYjbsjV6yhkRrvQWB
	Cw/ge+trOWRuevttgrmGm50LN8zsIfKlLlSXFkGLFh/G4m+q1dWPIsTo6hddfWVo+MOwWK8E9c1Yx
	Yf90UKJo6UG3iZ5sAibes3G72U5U2QoRvEQMgS7YE3VxSUmQ4U36zo/QFchmzoG3dBFq4ZkDyTR+U
	KAe6QMsGNezDMLRWZVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkKE-000000097eh-3qhp;
	Tue, 14 Jan 2025 17:03:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkKC-000000097eM-1kvH
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:03:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33DF012FC;
	Tue, 14 Jan 2025 09:03:57 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 610723F673;
	Tue, 14 Jan 2025 09:03:25 -0800 (PST)
Date: Tue, 14 Jan 2025 17:03:20 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <Z4aY2AKSaxKDY5Hq@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113-0fe04c6089726d1d06a254ec@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_090332_548971_A0D22805 
X-CRM114-Status: GOOD (  32.42  )
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

On Mon, Jan 13, 2025 at 04:01:58PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:44PM +0000, Alexandru Elisei wrote:
> > $arch, on arm64, defaults to 'aarch64', and later in the script is replaced
> > by 'arm64'. Intentional or not, document that the name 'aarch64' is also
> > supported when configuring for the arm64 architecture. This has been the
> > case since the initial commit that added support for the arm64
> > architecture, commit 39ac3f8494be ("arm64: initial drop").
> > 
> > The help text for --arch changes from*:
> > 
> >    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
> >                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > 
> > to:
> > 
> >     --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
> >                            arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > 
> > *Worth pointing out that the default architecture is 'aarch64', even though
> > the rest of the help text doesn't have it as one of the supported
> > architectures.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 86cf1da36467..5b0a2d7f39c0 100755
> > --- a/configure
> > +++ b/configure
> > @@ -47,7 +47,7 @@ usage() {
> >  
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> > -	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > +	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >  	    --processor=PROCESSOR  processor to compile for ($arch)
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> > -- 
> > 2.47.1
> >
> 
> I'd prefer to support --arch=aarch64, but then always refer to it as only
> arm64 everywhere else. We need to support arch=aarch64 since that's what
> 'uname -m' returns, but I don't think we need to change the help text for
> it. If we don't want to trust our users to figure out arm64==aarch64,

I sincerely dislike the fact that in the help text the default architecture on
arm64 is not among the list of supported architectures.

> then we can do something like
> 
> @@ -216,12 +197,12 @@ while [[ $optno -le $argc ]]; do
>             werror=
>             ;;
>         --help)
> -           usage
> +           do_help=1
>             ;;
>         *)
>             echo "Unknown option '$opt'"
>             echo
> -           usage
> +           do_help=1
>             ;;
>      esac
>  done
> 
> And then only do
> 
>  if [ $do_help ]; then
>     usage
>  fi
> 
> after $arch and other variables have had a chance to be converted.

That still doesn't work if displaying the help text on an arm64 board:
$arch=aarch64 if compiling natively, because that's what uname -m prints, and
$arch gets converted to 'arm64' later in the script. We could move the
conversion before calling usage, but at that point I wonder if it wouldn't be
better to never set $arch to 'aarch64' in the first place.

If you don't want to modify the help text to say that aarch64 is supported, even
though it's displayed as the default architecture on arm64, we could modify
$arch to never be set to 'aarch64', i.e:

diff --git a/configure b/configure
index 86cf1da36467..1362b68dd68b 100755
--- a/configure
+++ b/configure
@@ -15,8 +15,8 @@ objdump=objdump
 readelf=readelf
 ar=ar
 addr2line=addr2line
-arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
-host=$arch
+host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
+arch=$(echo $host | sed -e 's/aarch64/arm64/')
 cross_prefix=
 endian=""
 pretty_print_stacks=yes

and keep the conversion from aarch64 to arm64 where it is, and still keep it
undocumented, just in case someone is using that.

($host still needs to be aarch64, because that's the name of the qemu
executable).

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
