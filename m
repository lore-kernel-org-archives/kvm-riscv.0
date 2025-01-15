Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8C2C02183
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmoYK/0pruVQcDmF5wMhb26SLWszZh9Vn0B4TKpubDk=; b=2m+dZ+bNfYGTWZ
	+hSPHEQJKqSxLxGcekealZobglnEMjR1C+Hw8mh8UXGZjKd85Db5OlZmjd8DirE1ZH2gr7foTLYM1
	BBi0iNBlJU3Hb0rCO2B5YpMpYuGrjbM4m8wFPUHnSXElr8PQu1D778UgE6p1XXsIOaiP25kDhmswC
	UDZJcUe43Oo0IamKbORMkp11Oo19y+JgQMi5CPCyuSP+VrHj/bmN0Z4b9v040JdzErUE/sKH/oQtq
	x4S8VlpoqX6gwm61Se/MOCWK1oC46QDec7gvGu1TzMNt+gpgqiLtd5OUkB3d2oE1FsOyV50oISFtZ
	FlAW8ZudDBKtnYZd2Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1AP-0000000Bb5T-1NrB;
	Wed, 15 Jan 2025 11:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY07T-0000000BQ3F-36UY
	for kvm-riscv@bombadil.infradead.org;
	Wed, 15 Jan 2025 09:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rT32sodiwTBuZaDBSI6rgB1m4++QP8tHXloSXLLwdvs=; b=eC5YzR90LY6V5TFjPX3SbJcAV1
	IKmiMPrXILkkmCzc0l5lHGGh8UJKZ5UOWNdRwOOcKy3moOkJB2y2wkmSrKmuREq+6A91uuvUylsVz
	XIWx50XDglX/euiiywMghNzOJh+Ehxra0o0W2LoRPLjHfWsNP/mk+fHwAe8a2Lv9WPn74sw0ovKb3
	pO+9fsRZz2by0+hjhk8LJRcHOF5fvlFqmMvjo30ipKspYC/yR0W1FMFci79dZ+uYxSI/YvZ/GdXjU
	C+oJm3rxprj3vajHajPopidue7Vj28drE2ji+iAZuHP6DiDqDsVS61RcuuNoJgJWCLFQ8EYHsRTyY
	267M3fGw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY07Q-0000000ApkM-0K7F
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:55:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD09212FC;
	Wed, 15 Jan 2025 01:55:49 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680D23F51B;
	Wed, 15 Jan 2025 01:55:18 -0800 (PST)
Date: Wed, 15 Jan 2025 09:55:14 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <Z4eGAl7kah6vfHle@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
 <20250113-45b57478be2241a35ffa1b67@orel>
 <Z4acKHEn/dE0yLM2@arm.com>
 <20250114-a36510d222fc3410b9b7654e@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114-a36510d222fc3410b9b7654e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_095524_528561_8634619A 
X-CRM114-Status: GOOD (  31.28  )
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

On Tue, Jan 14, 2025 at 07:51:04PM +0100, Andrew Jones wrote:
> On Tue, Jan 14, 2025 at 05:17:28PM +0000, Alexandru Elisei wrote:
> ...
> > > > +# $arch will have changed when cross-compiling.
> > > > +[ -z "$processor" ] && processor=$(get_default_processor $arch)
> > > 
> > > The fact that $arch and $processor are wrong until they've had a chance to
> > 
> > $processor is never wrong. $processor is unset until either the user sets it
> > with --processor, or until this line. This patch introduces $default_processor
> > only for the purpose of having an accurate help text, it doesn't change when and
> > how $processor is assigned.
> 
> I should have said "The fact that $arch and $default_processor are wrong..."
> 
> > 
> > > be converted might be another reason for the $do_help idea. But it'll
> > > always be fragile since another change that does some sort of conversion
> > > could end up getting added after the '[ $do_help ] && usage' someday.
> > 
> > configure needs to distinguish between:
> > 
> > 1. The user not having specified --processor when doing ./configure.
> > 2. The user having set --processor.
> > 
> > If 1, then kvm-unit-tests can use the default $processor value for $arch,
> > which could have also been specified by the user.
> > 
> > If 2, then kvm-unit-tests should not touch $processor because that's what the
> > user wants.
> > 
> > Do you see something wrong with that reasoning?
> 
> If we output $default_processor in usage() before it's had a chance to be
> set correctly based on a given cross arch, then it won't display the
> correct name.
> 
> > 
> > Also, I don't understand why you say it's fragile, since configure doesn't
> 
> I wrote "it'll always be fragile" where 'it' refers to the most recent
> object of my paragraph ("the $do_help idea"). But, TBH, I'm not sure
> how important it is to get the help text accurate, so we can just not
> care if we call usage() with the wrong strings sometimes.

Got it now, thanks for explaining it.

My opinion is that a help text is there to help the user, and in my experience
an inaccurate help text can be very frustrating - think comments that say
one thing, and the code does something else.

How about this:

diff --git a/configure b/configure
index 3ab0ec208e10..5dbe189816b2 100755
--- a/configure
+++ b/configure
@@ -51,7 +51,6 @@ page_size=
 earlycon=
 efi=
 efi_direct=
-default_processor=$(get_default_processor $arch)

 # Enable -Werror by default for git repositories only (i.e. developer builds)
 if [ -e "$srcdir"/.git ]; then
@@ -61,13 +60,14 @@ else
 fi

 usage() {
+    [ -z "$processor" ] && processor=$(get_default_processor $arch)
     cat <<-EOF
        Usage: $0 [options]

        Options include:
            --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
                                   arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
-           --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
+           --processor=PROCESSOR  processor to compile for ($processor). For arm and arm64, the
                                   value 'max' is special and it will be passed directly to
                                   qemu, bypassing the compiler. In this case, --cflags can be
                                   used to compile for a specific processor.

Should be accurate enough, as far as I can tell. And I don't think there's
a need for $do_help: if the user does ./configure --help --arch=arm64, then
I think it's reasonable to expect that --help will be interpreted before
--arch is parsed.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
