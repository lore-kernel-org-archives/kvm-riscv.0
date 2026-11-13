Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08143606A8BF
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fk1rjBJx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=hEmKYu4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DatwqTFVBJR5bw/86kJevQ+FLSMb4DRWWXy4HbHSGOk=; b=fk1rjBJxXQQ1/XtrHW7yhDpRF7
	dJ+jviBqnPHPf0GLJELflq7J0dRNOdYdND05AMONLt5snjtRbE4RviMBh0Lu7al/iFUgAjbScEyCI
	ihOKJSbI7KRBE6+9+F5QdYeDxT/W9WHjSTYzPFmtW6Wo7RBhbmmBZyrxlBSZGVe0gWXL2ifwwCv1h
	y4AH22uazeh1qfJg5wkDfvZtA8hci01JFh0SLpr3Qz68jBlWpkIxdQkkUwfFUB+6QcZLpIJu3dRsT
	k7svUdbRZsMLBhyo1SY00v/eaIBQ5tkUoBMB+47gqIpgVoukd4OWQ2wzAY+UwzsdliUdvqAbI2lMe
	R5HdUDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyu-0000000Dw67-33CA;
	Fri, 13 Nov 2026 18:26:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvys-0000000Dw0c-2eno
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1AnoyR0j7y5hdrymYbL+ph5cczEf+Al0Tzoil8ZfR/Q=; b=hEmKYu4crsHN6alaS6gx4febeC
	bBb2NUhbMZ5nWRl3GR3qDIUZZj9V3hZFviUpX5E2SmikEwTum+wkvcL4hR0+ud4EXfbfT1pTv97r7
	H4nSpPnODolqqQyw81YXnMDLl0QPwSyDqGfhmTW7fXZZ8+vwMO0rVE5rjn8OPd9mCSstFbUmL8VKp
	C4gP2NpnmJg/mzEAIWov1vU4Y6mRSlilz+pPxacK8RJLR6siF04H7xrN0yrsJXKReF40AqvkNEXAM
	L+zp+1MsgIWI5PCEqROMMPtxAiLdq0lcO2na+uqUF9pTLSSafp6xbLjyHWyynqv6BPqWFTL6CBVCY
	e26pXl9g==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyU-0000000BeOY-15uE;
	Fri, 13 Nov 2026 18:26:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRvyR-00000000LY7-2B60;
	Fri, 13 Nov 2026 18:26:07 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	Sriram Nambakam <snambakam@linux.microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [RFC PATCH 05/13] KVM: selftests: Cover plane run-state ioctls in planes_test
Date: Fri, 13 Nov 2026 11:25:59 -0700
Message-ID: <20261113182607.82813-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113182607.82813-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261113182607.82813-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Assert that a new plane-1 vCPU starts with KVM_PLANE_RUN_STATE_INACTIVE
and plane 0's with no flags, that every valid combination of
KVM_PLANE_RUN_STATE_USER_HOLD, KVM_PLANE_RUN_STATE_SUSPENDED and
KVM_PLANE_RUN_STATE_INACTIVE reads back as written (so a saved state
restores), and that clearing them reads back as runnable. INACTIVE on
plane 0, INACTIVE together with SUSPENDED and the lowest undefined bit
are refused with EINVAL, and a refused SET leaves an existing hold in
place. On a VM that did not enable more than one plane both ioctls fail
with EINVAL.

With plane 0 held and nothing runnable, KVM_RUN still honours
immediate_exit with EINTR, and otherwise exits with KVM_EXIT_PLANE_EVENT
and cause KVM_PLANE_EVENT_HELD, with kvm_run's if_flag and apic_base
filled in as on any other exit. That exit leaves registers marked in
kvm_dirty_regs unconsumed and unrefreshed, and once plane 1 is released
they land in plane 1, not plane 0. If plane 0 holds a pending I/O
completion, here from a real-mode OUT, a held KVM_RUN fails with EBUSY,
with or without immediate_exit, leaves the KVM_EXIT_IO in kvm_run and
plane 0's RIP on the OUT, and the OUT retires once plane 0 is released.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/testing/selftests/kvm/x86/planes_test.c | 198 +++++++++++++++++-
 1 file changed, 196 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/planes_test.c b/tools/testing/selftests/kvm/x86/planes_test.c
