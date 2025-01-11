Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0021DE77188
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCFfmurqXeWDUtiW4rzA1qsmR/9nCBEjEdIXlsAzQzU=; b=kktau0jBlPUDVh
	wvBx3j96yxw2FYjVyUW19kSs+dusLW4L/5oXa3/4z4pd1nkp9D6Jpks6hIgGu4sWpo3Vm9K0Wsgkv
	kY3NxYpPQ/VSMZCe97XNJ2dL/qWqSrB6ju+opf/KAy59jNUjOUyOhkq3zCj+eMy2ENiI0EKVyROhb
	QbhK6s12Zyg5TNTQXPujh+TFtFLkVCVU/FyFdJ4qncR5yfWVSw/MxL78fvEDOFVUZIDwlkl6RYymA
	BnDcnc449X2ODfmb4lxrCA0oWXcpQiFhwT6QWAvfRmgf8mxIJ77bnz8dLcmdU5DuTbm7NZhD/wRt5
	e2TOFSn3Un3alalDMDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPoP-0000000HRfF-12N8;
	Sat, 11 Jan 2025 00:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiU-0000000HQP5-3xCI
	for kvm-riscv@bombadil.infradead.org;
	Sat, 11 Jan 2025 00:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=; b=qB0MzFFLY/pFVbObBygexfaIYB
	23yosxA6aArDm9LH7EUska+fO53uAevvuDG2krPPn50EBX3UHnF6jz3LoyXXyWIpj1GuslvrHNhFP
	6TdLsWF7CdECwyncckFV9JNlgOrBGprt1ffFsHgfyAw8HZk4nOtbajbZkSVSs7XN3jZWhtp01UR+H
	tL5qzvk7RYh/dZXQEUfausclo2PU2xHv+a8oRoEPVWjS2KLb/8RS8mC6v+3xwjrsn6su744+AG0UP
	5JbDsSsvaR5veUw8zwyhd3oiEWW4iJkgEpThD/kguwXcv+W83CtTWjI9DbjLVbiT4QV6rmR/LU/ox
	iFC3ppqg==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiR-00000009yMi-07xe
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:05 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2167141e00eso44277215ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556658; x=1737161458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=;
        b=fbS2wz2jj4HK4Rqt9aPRWds6yNpeJG6qWQ3bpOxEvYhWnJvKUtbIub9fY6N0KW7HY1
         8WdThtJDX6xvbCQtNIRcPXGFBXMlDSpn0dIJxxZJMFy9CnEXMyeNfgaJKhi2MP2SkAj0
         SJ+dtjSye7DG5olidPmSPT8mxMerqUkxBu7u18w38tInyjJdGOUVSSuHufDdTkpCfmqA
         GwrQXA8Hg3tB0MfPVA5/OPiQAsmaygXcWLGsJr5e14XMuP+oMaMCar7EhjRyGRbv4C8A
         9wxcmDEdy2OTjlrbDb/2L7Zmpg6dv2N3dvmWccKN3ReZ/71JhHZ7CeJcGBmfaV8NbxB2
         kk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556658; x=1737161458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOB7JN0OSt2j8FiVppNC5qzgljC2YrzarOO3DmltLC8=;
        b=g7RRmP1rRQbPE66SIhUyRBNZPZP086Frp+UTOvLkt6xWaVT+EKM3Q11sbiB/+WD2vn
         /U/CffT5prpUje3dUxiFKZbPbqLRmbQ6eurcZJra5KGOXX5l8gzohjPd7JBmRZ/xzFOR
         GYv/sV7cY83q2UrtLF1XGXJBPqAIbRXkDBt2nLIDuq7fwHqYWaaJIJVdPJlNOM2QdkRW
         7xxHym7Kkgdbq12F+8NwiYUh6IcJ/9tK8LMkTSEa0kHuBvzkyqJSA061fKoIIUsvqQzd
         IFtzFpa3wRMEZOSShmqyJ1YWkdoviK4FKFD34XC4OEuRdyAWm7AHE1xWjc3REIkP88Tq
         n/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7FmjZbHt/jVFkWyX4s2FR2gi4BoqwA8pGbUR/5tGdXeef/gUPeXD5qhD/6l5B1RJJz4HNQMSp7KY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhbWI7UHOhEtmgCdvm2r/h0PNkXoQkTFjEfSOgUiwWSzcE7PT4
	0jIoAxgd8fWDB0QQWjt1MVcy3qv+bJ01B50SDig9LETgnHq4bSPrSSavN1lG+uvaYX8uDJ0tNLm
	bxw==
