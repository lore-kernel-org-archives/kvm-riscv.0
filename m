Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3770D1D482
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=brPoUeHeJB8rjvDPZMAg6cnWOIuf0nFcQG7H9UFERUY=; b=y2XVQo3RIJGXUTgmZ7/DSWG84u
	QzjtOcL8dZCRZSNsw8EtfGAVxndhcIu+aXy0DQ7ozsBgwhTPBnUO3qCBEaAbLg613N7kVCwVgAPCT
	KBRJOHssanAogKeJ4gQZa53JVCFWGifwea3Z05rU86ltUUC3ToXuJfooWow0atbzLWeKSONkW+sQx
	jAYpMCmqFce+gg8pYqwFCwiY9i1VoSvazyl3h8NF0mwbQqllyeddTFbPSS8Vcim2VksVOcSpQBSBT
	TuM6B81BoKD0/whK2AaU9pDK9pSx/dhQryWgrKM0jL2Pr52G23NNDgRlxcs1z47eUqNwVADxRzTPm
	lTGi8xiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdswM-000000009Qg-0jVI;
	Thu, 08 Jan 2026 16:32:50 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdswJ-000000009Os-2kpb
	for kvm-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 16:32:48 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34cc88eca7eso4385921a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 08 Jan 2026 08:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767889966; x=1768494766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P4weczJ0CflKmWmemkjVQLod+ZW9LM2QROk7btr2Pj0=;
        b=26h3V6RNG8moPJqDL66leYTexGqEqD5/U7SCBUadHGKVY5pWJtt7XguJ1O3BzceDg1
         M+RxNbl2thanzLi+w0WwmQ6MPiRb6OeQhhLCdHt3/7ELfDs9IJMBtnjQbzxyADyadj+y
         BMH2uxpeErIBNIbellyoSDZG2iHAJV+ejwbkYZZCG/HBFWnEFgsbwF/aYKFX+nuF0vp4
         4n9J+8k6WjjRXhcI8Sytt/2DrjaOl1WdhEHrH4MxtH/1WIA8f/y2MQc4FSz4wEUsMemW
         PWVLVicqzDI8V8u7j+z6fZcD1cQrIpLhZBm8yfbNuRJFevyjaoI5DmcVKulQGZWFWbKQ
         P4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767889966; x=1768494766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P4weczJ0CflKmWmemkjVQLod+ZW9LM2QROk7btr2Pj0=;
        b=q4KkyAH6NaMZTK+kvc/7GNbVgX30mQZ1/2zzltmnGZb9isbqmizSzCUVsdTHdB3uSX
         g5aFqRJ9uYvMU8JWo3hGbFMQVi97Z5uuAF1uw34os/C4szi5IYERgslPvpJ7kPG2/CFK
         dLAlgovrevHD818hXB4eNL0XZfWefZrjwpDnZmuy2es//NApj1ds40tPA1JXtrhPNP6/
         7JiQIdWrZQKMH9PFVm8r+GnPU8XpkexRwIqh+kY3UnQElmt3+npSueYouQy9hVwVdPah
         Us6TUnMQvcmtGhBix2eiTFnfRlQEyhl7hKPixUNgdSjf99OnUjiEPQrKO/BpaHq3InPn
         e7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXvAMb6QkV8JVxt/zFVMaSLH1PGRwzmAtcEF2DSLZM0rkZMnkHC+Ra145sxLg4qG++otMTYqr/+Gcc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQUjj0UNLnM5Z9qRWmPaX4tnjMP6hyMsp8ODgFyb6l+8hGeB2Z
	vwLDwpF1qSZMeAz4dhfp/lTDnVZSy/UShKnxC/O3fdaXrufnzbjS0lwBMpPNVDuIXlrqtchMqpt
	ugVBAsg==
