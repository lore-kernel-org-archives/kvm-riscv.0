Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BA606A32C
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B0ln82Zq;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BVd7DUyo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/PoW6KgUy+sZFEW7J9wcnIxUJQ74CRvbIekhB1mDFaI=; b=B0ln82ZqsueS/LDku5D+a1VNDn
	w5Sw2xoacZlzjJMevEbsFf31nSUzz810Nok2XYckIUtcKk0hjebDYBMYKRSG4z5vuzwQwDHiQD9Uh
	01DrQSY9S5UflvF5YXeDMWnWZnY2LibGwSj/yfjJMdpqoSOv4zWLLtTeVkw488cP+cIdazS6/ULwQ
	79xE0oYL53zG5WSXCD51N2aoKc/XY6ms4USsAoACGBE4Xwkiob1ZMSvDdxYLNRAMWjWStIpvgLavS
	tw6gnGGsqgIE8nJRo+IiEePbCmr2ZnIP8kidp8ViMsaC2fq3tw/WLgD/WMdMrmVD/o0sYhHhMeyTJ
	/Rm5omCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkMA-0000000HBkg-1WZd;
	Sat, 21 Nov 2026 12:38:14 +0000
Received: from out-46.mta0.migadu.com ([2001:41d0:1004:224b::2e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkM5-0000000HBj5-3IFI
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 12:38:13 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rRoUO1ekAv/EnBw/LqUWxSkU357wwykHVnVwqfZsCKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795264687; v=1; x=1795869487;
 b=BVd7DUyoNQtYHAc4AxDOU+64n2ZFVG7Y9IswXb9+GmiSj5osvIXrsMxxPTJYs7PUDcCsV5L7
 jJL3bm9/PTutt5R29GggzbveN3rBIOYTNJUAEIIIxDAzfmGYxgzDqf1DSZ6WuUVth46xQ5ngwMk
 nw83sHH+nTiiOQbBQDGuw4H0=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 51c69ba41e2b6b86;
	Sat, 21 Nov 2026 12:38:07 +0000
X-Mizu-Trace-ID: 51c69ba41e2b6b86
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 13:37:29 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
	Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>, 
	Zhao Qingye <zhao.qingye@sanechips.com.cn>
Subject: Re: [RFC PATCH v3 05/10] iommu/riscv: Add nested domain allocation
Message-ID: <awGP5H2JdjxW8WXG@orel>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-6-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261119132744.396426-6-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_043810_130874_37B3B668 
X-CRM114-Status: GOOD (  15.13  )
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

On Thu, Nov 19, 2026 at 09:27:39PM +0800, Gong Shuai wrote:
> From: Wu Fei <wu.fei9@sanechips.com.cn>
> 
> A nested domain describes two-stage translation through guest and
> host page tables. Iommufd exposes this domain as a nested hwpt.
> 
> User space needs to provide the guest stage 1 configuration when
> allocating a nested hwpt. Validate the configuration before storing
> it for use in a physical device context.
> 
> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
> ---
>  drivers/iommu/riscv/iommu.c | 153 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index f2305b953f71..4f8ce579ef08 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1698,8 +1698,161 @@ static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
>  	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
>  }
>  
> +struct riscv_iommu_nested_domain {
> +	struct iommu_domain domain;
> +	struct riscv_viommu *viommu;
> +
> +	u64 tc;
> +	u64 ta;
> +	u64 iosatp;
> +};
> +
> +#define to_riscv_iommu_nested_domain(domain) \
> +	container_of(domain, struct riscv_iommu_nested_domain, domain)
> +

Please rename the macro parameter so it doesn't collide with the domain
member name, otherwise macro expansion replaces the member name too.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
