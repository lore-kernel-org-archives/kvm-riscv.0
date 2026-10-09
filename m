Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A3CA5FED
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPPIP45QG334c8TZs+5KQcOb/S0anSrhbr+IEBZp7NA=; b=HJysOu2xFnz2cm
	UECVLv0F1y2iqLmI1krLmF1X3NdZGai0F/QbO3ElNp4aP2sDSExx7y2bNsj2l6jI8KwP9EO3pKby2
	UCL/P8MzBMi2aMJe2ayfbAv2+E95U7uY6p2ky/FlBER2i3mS4Xc6uLK2trMINoeMIf7ZqQE9cqY23
	DmufYMDBeZsRw2Gw1oQFWv2mgcxPLnhsaT2lS+OHU5C7elh1LZ/3r4epi6/AQ/PjSbpTmU6XVHjzQ
	kWSA4ljSsV4fchD06Qeo24YTUiNxe7NPk9pwNYN9avSg3nvPb9TtMaZKAPDjhxA49ANXCI/UdFt12
	YzCWQklK85O39rn2pcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6gj-00000005tZ8-2BgP;
	Fri, 09 Oct 2026 09:14:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF6gh-00000005tYi-1C6v;
	Fri, 09 Oct 2026 09:14:48 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j1Lm45T4rz4yjjH;
	Fri, 09 Oct 2026 17:14:44 +0800 (CST)
Received: (from root@localhost)
	by mse-fl1.zte.com.cn id 6999EfSj006317;
	Fri, 9 Oct 2026 17:14:41 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Message-Id: <202610090914.6999EfSj006317@mse-fl1.zte.com.cn>
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl2.zte.com.cn with SMTP id 69995Y26078728;
	Fri, 9 Oct 2026 17:05:34 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from localhost.localdomain (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Fri, 9 Oct 2026 17:05:36 +0800
X-Zmail-TransId: 3e816ac8ae5a022-c22f1
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: andrew.jones@oss.qualcomm.com
Cc: anup@brainfault.org, atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca, joro@8bytes.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
        tglx@kernel.org, tomasz.jeznach@linux.dev, will@kernel.org,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com,
        gong.shuai@sanechips.com.cn, gsh517025@gmail.com
Subject: Re: [RFC PATCH v3 04/14] iommu/riscv: Reject live S2 replacement with forwarded IRQs
Date: Fri,  9 Oct 2026 17:05:30 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6999EfSj006317
X-MSS: AUDITRELEASE@mse-fl1.zte.com.cn
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 09 Oct 2026 17:14:44 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AC8B084.001/4j1Lm45T4rz4yjjH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_021447_648727_DA8BF565 
X-CRM114-Status: GOOD (  24.83  )
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

> MSI forwarding state is tied to the S2 domain MSI table. Replacing a
> device's S2 domain while one of its IRQs is forwarded would leave the
> IRQ state referring to the detached table.
> 
> Reject direct S2-to-S2 replacement when the moving device has forwarded
> IRQs. Introduce a per-device nr_forwarded_irqs counter, rather than
> domain-wide accounting, so other devices in the same IOMMU group can
> still move and can be rolled back if a later device fails.
> 
> Later patches which introduce interrupt remapping support will manage
> the newly introduced nr_forwarded_irqs counter.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  drivers/iommu/riscv/iommu.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 57f2884dec42..d48667112cd9 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>  /* Private IOMMU data for managed devices, dev_iommu_priv_* */
>  struct riscv_iommu_info {
>  	struct riscv_iommu_domain *domain;
> +	unsigned int nr_forwarded_irqs;
>  };
>  
>  static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
> @@ -1432,6 +1433,36 @@ static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
>  	return 0;
>  }
>  
> +static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_domain,
> +						 struct device *dev,
> +						 struct iommu_domain *old)
> +{
> +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> +	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> +	bool new_is_s2 = domain->gscid;
> +	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
> +
> +	if (iommu_domain == old)
> +		return true;
> +
> +	new_msi_table = riscv_iommu_domain_msi_table(iommu_domain);
> +	old_msi_table = riscv_iommu_domain_msi_table(old);
> +
> +	if (new_msi_table)
> +		lockdep_assert_held(&new_msi_table->lock);
> +	if (old_msi_table)
> +		lockdep_assert_held(&old_msi_table->lock);
> +
> +	/*
> +	 * Per-device accounting allows other devices in the same IOMMU group
> +	 * to move or roll back while this device has forwarded interrupts.
> +	 */
> +	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)

This check might miss one case. old_msi_table comes from this
attach's old domain, so only a direct S2 to S2 swap is caught.
A device with live forwarded IRQs can still be moved to blocking
and then to a different S2 domain, and on that second attach old
is the blocking domain, so old_msi_table is NULL and the check
passes. This is only from reading the code, I have no test program
that triggers it.

If you think this is a real gap, one idea would be to record the
table the forwarding was set up on in riscv_iommu_info(a pointer to
riscv_iommu_msi_table), set when the first IRQ of the device is
forwarded and cleared when the last one is unforwarded. The pointer
survives the blocking hop, since attaching to blocking domain only
clears info->domain. Then can_attach here will reject when the new
domain's table differs from it. That covers both the direct and the
blocking case, and the PCI reset path still works because the device
returns to the same S2 domain. The unforward path can use the pointer
instead of info->domain. Note that the S2 domain owning the table
must not be freed while a device still points at that table.

Thanks,
Shuai

> +		return false;
> +
> +	return true;
> +}
> +
>  static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  					    struct device *dev,
>  					    struct iommu_domain *old)
> @@ -1477,6 +1508,11 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	bond->dev = dev;
>  
>  	flags = riscv_iommu_msi_tables_lock(old, iommu_domain);
> +	if (!riscv_iommu_can_attach_paging_domain(iommu_domain, dev, old)) {
> +		riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
> +		kfree(bond);
> +		return -EBUSY;
> +	}
>  	riscv_iommu_bond_link(domain, bond);
>  	riscv_iommu_iodir_update(iommu, dev, &dc);
>  	riscv_iommu_bond_unlink(info->domain, dev);
> -- 
> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
