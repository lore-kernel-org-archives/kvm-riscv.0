Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193D8606A333
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XllwW2lm;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BdeUELnF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T5731yiSmggAZulazLwy8kKCqUoCF60pNJhUXjjIdIc=; b=XllwW2lmCSWn1rBl/EfmZoq4T2
	vF+BadJkIps4uJKu5DAi+N5EiqEqtk7UAN8U+9mBYak6ptwTGkgVDq0sa4/5X71P9ot4OVeMS+3iS
	lcgW6Hggv/K4Ue5XM9lrAqYUHa+YKmgin44WbJ6QRadFweFDUa56enYgCUb5Dr9uzccarkSs5piiB
	TYunbPotY7/PA2lAkd/Y+Vl4ItrD+NGQQbTXIojh4TXyMqqx7jjeqT758l7sOPbHwTsxYaKAu2MvE
	UGoxFggWqA10eY8H9HnvcMV1N+TwBTGbhy9T7DtFOqk951bf/Q2eyX8d2Z+cgK75XZ/7/FpNPlrUO
	DG1mxa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoTp-0000000HXco-1zca;
	Sat, 21 Nov 2026 17:02:25 +0000
Received: from out-64.mta1.migadu.com ([95.215.58.64] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUoTm-0000000HXbT-1fZg
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 17:02:24 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=120vruIvVuVMsi4eadSo5mQWHm7BqnKtIE9tM2dix/Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795280539; v=1; x=1795885339;
 b=BdeUELnFusdi4TW9ZcGg2IqmMKk+d2Lx+lb15psooUk/UHZRLaRFZHQAKz7A3vAYT39yaa7s
 xSiAlEk6skdrxvRoG+dnpjUlpMu1f5zECSw6No1SkbS6Opvr6igsAVgSIbbuAQ/fvUU8DBZbOmU
 XFB2QttYodDmae0e4merQxus=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 66ce02f06bdb1801;
	Sat, 21 Nov 2026 17:02:19 +0000
X-Mizu-Trace-ID: 66ce02f06bdb1801
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 18:01:46 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: andrew.jones@oss.qualcomm.com, anup@brainfault.org, 
	atish.patra@linux.dev, fangyu.yu@linux.alibaba.com, iommu@lists.linux.dev, 
	jgg@nvidia.com, jgg@ziepe.ca, joro@8bytes.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com, tglx@kernel.org, 
	tomasz.jeznach@linux.dev, will@kernel.org, zhangzhanpeng.jasper@bytedance.com, 
	zong.li@sifive.com, gsh517025@gmail.com
Subject: Re: [RFC PATCH v3 04/14] iommu/riscv: Reject live S2 replacement
 with forwarded IRQs
Message-ID: <awHLO6bWYw5V0k4p@orel>
References: <20260928143113.49838-5-andrew.jones@oss.qualcomm.com>
 <202610090914.6999EfSj006317@mse-fl1.zte.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202610090914.6999EfSj006317@mse-fl1.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_090222_879964_326D645F 
X-CRM114-Status: GOOD (  34.36  )
X-Spam-Score: -2.8 (--)
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

On Fri, Oct 09, 2026 at 05:05:30PM +0800, Gong Shuai wrote:
> Hi Drew,
> 
> > MSI forwarding state is tied to the S2 domain MSI table. Replacing a
> > device's S2 domain while one of its IRQs is forwarded would leave the
> > IRQ state referring to the detached table.
> > 
> > Reject direct S2-to-S2 replacement when the moving device has forwarded
> > IRQs. Introduce a per-device nr_forwarded_irqs counter, rather than
> > domain-wide accounting, so other devices in the same IOMMU group can
> > still move and can be rolled back if a later device fails.
> > 
> > Later patches which introduce interrupt remapping support will manage
> > the newly introduced nr_forwarded_irqs counter.
> > 
> > Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> > ---
> >  drivers/iommu/riscv/iommu.c | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> > index 57f2884dec42..d48667112cd9 100644
> > --- a/drivers/iommu/riscv/iommu.c
> > +++ b/drivers/iommu/riscv/iommu.c
> > @@ -872,6 +872,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
> >  /* Private IOMMU data for managed devices, dev_iommu_priv_* */
> >  struct riscv_iommu_info {
> >  	struct riscv_iommu_domain *domain;
> > +	unsigned int nr_forwarded_irqs;
> >  };
> >  
> >  static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
> > @@ -1432,6 +1433,36 @@ static int riscv_iommu_msi_table_alloc(struct riscv_iommu_domain *domain,
> >  	return 0;
> >  }
> >  
> > +static bool riscv_iommu_can_attach_paging_domain(struct iommu_domain *iommu_domain,
> > +						 struct device *dev,
> > +						 struct iommu_domain *old)
> > +{
> > +	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
> > +	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
> > +	bool new_is_s2 = domain->gscid;
> > +	struct riscv_iommu_msi_table *new_msi_table, *old_msi_table;
> > +
> > +	if (iommu_domain == old)
> > +		return true;
> > +
> > +	new_msi_table = riscv_iommu_domain_msi_table(iommu_domain);
> > +	old_msi_table = riscv_iommu_domain_msi_table(old);
> > +
> > +	if (new_msi_table)
> > +		lockdep_assert_held(&new_msi_table->lock);
> > +	if (old_msi_table)
> > +		lockdep_assert_held(&old_msi_table->lock);
> > +
> > +	/*
> > +	 * Per-device accounting allows other devices in the same IOMMU group
> > +	 * to move or roll back while this device has forwarded interrupts.
> > +	 */
> > +	if (new_is_s2 && old_msi_table && info->nr_forwarded_irqs)
> 
> This check might miss one case. old_msi_table comes from this
> attach's old domain, so only a direct S2 to S2 swap is caught.
> A device with live forwarded IRQs can still be moved to blocking
> and then to a different S2 domain, and on that second attach old
> is the blocking domain, so old_msi_table is NULL and the check
> passes. This is only from reading the code, I have no test program
> that triggers it.
> 
> If you think this is a real gap, one idea would be to record the
> table the forwarding was set up on in riscv_iommu_info(a pointer to
> riscv_iommu_msi_table), set when the first IRQ of the device is
> forwarded and cleared when the last one is unforwarded. The pointer
> survives the blocking hop, since attaching to blocking domain only
> clears info->domain. Then can_attach here will reject when the new
> domain's table differs from it. That covers both the direct and the
> blocking case, and the PCI reset path still works because the device
> returns to the same S2 domain. The unforward path can use the pointer
> instead of info->domain. Note that the S2 domain owning the table
> must not be freed while a device still points at that table.
> 

Hi Shuai,

Yes, this is a gap and I agree we should track and check the association
for the fix. For v4, I'm looking at moving the MSI table configuration
into a VM-wide object which S2 domains reference, similar to GICv4's
its_vm. The recorded pointer would then be to that object, which the
hypervisor keeps alive until every forward is undone.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
