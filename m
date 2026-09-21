Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34134C982F7
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YP4rqeGSrsNDUIIUZNgQZ1vOkOQZSJUBvqqOA9SC85Q=; b=1m0I4rHR+pHB5V
	AYl8+HLhycyfyJjoLWbwjbysoxHVcFfnntsnIFYjxcrpCJ0Fji+uif/sclqlw4nhIMvdl2nX97GI0
	FEm05w6p7ceXFSbqEcayd5lAsWhzMkfn5BrQLRYa/BCl+WrG/ulfM2ZNnItxiK0bnDOYb5mGuHqza
	wKolNO2WnwFXlZj2OJQ5xHG2NSIHZQBhGw++ou2xiwOPtgAelr3yfSM8w/oZgZf6f7rw+ZB74lw2g
	dQXVeNc4hIxyIUYmE23z3uhyjoAhL+nWnQK+JuS3H9FKjGUOnwdYK0pvjinpghjnpB2OVr5QfZOWe
	3VDp32h1kGcOzXIHWr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byt-00000001qK1-3mYq;
	Mon, 21 Sep 2026 11:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byq-00000001qFR-0bg7
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=; b=WQbqsEQgmvnZYPk7CKOr2plB/Z
	xIdNv1Tfu8UIDAjKSuUYZMHzJ3N1s9CnYLhFTH2D/nSkrNqtwR1gnXPbDEzLDKBHW0pXbLxt8/9rN
	i1Rv+ZEF6N+zJHzbpIC+gw5avJDg0cDAiAqUpF7AZTgeNLRwCeeWRExmgD7RGge/gbp+cnYBfDFej
	c4SMnRpnXVvQcSlM7ptLf+Oh0K7dq76SqYPrIb5cK+4cNUd3AQq3AXGNfWNM/gwm7VYZFqr8GUsOG
	jXWFj5VMBJZcoLmvtBZ3X6UeQAxfOtSqnFuIo05uRU7fG80gZhmg+Gu1J6NUVmJbSmqbanvGwO1K1
	juqyIsYw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byl-0000000CB5f-1GA7
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:37 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c3304833so1958346a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989273; x=1790594073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=;
        b=DF4LiIV3RqtAi2/0Fsow+nObLP2hX1ap+gIBiaC+2l/I4RkXYstBAVBxRaKb/HTu+V
         dYuObLxqgeTYbct/yQQQytlcUwBU6BYvpxy/9x3uU5mqF0hk1I1J8CEtDizqdbxvQT27
         SlJfeZW/EsPEbL0RK4mmKpXMHtlD3Ve9Log8HnojV/YREWMxT1hB/kjWwYsLALOMoOy7
         rt1fTw5GHeSlPrwKIq7Vfv08W7RzZAPXNxy6rqQEpDkZa4LqNpHkOBlZibN/sSIxyO3t
         EsnWT7qijDQet0izq01bAwvQV4Q7TfP8ROunryn1/lBN7bdDcXpnncNxCbREhmYaTKlA
         DUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989273; x=1790594073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ef3phNMqqlA8Z4yqCL8AgS9AIUhshDlKUByQ4fToEc=;
        b=kMO5HD2K5NcJ0Yoc2WA6zLRA4P7a1bRRtRv5/dbV7jIvrq27cFoujhp1z3FsUIhh8X
         G0Xte5wCB8BBrDd2P2I8FMFTvV+VZQuFAJIJZVCOBOoAEcreG4CypD3Vb/9AbwENSAml
         NWMOLpMxoVxQNK4jWEZJgXANta779ZPyaxRQmRDPT4TnvtJWL1sC1xw5shGOg+vDgfXT
         doijN4cE5QUSaxz8FoQo2vu7vIcsRdH+Gq8sc6cKWu8B6lqv+wdGuK0pkCdaloJ8lTtR
         RbTpbP2PkP7FUMxFZDu2mfUPT9bjH10st+syzmrip0BbRNvSYnZyugMey4E/GFTPtNPF
         xUig==
X-Forwarded-Encrypted: i=1; AKwUvBydTpjGYHaeI6Byx2k11p7zUPSWK9CrjnPcU+5FWzwjRzmI8S/xoE3cNhrJOYv4NTv4XOWB104yO/w=@lists.infradead.org
X-Gm-Message-State: AFuF++ll4mpyG28+2alxHCORLvzuBm3Ra1naabdPn1SuA02+iE3v1mZ4
	/dwVLoEwwZM83/aGlHA8f0qjvACtDt5xswaEgHOjKKWccpblkjGsm5ko
X-Gm-Gg: AYBFou2wJQ+QbpAkZ8iyotXyengzLvGjjRE5iu9gnGYfHmVH9jbPKVddZcUULXib2Sf
	LmZRZSC2qw1QqoMEj+BKIuStBV3fbhx9UhlUHgJtlrIR8m2r0cHzGq31VG6kSPkUzocUUetWWcQ
	t3KN4whRqOJFIwXqFwRY1pLAMFeIB8MYay54vD8+4pKbMjDtYULQ1wHOfrP7Qb4fJ5ofKl0Lyix
	MgnIMtphEDUmrIx/0nZ4T8R3fksexVcPbTkY0FQxHAuHbnYIcnDQrMEEzu4wizofYgS/iV8WNyr
	AmdSHz0/TGjGsIYmKOe1rGojreozVjGDVqmy6imaQllyvup3mPIgXUOhM9jgwKwOi11yrk94f5M
	Ggm5wa5zqKlZF+u/ZBjMJNQEKC+tA++xZirPmUeOtd8Fo66lyIxzamhEAisRsyFsETtRBNabiku
	SCNkz4pdJU85gTvLktKeZ2FKXHX4aYOZQgzSEOAvZ3O9dGfQOYYJo1wYfmFLER/TCAx2wMHOsFC
	ntaUIg0rebHXhf0JBwO9Q==
