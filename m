Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C664DCC6B1D
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxOd/s845I6YxatV6/WjcrBjRpjReTS6OBmp2kjzFS8=; b=Q8VxP7C18ia1XP
	C9P6/MekkrJEQB6W/gxMrmgVv528LB5nX8xvmDy/fC21RC/4LsODbbpqQS0JfkNYZ6c+nHlIePGQW
	o4PbnAAqQL4X/6oLQjm0NUmBsxFm+05QFbmXOHdd5kT4DMA21hZ4pbGaTIYgogEJcvpw3XAKdroWG
	LQWtqWvB42bKjA9I29J++2xacjyI/NdGZy3IQwjRFGzdvD2I+VOL19VX738XLu/h/7ppDEb23TUAc
	7Wiap61wDiua9ASCEZKL/AoWprRLa03GVp8P/Y7S8fvaF/3YIPsIcnqasEdgKosbxywHFlR8L/u2l
	FICnh9MMFd8JJqUXbucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi5-0000000Fgip-47MB;
	Wed, 14 Oct 2026 14:12:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzi5-0000000Fghf-0Exg;
	Wed, 14 Oct 2026 14:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UMeQJiIhi3N1WM7pDeMhvff+GLRFDhHq1z1NCwRI5vo=; b=hPNa/5N/Rk6m0xKER1GIzDVg1Q
	4jF9PNK/zpQh8D7sfuOqyRn2MOHV9LSG7wBe6jCGfjLDFHTPM5BPr0Ay1IZlvOcTEBKMV58K8/LcE
	Xj5ndr/eImTKo3eP5xNeE1aRqT79L1lECyAG+3DdcyNS3fIfcGqhvgGg2G/Mj7DA3K7axpsTQFzjC
	7Oqr8HTB844iVnxnHD84zlNzZ9BRNZcG4I1kuMmcN2M8oswv3+JlrpUyUQE3hewJU2nzrXURHHJPw
	EKGBQUQshCM6JKQC4wuu6q14r8nrU3/O6Tb0qBTRp4w7+zO8VjjPoNgDbHOAIOGCjEKlXi7z89e9t
	eGwixAsg==;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGzhz-0000000GriG-1hpk;
	Wed, 14 Oct 2026 14:11:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791987097; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=UMeQJiIhi3N1WM7pDeMhvff+GLRFDhHq1z1NCwRI5vo=;
	b=TXeQnv/4n2YDOQLPpiajRMDw9YV5TVDK2SCxQK9UXk3efXDvsft51RAb69GQ0/N5dDBv5w6IzhQw5ShL58WVXRNpllxFAJtD66DTDYDSQUL2niiU6tyhr/Z6Mrj0dikqpUYevXSujjjWzpU+HB5oZeqw5Afe/V8m2nk1hvLKTpM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XCp41.4_1791987095;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XCp41.4_1791987095 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 22:11:36 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	gsh517025@gmail.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/4] iommupt: Add replace_leaf to atomically swap a leaf OA
Date: Wed, 14 Oct 2026 22:11:21 +0800
Message-Id: <20261014141124.48569-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
References: <20261014141124.48569-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_151157_562116_14661265 
X-CRM114-Status: GOOD (  20.85  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Some users need to repoint a leaf entry to a different physical page
without ever making the IOVA non-present. RISC-V IRQ forwarding without
an MSI page table maps the guest IMSIC page in the second-stage domain
and must follow the page when a vCPU's VS-file host page moves; an
unmap/map sequence would leave a window where device MSI writes fault.

Add a pt_entry_replace_oa() format op that atomically swaps the OA
stored in a leaf entry that fits in a single PTE word via cmpxchg,
validating that the entry still holds the expected old OA, and a
pt_iommu_riscv_64_replace_leaf() export that walks to the leaf. Formats
that cannot do this atomically do not provide the op, following the
pt_iommu_fmt_hw_info() pattern. Covered by a kunit case checking the
granule and superpage swaps, stale OA rejection, and missing
translation.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h      | 47 ++++++++++++++++
 drivers/iommu/generic_pt/iommu_pt.h       | 65 +++++++++++++++++++++++
 drivers/iommu/generic_pt/kunit_iommu.h    |  7 +++
 drivers/iommu/generic_pt/kunit_iommu_pt.h | 54 +++++++++++++++++++
 include/linux/generic_pt/iommu.h          |  4 ++
 5 files changed, 177 insertions(+)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index 2f4838eb44af..38c837805df0 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -27,6 +27,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/container_of.h>
+#include <linux/errno.h>
 #include <linux/log2.h>
 #include <linux/sizes.h>
 
@@ -272,6 +273,52 @@ static inline bool riscvpt_dirty_supported(struct pt_common *common)
 }
 #define pt_dirty_supported riscvpt_dirty_supported
 
