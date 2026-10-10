Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D4ACA9EBE
	for <kvm-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 11:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WK+jFHQJd5/c4MEyp3KZfSrPnUZXsCk7yPKQJZf5EqA=; b=Wz6u3vshDPaliO
	EWW0xgXPzz+j/fQTDWuCr4jITXnzsCYIGW/ponuBycnmxyApbm8oOhBWlG8Ii+Kwgv//kHJXXeWqz
	/UTrKYCEMo+IropldjIXMTyL9TEp5bcVB07M1bjPblKeBj152dDyVUtJ5p5YeuVf2TcIZenhe3o18
	HTG3bKsuZ8vDswbJ6PABm17bwjUE3/h0XcZX/qH9Q+W4pBH53WJ86q8gcT7f3H9t/Tjph5MDy1YfY
	oHG1OF6JtqRz4Wfc2mlnodBLAsFP22GkToC5iiUUOvEV5RsS9zrLe6WBtKqZZaggvIRRb4kgkn/aq
	DVHlnIJAsibt3qaBxUOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV6M-00000007uL1-0bMJ;
	Sat, 10 Oct 2026 11:18:54 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV6I-00000007uKY-0sK3;
	Sat, 10 Oct 2026 11:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791631121; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=uj4FOYScpotQbXUx+KxSCAB7RY2odrIAyrg6q0KBZbw=;
	b=Gpr3yJUnsEZo0msOGjlnyllSrdLimMOASCSSdtymBweohwWMxVBQMdgpRZTkXgCNBLrJIr8Aw7f+5yH1XlPiIxXNL1Lif+HcR2I78cpkha25D74Oam1CmLS8TIcpIJSfcnnWbjasdx/oHGued1rIo8Hp3lMnOZLs5EyHbGfKdOg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCVxUq2_1791631118;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCVxUq2_1791631118 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 10 Oct 2026 19:18:40 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	fangyu.yu@linux.alibaba.com,
	gsh517025@gmail.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [RFC PATCH 1/3] iommu/riscv: Add guest IMSIC GPA mapping helpers
Date: Sat, 10 Oct 2026 19:18:37 +0800
Message-Id: <20261010111837.15424-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <202610090853.6998rsRH081065@mse-db.zte.com.cn>
References: <202610090853.6998rsRH081065@mse-db.zte.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_041851_033841_3CAFB7A5 
X-CRM114-Status: GOOD (  15.69  )
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
>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> IOMMU implementations without the MSI_FLAT capability translate MSI
>> writes through the second-stage page table, so IRQ forwarding on them
>> will need guest IMSIC pages mapped into the second-stage domain.
>>
>> Add an xarray to the MSI table that tracks the HPA installed for each
>> mapped guest IMSIC GPA, and two helpers for use with the MSI table lock
>> held: riscv_iommu_msi_table_map_gpa() installs the initial 4 KiB
>> mapping, and riscv_iommu_msi_table_replace_gpa_leaf() atomically swaps
>> the leaf PTE's PFN when a vCPU's VS-file host page moves, rejecting
>> leaves that do not map the expected old HPA.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  drivers/iommu/riscv/iommu.c | 94 +++++++++++++++++++++++++++++++++++++
>>  drivers/iommu/riscv/iommu.h | 12 +++++
>>  2 files changed, 106 insertions(+)
>>
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index e2e77469ea3c..48fc57d6409c 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -24,6 +24,7 @@
>>  #include <linux/moduleparam.h>
>>  #include <linux/mutex.h>
>>  #include <linux/pci.h>
>> +#include <linux/pgtable.h>
>>  #include <linux/generic_pt/iommu.h>
>>
>>  #include "../dma-iommu.h"
>> @@ -1217,6 +1218,92 @@ void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table)
>>  	riscv_iommu_iotlb_inval(domain, &gather);
>>  }
>>
>> +int riscv_iommu_msi_table_map_gpa(struct riscv_iommu_msi_table *msi_table,
>> +				  dma_addr_t gpa, phys_addr_t hpa)
>> +{
>> +	struct riscv_iommu_domain *domain =
>> +		container_of(msi_table, struct riscv_iommu_domain, msi_table);
>> +	const int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>> +
>> +	/* Guest IMSIC GPA mapping only exists in second-stage translations. */
>> +	if (!domain->gscid)
>> +		return -EOPNOTSUPP;
>> +
>> +	return iommu_map(&domain->domain, gpa, hpa, IMSIC_MMIO_PAGE_SZ, prot,
>> +			 GFP_ATOMIC);
>> +}
>> +
>> +int riscv_iommu_msi_table_replace_gpa_leaf(struct riscv_iommu_msi_table *msi_table,
>> +					   dma_addr_t gpa, phys_addr_t old_hpa,
>> +					   phys_addr_t new_hpa)
>
>
>This might fit better inside generic_pt rather than in the driver,
>since it walks the page tables on its own and duplicates things
>the library already owns, like the per-level index widths, the
>x4 root size, and the PTE layout.
>
>I recently tried something very similar, and doing this inside
>generic_pt turned out to be quite feasible (only a quick experiment,
>not cleaned up for posting).
>

Hi Shuai,

Thanks for the review. I agree the driver shouldn't carry format
knowledge that belongs to the library, but I think this particular
operation doesn't fit generic_pt.

This is not a generic page-table operation. It is a special
requirement of RISC-V IOMMU IRQ forwarding (irqbypass) on
implementations without an MSI page table: the guest IMSIC GPA
must be mapped into the second-stage domain, and when a vCPU's
VS-file host page migrates, its leaf must be replaced atomically.
Because a device may write an MSI at any moment, unmap + map
would fault. This operation is driven by the IRQ forwarding
state machine, and because I don't see another generic_pt format
sharing this flow, I think these helpers would be better placed
outside generic_pt. I plan to move them into iommu-ir.c so the
feature-scoped code stays together.

Thanks,
Fangyu

>Thanks,
>Shuai

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
