Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828E606A31A
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 14:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ozd0ma7j;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ExggUzQ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QAgrxOxvmq7sV6t9Xsp6arrJec4c39ezxljSkfvMpbw=; b=ozd0ma7j4zK4HFvuyVblhwVGTJ
	e9HNWJk8IpLt6lMwa2mX1Amkt3J9ZBlz9+0oghGKSSQhuDNr9dlrqF+vb3SeEaLidjPF8j+s0+M9k
	3hT9f9I1mg1XqJk8Li4WvHihBVecilz1wvBYlkVP2+T1anaBLqY8DESzg2bxy4R5yL33iGzp/cD9B
	qDQaeMp0su4jFTXku/hkQgSQA+23S/vzP5Kt2DfYcCMiJHVDeSmIYD9wYmuPr+0WCxicNxX4Jzyqm
	Bd/YLJ+QYK/zAp1cIbqo/58oA18QDMhSZcvYOfPnppuvuiCeH7i7hz/vMm9rvsmZUrtkS4go38/em
	hQ1FM+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnus-0000000BtPC-2c3t;
	Fri, 30 Oct 2026 14:49:14 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnup-0000000BtOY-305N;
	Fri, 30 Oct 2026 14:49:12 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEiNBi3396324;
	Fri, 30 Oct 2026 14:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=HEHKW4LBT6GpwoTEpcbAbsyC2GPR8D
	Dtx+QfBPo6gbI=; b=ExggUzQ455ydNTjuXERdQK9pJ5iTVLioyncMYKtaMrybI6
	krGz53pMUesedVdfoSwrjfyPFN6oKtLJ9ZGSc6iL6qdxumYmBDC53vPEnudKaHv7
	ymcnCFyMC7J+0pWxlYcBqIeK0xL5Z/9YzRGeSHdJ6yt7M3KM5utOvyLsWcKlRXcF
	yEHSvxiNs8gr20+K59YSPCoH6Bsi/Qm8mTA/OrqwXkpguyWfsWkKRySnaBj+fjZY
	gasiwKpQjKQZBIjrcRsE6shxU/5OSa3YS9rziGJQij26td/8OPz7JnoUzaAZC1iQ
	8CB0BpLwyIXpKLthffDo9so7x8Bqsy+nL7Fptlrw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hmeay399t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 14:48:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEZ5nw649967;
	Fri, 30 Oct 2026 14:48:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hm69e50qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 14:48:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69UEmjGw30737002
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2026 14:48:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E9BE2004B;
	Fri, 30 Oct 2026 14:48:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69B4D20040;
	Fri, 30 Oct 2026 14:48:38 +0000 (GMT)
Received: from li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com (unknown [9.124.208.227])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 30 Oct 2026 14:48:38 +0000 (GMT)
Date: Fri, 30 Oct 2026 20:18:35 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>,
        Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Stefan Teodorescu <fane@google.com>
Subject: Re: [PATCH 3/7] KVM: PPC: Explicitly force IPIs when directly
 kicking vCPUs
Message-ID: <auStM0rbFol79h5o@li-fbf77acc-29ba-11b2-a85c-e8e934f50a46.ibm.com>
References: <20261028190259.1819571-1-seanjc@google.com>
 <20261028190259.1819571-4-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261028190259.1819571-4-seanjc@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfX231ITCmOe99R
 dfESFyd3RUHjMlk75/eFc/1OXzNu84c9omPa7EIxtAYWLGJA9eAO3zzjK7VTQa9llnkJXi4gWU8
 r/unyeMYxDjuR+cWiyOnVdmS7GG+HF21UyJwsDX2Xub75Vlm2pm0bctwtvWSinYL1jvetutMT9u
 syV9gMRp2C27a9ai2jX5gVTbQI0zWTEnKBPJsAESqMw35ihGvBQsvADDXhk3kK6RJKPFkGzUu/R
 8hbWWaTe5yOXFUonP/DisFXU6OHDNrpGGIOnidy7knS9ossfiCuv+PjkyxIdfgZNrxB3ogLWnb/
 wIJApNH46JPjtF8WaAFMzRRJRq4ipRnblJwCI0gUhomM9spjDCQUvGpKUJceKZB8VwfgH+dzVOz
 eTTsRDooCRzKNdGwyScusI3QLV5OU6ngYDGXyI76iB5Vyotd+IKq7x3NvGErCC7qtLRge/dkbPg
 7yc+RWco6LUsGg+cWpw==
X-Authority-Analysis: v=2.4 cv=WJHqzXsR c=1 sm=1 tr=0 ts=6ae4ae52 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=1goJhm9fjgf-yEZC_jsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Zln3Uvbt51spdXgJNma7nXq9r9SgUHNe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1OCBTYWx0ZWRfX7S7KOd9POaV1
 Em+dt+hSOwRtH43TAR/rRI11q7Tee1s+P5cCU6Nfy9sKiFGQWrAn7ONzOJvQd/a2ydad09/AQ7n
 DooPLMaRQuyB21j0hWOf5aPFwNJGtms=
X-Proofpoint-GUID: OIZDK0-t9uUR5jTdFJ0BXTWF-ze0VlkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_074911_761594_DC05437C 
X-CRM114-Status: GOOD (  19.95  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:02:55PM -0700, Sean Christopherson wrote:
> Explicitly force an IPI when invoking kvm_vcpu_kick() directly instead of
> relying on kvm_arch_vcpu_should_kick() to unconditionally return 1/true.
> This will allow dropping kvm_arch_vcpu_should_kick() in favor of
> kvm_request_needs_ipi().
> 
> No functional change intended (1 || 1 == true).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
>  arch/powerpc/kvm/book3s.c          |  4 ++--
>  arch/powerpc/kvm/book3s_pr.c       |  2 +-
>  arch/powerpc/kvm/booke.c           |  6 +++---
>  arch/powerpc/kvm/e500_emulate.c    |  2 +-
>  arch/powerpc/kvm/powerpc.c         |  2 +-
>  6 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
> index 169ea6a7fbad..bbe7378ad0ef 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -30,6 +30,17 @@
>  #endif
>  #include <asm/inst.h>
>  
> +/*
> + * TODO: For unknown reasons, KVM PPC has historically ignored vcpu->mode when
> + *       determining if kicking a vCPU needs an IPI.  Either document why that
> + *       behavior is necessary, or drop this helper and the @force param from
> + *       __kvm_vcpu_kick().
> + */
> +static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
> +{
> +	__kvm_vcpu_kick(vcpu, false, true);
> +}
> +

AFAICS, there is no reason for PPC to always return 1. I was looking at
the old patches on mailing list and found this - https://lore.kernel.org/kvm/0FEE585F-5E21-47F2-A3F0-AD0DE05EBB43@suse.de

```
How about we return 1 for kvm_arch_vcpu_in_guest_mode() on !x86 always, just like it's done today basically? Then we can
worry about needless IPIs later and don't regress from the respective current kick implementations.
```

However, I'll do some testing and get back by mid next week to make sure
there are no suprises.


Thanks,
Gautam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