X-Google-Smtp-Source: AGHT+IHw+facaWQOVSZ1pCK120eQYAoo8aTdmYyBocQEoqyBkRp7UviUm/cm4T86jySXDaDXKVoax9zRB1k=
X-Received: from pgqb5.prod.google.com ([2002:a65:41c5:0:b0:9a1:7139:ff84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:339b:b0:1e0:bf98:42dc
 with SMTP id adf61e73a8af0-1e88d0bfa04mr21140343637.28.1736556658420; Fri, 10
 Jan 2025 16:50:58 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:44 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-5-seanjc@google.com>
Subject: [PATCH v2 4/9] KVM: selftests: Macrofy vm_get_stat() to auto-generate
 stat name string
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
X-CRM114-CacheID: sfid-20250111_005103_340687_1CA8CE4A 
X-CRM114-Status: GOOD (  10.28  )
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

Turn vm_get_stat() into a macro that generates a string for the stat name,
as opposed to taking a string.  This will allow hardening stat usage in
the future to generate errors on unknown stats at compile time.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h     | 14 +++++++-------
 .../kvm/x86/dirty_log_page_splitting_test.c        |  6 +++---
 .../testing/selftests/kvm/x86/nx_huge_pages_test.c |  4 ++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..044c2231431e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -534,13 +534,13 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
 void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
 		   size_t max_elements);
 
-static inline uint64_t vm_get_stat(struct kvm_vm *vm, const char *stat_name)
-{
-	uint64_t data;
-
-	__vm_get_stat(vm, stat_name, &data, 1);
-	return data;
-}
+#define vm_get_stat(vm, stat)				\
+({							\
+	uint64_t data;					\
+							\
+	__vm_get_stat(vm, #stat, &data, 1);		\
+	data;						\
+})
 
 void vm_create_irqchip(struct kvm_vm *vm);
 
diff --git a/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c b/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
index 2929c067c207..b0d2b04a7ff2 100644
--- a/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
+++ b/tools/testing/selftests/kvm/x86/dirty_log_page_splitting_test.c
@@ -41,9 +41,9 @@ struct kvm_page_stats {
 
 static void get_page_stats(struct kvm_vm *vm, struct kvm_page_stats *stats, const char *stage)
 {
-	stats->pages_4k = vm_get_stat(vm, "pages_4k");
-	stats->pages_2m = vm_get_stat(vm, "pages_2m");
-	stats->pages_1g = vm_get_stat(vm, "pages_1g");
+	stats->pages_4k = vm_get_stat(vm, pages_4k);
+	stats->pages_2m = vm_get_stat(vm, pages_2m);
+	stats->pages_1g = vm_get_stat(vm, pages_1g);
 	stats->hugepages = stats->pages_2m + stats->pages_1g;
 
 	pr_debug("\nPage stats after %s: 4K: %ld 2M: %ld 1G: %ld huge: %ld\n",
diff --git a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
index e7efb2b35f8b..c0d84827f736 100644
--- a/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86/nx_huge_pages_test.c
@@ -73,7 +73,7 @@ static void check_2m_page_count(struct kvm_vm *vm, int expected_pages_2m)
 {
 	int actual_pages_2m;
 
-	actual_pages_2m = vm_get_stat(vm, "pages_2m");
+	actual_pages_2m = vm_get_stat(vm, pages_2m);
 
 	TEST_ASSERT(actual_pages_2m == expected_pages_2m,
 		    "Unexpected 2m page count. Expected %d, got %d",
@@ -84,7 +84,7 @@ static void check_split_count(struct kvm_vm *vm, int expected_splits)
 {
 	int actual_splits;
 
-	actual_splits = vm_get_stat(vm, "nx_lpage_splits");
+	actual_splits = vm_get_stat(vm, nx_lpage_splits);
 
 	TEST_ASSERT(actual_splits == expected_splits,
 		    "Unexpected NX huge page split count. Expected %d, got %d",
-- 
2.47.1.613.gc27f4b7a9f-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
