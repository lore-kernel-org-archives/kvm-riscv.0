Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D786DE67803
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 17:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xuWU+kbobtSEMJP79tzyhGrWknZo3o3dp7hqelxBut4=; b=c7ZPSQeUJZ1iG4
	S/2ohVXma4a9FcpU57Nfcei3aCREKf3f9NrRYRIlyjEiJLDnq0ekj5tgqzkAjSNsI3gha9gX2mylz
	P6j5xJFQWnOEBvcMNYc+StdSMUJsorl9jgfZnxnMj+uLYisQp2SAJn8fZZiSo1I6J7oNSJBUWTSP1
	15KMy0edNdVVtdokdlsSB0wQsx5jJF3+uC7UTvQ30gomYB7RRSTLgoTDDtT2gAnnhu+fNQrQp0bCk
	dEkm5IBioP1yka+JKn+nvWxBOsvfCu3PFml+wJ1Gofv/zn3VjZW8kn7cubnHyMn/MQIMSa+RXVFYV
	DIin91GudivdaN1/h5oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjfS-0000000E1MH-18B4;
	Mon, 22 Dec 2025 17:25:58 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjfO-0000000E1LU-3g1R
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 17:25:56 +0000
Date: Mon, 22 Dec 2025 11:25:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766424339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=byvshAmRUwrZC8GVC2vo9mDR5a//m/DN9v63+WgdYgI=;
	b=Cl0cRF7BIMaB5XtNbuYctsoztFcS9MzXisFXRp6G9r/BLHQYgENEamwlRs/rfTKh5CJvQi
	ZtdC2ohWeCh1lDeXcJD7BMrkdb5bbewXuMRS4denOS1bpv3WwktrRQKiXl4ERb1KrR2+43
	mlv5qBjJuJgQFyZjZB7YhM1C728IO5U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: James Raphael Tiovalen <jamestiotio@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	atishp@rivosinc.com
Subject: Re: [kvm-unit-tests PATCH 0/4] riscv: sbi: Add support to test PMU
 extension
Message-ID: <20251222-4edd14c1464744ef9e24245d@orel>
References: <20251213150848.149729-1-jamestiotio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251213150848.149729-1-jamestiotio@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_092555_483163_586B6114 
X-CRM114-Status: GOOD (  15.56  )
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

On Sat, Dec 13, 2025 at 11:08:44PM +0800, James Raphael Tiovalen wrote:
> This patch series adds support for testing most of the SBI PMU
> extension functions. The functions related to shared memory
> (FID #7 and #8) are not tested yet.
> 
> The first 3 patches add the required support for SBI PMU and some
> helper functions, while the last patch adds the actual tests.
> 
> James Raphael Tiovalen (4):
>   lib: riscv: Add SBI PMU CSRs and enums
>   lib: riscv: Add SBI PMU support
>   lib: riscv: Add SBI PMU helper functions
>   riscv: sbi: Add tests for PMU extension
> 
>  riscv/Makefile      |   2 +
>  lib/riscv/asm/csr.h |  31 +++
>  lib/riscv/asm/pmu.h | 167 ++++++++++++++++
>  lib/riscv/asm/sbi.h | 104 ++++++++++
>  lib/riscv/pmu.c     | 169 ++++++++++++++++
>  lib/riscv/sbi.c     |  73 +++++++
>  riscv/sbi-tests.h   |   1 +
>  riscv/sbi-pmu.c     | 461 ++++++++++++++++++++++++++++++++++++++++++++
>  riscv/sbi.c         |   2 +
>  9 files changed, 1010 insertions(+)
>  create mode 100644 lib/riscv/asm/pmu.h
>  create mode 100644 lib/riscv/pmu.c
>  create mode 100644 riscv/sbi-pmu.c
> 
> --
> 2.43.0
>

Hi James,

Thanks for posting this. I'll look at it as soon as possible, but I'm
juggling some other stuff right now and also plan to be on vacation for
a week starting tomorrow.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
