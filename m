Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587DC606A31D
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NSqVgQ2E;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Na6KxF/1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tkp5h9UFLm7m4SqfFU4PWhYX3ttBNy6SLBXyP7AIjpc=; b=NSqVgQ2EjeiVScoExrWzft8rlp
	20r1vx++f3w3Iu29MHRewaRaIappb4loFoN8fVZ7aQsGOd1Wgo7uy92rY0zM/ek1VrHRhq3vwCJK8
	WNnYsC5S/Y/cpeupvyyxoGLZBgZi1PaRCL7169KR3fenlQBYWuSWCYA4HeDwkW5FH9idbcPYn4b9m
	BD6dajvEfHBml6JA3OG97YRW3MNBG/2aCnjAuuYIt0UXGxrUcMsDcey88o8PE8gFK2NQQW0CPdG2f
	Kf+XtRcobQCAzxSBQQxMZ1KyJpgKyeYhBarK7T0IzFrCai6HiexZpt8tUKBmhfZRUvw9UCsOjhmzC
	Pu0y/41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcgp-0000000AgWC-3his;
	Fri, 30 Oct 2026 02:50:00 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMcgm-0000000AgV0-3TQS;
	Fri, 30 Oct 2026 02:49:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793328589; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=CfEmxolAK8lSlcJ/IDJ4OjlHBkMazQyT8J7ibClDgoI=;
	b=Na6KxF/102AdTUz136z8HdPBWN7K2OpcY6fLCIFV7ntQeUOYXMA0TxGnMETPUWWZ1x3iAbOi/k4GGPTO//4ABi1riQfMO3RwZqDZIhFtmdX4VP38tQOKcj+Lvr50235AwYqeFDd+8sCmn26NoFN/IPOcs0xSV3dIanAYu9i6rHI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDkuzbU_1793328587;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDkuzbU_1793328587 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 30 Oct 2026 10:49:48 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 03/10] iommu/riscv: report iommu capabilities 
Date: Fri, 30 Oct 2026 10:49:46 +0800
Message-Id: <20261030024946.93889-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261030023104.51259-1-gong.shuai@sanechips.com.cn>
References: <20261030023104.51259-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_194957_150584_8E5257FE 
X-CRM114-Status: GOOD (  10.59  )
X-Spam-Score: -17.6 (-----------------)
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>Hi Fangyu,
>
>> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>>
>> Report RISC-V IOMMU capabilities required by VFIO subsystem
>> to enable PCIe device assignment.
>>
>> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>
>This patch has already been merged
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3069e8f3e1e9bdf007316eadae4d1777065e7b78
>

Thanks for pointing that out. I'll drop this patch in the next version.

Thanks,
Fangyu

>Thanks,
>Shuai
>
>> ---
>>  drivers/iommu/riscv/iommu.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index fe8e6d0f8a23..40beccedd39f 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1444,6 +1444,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
>>  	return generic_device_group(dev);
>>  }
>>
>> +static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
>> +{
>> +	switch (cap) {
>> +	case IOMMU_CAP_CACHE_COHERENCY:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>  static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
>>  {
>>  	return iommu_fwspec_add_ids(dev, args->args, 1);
>> @@ -1505,6 +1515,7 @@ static void riscv_iommu_release_device(struct device *dev)
>>
>>  static const struct iommu_ops riscv_iommu_ops = {
>>  	.of_xlate = riscv_iommu_of_xlate,
>> +	.capable = riscv_iommu_capable,
>>  	.identity_domain = &riscv_iommu_identity_domain,
>>  	.blocked_domain = &riscv_iommu_blocking_domain,
>>  	.release_domain = &riscv_iommu_blocking_domain,
>> --
>> 2.50.1

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
