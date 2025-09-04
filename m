Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8592CA1002
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs0/Xs66RooubFRt+6G01Dz2znwhYF21/6BE3xhIQDI=; b=Txa2jfb02wQCIM
	TCreQjL9q5qWZOC9VxRnruYeRej4LzgW0zxtiWum6PYRA5j/yuVWm0GKeTBou3Aolmv7PCTtD4Cgy
	TCUoKKECEGqyBvOU1SAp6S8VS33U7lP2MCpyds6eK4iovWPZsy/vBLdhHApX2oLkVYiRCYPnebPdQ
	4U33PQp4KRbQZR4BellWJ51trwI6cvV8SWkpjhmEXjidg/wDymrqXITKZxXECr9zMDkSJ161zYsHN
	eASaNBfKBqaUrNbqS9WraPDQnYLB24GbDSZqjpq2tC4ExKCzY2lUKyZWiBaCIA4zR/3JLYsoTlRmC
	gRA4DKebMEIFdmDvSrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6H-0000000G5Dx-1Fy9;
	Fri, 05 Sep 2025 02:22:53 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIHQ-0000000EoSE-05fb
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 22:18:09 +0000
Date: Thu, 4 Sep 2025 17:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757024273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o98fAs74wpnvUXiwkAwDMwEWd/kcAqQMte0bpKFWiko=;
	b=nX3Gfj2kXRPfwQPEE27HiGhKaiOTA2/FgvfCJQFGs2CNZFx6nKfXeTl23LM8r9fItUjWQ9
	km5GJHPMic9N0hMauKs4e00TzxLT8YX7boXNr9ZmUQRYJxOUCNaUwHcnj/drwvOv9tPHYZ
	UwPKMdShiZO79KhHcts3puW/P9EYAhg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Joel Stanley <joel@jms.id.au>
Cc: kvm-riscv@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, 
	Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
Subject: Re: [kvm-unit-tests] riscv build failure
Message-ID: <20250904-11ba6fa251f914016170c0e4@orel>
References: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_151808_463077_868D1E8C 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, Sep 04, 2025 at 08:57:54AM +0930, Joel Stanley wrote:
> I'm building kvm-unit-tests as part of buildroot and hitting a build
> failure. It looks like there's a missing dependency on
> riscv/sbi-asm.S, as building that manually fixes the issue. Triggering
> buildroot again (several times) doesn't resolve the issue so it
> doesn't look like a race condition.
> 
> I can't reproduce with a normal cross compile on my machine. Buildroot
> uses make -C, in case that makes a difference.
> 
> The build steps look like this:
> 
> bzcat /localdev/jms/buildroot/dl/kvm-unit-tests/kvm-unit-tests-v2025-06-05.tar.bz2
> | /localdev/jms/buildroot/output-riscv-rvv/host/bin/tar
> --strip-components=1 -C
> /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
>   -xf -
> cd /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> && ./configure --disable-werror --arch="riscv64" --processor=""
> --endian="little"
> --cross-prefix="/localdev/jms/buildroot/output-riscv-rvv/host/bin/riscv64-buildroot-linux-gnu-"
> GIT_DIR=. PATH="/localdev/jms/buildroot/output-riscv-rvv/host/bin:/localdev/jms/buildroot/output-riscv-rvv/host/sbin:/home/jms/.local/bin:/home/jms/bin:/home/jms/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> /usr/bin/make -j385  -C
> /localdev/jms/buildroot/output-riscv-rvv/build/kvm-unit-tests-2025-06-05
> standalone

I applied similar steps but couldn't reproduce this. It also looks like we
have a dependency because configuring with '--cc=/path/to/mygcc', where
mygcc is

   #!/bin/bash
   for x in $@; do
       if [[ $x =~ sbi-asm ]] && ! [[ $x =~ sbi-asm-offsets ]]; then
           sleep 5
           break
       fi
   done
   /path/to/riscv64-linux-gnu-gcc $@

stalls the build 5 seconds when compiling sbi-asm.S but doesn't reproduce
the issue. That said, running make with -d shows that riscv/sbi-asm.o is
an implicit prerequisite, although so are other files. I'm using
GNU Make 4.4.1. Which version are you using?

Also, while the steps above shouldn't cause problems, they are a bit odd
 * '--endian' only applies to ppc64
 * -j385 is quite large and specific. Typicall -j$(nproc) is recommended.
 * No need for '-C "$PWD"'

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
