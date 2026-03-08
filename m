Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1798BF55124
	for <kvm-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 01:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh1RRAo4tsH68aHMi8VUl2DWQHft+j+jmgLCFMkyjc8=; b=DAESVFVb2CLTEb
	qVHwoTThaSRtutDae74JCnJ+TzRGQZsNN0fCaocC773VsSdVQhrHwMN3pbaDcbFhtWwn9lL/91+qp
	meb1ZiIqmIm/4mFE4Yx6duM9+pS6D5Hxq2eQQqDQTRPaq4KE6tv0ALc+oO2Vermbsvj5gVwC4zta/
	QRfOTuNWqeAzKmFFMwEWoG3x1kHlzi5M422Q700Rtc9UqSyfVGLrkPMJ3MMwvIhSx9B0UYY/+pIuN
	x4pWDOuW6GrkYPngoThgys6lKb3dWnchqiCPtI6Wuy9DRP1aRR4kV+AsrhdBovDBCY1Qb6azlIL74
	MPewW/TS0FLGH9dSGUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz2ny-00000005cYS-2sEd;
	Sun, 08 Mar 2026 01:19:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz2nu-00000005cXz-0a2K;
	Sun, 08 Mar 2026 01:19:36 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQyYzqxpAXvWCQ--.23484S2;
	Sun, 08 Mar 2026 09:19:20 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH 1/2] RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read()
Date: Sun,  8 Mar 2026 01:19:19 +0000
Message-Id: <20260308011919.3891975-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bcshd6j3vdeorxxmsmjmj5vi52mmivfe247aw77mr75zsk4llk@h3rxaqe23sb5>
References: <bcshd6j3vdeorxxmsmjmj5vi52mmivfe247aw77mr75zsk4llk@h3rxaqe23sb5>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3yQyYzqxpAXvWCQ--.23484S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryDZFyDAFyUAr15KrWruFg_yoW8Aw1fpF
	Z3tFn0ya1xtFsrXFyxZr4DXr48Wwn3uFn8WrWrKryjgFs8JF97Wr4IkrWjkwsrCrn5WryS
	9a10gwn8C3WYvFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67
	AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUrZ2-UUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBg0ACWmsPiSXUwAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_171934_569323_391302AA 
X-CRM114-Status: GOOD (  18.84  )
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

Thanks for the clarification.

> Any changes that come out of the pr_warn audit will result in a separate
> patch or patches. That work can be done completely separately and submit
> as a separate series. Or, if you do it right now, you could append those
> patches to this series. Either way works for me.

I will submit the pr_warn cleanup as a separate patch series later.

> That's good and we should do that, but we should also do negative testing.
> So there should be a test case where we try to read a counter without
> configuring it and ensure everything fails gracefully.

Agreed. In v2, I will update the selftests to include both positive tests 
and negative tests.

> > diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > index 924a335d2262..0d6ba3563561 100644
> > --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > @@ -461,7 +461,14 @@ static void test_pmu_basic_sanity(void)
> >  			pmu_csr_read_num(ctrinfo.csr);
> >  			GUEST_ASSERT(illegal_handler_invoked);
> >  		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> > -			read_fw_counter(i, ctrinfo);
> > +			/*
> > +			 * Try to configure with a common firmware event.
> > +			 * If configuration succeeds, verify we can read it.
> > +			 */
> > +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> > +			        i, 1, 0, SBI_PMU_FW_ACCESS_LOAD, 0, 0);
> > +			if (ret.error == 0 && ret.value < RISCV_MAX_PMU_COUNTERS && BIT(ret.value) & counter_mask_available)
> 
> Put () around the & operator. checkpatch should have pointed that out.
> 

Noted, I will fix it in the next version.

> > +				read_fw_counter(i, ctrinfo);
> >  		}
> >  	}
> >  
> > -- 
> > 2.34.1
> >

I'll send out v2 shortly.

Thanks,
Jiakai


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
