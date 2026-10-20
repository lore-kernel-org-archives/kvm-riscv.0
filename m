Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AAC60A2639
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iOcaxyOl;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=VTNdg0Xz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svgAClHPcqlVvhJhjyF3EI5ktvi5XTa7V2OIakEwogw=; b=iOcaxyOlDvbqkG
	HViJuEnEXZ9IVf/M2GifJuR1pxmbMYHmsEwCdx84ips4vVCwLaq4P2tvbZRbdjEl5bV7NmPncrmfo
	zjowh8+/2I/XFcN+cRpi+kFRZe8wnVgK7PeWc+BYNpfe9SaJQBoA/AUPOg06f7kql3YVb3mRlN3+W
	9/vKnRgJtncP/RBlf/gSfZEdXNfSlGSa5gVof6qPUF4vmBeXyGjJhMN0GANx48weILHZJBIwe+hws
	lb4xq9zIl4HpnmzVXO9utpK1XyNI76IUFcpAJtcVMJDqofk6T5yeeBLMJf/7Up+WMApMv96BmUSN6
	UIf6/YufAP+RMQt4PCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6LX-00000009L8T-1TZ1;
	Tue, 20 Oct 2026 09:41:27 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6LT-00000009L5q-29ql;
	Tue, 20 Oct 2026 09:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792489281; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Sy7Dz8kDPuI6hXGm4YE8UuMimPAELhzLRPTNDzmDeE8=;
	b=VTNdg0Xz+wh2qGNlOkPonDFhUFYpHr8GS9FB30M9QaROdK6xQBhPPVgQn6kRFmD/SJfVHw0W/KbOdOcEECe6eCKmV2MZqEh8PS7nCcudTenPaKr22YLMaNsPAqx7rd2xzmGNtstnns+ZBfgd8gwPlYwaAq3fCO+nZbrapxkadkw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDCspS7_1792489276;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDCspS7_1792489276 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 17:41:19 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [RFC PATCH v5 02/10] iommupt: Add RISC-V dirty tracking PTE ops
Date: Tue, 20 Oct 2026 17:40:58 +0800
Message-Id: <20261020094106.92722-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
References: <20261020094106.92722-1-fangyu.yu@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024123_847889_FD80F78E 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Implement the three dirty-tracking hooks required by the generic page
table framework for the RISC-V format:

  pt_entry_is_write_dirty():
    Check the D bit (bit 7) in the PTE.

  pt_entry_make_write_clean():
    Clear the D bit across the full contiguous range.

  pt_entry_make_write_dirty():
    Atomically set D via try_cmpxchg64() on a single PTE.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 49 ++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index d4445e463fa9..2f4838eb44af 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -223,6 +223,55 @@ static inline void riscvpt_attr_from_entry(const struct pt_state *pts,
 }
 #define pt_attr_from_entry riscvpt_attr_from_entry
 
+/*
+ * Dirty tracking: RISC-V PTEs use D (bit 7) as the hardware dirty bit.
+ * When Svnapot 64K is active a leaf entry spans 16 consecutive PTEs; we
+ * must check / clear all of them so that no dirty indication is lost.
+ */
+static inline bool riscvpt_entry_is_write_dirty(const struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	const pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	const pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		if (READ_ONCE(*tablep) & RISCVPT_D)
+			return true;
+	return false;
+}
+#define pt_entry_is_write_dirty riscvpt_entry_is_write_dirty
+
+static inline void riscvpt_entry_make_write_clean(struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		WRITE_ONCE(*tablep, READ_ONCE(*tablep) & ~(pt_riscv_entry_t)RISCVPT_D);
+}
+#define pt_entry_make_write_clean riscvpt_entry_make_write_clean
+
+static inline bool riscvpt_entry_make_write_dirty(struct pt_state *pts)
+{
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) + pts->index;
+	pt_riscv_entry_t new = pts->entry | RISCVPT_D;
+
+	return try_cmpxchg64(tablep, &pts->entry, new);
+}
+#define pt_entry_make_write_dirty riscvpt_entry_make_write_dirty
+
+static inline bool riscvpt_dirty_supported(struct pt_common *common)
+{
+	return pt_feature(common, PT_FEAT_RISCV_S2);
+}
+#define pt_dirty_supported riscvpt_dirty_supported
+
 /* --- iommu */
 #include <linux/generic_pt/iommu.h>
 #include <linux/iommu.h>
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
