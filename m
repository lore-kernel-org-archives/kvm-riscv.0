Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1780CC982DF
	for <kvm-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT6f4ijx/vZUoq3bBvL5eqGZDEecYRJ46tcw1wkriug=; b=yATBcxyGpIM7Uj
	n9aOhfK6v27/5wdbq3id/KiWimQcLYGC4/DEsZZiI2g4SEYsJHxvmhKOKKSKNkq/cNjqII9QjMdbp
	ECjvnZiT6g7C8OXp7zqF32SX4aQkV7ZiswPaJ0t9UIt/8DVU3f/KEE66xSRnAHXjXQKcx6RflPAXB
	Q12pC8coTBWovDP/y5dRFU8nGa3+k3GBwCkLMvSU8dBvCnwdup6AtsKfXv0miQTN8Us991HUPfdmh
	84+ZsHFsgedrXj9XGUpGVNasep1HBsoh/PTdUH1o+wLjwxQO0E+5LwyQBQimqA6285RATefbZNnez
	VO23tthi7WxZiF6TzdyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87vK-0000000GmbA-1Jw5;
	Sun, 20 Sep 2026 03:09:02 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x87vH-0000000Gmal-0vUx;
	Sun, 20 Sep 2026 03:09:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789873732; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=wjTZldjz1iDULhUhQBqLiB6G8Q6aBj6HV95v1HhDU/I=;
	b=gExHY8ZrIbPkCBq5tkvhbf+TKX3wt7XedjOfd5sJQGt94Reb8tKXdo/7OPu5g/LVRyKJGQTutoQ/0h010hBqHqcvAUA0QGjKplZnOq+xjkmDqIj4WqaZHYu5ijOt+GbV2E/gJdXztQPFjleUX/pangHkW9DH3nyaFxPc18uDC50=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XBErkLX_1789873726;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XBErkLX_1789873726 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 11:08:48 +0800
From: fangyu.yu@linux.alibaba.com
To: gsh517025@gmail.com
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH v4 04/10] iommu/riscv: use data structure instead of individual values
Date: Sun, 20 Sep 2026 11:08:46 +0800
Message-Id: <20260920030846.20403-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
References: <6d1bfb10-fd04-4e4e-895d-55c16fcea13f@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_200900_090985_B5713664 
X-CRM114-Status: GOOD (  21.79  )
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

>Hi Fangyu,
>
>On 9/15/2026 11:28 AM, fangyu.yu@linux.alibaba.com wrote:
>> From: Zong Li <zong.li@sifive.com>
>>
>> The parameter will be increased when we need to set up more
>> bit fields in the device context. Use a data structure to
>> wrap them up.
>>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>   drivers/iommu/riscv/iommu.c | 27 +++++++++++++++++----------
>>   1 file changed, 17 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index a6c8307e82ea..c5b6214ee672 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1165,7 +1165,7 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
>>    * interim translation faults.
>>    */
>>   static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>> -				     struct device *dev, u64 fsc, u64 ta)
>> +				     struct device *dev, struct riscv_iommu_dc *new_dc)
>>   {
>>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>   	struct riscv_iommu_dc *dc;
>> @@ -1204,10 +1204,10 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
>>   	for (i = 0; i < fwspec->num_ids; i++) {
>>   		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
>>   		tc = READ_ONCE(dc->tc);
>> -		tc |= ta & RISCV_IOMMU_DC_TC_V;
>> +		tc |= new_dc->ta & RISCV_IOMMU_DC_TC_V;
>
>According to SPEC 3.1.3.3, the "V bit" does not exist in DC.ta.
>This should be a convention from when the iodir_update() function
>did not yet use `struct riscv_iommu_dc` as a parameter, using bit 0
>of DC.ta to indicate that the DC is valid. Now that iodir_update()
>receives the complete dc, it can directly access DC.tc.V, so this
>convention should no longer be necessary and will cause confusion.
>

Hi Shuai:

Thanks for the clarification.

My understanding is that `ta` here is used as a
combined concept, not only for `DC.ta`, but also
for `PC.ta` in this flow.

The `V` bit is only initialized when `ta` is first
set up, so the current usage still follows the
original design, without changing most of the
existing logic.

The original code also has comments describing
this behavior.

Thanks,
Fangyu

>>
>> -		WRITE_ONCE(dc->fsc, fsc);
>> -		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
>> +		WRITE_ONCE(dc->fsc, new_dc->fsc);
>> +		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
>
>`RISCV_IOMMU_PC_*` should be replaced with `RISCV_IOMMU_DC_*` for
>readability. There are several other similar places in this file
>that are unrelated to Process Context or PASID but use the *PC* macros.
>

My understanding is similar to the `ta` case: `fsc`
likely refers to both `dc.fsc` and `pc.fsc` in this
path, since some of their fields share the same bit
layout.

If we want to rename these for readability, I think
that should be done in a separate patch set, rather
than as part of this one.

>
>Thanks,
>Shuai
>
>>   		/* Update device context, write TC.V as the last step. */
>>   		dma_wmb();
>>   		WRITE_ONCE(dc->tc, tc);
>> @@ -1288,22 +1288,22 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>>   	struct pt_iommu_riscv_64_hw_info pt_info;
>> -	u64 fsc, ta;
>> +	struct riscv_iommu_dc dc = {0};
>>
>>   	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
>>
>>   	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>>   		return -ENODEV;
>>
>> -	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>> +	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
>>   	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
>> -	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>> +	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>>   	     RISCV_IOMMU_PC_TA_V;
>>
>>   	if (riscv_iommu_bond_link(domain, dev))
>>   		return -ENOMEM;
>>
>> -	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>   	info->domain = domain;
>>
>> @@ -1378,9 +1378,12 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
>>   {
>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>> +	struct riscv_iommu_dc dc = {0};
>> +
>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>>
>>   	/* Make device context invalid, translation requests will fault w/ #258 */
>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>   	info->domain = NULL;
>>
>> @@ -1400,8 +1403,12 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
>>   {
>>   	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
>>   	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
>> +	struct riscv_iommu_dc dc = {0};
>> +
>> +	dc.fsc = RISCV_IOMMU_FSC_BARE;
>> +	dc.ta = RISCV_IOMMU_PC_TA_V;
>>
>> -	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
>> +	riscv_iommu_iodir_update(iommu, dev, &dc);
>>   	riscv_iommu_bond_unlink(info->domain, dev);
>>   	info->domain = NULL;
>>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
