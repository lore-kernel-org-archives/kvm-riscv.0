Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6109FC79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8btMLOe+C72tllsuWOghr+BypvtIdVL5RM6KSvogvqc=; b=UZF5faFVO5N3RP
	YDQvmbADcYBPHhzwoHBAQMm+D3UbBAU/gClfBVP6X2KE66fQJ19SaahrOEL7TmKf8OdP6SmKxr/gi
	J5aHio6D3ozvedN/1tVMi0CYbuAqhAxIUVVfaKvLQVdi0dgTqXJgT7ehe4AWGkffUMVon7xQeG8AT
	O1pfiOB2w5/+dZ0Ru/vyQZdkOalHeYJzTq/KmtgIOvxpj/n1Nbck50tQW43/xz8SEepArir3qtejQ
	5IVEgAnCtJwvhmYSLnJhhB9vE5xRK0j2l7jHi05sMv2YuCWhPNhXzRvezOxYIPNUC1VmDMuEhMDoh
	qUlbMeUnTTq0pbmbtGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c2L-0000000E3bL-43eo;
	Thu, 10 Sep 2026 10:29:45 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4c2J-0000000E3a1-2mAR;
	Thu, 10 Sep 2026 10:29:44 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A91hG72470478;
	Thu, 10 Sep 2026 10:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pQTAsz
	I1TmVRpCRTkW97/X5v70075OAf1hIIuQB4mNE=; b=lZFblbqiosL6xDcAbtpC7P
	mPddHsoqfuxsBuEuNerIJnMBrwq+ToJKXZMMM2O3Iw2CA5oyfK93kpSPmAXWI0DW
	gm/MV2/yR0ODYWhNy87SzjxUxZ4277MWWAJWs88XcGCFEkfZ5qP/yh18gjTl3Jfx
	UxwDYhf6bUbgxifbVJLzZCZvc851so/SwG9vmib2gNGV5hhfKVcSq4FcLMYyHV2K
	N7P16ueyyBsW9BPl9Cq2DAef9MUeD2h63v7+hk86FZZMR2sizZCb6VyWMffxE64v
	6Z7L2P0n6sxd7Sdj8TZ59dZ111I75TsBL/aBbRCm0IvW/gCvBKiPaY5lSygBocFA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gkd8qkw96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:29:27 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 68AAQEXp003686;
	Thu, 10 Sep 2026 10:29:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gkcr3buq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 10:29:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68AATMAM47383004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2026 10:29:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B58620040;
	Thu, 10 Sep 2026 10:29:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 591D02004B;
	Thu, 10 Sep 2026 10:29:20 +0000 (GMT)
Received: from p-imbrenda (unknown [9.111.48.108])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 10 Sep 2026 10:29:20 +0000 (GMT)
Date: Thu, 10 Sep 2026 12:27:56 +0200
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Tianrui Zhao <zhaotianrui@loongson.cn>,
        Bibo
 Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Christian
 Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank
 <frankja@linux.ibm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly
 <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Atish
 Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>,
        David
 Hildenbrand <david@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvm@vger.kernel.org, loongarch@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Itaru Kitayama <itaru.kitayama@fujitsu.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory
 region types with custom memslots
Message-ID: <20260910122756.0d5e221c@p-imbrenda>
In-Reply-To: <20260902164123.2546762-13-seanjc@google.com>
References: <20260902164123.2546762-1-seanjc@google.com>
	<20260902164123.2546762-13-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SpUFe/O0 c=1 sm=1 tr=0 ts=6aa28688 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=1XWaLZrsAAAA:8
 a=omOdbC7AAAAA:8 a=VnNF1IyMAAAA:8 a=o3WxS3FyySAVKeXb6_8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: v7v4mtkZlsWP3CPnySk9LLj2woDToHN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExNSBTYWx0ZWRfX6/yOnqjaLnEI
 4v/7hUVHGqJkizlCs5PMDvmEutm3CXXtCkoKX4TfnHXxm7ujtwzqMd7HgFWciYRAq5IB+CBWnsv
 feUZ72GV2522/ZGlEEASXg0nYo3VPTrcS6Kql9tGElNPr/7D7QE7iK6zUcjnZ45Gamjwy62GdAD
 4Lgb/SS+1yJOE3P6W69Lg6b8ej5515ZABtWaDL0e/EcFDRV42z8m9B8fmOFc6oZ99wsHeiGXzhv
 un4OcSi2B2F+1FP4FXigNIfYPJoju/bKqpLlj2ln4k7eFb7e7W2DjTrf0Cmn6b57JURaC9NM1it
 t1qqHNW4q7CX7/mVpE6Xz3MrO16JfSX44Air/PPjoaj5qZdT0r2ZRU3JWLDInc11DVGQh8vM0j9
 yoYlG6yeIrfAoTx8jPvERMOlrwOw/7baK4FIKzHlR3JdW1nnxdmcQPfb2qqZ8HUVjeWIkR49v8g
 ubyz/bH1Z0nCa2QueBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExNSBTYWx0ZWRfX6t7R0c3Qd7Mm
 5yMJNco0oC9hZmCD09h4uDdCV8nIJSBg76D0tOiZ88H3V6KaqByp3Oszdu8oXiEqw6PfHw7BICU
 Qhw2lM2JzfUoqtXX3hv0CEa8ySAVsyA=
