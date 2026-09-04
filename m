Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63018C624DE
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gqp7i44pdklC8JbYYpZ1APKhTlL89YxO5sZ5JxyHkQ=; b=1UZRLl0L1CTxPs
	KnRFeRRAA1fDnk8oHJtQ4zMzkv5oEIRgA9+mm8AJNBtKN9w4tuo/14xl5aNcbYcYJHiSdsMHkZ8ef
	FCECa03OPTFxsVIlJpGOBHDJui+gwfQY1/V7iT/WBPXBnhoB3DN3yUTbgfbp5Llh7MYcO1DhRBrQI
	WwehvXD6Esd+Thqf3IBdZ2/p638aaniu+0EGPMTCom5K/7kHTL0dbiPFlANS3iYKbYVehH5ifCsw6
	o8KpUZc7CkMJhO8PpbNusbw7235NXF90DImlK2h1ELaeRyZ5NqhhGMvjX9qLmC/0LRmvhR1VVW3pz
	RijLq0RQo/ScN+bPWpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SNu-00000001uXF-2GQd;
	Fri, 04 Sep 2026 11:47:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SNr-00000001uVH-269m;
	Fri, 04 Sep 2026 11:47:04 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AVULO1494058;
	Fri, 4 Sep 2026 11:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=CW3vxjA5wTt3e2Lkv1OSc2ps48i5Up
	xjTiNuU2k3ZY4=; b=ZtqwcJXn5JjmXK2TedINfsQgvWM0AhEuCR8XMhF5sCghQ2
	v230MU9wmpif2eXtIPwp5SCe9ncyfCxRPcTrpDXEkmD1miQCYnFc6Gg0se6DhOHK
	ISZeX1ugcVanxPwHmfopz1JLGjknKWnVzWbUsbdYAeQifUpCGC0YmzdoDPHQiIjQ
	Ehb+5yIWXzN9ao4EDI3kMKGdovDa7o8ruBgXpk6+kgM1EpQcUEWdEv2l+X+eJWZs
	ZJ0WjNJmqWERrBJ1Rmo5mOTjR3fUZnBLdZDwLYzdXMhtTaKrN2k+A23z7NK77nsB
	5hmnkJ2B9aWPjzJR8H+guVTJe5xyBizBVPTun6Xg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq55ajhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:41:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 684BfHje002278;
	Fri, 4 Sep 2026 11:41:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcbygvnb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:41:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 684BfY7345154586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Sep 2026 11:41:34 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9660E2004B;
	Fri,  4 Sep 2026 11:41:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 506BB20040;
	Fri,  4 Sep 2026 11:41:29 +0000 (GMT)
Received: from dhcp-9-123-3-18.bl1-in.ibm.com (unknown [9.123.3.18])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  4 Sep 2026 11:41:29 +0000 (GMT)
Date: Fri, 4 Sep 2026 17:11:26 +0530
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
        linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@fujitsu.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate
 multiple page table pages
Message-ID: <apquZpW2qQKO2ut6@dhcp-9-123-3-18.bl1-in.ibm.com>
References: <20260902164123.2546762-1-seanjc@google.com>
 <20260902164123.2546762-11-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDEwNCBTYWx0ZWRfX0Aoocv+enqPy
 aAHT452RrJdq6SGsyysUOLwIt05V+7QWTcYIwPhxSJ8PpoZLIWaD0eknmM2AjE6j895e9ceNN9y
 n/MFYB7qDup5ZpVogUz9zCco9JBq7PIsp4p139vHdb3xAULB7scjdOrPgQaTHrNsxlx3QechR0B
 thNj5adTK1H6yFG0fUQs8l5P3Q07ZrZWnUQdLyXlAG5z5eagZB064/ZmfrBaBZqh3ecFAL8Xf8K
 dLY1A+9rj7dKrDJaQGKuYpHRMuQkc48MGlyetM4MQIltnExj3Ilh2S1xM8viLxBDLcnIrt1tFh6
 Ex4+C1O1XXJ6+2AIYfbt69aKnQksr7gupT44zIaWrQtaTqrfAzzuKBJqZpUduWJzXnD7V6p/K6g
 YqRwsMvR7Fj1lzVxu4q/By/jmikEq+An7rp4/XrW23m9IX3cp2CTBmuxKj/yw9U10c0TBqETXbe
 0N1BmAqqrAebaBtq9JQ==
