Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A086606A320
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DaazUXr9;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kKrkgOt9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HnUHcuNWFMwV7iq0ZoOSKMKdCGnqQxrZluKx/jHdkyE=; b=DaazUXr91fA6KFH9eOk/hBPsZl
	d2cL2GFAp4/6VLxskznGusBXb9RYfnxs5Gi56nARyegGYpTfUjUoZQ06jKqgCSJ97fjEw35NmHZNK
	F9iUyZy3UIBl41hGvf4vOU3oVmOaCdIdj8fFPYWiPllPtGZu93nNhe+O8z07CpcX8zQhDH62E3zp8
	FEugRAT42OTr0cZ/jmXq+gRBxjQR1Kq7Z1VXbIwsC/C/OjnfelT1PGxPSNxL1NXVp+MGOalDZAl46
	rtqfnfGlYwNmRcGpDz8KnrEcCFqYWLQ2HXt1DrZIpJm3F1nd0l7qTDXw/fyKCrK15ZNCLci/WjP1z
	zZHzn2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjqP-00000009pjU-04Wt;
	Wed, 18 Nov 2026 17:53:17 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjqK-00000009phB-1lHI
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 17:53:15 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+m7k99GokHGG2Xt0WNDUpUu/POJp/u8hXMkzLb7HkPI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795024385; v=1; x=1795629185;
 b=kKrkgOt9Z0+Uxd0OLSeRAMXHHLAwszcLDUbKbF12OkJtRBtdtWKPCEIzYjNBS/HTPbsasfAS
 uB5YRPSbid1q4JNdkyBI3GN/ci90xJ1VOlf8DjQgJu1KHxicG+32bBCr18ovse2tMz48PwuBhzD
 9MA0algsT312UDIoJhrsXcmk=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 55e39e18abac30ad;
	Wed, 18 Nov 2026 17:53:05 +0000
X-Mizu-Trace-ID: 55e39e18abac30ad
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 18:52:30 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	Laurent Vivier <lvivier@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Nico =?utf-8?B?QsO2aHI=?= <nrb@linux.ibm.com>, 
	Chinmay Rath <rathc@linux.ibm.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: Re: [kvm-unit-tests PATCH] Move position-independant code flags into
 the target specific Makefiles
Message-ID: <av3l0ZC64ouIp4KN@orel>
References: <20261113120101.145183-1-thuth@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113120101.145183-1-thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095314_299323_5D861F42 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 01:01:01PM +0100, Thomas Huth wrote:
> The settings for position-independant code are currently quite a mess:
> It depends on the target whether we need the flags or rather should even
> disable PIC / PIE, but currently the settings are spread between the
> main Makefile (-fno-pic is the default, unless CONFIG_EFI has been set)
> and the target specific Makefiles.
> This leads to some weird situations where we have -fno-pic in the CFLAGS,
> but link with -pie in the LDFLAGS since we still want to get a relocation
> table, but then again need to add a "-z notext" to the linker flags to
> avoid warnings about relocation entries in the text segment.
> Let's face it: Always adding -fno-pic / -no-pie in the main Makefile is
> a bad idea. Move the settings to the target specific Makefiles instead
> where we know what we really want, and then we can finally drop the
> "-z notext" settings, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Makefile            | 6 +-----
>  arm/Makefile.arm    | 2 ++
>  arm/Makefile.arm64  | 3 +--
>  powerpc/Makefile    | 5 ++++-
>  riscv/Makefile      | 1 +
>  s390x/Makefile      | 3 +++
>  x86/Makefile.common | 5 +++++
>  7 files changed, 17 insertions(+), 8 deletions(-)
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