X-Google-Smtp-Source: AGHT+IE52p68bfcsN1dFtZpJ3rbWKn9Teo6CB2P4bpjVKJkGE0poIQ7b/YVeU0+kM07hg/nx48xC5EXqdCA=
X-Received: from pjbgk8.prod.google.com ([2002:a17:90b:1188:b0:340:7740:281c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3852:b0:343:b610:901c
 with SMTP id 98e67ed59e1d1-34f68cb9036mr7160126a91.26.1767889966231; Thu, 08
 Jan 2026 08:32:46 -0800 (PST)
Date: Thu, 8 Jan 2026 08:32:44 -0800
In-Reply-To: <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com> <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
Message-ID: <aV_cLAlz4v1VOkDt@google.com>
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_083247_729770_AF493F61 
X-CRM114-Status: GOOD (  39.41  )
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

On Fri, Jan 02, 2026, Yosry Ahmed wrote:
> On Tue, Dec 30, 2025 at 03:01:50PM -0800, Sean Christopherson wrote:
> >  	WRITE_ONCE(*b, 1);
> > -	GUEST_SYNC(true);
> > +	GUEST_SYNC(2 | TEST_SYNC_WRITE_FAULT);
> >  	WRITE_ONCE(*b, 1);
> > -	GUEST_SYNC(true);
> > -	GUEST_SYNC(false);
> > +	GUEST_SYNC(2 | TEST_SYNC_WRITE_FAULT);
> > +	READ_ONCE(*b);
> > +	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
> > +	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
> 
> Instead of hardcoding 0 and 2 here, which IIUC correspond to the
> physical addresses 0xc0000000 and 0xc0002000, as well as indices in
> host_test_mem, can we make the overall definitions a bit more intuitive?
> 
> For example:
> 
> #define GUEST_GPA_START		0xc0000000
> #define GUEST_PAGE1_IDX		0
> #define GUEST_PAGE2_IDX		1
> #define GUEST_GPA_PAGE1		(GUEST_GPA_START + GUEST_PAGE1_IDX * PAGE_SIZE)
> #define GUEST_GPA_PAGE2		(GUEST_GPA_START + GUEST_PAGE2_IDX * PAGE_SIZE)
> 
> /* Mapped to GUEST_GPA_PAGE1 and GUEST_GPA_PAGE2 */
> #define GUEST_GVA_PAGE1		0xd0000000
> #define GUEST_GVA_PAGE2		0xd0002000
> 
> /* Mapped to GUEST_GPA_PAGE1 and GUEST_GPA_PAGE2 using TDP in L1 */
> #define GUEST_GVA_NESTED_PAGE1  0xd0001000
> #define GUEST_GVA_NESTED_PAGE2	0xd0003000
> 
> Then in L2 code, we can explicitly take in the GVA of page1 and page2
> and use the definitions above in the GUEST_SYNC() calls, for example:
> 
> static void l2_guest_code(u64 *page1_gva, u64 *page2_gva)
> {
>         READ_ONCE(*page1_gva);
>         GUEST_SYNC(GUEST_PAGE1_IDX | TEST_SYNC_READ_FAULT);
>         WRITE_ONCE(*page1_gva, 1);
>         GUEST_SYNC(GUEST_PAGE1_IDX | TEST_SYNC_WRITE_FAULT);
> 	...
> }
> 
> and we can explicitly read page1 and page2 from the host (instead of
> using host_test_mem).
> 
> Alternatively, we can pass in the guest GVA directly into GUEST_SYNC(),
> and use the lower bits for TEST_SYNC_READ_FAULT, TEST_SYNC_WRITE_FAULT,
> and TEST_SYNC_NO_FAULT.
>
> WDYT?

I fiddled with this a bunch and came up with the below.  It's more or less what
you're suggesting, but instead of interleaving the aliases, it simply puts them
at a higher base.  That makes pulling the page frame number out of the GVA much
cleaner, as it's simply arithmetic instead of weird masking and shifting magic.

--
From: Sean Christopherson <seanjc@google.com>
Date: Wed, 7 Jan 2026 14:38:32 -0800
Subject: [PATCH] KVM: selftests: Test READ=>WRITE dirty logging behavior for
 shadow MMU

Update the nested dirty log test to validate KVM's handling of READ faults
when dirty logging is enabled.  Specifically, set the Dirty bit in the
guest PTEs used to map L2 GPAs, so that KVM will create writable SPTEs
when handling L2 read faults.  When handling read faults in the shadow MMU,
KVM opportunistically creates a writable SPTE if the mapping can be
writable *and* the gPTE is dirty (or doesn't support the Dirty bit), i.e.
if KVM doesn't need to intercept writes in order to emulate Dirty-bit
updates.

To actually test the L2 READ=>WRITE sequence, e.g. without masking a false
pass by other test activity, route the READ=>WRITE and WRITE=>WRITE
sequences to separate L1 pages, and differentiate between "marked dirty
due to a WRITE access/fault" and "marked dirty due to creating a writable
SPTE for a READ access/fault".  The updated sequence exposes the bug fixed
by KVM commit 1f4e5fc83a42 ("KVM: x86: fix nested guest live migration
with PML") when the guest performs a READ=>WRITE sequence with dirty guest
PTEs.

Opportunistically tweak and rename the address macros, and add comments,
to make it more obvious what the test is doing.  E.g. NESTED_TEST_MEM1
vs. GUEST_TEST_MEM doesn't make it all that obvious that the test is
creating aliases in both the L2 GPA and GVA address spaces, but only when
L1 is using TDP to run L2.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |   1 +
 .../testing/selftests/kvm/lib/x86/processor.c |   7 +
 .../selftests/kvm/x86/nested_dirty_log_test.c | 188 +++++++++++++-----
 3 files changed, 145 insertions(+), 51 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index ab29b1c7ed2d..8945c9eea704 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1483,6 +1483,7 @@ bool kvm_cpu_has_tdp(void);
 void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
 void tdp_identity_map_default_memslots(struct kvm_vm *vm);
 void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
+uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa);
 
 /*
  * Basic CPU control in CR0
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ab869a98bbdc..fab18e9be66c 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -390,6 +390,13 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
 	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 }
 
+uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa)
+{
+	int level = PG_LEVEL_4K;
+
+	return __vm_get_page_table_entry(vm, &vm->stage2_mmu, l2_gpa, &level);
+}
+
 uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
 {
 	int level = PG_LEVEL_4K;
diff --git a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
index 89d2e86a0db9..6f4f7a8209be 100644
--- a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
@@ -17,29 +17,53 @@
 
 /* The memory slot index to track dirty pages */
 #define TEST_MEM_SLOT_INDEX		1
-#define TEST_MEM_PAGES			3
 
-/* L1 guest test virtual memory offset */
-#define GUEST_TEST_MEM			0xc0000000
+/*
+ * Allocate four pages total.  Two pages are used to verify that the KVM marks
+ * the accessed page/GFN as marked dirty, but not the "other" page.  Times two
+ * so that each "normal" page can be accessed from L2 via an aliased L2 GVA+GPA
+ * (when TDP is enabled), to verify KVM marks _L1's_ page/GFN as dirty (to
+ * detect failures, L2 => L1 GPAs can't be identity mapped in the TDP page
+ * tables, as marking L2's GPA dirty would get a false pass if L1 == L2).
+ */
+#define TEST_MEM_PAGES			4
 
-/* L2 guest test virtual memory offset */
-#define NESTED_TEST_MEM1		0xc0001000
-#define NESTED_TEST_MEM2		0xc0002000
+#define TEST_MEM_BASE			0xc0000000
+#define TEST_MEM_ALIAS_BASE		0xc0002000
+
+#define TEST_GUEST_ADDR(base, idx)	((base) + (idx) * PAGE_SIZE)
+
+#define TEST_GVA(idx)			TEST_GUEST_ADDR(TEST_MEM_BASE, idx)
+#define TEST_GPA(idx)			TEST_GUEST_ADDR(TEST_MEM_BASE, idx)
+
+#define TEST_HVA(vm, idx)		addr_gpa2hva(vm, TEST_GPA(idx))
 
 #define L2_GUEST_STACK_SIZE 64
 
-static void l2_guest_code(u64 *a, u64 *b)
+/* Use the page offset bits to communicate the access+fault type. */
+#define TEST_SYNC_READ_FAULT		BIT(0)
+#define TEST_SYNC_WRITE_FAULT		BIT(1)
+#define TEST_SYNC_NO_FAULT		BIT(2)
+
+static void l2_guest_code(vm_vaddr_t base)
 {
-	READ_ONCE(*a);
-	WRITE_ONCE(*a, 1);
-	GUEST_SYNC(true);
-	GUEST_SYNC(false);
+	vm_vaddr_t page0 = TEST_GUEST_ADDR(base, 0);
+	vm_vaddr_t page1 = TEST_GUEST_ADDR(base, 1);
 
-	WRITE_ONCE(*b, 1);
-	GUEST_SYNC(true);
-	WRITE_ONCE(*b, 1);
-	GUEST_SYNC(true);
-	GUEST_SYNC(false);
+	READ_ONCE(*(u64 *)page0);
+	GUEST_SYNC(page0 | TEST_SYNC_READ_FAULT);
+	WRITE_ONCE(*(u64 *)page0, 1);
+	GUEST_SYNC(page0 | TEST_SYNC_WRITE_FAULT);
+	READ_ONCE(*(u64 *)page0);
+	GUEST_SYNC(page0 | TEST_SYNC_NO_FAULT);
+
+	WRITE_ONCE(*(u64 *)page1, 1);
+	GUEST_SYNC(page1 | TEST_SYNC_WRITE_FAULT);
+	WRITE_ONCE(*(u64 *)page1, 1);
+	GUEST_SYNC(page1 | TEST_SYNC_WRITE_FAULT);
+	READ_ONCE(*(u64 *)page1);
+	GUEST_SYNC(page1 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(page1 | TEST_SYNC_NO_FAULT);
 
 	/* Exit to L1 and never come back.  */
 	vmcall();
@@ -47,13 +71,22 @@ static void l2_guest_code(u64 *a, u64 *b)
 
 static void l2_guest_code_tdp_enabled(void)
 {
-	l2_guest_code((u64 *)NESTED_TEST_MEM1, (u64 *)NESTED_TEST_MEM2);
+	/*
+	 * Use the aliased virtual addresses when running with TDP to verify
+	 * that KVM correctly handles the case where a page is dirtied via a
+	 * different GPA than would be used by L1.
+	 */
+	l2_guest_code(TEST_MEM_ALIAS_BASE);
 }
 
 static void l2_guest_code_tdp_disabled(void)
 {
-	/* Access the same L1 GPAs as l2_guest_code_tdp_enabled() */
-	l2_guest_code((u64 *)GUEST_TEST_MEM, (u64 *)GUEST_TEST_MEM);
+	/*
+	 * Use the "normal" virtual addresses when running without TDP enabled,
+	 * in which case L2 will use the same page tables as L1, and thus needs
+	 * to use the same virtual addresses that are mapped into L1.
+	 */
+	l2_guest_code(TEST_MEM_BASE);
 }
 
 void l1_vmx_code(struct vmx_pages *vmx)
@@ -72,9 +105,9 @@ void l1_vmx_code(struct vmx_pages *vmx)
 
 	prepare_vmcs(vmx, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
 
-	GUEST_SYNC(false);
+	GUEST_SYNC(TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT(!vmlaunch());
-	GUEST_SYNC(false);
+	GUEST_SYNC(TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT_EQ(vmreadz(VM_EXIT_REASON), EXIT_REASON_VMCALL);
 	GUEST_DONE();
 }
@@ -91,9 +124,9 @@ static void l1_svm_code(struct svm_test_data *svm)
 
 	generic_svm_setup(svm, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
 
-	GUEST_SYNC(false);
+	GUEST_SYNC(TEST_SYNC_NO_FAULT);
 	run_guest(svm->vmcb, svm->vmcb_gpa);
-	GUEST_SYNC(false);
+	GUEST_SYNC(TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT_EQ(svm->vmcb->control.exit_code, SVM_EXIT_VMMCALL);
 	GUEST_DONE();
 }
@@ -106,12 +139,66 @@ static void l1_guest_code(void *data)
 		l1_svm_code(data);
 }
 
+static void test_handle_ucall_sync(struct kvm_vm *vm, u64 arg,
+				   unsigned long *bmap)
+{
+	vm_vaddr_t gva = arg & ~(PAGE_SIZE - 1);
+	int page_nr, i;
+
+	/*
+	 * Extract the page number of underlying physical page, which is also
+	 * the _L1_ page number.  The dirty bitmap _must_ be updated based on
+	 * the L1 GPA, not L2 GPA, i.e. whether or not L2 used an aliased GPA
+	 * (i.e. if TDP enabled for L2) is irrelevant with respect to the dirty
+	 * bitmap and which underlying physical page is accessed.
+	 *
+	 * Note, gva will be '0' if there was no access, i.e. if the purpose of
+	 * the sync is to verify all pages are clean.
+	 */
+	if (!gva)
+		page_nr = 0;
+	else if (gva >= TEST_MEM_ALIAS_BASE)
+		page_nr = (gva - TEST_MEM_ALIAS_BASE) >> PAGE_SHIFT;
+	else
+		page_nr = (gva - TEST_MEM_BASE) >> PAGE_SHIFT;
+	TEST_ASSERT(page_nr == 0 || page_nr == 1,
+		    "Test bug, unexpected frame number '%u' for arg = %lx", page_nr, arg);
+	TEST_ASSERT(gva || (arg & TEST_SYNC_NO_FAULT),
+		    "Test bug, gva must be valid if a fault is expected");
+
+	kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
+
+	/*
+	 * Check all pages to verify the correct physical page was modified (or
+	 * not), and that all pages are clean/dirty as expected.
+	 *
+	 * If a fault of any kind is expected, the target page should be dirty
+	 * as the Dirty bit is set in the gPTE.  KVM should create a writable
+	 * SPTE even on a read fault, *and* KVM must mark the GFN as dirty
+	 * when doing so.
+	 */
+	for (i = 0; i < TEST_MEM_PAGES; i++) {
+		if (i == page_nr && arg & TEST_SYNC_WRITE_FAULT)
+			TEST_ASSERT(*(u64 *)TEST_HVA(vm, i) == 1,
+				    "Page %u incorrectly not written by guest", i);
+		else
+			TEST_ASSERT(*(u64 *)TEST_HVA(vm, i) == 0xaaaaaaaaaaaaaaaaULL,
+				    "Page %u incorrectly written by guest", i);
+
+		if (i == page_nr && !(arg & TEST_SYNC_NO_FAULT))
+			TEST_ASSERT(test_bit(i, bmap),
+				    "Page %u incorrectly reported clean on %s fault",
+				    i, arg & TEST_SYNC_READ_FAULT ? "read" : "write");
+		else
+			TEST_ASSERT(!test_bit(i, bmap),
+				    "Page %u incorrectly reported dirty", i);
+	}
+}
+
 static void test_dirty_log(bool nested_tdp)
 {
 	vm_vaddr_t nested_gva = 0;
 	unsigned long *bmap;
-	uint64_t *host_test_mem;
-
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm;
 	struct ucall uc;
@@ -133,35 +220,50 @@ static void test_dirty_log(bool nested_tdp)
 
 	/* Add an extra memory slot for testing dirty logging */
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    GUEST_TEST_MEM,
+				    TEST_MEM_BASE,
 				    TEST_MEM_SLOT_INDEX,
 				    TEST_MEM_PAGES,
 				    KVM_MEM_LOG_DIRTY_PAGES);
 
 	/*
-	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
+	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
 	 * affects both L1 and L2.  However...
 	 */
-	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
+	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
 
 	/*
-	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
-	 * 0xc0000000.
+	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
+	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
+	 * respectively.
 	 *
 	 * When TDP is disabled, the L2 guest code will still access the same L1
 	 * GPAs as the TDP enabled case.
+	 *
+	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
+	 * writable SPTEs when handling read faults (if the Dirty bit isn't
+	 * set, KVM must intercept the next write to emulate the Dirty bit
+	 * update).
 	 */
 	if (nested_tdp) {
+		vm_vaddr_t gva0 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 0);
+		vm_vaddr_t gva1 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 1);
+
 		tdp_identity_map_default_memslots(vm);
-		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
-		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_map(vm, gva0, TEST_GPA(0), PAGE_SIZE);
+		tdp_map(vm, gva1, TEST_GPA(1), PAGE_SIZE);
+
+		*tdp_get_pte(vm, gva0) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
+		*tdp_get_pte(vm, gva1) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
+	} else {
+		*vm_get_pte(vm, TEST_GVA(0)) |= PTE_DIRTY_MASK(&vm->mmu);
+		*vm_get_pte(vm, TEST_GVA(1)) |= PTE_DIRTY_MASK(&vm->mmu);
 	}
 
 	bmap = bitmap_zalloc(TEST_MEM_PAGES);
-	host_test_mem = addr_gpa2hva(vm, GUEST_TEST_MEM);
 
 	while (!done) {
-		memset(host_test_mem, 0xaa, TEST_MEM_PAGES * PAGE_SIZE);
+		memset(TEST_HVA(vm, 0), 0xaa, TEST_MEM_PAGES * PAGE_SIZE);
+
 		vcpu_run(vcpu);
 		TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
 
@@ -170,23 +272,7 @@ static void test_dirty_log(bool nested_tdp)
 			REPORT_GUEST_ASSERT(uc);
 			/* NOT REACHED */
 		case UCALL_SYNC:
-			/*
-			 * The nested guest wrote at offset 0x1000 in the memslot, but the
-			 * dirty bitmap must be filled in according to L1 GPA, not L2.
-			 */
-			kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
-			if (uc.args[1]) {
-				TEST_ASSERT(test_bit(0, bmap), "Page 0 incorrectly reported clean");
-				TEST_ASSERT(host_test_mem[0] == 1, "Page 0 not written by guest");
-			} else {
-				TEST_ASSERT(!test_bit(0, bmap), "Page 0 incorrectly reported dirty");
-				TEST_ASSERT(host_test_mem[0] == 0xaaaaaaaaaaaaaaaaULL, "Page 0 written by guest");
-			}
-
-			TEST_ASSERT(!test_bit(1, bmap), "Page 1 incorrectly reported dirty");
-			TEST_ASSERT(host_test_mem[PAGE_SIZE / 8] == 0xaaaaaaaaaaaaaaaaULL, "Page 1 written by guest");
-			TEST_ASSERT(!test_bit(2, bmap), "Page 2 incorrectly reported dirty");
-			TEST_ASSERT(host_test_mem[PAGE_SIZE*2 / 8] == 0xaaaaaaaaaaaaaaaaULL, "Page 2 written by guest");
+			test_handle_ucall_sync(vm, uc.args[1], bmap);
 			break;
 		case UCALL_DONE:
 			done = true;

base-commit: 3cd487701a911d0e317bf31e79fe07bba5fa9995
--

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
