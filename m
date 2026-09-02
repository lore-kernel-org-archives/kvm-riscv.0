Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A641CC624D3
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 17:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtzMqJz7BeI8s94PQuctqI9Ew3pPjk5+R7lRIvvsiW8=; b=LxsI7uWkmG5n9X
	USPFDNM+9mxO5rXXgwUfy/EfIooNyGQIkFT7oJUPcamDCmVIlluGI9ytauGI3/cPPSLRoDyw/mi0i
	+8H/L5m/bbLwyOLBcJVKRvzj++RfVC6jTDXuApz0YS+xIpppAZocVAv6b1n5X0OEHyQeQIZkNX3gX
	+cIg+zLXhR4/bZVlbFXDeyZKUjeRIJGJaSXRIwfD/7LOwjF1kE70nAlOce/pVt+VYvZV017gjYprh
	RGsJa7u8BU2v2D6HW9EEtugTfXfUFHlWXZNdjq3xWWCSxEcKqPodjcY7J/WPFbIEF4ot1Ltgp3hCh
	l20HuMdP6q+1baZMzsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p6g-0000000FUNU-1C4g;
	Wed, 02 Sep 2026 17:50:42 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p6d-0000000FUMY-3Zbe;
	Wed, 02 Sep 2026 17:50:40 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HVX5T661031;
	Wed, 2 Sep 2026 17:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=2zxCRH2Pa3iAwixoctL7pgt0yldury
	ffLGkXYhDDWgo=; b=HB6vq6Y8GBfc7IpvgOzihYIsPzf3RTXk209jL0vXKfZDot
	IFEp9+OLKQO6Q3W+dyOOOgEx1SRjvN5p+gBD0y1gCJLbnxymXtxg9CiAVrb+cUqU
	QO4Q7RrHmlwG2UvMV3WLnSx+4xUt/5nAtixHREA7bmP/zZxpnjIEj4PevYnJoyCl
	NJ1V4Z+j8lLAvEICZLcRCJsrA47rairPNkkBRspJbcmWzDyTMLYph5h794opLxDZ
	jhV/RM+isETBerUhsg2PI95AqPE9Ye9ffcGF7xOJ8J66CMoAOKXxN6yh61icMbTs
	UJ+dh10b6+VV49Eteno69A0h85kg/hoEQoConc0A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbpx5rdxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:50:25 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 682HfHAB010675;
	Wed, 2 Sep 2026 17:50:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcb8hkb4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 17:50:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 682HoJBA46137656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 17:50:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C6B012004B;
	Wed,  2 Sep 2026 17:50:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 140D020040;
	Wed,  2 Sep 2026 17:50:13 +0000 (GMT)
Received: from Gautams-MacBook-Pro.local (unknown [9.124.221.176])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Sep 2026 17:50:12 +0000 (GMT)
Date: Wed, 2 Sep 2026 23:20:10 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH 05/20] KVM: selftests: Use goto instead of do-while to
 retry finding unused physical pages
Message-ID: <aphh0iKilyKB49Zu@Gautams-MacBook-Pro.local>
References: <20260826230511.972824-1-seanjc@google.com>
 <20260826230511.972824-6-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826230511.972824-6-seanjc@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=PPc/P/qC c=1 sm=1 tr=0 ts=6a9861e1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=pGLkceISAAAA:8
 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=ltp-RmMtnFz0lCvsd_sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 3ScqGv2K8Dt7nfPJbaBaETFFBeSGjejQ
X-Proofpoint-ORIG-GUID: LG5qJR2caqz52XYlYvzXZdnlK72ZSnfk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE1NCBTYWx0ZWRfX+HxKSt8hWVrc
 YfmjqJFKYHxPg++Mh4QHaj2wvQeMjXYKEG+sxyRkwANZESW6B1+4xYyvc2Va/w3wYOSbthYXLNq
 Yr26cG8rq91m8mDaK3f8tlDadUmUIKk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE1NCBTYWx0ZWRfX8DFqvTCmGcC5
 GXjfFYF2n30p9gVq95X9qGlkw+gHd4t/EAQD+8eXbSWjzEYGQrxMnvCU0FN+0efAGe8ivJ75vgz
 0QQ9sO1j6BZUN16aCVm1uYWpyWpGG1tclreVecQHGgQrexYrVu9K8iImBlxASJovJJ4rum3SBCI
 utCzEVVy/DlLTzJUilcgXnEeADHNQCK83khl1KokN+S3C4YDeCGWvE6CM11fdIiBbnChuZDT5PE
 uzI5k7R2N4eyt2QfYnfWLhIZGFxqeSAzNUB69/EkFYqbmKWui1/0OfYcZEZ8QxhF3O9DOqDfGiG
 yVFxw+0yy9sVmByhcxaix+rDZKD2/fIaw/j9UOWH94F3bgt7UOHFs3IAtAXvAWZfTFS6Ly/bXyI
 cCNVR61I8ybWF29bRK3EcSSvgy9WPVg5MgaGEczcSR50/d9b8EW6jARWEj3umGOpKqrcjc0n08j
 Bbmjg/IPHMqc1jrLgvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105039_902781_83B3EED5 
X-CRM114-Status: GOOD (  23.76  )
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

On Wed, Aug 26, 2026 at 04:04:56PM -0700, Sean Christopherson wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> Rework the core loop of the physical page allocator to use a goto instead
> of do-while loop when retrying with a new base address.  The do-while loop
> obviously works, but it obfuscates the success vs. failure paths, and in
> general is convoluted.
> 
> For all intents and purposes, no functional change intended.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> [Rebased to latest mainline tree]
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> [sean: separate from alignment change, use enomem label, write changelog]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 32 +++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index b071d77dd301..bbf6d7684c0c 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2049,23 +2049,15 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
>  	TEST_ASSERT(!protected || region->protected_phy_pages,
>  		    "Region doesn't support protected memory");
>  
> -	base = pg = min_gpa >> vm->page_shift;
> -	do {
> -		for (; pg < base + nr_pages; ++pg) {
> -			if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
> -				base = pg = sparsebit_next_set(region->unused_phy_pages, pg);
> -				break;
> -			}
> +	base = min_gpa >> vm->page_shift;
> +again:
> +	for (pg = base; pg < base + nr_pages; ++pg) {
> +		if (!sparsebit_is_set(region->unused_phy_pages, pg)) {
> +			base = sparsebit_next_set(region->unused_phy_pages, pg);
> +			if (!base)
> +				goto enomem;
> +			goto again;
>  		}
> -	} while (pg && pg != base + nr_pages);
> -
> -	if (pg == 0) {
> -		fprintf(stderr, "No guest physical page available, "
> -			"min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
> -			min_gpa, vm->page_size, memslot);
> -		fputs("---- vm dump ----\n", stderr);
> -		vm_dump(stderr, vm, 2);
> -		abort();
>  	}
>  
>  	for (pg = base; pg < base + nr_pages; ++pg) {
> @@ -2075,6 +2067,14 @@ gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
>  	}
>  
>  	return base * vm->page_size;
> +
> +enomem:
> +	fprintf(stderr, "No guest physical page available, min_gpa: 0x%lx page_size: 0x%x memslot: %u\n",
> +		min_gpa, vm->page_size, memslot);
> +	fputs("---- vm dump ----\n", stderr);
> +	vm_dump(stderr, vm, 2);
> +	abort();
> +	__builtin_unreachable();
>  }
>  
>  gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa, u32 memslot)
> -- 
> 2.55.0.887.g758fc8c411-goog
> 


Acked-by: Gautam Menghani <gautam@linux.ibm.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
