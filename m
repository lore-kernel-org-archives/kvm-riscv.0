Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2571C02183
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dvs6NQ04Mf7uIu+T4uFdoyBqgYtMQbyKxxsiIfWMQpM=; b=rPRPkGJWwFGg9G
	1o37Bik94YA8v9xr2SQeEYauZHmVrXeDnT8OVCGwbKAk9Upy1k+PkPyl7MIxLrzlsC0vsmEZRt5LS
	Oulgsp/oiFrJGETA5rpSZ3z1QTnYbKloEPtytqrgariO5EOR5SZD1YuFHMaNaItHg0YwfFZ/mxK62
	l8uRBI3l+UpFJ6CUtl8j6nttzqycGSHTcO1hCRslLMizXI/Z6H/RLuhDFMbhd89rV4G2mPOHrSy38
	tLwofdnR9KxYsBQv2QzHnbgfTDN0xNcSWlPfvm+/RvrJqOzrswSy5Mdp+sBOnBNUQSJ84VW0TNHiR
	9tlyDBSuqqy1DC2MjTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkXq-00000009ALB-0TZL;
	Tue, 14 Jan 2025 17:17:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkXn-00000009AK4-2ciY
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:17:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D06512FC;
	Tue, 14 Jan 2025 09:18:03 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8E03F673;
	Tue, 14 Jan 2025 09:17:31 -0800 (PST)
Date: Tue, 14 Jan 2025 17:17:28 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <Z4acKHEn/dE0yLM2@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
 <20250113-45b57478be2241a35ffa1b67@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113-45b57478be2241a35ffa1b67@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_091735_748988_BAFF2D62 
X-CRM114-Status: GOOD (  26.34  )
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

On Mon, Jan 13, 2025 at 04:11:06PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:45PM +0000, Alexandru Elisei wrote:
> > The help text for the --processor option displays the architecture name as
> > the default processor type. But the default for arm is cortex-a15, and for
> > arm64 is cortex-a57. Teach configure to display the correct default
> > processor type for these two architectures.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 30 ++++++++++++++++++++++--------
> >  1 file changed, 22 insertions(+), 8 deletions(-)
> > 
> > diff --git a/configure b/configure
> > index 5b0a2d7f39c0..138840c3f76d 100755
> > --- a/configure
> > +++ b/configure
> > @@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
> >      exit 1
> >  fi
> >  
> > +function get_default_processor()
> > +{
> > +    local arch="$1"
> > +
> > +    case "$arch" in
> > +    "arm")
> > +        default_processor="cortex-a15"
> > +        ;;
> > +    "arm64" | "aarch64")
> > +        default_processor="cortex-a57"
> > +        ;;
> > +    *)
> > +        default_processor=$arch
> > +    esac
> > +
> > +    echo "$default_processor"
> > +}
> > +
> >  srcdir=$(cd "$(dirname "$0")"; pwd)
> >  prefix=/usr/local
> >  cc=gcc
> > @@ -33,6 +51,7 @@ page_size=
> >  earlycon=
> >  efi=
> >  efi_direct=
> > +default_processor=$(get_default_processor $arch)
> >  
> >  # Enable -Werror by default for git repositories only (i.e. developer builds)
> >  if [ -e "$srcdir"/.git ]; then
> > @@ -48,7 +67,7 @@ usage() {
> >  	Options include:
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> > -	    --processor=PROCESSOR  processor to compile for ($arch)
> > +	    --processor=PROCESSOR  processor to compile for ($default_processor)
> >  	    --target=TARGET        target platform that the tests will be running on (qemu or
> >  	                           kvmtool, default is qemu) (arm/arm64 only)
> >  	    --cross-prefix=PREFIX  cross compiler prefix
> > @@ -283,13 +302,8 @@ else
> >      fi
> >  fi
> >  
> > -[ -z "$processor" ] && processor="$arch"
> > -
> > -if [ "$processor" = "arm64" ]; then
> > -    processor="cortex-a57"
> > -elif [ "$processor" = "arm" ]; then
> > -    processor="cortex-a15"
> > -fi
> > +# $arch will have changed when cross-compiling.
> > +[ -z "$processor" ] && processor=$(get_default_processor $arch)
> 
> The fact that $arch and $processor are wrong until they've had a chance to

$processor is never wrong. $processor is unset until either the user sets it
with --processor, or until this line. This patch introduces $default_processor
only for the purpose of having an accurate help text, it doesn't change when and
how $processor is assigned.

> be converted might be another reason for the $do_help idea. But it'll
> always be fragile since another change that does some sort of conversion
> could end up getting added after the '[ $do_help ] && usage' someday.

configure needs to distinguish between:

1. The user not having specified --processor when doing ./configure.
2. The user having set --processor.

If 1, then kvm-unit-tests can use the default $processor value for $arch,
which could have also been specified by the user.

If 2, then kvm-unit-tests should not touch $processor because that's what the
user wants.

Do you see something wrong with that reasoning?

Also, I don't understand why you say it's fragile, since configure doesn't
touch $processor until this point (and unless the user sets it, of course).

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
