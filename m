Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2172EBFD3B
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9T3apRBhnmtUbetVYKEIQKHSWMMfKSq5TBNEQq8/hs=; b=cogYXQ50oDyrPM
	wkjBFKwlbxfq7/DDUFA1RxnJHlYoxpgkKxGpqKeKdCeNdS6PAUHFDNjQQzAbMlPjwwYIH+Dx8hpK2
	55KfdL2Ruhsf9oRQ0YE/Tqr1nCH+yCJ0EiAFTFvoxOPYeOa+4mEKiyOkpj8YRB/NcDP/FVAV370hi
	LEjNZFCXhNAJY3wrrn06EXbteFAnDzhAm0Lvmav5IXBTi2tJ5kNI8TEx+00zQI4NpQhVjVVC1MF4S
	QlhQxCO9UHl1Evlp/3jOVu9eeYST6HHwBTCr/1dNqpWc/3AVosF1MDQLETTOr/tVi92oo7LBfSDWS
	12dCrJOj0cQ6gs0Le0Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFHD-0000000FYkk-2QnO;
	Mon, 13 Apr 2026 11:16:23 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFH9-0000000FYkJ-2Vx2;
	Mon, 13 Apr 2026 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1776078971; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Fg7zc1O+7fxsBgREHbt/NhuoP2H8B/ZI+5a2SV45XUY=;
	b=ZnsCP2/OVuhidVFB3JMgmf8DeVW9L0/mnW63+NAEQaOv5b+v/TkFKxwjpPxCAifLBmnLMqM9HA1Wk3u/ZOq+Xrrcuz4HbRaxNNUTkZ7zad9LucULIhlsToU9Qdv3Ppv7gnPFpHQrVSqXWZ19xzOLsGwY9zPe4aY3cIJ8fFEPajg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0vN5Dx_1776078964;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0vN5Dx_1776078964 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 13 Apr 2026 19:16:06 +0800
From: fangyu.yu@linux.alibaba.com
To: kevin.tian@intel.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: RE: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic page table 
Date: Mon, 13 Apr 2026 19:16:01 +0800
Message-Id: <20260413111601.26167-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <BN9PR11MB527696935354C345259C39E18C242@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_041620_390041_1667D1BB 
X-CRM114-Status: UNSURE (   5.24  )
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

>> From: fangyu.yu@linux.alibaba.com <fangyu.yu@linux.alibaba.com>
>> Sent: Saturday, April 11, 2026 10:22 AM
>>
>> diff --git a/include/linux/generic_pt/common.h
>> b/include/linux/generic_pt/common.h
>> index fc5d0b5edadc..dfadf8a5752a 100644
>> --- a/include/linux/generic_pt/common.h
>> +++ b/include/linux/generic_pt/common.h
>> @@ -188,6 +188,7 @@ enum {
>>  	 * Support the 64k contiguous page size following the Svnapot
>> extension.
>>  	 */
>>  	PT_FEAT_RISCV_SVNAPOT_64K = PT_FEAT_FMT_START,
>> +	PT_FEAT_RISCV_SVPBMT,
>>
>
>nit - every feature has a comment.

Thanks Kevin.
I'll add a comment for PT_FEAT_RISCV_SVPBMT in the next revision.

Fangyu,
Thanks
>
>Reviewed-by: Kevin Tian <kevin.tian@intel.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