+/**
+ * pt_entry_replace_oa() - Atomically replace the OA stored in a leaf
+ * @pts: Table entry to change
+ * @old_oa: OA the entry must currently translate to
+ * @new_oa: OA to store in the entry
+ *
+ * Atomically swap the OA stored in a single PTE word leaf entry, keeping
+ * every other bit of the entry unchanged. The entry must currently translate
+ * to @old_oa so a stale view of the table is detectable. Both @old_oa and
+ * @new_oa must be aligned to the size the entry translates. Entries that do
+ * not fit in a single PTE word, such as contiguous entries, are rejected.
+ *
+ * Return: 0 on success, -EAGAIN if the entry changed concurrently, -EADDRINUSE
+ * if the entry does not translate to @old_oa, -EOPNOTSUPP if the entry spans
+ * multiple PTE words, -EINVAL if an argument is malformed.
+ */
+static inline int riscvpt_entry_replace_oa(struct pt_state *pts,
+					   pt_oaddr_t old_oa,
+					   pt_oaddr_t new_oa)
+{
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) + pts->index;
+	pt_riscv_entry_t old = pts->entry, new;
+	unsigned int oasz_lg2 = pt_table_item_lg2sz(pts);
+	u64 ppn = (u64)new_oa >> PT_GRANULE_LG2SZ;
+
+	/* Only a leaf entry that fits in a single PTE word can be replaced. */
+	if (pt_entry_num_contig_lg2(pts))
+		return -EOPNOTSUPP;
+
+	if (oalog2_mod(old_oa, oasz_lg2) || oalog2_mod(new_oa, oasz_lg2) ||
+	    ppn > FIELD_MAX(RISCVPT_PPN))
+		return -EINVAL;
+
+	/* The leaf must still hold the OA the caller expects to replace. */
+	if (pt_entry_oa(pts) != old_oa)
+		return -EADDRINUSE;
+
+	new = (old & ~(pt_riscv_entry_t)RISCVPT_PPN) |
+	      FIELD_PREP(RISCVPT_PPN, ppn);
+	if (!try_cmpxchg64(tablep, &old, new))
+		return -EAGAIN;
+	return 0;
+}
+#define pt_entry_replace_oa riscvpt_entry_replace_oa
+
 /* --- iommu */
 #include <linux/generic_pt/iommu.h>
 #include <linux/iommu.h>
diff --git a/drivers/iommu/generic_pt/iommu_pt.h b/drivers/iommu/generic_pt/iommu_pt.h
index 3d1fdf1e81d8..5e296992c4df 100644
--- a/drivers/iommu/generic_pt/iommu_pt.h
+++ b/drivers/iommu/generic_pt/iommu_pt.h
@@ -375,6 +375,71 @@ static int __maybe_unused NS(set_dirty)(struct pt_iommu *iommu_table,
 	return pt_walk_range(&range, __set_dirty, NULL);
 }
 
