Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351EE606E870
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHojSliV;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XPqVjGWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QtiyNAOvot3E56GAhlf+cF89sD0xzPwkA4uFYgVVUjc=; b=yHojSliVFHhUrko2yEO+R7eozg
	giyhr76OVyVQr8EziLQldnNhXCk1lIoav5fHPl6UgR29oSwolHkQlBzea/w6n+FCbCtfiVFFNh8lS
	+gSnRde89hXZQIGGlLWmvSJpUngeS0APxiVt/ndUCYFFwPuhr5hNxRBqgGF/PlOAZzV0DQgR7kQsJ
	KkI7qOv+BIdI/TftDkt/wz+IvUbXW8gZe0oZa1D0AjCbM0fzSRgZbKHj5Zd6NDILYN5cvnMpwOisW
	r1rHwaNmqVYIsB/JVHcFmrzGVVD9SqtCbzHzjeTaKSnA78+qdMhI+Dbz2syfs6uQyMrsY3LFeFSTs
	kMcZV3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Wf-0000000C7jE-3bZR;
	Thu, 19 Nov 2026 13:50:09 +0000
Received: from out-226.mta0.migadu.com ([2001:41d0:1004:224b::e2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Wc-0000000C7i5-3nMr
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 13:50:08 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+aZWzXaOnWazBZdRZqNBkG1WS4ZSuBwHsa7ZQ3CC1Aw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795096204; v=1; x=1795701004;
 b=XPqVjGWHGrOnqkQp0gMob0gDixPWXXVQ+MKg8Om7wQnbuX0/+h8w28kTJNqmLfbTDBPvEQfI
 bUzG9c8d2SdCxKzNwX1drgzjrtDH28uojfuenOriEyjlVfpFXivDJgPUpRnNHrG9YvBoo+/wL6E
 gup0E5kl/69C9WTB7uJ2W3XA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1dd83dad7dfadc2b;
	Thu, 19 Nov 2026 13:50:02 +0000
X-Mizu-Trace-ID: 1dd83dad7dfadc2b
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 14:49:25 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zhouquan@iscas.ac.cn, linux-kselftest@vger.kernel.org, shuah@kernel.org, 
	pbonzini@redhat.com, seanjc@google.com
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory
 lifecycle
Message-ID: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261115085457.889873-1-shanbeeyoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055007_144772_3EEF1C8E 
X-CRM114-Status: GOOD (  29.48  )
X-Spam-Score: -2.1 (--)
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

On Sun, Nov 15, 2026 at 04:54:57PM +0800, Bingyu.Xian wrote:
> The RISC-V steal-time test checks the UAPI alignment constraints and
> compares stolen time with the host run delay. It does not exercise
> changes to the shared page after accounting has been enabled.
> 
> Extend the existing test to check that disabling STA stops shared-page
> updates and that reconfiguring it leaves the old shared page unchanged.
> Place the second STA structure at the end of another page and verify
> that updates mark the appropriate page dirty.
> 
> Discard the second backing page with MADV_DONTNEED and check that a
> subsequent KVM_RUN resumes STA updates on the replacement page and
> marks it dirty. Read the replacement page before KVM_RUN so that a
> stale write into the old backing page cannot satisfy the assertions.
> 
> Keep these checks in steal_time instead of adding another test binary.
> The test does not depend on a gfn-to-pfn cache implementation.
> 
> Assisted-by: YuanSheng: deepseek-v4-pro
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: bingyu.xian <shanbeenyoo@gmail.com>
> ---
> Tested with a freshly built RISC-V kernel and KVM module from the base
> commit below, running as a QEMU TCG guest with H extension enabled:
>   - steal_time: 4 lifecycle checks and the existing 4 vCPU cases pass
>   - CONFIG_DEBUG_ATOMIC_SLEEP=y and CONFIG_PROVE_LOCKING=y
>   - no kernel diagnostics observed
>   - x86 steal_time build also passes (not run)
> 
> This exercises baseline STA behavior and does not depend on an STA
> caching implementation. The lifecycle checks also apply cleanly to
> riscv_kvm_next at 633b3931a87438282d6454646ff40c669a6896cb.
> 
> Test logs (verbatim excerpt from the 2026-11-15 QEMU run):
>   STA_LIFECYCLE_KERNEL=7.4.0-rc2-sta-lifecycle+
>   Random seed: 0x35d6f94c
>   TAP version 13
>   1..8
>   ok 1 STA shared page updates and is marked dirty
>   ok 2 STA disable stops shared page updates
>   ok 3 STA reconfiguration updates only the new page
>   ok 4 STA updates recover after backing page invalidation

I'm having trouble understanding what real world scenario these tests are
trying to model. VM migration?

>   # VCPU0: total-stolen-time=3269800 test-stolen-time=3269800
>   VCPU0:
>       sequence:  6
>       flags:     0
>       steal:     3269800
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 5 vcpu0
>   # VCPU1: total-stolen-time=898700 test-stolen-time=898700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU1:
>       sequence:  4
>       flags:     0
>       steal:     898700
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 6 vcpu1
>   # VCPU2: total-stolen-time=654000 test-stolen-time=654000 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU2:
>       sequence:  4
>       flags:     0
>       steal:     654000
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 7 vcpu2
>   # VCPU3: total-stolen-time=800700 test-stolen-time=800700 (BONUS: guest test-stolen-time even exactly matches test-run_delay)
>   VCPU3:
>       sequence:  4
>       flags:     0
>       steal:     800700
>       preempted: 0
>       pad:      00000000000000000000000000000000000000000000000
>   ok 8 vcpu3
>   # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
>   STA_LIFECYCLE_STATUS=0
>   STA_LIFECYCLE_PASS
> 
>  tools/testing/selftests/kvm/steal_time.c | 113 +++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 82b94a82d..059f7fa60 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -8,6 +8,7 @@
>  #include <time.h>
>  #include <sched.h>
>  #include <pthread.h>
> +#include <sys/mman.h>
>  #include <linux/kernel.h>
>  #include <asm/kvm.h>
>  #ifdef __riscv
> @@ -329,6 +330,111 @@ static void steal_time_dump(struct kvm_vm *vm, u32 vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static gpa_t lifecycle_second_gpa;
> +
> +static void sta_lifecycle_guest(void)
> +{
> +	sta_set_shmem(ST_GPA_BASE, 0);
> +	GUEST_SYNC(0);
> +	/* The first update takes place on the next KVM_RUN. */
> +	GUEST_SYNC(1);
> +
> +	sta_set_shmem(INVALID_GPA, 0);
> +	GUEST_SYNC(2);
> +	GUEST_SYNC(3);
> +
> +	sta_set_shmem(lifecycle_second_gpa, 0);
> +	GUEST_SYNC(4);
> +	GUEST_SYNC(5);
> +
> +	/* Userspace discards the second backing page before resuming us. */
> +	GUEST_SYNC(6);
> +	sta_set_shmem(INVALID_GPA, 0);
> +	GUEST_DONE();
> +}
> +
> +static void sta_lifecycle_run(struct kvm_vcpu *vcpu, unsigned int stage)
> +{
> +	struct ucall uc;
> +
> +	vcpu_run(vcpu);
> +	switch (get_ucall(vcpu, &uc)) {
> +	case UCALL_SYNC:
> +		TEST_ASSERT_EQ(uc.args[1], stage);
> +		break;
> +	case UCALL_DONE:
> +		TEST_ASSERT_EQ(stage, 7);
> +		break;
> +	case UCALL_ABORT:
> +		REPORT_GUEST_ASSERT(uc);
> +	default:
> +		TEST_FAIL("Unexpected STA lifecycle exit at stage %u", stage);
> +	}
> +}
> +
> +static void check_sta_page(struct sta_struct *st)
> +{
> +	TEST_ASSERT(st->sequence && !(st->sequence & 1),
> +		    "Expected a completed STA update, sequence=%u", st->sequence);
> +	TEST_ASSERT_EQ(st->flags, 0);
> +	TEST_ASSERT_EQ(st->preempted, 0);
> +}
> +
> +static void check_sta_lifecycle(void)
> +{
> +	struct sta_struct snapshot, *first, *second;
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +	unsigned long dirty = 0;
> +	void *second_page;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, sta_lifecycle_guest);
> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
> +				    1, 2, KVM_MEM_LOG_DIRTY_PAGES);
> +	/* Also exercise an STA structure ending exactly at a page boundary. */
> +	WRITE_AND_SYNC_TO_GUEST(vm, lifecycle_second_gpa,
> +				ST_GPA_BASE + 2 * vm->page_size - sizeof(struct sta_struct));
> +	first = addr_gpa2hva(vm, ST_GPA_BASE);
> +	second = addr_gpa2hva(vm, lifecycle_second_gpa);
> +	second_page = addr_gpa2hva(vm, ST_GPA_BASE + vm->page_size);
> +
> +	sta_lifecycle_run(vcpu, 0);
> +	sta_lifecycle_run(vcpu, 1);
> +	check_sta_page(first);
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(0), "STA update did not dirty the first page");
> +	ksft_test_result_pass("STA shared page updates and is marked dirty\n");
> +
> +	sta_lifecycle_run(vcpu, 2);
> +	snapshot = *first;
> +	sta_lifecycle_run(vcpu, 3);
> +	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
> +		    "Disabled STA shared page was modified");
> +	ksft_test_result_pass("STA disable stops shared page updates\n");
> +
> +	sta_lifecycle_run(vcpu, 4);
> +	sta_lifecycle_run(vcpu, 5);
> +	check_sta_page(second);
> +	TEST_ASSERT(!memcmp(first, &snapshot, sizeof(snapshot)),
> +		    "Old STA shared page was modified after reconfiguration");
> +	dirty = 0;
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(1), "STA update did not dirty the new page");
> +	ksft_test_result_pass("STA reconfiguration updates only the new page\n");
> +
> +	TEST_ASSERT_EQ(madvise(second_page, vm->page_size, MADV_DONTNEED), 0);
> +	TEST_ASSERT_EQ(second->sequence, 0);
> +	sta_lifecycle_run(vcpu, 6);
> +	check_sta_page(second);
> +	dirty = 0;
> +	kvm_vm_get_dirty_log(vm, 1, &dirty);
> +	TEST_ASSERT(dirty & BIT(1), "Recovered STA update did not dirty the page");
> +	ksft_test_result_pass("STA updates recover after backing page invalidation\n");
> +
> +	sta_lifecycle_run(vcpu, 7);
> +	kvm_vm_free(vm);
> +}
> +
>  static void check_steal_time_uapi(void)
>  {
>  	struct kvm_vm *vm;
> @@ -535,9 +641,16 @@ int main(int ac, char **av)
>  
>  	ksft_print_header();
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
> +#ifdef __riscv
> +	ksft_set_plan(NR_VCPUS + 4);
> +#else
>  	ksft_set_plan(NR_VCPUS);
> +#endif
>  
>  	check_steal_time_uapi();
> +#ifdef __riscv
> +	check_sta_lifecycle();
> +#endif

The #ifdefs aren't nice. Again, what are the tests trying to prove? And
why wouldn't the other architectures need the same coverage?

Thanks,
drew

>  
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
> 
> base-commit: 23c62304dde29abe92013d85910d03a77dada35d
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
