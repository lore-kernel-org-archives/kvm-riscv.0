Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9AD103E2F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YY2nQ+uKf+1mveoEwnWCMjaITCia9gB9ijdPpK/6urY=; b=SLcPOsUHN3rLJ1
	LFpo6BQg//+wn5zQevRNCKWcEBekIk05y7g6bQaZsiGnOLlAgUFCTJBkCa/s1sEcyNjmSIssk9hgg
	gWYDvcKQsQZf3fc+U5y7ztw9Xw9Q0vRX01lDpMfJ1WQWkg5bxIdlp3hU3+Q2q9NS8x8FJBqZAPIXw
	x2Ao+ejDmj13rGZfvT3tgg8nnWxNq/r8Z/AHQKalsCg9mXK0VZmLVt/VrIKxDVhNNN30xJfN1xany
	8jwESDr8rdqNLkiL6OkzpFupSeocXdSOBgDfoe9Ny63BE6RtHe4/VmNaStFv5khIWtjKOkdImSB3N
	NTeMOQ7PXMe8FKAbfYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0UjV-0000000CzYI-3omB;
	Thu, 12 Mar 2026 01:21:01 +0000
Received: from smtp37.cstnet.cn ([159.226.251.37] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0UjQ-0000000CzVp-2TnF;
	Thu, 12 Mar 2026 01:21:00 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-12 (Coremail) ; Thu, 12 Mar 2026 09:20:45 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Thu, 12 Mar 2026 09:20:45 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Andrew Jones" <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Atish Patra" <atish.patra@linux.dev>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paolo Bonzini" <pbonzini@redhat.com>, 
	"Paul Walmsley" <pjw@kernel.org>, "Shuah Khan" <shuah@kernel.org>, 
	"Jiakai Xu" <jiakaiPeanut@gmail.com>
Subject: Re: Re: [PATCH v3 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read() and pmu_fw_ctr_read_hi()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <2apicvahmomu57i7gjd2cgc5cakq4pxsbphz5xnl4cr2sqvp72@hqud4u6bo53b>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
 <2apicvahmomu57i7gjd2cgc5cakq4pxsbphz5xnl4cr2sqvp72@hqud4u6bo53b>
MIME-Version: 1.0
Message-ID: <70069435.611f3.19cdfa1bfed.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: tgCowAC3wtLtFLJpJeEVAA--.7213W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBg0ECWmx5lWRSAABs1
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182057_521963_BC619FF6 
X-CRM114-Status: GOOD (  17.90  )
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

Hi drew,

Thanks for the review and suggestion. 
I'll fix the alignment and send v4 shortly.

Best,
Jiakai

&quot;Andrew Jones&quot; &lt;andrew.jones@oss.qualcomm.com&gt;wrote:
> On Tue, Mar 10, 2026 at 05:55:56AM +0000, Jiakai Xu wrote:
> > When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ or
> > SBI_EXT_PMU_COUNTER_FW_READ_HI on a firmware counter that has not been
> > configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the pmc->event_idx remains
> > SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
> > lower 16 bits, yielding 0xFFFF (65535), which is then used to index into
> > kvpmu->fw_event[]. Since fw_event is only RISCV_KVM_MAX_FW_CTRS (32)
> > entries, this triggers an array-index-out-of-bounds:
> > 
> >   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
> >   index 65535 is out of range for type 'kvm_fw_event [32]'
> > 
> > Add a check for the known unconfigured case (SBI_PMU_EVENT_IDX_INVALID)
> > and a WARN_ONCE guard for any unexpected out-of-bounds event codes,
> > returning -EINVAL in both cases.
> > 
> > Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> > Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > ---
> > V2 -> V3:
> > - Added check for SBI_PMU_EVENT_IDX_INVALID.
> > - Added WARN_ONCE for unexpected out-of-bounds event codes.
> > V1 -> V2:
> > - Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
> > commit.
> > - Removed the pr_warn, simply returning -EINVAL instead.
> > ---
> >  arch/riscv/kvm/vcpu_pmu.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index e873430e596b..c87a7b0037cf 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -226,7 +226,14 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
> >  	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
> >  		return -EINVAL;
> >  
> > +	if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> > +		return -EINVAL;
> > +
> >  	fevent_code = get_event_code(pmc->event_idx);
> > +	if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> > +				  "Invalid firmware event code: %d\n", fevent_code))
> 
> Align under previous parameter, not the >= operator
> 
>  if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
>      "Invalid firmware event code: %d\n", fevent_code))
> 
> > +		return -EINVAL;
> > +
> >  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> >  
> >  	*out_val = pmc->counter_val >> 32;
> > @@ -251,7 +258,14 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
> >  	pmc = &kvpmu->pmc[cidx];
> >  
> >  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> > +		if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> > +			return -EINVAL;
> > +
> >  		fevent_code = get_event_code(pmc->event_idx);
> > +		if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> > +					  "Invalid firmware event code: %d\n", fevent_code))
> > +			return -EINVAL;
> > +
> >  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
> >  	} else if (pmc->perf_event) {
> >  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> > -- 
> > 2.34.1
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
