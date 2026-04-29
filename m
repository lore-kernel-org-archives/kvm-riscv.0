Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7E9FF885A
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 01:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shgBDlBSS4Jxs7Onwv+fuLw0QEAP+IZMvxC+DHIbNm0=; b=2naFKiaF9XyahF
	IdGbbGtwUqEU4I690uSaPHtE9ahGqL3JpCpkWAApXrE0xIlSKhmsvDz4NXqljtI6oxiX7Af0bQHFW
	9/COUQrxNVv91u4cdftVarQd+FK5XOFdFszV4n8yWnYn8HHZeYhyVzHp3zKsboLmJAG5Xr9MXWTBZ
	I3sjFovUybOnHVYlMP/oWUsn3cwQO9ivRGQhXgAxE0FxFl7BPu5lhhzl24bV1mtjS8aMEfI5MNtT0
	YmSC+Gypo7mEbpdX80d3J/jUutYUnopi3Cyfc1K2JrrjYs7oRUqTp4NRBS1q+hLTQrDkzmNKWR3RX
	DJEPQwKnrW4TipE5nimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtOM-00000002h28-31tU;
	Wed, 29 Apr 2026 01:07:06 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHtOJ-00000002gzq-3Jc7;
	Wed, 29 Apr 2026 01:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1777424820; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ZIGgm1LnnTKQYeHSW75Afg46i5j+k0U/fuPrhUWSwJ4=;
	b=xUc/mCOL+4iTxg74PtcrlTrgAnqcdzd6s9rdaFQNCT2Kuq0J0FQDHEJwooTuN3Bq3nooKe8fSWR79nym0rdfIwQ4+x5Sh5Xws+7kS8DZbzCyY09/6v6OaZZ/dDuKhzE6XvWrZZja3mC4by2Q6StQHXh0fATBBrRjCsvJOH7wQes=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R361e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0X1vlBef_1777424814;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X1vlBef_1777424814 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 29 Apr 2026 09:06:56 +0800
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
Subject: Re: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp) page table support  
Date: Wed, 29 Apr 2026 09:06:50 +0800
Message-Id: <20260429010650.61646-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260428133239.GC849557@ziepe.ca>
References: <20260428133239.GC849557@ziepe.ca>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_180704_504864_96C87F75 
X-CRM114-Status: UNSURE (   4.98  )
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

>> @@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
>>  	case 57:
>>  		pt_top_set_level(&table->common, 4);
>>  		break;
>> +	/*
>> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
>> +	 * The top level is the same as for the first-stage counterpart.
>> +	 */
>> +	case 41:
>> +		pt_top_set_level(&table->common, 2);
>> +		table->second_stage = true;
>> +		break;
>
>Second stage needs to be an explicit PT_FEAT not implicitly deduced
>based on the vasz.

Agreed. I will add an explicit PT_FEAT_RISCV_SECOND_STAGE flag and
stop deriving second-stage semantics from vasz.

Thanks,
Fangyu

>
>Jason

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
