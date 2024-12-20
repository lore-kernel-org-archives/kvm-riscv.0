Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FB7E77184
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1O7XxHRbdjCfQR3JhRGeD/9h2LirMZIwn4WyLRwR5g=; b=q86gayEk8rIJ1C
	0C9Hv/XjFtIjjWSGrQuU8ppHWL4sj6QRqZabzjoag0TtZJGfD9PZOeH2N2a8yQjLhwSOrujGoOGRD
	C4T6C/STjZ7Z48PmBBEL2xMnpzKtbIxIbc6oC0a/J7vADLcuUhPVXFi+ylTw6Qkt6qjHLJ+Wl/raJ
	w4Ou52gvJzcpx8rY44q4goZzVcfvQmXWr8jqXJm9Pb4Kjx5jyjzwfvyymbTV1hdCG7ZgBfpRguDQz
	rFG6UQd5KTBkMdkCF54o+0QVOHCdtjPORPh+kzjSpc7ynbIWX+fp8nK116UfQM40ePfdVWzAAqD2w
	oavGSyLJTUv4HOr5usuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS7v-00000003fTJ-3toP;
	Fri, 20 Dec 2024 01:48:27 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz8-00000003d31-1LLY
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so1758987a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658761; x=1735263561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dH5y8/UE39Fu2msLM/JJYa9i5LZG9N1ZOJAUvzMfFnk=;
        b=tMBPTXlk9L2I7L4k+z3dAYYBAU52qU2ghqkLMvrE9KwJGyk/uJ3Af9wHyRqVqgR9iv
         sY+7Im+G3/tCT4xBozWIlYoRAhIFrGHlVbHGCgoQ9e3yPwhw0/+XgfvArcNVbw9EGSk6
         H6VDWX8q5Qep2UTJoPgPYWm+y5GepG+kofABsvUD1fhpuGiTAf7eHWTi3W8LH6fLlZjZ
         4Ym3eLgg83Dk6URoDVZzEqrKlYzRwocv1qB+9fOQCX0rxfyPn5VKnX7woZGj7Te63t4o
         OdS94Z3igog2QFsoSmjem29OKsfATStZ69omqAg1Dqv6azDaifoNPXnKDPEq0dOhDSY/
         Z19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658761; x=1735263561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dH5y8/UE39Fu2msLM/JJYa9i5LZG9N1ZOJAUvzMfFnk=;
        b=iS5K1prPabLUMtm9kioNHz1fhKUs5w/8KQtmqRA6xhlHfM5a+CsEm7wNYak2FVdvs6
         bFrggfG+bGS0QRjKBonNa0vxdhmKsj1/zpHkJE6Wn/GLVcI6CJNpSoF52GW3BQZyJzhE
         Op6poVjn74i+Tm0NzbaeC4+FgsAHEYNuFskPS5MIi/bAv6dTPQ+7vB661f8a/5g9Dp7R
         X3I/C4pWNSSBODGHwqaptvo53s3beO0vEdxiLc1PCyPnMyLtNhTVm3k4IoiUeEf2Sg6L
         zVQ6MUPb56WhdO6GsC0YLsSa9gzgj2qrOHNL2RKJkkct4ua7d164J9rEpzPHn72U7Al0
         h2mg==
X-Forwarded-Encrypted: i=1; AJvYcCUVaAMs+QKXGTS580hDypE06cqzNiQ2Q3s1Wpr9XDH0VhjuA0UnWTaPH70uUbYJQCquNgmveK+nrr8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEdstJ+/bYQvuyZm9leCenLriMDm0dSrDZYdE2WgMZvApfenlc
	VsWk9A6VfsB+jXyzc5NkO72aSKUFFR7j/cujTMw8STP6XA+E52UXz41drMRymiHdmmsfUYgMLQ9
	sSw==
