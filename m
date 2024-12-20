Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417E7E7718B
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 01:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipqe7tgqmhpLkPeLBnbRNHey4X0iVK0lvy4sm6Vr1as=; b=vKhfxlUgcWg5Ez
	qfB+5jdq7NyLKjYwr1ewQnTemreQBNxIzcGxoPfgxUcy0nAzOozgQ6npYtFNhu4maNhTsaYiL+Aoe
	JsygsgMQYr51JoAybDF+aNtVSJ4x/W0GgUt3L7Ja/tPugK+LMZvT+sPf8tI1WD5Uwjr79+E9FpjZW
	QwKzF/cmrDSB27UwJMMTXyxRA2KIFm34vOIjodwrpHGnJOsCRasMIZOgR0hqR1ulhs05QHyePkC2p
	RzRQVG1oA0kR/yv1rIZWapHdQSqzAncp++pAHxXuLN6qo0sFUDmolcAqLgxi6VTacfGzlYGoc8vzw
	hZIfD0TvoUaCNfxp1VvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOS4c-00000003epy-3qGV;
	Fri, 20 Dec 2024 01:45:02 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tORz4-00000003d0Z-2Jkg
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 01:39:19 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725e87a142dso1934684b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Dec 2024 17:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734658757; x=1735263557; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=Fdb/CW31FLRzWTePnE83ZWd4y7HyplmIcyZLT+WcN7t7aT1DC57/6DD/3CHetZR9Wj
         PjmU5tK93hVn1PyRXO9ZAyTnKO4OjfpWT/B5TWA8RRIPvLJsr/shQ7sTgE2JpJ8xcpPa
         deXaZDYT969Vnqo7uyRmk5byofJR1+LoyMYLuEfvm99pYL7XPLmD5YjmuW3utLan4Pw8
         v0j9KmmvdDXarpa/aqtRn0YR0W9hfNLnQ7LuWG8sgGHoC7jlj98h34Ou9jxtoRSla2TX
         XXl/DRVT0rurfB4MjXNLYNnFjjWGX7V5xNzyMWnNZQiPmy72Exz9v1g604/wfMYhBGle
         Iqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734658757; x=1735263557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=rIeSc6Zt4psHPCQTMk7F9CYlKPyrRVcHd7UCmEFoLLoSKrt5rLqOsqejbqiAGXicmp
         KpUVU9KNpsLUkdsPowJe82ALAYi4FcsTVnARU/keV/bMVW+KiPyH1t6yS3i5j1hekK9Y
         wfXuNVkHGu/qBuqCHDulc01eWdzI1mKHGdnjVCbXzw9p5SKXS8jTnfjOGZa3gojyGJ8Q
         0yfDLvW42JKKdVQlwjphSG/HQ+jn49yaZXuFLYkEpt+w2RK29rRAY2dOffvP8DghUlyv
         ofZIH9yIhgwFzNIptSXe+x3xxL5+LjXrnUfgihe+gdfSZSzyU68HqyVdg/lhyHZyn0St
         bH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFxJFrcxZhD2/71GvFavOHQNwroV4B8kXW2apYNW25TBFnUspV6UPUALaQafiiCumYLLL2rq04Mnk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyWAx2ULcW0N5GC3dmMFfd8h4EDW9xmnU5+TB46EbEykGyelgr
	YjrJr7LBHs30uklVTA2T6OPR4znzAQ0pjcdiGEXaR6wnwgBuQhlXEmLgyDvcV+NXZQ0PrlaJeXM
	biw==
X-Google-Smtp-Source: AGHT+IGUByijU78nvHemXzOEaAQQDSmObXI7NYnb4v2toowk5S9287aNHUtx84WY5rqumwN+j1k67ZUHOWo=
X-Received: from pfd7.prod.google.com ([2002:a05:6a00:a807:b0:727:2d74:d385])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d1f:b0:1e1:b1e4:e750
 with SMTP id adf61e73a8af0-1e5e04717a2mr2014875637.18.1734658757426; Thu, 19
 Dec 2024 17:39:17 -0800 (PST)
Date: Thu, 19 Dec 2024 17:39:03 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241220013906.3518334-6-seanjc@google.com>
Subject: [PATCH 5/8] KVM: selftests: Add struct and helpers to wrap binary
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
X-CRM114-CacheID: sfid-20241219_173918_588191_42DF5FFF 
X-CRM114-Status: GOOD (  15.05  )
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
