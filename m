Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A96CCA462
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBCrQzKnxSq90EBBujc94Ny9kASx/Yky1DYbHADgnOM=; b=yC5XAmuCwXYB7U
	1DcaNTvHTDhwxSbgUkByIeFV6t1XQEh+3Q7HNOx0VhvOPPvTsj6KGjU/LDJBlnTjTXgmlp1HyDNDp
	C+UtVrZXDDAk8QBBzObKK8XXSW6+Pp4pLuIqULJnOX0RZK6Tp6Wq2shLbaxK+OXId7Njql8Hv3Os+
	P0RVg+8O28s+s229FU2EgqjKPtah6GihJ1GdXcwwk6Y6YuOZFeGwB6q40BR2SqpdUNa4cvHnraVpN
	c7wAXFFc8xiHtlF+/xCC1B5wfRj2SoTyiUSyLUyvokNNtj9lZsYALI/XcuRVqyqtqaG8aM57shfD1
	u8765GRnUfgtJmibDBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe3H-00000002SFW-3AZw;
	Fri, 16 Oct 2026 09:16:35 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHe3F-00000002SEy-2I79;
	Fri, 16 Oct 2026 09:16:34 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j5fSq2WzTz8Xrnw;
	Fri, 16 Oct 2026 17:16:27 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 69G9GElv040441;
	Fri, 16 Oct 2026 17:16:14 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Fri, 16 Oct 2026 17:16:17 +0800
X-Zmail-TransId: 3e816ad1eb5a024-bff28
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: jgg@ziepe.ca
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev,
        fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn,
        gsh517025@gmail.com, iommu@lists.linux.dev, joro@8bytes.org,
        kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        pbonzini@redhat.com, pjw@kernel.org, robin.murphy@arm.com,
        seanjc@google.com, tomasz.jeznach@linux.dev, will@kernel.org,
        wu.fei9@sanechips.com.cn, zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 0/12] iommu/riscv: Add nested translation (vIOMMU) support
Date: Fri, 16 Oct 2026 17:16:10 +0800
Message-ID: <20261016091610.13912-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016000004.GB14213@ziepe.ca>
References: <20261016000004.GB14213@ziepe.ca>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69G9GElv040441
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 16 Oct 2026 17:16:27 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD1EB6B.001/4j5fSq2WzTz8Xrnw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_021633_743802_D76EF305 
X-CRM114-Status: GOOD (  17.15  )
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

Hi Jason,

Thanks for the review again.

> > Add nested translation support to the RISC-V IOMMU driver, so a KVM guest
> > with its own vIOMMU can own the first stage of a device context while the
> > host keeps the second stage, and add the interrupt support. This is an RFC
> > and comments on the design are welcome.
>
> The iommufd parts looked reasonable to me
>
> I feel some mild skepticism about all the MSI parts, it would be good
> to get more of the interrupt stuff actually landed before posting this
> again.

Agreed on the MSI parts. They are a working proof to exercise the
nested flow end to end, not a finished design. The reason they are
in this series at all is that the NVMe device we use for testing
depends on MSI interrupts. Without this support, DMA succeeds but
the MSIs fault, so the driver ends up polling for completions after
timeouts.

We will keep following the irqbypass groundwork as it evolves, and
continue this work once it has landed.

>
> Please try harder on the commit messages, do not use AI to write them
> like this. They need to explain why this patch exists and what problem
> it is solving not some inscrutible description of what it contains.

I will rewrite all of them.

Thanks,
Shuai

>
> You'll need other riscv people to help you with reviewing it.
>
> Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