index f7db6cb6807d..968f1b099b8e 100644
--- a/tools/testing/selftests/kvm/x86/planes_test.c
+++ b/tools/testing/selftests/kvm/x86/planes_test.c
@@ -8,6 +8,10 @@
 #include <string.h>
 
 #include "kvm_util.h"
+#include "processor.h"
+
+/* Where the run-state test puts plane 0's one instruction. */
+#define CODE_GPA	0x1000
 
 /*
  * Whether this host lets a VM have more than one plane: the opt-in also
@@ -61,12 +65,22 @@ static void test_enable_cap_bounds(void)
 static void test_enable_cap_too_late(void)
 {
 	struct kvm_vm *vm = vm_create_barebones_irqchip(true);
-
-	__vm_vcpu_add(vm, 0);
+	struct kvm_vcpu *vcpu = __vm_vcpu_add(vm, 0);
 
 	TEST_ASSERT_EQ(__vm_enable_cap(vm, KVM_CAP_PLANES, 2), -1);
 	TEST_ASSERT_EQ(errno, EEXIST);
 
+	/* Without more than one user-managed plane there is no run state. */
+	{
+		u64 flags;
+
+		TEST_ASSERT_EQ(__vcpu_ioctl(vcpu, KVM_GET_PLANE_RUN_STATE, &flags), -1);
+		TEST_ASSERT_EQ(errno, EINVAL);
+		flags = 0;
+		TEST_ASSERT_EQ(__vcpu_ioctl(vcpu, KVM_SET_PLANE_RUN_STATE, &flags), -1);
+		TEST_ASSERT_EQ(errno, EINVAL);
+	}
+
 	kvm_vm_free(vm);
 }
 
@@ -107,6 +121,186 @@ static void test_plane_lifecycle(void)
 	vcpu0 = __vm_vcpu_add(vm, 0);
 	vcpu1 = __vm_plane_vcpu_add(vcpu0, plane);
 