X-Proofpoint-GUID: jLXjNdP4GXuH7AJZtGKws92zDjCmzW69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1011 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_032943_712310_3C3B7373 
X-CRM114-Status: GOOD (  24.25  )
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

On Wed,  2 Sep 2026 09:41:15 -0700
Sean Christopherson <seanjc@google.com> wrote:

> Add and use APIs to override memory region types instead of open coding the
> logic in tests, partly to dedup test code, but mostly to add some amount of
> protection against conflicting overrides.  This will allow converting more
> tests to override memory regions without taking on too much risk of bugs in
> the long term, e.g. due to silently overriding a region multiple times.
> 
> Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> create_main_memslot() to avoid filling all memslots in anticipation of
> adding an "extra" memslot that is for test use and *only* test use, i.e.
> shouldn't be configured by core library code.
> 
> Converting tests to overriding memory regions will allow taking the region
> type instead of the raw memslot in the physical page allocator APIs.
> 
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com>

> ---
>  .../selftests/kvm/arm64/page_fault_test.c     | 18 +++++------
>  .../testing/selftests/kvm/include/kvm_util.h  | 30 +++++++++++++++++++
>  tools/testing/selftests/kvm/lib/kvm_util.c    |  8 +++--
>  tools/testing/selftests/kvm/s390/cmma_test.c  | 19 ++++--------
>  4 files changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/page_fault_test.c b/tools/testing/selftests/kvm/arm64/page_fault_test.c
> index 6bb3d82906b2..b0e3fc8cd76a 100644
> --- a/tools/testing/selftests/kvm/arm64/page_fault_test.c
> +++ b/tools/testing/selftests/kvm/arm64/page_fault_test.c
> @@ -597,18 +597,16 @@ static void setup_memslots(struct kvm_vm *vm, struct test_params *p)
>  
>  	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0,
>  				    CODE_AND_DATA_MEMSLOT, code_npages, 0);
> -	vm->memslots[MEM_REGION_CODE] = CODE_AND_DATA_MEMSLOT;
> -	vm->memslots[MEM_REGION_DATA] = CODE_AND_DATA_MEMSLOT;
> +	____vm_override_mem_region(vm, MEM_REGION_CODE, CODE_AND_DATA_MEMSLOT);
> +	____vm_override_mem_region(vm, MEM_REGION_DATA, CODE_AND_DATA_MEMSLOT);
>  
> -	vm_userspace_mem_region_add(vm, p->src_type, data_gpa - pt_size,
> -				    PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
> -				    p->test_desc->pt_memslot_flags);
> -	vm->memslots[MEM_REGION_PT] = PAGE_TABLE_MEMSLOT;
> +	__vm_override_mem_region(vm, MEM_REGION_PT, p->src_type, data_gpa - pt_size,
> +				 PAGE_TABLE_MEMSLOT, pt_size / guest_page_size,
> +				 p->test_desc->pt_memslot_flags);
>  
> -	vm_userspace_mem_region_add(vm, p->src_type, data_gpa, TEST_DATA_MEMSLOT,
> -				    data_size / guest_page_size,
> -				    p->test_desc->data_memslot_flags);
> -	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
> +	__vm_override_mem_region(vm, MEM_REGION_TEST_DATA, p->src_type, data_gpa,
> +				 TEST_DATA_MEMSLOT, data_size / guest_page_size,
> +				 p->test_desc->data_memslot_flags);
>  }
>  
>  static void setup_ucall(struct kvm_vm *vm)
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 304ef6af3268..c8faa8a02b93 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -704,6 +704,36 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
>  		gpa_t gpa, u32 slot, u64 npages, u32 flags,
>  		int guest_memfd_fd, u64 guest_memfd_offset);
>  
> +
> +static inline void ____vm_override_mem_region(struct kvm_vm *vm,
> +					      enum kvm_mem_region_type type,
> +					      u32 slot)
> +{
> +	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
> +		    "Memory region type '%u' was already overridden with slot=%u",
> +		    type, vm->memslots[type]);
> +
> +	vm->memslots[type] = slot;
> +}
> +
> +static inline void __vm_override_mem_region(struct kvm_vm *vm,
> +					    enum kvm_mem_region_type type,
> +					    enum vm_mem_backing_src_type src_type,
> +					    gpa_t gpa, u32 slot, u64 npages,
> +					    u32 flags)
> +{
> +	____vm_override_mem_region(vm, type, slot);
> +	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
> +}
> +
> +static inline void vm_override_mem_region(struct kvm_vm *vm,
> +					  enum kvm_mem_region_type type,
> +					  enum vm_mem_backing_src_type src_type,
> +					  gpa_t gpa, u32 slot, u64 npages)
> +{
> +	__vm_override_mem_region(vm, type, src_type, gpa, slot, npages, 0);
> +}
> +
>  #ifndef vm_arch_has_protected_memory
>  static inline bool vm_arch_has_protected_memory(struct kvm_vm *vm)
>  {
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 56df5b1d9c79..781af2928d04 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -495,7 +495,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>  						 nr_extra_pages);
>  	struct userspace_mem_region *slot0;
>  	struct kvm_vm *vm;
> -	int i, flags;
> +	int flags;
>  
>  	kvm_set_files_rlimit(nr_runnable_vcpus);
>  
> @@ -513,8 +513,10 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
>  		flags |= KVM_MEM_GUEST_MEMFD;
>  
>  	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, flags);
> -	for (i = 0; i < NR_MEM_REGIONS; i++)
> -		vm->memslots[i] = 0;
> +	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
> +	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
> +	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
> +	____vm_override_mem_region(vm, MEM_REGION_TEST_DATA, 0);
>  
>  	kvm_vm_elf_load(vm, program_invocation_name);
>  
> diff --git a/tools/testing/selftests/kvm/s390/cmma_test.c b/tools/testing/selftests/kvm/s390/cmma_test.c
> index 15d81b2ed7ad..73387cc3bca7 100644
> --- a/tools/testing/selftests/kvm/s390/cmma_test.c
> +++ b/tools/testing/selftests/kvm/s390/cmma_test.c
> @@ -102,24 +102,17 @@ static void guest_dirty_test_data(void)
>  
>  static void create_main_memslot(struct kvm_vm *vm)
>  {
> -	int i;
> -
>  	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, MAIN_PAGE_COUNT, 0);
> -	/* set the array of memslots to zero like __vm_create does */
> -	for (i = 0; i < NR_MEM_REGIONS; i++)
> -		vm->memslots[i] = 0;
> +	____vm_override_mem_region(vm, MEM_REGION_CODE, 0);
> +	____vm_override_mem_region(vm, MEM_REGION_PT, 0);
> +	____vm_override_mem_region(vm, MEM_REGION_DATA, 0);
>  }
>  
>  static void create_test_memslot(struct kvm_vm *vm)
>  {
> -	vm_userspace_mem_region_add(vm,
> -				    VM_MEM_SRC_ANONYMOUS,
> -				    TEST_DATA_START_GFN << vm->page_shift,
> -				    TEST_DATA_MEMSLOT,
> -				    TEST_DATA_PAGE_COUNT,
> -				    0
> -				   );
> -	vm->memslots[MEM_REGION_TEST_DATA] = TEST_DATA_MEMSLOT;
> +	vm_override_mem_region(vm, MEM_REGION_TEST_DATA, VM_MEM_SRC_ANONYMOUS,
> +			       TEST_DATA_START_GFN << vm->page_shift,
> +			       TEST_DATA_MEMSLOT, TEST_DATA_PAGE_COUNT);
>  }
>  
>  static void create_memslots(struct kvm_vm *vm)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
