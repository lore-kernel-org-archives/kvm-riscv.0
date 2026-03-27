Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CD510AB83C
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 01:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l1EdoG1N2Rd5Of/J4EpKbHESMy91w5gdSEfRc8PmBU=; b=Vj4BY45JdCmve8
	4G1A3K2IQLcDn756UByCuur3S6oY16T+vIM2DHiH1PEuiuQUCZB2shWbuzLVmgMyJfeXXpHSIev2a
	qPmfakMXOu92VCLJaw2JT9CqpG3veZslPh93i4FV2QAHkZDZridhVoIY12hBnoph3ZdVX7frF8yrh
	+w9oeZ5bYdg8/bQf0a7uvhhkKF1zkVPI33BDNwRFf3rbVUyPNM4i83ViqwVhQGgPk9c6NQUjhzTiI
	6jNDSc2B8qfDswhKBgJjernw5sAZasvp2RnDf7gQE87rIBmSddY3Ou3QEd+KOD4k4urnnvieUDUxJ
	f5ht7KkMxGIRyvXcEGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wQ3-00000006VbM-3yEg;
	Fri, 27 Mar 2026 01:55:28 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wQ0-00000006Vak-3blP;
	Fri, 27 Mar 2026 01:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774576514; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2uLbyltTDfwJ1fVF2fuBWPNnUybJwtx0WCtLyELmNt4=;
	b=FQ7jp4IkzAUQCDmG5ZJJX6OeIQjRV97t5E5+JTRlNbCmul+Ybq7s8xXqSeL3WV+Dv0BrsCRu/3bFjTTJXG8vhOr467DZLkS5BRZH9kC3F+squJTsL3eNRETTYPiuLad2e/1Bc54h692WbpeIHI1pjDnJz+bn1me4YTYYR6e5ih4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.mTcjL_1774576510;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.mTcjL_1774576510 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Mar 2026 09:55:11 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	radim.krcmar@oss.qualcomm.com
Subject: Re: Re: [PATCH v5 1/3] RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode 
Date: Fri, 27 Mar 2026 09:55:06 +0800
Message-Id: <20260327015506.79079-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAAhSdy059XmTckHrX8xjk44pR=1BkaUuPQ-Cf+4BRTBoigBZ+g@mail.gmail.com>
References: <CAAhSdy059XmTckHrX8xjk44pR=1BkaUuPQ-Cf+4BRTBoigBZ+g@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_185525_103881_F072A142 
X-CRM114-Status: UNSURE (   5.18  )
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

>> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
>> index cf34d448289d..c15bdb1dd8be 100644
>> --- a/arch/riscv/kvm/vmid.c
>> +++ b/arch/riscv/kvm/vmid.c
>> @@ -26,7 +26,8 @@ static DEFINE_SPINLOCK(vmid_lock);
>>  void __init kvm_riscv_gstage_vmid_detect(void)
>>  {
>>         /* Figure-out number of VMID bits in HW */
>> -       csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
>> +       csr_write(CSR_HGATP, (kvm_riscv_gstage_mode(kvm_riscv_gstage_max_pgd_levels) <<
>> +                             HGATP_MODE_SHIFT) | HGATP_VMID);
>>         vmid_bits = csr_read(CSR_HGATP);
>>         vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>>         vmid_bits = fls_long(vmid_bits);
>> --
>> 2.50.1
>>
>>
>
>Regards,
>Anup

Hi Anup:

Thanks for the review.

I'll incorporate all of the above changes and post an updated version (v6) shortly.

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