X-Received: by 2002:a17:90a:e18f:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39e54aa347dmr15111936a91.7.1789989272818;
        Mon, 21 Sep 2026 04:14:32 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:32 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 4/5] KVM: riscv: Free G-stage page tables after an RCU grace period
Date: Mon, 21 Sep 2026 20:14:01 +0900
Message-ID: <20260921111402.120911-5-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121435_727917_DAC59DA5 
X-CRM114-Status: GOOD (  17.01  )
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

G-stage page tables are currently freed immediately after being
unlinked under mmu_lock. This is safe while all walkers hold mmu_lock,
as a table cannot be freed while a walker is using it. A subsequent
change will allow aging walks without mmu_lock, where a walker may
obtain a child table pointer just before a concurrent unmap unlinks
and frees the table.

Defer freeing unlinked page-table pages with call_rcu(). The parent
entry is cleared before the child table is retired, so new walkers
cannot acquire it while existing RCU-protected walkers can safely
finish using it.

Apply the same lifetime rule to the root PGD. Unpublish the root with
WRITE_ONCE() and defer its free with call_rcu(). Keep pgd_levels
unchanged so a walker that observed the old root continues to use
matching page-table metadata.

Wait for pending G-stage page-table callbacks with rcu_barrier() when
the RISC-V KVM module exits so that they complete before the module is
unloaded.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/include/asm/kvm_gstage.h |  2 +-
 arch/riscv/kvm/gstage.c             | 16 +++++++++++++++-
 arch/riscv/kvm/main.c               |  3 +++
 arch/riscv/kvm/mmu.c                | 16 +++++++++++++---
 4 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index a03db1a10095..caeed6de6dbe 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -111,7 +111,7 @@ static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *
 	gstage->kvm = kvm;
 	gstage->flags = 0;
 	gstage->vmid = READ_ONCE(kvm->arch.vmid.vmid);
-	gstage->pgd = kvm->arch.pgd;
+	gstage->pgd = READ_ONCE(kvm->arch.pgd);
 	gstage->pgd_levels = kvm->arch.pgd_levels;
 }
 
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index f7e4756ce15b..fc39d188b20a 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -22,6 +22,20 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #define gstage_pte_leaf(__pte)	\
 	(pte_val(__pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
 
+static void gstage_free_page_table_rcu(struct rcu_head *head)
+{
+	put_page(container_of(head, struct page, rcu_head));
+}
+
+/*
+ * Defer freeing an unlinked page table until lockless walkers
+ * that may have observed it have exited.
+ */
+static void gstage_free_page_table(pte_t *table)
+{
+	call_rcu(&virt_to_page(table)->rcu_head, gstage_free_page_table_rcu);
+}
+
 static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
 					     gpa_t addr, u32 level)
 {
@@ -406,7 +420,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			flush |= kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
 							 &next_ptep[i], next_ptep_level, op);
 		if (op == GSTAGE_OP_CLEAR)
-			put_page(virt_to_page(next_ptep));
+			gstage_free_page_table(next_ptep);
 	} else {
 		if (op == GSTAGE_OP_CLEAR) {
 			set_pte(ptep, __pte(0));
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 89568ccce01d..5fcf425f7150 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -262,6 +262,9 @@ static void __exit riscv_kvm_exit(void)
 {
 	kvm_exit();
 
+	/* Wait for pending G-stage page-table RCU callbacks. */
+	rcu_barrier();
+
 	/* Unregister CPU PM notifier */
 	if (IS_ENABLED(CONFIG_CPU_PM))
 		cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 342f606399e5..8aed69abf814 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -761,6 +761,13 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	return 0;
 }
 
+static void kvm_riscv_mmu_free_pgd_rcu(struct rcu_head *head)
+{
+	struct page *page = container_of(head, struct page, rcu_head);
+
+	__free_pages(page, get_order(kvm_riscv_gstage_pgd_size));
+}
+
 void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 {
 	struct kvm_gstage gstage;
@@ -773,9 +780,12 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		flush = kvm_riscv_gstage_unmap_range(&gstage, 0UL,
 			kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), false);
 		pgd = READ_ONCE(kvm->arch.pgd);
-		kvm->arch.pgd = NULL;
+		/*
+		 * Keep pgd_levels unchanged for lockless walkers that already
+		 * observed the old root.
+		 */
+		WRITE_ONCE(kvm->arch.pgd, NULL);
 		kvm->arch.pgd_phys = 0;
-		kvm->arch.pgd_levels = 0;
 	}
 	write_unlock(&kvm->mmu_lock);
 
@@ -783,7 +793,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 		kvm_flush_remote_tlbs(kvm);
 
 	if (pgd)
-		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+		call_rcu(&virt_to_page(pgd)->rcu_head, kvm_riscv_mmu_free_pgd_rcu);
 
 	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
