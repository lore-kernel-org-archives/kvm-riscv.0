Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A0C35FFC
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UBPNE4xy9Bvu7sOSWyZqsfcGjV4M4+/Cw7HPlnCE8Y=; b=uoYiWfb5KvY5qZ
	pnsbCKkQrEeTuEXNTiVtJVuu7odUZl1rmqknMz7RrYEoYJrqioXy7wzsokFmY/cUP1mySo+BghNef
	32ePO0j1VQEOpdNrcJVqU/eIMgbKtdwI70TgKMfBlR1U4DCG5/bKTKytwfllsJytZEN+dGG2NSfsK
	kTyAXaxf2LrtsukgnnUycL2rHd+goSaqQC5cNNGAdJx9ZqGzCf8dWG8EeAvoJHzcFDBvqw0s5fyWg
	m6/Ka1hKoAx+NBLbcp+vnUoALUiS5PFMLGpBUfp/4JlKqjUNnnfBsfB4I/bApBn0qhSwWf9bPRJ4m
	mF8b9jbYYuGJH7WoSwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwyZ-0000000HKij-2vHf;
	Sat, 22 Mar 2025 11:25:15 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwyW-0000000HKiD-3iBa
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 11:25:14 +0000
Date: Sat, 22 Mar 2025 12:25:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742642710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkm0wuie4+J7Oy46hCMinD5wTVCsPYzKlHvlkij180U=;
	b=w8tD0vKSU1lQJ9NP40XB9yM0wVGnZ6HrC0Eolf/SvvqAyYTx585fgc/mUSp24IVCwCEJfb
	Vp/WCEYtHpAIMZ90MziuFkZJRN3151g4GRn0kALI3aQU4zeLGL5lKmJUuCUI3zmz7bk61e
	FqtAWwc9sypScHd0/FINLxpt3RfZuFU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	eric.auger@redhat.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Message-ID: <20250322-f2d94472d7ebc003a54d7a9d@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-6-jean-philippe@linaro.org>
 <Z9wbKfRJ7P0tms6L@raptor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9wbKfRJ7P0tms6L@raptor>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_042513_214450_9FF5555B 
X-CRM114-Status: GOOD (  18.66  )
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

On Thu, Mar 20, 2025 at 01:42:01PM +0000, Alexandru Elisei wrote:
...
> >  mach=$MACHINE_OVERRIDE
> > -processor=$PROCESSOR_OVERRIDE
> > +qemu_cpu=$QEMU_CPU_OVERRIDE
> 
> The name QEMU_CPU_OVERRIDE makes more sense, but I think this will break
> existing setups where people use PROCESSOR_OVERRIDE to pass a particular
> -cpu value to qemu.
> 
> If I were to guess, the environment variable was added to pass a value to
> -cpu different than what it can be specified with ./configure --processor,
> which is exactly what --qemu-cpu does. But I'll let Drew comment on that.

Yeah, ideally we wouldn't rename environment variables, but I'll cross my
fingers that nobody will notice. Indeed, it was created to avoid needing
to reconfigure for experimenting with different QEMU cpu models, so, even
with --qemu-cpu we'll want something and the renaming here makes sense.

> 
> >  firmware=$FIRMWARE_OVERRIDE
> >  
> > -[ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
> > +[ -z "$QEMU_CPU" ] && QEMU_CPU="max"
> >  : "${mach:=virt}"
> > -: "${processor:=$PROCESSOR}"
> > +: "${qemu_cpu:=$QEMU_CPU}"
> >  : "${firmware:=$FIRMWARE}"
> >  [ "$firmware" ] && firmware="-bios $firmware"
> >  
> > @@ -32,7 +32,7 @@ fi
> >  mach="-machine $mach"
> >  
> >  command="$qemu -nodefaults -nographic -serial mon:stdio"
> > -command+=" $mach $acc $firmware -cpu $processor "
> > +command+=" $mach $acc $firmware -cpu $qemu_cpu "
> >  command="$(migration_cmd) $(timeout_cmd) $command"
> >  
> >  if [ "$UEFI_SHELL_RUN" = "y" ]; then
> > diff --git a/configure b/configure
> > index 5306bad3..d25bd23e 100755
> > --- a/configure
> > +++ b/configure
> > @@ -52,6 +52,7 @@ page_size=
> >  earlycon=
> >  efi=
> >  efi_direct=
> > +qemu_cpu=
> >  
> >  # Enable -Werror by default for git repositories only (i.e. developer builds)
> >  if [ -e "$srcdir"/.git ]; then
> > @@ -69,6 +70,8 @@ usage() {
> >  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> >  	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> >  	    --processor=PROCESSOR  processor to compile for ($processor)
> > +	    --qemu-cpu=CPU         the CPU model to run on. The default depends on
> > +	                           the configuration, usually it is "host" or "max".
> 
> Nitpick here, would you mind changing this to "The default value depends on
> the host system and the test configuration [..]", to make it clear that it also
> depends on the machine the tests are being run on?

I agree.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
