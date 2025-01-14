Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEDBC02183
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 17:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+H7ldIGeWiXGHLYJolKSnxmbiIlBPyCqGKXV391mUE=; b=g20FFgx6Vb42rx
	4S1lwf+p5k78jTlbgjCkzUIpJteoiERBrtbithzXwIcyvBZLWHM85Uir2QTAmgJhIzKugO6Kv3tGc
	qV7jivUBp6YfI5GjZ5I5Gm/4nAQEaRNQB7xa3P5iIAhjpG/yncxwnU3in+YN5Hn9qU8TFVP6ApjdJ
	bJay8uKwkIi3Wo1BIFv2UWFfGBzQv4J+WwPKNyOpnSf0KQl5SRjx5f7vHjtllPOsP5m1w4FJsSeRO
	B3bhnD2Th/5W/wE2s1JYvI5zov1rvcK6jNMEYRs078xR+WSAr+q8u+aKLNrL557w4mdQCCoNB8BNk
	ujj8hToD1IhdvguJiMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkb7-00000009Awz-2Yxn;
	Tue, 14 Jan 2025 17:21:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkb5-00000009Aw1-0b4T
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 17:21:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C27D12FC;
	Tue, 14 Jan 2025 09:21:27 -0800 (PST)
Received: from arm.com (e134078.arm.com [10.32.102.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6FEA3F673;
	Tue, 14 Jan 2025 09:20:55 -0800 (PST)
Date: Tue, 14 Jan 2025 17:20:52 +0000
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
	david@redhat.com, pbonzini@redhat.com, kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the
 default for --processor
Message-ID: <Z4ac9BcP2iHldv/L@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-6-alexandru.elisei@arm.com>
 <20250113-f6e1c55d5200410161aa61b5@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250113-f6e1c55d5200410161aa61b5@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_092059_224973_7CAE315F 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, Jan 13, 2025 at 04:29:21PM +0100, Andrew Jones wrote:
> On Fri, Jan 10, 2025 at 01:58:48PM +0000, Alexandru Elisei wrote:
> > Newer architecture features are supported by qemu TCG on newer CPUs. When
> > writing a test for such architecture features, it is necessary to pass the
> > correct -cpu argument to qemu. Make it easier on users and test authors
> > alike by making 'max' the default value for --processor. The 'max' CPU
> > model contains all the features of the cortex-a57 CPU (the old default), so
> > no regression should be possible.
> > 
> > A side effect is that, by default, the compiler will not receive a -mcpu
> > argument for compiling the code. The expectation is that this is fine,
> > since support for -mcpu=$PROCESSOR has only been added for arm64 in the
> > last commit.
> > 
> > The default for arm (cortex-a15) has been kept unchanged, because passing
> > --processor=max will cause compilation to break. If the user wants the qemu
> > CPU model to be 'max', the user will also have to supply a suitable compile
> > CPU target via --cflags=-mcpu=<cpu> configure option.
> > 
> > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > ---
> >  configure | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/configure b/configure
> > index 46964d36a7d8..3ab0ec208e10 100755
> > --- a/configure
> > +++ b/configure
> > @@ -14,7 +14,7 @@ function get_default_processor()
> >          default_processor="cortex-a15"
> >          ;;
> >      "arm64" | "aarch64")
> > -        default_processor="cortex-a57"
> > +        default_processor="max"
> >          ;;
> >      *)
> >          default_processor=$arch
> > -- 
> > 2.47.1
> >
> 
> Another reason to introduce a new parameter (qemu_cpu) is that we can also
> change arm32 to 'max', reducing divergence between arm32 and arm64.

That sounds very sensible, I'll do that for the next iteration.

Thanks,
Alex

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
