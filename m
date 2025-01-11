Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF0AE7719E
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipqe7tgqmhpLkPeLBnbRNHey4X0iVK0lvy4sm6Vr1as=; b=UteouVtS15qO9B
	4ZBKNTCXcftf/kEgGGQ7sReGVxfryMpQ/C/e3uaBYsWPSJ1/0zFvmcAo8BLJZwCZWPjJhS+1IFqBy
	xxAVQn8TmFcnj4tvHY0n3kIt/8LMTvQDjeDIh9fS+XpExpPs6K6XM/F5cDN4mEmLDZlmU6UJq0sVD
	of95eIvTmLtyLrSmoslXx68ax2fbBU5HyjobwhcPK+rxmxHxQngzC3k7jjsBuLMXdGOFOB27SGfPo
	76DSs2XdjSEvzmzB6h7vtaKBBEd5fdq1C+kqhbd+FtJMOWZjhlFSWQ8AslpfM+Arct16wAcuTBUet
	ipT0ZYdh6uyS9cu5gijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoO-0000000HRe2-1yGI;
	Sat, 11 Jan 2025 00:57:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiU-0000000HQOo-0QaC
	for kvm-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=; b=DRAvLHbF2/1BDBIlA5SbTXmLfE
	OfFasuaO3WAdgARNeGxlpoqoK698LVuVbuGsCSt7nnACtx79zIWR7KqxgcE5XV6dEgR+UFkLLdHe8
	D/8cmat+50YD1FYvYBRU93YfkUnSLjeDADU//4ILiRDaJzJ8Ne45Ma1+IXCwTNygKrkcYTg9H2ERn
	3lcmbp8aZgsEM5KSwiYhEYM3U8An0CWgoCeGs3S6K2wRBcex7+WeUdsOmsld2eg8moDr33jDmTr9L
	9h2xfUFJ7XSHvgYhh3EZ9rWkloiqTek3/zz/nm2FKnYjNmuu2r8lr3q3sCxZDldOBxGYyruMArk+P
	gyY5gSnw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiQ-00000009yMn-2hs8
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:05 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso4846834a91.0
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556660; x=1737161460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=j3Cl7emQhO0Gv8ADACM/NdBjmdKyvZlY2sfvUkjDV6PFQwegYBnWu6Jajr/MXZhTp8
         pPzJ6UiDTMOUhMVaMH8DIfLJeyFOrkJtzR8TkJcJ57NI5zY3of9cuJg6naCrwqIlpuHr
         V2ADM5L+WipPPTp/6mw23z9dscBQJ4M8xxd1Qtjoe6kBUTiQ+oEll0PtP1hU9N8/Eb//
         0ym9PNljJtv/zyXqjCmIesTnfiIEFZaTp7q13OW+5xuHLxHP3IeBaX0/Fzqc05JeU6yg
         dSdSE0jqbL8m9X2cYMu3mL4JmKXMr04KPqR1oJxN/jC3X/+CXZDdXtsNkyhT+jtCLAd9
         8nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556660; x=1737161460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=okvYZjCCnMIwXaxYSNmcq/a1ZYd8/XYW3pvxRUE1ehO/CRWXRex6JULY8dPcS2g+j0
         D4FMu5Vjnestnf9bAllrIPSBSZD3dN1cF8GPWALv5MPueC+0r3NvZum0CTfmXafD+Y/R
         lrJCL0Qcba4T+7UOHrCxuSg4w23yLVGVxKxzhP1vyvppsTohbmr6VWjv2mRSnXSfEfeV
         X1Pi1HWpA8iIOzN5fGvM73fzRr5Ervx9bSCUmnC5cm8qQ3XRScI2r9m6B/RYVad2NhBR
         vlcCKd5x+rcbOEEIkO9sEOkibPymjSBUbI8BfR8kldkfMOl81cCMdP5Px9q4t+a8rNAV
         CyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhr5lEEwDypxrMrtHE8JVYDZ4R7UADzFnk7EvJUpOc+XDYItwwQtjggGaXQWyylTNH3GJg96jLMw8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjNHl82MenX9909MdAV+H6JCr85GTDfPb4Z9sGkE0KIG2jc8yp
	ylUQ/yDp7m/GsaUcEGLR2h4D6I3DtiN8SfHAXbpA2JNG7R36ExXVqOlKFU3upcjUZdXA2yKmBHl
	UKQ==
