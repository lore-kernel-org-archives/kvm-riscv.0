Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496A5C19F32
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShqnfHaL6AHZmSS1/xLnrbuNWmNgmPwhA7Mi1K8UhIs=; b=AF4MvwOd++iAJa
	5/ozeP+fL5ZfA4IZBlUZEHM/Vat9bfKrx2JlGkUdzvKaGKdVglAQQClx5h7bzn6sR3uaBadkMDfyi
	PYG60ifMU3IGcCdHR1xhM0E1sTq29NkZQ5jJAtsXMUoMipND7NfCYMLESlkx14za3Wkynq3ZYZjPd
	W0E9o/DeUintkcgJVg3cOeUq79HCBjkOW6ENnCQGubjxiFeG/TQNMNJ3c1KSOgdMMHuI4/j+BPIj9
	d5KrIzChYkS/7+7jRtN+vxGKlQuCHMngvx3CIT/4XxG3VNlRoymi/0A1O9axWfPSoadDkUSkM8xmg
	CkW1FEcbiL7YvjieRhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTL2-0000000DbW7-0CMa;
	Fri, 07 Mar 2025 08:45:48 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTL0-0000000DbVM-0PGs
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:45:47 +0000
Date: Fri, 7 Mar 2025 09:45:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741337143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kz7tr3Ef4wRK05z0FEwMWNGvCaeHxB4UKfPnpbiiwqw=;
	b=c0U+srwrdTCvXelYlglJHrB+xNHlSsaPkftQptchw3kBq2mcWH0laSgUJd9NI8xpRCw5RL
	HPnrvN6Ls7xPWYjkrH0453InwYF+4w5Hc7P/GBp1ns1alCRkIBkutpXKq6qO4A1vOxEG2T
	Axzw8+2NADScVKg8Smqf+CZZwmg+GHA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, alexandru.elisei@arm.com, eric.auger@redhat.com, 
	lvivier@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com
Subject: Re: [kvm-unit-tests PATCH] Makefile: Use CFLAGS in cc-option
Message-ID: <20250307-7a4556045a53c51e3150da2f@orel>
References: <20250307083952.40999-2-andrew.jones@linux.dev>
 <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c0bd772-0132-4053-bd22-aac88a8dcfee@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_004546_292686_41C88324 
X-CRM114-Status: GOOD (  14.57  )
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

On Fri, Mar 07, 2025 at 09:42:03AM +0100, Thomas Huth wrote:
> On 07/03/2025 09.39, Andrew Jones wrote:
> > When cross compiling with clang we need to specify the target in
> > CFLAGS and cc-option will fail to recognize target-specific options
> > without it. Add CFLAGS to the CC invocation in cc-option.
> > 
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >   Makefile | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 78352fced9d4..9dc5d2234e2a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
> >   # cc-option
> >   # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
> > -cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
> > +cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
> >                 > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
> >   libcflat := lib/libcflat.a
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, but I just found out that I was too hasty with this patch. I broke
x86,

/builds/jones-drew/kvm-unit-tests/x86/Makefile.common:105: *** Recursive variable 'CFLAGS' references itself (eventually).  Stop.

I'll try to sort that out and send a v2.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
