Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1606F30297
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 01:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jaYubB1OYGTibXRPIGcSqV+dIvnaFxdNVEt4nqYJ9E=; b=hhK/6IRfWUYn6E
	X6nG5E5i9GoXgmlscNFrTjjeW478RGpbby4J+KPRR2D+dC6wNATxv8bGAZE/xVhtYXZe9DKOLLqD0
	aHSVe5EwZFAIs38C4fslWLcu9J4gIgPI9U/A5jXbN3ny9i0hLvq3+rrOZIGwlOpF55uqyVRjtrBj0
	9SHN1nK+MXqhvDfAS2b3p4ySnESF58Dard0/q7bMxM4reYj2lO9APrtFD66ivLqbuA23Jen7FcClC
	1PSluEPA6M1ly6Ga3/HidhmFabO+6/af4JgKDR9TU2KN7bCi9Kz88ZI5oLXHfy2f2QKKkz3NuYOeS
	z28kKRG9jPu4mM6QkqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wwV-000000037qg-0ukj;
	Mon, 16 Mar 2026 01:40:27 +0000
Received: from smtp17.cstnet.cn ([159.226.251.17] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wwN-000000037kf-1AXV;
	Mon, 16 Mar 2026 01:40:22 +0000
Received: from xujiakai2025$iscas.ac.cn ( [210.73.43.101] ) by
 ajax-webmail-APP-09 (Coremail) ; Mon, 16 Mar 2026 09:39:34 +0800
 (GMT+08:00)
X-Originating-IP: [210.73.43.101]
Date: Mon, 16 Mar 2026 09:39:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jiakai Xu" <xujiakai2025@iscas.ac.cn>
To: "Nutty.Liu" <nutty.liu@hotmail.com>
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
Subject: Re: Re: [PATCH v3 2/2] RISC-V: KVM: selftests: Fix firmware counter
 read in sbi_pmu_test
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.1-cmXT5 build
 20240627(e6c6db66) Copyright (c) 2002-2026 www.mailtech.cn cnic.cn
In-Reply-To: <SE3PR04MB892267C1A570CF03E870BAADF345A@SE3PR04MB8922.apcprd04.prod.outlook.com>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-3-xujiakai2025@iscas.ac.cn>
 <SE3PR04MB892267C1A570CF03E870BAADF345A@SE3PR04MB8922.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Message-ID: <19053540.4b36.19cf44c69f9.Coremail.xujiakai2025@iscas.ac.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: swCowAAX7AtWX7dpjsoWAA--.63261W
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCQ4FCWmzulfEYwADsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184019_756014_0F6D3DED 
X-CRM114-Status: GOOD (  20.19  )
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

Hi Nutty, 

Thanks for the review!
I'll fix the indentation and send a v5.

Best Regards,
Jiakai

&quot;Nutty.Liu&quot; &lt;nutty.liu@hotmail.com&gt;wrote:
> 
> On 3/10/2026 1:55 PM, Jiakai Xu wrote:
> > The current sbi_pmu_test attempts to read firmware counters without
> > configuring them first with SBI_EXT_PMU_COUNTER_CFG_MATCH.
> >
> > Previously this did not fail because KVM incorrectly allowed the read
> > and accessed fw_event[] with an out-of-bounds index when the counter
> > was unconfigured. After fixing that bug, the read now correctly returns
> > SBI_ERR_INVALID_PARAM, causing the selftest to fail.
> >
> > Update the test to configure a firmware event before reading the
> > counter. Also add a negative test to ensure that attempting to read an
> > unconfigured firmware counter fails gracefully.
> >
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > ---
> > V2 -> V3:
> > - Removed unnecessary BIT(ret.value) & counter_mask_available check.
> > - Asserted ret.value == i after successful CFG_MATCH.
> > - Fixed eidx construction in SBI_EXT_PMU_COUNTER_CFG_MATCH.
> > ---
> >   .../testing/selftests/kvm/include/riscv/sbi.h | 37 +++++++++++++++++++
> >   .../selftests/kvm/riscv/sbi_pmu_test.c        | 20 +++++++++-
> >   2 files changed, 56 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> > index 046b432ae896..16f1815ac48f 100644
> > --- a/tools/testing/selftests/kvm/include/riscv/sbi.h
> > +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> > @@ -97,6 +97,43 @@ enum sbi_pmu_hw_generic_events_t {
> >   	SBI_PMU_HW_GENERAL_MAX,
> >   };
> >   
> > +enum sbi_pmu_fw_generic_events_t {
> > +	SBI_PMU_FW_MISALIGNED_LOAD	= 0,
> > +	SBI_PMU_FW_MISALIGNED_STORE	= 1,
> > +	SBI_PMU_FW_ACCESS_LOAD		= 2,
> > +	SBI_PMU_FW_ACCESS_STORE		= 3,
> > +	SBI_PMU_FW_ILLEGAL_INSN		= 4,
> > +	SBI_PMU_FW_SET_TIMER		= 5,
> > +	SBI_PMU_FW_IPI_SENT		= 6,
> > +	SBI_PMU_FW_IPI_RCVD		= 7,
> > +	SBI_PMU_FW_FENCE_I_SENT		= 8,
> > +	SBI_PMU_FW_FENCE_I_RCVD		= 9,
> > +	SBI_PMU_FW_SFENCE_VMA_SENT	= 10,
> > +	SBI_PMU_FW_SFENCE_VMA_RCVD	= 11,
> > +	SBI_PMU_FW_SFENCE_VMA_ASID_SENT	= 12,
> > +	SBI_PMU_FW_SFENCE_VMA_ASID_RCVD	= 13,
> > +
> > +	SBI_PMU_FW_HFENCE_GVMA_SENT	= 14,
> > +	SBI_PMU_FW_HFENCE_GVMA_RCVD	= 15,
> > +	SBI_PMU_FW_HFENCE_GVMA_VMID_SENT = 16,
> > +	SBI_PMU_FW_HFENCE_GVMA_VMID_RCVD = 17,
> > +
> > +	SBI_PMU_FW_HFENCE_VVMA_SENT	= 18,
> > +	SBI_PMU_FW_HFENCE_VVMA_RCVD	= 19,
> > +	SBI_PMU_FW_HFENCE_VVMA_ASID_SENT = 20,
> > +	SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD = 21,
> > +	SBI_PMU_FW_MAX,
> > +};
> > +
> > +/* SBI PMU event types */
> > +enum sbi_pmu_event_type {
> > +	SBI_PMU_EVENT_TYPE_HW = 0x0,
> > +	SBI_PMU_EVENT_TYPE_CACHE = 0x1,
> > +	SBI_PMU_EVENT_TYPE_RAW = 0x2,
> > +	SBI_PMU_EVENT_TYPE_RAW_V2 = 0x3,
> > +	SBI_PMU_EVENT_TYPE_FW = 0xf,
> > +};
> > +
> >   /* SBI PMU counter types */
> >   enum sbi_pmu_ctr_type {
> >   	SBI_PMU_CTR_TYPE_HW = 0x0,
> > diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > index 924a335d2262..9404577e4ad5 100644
> > --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> > @@ -436,6 +436,7 @@ static void test_pmu_basic_sanity(void)
> >   	struct sbiret ret;
> >   	int num_counters = 0, i;
> >   	union sbi_pmu_ctr_info ctrinfo;
> > +	unsigned long fw_eidx;
> >   
> >   	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
> >   	GUEST_ASSERT(probe && out_val == 1);
> > @@ -461,7 +462,24 @@ static void test_pmu_basic_sanity(void)
> >   			pmu_csr_read_num(ctrinfo.csr);
> >   			GUEST_ASSERT(illegal_handler_invoked);
> >   		} else if (ctrinfo.type == SBI_PMU_CTR_TYPE_FW) {
> > -			read_fw_counter(i, ctrinfo);
> > +			/* Read without configure should fail */
> > +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
> > +					i, 0, 0, 0, 0, 0);
> > +			GUEST_ASSERT(ret.error == SBI_ERR_INVALID_PARAM);
> > +
> > +			/*
> > +			 * Try to configure with a common firmware event.
> > +			 * If configuration succeeds, verify we can read it.
> > +			 */
> > +			fw_eidx = ((unsigned long)SBI_PMU_EVENT_TYPE_FW << 16) |
> > +					  SBI_PMU_FW_ACCESS_LOAD;
> Nit: Also need to align with previous line ?
> 
> Otherwise,
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> 
> Thanks,
> Nutty
> > +
> > +			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH,
> > +					i, 1, 0, fw_eidx, 0, 0);
> > +			if (ret.error == 0) {
> > +				GUEST_ASSERT(ret.value == i);
> > +				read_fw_counter(i, ctrinfo);
> > +			}
> >   		}
> >   	}
> >   
-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