X-Google-Smtp-Source: AGHT+IFkTOLXQinvGI8s6GviRk7XKu9XJa8etcXjW5yAd+8/VTBQJ+NHE0WBibUOfLnKYqGfPAkdUeiGwEY=
X-Received: from pjbqd11.prod.google.com ([2002:a17:90b:3ccb:b0:2e5:8726:a956])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcc:b0:2ee:ad18:b30d
 with SMTP id 98e67ed59e1d1-2f548e98f31mr17356212a91.6.1736556660239; Fri, 10
 Jan 2025 16:51:00 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:45 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-6-seanjc@google.com>
Subject: [PATCH v2 5/9] KVM: selftests: Add struct and helpers to wrap binary
 stats cache
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
X-CRM114-CacheID: sfid-20250111_005103_191408_F8C9F888 
X-CRM114-Status: GOOD (  15.55  )
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

Add a struct and helpers to manage the binary stats cache, which is
currently used only for VM-scoped stats.  This will allow expanding the
selftests infrastructure to provide support for vCPU-scoped binary stats,
which, except for the ioctl to get the stats FD are identical to VM-scoped
stats.

Defer converting __vm_get_stat() to a scope-agnostic helper to a future
patch, as getting the stats FD from KVM needs to be moved elsewhere
before it can be made completely scope-agnostic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 11 +++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 47 +++++++++++--------
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 044c2231431e..9a64bab42f89 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -46,6 +46,12 @@ struct userspace_mem_region {
 	struct hlist_node slot_node;
 };
 
+struct kvm_binary_stats {
+	int fd;
+	struct kvm_stats_header header;
+	struct kvm_stats_desc *desc;
+};
+
 struct kvm_vcpu {
 	struct list_head list;
 	uint32_t id;
@@ -99,10 +105,7 @@ struct kvm_vm {
 
 	struct kvm_vm_arch arch;
 
-	/* Cache of information for binary stats interface */
-	int stats_fd;
-	struct kvm_stats_header stats_header;
-	struct kvm_stats_desc *stats_desc;
+	struct kvm_binary_stats stats;
 
 	/*
 	 * KVM region slots. These are the default memslots used by page
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 21b5a6261106..c88f5e7871f7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -657,6 +657,20 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 	return NULL;
 }
 
+static void kvm_stats_release(struct kvm_binary_stats *stats)
+{
+	int ret;
+
+	if (!stats->desc)
+		return;
+
+	free(stats->desc);
+	stats->desc = NULL;
+
+	ret = close(stats->fd);
+	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+}
+
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
 {
 
@@ -711,13 +725,7 @@ void kvm_vm_release(struct kvm_vm *vmp)
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		vmp->stats_desc = NULL;
-
-		ret = close(vmp->stats_fd);
-		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
-	}
+	kvm_stats_release(&vmp->stats);
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -2214,34 +2222,33 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
  *
  * Read the data values of a specified stat from the binary stats interface.
  */
-void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
+void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 		   size_t max_elements)
 {
+	struct kvm_binary_stats *stats = &vm->stats;
 	struct kvm_stats_desc *desc;
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_desc) {
-		vm->stats_fd = vm_get_stats_fd(vm);
-		read_stats_header(vm->stats_fd, &vm->stats_header);
-		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-							&vm->stats_header);
+	if (!stats->desc) {
+		stats->fd = vm_get_stats_fd(vm);
+		read_stats_header(stats->fd, &stats->header);
+		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
 
-	size_desc = get_stats_descriptor_size(&vm->stats_header);
+	size_desc = get_stats_descriptor_size(&stats->header);
 
-	for (i = 0; i < vm->stats_header.num_desc; ++i) {
-		desc = (void *)vm->stats_desc + (i * size_desc);
+	for (i = 0; i < stats->header.num_desc; ++i) {
+		desc = (void *)stats->desc + (i * size_desc);
 
-		if (strcmp(desc->name, stat_name))
+		if (strcmp(desc->name, name))
 			continue;
 
-		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
-			       data, max_elements);
+		read_stat_data(stats->fd, &stats->header, desc, data, max_elements);
 		return;
 	}
 
-	TEST_FAIL("Unabled to find stat '%s'", stat_name);
+	TEST_FAIL("Unabled to find stat '%s'", name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