X-Proofpoint-ORIG-GUID: FOemvUVA6EC5QNrBSWqfJgS9IV7SOAo1
X-Authority-Analysis: v=2.4 cv=CNgamxrD c=1 sm=1 tr=0 ts=6a9aae74 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=omOdbC7AAAAA:8
 a=1XWaLZrsAAAA:8 a=VnNF1IyMAAAA:8 a=PQm9XMsn1R9s6TzZnB4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: oezkvRzJlqy-qd0w4ak4ksf3GbxB-t4v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDEwNCBTYWx0ZWRfX4JTqGICJcYX2
 0ueBv90Fpcuo7VOTmVQ5oYB6OFExT2sdH7SJ6GMdoluxil3EZKa42dPYC6ihbQugc/GTpVH+fqy
 XbaXe1nlxV6xMxpI+8M+abze3HvmBMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_044703_550636_B8037DD9 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Sep 02, 2026 at 09:41:13AM -0700, Sean Christopherson wrote:
> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
> 
> No functional change intended.
> 
> Reviewed-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/kvm_util.h    | 9 +++++++--
>  tools/testing/selftests/kvm/lib/arm64/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 4 +---
>  tools/testing/selftests/kvm/lib/s390/processor.c  | 8 ++------
>  4 files changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index d9d39a8894e2..c56f342b16fd 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -1013,10 +1013,15 @@ static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
>  	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
>  }
>  
> +static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
> +{
> +	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> +				  vm->memslots[MEM_REGION_PT]);
> +}
> +
>  static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
>  {
> -	return vm_phy_page_alloc(vm, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -				 vm->memslots[MEM_REGION_PT]);
> +	return vm_alloc_page_table_pages(vm, 1);
>  }
>  
>  /*
> diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
> index 01325bf4d36f..2dcaa2c4a038 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/processor.c
> +++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
> @@ -115,9 +115,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>  	if (vm->mmu.pgd_created)
>  		return;
>  
> -	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
> -					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -					 vm->memslots[MEM_REGION_PT]);
> +	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
>  	vm->mmu.pgd_created = true;
>  }
>  
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..c175dcd14114 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -69,9 +69,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>  	if (vm->mmu.pgd_created)
>  		return;
>  
> -	vm->mmu.pgd = vm_phy_pages_alloc(vm, nr_pages,
> -					 KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -					 vm->memslots[MEM_REGION_PT]);
> +	vm->mmu.pgd = vm_alloc_page_table_pages(vm, nr_pages);
>  	vm->mmu.pgd_created = true;
>  }
>  
> diff --git a/tools/testing/selftests/kvm/lib/s390/processor.c b/tools/testing/selftests/kvm/lib/s390/processor.c
> index fb9dab92d4d1..33f49d743b5f 100644
> --- a/tools/testing/selftests/kvm/lib/s390/processor.c
> +++ b/tools/testing/selftests/kvm/lib/s390/processor.c
> @@ -20,9 +20,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
>  	if (vm->mmu.pgd_created)
>  		return;
>  
> -	gpa = vm_phy_pages_alloc(vm, PAGES_PER_REGION,
> -				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -				   vm->memslots[MEM_REGION_PT]);
> +	gpa = vm_alloc_page_table_pages(vm, PAGES_PER_REGION);
>  	memset(addr_gpa2hva(vm, gpa), 0xff, PAGES_PER_REGION * vm->page_size);
>  
>  	vm->mmu.pgd = gpa;
> @@ -38,9 +36,7 @@ static u64 virt_alloc_region(struct kvm_vm *vm, int ri)
>  {
>  	u64 taddr;
>  
> -	taddr = vm_phy_pages_alloc(vm,  ri < 4 ? PAGES_PER_REGION : 1,
> -				   KVM_GUEST_PAGE_TABLE_MIN_PADDR,
> -				   vm->memslots[MEM_REGION_PT]);
> +	taddr = vm_alloc_page_table_pages(vm, ri < 4 ? PAGES_PER_REGION : 1);
>  	memset(addr_gpa2hva(vm, taddr), 0xff, PAGES_PER_REGION * vm->page_size);
>  
>  	return (taddr & REGION_ENTRY_ORIGIN)
> -- 
> 2.55.0.966.g6673acef38-goog
> 


Acked-by: Gautam Menghani <gautam@linux.ibm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
