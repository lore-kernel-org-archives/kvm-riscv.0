Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F39606A31A
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1HniHvWW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Mgk03GweYBrVpKEVIJBnaa4IerSKn9DhPRDxykgaMxs=; b=1HniHvWWJXRBxFeHIYXbf1ypAT
	F3r9qJWnmIrNuncOPJu3nk+O8G96gzMhedupZnGgszfTMzNEG0KGWx2EDS4ySZLZYpCWXyAtpzApx
	TrxdZ0qF0l/Dsnmd0tHmeGlJxB+TDhzBKmViUADXA8Qdwbhqzi/H0g7zwqcyfscKT00THfE5nu9yd
	2GEw7680fIYJY1F+NsysqAYkW7xbCeiV6DvOkLZWarXR8cQAkMlxcaQyw5/BL9KUHv3MUG+zV+r+q
	Jrj3h+5JPw7OLQVICZGh7cWn1jhg+8+wvzdk5b2h/W9iY+0eJYEsYR6Mf6MnwTNeiwYDFdMIEo30e
	CalqrNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcOx-0000000AfQC-2ZMK;
	Fri, 30 Oct 2026 02:31:31 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcOu-0000000AfP9-1GF2;
	Fri, 30 Oct 2026 02:31:30 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jG4ps6VlHz5B1C7;
	Fri, 30 Oct 2026 10:31:17 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 69U2V9Yu030476;
	Fri, 30 Oct 2026 10:31:09 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Fri, 30 Oct 2026 10:31:10 +0800
X-Zmail-TransId: 3e816ae40168028-1fbe9
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: fangyu.yu@linux.alibaba.com
Cc: gong.shuai@sanechips.com.cn, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 03/10] iommu/riscv: report iommu capabilities
Date: Fri, 30 Oct 2026 10:31:04 +0800
Message-ID: <20261030023104.51259-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020094106.92722-4-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-4-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69U2V9Yu030476
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 30 Oct 2026 10:31:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE40175.001/4jG4ps6VlHz5B1C7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_193128_510951_99B0875D 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fangyu,

> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>
> Report RISC-V IOMMU capabilities required by VFIO subsystem
> to enable PCIe device assignment.
>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

This patch has already been merged
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3069e8f3e1e9bdf007316eadae4d1777065e7b78

Thanks,
Shuai

> ---
>  drivers/iommu/riscv/iommu.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index fe8e6d0f8a23..40beccedd39f 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1444,6 +1444,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
>  	return generic_device_group(dev);
>  }
> 
> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
>  {
>  	return iommu_fwspec_add_ids(dev, args->args, 1);
> @@ -1505,6 +1515,7 @@ static void riscv_iommu_release_device(struct device *dev)
> 
>  static const struct iommu_ops riscv_iommu_ops = {
>  	.of_xlate = riscv_iommu_of_xlate,
> +	.capable = riscv_iommu_capable,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,
>  	.release_domain = &riscv_iommu_blocking_domain,
> -- 
> 2.50.1

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