+	/*
+	 * A new plane-1 vCPU is inactive, and plane 0's has no flags.
+	 * Every valid combination reads back as written, so a saved state
+	 * restores; unknown bits, INACTIVE on plane 0 and INACTIVE together
+	 * with SUSPENDED are refused.
+	 */
+	{
+		static const u64 states[] = {
+			KVM_PLANE_RUN_STATE_USER_HOLD,
+			KVM_PLANE_RUN_STATE_SUSPENDED,
+			KVM_PLANE_RUN_STATE_USER_HOLD |
+				KVM_PLANE_RUN_STATE_SUSPENDED,
+			KVM_PLANE_RUN_STATE_INACTIVE,
+			KVM_PLANE_RUN_STATE_USER_HOLD |
+				KVM_PLANE_RUN_STATE_INACTIVE,
+			0,
+		};
+		u64 flags = ~0ULL;
+		int i;
+
+		plane_vcpu_ioctl(vcpu1, KVM_GET_PLANE_RUN_STATE, &flags);
+		TEST_ASSERT_EQ(flags, KVM_PLANE_RUN_STATE_INACTIVE);
+		flags = ~0ULL;
+		vcpu_ioctl(vcpu0, KVM_GET_PLANE_RUN_STATE, &flags);
+		TEST_ASSERT_EQ(flags, 0);
+
+		flags = KVM_PLANE_RUN_STATE_INACTIVE;
+		TEST_ASSERT_EQ(__vcpu_ioctl(vcpu0, KVM_SET_PLANE_RUN_STATE,
+					    &flags), -1);
+		TEST_ASSERT_EQ(errno, EINVAL);
+
+		for (i = 0; i < ARRAY_SIZE(states); i++) {
+			flags = states[i];
+			plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE, &flags);
+			flags = ~0ULL;
+			plane_vcpu_ioctl(vcpu1, KVM_GET_PLANE_RUN_STATE, &flags);
+			TEST_ASSERT_EQ(flags, states[i]);
+		}
+
+		/* A refused SET leaves the hold in place. */
+		flags = KVM_PLANE_RUN_STATE_USER_HOLD;
+		plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE, &flags);
+
+		flags = KVM_PLANE_RUN_STATE_INACTIVE | KVM_PLANE_RUN_STATE_SUSPENDED;
+		TEST_ASSERT_EQ(__plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE,
+						  &flags), -1);
+		TEST_ASSERT_EQ(errno, EINVAL);
+
+		/* The lowest bit that no flag defines. */
+		flags = ~(u64)(KVM_PLANE_RUN_STATE_USER_HOLD |
+			       KVM_PLANE_RUN_STATE_SUSPENDED |
+			       KVM_PLANE_RUN_STATE_INACTIVE);
+		flags &= -flags;
+		TEST_ASSERT_EQ(__plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE,
+						  &flags), -1);
+		TEST_ASSERT_EQ(errno, EINVAL);
+		flags = ~0ULL;
+		plane_vcpu_ioctl(vcpu1, KVM_GET_PLANE_RUN_STATE, &flags);
+		TEST_ASSERT_EQ(flags, KVM_PLANE_RUN_STATE_USER_HOLD);
+	}
+
+	/*
+	 * Plane 1 is held from above.  With plane 0 held too, nothing is
+	 * runnable, and KVM_RUN hands that back to userspace instead of
+	 * running the held plane 0.
+	 */
+	{
+		u64 flags = KVM_PLANE_RUN_STATE_USER_HOLD;
+		struct kvm_regs regs;
+
+		vcpu_ioctl(vcpu0, KVM_SET_PLANE_RUN_STATE, &flags);
+
+		/* immediate_exit yields EINTR, as on any KVM_RUN. */
+		vcpu0->run->immediate_exit = 1;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), -1);
+		TEST_ASSERT_EQ(errno, EINTR);
+		vcpu0->run->immediate_exit = 0;
+
+		/* The exit fills in kvm_run like any other: poison two fields. */
+		vcpu0->run->if_flag = 0xff;
+		vcpu0->run->apic_base = 0;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), 0);
+		TEST_ASSERT_EQ(vcpu0->run->exit_reason, KVM_EXIT_PLANE_EVENT);
+		TEST_ASSERT_EQ(vcpu0->run->plane_event.cause, KVM_PLANE_EVENT_HELD);
+		TEST_ASSERT_EQ(vcpu0->run->plane_event.plane, 0);
+		TEST_ASSERT_EQ(vcpu0->run->if_flag, 0);
+		TEST_ASSERT_EQ(vcpu0->run->apic_base,
+			       vcpu_get_msr(vcpu0, MSR_IA32_APICBASE));
+
+		/*
+		 * Registers userspace marks dirty are for the plane that runs
+		 * next: the held exit neither consumes nor overwrites them.
+		 */
+		plane_vcpu_ioctl(vcpu1, KVM_GET_REGS, &vcpu0->run->s.regs.regs);
+		vcpu0->run->s.regs.regs.rdx = 0x5ca1ab1e;	/* arbitrary marker */
+		vcpu0->run->kvm_valid_regs = KVM_SYNC_X86_REGS;
+		vcpu0->run->kvm_dirty_regs = KVM_SYNC_X86_REGS;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), 0);
+		TEST_ASSERT_EQ(vcpu0->run->exit_reason, KVM_EXIT_PLANE_EVENT);
+		TEST_ASSERT_EQ(vcpu0->run->kvm_dirty_regs, KVM_SYNC_X86_REGS);
+		TEST_ASSERT_EQ(vcpu0->run->s.regs.regs.rdx, 0x5ca1ab1e);
+
+		/*
+		 * Released, plane 1 is next and takes them; immediate_exit
+		 * stops it before entry, after the registers are applied.
+		 */
+		flags = 0;
+		plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE, &flags);
+		vcpu0->run->immediate_exit = 1;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), -1);
+		TEST_ASSERT_EQ(errno, EINTR);
+		vcpu0->run->immediate_exit = 0;
+		TEST_ASSERT_EQ(vcpu0->run->kvm_dirty_regs, 0);
+		vcpu0->run->kvm_valid_regs = 0;
+
+		plane_vcpu_ioctl(vcpu1, KVM_GET_REGS, &regs);
+		TEST_ASSERT_EQ(regs.rdx, 0x5ca1ab1e);
+		vcpu_ioctl(vcpu0, KVM_GET_REGS, &regs);
+		TEST_ASSERT(regs.rdx != 0x5ca1ab1e,
+			    "plane 0 took the registers dirtied while it was held");
+
+		vcpu_ioctl(vcpu0, KVM_SET_PLANE_RUN_STATE, &flags);
+	}
+
+	/*
+	 * A completion plane 0 still owes its last exit stays pending while
+	 * plane 0 is held: KVM_RUN fails with EBUSY and leaves the exit in
+	 * kvm_run, and the completion runs once plane 0 runs again.  The
+	 * exit is a real-mode OUT at CODE_GPA, which userspace handles.
+	 */
+	{
+		static const u8 out_insn[] = { 0xe6, 0x10 };	/* out %al, $0x10 */
+		u64 flags = KVM_PLANE_RUN_STATE_USER_HOLD;
+		struct kvm_sregs sregs;
+		struct kvm_regs regs;
+
+		vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, CODE_GPA,
+					    1, 1, 0);
+		memcpy(addr_gpa2hva(vm, CODE_GPA), out_insn, sizeof(out_insn));
+
+		vcpu_sregs_get(vcpu0, &sregs);
+		sregs.cs.selector = 0;
+		sregs.cs.base = 0;
+		vcpu_sregs_set(vcpu0, &sregs);
+		vcpu_regs_get(vcpu0, &regs);
+		regs.rip = CODE_GPA;
+		vcpu_regs_set(vcpu0, &regs);
+
+		/* Plane 1 stays held, so only plane 0 can run. */
+		plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE, &flags);
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), 0);
+		TEST_ASSERT_EQ(vcpu0->run->exit_reason, KVM_EXIT_IO);
+		TEST_ASSERT_EQ(vcpu0->run->io.direction, KVM_EXIT_IO_OUT);
+		TEST_ASSERT_EQ(vcpu0->run->io.port, 0x10);
+
+		vcpu_ioctl(vcpu0, KVM_SET_PLANE_RUN_STATE, &flags);
+		vcpu0->run->immediate_exit = 1;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), -1);
+		TEST_ASSERT_EQ(errno, EBUSY);
+		vcpu0->run->immediate_exit = 0;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), -1);
+		TEST_ASSERT_EQ(errno, EBUSY);
+		TEST_ASSERT_EQ(vcpu0->run->exit_reason, KVM_EXIT_IO);
+		TEST_ASSERT_EQ(vcpu0->run->io.port, 0x10);
+		vcpu_regs_get(vcpu0, &regs);
+		TEST_ASSERT_EQ(regs.rip, CODE_GPA);
+
+		/* Released, plane 0 retires the OUT before immediate_exit. */
+		flags = 0;
+		vcpu_ioctl(vcpu0, KVM_SET_PLANE_RUN_STATE, &flags);
+		vcpu0->run->immediate_exit = 1;
+		TEST_ASSERT_EQ(__vcpu_run(vcpu0), -1);
+		TEST_ASSERT_EQ(errno, EINTR);
+		vcpu0->run->immediate_exit = 0;
+		vcpu_regs_get(vcpu0, &regs);
+		TEST_ASSERT_EQ(regs.rip, CODE_GPA + sizeof(out_insn));
+
+		plane_vcpu_ioctl(vcpu1, KVM_SET_PLANE_RUN_STATE, &flags);
+	}
+
 	/* Register state is per plane: write plane 1, plane 0 unaffected. */
 	plane_vcpu_ioctl(vcpu1, KVM_GET_REGS, &regs1);
 	regs1.rbx = 0x5157ca11;	/* arbitrary marker */
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
