Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CB10AB83C
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 01:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htjTzhtvDv9uTlQM6m/NLPNMMwJRQJw254Lai+eMzJ0=; b=IzbXDYr4CyoJoC
	WnqoDIJngStiBFvKWVPhumq14r/WXMTT6f0571SsjAYiV0Pmd0lG3/97RlQCOYcj3V23glko+hWEc
	1VJRHB7Su/jE5cX3sTNyzZMjR/qmTEHHd8Ef+Y+CQsGEDLiqXHrhbqYEvi/1MwXVUSpFJ1EpFCLKn
	JrzlKhK3WIpeKOWQQxPngULL3lQpWg4tDTQXGpicwPkMFM+VPrMaHOng8wKqly83h4qABLpErfwju
	qm1hODKBWSiw0ky3Ic5d7KiyBEG4pABm3oDY0e5JzLq7Xni4nD19+0+B3oUyHJCOb8NzVKQVbOxuV
	nqWVAM24diwo1hAu/iUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wQg-00000006Vfk-2Plh;
	Fri, 27 Mar 2026 01:56:06 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wQe-00000006VfA-1lds;
	Fri, 27 Mar 2026 01:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774576562; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9kyhuOIWFId3eDnx5DH0/vTzPX6q9Kr9raPhodPIaWo=;
	b=w3Ao68KZobDThL25aFVAVFVSgc2cQPpzESgJq+BgtsW61vqkmCP9iMC4bnC2WtahJsoQyuItYFMRbs7t16PvNGVJG28iNbMDJAF/UYsV1+ptYbQRRNedBDOmmZVBvYvQVDVYBfKttQk/PJYODQMquyizxB72aqa+6E6SW7QaOuA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R641e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.mUkxK_1774576556;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.mUkxK_1774576556 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Mar 2026 09:55:57 +0800
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
Subject: Re: Re: [PATCH v5 2/3] RISC-V: KVM: Detect and expose supported HGATP G-stage modes 
Date: Fri, 27 Mar 2026 09:55:55 +0800
Message-Id: <20260327015555.79223-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAAhSdy2uMY+-9W34G3QJ3m9XWg2dq_PeNB_9j9B3viZaRg=SUQ@mail.gmail.com>
References: <CAAhSdy2uMY+-9W34G3QJ3m9XWg2dq_PeNB_9j9B3viZaRg=SUQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_185604_795259_B4350657 
X-CRM114-Status: GOOD (  13.99  )
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
>> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
>> supported by the host and record them in a bitmask. Keep tracking the
>> maximum supported G-stage page table level for existing internal users.
>>
>> Also provide lightweight helpers to retrieve the supported-mode bitmask
>> and validate a requested HGATP.MODE against it.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  arch/riscv/include/asm/kvm_gstage.h | 11 ++++++++
>>  arch/riscv/kvm/gstage.c             | 43 +++++++++++++++--------------
>>  2 files changed, 34 insertions(+), 20 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
>> index b12605fbca44..76c37b5dc02d 100644
>> --- a/arch/riscv/include/asm/kvm_gstage.h
>> +++ b/arch/riscv/include/asm/kvm_gstage.h
>> @@ -30,6 +30,7 @@ struct kvm_gstage_mapping {
>>  #endif
>>
>>  extern unsigned long kvm_riscv_gstage_max_pgd_levels;
>> +extern u32 kvm_riscv_gstage_mode_mask;
>
>s/u32/unsigned long/
>s/kvm_riscv_gstage_mode_mask/kvm_riscv_gstage_supported_mode_mask/
>

Ack, will switch the type to unsigned long and rename it to
kvm_riscv_gstage_supported_mode_mask in the next revision.

>>
>>  #define kvm_riscv_gstage_pgd_xbits     2
>>  #define kvm_riscv_gstage_pgd_size      (1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
>> @@ -75,4 +76,14 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>>
>>  void kvm_riscv_gstage_mode_detect(void);
>>
>> +static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
>> +{
>> +       return kvm_riscv_gstage_mode_mask;
>> +}
>> +
>> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
>> +{
>> +       return kvm_riscv_gstage_mode_mask & BIT(mode);
>> +}
>> +
>>  #endif
>> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
>> index 2d0045f502d1..328d4138f162 100644
>> --- a/arch/riscv/kvm/gstage.c
>> +++ b/arch/riscv/kvm/gstage.c
>> @@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
>>  #else
>>  unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
>>  #endif
>> +/* Bitmask of supported HGATP.MODE encodings (BIT(HGATP_MODE_*)). */
>> +u32 kvm_riscv_gstage_mode_mask __ro_after_init;
>>
>>  #define gstage_pte_leaf(__ptep)        \
>>         (pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
>> @@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>>         }
>>  }
>>
>> +static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
>> +{
>> +       csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
>> +       return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == mode);
>> +}
>> +
>>  void __init kvm_riscv_gstage_mode_detect(void)
>>  {
>> +       kvm_riscv_gstage_mode_mask = 0;
>> +       kvm_riscv_gstage_max_pgd_levels = 0;
>> +
>>  #ifdef CONFIG_64BIT
>> -       /* Try Sv57x4 G-stage mode */
>> -       csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
>> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
>> -               kvm_riscv_gstage_max_pgd_levels = 5;
>> -               goto done;
>> +       /* Try Sv39x4 G-stage mode */
>> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
>> +               kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV39X4);
>> +               kvm_riscv_gstage_max_pgd_levels = 3;
>>         }
>>
>>         /* Try Sv48x4 G-stage mode */
>> -       csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
>> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
>> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
>> +               kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV48X4);
>>                 kvm_riscv_gstage_max_pgd_levels = 4;
>> -               goto done;
>>         }
>>
>> -       /* Try Sv39x4 G-stage mode */
>> -       csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
>> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
>> -               kvm_riscv_gstage_max_pgd_levels = 3;
>> -               goto done;
>> +       /* Try Sv57x4 G-stage mode */
>> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
>> +               kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV57X4);
>> +               kvm_riscv_gstage_max_pgd_levels = 5;
>>         }
>>  #else /* CONFIG_32BIT */
>>         /* Try Sv32x4 G-stage mode */
>> -       csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
>> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
>> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV32X4)) {
>> +               kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV32X4);
>>                 kvm_riscv_gstage_max_pgd_levels = 2;
>> -               goto done;
>>         }
>>  #endif
>>
>> -       /* KVM depends on !HGATP_MODE_OFF */
>> -       kvm_riscv_gstage_max_pgd_levels = 0;
>> -
>> -done:
>
>Here are some statements from RISC-V privilege specification:
>"Implementations that support Sv48 must also support Sv39."
>"Implementations that support Sv57 must also support Sv48."
>"The conversion of an Sv32x4, Sv39x4, Sv48x4, or Sv57x4 guest physical
>address is accomplished with the
>same algorithm used for Sv32, Sv39, Sv48, or Sv57, as presented in
>Section 12.3.2, except that:"
>"hgatp substitutes for the usual satp;"
>
>Based on above it is a waste to try each and every mode.
>For example: if mode Sv48x4 is supported then Sv39x4 is also supported.
>

Radmi and I discussed this topic before; please refer to the following link:
https://lore.kernel.org/linux-riscv/20260131061238.52708-1-fangyu.yu@linux.alibaba.com/

>Regards,
>Anup

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
