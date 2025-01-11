Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA7E77188
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zw8YOYjM66Whw71wW4TTpqasVqGlCK+AmENVmQTZPLI=; b=DQQTEzQ7KpgwXe
	rDeIb21BRvmj+iIotvFuVdjOTx+QpQ3/X1c5zNii7oL6RN3I3Z17m1ooBs5BQyqeca8nSJmDjnmCc
	7YK+PV2j5sWqBJnqhwR9qKsc7TfRKTb9qDXgEfOpVliwVyUhg+6UGvFu5sPMHWhG/KEY+xfQNKl6a
	w+0BeaIyTI8TaC0J2LSi3nbJxciTxTucroTnLz68SvR0EZwpEfRXj3XA/G11cF/yqbGTG83gQ/cjw
	c+y72rVA2s/65p8lqlEkConSzCYgYwKupqkh+C2kVyvv462of6sHiYmxXQPcvtndq1kNjDQLTZULz
	OYBb+Tu7AOUZIeHouo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPuL-0000000HSRI-44a6;
	Sat, 11 Jan 2025 01:03:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPia-0000000HQRL-1vvV
	for kvm-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=; b=mlbSSi4MYlgXvX41Lw6uqJxvDX
	/8e7PeP4NNp58hYHZkT64jsmSrVJSM+wldj1HHXedNiZKrQUmkY+3bxan35rikh6LnwAbGcv8ElMg
	ErD/x0d4W+TFVrDYnSZcUoT4jMIa31IAPPDdiuVgpDV2eudFsUGKRELRmaQujE+tHR72jG8X/DDrl
	z9/0iA1iAyfRXRF1KOAKKGAhfUsFGWQk+QBOTYMu3pjzRXZqHG4F4ZSaiiNuJ2vXNLzaqITWdrjpT
	7/jMQux57YkYuoQ7MrBpKKI6UZnLRykFXYHL7ReyprcKKi6kIQthnwTDzbkHhAWiyAdLtCU55m0va
	I0///bAA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiV-00000009yPz-0p1o
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:09 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2efc3292021so6654149a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556665; x=1737161465; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=;
        b=EPxm7W0iCU/5ySiLlRBpXN85sALMgLSuSfE5lJSFlnYlFJZ42CAsKdFxwPVP2tsk5o
         ACM3bKFCjHe1S6nSXRlY3AB5ePjvsdVORV20LCAB+Xx2KIutovGVttk0DiYIS3/Q+yPN
         l3L9FmiXz2q6Mds5UZGQ2iGTMqchgc3Ri2KrFqaDoZKW8LBnGE/m4B6qTbx3eyh+Ttw5
         OUEMeMy43cpKZhqmcqyuJdsYyUX+0dpYNqdMKLhkQl+rWb+g9o79sg0JyIg1n7sxPPyw
         frxb0KN3tzZdiVERPEzwaTxZiUF9/KzEHgO+U/oVBG90fkgYQsdeec6JMp/+2IOqV9WA
         dIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556665; x=1737161465;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jTPjKFoWnkMFK18trrM7yX38QagKVQtox0CY8pTl0Bc=;
        b=pk5jkxj14pwvISfVZo6TkrsBa2YlYTtvoovBbOsDs9w6wXRqyOnJPb+lbHG2C/2FwY
         W2KSasakxGFOI2Ex71rxgN3oJil9G1AV0eh9I5p9MD5azNvXAKcrjEZOVJdIaECUjvd/
         iIrA7xhhUcr4VQqnrT4vvgHtOqNpegkTa9GvodKM8YRC7eLrHbJi0Mv5alKEtdfCzk/j
         6xz5+uMINE3xfSx/GhVDVt1mqqqModKLoJ6P0Al1A1Q9b11UhVqb0P4wOsfcL5YkodX3
         ArHkd9JY8SVaCvVqiEH7qyeX2SaaznFq9ul0yFyytxvtPq9gEaJB2W3Ry7au6+5vy54S
         0eYw==
X-Forwarded-Encrypted: i=1; AJvYcCVR7F6Gprn5V1dED+eyn7QSmMhp3GfRsEFPzFoc7lADju7dJ/SK35Bac9g5rbQzifXXLrcrjyV5ldg=@lists.infradead.org
X-Gm-Message-State: AOJu0YznScBPlX6v62r8B89SzXI5SwVZ7esPbn7yY1urA05Mo2j2t/hx
	6yDS9zJvhE05efGmaubqgY9eDEiBrefRTw/bw+sGBsZ2k2YFh/q27eJHfowU2pSk/VL3tTJ/N4n
	j3w==
X-Google-Smtp-Source: AGHT+IFOLE/1SSJYHsGdzvK8LKxhrHPTw3kVbRGTeeJk8BpZZB2Ck9vGEUtjLxLwAqw4e0hK1JN9nSs0EVE=
X-Received: from pjbsg5.prod.google.com ([2002:a17:90b:5205:b0:2ee:3cc1:793d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c84:b0:2ea:a25d:3baa
 with SMTP id 98e67ed59e1d1-2f548f17351mr17744741a91.5.1736556665395; Fri, 10
 Jan 2025 16:51:05 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:48 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-9-seanjc@google.com>
Subject: [PATCH v2 8/9] KVM: selftests: Add infrastructure for getting vCPU
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
X-CRM114-CacheID: sfid-20250111_005107_476414_CFE2B145 
X-CRM114-Status: GOOD (  18.80  )
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

Account for the extra per-vCPU file descriptor in kvm_set_files_rlimit(),
so that tests that create large VMs don't run afoul of resource limits.

To sanity check that the infrastructure actually works, and to get a bit
of bonus coverage, add an assert in x86's xapic_ipi_test to verify that
the number of HLTs executed by the test matches the number of HLT exits
observed by KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 20 +++++++-----
 tools/testing/selftests/kvm/lib/kvm_util.c    | 32 ++++++++-----------
 .../selftests/kvm/x86/xapic_ipi_test.c        |  2 ++
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index d4670b5962ab..373912464fb4 100644
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
index f49bb504fa72..b1c3c7260902 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -415,10 +415,11 @@ static uint64_t vm_nr_pages_required(enum vm_guest_mode mode,
 void kvm_set_files_rlimit(uint32_t nr_vcpus)
 {
 	/*
-	 * Number of file descriptors required, nr_vpucs vCPU fds + an arbitrary
-	 * number for everything else.
+	 * Each vCPU will open two file descriptors: the vCPU itself and the
+	 * vCPU's binary stats file descriptor.  Add an arbitrary amount of
+	 * buffer for all other files a test may open.
 	 */
-	int nr_fds_wanted = nr_vcpus + 100;
+	int nr_fds_wanted = nr_vcpus * 2 + 100;
 	struct rlimit rl;
 
 	/*
@@ -746,6 +747,8 @@ static void vm_vcpu_rm(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	ret = close(vcpu->fd);
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
+	kvm_stats_release(&vcpu->stats);
+
 	list_del(&vcpu->list);
 
 	vcpu_arch_free(vcpu);
@@ -1339,6 +1342,11 @@ struct kvm_vcpu *__vm_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id)
 	TEST_ASSERT(vcpu->run != MAP_FAILED,
 		    __KVM_SYSCALL_ERROR("mmap()", (int)(unsigned long)MAP_FAILED));
 
+	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
+		vcpu->stats.fd = vcpu_get_stats_fd(vcpu);
+	else
+		vcpu->stats.fd = -1;
+
 	/* Add to linked-list of VCPUs. */
 	list_add(&vcpu->list, &vm->vcpus);
 
@@ -2251,23 +2259,9 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
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
