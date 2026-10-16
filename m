Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79E0CC6B38
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 00:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIUGjtCaGlfeizPNCKO9t/mxiMQ99fRtTE5frOdSQ+g=; b=PWgENk3H+7hfy5
	AWsgSz1Bfvte7Ea+mMxgLCt8YZgaCxrdBQZI/AKulgtNbWbr5d6ou/bL4ioc5bE5OyLwmM5SI+Ztr
	/sSRT7CEannf36MC0gzZoYRlJboqJECp/OjAd5r424yITE8zQpb5r1ZgYPfS4ixZLYTUwH6IPKilW
	/XYyMTm2iJ+CoCKTZm4mT1Hr+ULTFD5NYCaouo3f7d/NBPYWqpLVAo94Uoieu0V4X3d2lsMPaQuKt
	+NAX2guQOJ/Fv+zMx1uUzefAAsYHCTRBbIutdER6hN7XxhBwqkFKKL04hCbl01ufgwaWz7Pz9RNDl
	D2V/QrBUxRd9I0Hgwr5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVMq-00000001aYp-1dZ5;
	Fri, 16 Oct 2026 00:00:12 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVMo-00000001aY5-0i3U
	for kvm-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 00:00:11 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-917a707f37eso72684006d6.0
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Oct 2026 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792108809; x=1792713609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=GQTxvjFpEuOQXJRVIaUreJeLtNe4/S7LhP7dr8Me6riyUGa166mcOMF8Aog+XUH4jv
         T5dos/mRxtOyysN9sGXp9Bl4KSiVfLwKSWhjKJvNg69cQSqCC0nLxIbGFSAxTpGS+jD1
         eYoHAWTF2jEquh1x3C8HTglGubQ3IdF3go1mH+9IDqwy0Odt/ewTLfB5yWeMxRFs8Iql
         +at6pWtlZ7PrSBYCAaHee32B+4mA2EYHwcGhZgvA/zVI7ARkxywwUZROlHknFtE39Mdc
         D7aWqCfqvm3ZQWgK8yr4f1jhd4sFKJuMG6hyC+liXOOONw9Y16l9Q4DVPcnO7/A7zTij
         2XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792108809; x=1792713609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqEHOCux09a0Q8vXL7DmpuXdHbLuTIeeYNtJksyQERU=;
        b=YJsVBBqjxz7wa5ql5SHoQO+4pfsvBfXw/kelSqBgCfXqtkPcyziGMt181Z/+9BgsnR
         Rjc01VXa+rBE9/NshW010IaV60bJuxzNSGOrdtZzE6jI8Mo3bT94UAiZkm25BMYq2DcL
         ckAJZiu9EihG2PjH1tnb8EpRoY4UZSSUABp2eSYJQfr+RuXh/W0OkwjJ7ABkRnyRnGFC
         Rkz1ZfL5mqconJU9FRbS2ibjt0ZNymjSu6HgdilONsWRetykqJxw4gKlv1wFaIq3MXH4
         JDX6YWM2vViw0WRQ8xnP+Ofo4vNct5ZDV+UeXoeIALyGjWY48SHoju8V2Fq/QhC+dFbL
         4kIw==
X-Forwarded-Encrypted: i=1; AKwUvBw6YbfiB72k87pVveSiWBZRXC/DpE1x+sZ/C7fyt+6Va+CrVgkRktLgMp7HF2o/Sl0BIPgJsqwMEsE=@lists.infradead.org
X-Gm-Message-State: AFq9FYLpQQrOZxQKxJMmOyNiPcYyEvkOHOgDM96EPv4GQTJ1iBepW9zj
	q40451nirWk3nmIACTweCzkMonaitPD46SbzZsstkjYmwW9EgxSOBDZqnhuL/aoUqxM=
X-Gm-Gg: AYBFou2kww8ugCRSEPqdX6bc03L4OFNj0sg0oOwMWA+VvBeMWfocl19XBJzSCprr1aT
	P0PHoK8r8+wWgSkAMotY91fCyEgsAj8546SIxUTpfJq2GAqbkb2UiKJk7tYN8bmFRLwzUGb1m4m
	p90r3W0yjCqrBALTv58YinmFiaq83bFdFwwSdqsNU70eNxzURkifnhEbhxXRsLCAOl0AC6y3rKK
	bVqQQPX6BFHb8BRKfH+djG+w+AQp2yjR1z0WbhUwCKHskyIhxafYz7OeEFlWTjdlwOwR34r52yk
	zGFOyoHPB0CWYvaOgoewNxULAmdQJjBvkXGl49RuOgGyBj0DJ0JtC/vqGY1bhtATR3ZdiPJmOQz
	NX2V31xU9/csn8hL6fCzr4IOsv1TPJd479c2gNRyRZi/Ue6u7Pa7MR3WK16lVfYepV4Pc+XJ9Yw
	TzE+hGGNUs3vPFkyjnVkel3gLGU2zIsVmbqowhb33AJot8cge60DwXYItFns9hexAE0JD+7KVGV
	prt84pohEkqWR3mZI+7uT2Qt+pu9GdmDKa1/aAcjQ==
X-Received: by 2002:ad4:5deb:0:b0:917:bbf1:5323 with SMTP id 6a1803df08f44-91b55793527mr367860846d6.38.1792108808237;
        Thu, 15 Oct 2026 17:00:08 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bce8918bdsm4228956d6.48.2026.10.15.17.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:00:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVMi-00000000H7g-17qS;
	Thu, 15 Oct 2026 21:00:04 -0300
Date: Thu, 15 Oct 2026 21:00:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Wu Fei <wu.fei9@sanechips.com.cn>,
	Zhao Qingye <zhao.qingye@sanechips.com.cn>,
	Gong Shuai <gsh517025@gmail.com>
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU)
 support
Message-ID: <20261016000004.GB14213@ziepe.ca>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_170010_221081_17D53CC0 
X-CRM114-Status: GOOD (  12.83  )
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

On Thu, Oct 15, 2026 at 02:52:20PM +0800, Gong Shuai wrote:
> Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> with its own vIOMMU can own the first stage of a device context while the
> host keeps the second stage, and add the interrupt support. This is an RFC
> and comments on the design are welcome.

The iommufd parts looked reasonable to me

I feel some mild skepticism about all the MSI parts, it would be good
to get more of the interrupt stuff actually landed before posting this
again.

Please try harder on the commit messages, do not use AI to write them
like this. They need to explain why this patch exists and what problem
it is solving not some inscrutible description of what it contains.

You'll need other riscv people to help you with reviewing it.

Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