X-Google-Smtp-Source: AGHT+IEWDX/fMBQN37LNDm8pwZAbb4nPz2A12lsLKXmgW0NfsvdhBH23GcxtGNe29UPGQ7kGMBybcOA6PXg=
X-Received: from pjbqn15.prod.google.com ([2002:a17:90b:3d4f:b0:2ef:8612:dd6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18b:b0:2ee:9902:18b4
 with SMTP id 98e67ed59e1d1-2f452ee838bmr1687135a91.27.1734658760980; Thu, 19
 Dec 2024 17:39:20 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:05 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-8-seanjc@google.com>
Subject: [PATCH 7/8] KVM: selftests: Add infrastructure for getting vCPU
 binary stats
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_173922_361625_E3A1683F 
X-CRM114-Status: GOOD (  15.19  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Now that the binary stats cache infrastructure is largely scope agnostic,
add support for vCPU-scoped stats.  Like VM stats, open and cache the
stats FD when the vCPU is created so that it's guaranteed to be valid when
vcpu_get_stats() is invoked.

To sanity check that the infrastructure actually works, and to get a bit
of bonus coverage, add an assert in x86's xapic_ipi_test to verify that
the number of HLTs executed by the test matches the number of HLT exits
observed by KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 20 +++++++++------
 tools/testing/selftests/kvm/lib/kvm_util.c    | 25 +++++++------------
 .../selftests/kvm/x86/xapic_ipi_test.c        |  2 ++
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 9a64bab42f89..e0d23873158e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -61,6 +61,7 @@ struct kvm_vcpu {
 #ifdef __x86_64__
 	struct kvm_cpuid2 *cpuid;
 #endif
+	struct kvm_binary_stats stats;
 	struct kvm_dirty_gfn *dirty_gfns;
 	uint32_t fetch_index;
 	uint32_t dirty_gfns_count;
@@ -534,17 +535,20 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 		    struct kvm_stats_desc *desc, uint64_t *data,
 		    size_t max_elements);
 
-void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
-		   size_t max_elements);
+void kvm_get_stat(struct kvm_binary_stats *stats, const char *name,
+		  uint64_t *data, size_t max_elements);
 
-#define vm_get_stat(vm, stat)				\
-({							\
-	uint64_t data;					\
-							\
-	__vm_get_stat(vm, #stat, &data, 1);		\
-	data;						\
+#define __get_stat(stats, stat)							\
+({										\
+	uint64_t data;								\
+										\
+	kvm_get_stat(stats, #stat, &data, 1);					\
+	data;									\
 })
 
+#define vm_get_stat(vm, stat) __get_stat(&(vm)->stats, stat)
+#define vcpu_get_stat(vcpu, stat) __get_stat(&(vcpu)->stats, stat)
+
 void vm_create_irqchip(struct kvm_vm *vm);
 
 static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 16ee03e76d66..99fe8bcd2346 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -712,6 +712,8 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	ret = close(vcpu->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
+	kvm_stats_release(&vcpu->stats);
+
 	list_del(&vcpu->list);
 
 	vcpu_arch_free(vcpu);
@@ -1305,6 +1307,11 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
 	TEST_ASSERT(vcpu->run != MAP_FAILED,
 		    __KVM_SYSCALL_ERROR("mmap()", (int)(unsigned long)MAP_FAILED));
 
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vcpu->stats.fd = vcpu_get_stats_fd(vcpu);
+	else
+		vcpu->stats.fd = -1;
+
 	/* Add to linked-list of VCPUs. */
 	list_add(&vcpu->list, &vm->vcpus);
 
@@ -2217,23 +2224,9 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 		    desc->name, size, ret);
 }
 
-/*
- * Read the data of the named stat
- *
- * Input Args:
- *   vm - the VM for which the stat should be read
- *   stat_name - the name of the stat to read
- *   max_elements - the maximum number of 8-byte values to read into data
- *
- * Output Args:
- *   data - the buffer into which stat data should be read
- *
- * Read the data values of a specified stat from the binary stats interface.
- */
-void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
-		   size_t max_elements)
+void kvm_get_stat(struct kvm_binary_stats *stats, const char *name,
+		  uint64_t *data, size_t max_elements)
 {
-	struct kvm_binary_stats *stats = &vm->stats;
 	struct kvm_stats_desc *desc;
 	size_t size_desc;
 	int i;
diff --git a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
index a76078a08ff8..574a944763b7 100644
--- a/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
+++ b/tools/testing/selftests/kvm/x86/xapic_ipi_test.c
@@ -465,6 +465,8 @@ int main(int argc, char *argv[])
 	cancel_join_vcpu_thread(threads[0], params[0].vcpu);
 	cancel_join_vcpu_thread(threads[1], params[1].vcpu);
 
+	TEST_ASSERT_EQ(data->hlt_count, vcpu_get_stat(params[0].vcpu, halt_exits));
+
 	fprintf(stderr,
 		"Test successful after running for %d seconds.\n"
 		"Sending vCPU sent %lu IPIs to halting vCPU\n"
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