+#ifdef pt_entry_replace_oa
+struct pt_replace_leaf_args {
+	pt_oaddr_t old_oa;
+	pt_oaddr_t new_oa;
+};
+
+static int __replace_leaf(struct pt_range *range, void *arg,
+			  unsigned int level, struct pt_table_p *table)
+{
+	struct pt_state pts = pt_init(range, level, table);
+	struct pt_replace_leaf_args *args = arg;
+
+	switch (pt_load_single_entry(&pts)) {
+	case PT_ENTRY_EMPTY:
+		return -ENOENT;
+	case PT_ENTRY_TABLE:
+		return pt_descend(&pts, arg, __replace_leaf);
+	case PT_ENTRY_OA:
+		return pt_entry_replace_oa(&pts, args->old_oa, args->new_oa);
+	}
+	return -ENOENT;
+}
+
+/**
+ * replace_leaf() - Atomically replace the OA stored in a leaf entry
+ * @domain: Table to manipulate
+ * @iova: IO virtual address to locate the leaf
+ * @old_oa: OA the leaf must currently translate to
+ * @new_oa: OA to store in the leaf
+ *
+ * Locate the leaf entry translating @iova and atomically swap its stored OA
+ * from @old_oa to @new_oa, leaving the entry attributes unchanged. HW
+ * walking the table concurrently observes either the old or the new OA. The
+ * caller must invalidate any translation caches before assuming HW no longer
+ * observes the old OA.
+ *
+ * Context: There is no internal locking. The caller must serialize this with
+ * any concurrent map/unmap touching @iova, as with map_range().
+ *
+ * Returns: 0 on success. -EAGAIN indicates the entry changed concurrently,
+ * retry. -ENOENT if @iova has no translation. -EADDRINUSE if the leaf does
+ * not translate to @old_oa. -EOPNOTSUPP if the leaf does not fit in a single
+ * PTE word, such as a contiguous entry.
+ */
+int DOMAIN_NS(replace_leaf)(struct iommu_domain *domain, dma_addr_t iova,
+			    phys_addr_t old_oa, phys_addr_t new_oa)
+{
+	struct pt_iommu *iommu_table =
+		container_of(domain, struct pt_iommu, domain);
+	struct pt_replace_leaf_args args = {
+		.old_oa = old_oa,
+		.new_oa = new_oa,
+	};
+	struct pt_range range;
+	int ret;
+
+	ret = make_range(common_from_iommu(iommu_table), &range, iova, 1);
+	if (ret)
+		return ret;
+
+	return pt_walk_range(&range, __replace_leaf, &args);
+}
+EXPORT_SYMBOL_NS_GPL(DOMAIN_NS(replace_leaf), "GENERIC_PT_IOMMU");
+#endif
+
 struct pt_iommu_collect_args {
 	struct iommupt_pending_gather pending;
 	/* Fail if any OAs are within the range */
diff --git a/drivers/iommu/generic_pt/kunit_iommu.h b/drivers/iommu/generic_pt/kunit_iommu.h
index 22c9e4c4dd97..d52b82c9942c 100644
--- a/drivers/iommu/generic_pt/kunit_iommu.h
+++ b/drivers/iommu/generic_pt/kunit_iommu.h
@@ -16,6 +16,13 @@
 int pt_iommu_init(struct pt_iommu_table *fmt_table,
 		  const struct pt_iommu_table_cfg *cfg, gfp_t gfp);
 
+#ifdef pt_entry_replace_oa
+#define pt_iommu_replace_leaf \
+	CONCATENATE(CONCATENATE(pt_iommu_, PTPFX), replace_leaf)
+int pt_iommu_replace_leaf(struct iommu_domain *domain, dma_addr_t iova,
+			  phys_addr_t old_oa, phys_addr_t new_oa);
+#endif
+
 /* The format can provide a list of configurations it would like to test */
 #ifdef kunit_fmt_cfgs
 static const void *kunit_pt_gen_params_cfg(struct kunit *test, const void *prev,
diff --git a/drivers/iommu/generic_pt/kunit_iommu_pt.h b/drivers/iommu/generic_pt/kunit_iommu_pt.h
index ece1c9b8c55d..8707d55418d3 100644
--- a/drivers/iommu/generic_pt/kunit_iommu_pt.h
+++ b/drivers/iommu/generic_pt/kunit_iommu_pt.h
@@ -427,6 +427,57 @@ static void test_mixed(struct kunit *test)
 	check_iova(test, start, oa, len);
 }
 
+#ifdef pt_entry_replace_oa
+static void test_replace_leaf(struct kunit *test)
+{
+	struct kunit_iommu_priv *priv = test->priv;
+	struct pt_range range = pt_top_range(priv->common);
+	pt_vaddr_t va = range.va + priv->smallest_pgsz * 256;
+	phys_addr_t pa = log2_set_mod(priv->test_oa, 0,
+				      priv->smallest_pgsz_lg2);
+	phys_addr_t new_pa = log2_set_mod(priv->test_oa + priv->smallest_pgsz,
+					  0, priv->smallest_pgsz_lg2);
+	int ret;
+
+	do_map(test, va, pa, priv->smallest_pgsz);
+
+	/* The leaf OA can be swapped in place */
+	ret = pt_iommu_replace_leaf(&priv->domain, va, pa, new_pa);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	check_iova(test, va, new_pa, priv->smallest_pgsz);
+
+	/* A stale old OA is detected */
+	ret = pt_iommu_replace_leaf(&priv->domain, va, pa, pa);
+	KUNIT_ASSERT_EQ(test, ret, -EADDRINUSE);
+
+	/* A not-present IOVA reports -ENOENT */
+	ret = pt_iommu_replace_leaf(&priv->domain, va + priv->smallest_pgsz,
+				    pa, new_pa);
+	KUNIT_ASSERT_EQ(test, ret, -ENOENT);
+
+	do_unmap(test, va, priv->smallest_pgsz);
+
+	if (!(priv->safe_pgsize_bitmap & SZ_2M))
+		return;
+
+	/* A leaf at a higher level can be swapped in place too */
+	va = ALIGN(va, SZ_2M);
+	pa = log2_set_mod(priv->test_oa, 0, ilog2(SZ_2M));
+	new_pa = log2_set_mod(priv->test_oa + SZ_2M, 0, ilog2(SZ_2M));
+	do_map(test, va, pa, SZ_2M);
+
+	ret = pt_iommu_replace_leaf(&priv->domain, va, pa, new_pa);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	check_iova(test, va, new_pa, SZ_2M);
+
+	/* A stale old OA is detected */
+	ret = pt_iommu_replace_leaf(&priv->domain, va, pa, pa);
+	KUNIT_ASSERT_EQ(test, ret, -EADDRINUSE);
+
+	do_unmap(test, va, SZ_2M);
+}
+#endif
+
 static struct kunit_case iommu_test_cases[] = {
 	KUNIT_CASE_FMT(test_increase_level),
 	KUNIT_CASE_FMT(test_map_simple),
@@ -435,6 +486,9 @@ static struct kunit_case iommu_test_cases[] = {
 	KUNIT_CASE_FMT(test_random_map),
 	KUNIT_CASE_FMT(test_pgsize_boundary),
 	KUNIT_CASE_FMT(test_mixed),
+#ifdef pt_entry_replace_oa
+	KUNIT_CASE_FMT(test_replace_leaf),
+#endif
 	{},
 };
 
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index 2eed9b78f56c..e9042b509013 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -254,6 +254,10 @@ struct pt_iommu_cfg {
 	int pt_iommu_##fmt##_read_and_clear_dirty(                             \
 		struct iommu_domain *domain, unsigned long iova, size_t size,  \
 		unsigned long flags, struct iommu_dirty_bitmap *dirty);        \
+	/* Only defined by formats whose fmt header has pt_entry_replace_oa */ \
+	int pt_iommu_##fmt##_replace_leaf(struct iommu_domain *domain,         \
+					  dma_addr_t iova, phys_addr_t old_oa, \
+					  phys_addr_t new_oa);                 \
 	int pt_iommu_##fmt##_init(struct pt_iommu_##fmt *table,                \
 				  const struct pt_iommu_##fmt##_cfg *cfg,      \
 				  gfp_t gfp);                                  \
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
