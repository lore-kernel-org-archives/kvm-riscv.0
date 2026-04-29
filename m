Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEDEFF885A
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkfTEdmDPPBDsQ3Htl0FM5v32c0Vi7DRs4r/feH7cMk=; b=WVGKROdPS+MXCx
	sI2qM4B2t31N9k94IQyhqdJmQcXm/THkOTKVWmAHGgDfLP+s1TG4q7J1PTdHARobk9tp3U0fafiML
	moMbJjLQeNo1zyuOJ7xnqL5cztbm+MmKVufajyzInTTzsSxn7RV/3NJ0fYcPhvpC4HgSXq/PDDSxu
	PilxKnTt3ioQJFdME4DROynidXoGiMISt2LIBI9a+5/GXbxzorYcl5BO4a0kDIlM8k1VgZgLVcv0v
	/Q0+MissgKJE4GGvW4ziYn4O+tQT5AmgQ2QnUqY4pWslVBfXxyTbVqJkJ72ZixGhtlDCOiJhRsUpz
	gdfFRccDLBpDX8hhc8Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtvj-00000002jkk-2vkF;
	Wed, 29 Apr 2026 01:41:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtvi-00000002jkU-0Cek;
	Wed, 29 Apr 2026 01:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Oq4NJwjoZstdZY8Yv5UU3SU2nsmNBMRQGsHhZADtKDA=; b=abhByb7cl5u2oLtixwcqYPdyzv
	fs4lCbWAHErcVV/TOSPv3ZNEsGKp/UBeVlzK5S0uTP30I2B+fbm62xDpr2mcdek5UTda8tl2CwB8P
	OYV5B5UtQjR/J84ddD2GBkduYPMAVhBPtDvK4v1XQ2m1qw40vWHfIsFI6F2o3zYnijIV4iT5Ff1k6
	9Bc6tky+KZrmK31JWLDUZTKUvsEUgmfLvcFiu1XiuiuGa6Po+ocLtooq5/qgi9ePCJM+J75ob40bv
	9rs2v5x391zO+CpOV7qqJnlQw1GiR5482fL75bgXE25twfDK7EuT9Q5RJUOG58NDrXArG6xLJXcPN
	xIxY6Cuw==;
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtvd-00000004Qfv-15JH;
	Wed, 29 Apr 2026 01:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777426874; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Oq4NJwjoZstdZY8Yv5UU3SU2nsmNBMRQGsHhZADtKDA=;
	b=VSKdml4w+HMgsPobpPzzMENsn167DbERLU8UY+XHlLS0vmBsM9zz7A+xjEDpNwNqkg9JlTD/ypDTJmdUQJrmWqTfDM9rojxYuHC7L0NRF1ct9EHMOU5rAFBdI2CUJnHpg9EmHmdkQeyLBfWh9Quw7y4m2td/OwePRRkSfCWl2V8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vlN.5_1777426869;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vlN.5_1777426869 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:41:11 +0800
From: fangyu.yu@linux.alibaba.com
To: jgg@ziepe.ca
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 07/11] iommupt: Don't preset D when RISC-V IOMMU dirty tracking on 
Date: Wed, 29 Apr 2026 09:41:05 +0800
Message-Id: <20260429014105.66404-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133641.GF849557@ziepe.ca>
References: <20260428133641.GF849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024130_416203_0A017910 
X-CRM114-Status: UNSURE (   5.01  )
X-CRM114-Notice: Please train this message.
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

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> 
>> When mapping writable pages, the RISC-V format code currently
>> pre-sets the PTE D bit unconditionally.
>> 
>> If hardware dirty tracking is active (DC.tc.GADE set), the IOMMU
>> sets D autonomously on the first write. Pre-setting D makes every
>> new mapping appear dirty immediately and breaks dirty tracking.
>> 
>> Introduce PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE and, when set, leave
>> D cleared for new writable mappings so hardware can capture the
>> first write. Keep pre-setting D when dirty tracking is inactive.
>> 
>> Only meaningful for second-stage (iohgatp) page tables.
>
>You shouldn't need anything like this, the D bit is managed by the
>iommufd core appropriately. It *should* start out pre-set as that is
>faster when not tacking. Only once dirty tracking is started does D
>get cleared. User space is supposed to assume that everything is dirty
>prior to its first D clear.
>

Thanks, that makes sense. I will drop PT_FEAT_RISCV_DIRTY_TRACKING_ACTIVE
and rely on the iommufd core to manage D bit.

Fangyu

>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
